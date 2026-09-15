# Adozione del collegamento seriale per codex-skills

**Stato: Active**

## Autorità e incarico

La [missione Homelab #1265](https://github.com/skunklabs-uk/homelab/issues/1265), approvata dal Product Owner, estende l’adozione del collegamento ai 32 repository inventariati. Questo incarico riguarda soltanto le istruzioni README di `skunklabs-uk/codex-skills`. Non cambia il catalogo, le skill, i pin upstream o le installazioni personali.

Leggi integralmente la RFC-0001 corrente fornita dal parent e `AGENTS.md`. La richiesta verificata dal parent contiene branch, head, assignment e generation: usa quella revisione senza ricostruire i parametri da GitHub. Non avviare altri consumer o processi modello.

## Fonti da leggere nel checkout

- `README.md`, per catalogo, ownership, installazioni e verifiche esistenti.
- `config/global-skill-upstreams.tsv`, per distinguere i pin approvati dalle installazioni effettive.
- `global/ask-skills/SKILL.md`, per il percorso di selezione delle capability.
- `.github/workflows/validate-skills.yml`, per trigger e verifiche producer effettivi.

Il runbook autorevole del collegamento è [WORKSPACE-HANDOFF.md](https://github.com/skunklabs-uk/developer-workspace/blob/main/docs/WORKSPACE-HANDOFF.md); enrollment e lifecycle runtime appartengono al [README Homelab](https://github.com/skunklabs-uk/homelab/blob/main/gitops/apps/developer-workspace/README.md). Usa questi rimandi nel README; non interrogare fonti esterne dalla sandbox. Il parent fornisce gli estratti operativi correnti necessari insieme alla RFC.

## Modifica richiesta

Modifica soltanto `README.md`, aggiungendo una sezione breve in italiano sull’uso del collegamento seriale per questo repository. Conserva catalogo, ownership, istruzioni di installazione e manutenzione. La sezione deve spiegare:

1. Un incarico richiede repository e thread ammessi, branch/head esatti e prompt corrente; un solo consumer seriale lavora nel checkout isolato. Catalogo disponibile e skill effettivamente installate sono osservazioni distinte.
2. Un report non pubblica modifiche. Il percorso write richiede `publish_paths` con file esatti e una PR Draft nello stesso repository: il parent pubblica, il coordinatore rilegge SHA e diff remoto e completa RETURN. Il child non esegue commit, push, merge o rollout.
3. L’adozione documentale non aggiorna manifest, pin, skill o istruzioni globali e non installa nulla nel runtime personale. Le procedure esistenti mantengono la propria ownership; leggere un esempio di installazione non autorizza a eseguirlo.
4. Le verifiche appartengono al producer. Descrivi il workflow effettivo: PR fidate verso `main` e push a `main` sui percorsi configurati, incluso README; controlli shell, struttura e test deterministici. I controlli upstream condizionali e il test di installazione isolato in CI non provano un’installazione personale o il comportamento del modello. Rimanda alla sezione esistente senza duplicarne i comandi.
5. Questo repository distribuisce istruzioni e strumenti, non un servizio HTTP: la preview Kubernetes non è applicabile a questo incarico README. Restano necessarie la CI applicabile e la consegna reale con RETURN.
6. Rimanda ai due runbook proprietari per enrollment, selezione GitOps, recupero e stato persistente. Non copiare configurazioni operative, credenziali o un catalogo dei progetti nel README.

Non dichiarare completati CI, pubblicazione, review finale, merge o adozione runtime di questo incarico. Il parent acquisirà la prova di consegna dopo il risultato; il coordinatore completerà il closeout e rimuoverà questo prompt prima del merge terminale.

## Confini e verifica

- Scrittura consentita soltanto in `README.md`; nessuna modifica a skill, manifest, pin, installer, test, workflow, AGENTS o policy centrali.
- Nessuna rete dei comandi, installazione, sincronizzazione, pruning, esecuzione di helper o test degli installer, credenziale, API esterna o filesystem fuori dal checkout.
- Nessun nuovo test per documentazione non consumata da codice.
- Confronta la nuova sezione con le fonti lette e verifica che il diff riguardi soltanto `README.md`. Esegui una review tecnica e della chiarezza; usa `humanize-writing` soltanto se disponibile nel perimetro, senza installarla o fingere una review indipendente.

Restituisci in italiano: modifica effettuata, fonti e head esaminato, verifiche realmente eseguite, limiti e passaggi spettanti al coordinatore. Non inventare risultati CI, URL di risultato o commit di pubblicazione.
