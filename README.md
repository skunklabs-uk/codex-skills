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
| Modifica circoscritta a un flusso esistente | `brainstorming` upstream, percorso Bounded: proposta e approvazione in chat, poi implementazione; niente spec e piano su file per rito. |
| Decisioni architetturali nuove | `brainstorming`, percorso Architectural: design/spec approvata, poi `writing-plans`. Gli esperimenti di fattibilità restano Spike e non diventano codice di prodotto implicitamente. |
| Conversazione già risolta da pubblicare nel tracker | `to-spec`; non riscrivere una specifica già adeguata. `writing-plans` solo quando il lavoro richiede un piano implementativo. |
| Piano approvato da eseguire | `subagent-driven-development` quando runtime e task permettono la delega; `executing-plans` in assenza di subagenti. Le verifiche e la review sono quelle del percorso scelto. |
| Bug | `systematic-debugging`; `diagnosing-bugs` è un'alternativa Matt, non una seconda diagnosi obbligatoria. |
| Operazione live o contenuto specifico | La skill del progetto e il runbook pertinente; un esecutore di piani software non sostituisce autorizzazioni, rollout o prove di restore. |

`reality-check` rimane locale perché leggere una fonte Active non dimostra che descriva lo stato reale. Distingue drift documentale, difetti rispetto ai requisiti, disallineamento di deploy e semplici verifiche mancanti. Esegue scritture solo nel perimetro autorizzato; non apre automaticamente interviste, report, issue o ADR.

Non caricare tutto il catalogo per un task. Usa `grill-with-docs` solo quando è richiesta l'intervista documentale: la sua policy upstream vieta l'invocazione implicita. Il `grilling` corrente di Matt raggruppa per round le domande indipendenti; non conserva il vecchio contatore locale.

## Originali e compatibilità

| Famiglia | Distribuzione e vincoli |
|---|---|
| Superpowers | Le 14 skill del pacchetto sono fissate allo stesso commit. I piani possono scegliere esecuzione con o senza subagenti; non applicare il ciclo multiagente a ogni piccola modifica. Gli helper e i prompt restano nell'originale. |
| Matt Pocock | Un solo commit per le 18 capability selezionate, incluse dipendenze di grilling e TDD/review. `to-spec`, `to-tickets`, `triage` e review richiedono il contesto tracker previsto dall'upstream: configurarlo solo quando quel flusso serve. Non imporre setup o nuove label a ogni repository. |
| Addy Osmani | 13 skill selezionate, senza copiare i comandi lifecycle o imporre un secondo orchestratore. Il checkout completo conserva anche i riferimenti condivisi a livello di repository. |
| Altri upstream | Data Analytics OpenAI, Playwright, humanize-writing, frontend-design, caveman e unslop rimangono pacchetti originali secondo i pin del manifest. |

L'installer mantiene checkout completi, inclusi licenze, helper e riferimenti; per percorsi relativi complessi considera la directory fisica della skill. Non esegue gli script di setup dei framework né installa hook di un plugin nativo. Una skill a catalogo non prova che il runtime offra browser, subagenti, generazione immagini o un servizio esterno.

Il TDD Matt usa il ciclo red/green e colloca il refactoring nella review `code-review`; Superpowers ha `test-driven-development`. Non applicare contemporaneamente due cicli al medesimo task. Non modificare gli originali per nascondere differenze metodologiche. Istruzioni, scope, autorizzazioni e limiti economici del progetto restano prioritari: esempi, rubriche o «rulings» upstream non autorizzano nuove decisioni di prodotto, costi o modifiche esterne.

`zoom-out` è stato ritirato nell'upstream Matt: l'esplorazione del codice resta una capacità dell'agente. La copia isolata di `office-hours` è ritirata perché dipende dal runtime gstack; non è sostituita con un altro framework. La checklist di rete rimasta in Homelab è dichiarata derivato locale, non «upstream ECC puro».

## Inventario corrente

97 nomi distinti: **66 originali globali diretti, 30 skill locali/derivate, 1 originale importato limitato a Baialupo**. Le copie omonime nei progetti sono state ritirate; la presenza nel catalogo non equivale a installazione sulla macchina dell'utente.

### Globali

| Skill | Fonte | Scopo |
|---|---|---|
| `analyze-data-quality` | `openai/role-specific-plugins` — diretto | Affidabilità dei dati. |
| `api-and-interface-design` | `addyosmani/agent-skills` — diretto | Contratti e interfacce. |
| `ask-skills` | `derivato locale di Matt Pocock` | Selezione multi-catalogo, senza riscrivere i processi. |
| `brainstorming` | `obra/superpowers` — diretto | Design proporzionato: Spike, Bounded o Architectural. |
| `browser-testing-with-devtools` | `addyosmani/agent-skills` — diretto | Verifica browser con DevTools disponibili. |
| `build-dashboard` | `openai/role-specific-plugins` — diretto | Dashboard e scorecard. |
| `build-report` | `openai/role-specific-plugins` — diretto | Report analitici. |
| `caveman` | `JuliusBrussee/caveman` — diretto | Stile di risposta essenziale. |
| `code-review` | `mattpocock/skills` — diretto | Review Matt su standard e specifica. |
| `code-review-and-quality` | `addyosmani/agent-skills` — diretto | Review di correttezza, qualità, sicurezza e performance. |
| `code-simplification` | `addyosmani/agent-skills` — diretto | Semplificazione senza variazione del comportamento. |
| `codebase-design` | `mattpocock/skills` — diretto | Vocabolario di moduli, interfacce e testabilità. |
| `create-data-context` | `openai/role-specific-plugins` — diretto | Contesto semantico dei dati. |
| `deprecation-and-migration` | `addyosmani/agent-skills` — diretto | Ritiro e migrazione di comportamenti esistenti. |
| `design-kpis` | `openai/role-specific-plugins` — diretto | Definizione di KPI. |
| `diagnosing-bugs` | `mattpocock/skills` — diretto | Diagnosi Matt con loop riproducibile. |
| `dispatching-parallel-agents` | `obra/superpowers` — diretto | Delega di indagini indipendenti quando utile. |
| `documentation-and-adrs` | `addyosmani/agent-skills` — diretto | Documentazione e decisioni architetturali. |
| `domain-modeling` | `mattpocock/skills` — diretto | Glossario e decisioni di dominio. |
| `executing-plans` | `obra/superpowers` — diretto | Esecuzione di un piano senza subagenti. |
| `finishing-a-development-branch` | `obra/superpowers` — diretto | Verifica e integrazione finale del branch. |
| `frontend-design` | `anthropics/skills` — diretto | Design visuale frontend. |
| `frontend-ui-engineering` | `addyosmani/agent-skills` — diretto | Interfacce, design system, stati e accessibilità. |
| `gather-business-context` | `openai/role-specific-plugins` — diretto | Contesto della domanda di business. |
| `grill-with-docs` | `mattpocock/skills` — diretto | Intervista documentale esplicitamente richiesta. |
| `grilling` | `mattpocock/skills` — diretto | Decisioni per round secondo le dipendenze. |
| `handoff` | `mattpocock/skills` — diretto | Contesto trasferibile tra sessioni. |
| `humanize-writing` | `jpeggdev/humanize-writing` — diretto | Revisione della naturalezza del testo. |
| `idea-refine` | `addyosmani/agent-skills` — diretto | Chiarimento di idee e alternative. |
| `improve-codebase-architecture` | `mattpocock/skills` — diretto | Analisi degli attriti architetturali. |
| `interview-me` | `addyosmani/agent-skills` — diretto | Chiarimento dell’intento. |
| `jupyter-notebooks` | `openai/role-specific-plugins` — diretto | Notebook riproducibili. |
| `kpi-reporting` | `openai/role-specific-plugins` — diretto | Rendicontazione KPI. |
| `market-sizing` | `openai/role-specific-plugins` — diretto | Dimensionamento del mercato. |
| `metric-diagnostics` | `openai/role-specific-plugins` — diretto | Diagnosi dei movimenti delle metriche. |
| `performance-optimization` | `addyosmani/agent-skills` — diretto | Ottimizzazione guidata da misure. |
| `planning-and-task-breakdown` | `addyosmani/agent-skills` — diretto | Scomposizione del lavoro. |
| `playwright` | `openai/skills` — diretto | Browser reale tramite CLI. |
| `product-business-analysis` | `openai/role-specific-plugins` — diretto | Analisi di prodotto e business. |
| `prototype` | `mattpocock/skills` — diretto | Esperimento throwaway. |
| `reality-check` | `locale` | Riconciliazione della baseline e del drift. |
| `receiving-code-review` | `obra/superpowers` — diretto | Valutazione tecnica dei feedback. |
| `report-to-google-doc` | `openai/role-specific-plugins` — diretto | Conversione di report in Docs/DOCX. |
| `report-to-google-slides` | `openai/role-specific-plugins` — diretto | Conversione di report in Slides. |
| `report-to-pdf` | `openai/role-specific-plugins` — diretto | Conversione di report in PDF. |
| `requesting-code-review` | `obra/superpowers` — diretto | Preparazione della review. |
| `research` | `mattpocock/skills` — diretto | Ricerca source-backed secondo il runtime upstream. |
| `resolving-merge-conflicts` | `mattpocock/skills` — diretto | Risoluzione dei conflitti preservando l’intento. |
| `security-and-hardening` | `addyosmani/agent-skills` — diretto | Sicurezza applicativa e integrazioni. |
| `setup-matt-pocock-skills` | `mattpocock/skills` — diretto | Configurazione del contesto richiesto dai flussi Matt. |
| `source-driven-development` | `addyosmani/agent-skills` — diretto | Verifica delle API sulle fonti ufficiali. |
| `subagent-driven-development` | `obra/superpowers` — diretto | Esecuzione di piani con worker e review. |
| `systematic-debugging` | `obra/superpowers` — diretto | Diagnosi prima del fix. |
| `tdd` | `mattpocock/skills` — diretto | Testing comportamentale Matt. |
| `teach` | `mattpocock/skills` — diretto | Percorso didattico persistente. |
| `test-driven-development` | `obra/superpowers` — diretto | Ciclo TDD Superpowers. |
| `to-spec` | `mattpocock/skills` — diretto | Sintesi della conversazione nel tracker. |
| `to-tickets` | `mattpocock/skills` — diretto | Scomposizione in ticket verificabili. |
| `triage` | `mattpocock/skills` — diretto | Classificazione di issue, bug e richieste prima della pianificazione. |
| `ui-depth-preview` | `locale` | Preview del layering senza costruire un’app temporanea. |
| `unslop` | `theclaymethod/unslop` — diretto | Revisione della prosa. |
| `using-git-worktrees` | `obra/superpowers` — diretto | Isolamento del lavoro. |
| `using-superpowers` | `obra/superpowers` — diretto | Ingresso e adattamento del pacchetto Superpowers. |
| `validate-data` | `openai/role-specific-plugins` — diretto | QA delle analisi. |
| `verification-before-completion` | `obra/superpowers` — diretto | Evidenze prima della conclusione. |
| `visualize-data` | `openai/role-specific-plugins` — diretto | Visualizzazione di dati. |
| `wayfinder` | `mattpocock/skills` — diretto | Risoluzione di iniziative multi-sessione. |
| `writing-plans` | `obra/superpowers` — diretto | Piano implementativo da requisiti definiti. |
| `writing-skills` | `obra/superpowers` — diretto | Creazione e verifica di skill. |

Le 16 skill operative OpenAI Data Analytics restano allo stesso pin. Il router interno `index` non è installato come skill globale: il catalogo mantiene nomi non ambigui.

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

`seo-audit` resta in `projects/baialupo/seo-audit`: `coreyhaines31/marketingskills@5b2c0007766c6a1cf1d53fd8fc73e979e0821022`, versione 2.0.1, con i due riferimenti e la licenza MIT originali. Gli altri moduli marketing citati non sono installati. Le indicazioni SEO devono essere confrontate con le fonti correnti di Google, non assunte come normative immutabili.

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

Esamina e poi applica il ritiro delle vecchie voci globali:

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

`renovate.json` configura il regex manager nativo con datasource `git-refs`: la versione da osservare è `HEAD` del repository remoto, il valore da aggiornare è lo SHA completo (`currentDigest`). `HEAD` segue il branch predefinito upstream; non è un riferimento mobile usato dall'installer. Anche un cambio del branch predefinito produce soltanto una proposta da revisionare.

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

I test deterministici includono il contratto TSV/regex, con righe adiacenti, terminatori LF/CRLF, nomi dei repository e raggruppamento. Richiedono Node.js 22 oltre agli strumenti già usati dal repository. Quando cambiano manifest, configurazione Renovate o workflow, la stessa CI esegue il validatore ufficiale e una scansione nativa `--platform=local --dry-run=lookup`, quindi verifica con Git la presenza dei file `SKILL.md` non vuoti ai pin dichiarati, recuperando ogni repository una sola volta. Revisioni miste dello stesso upstream fanno fallire il controllo. Se il confronto Git non è disponibile, i controlli vengono eseguiti anziché saltati.

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
| Copertura e gap | Manifest e installer già impongono SHA precisi. Il validatore locale verifica il formato, non la disponibilità remota dei percorsi; il vecchio trigger non avviava le verifiche sulle PR dei pin. |
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
