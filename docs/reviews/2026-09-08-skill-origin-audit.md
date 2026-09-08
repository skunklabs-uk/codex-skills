# Audit delle skill: esito della razionalizzazione

**Stato:** Archived — audit concluso; non è un nuovo workflow operativo.
**Data:** 2026-09-08.
**PR:** #49.
**Baseline:** `1eaeea4b4e23dfc6dac223c3a2dc30bee443bba2`.
**Implementazione esaminata:** `f501987d3dbdbc5bd16d737f973365214464e70b`, tree `c804295c1c38f4bde227c48c2b458d2c5bd1357b`.

Le fonti operative restano [README](../../README.md), manifest, istruzioni del progetto e singole skill. Il [rapporto iniziale](https://github.com/skunklabs-uk/codex-skills/blob/ac2bdf8f842fc8775c99e9571cbace4b75e0353f/docs/reviews/2026-09-08-skill-origin-audit.md) conserva la proposta precedente. Questo documento registra esiti e limiti, non prescrive nuovi gate.

## Esito

La baseline aveva 125 voci di catalogo e 105 nomi distinti: 19 originali diretti, 59 copie/derivati di origine esterna e 47 voci etichettate locali. Il risultato ha **97 nomi univoci: 66 originali globali diretti, 30 skill locali/derivate e un originale importato limitato a Baialupo**. Nessuna copia omonima di un originale diretto resta nei progetti.

La richiesta finale dell'utente corregge due decisioni: `gemini-presentation-handoff` viene eliminata; `reality-check` viene mantenuta perché il confronto fra documentazione e realtà non è sostituito dalla sola lettura delle fonti. Sui 47 casi iniziali gli esiti finali sono 8 KEEP, 20 REDUCE, 11 REPLACE e 8 DELETE. I numeri coincidenti con la prima proposta non significano che le due decisioni siano rimaste identiche.

Le modifiche di catalogo e sorgenti sono implementate nella revisione indicata. Installazione sui computer, copie precedentemente incollate in altri workspace e prove comportamentali nel runtime Codex non fanno parte delle evidenze eseguite qui. Non è dichiarata una migrazione personale completata.

## Perché reality-check resta locale

| Campo | Evidenza e decisione |
|---|---|
| Requisito | Il lavoro deve partire da una baseline verificata, preservando la distinzione tra stato approvato, documentato, implementato e osservato. Richiesta esplicita dell'utente e RFC-0001, sezioni 4–7. |
| Failure mode | Una skill legge una fonte Active superata e trasforma quello stato in premessa operativa; oppure riscrive il requisito per farlo coincidere con un difetto del codice. |
| Evidenza concreta | La vecchia skill backup assumeva Google Drive, mentre il runbook Homelab descrive una migrazione R2 approvata ma con prove runtime ancora aperte. La vecchia `baia-publish` imponeva `featured: 1` e build applicativa per contenuti editoriali, in contrasto con l'AGENTS corrente del sito. |
| Alternative | Lettura delle fonti, esplorazione iniziale del design, `source-driven-development`, documentazione/ADR e debugging upstream. Sono utili, ma nessuna delle alternative esaminate copre da sola la riconciliazione delle quattro baseline. `source-driven-development` verifica principalmente API e documentazione tecnica ufficiale. |
| Gap | Una fonte recente o Active non prova un deploy; codice esistente non autorizza a cambiare un requisito; un manifest non prova salute, trasferimento o recuperabilità live. |
| Beneficio verificabile | Esporre il delta pertinente prima di pianificare; classificare drift documentale, difetto implementativo, drift di deploy o evidenza mancante; chiedere una decisione solo quando l'intento non è ricostruibile. |
| Perimetro e costo | Una skill breve, senza runner, stati persistenti, tracker, contatore, report obbligatorio o nuova intervista. Evidenza runtime solo disponibile e autorizzata in lettura. |
| Lifecycle | Mantenuta nel catalogo locale dal maintainer; reversibile in Git. Da sostituire quando un originale qualificato copre lo stesso contratto senza perdere autorizzazioni e distinzione fra bug e drift. |

La correzione documentale si applica soltanto quando autorizzata e determinata. Un conflitto di prodotto o architettura resta una decisione umana. La mancanza di accesso al runtime viene dichiarata, non colmata con operazioni live non richieste.

Scenari verificati **per ispezione**, non con un modello indipendente: documento vecchio con decisione approvata più recente; implementazione difforme da requisito valido; Git aggiornato senza prova di deploy; runtime non accessibile; decisione concorrente non risolta; assenza di discrepanze pertinenti. La skill distingue questi casi e non impone un audit generale per una modifica circoscritta.

## Esiti delle 47 voci originariamente etichettate locali

I percorsi identificano i casi della baseline. DELETE elimina la skill autonoma, non gli invarianti trasferiti; REDUCE conserva soltanto contesto o contratto specifico, senza creare una nuova wrapper-skill.

| Percorso | Esito | Destinazione o contratto conservato |
|---|---|---|
| `global/agent-loop` | REPLACE | Esecutori originali Superpowers; autonomia, costi e stop restano nella policy del progetto. Non un drop-in per qualunque operazione live. |
| `global/code-debt-review-loop` | REPLACE | `improve-codebase-architecture` e, quando pertinente, `deprecation-and-migration`; nessuna nuova catena obbligatoria. |
| `global/gemini-presentation-handoff` | DELETE | Rimozione richiesta dall'utente; nessun sostituto locale. |
| `global/grill-with-docs` | REPLACE | Originale Matt con `grilling` e `domain-modeling` allo stesso pin. |
| `global/reality-check` | KEEP | Riconciliazione della baseline e del drift; motivazione sopra. |
| `global/scrittura-comica` | DELETE | Nessun contratto specifico: tono nel prompt, non una skill mantenuta. |
| `global/senior-implementation-discipline` | DELETE | Disciplina di design, test e review upstream; autorizzazioni nella policy. |
| `global/ui-depth-preview` | KEEP | Preview del solo layering senza implementazione temporanea; bundle invariato. |
| `projects/baialupo/baia-publish` | KEEP | Contratto editoriale, asset, eventi e cautela aeronautica; riallineato al percorso editoriale attuale. |
| `projects/cantieri-protetti-ai/grill-with-docs` | REPLACE | Originale globale; copia di progetto ritirata. |
| `projects/cap-aeris/diagnose` | REPLACE | Originale Matt `diagnosing-bugs`; non concatenato alla diagnosi Superpowers. |
| `projects/cap-aeris/grill-with-docs` | REPLACE | Originale globale; convenzioni restano nel progetto. |
| `projects/cap-aeris/grill-with-screenshots` | REDUCE | Assessment-only, compito primario, P07/socio/velivolo, stati mancanti e limiti degli screenshot. |
| `projects/cap-aeris/tdd` | REPLACE | Originale Matt e dipendenza `code-review`; niente TDD di progetto duplicato. |
| `projects/cap-aeris/update-docs` | REDUCE | Fonti CAP protette, syntheses/questions e convenzioni linguistiche. |
| `projects/cap-aeris/write-tests` | REDUCE | Pratiche, permessi, revisioni ed immutabilità; metodo di testing upstream. |
| `projects/homelab/grill-with-docs` | REPLACE | Originale globale; le decisioni infrastrutturali restano nei runbook. |
| `projects/homelab/homelab-app-onboarding` | REDUCE | Ownership dell'app, database, reflection, esposizione e Homepage. |
| `projects/homelab/homelab-backup-restore` | KEEP | Sorgente/destinazione, custodia, prefissi, prova di trasferimento distinta dal restore; nessuna falsa attestazione R2 live. |
| `projects/homelab/homelab-ceph-storage-operations` | REDUCE | Ownership e protezione di OSD/PVC/prefissi; verifica Kubernetes e backend. |
| `projects/homelab/homelab-cloudflare-operations` | REDUCE | Confine OpenTofu/tunnel GitOps e coerenza DNS/Access/route. |
| `projects/homelab/homelab-gateway-routes` | REDUCE | Contratto HTTPRoute e default espliciti contro drift; nessun IP live congelato. |
| `projects/homelab/homelab-gitops-operations` | KEEP | Revisione Argo, SOPS, osservazioni live e rollback; assorbite protezioni PVC/writer/CRD. |
| `projects/homelab/homelab-implementation-planning` | REPLACE | Piano upstream quando necessario; verifiche live e rollback nel runbook/piano corrente. |
| `projects/homelab/homelab-kubernetes-operations` | DELETE | Eliminato il secondo processo operativo; invarianti pertinenti conservati nel contesto GitOps. |
| `projects/homelab/homelab-observability-operations` | REDUCE | Label Alloy, caricamento config, dati osservati e ownership dashboard. |
| `projects/homelab/homelab-opentofu-terraform` | REDUCE | Confini Harbor/Cloudflare/GitOps e strumenti nativi OpenTofu; nessun framework o reconciler aggiunto. |
| `projects/homelab/homelab-proxmox-operations` | REDUCE | Quorum, console, restore e dipendenze K3s. |
| `projects/homelab/homelab-review-and-debt` | REDUCE | Lente di rischio operativo, non un secondo motore di audit o backlog automatico. |
| `projects/homelab/homelab-secret-management` | KEEP | Eccezioni bootstrap, SOPS, reflection e rotazione con rollout; niente stampa indiscriminata dei Secret. |
| `projects/iwant/frontend-design-review` | REPLACE | Originali `frontend-design` e `frontend-ui-engineering`; copia generica ritirata. |
| `projects/kong/read-vdo-hour-meter` | KEEP | Contratto LCD/decimi/valori incerti/readings.yml; intero bundle invariato. |
| `projects/obsidian/organize-obsidian-wiki` | REDUCE | Vault sorgente protetto, workspace derivato, permessi, raw notes e conflitti preservati. |
| `projects/powerpoint/business-case-storyline` | REDUCE | Cinque sezioni commerciali e ponte POC, subordinati al brief e alle fonti attuali. |
| `projects/powerpoint/commercial-deck-quality-review` | REDUCE | Unica review commerciale contro brief e fonti; integrità tecnica separata. |
| `projects/powerpoint/deck-visual-grounding` | REDUCE | Riferimento scelto, asset reali e libertà creativa, senza palette duplicate. |
| `projects/powerpoint/executive-slide-writing` | DELETE | Preferenze executive nel brief e nella storyline esistente. |
| `projects/powerpoint/grill-with-docs` | REPLACE | Originale globale quando serve l'intervista, non per ogni slide. |
| `projects/powerpoint/powerpoint-deck-production` | DELETE | Consolidata nella manipulation; conservati riuso dei media, editabilità e confronto con repair reale. |
| `projects/powerpoint/powerpoint-manipulation` | REDUCE | Unico ingresso tecnico; delega a grounding e validazione senza duplicarli. |
| `projects/powerpoint/pptx-package-validation` | KEEP | Integrità OPC, relazioni e geometrie; rimosse normalizzazioni XML/topologie universali non dimostrate. |
| `projects/powerpoint/pptx-quality-review` | DELETE | Consolidata nella review commerciale; risolta la contraddizione root/cartella. |
| `projects/powerpoint/pptx-template-extraction` | DELETE | Ispezione template già coperta da grounding/manipulation. |
| `projects/powerpoint/proposal-intake` | REDUCE | Scope, impegni, economics e riuso riservato; niente nuova intervista di rito. |
| `projects/powerpoint/repo-to-deck-brief` | REDUCE | Cosa fa e produce la POC, prove e limiti; niente quindici capitoli obbligatori. |
| `projects/powerpoint/software-delivery-estimation` | REDUCE | Range motivati; effort distinto da prezzo, roadmap distinta da piano. |
| `projects/powerpoint/wbs-generation` | REDUCE | Deliverable entro lo scope e reference commerciale verificata; nessun albero a quattro livelli imposto. |

## Altre famiglie e distribuzione

Le 59 copie/derivati di origine esterna della baseline sono state trattate insieme ai loro riferimenti, non copiate una seconda volta. Le copie globali e di progetto Superpowers, Matt e Addy sono sostituite da originali pinned. `ask-skills` resta un derivato ridotto per il catalogo multi-upstream; non riscrive il processo. Playwright e humanize-writing sono diretti. `zoom-out` è ritirata nell'upstream Matt; la copia `office-hours` richiedeva il runtime gstack e non resta come skill isolata.

La provenienza delle checklist di rete Homelab non era sufficientemente pin-nata per dichiararle originali ECC: il residuo è dichiarato locale, limitato a management-plane, console e rollback. Le copie generiche `network-config-validation` e `security-review` sono ritirate; la sicurezza generale usa Addy. `seo-audit` resta l'importazione MIT scoped al sito, senza globalizzare marketing. Non sono state introdotte copie della skill PPTX con licenza restrittiva.

La famiglia Superpowers ora include i suoi 14 ingressi/dipendenze; Matt ne ha 18 e Addy 13. I checkout completi preservano helper, prompt, licenze e riferimenti relativi. Il manifest non dimostra la presenza nel runtime di browser, subagenti o servizi esterni. L'installer non installa hook di plugin né risolve dipendenze di una selezione parziale.

Le differenze metodologiche sono dichiarate nel README: TDD/review Matt non si sovrappone al ciclo Superpowers; i «rulings» e le regole di prosecuzione upstream non superano autorizzazioni, costi e decisioni di prodotto governate dal progetto. Il metodo resta pubblico, non viene riscritto dentro nuove wrapper.

## Installer: necessità e verifica

L'adozione diretta rende necessari due invarianti già previsti: un'unica sorgente e nessuna copia omonima che la nasconda. Eseguendo gli script preesistenti su fixture reali sono stati riprodotti sette fallimenti: backup ancora nella discovery globale/di progetto; symlink di progetto ritirati ancora installati; reimportazione di originali e nomi eliminati; pruning distruttivo di una directory reale; validator che accettava copie di progetto. Il test del pin Git locale era già valido.

Sono stati corretti i cinque script esistenti, senza un nuovo installer, database, resolver o workflow. I backup vanno fuori dalla discovery; il pruning è reversibile; `--replace` tratta solo i vecchi symlink interrotti di cui riconosce la sorgente; la sync non reimporta upstream o ritirati, neppure con `--force`; il validator respinge copie di progetto di originali diretti.

La prova è `scripts/test-skill-lifecycle.sh`: filesystem temporanei, comandi Bash reali e repository Git locale. Sulla baseline gli otto casi danno **7 FAIL e 1 PASS**; sull'implementazione **8 PASS**. Testano gli effetti osservabili, non stringhe interne o il comportamento dei framework. I limiti delle installazioni reali/estranee restano espliciti nel README; nessuna pulizia indiscriminata dei computer.

## Verifiche e closeout

| Verifica | Esito ed evidenza |
|---|---|
| Payload pubblicato | SÌ: hash Git ricalcolati dei 42 file scritti e delle sottostrutture mantenute; l'intero tree coincide con `c804295c1c38f4bde227c48c2b458d2c5bd1357b`. Le 64 directory ritirate nel passo finale non sono rimaste come copie. |
| Catalogo e YAML | SÌ: validator eseguito su 31 directory locali e 66 definizioni upstream. Per Kong e SEO sono stati materializzati solo i frontmatter invariati; i bundle remoti completi sono preservati tramite identità degli alberi Git. |
| Test locali | SÌ: tutti i tre script `test-*.sh` eseguiti; lifecycle 8/8, UI-depth-preview e percorsi pubblici Baia superati. UI e riferimenti materializzati identici agli originali. Sintassi Bash dei file materializzati valida. |
| Fonti aggiornate | SÌ: README, manifest, pruning e skill interessate allineati. Vecchio workflow a gate fissi e istruzioni di distribuzione archiviati; le istruzioni specifiche dei repository destinatari non sono state sovrascritte. |
| Proporzionalità | SÌ: 97 nomi senza duplicati di progetto; nessun nuovo framework o wrapper generico. Il solo nuovo test protegge failure mode riprodotti negli script esistenti. |
| Review | SÌ per revisione tecnica e linguistica sequenziale; non viene dichiarata una review di un subagente indipendente. |
| CI sulla PR | NON APPLICABILE: il workflow attuale parte su push a main, non su PR. Il suo stato dopo l'integrazione è osservabile nella PR/Actions; non sono stati richiesti rerun. |
| Installazione di rete e runtime personale | Non eseguite: il clone nell'ambiente di lavoro era impedito dalla risoluzione DNS. Verificati pin e distribuzione con ispezione e fixture Git locale, non una prima installazione dalla rete. |
| Modello, deploy, restore e PowerPoint | Non eseguiti: nessun benchmark comportamentale Codex, operazione sui consumer, restore o apertura nel programma PowerPoint. Non sono prove necessarie per dichiarare una modifica alle sole sorgenti del catalogo, ma non se ne deducono esiti runtime. |

## Fonti principali

- [RFC-0001](https://github.com/skunklabs-uk/agent-os/blob/main/rfcs/RFC-0001-principles.md), v0.1.9, blob `a428d2bd28ce830217a0dcafd170fc769c68242c`.
- [Superpowers](https://github.com/obra/superpowers/tree/b36e0829c6d0140e93cfef2ca599b1b07d4a7797), [Matt](https://github.com/mattpocock/skills/tree/3cca18b368ae95cdbdebbff572ccafa662551015), [Addy](https://github.com/addyosmani/agent-skills/tree/6ca0cd7db39b41b1c37e26d335c507ee92382c6d): sorgenti originali, cataloghi, licenze e istruzioni esaminate. I pin completi delle altre famiglie sono nel manifest.
- [Runbook rclone Homelab](https://github.com/skunklabs-uk/homelab/blob/7e3762bf6b2dfacb81e37a85f0a73614d3ac7bf3/gitops/apps/rclone/README.md), blob `6a5928c3aea70a5d9d7cb7e2d7614e2fac44a091`: distinzione migrazione approvata/prove runtime.
- [AGENTS Baialupo](https://github.com/skunklabs-uk/baialupo.com/blob/main/AGENTS.md), blob osservato `efa976c5f4ded238c4d6b4f05beadc5e354d51e1`: featured legacy, percorso editoriale e prova della revisione servita.
- [AGENTS PowerPoint](https://github.com/skunklabs-uk/powerpoint-ai/blob/main/AGENTS.md) e [reference.1.md](https://github.com/skunklabs-uk/powerpoint-ai/blob/main/docs/reference.1.md), quest'ultima blob `6cfab91b732b3799d05b28a5a5bad7bb5db5930d`: cartella della presentazione, storyline commerciale e WBS proporzionata.

Il catalogo è razionalizzato; il prossimo utilizzo locale richiede aggiornamento del checkout, migrazione delle installazioni effettivamente presenti e riavvio di Codex secondo il README. Questo è setup dell'ambiente destinatario, non una dichiarazione di lavoro eseguito da GitHub.
