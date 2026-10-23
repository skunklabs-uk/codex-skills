---
name: proposal-intake
description: "Usa per trasformare materiali commerciali in un brief senza inventare scope, economics, impegni o permessi di riuso."
---

# Intake proposta

Le istruzioni correnti di `skunklabs-uk/powerpoint-ai`, in particolare `AGENTS.md`, `.codex/deck-pipeline.md` e i materiali pertinenti `docs/reference*.md`, governano il lavoro. Riusare il brief esistente, non aprire una nuova raccolta informazioni quando l'utente ha già deciso.

Identifica pubblico e decisione attesa, perimetro, materiali disponibili, risultato, vincoli, maturità di tempi/costi e permessi di riuso. Cerca prima le risposte nelle fonti; documenti non raggiungibili sono mancanti, non da ricostruire con prosa plausibile.

Conserva nel brief anche i requisiti espliciti dell'utente assenti dai materiali sorgente: schema obbligatorio, navigatore della storyline quando richiesto, esclusioni e formato di consegna. Prima dell'handoff confronta il brief ricostruito con le richieste disponibili. Per una generazione indipendente includi questi vincoli nel pacchetto di input, senza richiedere al generatore di consultare la conversazione o i deck precedenti.

Chiedi soltanto informazioni che cambiano il deliverable corrente: identità quando indispensabile, obiettivo, scope, impegni, economics vincolante e confidenzialità. Dettagli minori possono restare aperti soltanto nel modo autorizzato dal progetto; le assunzioni ammesse devono essere visibili anche nel messaggio, non nascoste nelle note.

Restituisci un breve quadro di fatti, materiali, gap bloccanti e punti da validare. Non chiamare «approvazioni richieste» domande mai poste. L'intervista generica, quando necessaria, usa una skill upstream: questa conserva soltanto il contratto commerciale locale.
