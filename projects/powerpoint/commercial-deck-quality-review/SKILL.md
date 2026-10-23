---
name: commercial-deck-quality-review
description: "Usa per verificare un deck commerciale rispetto a brief approvato, fonti, obiettivo executive e convenzioni TXT/Novigo."
---

# Review commerciale del deck

Le istruzioni correnti di `skunklabs-uk/powerpoint-ai`, in particolare `AGENTS.md`, `.codex/deck-pipeline.md` e i materiali pertinenti `docs/reference*.md`, governano il lavoro. Usa la sequenza di critica/review/revisione linguistica effettivamente richiesta dal progetto; non sostituirla con un nuovo workflow o duplicare gli stessi riscontri.

Verifica copertura del brief, Contesto/Esigenza/Obiettivi e ponte POC quando richiesti; fonti e affermazioni; assunzioni, impegni ed economics; utilità per la decisione; leggibilità; assenza di slide ridondanti e rispetto della libertà creativa approvata.

Confronta il contributo dei messaggi nell'intera sequenza, non solo i titoli o la somiglianza delle parole. Per ogni ripetizione indica se aggiunge una prova, una decisione o un collegamento necessario; altrimenti proponi accorpamento o rimozione. Leggi il testo dal punto di vista dell'audience dichiarata: termini e dettagli tecnici devono avere una funzione comprensibile per quella decisione. Nelle coppie problemi/soluzioni controlla corrispondenze e significato delle frecce.

Confronta la resa con il riferimento selezionato: fedeltà stretta solo quando richiesta o per pattern formalmente vincolanti; altrove giudica messaggio, brand e chiarezza. Un materiale cliente di reference non autorizza il riuso dei suoi contenuti.

Usa il profilo di `deck-visual-grounding` come riferimento unico per i valori grafici. Controlla le slide renderizzate sia singolarmente sia nella sequenza e verifica nel PPTX gli aspetti che un'immagine non dimostra: placeholder, master/layout, stili effettivi, segmenti del titolo e delle enfasi, riempimenti e bordi con gradiente, collegamenti al tema, tabelle native e testo nel proprio oggetto. Verifica proporzioni delle immagini, leggibilità e capienza; una tabella nativa può comunque avere stile o dimensioni errati. Applica i requisiti generali a tutte le slide pertinenti, anche se il feedback li cita solo su alcune.

Associa le segnalazioni alla versione effettivamente recensita e al contenuto/oggetto indicato. Se numeri o nomi non coincidono con il file disponibile, segnala la discrepanza e non inventare una corrispondenza. Prosegui con le regole generali verificabili; non eliminare una slide soltanto perché occupa il numero citato. Se il rendering usa font sostitutivi, dichiarane il limite e non attestare fedeltà tipografica a PowerPoint.

La cartella della presentazione e le convenzioni di output sono quelle di `AGENTS.md`, non la root del repository per default. Delega integrità tecnica a `pptx-package-validation` senza replicare il validator. Distingui file tecnicamente valido, aspetto controllato e apertura PowerPoint verificata.

Riporta riscontri per gravità, slide/evidenza, impatto e correzione, poi incertezze e verifiche reali. Niente attestazione di completezza con grounding critico mancante; nessuna nuova sezione o cartella solo per riempire una checklist.
