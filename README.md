# Codex Skills

**Stato:** Active

Repository canonico delle skill Codex locali e delle skill globali consumate direttamente dai repository upstream originali.

- `global/`: skill riusabili mantenute localmente, installate in `$CODEX_HOME/skills`.
- `config/global-skill-upstreams.tsv`: mapping delle skill globali installate direttamente dagli upstream originali a commit pinned.
- `projects/<project-name>/`: skill legate a un progetto, installate in `.agents/skills`.

## Struttura

```text
global/
  skill-name/
    SKILL.md
    agents/openai.yaml   # metadati UI opzionali
    scripts/             # helper deterministici opzionali
    references/          # contesto caricato su richiesta
    assets/              # template o file binari opzionali
config/
  global-skill-upstreams.tsv
projects/
  project-name/
    skill-name/
      SKILL.md
scripts/
  install-local.sh
  install-project.sh
  list-installed.sh
  sync-from-codex.sh
  validate-skills.sh
```

## Fonti autorevoli e lifecycle documentale

- `global/` e `projects/` contengono le fonti operative autorevoli delle skill mantenute localmente.
- `config/global-skill-upstreams.tsv` è la fonte autorevole per le skill globali consumate direttamente dagli upstream originali; per queste skill il contenuto autorevole resta nel repository e nel commit indicati dal manifest e non viene vendorizzato qui.
- [`global/ask-skills/SKILL.md`](global/ask-skills/SKILL.md) è la fonte autorevole per il routing generale; le singole `SKILL.md` governano il comportamento dettagliato.
- Questo README è il catalogo pubblico dello stato corrente. Le skill rimosse scompaiono dall'inventario e restano tracciate nella cronologia Git e nel `CHANGELOG.md`.
- `AGENTS.md` e la RFC-0001 attiva governano il repository. Piani, specifiche e review sotto `docs/` dichiarano il proprio stato e, quando `Archived`, valgono solo come evidenza storica.

Le skill elencate in `config/global-skill-upstreams.tsv` non devono avere copie o fork locali in `global/` o `projects/`. Un derivato intenzionale richiede una decisione esplicita e deve avere identità e scopo distinti dall'upstream originale.

## Scelta delle skill

Usa [`ask-skills`](global/ask-skills/SKILL.md) per scegliere tra i cataloghi, non per imporre una sequenza di framework. La skill selezionata governa il proprio processo; le istruzioni attive del progetto restano vincolanti.

`brainstorming` è consumata direttamente da Superpowers: distingue Spike, Bounded e Architectural. Per una modifica Bounded prevede design e approvazione in chat, senza file di specifica o piano. La precedente infografica di routing è ritirata; non rappresenta più il processo corrente.

`grill-with-docs`, `grilling` e `domain-modeling` provengono dallo stesso commit Matt Pocock. `grill-with-docs` richiede invocazione esplicita; l'attuale `grilling` raggruppa le domande indipendenti per round. Le skill definiscono il metodo, mentre glossario, ADR e limiti di scope restano nelle fonti autorevoli del progetto.

## Inventario

### Globali

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `agent-loop` | locale | Coordina explorer, main agent, worker e reviewer per task autonomi bounded. |
| `analyze-data-quality` | `openai/role-specific-plugins` (upstream diretto) | Valuta se dati, query, dashboard e definizioni metriche sono abbastanza affidabili da usare. |
| `ask-skills` | derivato locale di `mattpocock/skills` | Seleziona tra cataloghi e skill di progetto senza duplicare i workflow. |
| `brainstorming` | `obra/superpowers` (upstream diretto) | Chiarisce intento, requisiti e design prima di modificare comportamento. |
| `build-dashboard` | `openai/role-specific-plugins` (upstream diretto) | Costruisce dashboard e scorecard source-backed con metriche, filtri, gerarchia visuale e QA. |
| `build-report` | `openai/role-specific-plugins` (upstream diretto) | Produce report analitici durevoli con narrativa answer-first, evidenze, visual, caveat e fonti. |
| `caveman` | `JuliusBrussee/caveman` (upstream diretto) | Riduce al minimo parole e token. |
| `code-debt-review-loop` | locale | Individua e ordina debito tecnico, hotspot e refactor sicuri prima dell’implementazione. |
| `code-review-and-quality` | `addyosmani/agent-skills` | Revisiona correttezza, leggibilità, architettura, sicurezza e performance. |
| `code-simplification` | `addyosmani/agent-skills` | Semplifica codice funzionante senza cambiarne il comportamento. |
| `codebase-design` | `mattpocock/skills` | Progetta moduli profondi, interfacce piccole e seam puliti. |
| `create-data-context` | `openai/role-specific-plugins` (upstream diretto) | Crea e mantiene semantic layer con definizioni metriche, fonti autorevoli e caveat riusabili. |
| `design-kpis` | `openai/role-specific-plugins` (upstream diretto) | Definisce KPI, driver, guardrail, target e piani di misurazione. |
| `domain-modeling` | `mattpocock/skills` (upstream diretto) | Definisce termini, relazioni, invarianti e decisioni di dominio. |
| `frontend-design` | `anthropics/skills` (upstream diretto) | Guida il design visuale distintivo e intenzionale delle interfacce frontend. |
| `gather-business-context` | `openai/role-specific-plugins` (upstream diretto) | Raccoglie il contesto di business necessario prima dell’analisi. |
| `grill-with-docs` | `mattpocock/skills` (upstream diretto) | Intervista su piani e design e aggiorna ADR e glossario tramite le skill upstream collegate. |
| `grilling` | `mattpocock/skills` (upstream diretto) | Intervista in profondità finché le ambiguità sono risolte. |
| `handoff` | `mattpocock/skills` | Compatta una sessione per consentire a un altro agente di continuarla. |
| `humanize-writing` | `jpeggdev/humanize-writing` | Rende il testo più naturale e meno artificiale. |
| `idea-refine` | `addyosmani/agent-skills` | Trasforma idee grezze in concetti chiari e azionabili. |
| `improve-codebase-architecture` | `mattpocock/skills` | Individua attriti architetturali e opportunità di refactor. |
| `interview-me` | `addyosmani/agent-skills` | Chiarisce il bisogno reale una domanda alla volta. |
| `jupyter-notebooks` | `openai/role-specific-plugins` (upstream diretto) | Crea notebook SQL o Python riproducibili, leggibili ed estendibili. |
| `kpi-reporting` | `openai/role-specific-plugins` (upstream diretto) | Trasforma metriche e driver in aggiornamenti KPI pronti per leadership e review operative. |
| `market-sizing` | `openai/role-specific-plugins` (upstream diretto) | Stima mercato o opportunità con assunzioni, sensibilità, incertezza e priorità di validazione. |
| `metric-diagnostics` | `openai/role-specific-plugins` (upstream diretto) | Diagnostica movimenti delle metriche distinguendo driver verificati, contributori probabili e incognite. |
| `office-hours` | `garrytan/gstack` | Valuta idee, focus e ambizione di prodotto con domande stile YC. |
| `playwright` | `openai/skills` | Automatizza browser reali con Playwright CLI. |
| `product-business-analysis` | `openai/role-specific-plugins` (upstream diretto) | Analizza domande di prodotto o business e produce raccomandazioni basate su evidenze. |
| `prototype` | `mattpocock/skills` | Crea prototipi throwaway per validare design, stato o UI. |
| `receiving-code-review` | `obra/superpowers` | Valuta feedback di review prima di applicarlo. |
| `report-to-google-doc` | `openai/role-specific-plugins` (upstream diretto) | Converte report analitici HTML esistenti in Google Docs o DOCX. |
| `report-to-google-slides` | `openai/role-specific-plugins` (upstream diretto) | Converte report analitici HTML esistenti in presentazioni Google Slides native. |
| `report-to-pdf` | `openai/role-specific-plugins` (upstream diretto) | Converte report e dashboard analitici esistenti in PDF. |
| `research` | `mattpocock/skills` | Ricerca con fonti primarie e salva risultati citati. |
| `requesting-code-review` | `obra/superpowers` | Prepara contesto e range per una review. |
| `resolving-merge-conflicts` | `mattpocock/skills` | Risolve conflitti ricostruendo l’intento delle versioni. |
| `setup-matt-pocock-skills` | `mattpocock/skills` | Configura tracker, label e layout richiesti dalle skill importate. |
| `systematic-debugging` | `obra/superpowers` | Diagnostica prima di proporre fix. |
| `tdd` | `mattpocock/skills` | Guida implementazioni e bugfix con red-green-refactor. |
| `teach` | `mattpocock/skills` | Gestisce percorsi didattici stateful con lezioni, fonti e learning record. |
| `to-spec` | `mattpocock/skills` | Trasforma la conversazione in una specifica pubblicabile. |
| `to-tickets` | `mattpocock/skills` | Divide piani e specifiche in ticket con dipendenze esplicite. |
| `triage` | `mattpocock/skills` | Classifica issue, bug e feature request. |
| `ui-depth-preview` | locale | Genera preview controllate del layering/depth di una UI esistente. |
| `unslop` | `theclaymethod/unslop` (upstream diretto) | Diagnostica e riscrive prose eliminando pattern tipici della scrittura AI senza perdere vincoli e contenuto. |
| `using-git-worktrees` | `obra/superpowers` | Isola feature work e piani complessi con git worktree. |
| `validate-data` | `openai/role-specific-plugins` (upstream diretto) | Esegue QA su analisi, calcoli, fonti, caveat e solidità delle conclusioni. |
| `verification-before-completion` | `obra/superpowers` | Richiede evidenze prima di dichiarare un lavoro completato. |
| `visualize-data` | `openai/role-specific-plugins` (upstream diretto) | Seleziona e rifinisce visualizzazioni con etichette, gerarchia e controlli di accessibilità. |
| `wayfinder` | `mattpocock/skills` | Pianifica lavori oltre una sessione tramite ticket di investigazione. |
| `writing-plans` | `obra/superpowers` | Scrive piani multi-step prima dell’implementazione. |
| `writing-skills` | `obra/superpowers` | Crea, modifica e verifica skill. |
| `zoom-out` | `mattpocock/skills` | Ricostruisce la mappa ad alto livello di codice e chiamanti. |

Le 16 skill operative del pacchetto OpenAI Data Analytics sono consumate direttamente da `openai/role-specific-plugins` e pinned allo stesso commit. Il router interno `plugins/data-analytics/skills/index` non viene installato come skill globale: espone il nome generico `index` ed è progettato per l’invocazione del plugin; il routing generale resta affidato a `ask-skills`.

### CAP Aeris

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `api-and-interface-design` | `addyosmani/agent-skills` | Progetta API, contratti e confini frontend/backend. |
| `browser-testing-with-devtools` | `addyosmani/agent-skills` | Verifica UI con DOM, console, network e runtime reale. |
| `deprecation-and-migration` | `addyosmani/agent-skills` | Gestisce rimozioni, migrazioni e sunset. |
| `diagnose` | locale CAP | Diagnostica con riproduzione, ipotesi, strumentazione e regressione. |
| `documentation-and-adrs` | `addyosmani/agent-skills` | Registra decisioni e ADR utili a sviluppatori e agenti. |
| `grill-with-screenshots` | locale CAP | Valuta UX, UI, responsività e accessibilità a partire da screenshot reali. |
| `improve-codebase-architecture` | `mattpocock/skills` | Individua attriti architetturali e refactor profondi. |
| `performance-optimization` | `addyosmani/agent-skills` | Ottimizza bottleneck misurati. |
| `planning-and-task-breakdown` | `addyosmani/agent-skills` | Divide requisiti in task ordinati e verificabili. |
| `prototype` | `mattpocock/skills` | Valida UI, stati e flussi con prototipi throwaway. |
| `security-and-hardening` | `addyosmani/agent-skills` | Rafforza input, sessioni, dati e integrazioni. |
| `source-driven-development` | `addyosmani/agent-skills` | Ancora le decisioni a fonti autorevoli. |
| `systematic-debugging` | `obra/superpowers` | Diagnostica prima di cambiare codice. |
| `tdd` | locale CAP | Applica red-green-refactor sulle interfacce pubbliche. |
| `triage` | `mattpocock/skills` | Classifica issue CAP prima che diventino lavoro. |
| `update-docs` | locale CAP | Aggiorna documentazione quando cambiano comportamenti o assunzioni. |
| `verification-before-completion` | `obra/superpowers` | Richiede verifiche concrete prima della chiusura. |
| `write-tests` | locale CAP | Aggiunge test coerenti con dominio e documentazione. |
| `writing-plans` | `obra/superpowers` | Produce piani prima dell’implementazione. |
| `zoom-out` | `mattpocock/skills` | Fornisce contesto su moduli, chiamanti e dominio. |

### Baialupo

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `baia-publish` | locale | Pubblica contenuti seguendo workflow editoriale, fonti, immagini ed eventi. |
| [`seo-audit`](projects/baialupo/seo-audit/SKILL.md) | `coreyhaines31/marketingskills` | Individua problemi SEO tecnici e di contenuto e ordina gli interventi per priorità. |

`seo-audit` è una skill di progetto per `baialupo.com`, non una skill globale. Sono importati `SKILL.md` e i due file in `references/` da [`skills/seo-audit` al commit `5b2c0007766c6a1cf1d53fd8fc73e979e0821022`](https://github.com/coreyhaines31/marketingskills/tree/5b2c0007766c6a1cf1d53fd8fc73e979e0821022/skills/seo-audit), versione 2.0.1. La [licenza MIT originale](projects/baialupo/seo-audit/LICENSE) è inclusa. Gli altri moduli marketing citati dalla skill non sono installati con questa importazione.

Per collegarla al checkout locale di Baialupo, eseguire dalla radice di `codex-skills`:

```bash
bash scripts/install-project.sh --no-global-agents baialupo /percorso/baialupo.com seo-audit
```

Il comando crea `.agents/skills/seo-audit` come symlink e lascia intatto l'`AGENTS.md` del progetto. Il collegamento va eseguito in ciascun checkout locale: il commit della sorgente non installa la skill sul computer dell'utente. Prima di usarla, leggere le fonti attive del progetto; le indicazioni SEO upstream vanno verificate contro la documentazione corrente di Google Search Central, non applicate come regole assolute. L'installazione non avvia audit, modifiche al sito o pubblicazioni.

### Cantieri Protetti AI

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `documentation-and-adrs` | `addyosmani/agent-skills` | Registra decisioni su dominio, payload, API, OCR, LLM e persistenza. |
| `security-and-hardening` | `addyosmani/agent-skills` | Protegge privacy, segreti, file, API e documenti sensibili. |
| `source-driven-development` | `addyosmani/agent-skills` | Ancora implementazioni a fonti tecniche aggiornate. |
| `systematic-debugging` | `obra/superpowers` | Diagnostica pipeline PDF, OCR, LLM, API e CLI. |
| `verification-before-completion` | `obra/superpowers` | Verifica test, lint, CLI e payload prima della chiusura. |

### Homelab

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `homelab-app-onboarding` | locale | Onboarding applicazioni con manifest, ArgoCD, SOPS, CNPG, routing e backup. |
| `homelab-backup-restore` | locale | Backup, restore e recovery drill. |
| `homelab-ceph-storage-operations` | locale | Ceph, CSI, RGW, RBD, PVC e bucket S3. |
| `homelab-cloudflare-operations` | locale | DNS, Access, Zero Trust e tunnel Cloudflare. |
| `homelab-gateway-routes` | locale | HTTPRoute, Gateway API, Traefik e ingress Cloudflare. |
| `homelab-gitops-operations` | locale | Modifiche GitOps, sync ArgoCD, Kustomize e verifiche live. |
| `homelab-implementation-planning` | locale | Piani di migrazione, rollout, rollback e commit strategy. |
| `homelab-kubernetes-operations` | locale | K3s, risorse, CRD, operatori, rollout, servizi e log. |
| `homelab-network-readiness` | `affaan-m/everything-claude-code` | Verifica rete, DNS, firewall e accesso remoto. |
| `homelab-observability-operations` | locale | Grafana, Loki, Prometheus, Alloy, dashboard e alerting. |
| `homelab-opentofu-terraform` | locale | OpenTofu per Cloudflare, Harbor e state. |
| `homelab-proxmox-operations` | locale | Proxmox, PBS, Ceph, VM/LXC, nodi e storage. |
| `homelab-review-and-debt` | locale | Review del repo per rischio, drift, sicurezza e debito tecnico. |
| `homelab-secret-management` | locale | SOPS, Age, token, credenziali e leak check. |
| `network-config-validation` | `affaan-m/everything-claude-code` | Valida indirizzi, subnet e rischi management-plane. |
| `security-review` | `affaan-m/everything-claude-code` | Controlla segreti, configurazioni, accessi e superfici esposte. |
| `systematic-debugging` | `obra/superpowers` | Diagnostica GitOps, Kubernetes, DNS, Cloudflare, monitoring e backup. |
| `verification-before-completion` | `obra/superpowers` | Verifica comandi, manifest, sync e stato cluster. |

### Obsidian

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `organize-obsidian-wiki` | locale | Organizza il vault senza modificarlo senza conferma. |
| `verification-before-completion` | `obra/superpowers` | Controlla link, duplicati, output e confini read-only. |

### Kong

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `read-vdo-hour-meter` | locale | Legge foto di orametri VDO e genera `readings.yml`. |

### iWant

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `frontend-design-review` | locale | Revisiona fedeltà visuale, struttura e comportamento dell'interfaccia. |

### PowerPoint

| Skill | Sorgente | Uso |
| --- | --- | --- |
| `business-case-storyline` | locale | Costruisce la storyline di un business case. |
| `commercial-deck-quality-review` | locale | Revisiona qualità e coerenza di un deck commerciale. |
| `deck-visual-grounding` | locale | Verifica il grounding visuale del deck rispetto alle fonti. |
| `executive-slide-writing` | locale | Scrive contenuti sintetici per slide executive. |
| `powerpoint-deck-production` | locale | Produce o modifica deck editabili e source-grounded. |
| `powerpoint-manipulation` | locale | Modifica presentazioni PowerPoint mantenendo il pacchetto editabile. |
| `pptx-package-validation` | locale | Valida struttura e integrità del pacchetto PPTX. |
| `pptx-quality-review` | locale | Revisiona storyline, grounding, coerenza visiva e deliverable. |
| `pptx-template-extraction` | locale | Estrae riferimenti e struttura da template PPTX. |
| `proposal-intake` | locale | Trasforma una richiesta commerciale in un input di produzione. |
| `repo-to-deck-brief` | locale | Converte evidenze di repository in un brief per deck. |
| `software-delivery-estimation` | locale | Stima lavoro e vincoli di una delivery software. |
| `wbs-generation` | locale | Genera una work breakdown structure verificabile. |

## Stato della razionalizzazione

La PR #49 applica una prima parte dell'[audit del 2026-09-08](docs/reviews/2026-09-08-skill-origin-audit.md): elimina `gemini-presentation-handoff` su richiesta dell'utente, insieme alle checklist globali `reality-check`, `senior-implementation-discipline` e `scrittura-comica`; migra `brainstorming` e le dipendenze di `grill-with-docs` agli originali; riduce `ask-skills` alla selezione.

La decisione dell'utente supera il precedente KEEP proposto per Gemini: sugli stessi 47 casi dell'audit gli esiti diventano **7 KEEP, 20 REDUCE, 11 REPLACE, 9 DELETE**. I conteggi descrivono le decisioni, non quante modifiche siano già state applicate. L'audit resta una proposta storica dello snapshot; il presente README e il manifest descrivono il catalogo operativo.

Restano da completare `agent-loop`, `code-debt-review-loop`, le altre famiglie esterne e le riduzioni di progetto indicate nell'audit, verificandone dipendenze e vincoli unici. Non sono stati modificati i repository destinatari, i deployment o le installazioni personali. La PR non equivale al completamento dell'intera razionalizzazione.

## Forma di una skill

Ogni skill vive in una directory con `SKILL.md` e frontmatter YAML:

```yaml
---
name: skill-name
description: Quando Codex deve usare questa skill.
---
```

`description` deve essere precisa: Codex la usa per decidere se attivare la skill. Riferimenti lunghi vanno in `references/`; helper deterministici in `scripts/`.

## Installazione

Skill globali:

```bash
scripts/install-local.sh
scripts/install-local.sh playwright grill-with-docs grilling domain-modeling
scripts/install-local.sh build-dashboard visualize-data
scripts/install-local.sh caveman unslop
scripts/install-local.sh --replace
```

Per le skill dichiarate in `config/global-skill-upstreams.tsv`, `install-local.sh` usa `git` per creare un checkout del repository originale in `$CODEX_HOME/upstream-skills/<skill-name>`, verifica il commit pinned e collega direttamente la directory che contiene `SKILL.md`. Il contenuto upstream non viene copiato in questo repository. Se una skill già installata passa da una copia locale a un upstream diretto, usare una volta `--replace` per sostituire il vecchio link.

Skill di progetto:

```bash
scripts/install-project.sh aeris /path/to/aeris
scripts/install-project.sh --replace aeris /path/to/aeris
```

Gli script usano symlink e non sovrascrivono directory reali. Con `--replace`, spostano prima le voci esistenti in backup con timestamp. Riavvia Codex dopo installazioni o modifiche.

Percorsi runtime:

- globali locali: `$CODEX_HOME/skills/<skill-name>` -> `global/<skill-name>`
- globali upstream: `$CODEX_HOME/skills/<skill-name>` -> `$CODEX_HOME/upstream-skills/<skill-name>/<skill-path>`
- progetto: `<project-root>/.agents/skills/<skill-name>`

### Migrazione delle installazioni esistenti

Il commit aggiorna il catalogo, non il computer dell'utente. Dopo il merge e l'aggiornamento del checkout, installare insieme le dipendenze del flusso:

```bash
bash scripts/install-local.sh --replace brainstorming grill-with-docs grilling domain-modeling
```

L'installer non risolve dipendenze transitive. `writing-plans`, già a catalogo, serve al percorso Architectural di `brainstorming`: verificare anche la sua disponibilità quando si sceglie quel percorso. Questa modifica non migra l'intero bundle Superpowers.

Prima di rimuovere vecchie installazioni, ispezionare `bash scripts/prune-local.sh --dry-run` e `config/global-skill-prune.txt`: la lista contiene anche rimozioni storiche, non soltanto questo intervento. Il comando senza `--dry-run` elimina le voci elencate; non va eseguito alla cieca su directory personalizzate.

Nei checkout CAP Aeris, Cantieri Protetti AI, Homelab e PowerPoint, controllare `.agents/skills/grill-with-docs`: `install-local.sh` non modifica questi collegamenti. Rimuovere soltanto i symlink che puntano alle copie ritirate in questo repository; una directory reale o un link a un'altra sorgente richiede confronto prima della rimozione. Spostare gli eventuali backup ancora validi fuori dalle directory di discovery delle skill, quindi riavviare Codex. La migrazione sul runtime personale non è stata eseguita da questa PR.

## Sincronizzazione e verifica

```bash
scripts/sync-from-codex.sh
scripts/validate-skills.sh
```
