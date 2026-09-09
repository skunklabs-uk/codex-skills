#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Regression for the TSV-to-Renovate contract; no network or package install.
node --input-type=module <<'JS'
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';

const config = JSON.parse(readFileSync('renovate.json', 'utf8'));
const file = 'config/global-skill-upstreams.tsv';
const text = readFileSync(file, 'utf8');
const rows = text.split(/\r?\n/).filter(line => line && !line.startsWith('#'));
const manager = config.customManagers?.find(m => m.datasourceTemplate === 'git-refs');
assert.ok(manager, 'The upstream manifest must be discovered by Renovate');
assert.equal(manager.customType, 'regex');
// With git-refs, omitting currentValue selects remote HEAD. Literal HEAD is a branch name.
assert.equal(manager.currentValueTemplate, undefined);
assert.equal(manager.matchStrings.length, 1);
const filePattern = manager.managerFilePatterns[0];
const fileRegex = new RegExp(filePattern.slice(1, -1));
assert.ok(fileRegex.test(file));
assert.ok(!fileRegex.test('other/' + file));
assert.ok(!fileRegex.test('README.md'));

for (const input of [text, text.trimEnd(), text.replace(/\n/g, '\r\n')]) {
  const matches = [...input.matchAll(new RegExp(manager.matchStrings[0], 'g'))];
  assert.equal(matches.length, rows.length, 'Every TSV row must be extracted, including adjacent rows');
  matches.forEach((match, i) => {
    const [name, repository, digest] = rows[i].split('\t');
    assert.equal(match.groups.packageName, repository, name);
    assert.equal(match.groups.currentDigest, digest, name);
    // All occurrences in one upstream share one dependency identity.
    assert.equal(match.groups.depName, repository.slice('https://github.com/'.length, -4), name);
  });
}
const rules = config.packageRules.filter(r => r.matchDatasources?.includes('git-refs'));
assert.equal(rules.length, 1);
const rule = rules[0];
assert.deepEqual(rule.matchFileNames, [file]);
assert.equal(rule.automerge, false, 'A new agent workflow requires review, never automerge');
assert.equal(rule.groupName, 'upstream skills: {{{depName}}}');
assert.equal(rule.updateNotScheduled, false);
assert.equal(config.timezone, 'Europe/Rome');
assert.deepEqual(rule.schedule, ['* 0-5 * * 1']);
console.log(`Upstream update contract passed: ${rows.length} skill rows, ${new Set(rows.map(r => r.split('\t')[1])).size} repository groups`);
JS
