---
name: ask-skills
description: "Usa quando l’utente chiede quale skill disponibile sia adatta al task o come scegliere tra i cataloghi del repository."
disable-model-invocation: true
---

# Ask Skills

Scegli la skill pertinente; non definire un altro metodo di sviluppo.

1. Leggi le istruzioni attive del progetto e ricostruisci il catalogo corrente: inventario del `README.md`, manifest `config/global-skill-upstreams.tsv`, skill locali in `global/` e specializzazioni in `projects/`. Considera tutte le famiglie, comprese le suite complete Matt Pocock e Addy Osmani, Superpowers, gli altri upstream e il plugin nativo Data Analytics. Usa le fonti correnti, non una lista ricordata da una sessione precedente; il manifest identifica repository, percorsi e commit approvati.
2. Confronta il catalogo con le skill effettivamente esposte dal runtime, comprese quelle dei plugin nativi. Per i candidati pertinenti leggi le descrizioni aggiornate. Catalogata non significa installata: dichiara la disponibilità non verificata quando non puoi controllarla. Non escludere una skill nuova perché assente dagli esempi di questo selettore.
3. Scegli l'ingresso più specifico e leggilo, rispettando specializzazioni di progetto e policy di invocazione. `reality-check` confronta documentazione e stato effettivo quando la baseline è incerta; non equivale a ricerca sulle API ufficiali.
4. Lascia alla skill il processo e le dipendenze. Non concatenare automaticamente framework, interviste, piani, review o tracker. `brainstorming` sceglie la scala del design; `grill-with-docs` resta a invocazione esplicita. Una specifica già approvata non va riscritta per rito.

Per eseguire un piano, scegli tra i percorsi disponibili in base al lavoro e al runtime: `incremental-implementation` di Osmani per piccoli percorsi completi; `implement` o `implement-spec` di Matt per il rispettivo contratto; `executing-plans` o `subagent-driven-development` di Superpowers quando pertinenti. La delega richiede subagenti realmente disponibili e lavoro adatto; non fingere parallelismo o review indipendenti. Non sovrapporre cicli TDD/review Matt, Osmani e Superpowers sullo stesso task.

Disambigua gli omonimi con repository e percorso, non solo con il nome interno. `osmani-test-driven-development` è la chiave del manifest per `addyosmani/agent-skills`, `skills/test-driven-development`; `test-driven-development` identifica nel manifest la variante Superpowers. Entrambi gli originali hanno lo stesso nome interno: indica la variante scelta e leggi il file esatto. `ask-matt` e `using-agent-skills` sono router di famiglia, da usare soltanto quando quel percorso è pertinente; non sostituiscono la selezione tra tutti i cataloghi.

Rispondi con nome o chiave del manifest, provenienza, motivo, disponibilità ed eventuali prerequisiti mancanti. Se nessuna skill aggiunge valore, non inventarne una. Per altre aree seleziona dalle descrizioni del catalogo, senza riprodurre qui l'inventario.

Per installare usa `bash scripts/install-local.sh <nome>` oppure `bash scripts/install-project.sh --no-global-agents <progetto> <root> <nome>`. La selezione parziale non risolve dipendenze transitive: includi quelle richieste, oppure usa l'installazione globale completa. Non installare senza richiesta; riavvia Codex dopo l'installazione.

## Provenienza

Derivato ridotto di `mattpocock/skills`, `skills/engineering/ask-matt/SKILL.md`, commit `9603c1cc8118d08bc1b3bf34cf714f62178dea3b`. Resta locale per selezionare tra più cataloghi e contesti di progetto, non per riscrivere i framework. Motivazione nell'audit del 2026-09-08.
