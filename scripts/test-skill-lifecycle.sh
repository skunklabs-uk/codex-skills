#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 - "$repo_root" <<'PY'
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

SOURCE = Path(sys.argv.pop())

class SkillLifecycle(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.repo = self.root / 'repo'
        self.home = self.root / 'codex'
        self.project = self.root / 'project space'
        for p in (self.repo/'scripts', self.repo/'global', self.repo/'config',
                  self.repo/'projects/demo', self.home/'skills', self.project/'.agents/skills'):
            p.mkdir(parents=True, exist_ok=True)
        for script in ('install-local.sh', 'install-project.sh', 'prune-local.sh', 'sync-from-codex.sh', 'validate-skills.sh'):
            shutil.copyfile(SOURCE/'scripts'/script, self.repo/'scripts'/script)
        (self.repo/'config/global-skill-upstreams.tsv').write_text('')
        (self.repo/'config/global-skill-prune.txt').write_text('retired\n')
        (self.project/'AGENTS.md').write_text('project authority\n')

    def skill(self, path, text='current'):
        path.mkdir(parents=True, exist_ok=True)
        (path/'SKILL.md').write_text('---\nname: sample\ndescription: fixture\n---\n' + text)

    def run_script(self, script, *args):
        result = subprocess.run(['bash', str(self.repo/'scripts'/script), *map(str, args)],
            env={**os.environ, 'CODEX_HOME': str(self.home)}, text=True, capture_output=True)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        return result.stdout

    def discovered(self, root):
        return sum('SKILL.md' in files for _, _, files in os.walk(root, followlinks=True))

    def test_global_replacement_preserves_old_copy_outside_discovery(self):
        self.skill(self.repo/'global/sample')
        self.skill(self.home/'skills/sample', 'old-copy')
        self.run_script('install-local.sh', '--replace', 'sample')
        self.assertEqual((self.home/'skills/sample').resolve(), self.repo/'global/sample')
        self.assertEqual(self.discovered(self.home/'skills'), 1, 'old backup is still discoverable')
        self.assertTrue(any('old-copy' in p.read_text() for p in self.home.glob('skill-backups/**/SKILL.md')))
        self.run_script('install-local.sh', '--replace', 'sample')
        self.assertEqual(self.discovered(self.home/'skills'), 1)

    def test_project_replacement_preserves_authority_and_avoids_duplicate_skill(self):
        self.skill(self.repo/'projects/demo/sample')
        self.skill(self.project/'.agents/skills/sample', 'old-project-copy')
        self.run_script('install-project.sh', '--replace', '--no-global-agents', 'demo', self.project)
        self.assertEqual((self.project/'AGENTS.md').read_text(), 'project authority\n')
        self.assertEqual(self.discovered(self.project/'.agents/skills'), 1, 'project backup is discoverable')
        self.assertTrue(any('old-project-copy' in p.read_text() for p in self.project.glob('.agents/skill-backups/**/SKILL.md')))

    def test_retired_project_links_do_not_shadow_globals_or_touch_foreign_entries(self):
        self.skill(self.repo/'projects/demo/sample')
        links = self.project/'.agents/skills'
        (links/'retired').symlink_to(self.repo/'projects/demo/retired')
        (links/'foreign').symlink_to(self.root/'foreign-missing')
        self.skill(links/'private-skill', 'private')
        self.run_script('install-project.sh', '--replace', '--no-global-agents', 'demo', self.project)
        self.assertFalse((links/'retired').is_symlink(), 'retired managed link is still installed')
        self.assertTrue((links/'foreign').is_symlink())
        self.assertIn('private', (links/'private-skill/SKILL.md').read_text())
        self.run_script('install-project.sh', '--replace', '--no-global-agents', 'demo', self.project)

    def test_sync_does_not_vendor_declared_upstream_even_with_force(self):
        (self.repo/'config/global-skill-upstreams.tsv').write_text(
            'external\thttps://github.com/example/skills.git\t' + 'a'*40 + '\tskills/external\n')
        self.skill(self.home/'skills/external')
        self.skill(self.home/'skills/custom')
        self.run_script('sync-from-codex.sh', '--force')
        self.assertFalse((self.repo/'global/external').exists(), 'upstream was vendored')
        self.assertTrue((self.repo/'global/custom/SKILL.md').is_file())

    def test_sync_does_not_resurrect_retired_skill(self):
        self.skill(self.home/'skills/retired')
        self.run_script('sync-from-codex.sh', '--force')
        self.assertFalse((self.repo/'global/retired').exists(), 'retired skill was reimported')

    def test_prune_is_reversible_and_does_not_follow_symlinks(self):
        self.skill(self.home/'skills/retired', 'preserve-me')
        self.run_script('prune-local.sh', '--dry-run')
        self.assertTrue((self.home/'skills/retired/SKILL.md').exists())
        self.run_script('prune-local.sh')
        self.assertFalse((self.home/'skills/retired').exists())
        self.assertTrue(any('preserve-me' in p.read_text() for p in self.home.glob('skill-backups/**/SKILL.md')),
                        'retired real directory was destroyed')
        self.skill(self.root/'external-source', 'external')
        (self.home/'skills/retired').symlink_to(self.root/'external-source')
        self.run_script('prune-local.sh')
        self.assertTrue((self.root/'external-source/SKILL.md').exists())
        self.run_script('prune-local.sh')

    def test_validator_rejects_project_shadow_of_direct_upstream(self):
        (self.repo/'config/global-skill-upstreams.tsv').write_text(
            'sample\thttps://github.com/example/skills.git\t' + 'a'*40 + '\tskills/sample\n')
        self.skill(self.repo/'projects/demo/sample')
        result = subprocess.run(['bash', str(self.repo/'scripts/validate-skills.sh')],
            text=True, capture_output=True)
        self.assertNotEqual(result.returncode, 0, 'project copy can shadow the original')

    def test_pinned_cached_upstream_is_linked_without_vendoring(self):
        cache = self.home/'upstream-skills/external'
        self.skill(cache/'skills/external')
        def git(*args):
            return subprocess.check_output(['git', '-C', str(cache), *args], text=True).strip()
        git('init', '-q')
        git('config', 'user.name', 'Lifecycle fixture')
        git('config', 'user.email', 'fixture@example.invalid')
        git('add', '.')
        git('commit', '-qm', 'fixture')
        ref = git('rev-parse', 'HEAD')
        git('remote', 'add', 'origin', 'https://github.com/example/skills.git')
        (self.repo/'config/global-skill-upstreams.tsv').write_text(
            f'external\thttps://github.com/example/skills.git\t{ref}\tskills/external\n')
        self.run_script('install-local.sh', 'external')
        self.assertEqual((self.home/'skills/external').resolve(), cache/'skills/external')
        self.assertFalse((self.repo/'global/external').exists())
        self.assertEqual(git('rev-parse', 'HEAD'), ref)

unittest.main(verbosity=2)
PY
