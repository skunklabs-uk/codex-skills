# Codex Skills

**Stato:** Active.

Catalogo di skill Codex: originali pubblici fissati a commit; contenuto locale soltanto per contesto, integrazione o comportamento non coperto dagli upstream verificati.

## Fonti autorevoli

`config/global-skill-upstreams.tsv` governa gli originali diretti; `global/` e `projects/` contengono le skill mantenute qui. Il contenuto upstream resta nel repository originale: non copiarlo o modificarlo nella cache. Nessuna skill dichiarata nel manifest deve avere una copia omonima locale, globale o di progetto. Un derivato intenzionale richiede identità, scopo e motivazione propri.

Questo README è il catalogo, non un secondo framework. [`ask-skills`](global/ask-skills/SKILL.md) sceglie la capability; le sue istruzioni e quelle del progetto governano l'esecuzione. `AGENTS.md` e la RFC-0001 attiva restano vincolanti. `AGENTS.global.md` è una fonte di istruzioni, non una skill: non sostituisce automaticamente le istruzioni specifiche di un progetto.

I documenti Archived sono evidenze storiche. L'[audit del 2026-09-08](docs/reviews/2026-09-08-skill-origin-audit.md) registra motivazioni e verifiche della razionalizzazione; non impone nuovi passaggi operativi. Il vecchio diagramma e il workflow ChatGPT a gate fissi non sono più il percorso corrente.

## Come iniziare e proseguire

| Situazione | Ingresso e risultato |
|---|---|
| Baseline esistente incerta o documentazione in drift | `reality-check`: confronta intenzione approvata, documentazione, codice/configurazione ed evidenze runtime disponibili. Non legittima un bug aggiornando la specifica. |
| Modifica circoscritta a un flusso esistente | `brainstorming` upstream: per una richiesta chiara esecuzione diretta; per una piccola modifica descrizione in chat; design su file quando il lavoro è un progetto. |
| Decisioni architetturali nuove | `brainstorming`: design scritto approvato, poi `writing-plans`. Gli esperimenti di fattibilità restano throwaway e non diventano codice di prodotto implicitamente. |
| Conversazione già risolta da pubblicare nel tracker | `to-spec`; non riscrivere una specifica già adeguata. `writing-plans` solo quando il lavoro richiede un piano implementativo. |
| Piano approvato da eseguire | `subagent-driven-development` quando runtime e task permettono la delega; `executing-plans` in assenza di subagenti. Le verifiche e la review sono quelle del percorso scelto. |
| Bug | `systematic-debugging`; `diagnosing-bugs` è un'alternativa Matt, non una seconda diagnosi obbligatoria. |
| Operazione live o contenuto specifico | La skill del progetto e il runbook pertinente; un esecutore di piani software non sostituisce autorizzazioni, rollout o prove di restore. |

`reality-check` rimane locale perché leggere una fonte Active non dimostra che descriva lo stato reale. Distingue drift documentale, difetti rispetto ai requisiti, disallineamento di deploy e semplici verifiche mancanti. Esegue scritture solo nel perimetro autorizzato; non apre automaticamente interviste, report, issue o ADR.

Non caricare tutto il catalogo per un task. Usa `grill-with-docs` solo quando è richiesta l'intervista documentale: la sua policy upstream vieta l'invocazione implicita. Il `grilling` corrente di Matt raggruppa per round le domande indipendenti; non conserva il vecchio contatore locale.

## Uso circoscritto di GitNexus

La [politica in RFC-0001](https://github.com/skunklabs-uk/agent-os/blob/main/rfcs/RFC-0001-principles.md#strumenti-specialistici-di-analisi-dei-repository) governa attivazione, limiti e review. Questa procedura riguarda l'esecuzione tecnica; non aggiunge GitNexus al catalogo né autorizza installazioni o modifiche alle configurazioni globali.

1. Rilevare agente, accesso alla shell, versione GitNexus eventualmente installata e strumenti effettivamente disponibili. Consultare `--help` della versione presente e la [documentazione upstream](https://github.com/abhigyanpatwari/GitNexus/blob/main/gitnexus/README.md#cli-commands); non usare `npx ...@latest` per installare implicitamente il tool.
2. Controllare l'indice con `gitnexus status`, associandolo al repository corretto. Confrontare revisione e modifiche del working tree: la sola uguaglianza dello SHA non copre modifiche non indicizzate. Se serve creare o aggiornare l'indice nel perimetro autorizzato, usare `gitnexus analyze <path> --index-only`, verificando prima il supporto del flag e la destinazione dei dati. Questa modalità evita l'iniezione di AGENTS.md, CLAUDE.md e skill; non abilitare embeddings, hook o watcher per questo percorso.
3. Da **Codex o OMP con shell disponibile**, usare le query CLI native, senza server MCP: `gitnexus query "<domanda>" --repo <repository>`, `gitnexus context <simbolo> --repo <repository>` o `gitnexus impact <simbolo> --repo <repository>`. Disambiguare simboli omonimi con i flag supportati dalla versione presente. L'assenza di una relazione nel grafo non prova l'assenza nel codice.
4. Se si usa invece **MCP**, verificare discovery e configurazione nativa del runtime corrente. OMP dispone di [configurazione MCP propria](https://github.com/can1357/oh-my-pi/blob/main/docs/mcp-config.md); non copiarla in Codex. Esporre il server soltanto alla sessione del task, preservare lo stato iniziale e chiudere il processo o ripristinare l'override al termine. Se il runtime non consente questa separazione, usare la CLI disponibile o proseguire senza GitNexus; non introdurre wrapper.

Usare gli output e le metriche native nel report già previsto dalla politica. Per dati temporanei, rimuovere soltanto quelli creati dal task; preservare indici e configurazioni preesistenti. La pubblicazione di questa procedura non verifica un'installazione personale, l'integrazione Codex o un beneficio economico netto.

## Collegamento seriale del workspace

L'incarico richiede repository e thread ammessi, branch e head esatti e prompt corrente. Un solo consumer alla volta lavora nel checkout isolato. Il catalogo disponibile e le skill effettivamente installate nel runtime sono osservazioni distinte, come previsto da [`ask-skills`](global/ask-skills/SKILL.md).

Un report non pubblica modifiche. Il percorso write richiede `publish_paths` con i file esatti autorizzati dall’incarico e una PR Draft nello stesso repository. Il parent pubblica, poi il coordinatore rilegge SHA e diff remoto e completa RETURN. Il child non esegue commit, push, merge o rollout.

Un incarico documentale non autorizza aggiornamenti a manifest, pin, skill o istruzioni globali né installazioni nel runtime personale. Le procedure di installazione e manutenzione conservano la propria ownership: leggere un esempio di installazione non autorizza a eseguirlo.

Le verifiche appartengono al producer. Il workflow [`Validate skills`](.github/workflows/validate-skills.yml) esegue controlli di sintassi shell, struttura delle skill e test deterministici sulle PR fidate verso `main` e sui push a `main` per i percorsi configurati, incluso `README.md`. I controlli upstream sono condizionali; questi controlli e il test CI di installazione di `ui-depth-preview` in un ambiente temporaneo isolato non provano un'installazione personale né il comportamento del modello. Per procedure e limiti, consulta [Manutenzione e verifiche](#manutenzione-e-verifiche) e [Verifiche e limiti](#verifiche-e-limiti).

Per un incarico limitato alla documentazione del catalogo, la preview Kubernetes non è applicabile: il risultato non introduce un servizio HTTP. Restano necessarie la CI applicabile e la consegna reale con RETURN; gli incarichi che modificano strumenti o capacità richiedono le verifiche pertinenti al loro perimetro approvato.

Il runbook del collegamento è [`WORKSPACE-HANDOFF.md`](https://github.com/skunklabs-uk/developer-workspace/blob/main/docs/WORKSPACE-HANDOFF.md); enrollment e lifecycle runtime appartengono al [README Homelab](https://github.com/skunklabs-uk/homelab/blob/main/gitops/apps/developer-workspace/README.md). Per enrollment, selezione GitOps, recupero e stato persistente, usa queste fonti proprietarie.

La [PR #51](https://github.com/skunklabs-uk/codex-skills/pull/51), nell’ambito di [Homelab #1265](https://github.com/skunklabs-uk/homelab/issues/1265), ha collaudato il percorso con una modifica limitata a questo README: richiesta reale, probe e modello conclusi con exit 0, pubblicazione parent `c66043619df1b18251222a148d24835803d7d6a1` e [RETURN del coordinatore](https://github.com/skunklabs-uk/codex-skills/pull/51#issuecomment-5678806191). La [CI di quella pubblicazione](https://github.com/skunklabs-uk/codex-skills/actions/runs/34958819431) è passata. Il prompt temporaneo è stato ritirato nel closeout; questa prova non attesta installazioni personali o aggiornamenti del catalogo.

## Originali e compatibilità

| Famiglia | Distribuzione e vincoli |
|---|---|
| Superpowers | Le 15 skill del pacchetto sono fissate allo stesso commit. I piani possono scegliere esecuzione con o senza subagenti; non applicare il ciclo multiagente a ogni piccola modifica. Gli helper e i prompt restano nell'originale. |
| Matt Pocock | Tutte le 37 skill presenti in `mattpocock/skills` alla release **v1.3.1**, commit `24fe0ef7737efae15c87225755e9f6f5965e4888`: 27 nel plugin ufficiale, 6 beta `in-progress` e 4 utility `misc`. `to-spec`, `to-tickets`, `triage` e review richiedono il contesto tracker previsto dall'upstream: configurarlo solo quando quel flusso serve. Non imporre setup o nuove label a ogni repository. |
| Addy Osmani | 13 skill selezionate, senza copiare i comandi lifecycle o imporre un secondo orchestratore. Il checkout completo conserva anche i riferimenti condivisi a livello di repository. |
| Altri upstream | Playwright, humanize-writing, frontend-design, caveman e unslop rimangono pacchetti originali secondo i pin del manifest. |

L'installer mantiene checkout completi, inclusi licenze, helper e riferimenti; per percorsi relativi complessi considera la directory fisica della skill. Non esegue gli script di setup dei framework né installa hook di un plugin nativo. Una skill a catalogo non prova che il runtime offra browser, subagenti, generazione immagini o un servizio esterno.

Il TDD Matt usa il ciclo red/green e colloca il refactoring nella review `code-review`; Superpowers ha `test-driven-development`. Non applicare contemporaneamente due cicli al medesimo task. Non modificare gli originali per nascondere differenze metodologiche. Istruzioni, scope, autorizzazioni e limiti economici del progetto restano prioritari: esempi, rubriche o «rulings» upstream non autorizzano nuove decisioni di prodotto, costi o modifiche esterne.

`resolving-merge-conflicts` è ritirata dalla v1.3.1 e inclusa nel pruning; i conflitti restano gestiti dall’agente. Le nuove skill usano `GLOSSARY.md` e `GLOSSARY-MAP.md`: nei repository che usano ancora `CONTEXT.md` o `CONTEXT-MAP.md`, verificare i contenuti e migrare i riferimenti prima di usare i flussi di dominio.

`ask-skills` resta il selettore tra tutti i cataloghi; `ask-matt` è disponibile come router originale per il solo percorso Matt. Le beta e le utility sono incluse per scelta esplicita del maintainer, senza promuoverle a stabili. L’installer non esegue hook o setup: disponibilità e prerequisiti vanno verificati al momento dell’uso, soprattutto per le skill specifiche di Claude Code.

`zoom-out` è stato ritirato nell'upstream Matt: l'esplorazione del codice resta una capacità dell'agente. La copia isolata di `office-hours` è ritirata perché dipende dal runtime gstack; non è sostituita con un altro framework. La checklist di rete rimasta in Homelab è dichiarata derivato locale, non «upstream ECC puro».

### Revisioni upstream verificate il 10 ottobre 2026

| Famiglia | Revisione approvata | Cambi rilevanti |
|---|---|---|
| `obra/superpowers` | `bb92a77741419a4ab5f06e711a283343f1ada0c3` | v7.0.0: brainstorming riscritto, esecuzione nativa e nuova diagnosing-superpowers. |
| `addyosmani/agent-skills` | `1401c8b8030e023baeebb31781a6653fe8e93026` | Correzioni API e review; riferimenti estratti per performance e sicurezza; indicazioni UI. |
| `anthropics/skills` | `dbd4588f9e1033efb41dad4bef2f7947c8993d44` | Design guidato dal brief e critica dei layout generici. |
| `JuliusBrussee/caveman` | `2e08b9177c07bb7249a8a2d1a6758e5db281d002` | v3.2.0: voice aggiornata; ultracave e megacave incluse come dipendenze delle modalità. |
| `theclaymethod/unslop` | `17ed39c9d0b522f44190ff0c6233867eadee192a` | Lettura del testo prima degli scanner, meno overhead e conservazione del testo senza difetti. |

Le revisioni di `humanize-writing` e `playwright` risultano già correnti. Gli originali restano invariati. Caveman viene consumato soltanto come skill di stile: questa installazione non attiva proxy, compressione, hook o runtime del repository.

Superpowers 7 introduce helper, workspace e ledger nei suoi percorsi di esecuzione. Il pin ne rende disponibile il contenuto, senza autorizzarne automaticamente ogni controllo: prima di usare un percorso che li richiede, applicare la prova di necessità e la proporzionalità della RFC-0001. Se il requisito non è soddisfatto, scegliere con `ask-skills` un altro percorso disponibile, ad esempio `implement` di Matt; non modificare l’originale o fingere di averne eseguito i gate. Lo stesso limite vale per prove di mutazione o nuovi gate richiesti da altri upstream.

La verifica di questa migrazione copre metadati, riferimenti, pin e installazione isolata; non è una valutazione comportamentale dei modelli né un’installazione personale. Le skill locali senza nuovo upstream restano invariate.

## Inventario corrente

121 nomi distinti: **72 originali globali diretti, 30 skill locali/derivate, 1 originale importato limitato a Baialupo, 18 skill del plugin nativo Data Analytics**. Le copie omonime nei progetti sono state ritirate; la presenza nel catalogo non equivale a installazione sulla macchina dell'utente.

### Globali

| Skill | Fonte | Scopo |
|---|---|---|
| `api-and-interface-design` | `addyosmani/agent-skills` — diretto | Contratti e interfacce. |
| `ask-matt` | `mattpocock/skills` — diretto | Router upstream del solo catalogo Matt; `ask-skills` resta l’ingresso multi-catalogo. |
| `ask-skills` | `derivato locale di Matt Pocock` | Selezione multi-catalogo, senza riscrivere i processi. |
| `brainstorming` | `obra/superpowers` — diretto | Chiarimento dell’intento e scelta della scala del lavoro. |
| `browser-testing-with-devtools` | `addyosmani/agent-skills` — diretto | Verifica browser con DevTools disponibili. |
| `caveman` | `JuliusBrussee/caveman` — diretto | Stile di risposta essenziale. |
| `claude-handoff` | `mattpocock/skills` — diretto | Beta: handoff a un agente in background; richiede Claude Code. |
| `code-review` | `mattpocock/skills` — diretto | Review Matt su standard e specifica. |
| `code-review-and-quality` | `addyosmani/agent-skills` — diretto | Review di correttezza, qualità, sicurezza e performance. |
| `code-simplification` | `addyosmani/agent-skills` — diretto | Semplificazione senza variazione del comportamento. |
| `codebase-design` | `mattpocock/skills` — diretto | Vocabolario di moduli, interfacce e testabilità. |
| `deprecation-and-migration` | `addyosmani/agent-skills` — diretto | Ritiro e migrazione di comportamenti esistenti. |
| `diagnosing-bugs` | `mattpocock/skills` — diretto | Diagnosi Matt con loop riproducibile. |
| `diagnosing-superpowers` | `obra/superpowers` — diretto | Diagnosi dei problemi nel processo Superpowers. |
| `dispatching-parallel-agents` | `obra/superpowers` — diretto | Delega di indagini indipendenti quando utile. |
| `documentation-and-adrs` | `addyosmani/agent-skills` — diretto | Documentazione e decisioni architetturali. |
| `domain-modeling` | `mattpocock/skills` — diretto | Glossario e decisioni di dominio. |
| `executing-plans` | `obra/superpowers` — diretto | Esecuzione di un piano senza subagenti. |
| `finishing-a-development-branch` | `obra/superpowers` — diretto | Verifica e integrazione finale del branch. |
| `frontend-design` | `anthropics/skills` — diretto | Design visuale frontend. |
| `frontend-ui-engineering` | `addyosmani/agent-skills` — diretto | Interfacce, design system, stati e accessibilità. |
| `git-guardrails-claude-code` | `mattpocock/skills` — diretto | Utility: hook di protezione Git specifici per Claude Code. |
| `grill-me` | `mattpocock/skills` — diretto | Intervista per chiarire un piano o un design. |
| `grill-with-docs` | `mattpocock/skills` — diretto | Intervista documentale esplicitamente richiesta. |
| `grilling` | `mattpocock/skills` — diretto | Decisioni per round secondo le dipendenze. |
| `handoff` | `mattpocock/skills` — diretto | Contesto trasferibile tra sessioni. |
| `humanize-writing` | `jpeggdev/humanize-writing` — diretto | Revisione della naturalezza del testo. |
| `idea-refine` | `addyosmani/agent-skills` — diretto | Chiarimento di idee e alternative. |
| `implement` | `mattpocock/skills` — diretto | Implementazione di una specifica o di ticket. |
| `implement-spec` | `mattpocock/skills` — diretto | Implementazione di una specifica con task graph e worktree paralleli. |
| `improve-codebase-architecture` | `mattpocock/skills` — diretto | Analisi degli attriti architetturali. |
| `interview-me` | `addyosmani/agent-skills` — diretto | Chiarimento dell’intento. |
| `loop-me` | `mattpocock/skills` — diretto | Beta: definizione iterativa di workflow nel workspace. |
| `migrate-to-shoehorn` | `mattpocock/skills` — diretto | Utility: migrazione dei dati di test a shoehorn. |
| `performance-optimization` | `addyosmani/agent-skills` — diretto | Ottimizzazione guidata da misure. |
| `planning-and-task-breakdown` | `addyosmani/agent-skills` — diretto | Scomposizione del lavoro. |
| `playwright` | `openai/skills` — diretto | Browser reale tramite CLI. |
| `pr` | `mattpocock/skills` — diretto | Descrizione delle PR con evidenze e impatto del merge. |
| `prototype` | `mattpocock/skills` — diretto | Esperimento throwaway. |
| `reality-check` | `locale` | Riconciliazione della baseline e del drift. |
| `receiving-code-review` | `obra/superpowers` — diretto | Valutazione tecnica dei feedback. |
| `requesting-code-review` | `obra/superpowers` — diretto | Preparazione della review. |
| `research` | `mattpocock/skills` — diretto | Ricerca source-backed secondo il runtime upstream. |
| `retro` | `mattpocock/skills` — diretto | Retrospettiva della sessione e miglioramenti dell’ambiente agente. |
| `scaffold-exercises` | `mattpocock/skills` — diretto | Utility: struttura di esercizi e soluzioni. |
| `security-and-hardening` | `addyosmani/agent-skills` — diretto | Sicurezza applicativa e integrazioni. |
| `setup-matt-pocock-skills` | `mattpocock/skills` — diretto | Configurazione del contesto richiesto dai flussi Matt. |
| `setup-pre-commit` | `mattpocock/skills` — diretto | Utility: configurazione Husky e lint-staged. |
| `setup-ts-deep-modules` | `mattpocock/skills` — diretto | Beta: configurazione di moduli TypeScript con dependency-cruiser. |
| `source-driven-development` | `addyosmani/agent-skills` — diretto | Verifica delle API sulle fonti ufficiali. |
| `subagent-driven-development` | `obra/superpowers` — diretto | Esecuzione di piani con worker e review. |
| `systematic-debugging` | `obra/superpowers` — diretto | Diagnosi prima del fix. |
| `tdd` | `mattpocock/skills` — diretto | Testing comportamentale Matt. |
| `teach` | `mattpocock/skills` — diretto | Percorso didattico persistente. |
| `test-driven-development` | `obra/superpowers` — diretto | Ciclo TDD Superpowers. |
| `to-questionnaire` | `mattpocock/skills` — diretto | Questionario da far compilare a un’altra persona. |
| `to-spec` | `mattpocock/skills` — diretto | Sintesi della conversazione nel tracker. |
| `to-tickets` | `mattpocock/skills` — diretto | Scomposizione in ticket verificabili. |
| `triage` | `mattpocock/skills` — diretto | Classificazione di issue, bug e richieste prima della pianificazione. |
| `ui-depth-preview` | `locale` | Preview del layering senza costruire un’app temporanea. |
| `ultracave` | `JuliusBrussee/caveman` — diretto | Modalità esplicita di massima concisione. |
| `unslop` | `theclaymethod/unslop` — diretto | Revisione della prosa. |
| `using-git-worktrees` | `obra/superpowers` — diretto | Isolamento del lavoro. |
| `using-superpowers` | `obra/superpowers` — diretto | Ingresso e adattamento del pacchetto Superpowers. |
| `verification-before-completion` | `obra/superpowers` — diretto | Evidenze prima della conclusione. |
| `wait-what` | `mattpocock/skills` — diretto | Riformulazione di una spiegazione poco chiara. |
| `wayfinder` | `mattpocock/skills` — diretto | Risoluzione di iniziative multi-sessione. |
| `wizard` | `mattpocock/skills` — diretto | Wizard Bash per passaggi che richiedono intervento umano. |
| `writing-beats` | `mattpocock/skills` — diretto | Beta: costruzione di un articolo per sequenze narrative. |
| `writing-for-agents` | `mattpocock/skills` — diretto | Scrittura di documenti destinati agli agenti. |
| `writing-fragments` | `mattpocock/skills` — diretto | Beta: raccolta di frammenti per la scrittura. |
| `writing-plans` | `obra/superpowers` — diretto | Piano implementativo da requisiti definiti. |
| `writing-shape` | `mattpocock/skills` — diretto | Beta: organizzazione di materiale in un articolo. |
| `writing-skills` | `obra/superpowers` — diretto | Creazione e verifica di skill. |

### Data Analytics: plugin ufficiale

La fonte corrente è [openai/plugins](https://github.com/openai/plugins/tree/main/plugins/data-analytics), plugin **0.2.8** nel marketplace `openai-curated` («Codex official»). Il repository `openai/role-specific-plugins` è stato svuotato il 30 settembre 2026: non è più una sorgente di aggiornamenti. La revisione verificata del nuovo repository è `0722921d5542fc593105c27bd52630babd8b8c2a`.

Data Analytics usa il canale nativo del plugin, non il manifest TSV. Il manifest ufficiale dichiara `Proprietary`: questa configurazione non copia, modifica o redistribuisce il pacchetto e non presume che la vecchia licenza MIT si applichi al nuovo contenuto. `ask-skills` resta l’ingresso multi-catalogo e verifica le skill disponibili nel runtime prima di selezionarle.

| Skill del plugin | Scopo |
|---|---|
| `analyze-data-quality` | Affidabilità dei dati. |
| `build-dashboard` | Dashboard. |
| `build-report` | Report analitici. |
| `create-data-context` | Contesto e semantica dei dati. |
| `design-kpis` | Definizione di KPI. |
| `gather-business-context` | Contesto della domanda di business. |
| `index` | Router interno del plugin, nel suo namespace nativo. |
| `jupyter-notebooks` | Notebook riproducibili. |
| `kpi-reporting` | Rendicontazione KPI. |
| `market-sizing` | Dimensionamento del mercato. |
| `megacave` | `JuliusBrussee/caveman` — diretto | Modalità esplicita in cinese classico. |
| `metric-diagnostics` | Diagnosi dei movimenti delle metriche. |
| `product-business-analysis` | Analisi di prodotto e business. |
| `publish-artifact-to-sites` | Pubblicazione di artefatti quando il runtime e lo scope lo consentono. |
| `report-to-google-doc` | Esportazione in Docs/DOCX. |
| `report-to-google-slides` | Esportazione in Slides. |
| `report-to-pdf` | Esportazione in PDF. |
| `validate-data` | Verifica delle analisi. |
| `visualize-data` | Visualizzazione dei dati. |

#### Migrazione dell’installazione

1. Nel browser plugin del runtime cercare **Data Analytics** nella fonte ufficiale e installarlo. In Codex CLI il browser si apre con `/plugins`; avviare poi una nuova sessione. Se la fonte ufficiale non è disponibile, la documentazione [Package your plugin](https://developers.openai.com/plugins/build/plugins) descrive la registrazione nativa del marketplace: `codex plugin marketplace add openai/plugins --ref main`. Non modificare manualmente la cache.
2. Verificare in una nuova sessione la discovery delle 18 skill del plugin e gli strumenti effettivamente connessi. Provare un’analisi circoscritta su dati forniti dall’utente; la sola discovery non dimostra che connessioni, export o Sites funzionino.
3. Solo dopo questa verifica, spostare fuori dalla discovery le 16 vecchie voci installate dal TSV, conservandole in `$CODEX_HOME/skill-backups`. Confrontare prima i target: spostare soltanto i symlink che puntano a `$CODEX_HOME/upstream-skills/<nome>/plugins/data-analytics/skills/...`; directory reali o link estranei richiedono ispezione. I nomi sono quelli della tabella precedente, esclusi `index` e `publish-artifact-to-sites`. Non seguire i symlink e non eliminare il contenuto del checkout.

La lista di pruning include queste 16 voci e la sincronizzazione le ignora. Eseguire `bash scripts/prune-local.sh --dry-run`, controllare le voci interessate e applicare il pruning soltanto dopo l’installazione verificata del plugin: anticiparlo toglierebbe una capability funzionante. Il manifest non le reinstalla. Per rollback disinstallare il plugin nativo e ripristinare i vecchi link dai backup; il vecchio snapshot è soltanto recupero temporaneo, non il canale operativo corrente. Plugin e connessioni personali non sono stati installati o verificati da questa modifica.

### baialupo

| Skill | Fonte e contesto mantenuto |
|---|---|
| `baia-publish` | locale. Contratto editoriale, asset, eventi e pubblicazione Baialupo. |
| `seo-audit` | originale importato, scoped Baialupo. Originale MIT scoped al sito, non globalizzato. |

### cap-aeris

| Skill | Fonte e contesto mantenuto |
|---|---|
| `grill-with-screenshots` | locale. Usa per valutare screenshot CAP Aeris, gerarchia dei compiti, responsività e stati mancanti, senza implementare un redesign. |
| `update-docs` | locale. Usa quando un cambiamento CAP Aeris interessa fonti primarie protette, sintesi wiki o domande aperte. |
| `write-tests` | locale. Usa quando i test CAP Aeris dipendono da pratiche, permessi, requisiti documentali o revisioni dei moduli. |

### homelab

| Skill | Fonte e contesto mantenuto |
|---|---|
| `homelab-app-onboarding` | locale. Usa per inserire un’applicazione nell’Homelab e definire ownership GitOps, database, secret, esposizione e Homepage. |
| `homelab-backup-restore` | locale. Usa per verificare o modificare backup e recupero Homelab: CNPG, Barman, RGW, R2, rclone, Filestash e drill autorizzati. |
| `homelab-ceph-storage-operations` | locale. Usa quando un intervento Homelab interessa Ceph, CSI, RGW, RBD, ownership dei PVC o prefissi di backup. |
| `homelab-cloudflare-operations` | locale. Usa quando un intervento Homelab attraversa DNS Cloudflare, Access, tunnel ed esposizione GitOps. |
| `homelab-gateway-routes` | locale. Usa per esporre o verificare un servizio Homelab tramite Gateway condiviso, HTTPRoute e routing Cloudflare. |
| `homelab-gitops-operations` | locale. Usa per modificare manifest Homelab, riconciliare Application Argo o verificare una revisione distribuita. |
| `homelab-network-readiness` | derivato locale, provenienza community non pin-nata. Usa prima di modifiche di rete Homelab che possono incidere su management, VLAN, DHCP, DNS o accesso remoto. |
| `homelab-observability-operations` | locale. Usa quando un intervento Homelab interessa sorgenti di monitoraggio, label Alloy, backend Grafana o ownership delle dashboard. |
| `homelab-opentofu-terraform` | locale. Usa per pianificare o applicare cambi OpenTofu Homelab rispettando i confini di ownership Cloudflare, Harbor e GitOps. |
| `homelab-proxmox-operations` | locale. Usa quando un’operazione Homelab interessa nodi Proxmox, PBS, Ceph, VM o rete di management. |
| `homelab-review-and-debt` | locale. Usa per un assessment richiesto dei rischi operativi Homelab, drift di ownership, backup o accuratezza dei runbook. |
| `homelab-secret-management` | locale. Usa quando un secret Homelab coinvolge SOPS, Age, eccezioni bootstrap, reflection dei database o rotazione con rollout. |

### kong

| Skill | Fonte e contesto mantenuto |
|---|---|
| `read-vdo-hour-meter` | locale. Lettura LCD e formato readings.yml consumato da Kong. |

### obsidian

| Skill | Fonte e contesto mantenuto |
|---|---|
| `organize-obsidian-wiki` | locale. Usa quando lavori con il vault Obsidian sorgente protetto e il workspace derivato skunklabs-uk/obsidian. |

### powerpoint

| Skill | Fonte e contesto mantenuto |
|---|---|
| `business-case-storyline` | locale. Usa quando una proposta TXT/Novigo richiede la storyline commerciale locale o deve spiegare concretamente una POC esistente. |
| `commercial-deck-quality-review` | locale. Usa per verificare un deck commerciale rispetto a brief approvato, fonti, obiettivo executive e convenzioni TXT/Novigo. |
| `deck-visual-grounding` | locale. Usa quando un deck deve rispettare reference TXT/Novigo, asset reali e un grado di fedeltà concordato. |
| `powerpoint-manipulation` | locale. Usa per ispezionare, modificare, unire, generare o riparare pacchetti PowerPoint editabili nel workspace TXT/Novigo. |
| `pptx-package-validation` | locale. Usa prima della consegna di un PowerPoint quando occorre verificare integrità del pacchetto e possibili avvisi di repair. |
| `proposal-intake` | locale. Usa per trasformare materiali commerciali in un brief senza inventare scope, economics, impegni o permessi di riuso. |
| `repo-to-deck-brief` | locale. Usa quando un repository software è la fonte di evidenze per un brief commerciale o executive. |
| `software-delivery-estimation` | locale. Usa quando una proposta richiede range motivati di effort e delivery software, non un prezzo vincolante. |
| `wbs-generation` | locale. Usa quando una proposta TXT/Novigo richiede una scomposizione dei deliverable o la reference corrente prescrive una WBS. |

Cantieri Protetti AI e iWant non hanno più copie di framework o skill generiche proprie: usano gli originali globali e le istruzioni del progetto. Le directory restano come destinazioni valide per la migrazione dei vecchi symlink.

`seo-audit` resta in `projects/baialupo/seo-audit`: `coreyhaines31/marketingskills@1efedbc5148b54b2f0f6c6c9fe0be62e151c7fff`, versione 2.2.0, con tutti i riferimenti e la licenza MIT originali. Gli altri moduli marketing citati non sono installati. Le indicazioni SEO devono essere confrontate con le fonti correnti di Google, non assunte come normative immutabili.

## Installazione e migrazione

Prima controlla gli upstream già installati come plugin nel runtime: evita una seconda copia globale omonima. Il catalogo non modifica configurazioni di plugin, account, servizi o installazioni personali da remoto.

Dal checkout aggiornato, per installare il catalogo globale completo con i pin approvati:

```bash
bash scripts/install-local.sh --replace
```

Per una selezione parziale indica tutti i nomi necessari: l'installer non risolve dipendenze transitive. Esempi:

```bash
bash scripts/install-local.sh ui-depth-preview
bash scripts/install-local.sh --replace grill-with-docs grilling domain-modeling
```

Il percorso globale è `$CODEX_HOME/skills` (default `~/.codex/skills`). Gli originali sono checkout sotto `$CODEX_HOME/upstream-skills/<nome>`; i symlink puntano alla directory upstream con `SKILL.md`. `--replace` conserva le vecchie copie fuori dalla discovery, sotto `$CODEX_HOME/skill-backups`. Nessun wrapper del contenuto upstream viene generato.

Prima del pruning, completare la [migrazione Data Analytics](#migrazione-dellinstallazione) e verificare il plugin nativo se le vecchie skill sono installate. Esamina e poi applica il ritiro delle vecchie voci globali:

```bash
bash scripts/prune-local.sh --dry-run
bash scripts/prune-local.sh
```

La lista è `config/global-skill-prune.txt`: comprende anche ritiri storici. Il pruning sposta le voci in backup esterno alla discovery, senza cancellare il contenuto delle directory reali e senza seguire i symlink. `reality-check`, `playwright` e `setup-matt-pocock-skills` restano a catalogo e non sono nella lista di ritiro.

Nei checkout di progetto conserva l'autorità locale:

```bash
bash scripts/install-project.sh --replace --no-global-agents cap-aeris /percorso/aeris
bash scripts/install-project.sh --replace --no-global-agents homelab /percorso/homelab
bash scripts/install-project.sh --replace --no-global-agents powerpoint /percorso/powerpoint-ai
bash scripts/install-project.sh --replace --no-global-agents cantieri-protetti-ai /percorso/cantieri
bash scripts/install-project.sh --replace --no-global-agents iwant /percorso/iwant
```

Usa gli stessi argomenti con gli altri progetti effettivamente installati. Con `--replace`, l'installer sposta fuori da `.agents/skills` soltanto i symlink **interrotti** che puntano alle sorgenti ritirate di questo checkout; preserva link estranei e directory reali non selezionate. Le copie reali di skill ritirate, i vecchi backup dentro la discovery e i link a checkout trasferiti richiedono confronto prima di essere spostati: non vengono rimossi indiscriminatamente.

Per installare solo SEO senza cambiare l'`AGENTS.md` di Baialupo:

```bash
bash scripts/install-project.sh --no-global-agents baialupo /percorso/baialupo.com seo-audit
```

L'installazione non esegue audit, pubblicazioni o operazioni live. Riavvia Codex e verifica che il catalogo risolva gli originali corretti. Le installazioni personali non sono state eseguite da questa PR.

`AGENTS.global.md` può essere collegato intenzionalmente con `bash scripts/install-global-agents.sh <project-root>`; `--replace` significa sostituire le istruzioni esistenti dopo backup e non va usato per cancellare convenzioni di progetto senza una decisione esplicita.

## Aggiornamenti upstream

Gli aggiornamenti seguono il percorso **upstream → PR Renovate → SHA approvato nel manifest → installazione locale**. Il contenuto delle skill non viene copiato qui e il manifest continua ad avere quattro colonne: nome, repository, commit e percorso. Questa automazione non aggiorna gli SHA già approvati al momento della sua introduzione.

### Rilevamento e approvazione

`renovate.json` configura il regex manager nativo con datasource `git-refs`: estrae lo SHA completo (`currentDigest`) e usa `currentValueTemplate: "main"` come riferimento da osservare. Il branch `main` è stato verificato negli otto upstream presenti; il manifest e l'installer continuano a usare soltanto SHA immutabili. Il validatore richiede un riferimento esplicito: `HEAD` sarebbe cercato come nome di branch o tag, non come branch predefinito. Prima di introdurre un upstream che usa un altro ramo, o in caso di rinomina di `main`, aggiornare il manager per quel repository in una PR revisionata. Non cambiare automaticamente canale e non alterare il formato del manifest per aggirare questa verifica.

La finestra per creare e aggiornare le PR è **lunedì dalle 00:00 alle 06:00, Europe/Rome**; `updateNotScheduled: false` evita aggiornamenti ordinari dei branch fuori finestra. È una finestra del bot Renovate già collegato, non un nuovo cron: il bot deve comunque eseguire una scansione nella finestra. Il [Dependency Dashboard #24](https://github.com/skunklabs-uk/codex-skills/issues/24) mostra dipendenze rilevate, proposte ed eventuali errori; non modificarne manualmente le sezioni generate.

Le righe dello stesso repository condividono l'identità della dipendenza e il gruppo: **una PR per upstream**, non una per skill e non una PR unica per tutti i framework. Tutte le skill della famiglia devono restare allo stesso SHA. L'automerge è disabilitato per queste dipendenze. Non viene promessa una maturazione temporale del commit: `git-refs` non fornisce il timestamp necessario a `minimumReleaseAge`.

Prima del merge, leggere il confronto tra vecchio e nuovo commit per le skill selezionate e i loro riferimenti. Controllare soprattutto cambi a nomi/percorsi, dipendenze, metadati di invocazione, helper, autorizzazioni, regole di arresto e passaggi obbligatori. Non basta che il Markdown sia valido. Se un upstream elimina o rinomina una skill, correggere manifest, catalogo e migrazione nella stessa PR oppure non accettare il pin; non aggiungere automaticamente tutte le nuove skill della suite. Per cambi sostanziali al metodo, verificare un caso rappresentativo nel runtime prima dell'adozione e dichiarare l'eventuale prova mancante.

Il flusso riguarda soltanto gli originali nel manifest. `seo-audit`, importata nel progetto Baialupo, e i derivati locali richiedono un aggiornamento esplicito del loro contenuto; i plugin nativi restano sul proprio canale e non vanno duplicati.

### Applicazione e rollback

Chiudere le sessioni Codex interessate prima di aggiornare i checkout upstream: le skill di una famiglia vengono aggiornate in sequenza, non in un'unica transazione. Dal checkout pulito di `codex-skills` sul branch `main`:

```bash
git pull --ff-only
# Esempio: aggiornare tutta la famiglia Superpowers ai pin approvati.
mapfile -t skills < <(awk -F '\t' '$2 == "https://github.com/obra/superpowers.git" {print $1}' config/global-skill-upstreams.tsv)
if ((${#skills[@]})); then
  bash scripts/install-local.sh "${skills[@]}"
fi
```

Usare il repository della famiglia effettivamente gestita con questo installer. Il solo `git pull` aggiorna il manifest, non i checkout upstream. `--replace` serve se cambia il collegamento o si sostituisce una vecchia copia, non per il normale cambio di SHA. Non modificare la cache: il checkout forzato dell'installer sovrascrive modifiche tracciate. Dopo l'installazione riavviare Codex e verificare che non restino plugin o copie omonime su revisioni diverse.

Per il rollback, ripristinare in PR il precedente SHA approvato per **tutta la famiglia**, quindi aggiornare il checkout locale e rieseguire lo stesso installer. Non ripristinare l'intero manifest a una vecchia versione perdendo aggiornamenti di altri upstream. Se un'installazione si interrompe, non usare la famiglia parzialmente aggiornata: completare l'installazione o riapplicare il pin precedente a tutte le sue skill.

### Verifiche e limiti

Il workflow esistente `Validate skills` controlla PR verso `main` e push a `main`, includendo manifest e configurazione Renovate. Sul runner condiviso le PR provenienti da fork esterni vengono saltate: **skipped non significa verificato**; serve revisione del codice e un branch fidato prima dell'esecuzione. I job hanno permessi `contents: read`, credenziali Git non persistenti e un limite di durata; non eseguono helper upstream.

I test deterministici includono il contratto TSV/regex, con righe adiacenti, terminatori LF/CRLF, nomi dei repository e raggruppamento. Il workflow usa Node.js 24: la versione fissata di Renovate richiede Node `^24.11.0`. Quando cambiano manifest, configurazione Renovate o workflow, la stessa CI esegue il validatore ufficiale e una scansione nativa `--platform=local --dry-run=lookup`, quindi verifica con Git la presenza dei file `SKILL.md` non vuoti ai pin dichiarati, recuperando ogni repository una sola volta. Revisioni miste dello stesso upstream fanno fallire il controllo. Nel dry-run CI, il messaggio nativo di digest non risolto viene elevato a errore tramite `logLevelRemap`: una scansione che non trova i commit non deve sembrare riuscita. Se il confronto Git non è disponibile, i controlli vengono eseguiti anziché saltati.

Queste verifiche non attestano la qualità del comportamento del modello, la completezza semantica delle dipendenze o l'avvenuta installazione sul computer. Il primo aggiornamento reale aperto dal bot e l'adozione locale sono osservazioni distinte dalla validazione della configurazione. Non vengono creati runner, hook o installazioni automatiche personali.

Comandi ufficiali riutilizzati anche nel preset condiviso (versione del validatore fissata nel workflow):

```bash
npx --yes --package renovate@44.30.3 -- renovate-config-validator --no-global --strict renovate.json
LOG_LEVEL=debug npx --yes --package renovate@44.30.3 -- renovate --platform=local --dry-run=lookup --enabled-managers=custom.regex
```

Riferimenti: [regex manager](https://docs.renovatebot.com/modules/manager/regex/), [git-refs](https://docs.renovatebot.com/modules/datasource/git-refs/), [scheduling](https://docs.renovatebot.com/configuration-options/#schedule), [validatore](https://docs.renovatebot.com/config-validation/) e [dry-run locale](https://docs.renovatebot.com/modules/platform/local/).

### Necessità e closeout RFC-0001

| Elemento | Decisione ed evidenza |
|---|---|
| Requisito e failure mode | Aggiornamenti revisionabili e riproducibili, richiesti dall'utente. Alla baseline `e51bb77`, Renovate non leggeva il TSV e la CI ignorava `config/**`: un pin poteva restare fermo o cambiare senza questi controlli. |
| Copertura e gap | Manifest e installer già impongono SHA precisi. Il validatore locale verifica il formato, non la disponibilità remota dei percorsi; il vecchio trigger non avviava le verifiche sulle PR dei pin. Il primo dry-run della PR #50 ha inoltre mostrato che una configurazione valida può non risolvere i digest: la CI tratta ora quella mancata risoluzione come errore, usando il meccanismo nativo Renovate. |
| Alternative | `KEEP` di manifest, installer, Renovate e workflow esistenti. `REPLACE` dell'aggiornamento manuale dei pin con il manager nativo; `DELETE` dell'ipotesi di updater/runner custom. Nessun nuovo formato di lock o catalogo parallelo. |
| Beneficio e prova | Estrazione completa del manifest in gruppi per upstream; PR senza automerge; configurazione validata da Renovate; rifiuto di percorsi assenti e famiglie su pin misti. I log della PR identificano la revisione effettivamente verificata. |
| Costo e perimetro | Configurazione, README, un test del contratto e step nel workflow esistente. Le letture di rete si eseguono solo quando cambia il flusso upstream; nessuno script upstream, nuovo account, deploy o aggiornamento personale. |
| Impatto cumulativo e lifecycle | Un solo canale per ciascuna skill, un gruppo per repository. Owner: maintainer di `codex-skills`. Reversibilità tramite revert della configurazione e ripristino dei pin; eliminare il regex manager quando un manager nativo supporta direttamente questo manifest. |
| Closeout documentale | Questo README rimane la fonte operativa: aggiorna manutenzione, CI, adozione e rollback. L'audit precedente resta Archived e storico; nessun nuovo documento operativo o duplicazione della RFC. La PR distingue verifiche concluse da scansione periodica e installazioni non osservate. |

## Manutenzione e verifiche

Le skill locali hanno frontmatter YAML con `name` e `description`; riferimenti e helper appartengono alla directory della skill. Per proporre un nuovo controllo locale servono il gap e la prova previsti dalla RFC, non un nuovo framework.

```bash
bash scripts/sync-from-codex.sh
bash scripts/validate-skills.sh
for script in scripts/*.sh; do bash -n "$script"; done
for test_script in scripts/test-*.sh; do bash "$test_script"; done
```

La sincronizzazione ignora originali nel manifest e nomi ritirati, anche con `--force`: non deve reimportare ciò che è stato eliminato o vendorizzare un upstream. Rivedi sempre il diff prima di committare.

I test deterministici proteggono metadati, contratti specifici e comportamento degli installer. Non sono benchmark del modello né attestazioni di deploy o restore. La CI esegue le verifiche sulle PR fidate verso `main` e sui push a `main` per i percorsi configurati, inclusi `config/**` e `renovate.json`; i dettagli e i limiti sono nella sezione aggiornamenti upstream. Non rilanciare workflow per diagnosi o senza le autorizzazioni previste dalla RFC.
