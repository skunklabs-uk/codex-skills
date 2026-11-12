# Collegare OMP al MCP nativo di n8n

**Stato:** collegamento OMP operativo; job-06 pinned e job-07 end-to-end verificati. Browserless è distribuito via GitOps e il rendering da n8n è verificato: ArgoCD era `Synced/Healthy` alla revisione `0581de8219b459933b72c1225b6e7446ee508da1`; il run `52923` ha restituito HTML 200 senza override. Job Radar resta `BLOCKED`: il browser non è integrato in job-06 e le fonti canoniche/ATS non sono state valutate dal flusso.
**Ultima verifica:** 12 novembre 2026.
**Responsabile:** coordinatore della missione n8n Action Brief.

## Soluzione

Usare dal **developer workspace 1** il MCP nativo già attivo nell'istanza n8n. Riutilizzare l'endpoint e la variabile della configurazione Codex esistente; provare prima la discovery OMP, aggiungendo una definizione OMP solo se necessaria.

```text
OMP nel workspace 1
  → HTTP MCP con autenticazione Bearer
  → http://n8n.apps.svc.cluster.local:5678/mcp-server/http
  → istanza n8n esistente
```

Non occorrono nuove istanze, workflow, adapter npm, tunnel WSL, port-forward o modifiche RBAC. Il MCP `aeris-mcp` usa DBHub ed è estraneo a n8n: le precedenti indicazioni su `cluster-connect.sh mcp` erano errate per questa missione.

Il percorso interno usa HTTP nella rete Kubernetes già prevista da Homelab. Non estenderlo a reti esterne e non pubblicarlo senza una valutazione separata di autenticazione e TLS. Il dominio pubblico `n8n.skunklabs.uk` resta protetto da Cloudflare Access.

## Evidenze disponibili

| Verifica | Esito | Evidenza |
|---|---|---|
| Service n8n interno | SÌ | Manifest `apps/n8n`, ClusterIP, porta 5678; `/healthz` ha risposto HTTP 200 dal workspace corrente |
| Percorso di rete previsto | SÌ | La NetworkPolicy del developer workspace consente egress verso i namespace del cluster |
| Configurazione preesistente sul workspace 1 | SÌ | `~/.codex/config.toml`, sezione `mcp_servers.n8n`, abilitata |
| Credenziale disponibile sul workspace 1 | SÌ | `N8N_MCP_API_KEY` presente nella login shell; valore non stampato |
| Autenticazione MCP | SÌ | `initialize` dal workspace 1: HTTP 200, `n8n MCP Server` versione MCP `1.2.0` |
| Discovery | SÌ | `tools/list` riuscito, senza pagina successiva; presenti ricerca, lettura, aggiornamento, validazione e test dei workflow |
| Ricerca job-07 | SÌ | `Homelab - Articolo del Sabato`, ID `dba6Vp7MA1FhN3KH`, descrizione riferita a `job-07`, `availableInMCP: true` |
| Identificazione job-06 | SÌ | `Homelab - Job Radar`, ID `qgjh8AV3hgdy9LYV`; selettore incorporato `chiave: 'job-06'`, individuato dall'agente RepairJob06 |
| Corrispondenza con il run storico 48661 | SÌ | Lettura live: workflow `dba6Vp7MA1FhN3KH`, modalità manual, stato error, 8 novembre 2026 07:03:30–45 UTC |
| Collegamento nel client OMP | SÌ | Client reale sul workspace 1: discovery connessa e `search_workflows` restituisce job-07. `/mcp test n8n` restituisce invece 401: discrepanza del comando diagnostico, non della chiamata operativa |
| Test e consegna | Verificati | Job-06 pinned `52901` success; job-07 end-to-end `52906` success e un invio Slack verificato. Il Job Radar resta funzionalmente `BLOCKED`: il successo del test non equivale all'accettazione funzionale |

La versione `1.2.0` identifica il server MCP, non la versione applicativa n8n. La sola discovery non dimostra permessi di modifica né esiti dei test.

### Evidenze della ripresa applicativa dell'11 novembre

- Job-06, bozza `f0909a9b-0e71-4104-bdce-71fad9245ea7`: nessun errore riprodotto nel validator dei nove nodi; nessuna correzione speculativa. Il coordinatore ha eseguito il test pinned `51772`, concluso `success`, con loader, Gmail, policy GitHub e notificatore esplicitamente pinned. Risultato: un alert sintetico, policy caricata, stato applicativo `BLOCKED`. Il test non dimostra il completamento del Job Radar: il codice corrente dichiara mancanti verifica ATS/browser, profilo/CV e candidature.
- Job-07: l'articolo del run storico esiste ed è stato letto direttamente. Il difetto era l'assenza dell'URL diretto fra le citazioni del risultato di ricerca, non l'inesistenza della fonte. La bozza `74b605ae-a0af-4239-bb17-f533b5f8d570` richiede ora l'apertura della pagina esatta; il validator rigoroso resta invariato. Il test pinned `51775` produce `article_found`, data nel periodo e `citationVerified: true`.
- Il test manuale live `51773` si è fermato nel nodo `Cerca articolo e fonti`: `Authentication Error, Invalid API key provided.` Il coordinatore ha verificato il log LiteLLM delle `06:25:27.155615297Z`: la chiave presentata non esiste nel database del gateway. Non è provata la causa della sua assenza; non è un errore OAuth del provider.
- Durante le prove precedenti era disabilitato soltanto il sender della bozza job-07, poi ripristinato. Queste prove non hanno invocato Slack. Le versioni indicate nella diagnosi precedente sono state successivamente superate.

### Reality-check dell'11 novembre, 14:09 UTC

- I workflow sono stati modificati e pubblicati dopo la verifica precedente. Job-06 è sulla revisione attiva `13fb924e-0376-4b31-a7f4-7649b572e502`. Il nuovo pinned `51797` è riuscito su tale revisione, con loader, Gmail, GitHub, LLM e due nodi Slack pinned. L'output resta `BLOCKED`: mancano verifica ATS/browser e fonti profilo/CV e candidature.
- Job-07 è pubblicato alla revisione `a41588df-a84f-4bbc-b27c-5b1bb280aa3e`, con correzione dell'URL diretto e modello `gpt-6.1-terra`. Queste modifiche precedono il reality-check corrente.
- Run `51777` e `51779`: HTTP 400 per modello `ai-standard` non valido. Run `51780`: `success` parziale, terminato prima della ricerca. Il precedente 401 non dimostrava lo stato della credenziale aggiornata.
- Il gateway corrente elenca `gpt-6.1-terra`; il test manuale `51795`, con solo sender della bozza disabilitato, è riuscito attraversando ricerca e validator. Ha restituito `article_found` e `citationVerified: true`. La pagina [CNCF](https://www.cncf.io/blog/2026/11/08/lima-v2-3-native-on-windows-vmnet-on-linux-and-menu-tui/) conferma titolo, autore `audra`, data 8 novembre e contenuto.
- Dopo il test, il coordinatore ha consegnato **una sola volta** il brief risultante al canale esistente tramite Slack/Composio e ne ha verificato il [permalink](https://skunklabs-uk.slack.com/archives/C0CFLLUGLFP/p1794406387389209). Non è stato invocato il notificatore n8n: la prova verifica la ricerca live e una consegna separata, non un end-to-end interamente attraverso il nodo Slack del workflow.
- Sender ripristinato nella bozza `0ca36fa3-e39a-4d62-8b3a-ab03484e352a`; versione pubblicata `a41588df-a84f-4bbc-b27c-5b1bb280aa3e` invariata. Non è stata pubblicata la modifica temporanea.
- Verifica successiva in sola lettura: il notificatore condiviso n8n ha eseguito con successo il run integrato `51794` alle 10:30 UTC, includendo invio e recupero del [permalink](https://skunklabs-uk.slack.com/archives/C0CFLLUGLFP/p1794393003635279). È prova del componente su un'altra esecuzione, non della sua invocazione dal run job-07 `51795`.
- Prova manuale completa job-07 `51799`: `success`, dalla ricerca al notificatore condiviso e Slack, con `article_found` e `citationVerified: true`. [Fonte arXiv](https://arxiv.org/abs/2611.08116) verificata direttamente: titolo, cinque autori e data 5 novembre 2026 corrispondono al brief. [Permalink del messaggio nativo](https://skunklabs-uk.slack.com/archives/C0CFLLUGLFP/p1794430319857989). È una seconda notifica, distinta dal brief CNCF già consegnato tramite Composio.

Il vault resta `locked`, ma non costituisce un blocco per il percorso di ricerca verificato dal run `51795`. Non sono note la causa e le eventuali modifiche intervenute sulla credenziale fra i run.

### Reality-check del 12 novembre

- Il run storico `48661` non aveva pubblicato su Slack. Job-06: il test pinned `52901` è riuscito; il blocco precedente era dovuto al Data Table mancante nel workflow condiviso `pocPromptLoader20261107`, non a un validator specifico di job-06. Le 12 righe sono state ricostruite dall'ultima esecuzione riuscita `52893`; la tabella `homelab_action_brief_prompts_recovered` è stata creata e il loader aggiornato e pubblicato (`ec53d216-4c27-4957-8838-adb86875042a`). Il risultato job-06 rimane `BLOCKED` per ATS/browser e fonti profilo/CV/candidature; il test pinned non ha dimostrato il completamento funzionale del Job Radar.
- Job-07: la ricerca live ha trovato la pagina CNCF diretta. Il run `52904` ha fermato il flusso prima di Slack perché il validator rifiutava un titolo reale di 190 caratteri con limite 180. Il limite è stato portato a 240; il manual run `52906` è riuscito end-to-end sulla revisione pubblicata `9cc9dca9-1178-48d1-8373-386a7715a60a`. Slack ha ricevuto un solo messaggio dopo il successo; permalink: https://skunklabs-uk.slack.com/archives/C0CFLLUGLFP/p1794508831144549.
- Il workflow job-07 usato è `dba6Vp7MA1FhN3KH`; job-06 è `qgjh8AV3hgdy9LYV`. Nessun workflow duplicato è stato creato. Non sono stati inviati messaggi Slack durante diagnosi o test falliti.

## Procedura passo passo

### 1. Aprire il terminale del workspace 1

Usare l'accesso già configurato al developer workspace 1 e l'utente `coder`. Eseguire i comandi seguenti **dentro quel workspace**, non nella WSL, nel workspace 2/3 o in un servizio cloud.

```bash
hostname
whoami
cd /workspaces/codex-skills
bash --login
```

Il pod associato al workspace 1 nell'inventario Homelab è `developer-workspace-0`. La home e l'ambiente dei worker non sono intercambiabili. Un file sotto `/workspaces` può essere condiviso; questo non rende condivise le credenziali nella home o nell'ambiente.

Per diagnosi remote il coordinatore può usare il playbook esistente `/workspaces/.wkexec/command.yml` con `--limit developer-workspace-1`. Il wrapper `wkexec` esegue invece su tutti i worker: non usarlo indiscriminatamente per modificare configurazioni. Il playbook usa il modulo Ansible `command`; pipeline e sequenze richiedono esplicitamente `bash -lc`.

### 2. Verificare configurazione e segreto senza mostrarlo

```bash
python3 - <<'PY'
import os
import pathlib
import tomllib

path = pathlib.Path.home() / '.codex/config.toml'
server = tomllib.loads(path.read_text())['mcp_servers']['n8n']
assert server['url'] == 'http://n8n.apps.svc.cluster.local:5678/mcp-server/http'
assert server.get('enabled', True)
assert server['bearer_token_env_var'] == 'N8N_MCP_API_KEY'
assert os.environ.get('N8N_MCP_API_KEY'), 'Token assente nella shell corrente'
print('Endpoint e riferimento al token verificati; segreto non mostrato')
PY
```

Il controllo confronta la configurazione esistente; non la modifica. La definizione Codex osservata è equivalente a:

```toml
[mcp_servers.n8n]
url = "http://n8n.apps.svc.cluster.local:5678/mcp-server/http"
bearer_token_env_var = "N8N_MCP_API_KEY"
enabled = true
```

Se il token manca, verificare di essere nella login shell del workspace 1. Non stampare `env`, non copiare il token nella chat e non inserirlo nel JSON. Non confondere questo token MCP con una API key della REST API n8n (`X-N8N-API-KEY`). Non ruotarlo per risolvere un problema di discovery: la rotazione invalida il token usato dagli altri client.

### 3. Controllare la raggiungibilità interna

```bash
curl --silent --show-error --connect-timeout 3 --max-time 8 \
  --output /dev/null --write-out 'HTTP %{http_code}\n' \
  http://n8n.apps.svc.cluster.local:5678/healthz
```

Atteso: `HTTP 200`. Non serve `kubectl port-forward`: il client raggiunge direttamente un Service consentito dalla rete del workspace. Il diniego RBAC sul port-forward non impedisce questo percorso e non deve essere rimosso.

### 4. Provare il riuso della configurazione Codex in OMP

Dalla stessa shell, avviare OMP con il profilo usato dalla missione:

```bash
omp --profile personal
```

Nel client OMP eseguire:

```text
/mcp reload
/mcp list
/mcp test n8n
```

OMP documenta la discovery delle definizioni Codex. Se `n8n` è presente, punta all'endpoint interno e il test riesce, **saltare il passo 5**. Conservare la configurazione già funzionante.

Se risulta disabilitato, individuare da `/mcp list` la fonte effettiva e l'eventuale voce `disabledServers`; non eliminare denylist o definizioni di altri server. Riabilitare soltanto `n8n`, se il blocco è un residuo della configurazione precedente e non una policy intenzionale.

### 5. Solo se il riuso non funziona: aggiungere la definizione OMP

Il file del profilo `personal` è:

```text
/home/coder/.omp/profiles/personal/agent/mcp.json
```

Prima di modificarlo, salvarne una copia privata e annotare il nome del backup:

```bash
umask 077
cfg="$HOME/.omp/profiles/personal/agent/mcp.json"
backup="${cfg}.before-n8n.$(date -u +%Y%m%dT%H%M%SZ)"
cp -- "$cfg" "$backup"
chmod 600 "$backup"
printf 'Backup: %s\n' "$backup"
```

Aggiungere **solo** la proprietà `n8n` alla mappa `mcpServers`. Conservare `$schema`, `composio`, gli altri server e le impostazioni esistenti. Il frammento da integrare è:

```json
{
  "n8n": {
    "type": "http",
    "url": "http://n8n.apps.svc.cluster.local:5678/mcp-server/http",
    "headers": {
      "Authorization": "Bearer ${N8N_MCP_API_KEY}"
    }
  }
}
```

Il testo `${N8N_MCP_API_KEY}` deve restare letterale nel file: OMP lo risolve dall'ambiente del proprio processo. Non usare un heredoc non quotato che espanda il segreto durante la scrittura. Non aggiungere un secondo server con un nome diverso: la definizione OMP nativa `n8n` ha precedenza su quella importata da Codex.

Controllare la sintassi senza stampare la configurazione:

```bash
python3 - <<'PY'
import json
import pathlib
path = pathlib.Path.home() / '.omp/profiles/personal/agent/mcp.json'
server = json.loads(path.read_text())['mcpServers']['n8n']
assert server['type'] == 'http'
assert server['url'] == 'http://n8n.apps.svc.cluster.local:5678/mcp-server/http'
assert server['headers']['Authorization'] == 'Bearer ${N8N_MCP_API_KEY}'
print('Definizione OMP valida; token non incorporato nel JSON')
PY
```

Ripetere `/mcp reload`, `/mcp list` e `/mcp test n8n`. Se OMP era stato avviato prima che il token fosse disponibile, chiudere e riaprire il client dalla shell corretta: il reload non importa retroattivamente l'ambiente di un'altra shell.

### 6. Verificare le capability senza eseguire workflow

Controllare che OMP esponga almeno:

- `search_workflows`, `get_workflow_details`, `get_workflow_execution`;
- `update_workflow`, `validate_workflow`, `validate_node_config`;
- `prepare_workflow_pin_data`, `test_workflow`, `execute_workflow`.

Questi nomi sono stati osservati nel `tools/list` live. I prefissi mostrati dal client possono differire. Leggere gli schemi correnti prima di qualsiasi chiamata: `validate_workflow` valida codice Workflow SDK, non automaticamente il JSON esportato.

La prova funzionale in sola lettura è `search_workflows` con:

```json
{"query":"job-07","limit":50}
```

Atteso secondo la verifica corrente: ID `dba6Vp7MA1FhN3KH`. Leggere poi i dettagli con il contratto esposto dal tool e confrontare descrizione, nodi e riferimenti della missione. Una preview non basta: i dettagli richiedono anche accesso applicativo e `Available in MCP`.

Per job-06 cercare anche per nome funzionale, progetto e descrizione. La mancata corrispondenza del nome `job-06` non prova che il workflow sia assente. Non clonare, importare o creare workflow per superare questo passaggio.

### 7. Esito dei test e blocco funzionale residuo

I criteri originari per job-06 e job-07 sono stati eseguiti: il test pinned `52901` è riuscito; la ricerca live job-07 è stata verificata, il validator corretto sulla causa riproducibile e il test manuale end-to-end `52906` è riuscito. Nessun workflow duplicato è stato creato. Slack è stato invocato una sola volta dopo il successo, mai durante diagnosi o prove fallite.

Il Job Radar funzionale resta `BLOCKED`: browser ATS e fonti canoniche (profilo/CV/candidature) non sono accessibili e verificati dal runtime n8n. Non rimuovere il gate né dichiarare completato il radar sulla base del test pinned.

La procedura di collaudo sopra non autorizza a ripetere test già riusciti o a inviare altri messaggi Slack. Per nuove esecuzioni verificare prima la revisione attiva, lo schema del tool e gli effetti dei nodi.

## Diagnosi circoscritta

| Sintomo | Azione |
|---|---|
| DNS interno non risolto / timeout | Verificare il worker di esecuzione e Service/rete; non aprire route pubbliche o cambiare RBAC |
| Redirect Cloudflare | È stato usato il dominio pubblico; nel workspace usare l'endpoint interno verificato |
| `401` MCP | Controllare presenza del token nell'ambiente del processo OMP e header Bearer; non rigenerare credenziali automaticamente |
| `403` o workflow non leggibile | Verificare permessi n8n e `Available in MCP` per quel workflow; non esporre indiscriminatamente tutti i workflow |
| Server assente da OMP | Controllare profilo, fonte della configurazione, JSON e denylist; applicare il passo 5 solo se necessario |
| Healthcheck riuscita ma discovery fallita | Controllare `/mcp-server/http`, autenticazione e trasporto `http`; la healthcheck non verifica MCP |
| Discovery riuscita ma test pinned fallito | Il collegamento è operativo: diagnosticare il validator o il workflow, senza cambiare tunnel o credenziali |

## Ripristino

Se è stato applicato il passo 5, rimuovere soltanto la definizione OMP `n8n` aggiunta e ripristinare gli eventuali override modificati. Usare il backup completo solo se nel frattempo nessuno ha cambiato altre voci; altrimenti integrare selettivamente. Eseguire `/mcp reload`. La configurazione Codex preesistente rimane intatta.

Non revocare il token condiviso con Codex, non disabilitare il MCP nell'istanza e non toccare workflow o stato published per annullare una modifica al client.

## Coda recuperabile e criterio di chiusura

| Priorità | Attività / responsabile | Stato | Dipendenza | Accettazione e prossima azione |
|---|---|---|---|---|
| P1 | Collegamento nel client / coordinatore | Verificato | Shell workspace 1 con token | Discovery e ricerca job-07 eseguite dal client OMP; nessuna modifica alla configurazione necessaria |
| P1 | Identità job-06 e run storico / coordinatore | Identificati | Tool read-only disponibili | ID job-06 comunicato da RepairJob06; associazione run 48661 verificata dal coordinatore |
| P2 | Validator e pinned job-06 / coordinatore | Test pinned riuscito; Job Radar bloccato | Loader condiviso e input pinned | Run `52901` success; il precedente errore proveniva dalla tabella prompt mancante, ripristinata e loader pubblicato. L'accesso ATS/browser e le fonti canoniche restano non verificati |
| P2 | Ricerca articolo job-07 / coordinatore | Verificata e corretta | Fonte live accessibile | Pagina CNCF diretta trovata; il validator ora accetta il titolo reale di 190 caratteri |
| P3 | Consegna Slack / coordinatore | Verificata dopo successo | Test end-to-end riuscito | Una pubblicazione nel run `52906`; permalink verificato |
| P3 | End-to-end n8n completo / coordinatore | Verificato | Validator corretto e sender attivo | Run manuale `52906` success dalla ricerca a Slack sulla revisione `9cc9dca9-1178-48d1-8373-386a7715a60a` |
| P1 | Sblocco funzionale Job Radar / coordinatore | Bloccato | Browser integrato in job-06 e fonti applicative accessibili dal runtime n8n | Il test pinned `52901` passa e Browserless renderizza una pagina pubblica; l'output applicativo resta `BLOCKED`. Non rimuovere il gate senza prove ATS e fonti canoniche. |
| P1 | Accesso fonti e gate ATS / coordinatore | Parzialmente verificato | Integrazione workflow e decisione sul trattamento dati | Lettura GitHub career-lab e smoke Browserless `52923` verificati. `APPLICATION_LOG.md`, `applications/`, `profile/` e `cv/` non sono letti dal workflow; nessun URL ATS è verificato nel flusso job-06. |
| P1 | Browser runtime / coordinatore | Verificato | Deployment GitOps e smoke senza override | PR [#2156](https://github.com/skunklabs-uk/homelab/pull/2156), [#2158](https://github.com/skunklabs-uk/homelab/pull/2158), [#2159](https://github.com/skunklabs-uk/homelab/pull/2159) e [#2160](https://github.com/skunklabs-uk/homelab/pull/2160) integrate. ArgoCD era `Synced/Healthy` alla revisione `0581de8219b459933b72c1225b6e7446ee508da1`, Deployment con `HOME=/tmp`. Run `52923`: `/active` 204, POST `/content` 200 con HTML `Example Domain`, senza Slack né override per-request. |
| P1 | Integrazione browser e fonti in job-06 / coordinatore | In attesa di decisione PO | Autorizzazione al trattamento delle fonti professionali nel modello | LiteLLM mappa `gpt-6.1-terra` a `chatgpt/gpt-6.1-terra` ([configurazione](https://github.com/skunklabs-uk/homelab/blob/main/gitops/apps/litellm/configmap.yaml#L27-L30)). Includere CV, profilo e storico candidature nel prompt trasferirebbe dati personali al provider ChatGPT. Non modificare job-06 per inviare questi contenuti finché il PO non approva l'ambito o indica un modello con confine dati approvato. |
| P2 | Allineamento calendario job-06 / coordinatore | Decisione prodotto richiesta | `RADAR_POLICY.md` prevede ogni giorno alle 08:15 Europe/Rome; il trigger live è settimanale martedì/giovedì/sabato alle 18:00, senza timezone esplicito nel workflow | Non modificare il calendario finché l’utente non sceglie tra policy giornaliera, trigger corrente o manuale. |
| P1 | Pubblicazione pianificata job-07 / coordinatore | Decisione prodotto richiesta | `dba6Vp7MA1FhN3KH` è attivo con trigger weekly il sabato alle 09:00 Europe/Rome e sender Slack; il run `52906` ha pubblicato, mentre la descrizione dice che non pubblica | Confermare se l’invio Slack automatico settimanale è voluto. Fino ad allora non cambiare trigger, descrizione o sender. |

Browserless OSS è il runtime scelto e distribuito via GitOps, con utente non-root, root filesystem read-only, Service interno e NetworkPolicy limitata. Il precedente tentativo di riuso SSH è stato sostituito da questa soluzione verificata.

Reality-check live/GitOps del 12 novembre: ArgoCD `n8n` era `Synced/Healthy` alla revisione `0581de8219b459933b72c1225b6e7446ee508da1`; `job-radar-browser` includeva `HOME=/tmp`. Run `52920`: POST `/content` 200 `text/html` con variabili XDG per-request sotto `/tmp/.chromium`. Run `52923`: GET `/active` 204 e POST `/content` 200 con HTML `Example Domain`, senza override per-request. Entrambi erano manuali e senza Slack. I run `52914`, `52917` e `52918` precedenti al fix hanno restituito HTTP 500; il log di `52917` mostra `chrome_crashpad_handler: --database is required`. Il runbook Homelab è aggiornato con PR [#2164](https://github.com/skunklabs-uk/homelab/pull/2164), merge `98b58d1184fb52a13ca631612152fc8333c3b7ec`. I due workflow temporanei sono archiviati; nessuna patch cluster, modifica RBAC o lettura Secret.

La coda è uno stato recuperabile, non un processo persistente in background. La capability Browserless di base è verificata; Job Radar resta aperto finché job-06 non integra browser, fonti canoniche e gate ATS. Prima di trasmettere CV, profilo o storico candidature al modello serve l’approvazione del PO. Le differenze di calendario job-06 e pubblicazione automatica job-07 richiedono anch’esse una decisione prodotto.

## Fonti e revisione

- [RFC-0001 corrente](https://github.com/skunklabs-uk/agent-os/blob/main/rfcs/RFC-0001-principles.md).
- [Homelab: Service n8n](https://github.com/skunklabs-uk/homelab/blob/main/gitops/apps/n8n/service.yaml) e [NetworkPolicy workspace](https://github.com/skunklabs-uk/homelab/blob/main/gitops/apps/developer-workspace/networkpolicy.yaml), riscontrati anche nel checkout locale `homelab-nexus-1898`.
- Configurazione effettiva del workspace 1: `/home/coder/.codex/config.toml`, sezione `mcp_servers.n8n`; token conservato soltanto nel meccanismo preesistente.
- [OMP: discovery, profili, header e reload](https://github.com/can1357/oh-my-pi/blob/main/docs/mcp-config.md).
- [n8n: MCP nativo e permessi](https://docs.n8n.io/connect/connect-to-n8n-mcp-server.md) e [reference dei tool](https://docs.n8n.io/connect/connect-to-n8n-mcp-server/mcp-server-tools-reference.md).

Non sono stati modificati i workflow job-06/job-07 né inviati messaggi Slack durante le diagnostiche. I due workflow temporanei Browserless sono archiviati; non sono state create credenziali o route pubbliche. La capability browser di base è verificata, ma Job Radar resta incompleto finché non passano integrazione, fonti canoniche e gate ATS. Restano le decisioni prodotto su trattamento dati, calendario job-06 e pubblicazione automatica job-07.
