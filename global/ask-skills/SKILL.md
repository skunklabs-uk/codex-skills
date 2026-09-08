---
name: ask-skills
description: "Usa quando l’utente chiede quale skill disponibile sia adatta al task o come scegliere tra i cataloghi del repository."
disable-model-invocation: true
---

# Ask Skills

Scegli la skill pertinente; non definire un altro metodo di sviluppo.

1. Leggi l'inventario del `README.md` e le istruzioni attive del progetto. Il manifest `config/global-skill-upstreams.tsv` identifica gli originali e i commit approvati.
2. Verifica la disponibilità nel runtime: catalogata non significa installata. Dichiarala non verificata quando non puoi controllarla.
3. Scegli l'ingresso più specifico e leggilo, rispettando specializzazioni di progetto e policy di invocazione. `reality-check` confronta documentazione e stato effettivo quando la baseline è incerta; non equivale a ricerca sulle API ufficiali.
4. Lascia alla skill il processo e le dipendenze. Non concatenare automaticamente framework, interviste, piani, review o tracker. `brainstorming` sceglie la scala del design; `grill-with-docs` resta a invocazione esplicita. Una specifica già approvata non va riscritta per rito.

Per eseguire un piano, considera `subagent-driven-development` soltanto quando il runtime offre subagenti e il lavoro si presta alla delega; altrimenti `executing-plans`. Non fingere deleghe, parallelismo o review indipendenti. Non sovrapporre il ciclo TDD/review Matt a quello Superpowers sullo stesso task; ciascuno mantiene i propri riferimenti.

Rispondi con nome, motivo, disponibilità ed eventuali prerequisiti mancanti. Se nessuna skill aggiunge valore, non inventarne una. Per altre aree seleziona dalle descrizioni del catalogo, senza riprodurre qui l'inventario.

Per installare usa `bash scripts/install-local.sh <nome>` oppure `bash scripts/install-project.sh --no-global-agents <progetto> <root> <nome>`. La selezione parziale non risolve dipendenze transitive: includi quelle richieste, oppure usa l'installazione globale completa. Non installare senza richiesta; riavvia Codex dopo l'installazione.

## Provenienza

Derivato ridotto di `mattpocock/skills`, `skills/engineering/ask-matt/SKILL.md`, commit `9603c1cc8118d08bc1b3bf34cf714f62178dea3b`. Resta locale per selezionare tra più cataloghi e contesti di progetto, non per riscrivere i framework. Motivazione nell'audit del 2026-09-08.
