---
name: prosignal-troubleshooting
description: "Usa per indagare errori, blocchi o avanzamento dei processi ProSignal, correlando OutSystems, API, worker, database e file."
---

# Troubleshooting ProSignal

Prima consulta `docs/current-process-evidence.md#checkpoint-corrente`, `docs/guida-team-os.md` e la diagnostica in `docs/local-development.md`. Verifica ambiente, revisione e risorse effettive: gli esempi storici non sono configurazione corrente.

## Correlazione

1. Dall'ambiente OutSystems interessato leggi il processo e i suoi FileUpload. Registra `ProcessId`, `ControlVersionId`, data, `FileUploadId`, `FileId` e `RunId`; verifica versioni e collegamenti attivi. Non confondere il numero nel percorso S3 con il ProcessId senza riscontro.
2. Nei log API individua il `SUBMIT` del file e correla body, ora, `TraceId`, risposta e RunId. I valori redatti non sono prova del payload completo. Distingui la chiamata UI al servizio OutSystems dalla chiamata backend. `TraceId` identifica la richiesta, non la run.
3. Con il RunId controlla `STATUS`, database e log worker nello stesso ambiente e nella finestra temporale pertinente. HTTP 200 su STATUS prova soltanto la risposta alla consultazione; HTTP 202 accetta il lavoro, non ne prova il completamento. Non cercare gli errori soltanto nei log API: il worker può registrare eccezioni senza RunId; la sola prossimità temporale è una correlazione da dichiarare, non una prova certa.
4. Riporta fase, percentuale, contatori, errore completo, ora UTC e fonte. Se mancano diagnostica o correlazione, dichiaralo; non attribuire errori di altre run. Una schermata, un log e il database possono riferirsi a versioni o momenti diversi.

## Configurazione e workbook

Per `OS_CONFIGURATION_INVALID`, segui il dettaglio e verifica i mapping attivi della specifica versione del controllo, tipo e campi del tracciato, template e metadati. Confronta i valori esatti, inclusi maiuscole e spazi iniziali o finali. Il profilo Servizi richiede otto mapping di misure; `INFO_SERV_PAG` è un campo del tracciato, non una misura da mappare. Confronta i nomi dei fogli con il workbook effettivamente fissato alla run; il template corrente può essere diverso dalla base storica. Verifica byte e SHA-256 prima di attribuire un file alla run.

La schermata può visualizzare valori trasformati o non salvati: confronta il valore persistito e le versioni, poi ispeziona il codice OutSystems o il payload di rete prima di spiegare la differenza. Non assumere che un 409 mostrato dalla UI coincida con lo status backend senza correlazione.

Usa letture in sola lettura per la diagnosi; non rilanciare SUBMIT, modificare dati o configurazioni, né distribuire codice senza autorizzazione. Non pubblicare credenziali o URL firmati. Indica fatti e relative fonti separatamente dalle deduzioni e dalle ipotesi. Un output presente non dimostra correttezza del workbook o confronto post-Excel.
