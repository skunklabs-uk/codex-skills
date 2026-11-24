---
name: ask-skills
description: "Individua e seleziona proattivamente le skill adatte ad attività complesse, nuovi workflow, decisioni architetturali, diagnosi e lacune di capability; valuta runtime, catalogo approvato e upstream senza installare automaticamente."
disable-model-invocation: false
---

# Ask Skills

Scegli la skill pertinente; non definire un altro metodo di sviluppo.

1. Per attività non banali, nuove capability, workflow, scelte architetturali o problemi ricorrenti, leggi le istruzioni attive del progetto. Per un task banale o una skill già nota e pertinente evita la discovery estesa. Non bloccare l'esecuzione di un lavoro chiaro e autorizzato per una ricognizione superflua.
2. **Runtime:** verifica le skill realmente esposte nell'ambiente corrente (incluse quelle dei plugin nativi) e i loro metadati aggiornati. Disponibile in catalogo non significa installata o invocabile; non presumere che OMP e Codex offrano le stesse capability. Leggi la skill candidata prima di applicarla.
3. **Catalogo approvato:** se manca una risposta adeguata nel runtime, consulta l'inventario `README.md`, `config/global-skill-upstreams.tsv`, `global/` e `projects/`. Considera tutte le famiglie Matt Pocock, Addy Osmani, Superpowers e gli altri upstream. Usa il commit e il percorso approvati dal manifest, non una lista ricordata: una skill presente solo nel manifest è installabile, non già attiva.
4. **Upstream non catalogato:** quando si valuta una nuova soluzione o rimane un gap materiale, ispeziona le descrizioni e i percorsi `SKILL.md` dei repository originali già adottati, anche alle revisioni più recenti se accessibili; confrontali con il manifest. Una skill in upstream ma non approvata è soltanto una **candidata**: segnala provenienza, versione, maturità, policy di invocazione, dipendenze e compatibilità; non eseguirla, non installarla e non aggiornare pin senza autorizzazione. Se manca accesso remoto, dichiaralo. Le skill a invocazione manuale restano individuabili e suggeribili, ma non si invocano implicitamente.
5. Scegli l'ingresso più specifico, distinguendo `attiva nel runtime`, `approvata nel manifest ma installazione non verificata`, `solo upstream` e `non verificata`. `reality-check` confronta documentazione e stato effettivo quando la baseline è incerta; non equivale a ricerca sulle API ufficiali.
4. Lascia alla skill il processo e le dipendenze. Non concatenare automaticamente framework, interviste, piani, review o tracker. `brainstorming` sceglie la scala del design; `grill-with-docs` resta a invocazione esplicita. Una specifica già approvata non va riscritta per rito.

Per eseguire un piano, scegli tra i percorsi disponibili in base al lavoro e al runtime: `incremental-implementation` di Osmani per piccoli percorsi completi; `implement` o `implement-spec` di Matt per il rispettivo contratto; `executing-plans` o `subagent-driven-development` di Superpowers quando pertinenti. La delega richiede subagenti realmente disponibili e lavoro adatto; non fingere parallelismo o review indipendenti. Non sovrapporre cicli TDD/review Matt, Osmani e Superpowers sullo stesso task.

Disambigua gli omonimi con repository e percorso, non solo con il nome interno. `osmani-test-driven-development` è la chiave del manifest per `addyosmani/agent-skills`, `skills/test-driven-development`; `test-driven-development` identifica nel manifest la variante Superpowers. Entrambi gli originali hanno lo stesso nome interno: indica la variante scelta e leggi il file esatto. `ask-matt` e `using-agent-skills` sono router di famiglia, da usare soltanto quando quel percorso è pertinente; non sostituiscono la selezione tra tutti i cataloghi.

Quando è utile proporre una skill, indica nome o chiave, provenienza, motivo, disponibilità e prerequisiti mancanti. Non presentare una proposta upstream come capacità già installata. Se nessuna skill aggiunge valore, procedi senza inventarne una. Non trasformare la ricerca in un'intervista o in un gate. Per altre aree seleziona dalle descrizioni del catalogo, senza riprodurre qui l'inventario.

Per installare usa `bash scripts/install-local.sh <nome>` oppure `bash scripts/install-project.sh --no-global-agents <progetto> <root> <nome>`. La selezione parziale non risolve dipendenze transitive: includi quelle richieste, oppure usa l'installazione globale completa. Non installare senza richiesta; riavvia Codex dopo l'installazione.

## Provenienza

Derivato ridotto di `mattpocock/skills`, `skills/engineering/ask-matt/SKILL.md`, commit `9603c1cc8118d08bc1b3bf34cf714f62178dea3b`. Resta locale per selezionare tra più cataloghi e contesti di progetto, non per riscrivere i framework. Motivazione nell'audit del 2026-09-08.
