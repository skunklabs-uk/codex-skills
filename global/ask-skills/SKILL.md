---
name: ask-skills
description: Use when the user asks which available skill fits the current task or how to choose between the repository's skill catalogs.
disable-model-invocation: true
---

# Ask Skills

Scegli la skill pertinente; non definire un altro metodo di sviluppo.

## Selezione

1. Leggi l'inventario del `README.md` e le istruzioni attive del progetto. Il manifest `config/global-skill-upstreams.tsv` distingue gli upstream diretti dalle copie locali.
2. Verifica quali skill sono disponibili nel runtime. Catalogata non significa installata; quando non puoi verificarlo, dichiaralo.
3. Scegli l'ingresso più specifico per la richiesta e leggine le istruzioni. Rispetta eventuali specializzazioni di progetto realmente applicabili e la policy di invocazione della skill.
4. Lascia alla skill scelta il proprio processo e le proprie dipendenze. Non concatenare automaticamente framework, interviste, piani, review o tracker. Non imporre un documento di piano a ogni modifica.

Per design e modifiche al comportamento, `brainstorming` upstream sceglie il percorso proporzionato. Per un'intervista documentale richiesta esplicitamente usa `grill-with-docs`; senza tale richiesta non aggirare `allow_implicit_invocation: false`.

Per altri bisogni usa le descrizioni del catalogo: debugging, refactoring, dati, scrittura, browser e operazioni di progetto non richiedono tutti lo stesso percorso. Consulta fonti disponibili prima di chiedere dati già recuperabili, come previsto dalle istruzioni attive.

## Disponibilità e output

Rispondi con nome, motivo della scelta, stato nel runtime ed eventuali dipendenze mancanti. Se nessuna skill aggiunge valore, dillo e non inventarne una.

Per una skill globale non installata, indica `bash scripts/install-local.sh <nome>`; per una skill di progetto, `bash scripts/install-project.sh --no-global-agents <progetto> <root> <nome>`. Gli installer non risolvono dipendenze transitive: includi nel comando quelle effettivamente richieste dal flusso. Non avviare installazioni senza richiesta. Riavvia Codex dopo l'installazione.

## Provenienza

Derivato ridotto di `mattpocock/skills`, `skills/engineering/ask-matt/SKILL.md`, commit `9603c1cc8118d08bc1b3bf34cf714f62178dea3b`. Resta locale soltanto per selezionare tra il catalogo multi-upstream e le skill di progetto; non duplica il metodo dei framework. Motivazione e stato della riduzione: `docs/reviews/2026-09-08-skill-origin-audit.md`.
