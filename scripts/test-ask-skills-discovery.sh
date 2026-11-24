#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
python3 - <<'PY'
from pathlib import Path
skill = Path("global/ask-skills/SKILL.md").read_text()
adapter = Path("global/ask-skills/agents/openai.yaml").read_text()
global_agents = Path("AGENTS.global.md").read_text()
manifest = Path("config/global-skill-upstreams.tsv").read_text()
readme = Path("README.md").read_text()
assert "disable-model-invocation: false" in skill
assert "allow_implicit_invocation: true" in adapter
assert "ask-skills" in global_agents and "non banali" in global_agents
for term in ("**Runtime:**", "**Catalogo approvato:**", "**Upstream non catalogato:**", "invocazione manuale"):
    assert term in skill, term
rows = [line.split("\t") for line in manifest.splitlines() if line and not line.startswith("#")]
by_name = {row[0]: row for row in rows}
for name in ("chief-of-staff", "software-factory"):
    assert name in by_name, name
    assert by_name[name][1] == "https://github.com/mattpocock/skills.git"
    assert by_name[name][2] == by_name["ask-matt"][2]
    assert by_name[name][3] == f"skills/in-progress/{name}"
    assert f"| `{name}` |" in readme, name
assert "135 voci di catalogo" in readme
print("Skill discovery contract passed (routing, runtime policy, approved beta paths, catalogue)")
PY
