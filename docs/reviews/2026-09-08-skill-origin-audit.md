# Audit delle skill: provenienza e sostituzioni

**Stato:** Draft — valutazioni proposte, non nuove istruzioni operative.
**Data:** 2026-09-08.
**Snapshot analizzato:** `1eaeea4b4e23dfc6dac223c3a2dc30bee443bba2` su `main`.
**PR collegata:** #49, ancora Draft; la migrazione non è completata né mergiata.

## Risultato e copertura

Il repository non manca di framework pubblici: mescola upstream diretti, copie, derivati e metodo locale duplicato. La raccomandazione è ridurre questa duplicazione, non aggiungere un altro framework.

| Perimetro del catalogo | Upstream diretti | Origine esterna, contenuto nel repo | Etichetta locale | Totale |
|---|---:|---:|---:|---:|
| Globali | 19 | 32 | 8 | 59 |
| Progetti | 0 | 27 | 39 | 66 |
| Totale | 19 | 59 | 47 | 125 |

Sono 125 voci di catalogo e 105 nomi distinti. Le copie nei diversi progetti sono contate separatamente. «Locale» è l'etichetta del README, non la prova di paternità originale. «Origine esterna» non certifica l'identità con l'upstream.

L'audit copre l'intero catalogo README/manifest, il corpo delle 47 voci etichettate locali e confronti mirati degli upstream nei casi decisivi. Non è un confronto byte-per-byte di tutti i bundle o un benchmark del modello. Le 59 voci esterne conservate nel repo hanno un audit di provenienza/distribuzione, non una certificazione completa di compatibilità. Non sono stati eseguiti Codex, deploy, restore, test PowerPoint o workflow CI. Il conteggio è del catalogo, non un'enumerazione indipendente dei file non catalogati.

Sulle 47 voci locali: **8 KEEP, 20 REDUCE, 11 REPLACE, 8 DELETE**.

- **KEEP:** contratto specifico da preservare; nessun sostituto completo verificato. Non significa che ogni riga attuale sia necessaria.
- **REDUCE:** conservare soltanto dati, convenzioni o integrazione locale nella fonte di progetto già esistente. Non autorizza automaticamente un'altra wrapper-skill.
- **REPLACE:** usare l'upstream o la capability indicata, verificando dipendenze e vincoli prima della sostituzione.
- **DELETE:** togliere la skill autonoma, non gli invarianti ancora validi che protegge.

## Riscontri prioritari

### Processo sproporzionato

La copia locale di `brainstorming` prescrive specifica e passaggio a `writing-plans` anche per modifiche semplici. L'upstream corrente distingue Spike, Bounded e Architectural: Bounded non richiede spec o piano su file, pur mantenendo l'approvazione dell'intento. Blob upstream osservato: `b56a3b5ed6ea0d6216501e0e401ecb00a1b4675f`.

`ask-skills` reimpone il passaggio obbligatorio `brainstorming → writing-plans`. Aggiornare soltanto la skill foglia non basta: il router deve scegliere una capability, non ricomporre un metodo più pesante sopra l'upstream.

### Provenienza da correggere

`global/code-simplification/SKILL.md` e l'originale Addy hanno lo stesso blob: `239b2848489511de30d9e63b0bd183adc4b01347`. La frase «Inspired by Anthropic» è già nell'originale Addy: non dimostra un adattamento locale. L'uguaglianza è provata per quel file, non automaticamente per ogni asset.

`diagnose` CAP ha un omologo nella famiglia Matt Pocock, oggi `diagnosing-bugs`; il changelog upstream documenta esplicitamente la rinomina. `tdd` CAP è generico e sovrapposto alla versione globale/Matt. `frontend-design-review` iWant attribuisce contenuti ad Anthropic e Quirinevwm, pur essendo catalogata locale.

### Sostituzione del flusso, non solo del nome

Il `tdd` corrente di Matt, al commit `3cca18b368ae95cdbdebbff572ccafa662551015`, richiede seam concordati e assegna il refactoring alla review, non al ciclo red/green. Richiama `codebase-design` e `code-review`. È una differenza metodologica che va valutata prima di aggiornare il singolo file.

La PR #49 migra il wrapper `grill-with-docs`, ma questo carica `grilling` e `domain-modeling`, ancora adattamenti locali nel main analizzato. Il metadata upstream imposta `allow_implicit_invocation: false`, da riconciliare con il router. `install-local.sh` non risolve dipendenze automaticamente e non modifica le installazioni di progetto. `install-project.sh` non elimina i vecchi collegamenti alle directory rimosse. Il solo `install-local.sh --replace` non prova quindi una migrazione completa.

### Duplicazioni contraddittorie in PowerPoint

Produzione e `pptx-quality-review` prescrivono output nella root; manipulation e commercial review richiedono la cartella della presentazione. La review commerciale aggiunge sei sottocartelle come condizione di completamento. La fonte corrente di `powerpoint-ai` deve risolvere queste differenze; non è stata verificata qui la validità dei riferimenti `.codex/...` nel repository destinatario.

La skill pubblica `anthropics/skills/skills/pptx` non è stata qualificata come liberamente importabile in Codex: la sua licenza contiene restrizioni su estrazione, copia e derivati. Blob della licenza osservato: `c55ab42224874608473643de0a85736b7fec0730`. Nemmeno la disponibilità di una capability nativa di presentazioni nel runtime destinatario è stata certificata. Non proporre un drop-in inesistente per eliminare a tutti i costi una skill locale.

## Matrice completa delle 47 voci etichettate locali

I percorsi si riferiscono allo snapshot indicato, non allo stato futuro dopo le rimozioni proposte. Ogni riga identifica sia la destinazione sia il vincolo da preservare.

### Globali — 8

| Skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `agent-loop` | REPLACE | Superpowers `subagent-driven-development` per implementazioni che beneficiano di subagenti; policy esistente per autonomia e stop. Non è un equivalente integrale per missioni operative. Non imporre subagenti ai task semplici. |
| `code-debt-review-loop` | REPLACE | Matt `improve-codebase-architecture`; Addy `deprecation-and-migration` per migrazioni. CodeGraphContext/Context7 restano strumenti quando utili, non prerequisiti universali o nuova catena obbligatoria. |
| `gemini-presentation-handoff` | KEEP | Contratto specifico: trasferire storyline, decisioni e asset originali lasciando libertà visuale a Gemini. Un handoff tecnico generico non lo sostituisce integralmente. |
| `grill-with-docs` | REPLACE | Matt upstream con `grilling` e `domain-modeling`. Completare dipendenze, invocazione e migrazione dei collegamenti della PR #49. |
| `reality-check` | DELETE | Fatti/deduzioni/informazioni mancanti e domande necessarie sono già in RFC-0001 e nelle fonti operative. Eliminare la skill autonoma, non la disciplina source-first. |
| `scrittura-comica` | DELETE | Tecniche e preferenze generiche: basta un prompt di tono facoltativo. Nessun contratto specifico che giustifichi una skill mantenuta; non sostituire con un repo casuale solo perché pubblico. |
| `senior-implementation-discipline` | DELETE | Duplica design, test, review e verifica upstream. Preservare eventuali invarianti unici nelle fonti di progetto; non ricomporre la stessa checklist in una nuova skill. |
| `ui-depth-preview` | KEEP | Scope stretto: preview del layering senza costruire l'app. Il report storico documenta il failure mode e un replay manuale; non è un benchmark cross-model. |

### CAP Aeris — 6

| Skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `diagnose` | REPLACE | Matt `diagnosing-bugs` è l'omologo corrente; Superpowers debug resta il percorso ordinario già adottato. Non concatenare due metodi di diagnosi sullo stesso bug. |
| `tdd` | REPLACE | Una versione canonica Matt con dipendenze compatibili. Nessun contenuto CAP unico nel corpo; valutare le differenze metodologiche prima dell'aggiornamento. |
| `write-tests` | REDUCE | TDD upstream più invarianti CAP: transizioni pratiche, documenti richiesti, permessi, revisioni/effective date e immutabilità. Questi restano; il secondo metodo di testing no. |
| `update-docs` | REDUCE | Documentazione upstream più protezione delle fonti `docs/cap/`, distinzione syntheses/questions e convenzioni linguistiche. Non eliminare il divieto di modificare fonti primarie senza richiesta. |
| `grill-with-screenshots` | REDUCE | Tenere assessment-only e focus P07/socio/velivolo; togliere report fisso sovradimensionato e follow-up non necessari. Audit web tecnici pubblici non equivalgono a ogni valutazione UX da screenshot. |
| `grill-with-docs` | REPLACE | Versione globale upstream. Le variazioni del template CAP non giustificano un altro processo; conservare le convenzioni nella fonte CAP. |

### Baialupo e Cantieri Protetti AI — 2

| Percorso/skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `projects/baialupo/baia-publish` | KEEP | Contratto del sito: frontmatter, eventi, asset, fonti aeronautiche e cautele operative. Scrittura/SEO pubbliche solo come supporto. Verificare sempre le fonti correnti del sito; deployment non auditato qui. |
| `projects/cantieri-protetti-ai/grill-with-docs` | REPLACE | Versione globale upstream; verificare e rimuovere gli eventuali collegamenti obsoleti nel checkout del progetto. |

### Homelab — 14

| Skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `grill-with-docs` | REPLACE | Upstream globale; runbook e decisioni infrastrutturali restano nel progetto. |
| `homelab-app-onboarding` | REDUCE | Conservare ricetta locale, path GitOps, Application, reflection, Homepage ed esposizione; non duplicare best practice generiche e default Gateway. |
| `homelab-backup-restore` | KEEP | Contratto CNPG/Barman/RGW/offsite, prefix separati e risorse temporanee. Nessun drop-in completo verificato; nessun restore eseguito da questo audit. |
| `homelab-ceph-storage-operations` | REDUCE | Conservare path, ownership e protezioni OSD/PVC/prefix nei runbook. Comandi generici e tutorial non devono diventare una seconda fonte normativa. |
| `homelab-cloudflare-operations` | REDUCE | Tenere separazione OpenTofu/tunnel GitOps/Access/DNS interno. Rimuovere le stesse regole replicate in Gateway e osservabilità. |
| `homelab-gateway-routes` | REDUCE | Tenere Gateway condiviso, default espliciti contro drift e contratto di esposizione. Una sola fonte per Cloudflare/Loki. |
| `homelab-gitops-operations` | KEEP | Flusso specifico Git → validazione SOPS → revisione Argo → evidenza live. Una review del codice non lo sostituisce; farne un solo ingresso operativo. |
| `homelab-implementation-planning` | REPLACE | Superpowers planning quando necessario; nel runbook restano risorse live, revisione Argo, prove e rollback. Non due piani sovrapposti. |
| `homelab-kubernetes-operations` | DELETE | Duplica GitOps e diagnosi kubectl. Conservare una volta sola protezioni PVC, writer endpoint e upgrade CRD nella fonte pertinente. |
| `homelab-observability-operations` | REDUCE | Tenere path, label Alloy, reload e DNS interno. Non ripetere lo stesso contesto in tre skill; runtime non verificato. |
| `homelab-opentofu-terraform` | REDUCE | Candidato pubblico `antonbabenko/terraform-skill` per parte Terraform/OpenTofu. Restano ownership Harbor/Cloudflare/GitOps e divieto di ripristinare il vecchio reconciler. Non importare altra CI per inerzia. |
| `homelab-proxmox-operations` | REDUCE | Tenere runbook, quorum, restore, console e dipendenze K3s. Non è sostituibile integralmente con una skill Kubernetes generica. |
| `homelab-review-and-debt` | REDUCE | Checklist di rischio locale: backup, drift di ownership, segreti, osservabilità. Non richiede un altro motore di audit, ma non equivale alla sola review di architettura del codice. |
| `homelab-secret-management` | KEEP | Bootstrap fuori GitOps, secret DB sorgente, reflection e rotazione con rollout sono invarianti locali. Non stampare credenziali; nessun segreto è stato letto o modificato. |

### Obsidian, Kong e iWant — 3

| Percorso/skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `projects/obsidian/organize-obsidian-wiki` | REDUCE | `kepano/obsidian-skills` per formati e CLI; restano vault originale protetto, workspace separato e permessi di scrittura. |
| `projects/kong/read-vdo-hour-meter` | KEEP | LCD vs quadrante, decimi d'ora, valori incerti e formato `readings.yml` consumato da Kong. Visione generica non copre tutto il contratto. Autorizzazioni downstream restano distinte. |
| `projects/iwant/frontend-design-review` | REPLACE | Frontend-design upstream per creare; review pubblica mirata per valutare. Il file attribuisce fonti esterne e non contiene uno specifico contratto iWant. Non confondere audit web tecnico e UX completa. |

### PowerPoint — 14

| Skill | Esito | Alternativa, ragione e vincolo |
|---|---|---|
| `grill-with-docs` | REPLACE | Upstream globale, solo quando serve un'intervista documentale. Non produrre ADR per la semplice riscrittura di slide. |
| `business-case-storyline` | REDUCE | Template commerciale locale: cinque sezioni e ponte POC. Non imporlo a deck diversi o contro una storyline approvata dall'utente. |
| `commercial-deck-quality-review` | REDUCE | Unica review commerciale contro brief e fonti. Riconciliare cartelle e critic obbligatorio con necessità documentata, non mantenerli per inerzia. |
| `deck-visual-grounding` | REDUCE | Conservare brand, template e priorità visuali scelte dall'utente; eliminare estrazione e palette duplicate. |
| `executive-slide-writing` | DELETE | Preferenze del pubblico nel brief più scrittura/revisione esistenti. Titoli, sintesi e ponte POC sono già coperti. |
| `powerpoint-deck-production` | DELETE | Consolidare nell'esistente `powerpoint-manipulation`. Prima conservare i soli vincoli unici di brand e riparazione comprovata e verificare la fonte corrente di powerpoint-ai. |
| `powerpoint-manipulation` | REDUCE | Unico ingresso tecnico PPTX, senza ricopiare grounding e validazione. Nessun sostituto pubblico portabile per l'intera pipeline è stato certificato. |
| `pptx-package-validation` | KEEP | Integrità tecnica distinta dalla qualità commerciale; documentati casi di repair non rilevati dall'export. Riusare i controlli una sola volta, non creare un nuovo validator custom. |
| `pptx-quality-review` | DELETE | Consolidare nella commercial review ridotta; verificare i criteri non duplicati e risolvere la contraddizione root/cartella tramite la fonte di progetto. |
| `pptx-template-extraction` | DELETE | Grounding e manipolazione già richiedono ispezione template. Eliminare la skill duplicata, non riuso dei media originali o geometrie necessarie. |
| `proposal-intake` | REDUCE | Intervista pubblica quando necessaria più schema commerciale locale: confidenzialità, impegni ed economics. Chiedere solo dati che bloccano il deliverable corrente. |
| `repo-to-deck-brief` | REDUCE | Evidenze da zoom-out/research più interfaccia dal repo al brief commerciale. Preservare cosa fa/produce la POC e distinguere evoluzione possibile da promesse. Non quindici sezioni obbligatorie. |
| `software-delivery-estimation` | REDUCE | Template di stima da validare: effort non è prezzo, roadmap non è macro piano. Non è un forecasting calibrato né un equivalente di task planning. |
| `wbs-generation` | REDUCE | Template commerciale di deliverable, distinto da backlog e Gantt. Verificare `docs/reference.1.md` nel progetto; non imporre quattro livelli senza necessità o sostituire con to-tickets. |

## Esiti delle altre 78 voci del catalogo

### 19 upstream già diretti: KEEP della modalità di consumo

Le 16 skill OpenAI Data Analytics sono `analyze-data-quality`, `build-dashboard`, `build-report`, `create-data-context`, `design-kpis`, `gather-business-context`, `jupyter-notebooks`, `kpi-reporting`, `market-sizing`, `metric-diagnostics`, `product-business-analysis`, `report-to-google-doc`, `report-to-google-slides`, `report-to-pdf`, `validate-data`, `visualize-data`. Le altre tre sono `caveman`, `frontend-design`, `unslop`.

Non occorre sostituirle con una variante locale. Questo esito riguarda la distribuzione: non certifica ogni comportamento o futura versione upstream.

### 32 globali di origine esterna conservate nel repo

| Famiglia e skill | Esito |
|---|---|
| Superpowers: `brainstorming`, `receiving-code-review`, `requesting-code-review`, `systematic-debugging`, `using-git-worktrees`, `verification-before-completion`, `writing-plans`, `writing-skills` | Preferire upstream originale compatibile; brainstorming è prioritario per la differenza di processo verificata. Controllare riferimenti e host prima della migrazione del bundle. |
| Matt: `ask-skills`, `codebase-design`, `domain-modeling`, `grilling`, `handoff`, `improve-codebase-architecture`, `prototype`, `research`, `resolving-merge-conflicts`, `setup-matt-pocock-skills`, `tdd`, `teach`, `to-spec`, `to-tickets`, `triage`, `wayfinder`, `zoom-out` | Migrare flussi coerenti, non singoli nomi. Eccezione: ridurre ask-skills a router multi-catalogo, non sostituirlo ciecamente con ask-matt. Non imporre setup/tracker a skill senza dipendenza reale. |
| Addy: `code-review-and-quality`, `code-simplification`, `idea-refine`, `interview-me` | Preferire originali. Simplification ha identità del file provata. Review locale ha gate aggiunti: salvare il controllo della spec, non la duplicazione del metodo. |
| `humanize-writing`, `office-hours`, `playwright` | Candidati al consumo originale; verificare delta, licenza, dipendenze e runtime. Non dichiarati byte-identici da questo audit. |

### 27 copie/derivati esterni nei progetti

| Progetto e skill | Esito |
|---|---|
| CAP: `api-and-interface-design`, `browser-testing-with-devtools`, `deprecation-and-migration`, `documentation-and-adrs`, `performance-optimization`, `planning-and-task-breakdown`, `security-and-hardening`, `source-driven-development` | Preferire gli originali Addy, conservando eventuali invarianti CAP nelle fonti di progetto. Delta integrale dei bundle da verificare prima della sostituzione. |
| CAP: `improve-codebase-architecture`, `prototype`, `triage`, `zoom-out` | Candidati a deduplicazione con il flusso Matt canonico; preservare soltanto eventuale specializzazione CAP comprovata. |
| CAP: `systematic-debugging`, `verification-before-completion`, `writing-plans` | Candidati a deduplicazione con Superpowers canonico; prima verificare i vincoli locali. |
| Cantieri: `documentation-and-adrs`, `security-and-hardening`, `source-driven-development`, `systematic-debugging`, `verification-before-completion` | Preferire i rispettivi upstream Addy/Superpowers; non perdere requisiti del progetto nei riferimenti. |
| Homelab: `homelab-network-readiness`, `network-config-validation`, `security-review` | Provenienza Everything Claude Code dichiarata dal catalogo, non identità provata. Omologo e delta puntuali da verificare; proteggere management-plane e rete. |
| Homelab: `systematic-debugging`, `verification-before-completion` | Candidati a deduplicazione con Superpowers; le verifiche live specifiche restano nei runbook. |
| Obsidian: `verification-before-completion` | Candidato a deduplicazione; confini read-only e permessi restano locali. |
| Baialupo: `seo-audit` | KEEP scoped upstream: importazione di progetto documentata a `5b2c0007766c6a1cf1d53fd8fc73e979e0821022`, con licenza MIT. Non globalizzare né importare l'intera suite marketing. |

## Priorità e stato di esecuzione

1. Sistemare insieme brainstorming e ask-skills, dove è verificata la causa di sovraprocesso.
2. Completare la migrazione funzionale grill-with-docs nella PR esistente: dipendenze, invocazione e collegamenti.
3. Eliminare checklist metodologiche ridondanti e ripristinare originali compatibili senza un nuovo framework.
4. Ridurre contesti di progetto e duplicati PowerPoint preservando invarianti e fonti.

Queste sono raccomandazioni, non rimozioni già eseguite. Questa pubblicazione aggiunge solo il rapporto alla PR #49; non modifica altre skill né avvia CI, installazioni o operazioni sui progetti.

## Fonti e verifiche

I file locali sono stati letti allo snapshot dichiarato: [albero del repository](https://github.com/skunklabs-uk/codex-skills/tree/1eaeea4b4e23dfc6dac223c3a2dc30bee443bba2). Le fonti primarie sono README, manifest, AGENTS, SKILL.md pertinenti, installer e report storici sotto `docs/reviews/`.

- [RFC-0001](https://github.com/skunklabs-uk/agent-os/blob/main/rfcs/RFC-0001-principles.md), versione 0.1.9, blob osservato `a428d2bd28ce830217a0dcafd170fc769c68242c`.
- [Superpowers brainstorming](https://github.com/obra/superpowers/blob/main/skills/brainstorming/SKILL.md), blob osservato riportato sopra.
- [Matt grill-with-docs](https://github.com/mattpocock/skills/blob/3cca18b368ae95cdbdebbff572ccafa662551015/skills/engineering/grill-with-docs/SKILL.md), [diagnosing-bugs](https://github.com/mattpocock/skills/blob/3cca18b368ae95cdbdebbff572ccafa662551015/skills/engineering/diagnosing-bugs/SKILL.md), [tdd](https://github.com/mattpocock/skills/blob/3cca18b368ae95cdbdebbff572ccafa662551015/skills/engineering/tdd/SKILL.md).
- [Addy code-simplification](https://github.com/addyosmani/agent-skills/blob/main/skills/code-simplification/SKILL.md): confronto del blob, non deduzione dal testo introduttivo.
- [Licenza Anthropic pptx](https://github.com/anthropics/skills/blob/main/skills/pptx/LICENSE.txt): restrizioni da non confondere con semplice accessibilità pubblica.
- [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills) e [antonbabenko/terraform-skill](https://github.com/antonbabenko/terraform-skill): candidati pubblici per componenti generiche, non sostituti integrali dei confini locali.
- [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills): audit web tecnico, non equivalente a ogni review visuale semantica.

Controlli eseguiti sul deliverable esteso: 125 righe, 105 nomi distinti, 47 decisioni locali senza righe mancanti, somma esiti 47, percorsi unici e presenza di alternativa/fonte/condizione per ciascuna voce. Revisione tecnica e linguistica. Questi controlli non equivalgono a esecuzione delle skill o della CI.
