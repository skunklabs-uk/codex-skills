---
name: commercial-deck-quality-review
description: "Usa per verificare un deck commerciale rispetto a brief approvato, fonti, obiettivo executive e convenzioni TXT/Novigo."
---

# Review commerciale del deck

Le istruzioni correnti di `skunklabs-uk/powerpoint-ai`, in particolare `AGENTS.md`, `.codex/deck-pipeline.md` e i materiali pertinenti `docs/reference*.md`, governano il lavoro. Usa la sequenza di critica/review/revisione linguistica effettivamente richiesta dal progetto; non sostituirla con un nuovo workflow o duplicare gli stessi riscontri.

Verifica copertura del brief, Contesto/Esigenza/Obiettivi e ponte POC quando richiesti; fonti e affermazioni; assunzioni, impegni ed economics; utilità per la decisione; leggibilità; assenza di slide ridondanti e rispetto della libertà creativa approvata.

Verifica il ragionamento della storyline prima dell'impaginazione e sul deck finale: pubblico e decisione sono chiari, ogni passaggio prepara il successivo, prove e limiti sostengono la conclusione e la richiesta finale discende da quanto mostrato. Leggi titoli e messaggi in sequenza e riporta nel resoconto esistente salti logici e obiezioni business irrisolte. La presenza delle sezioni e la qualità grafica non dimostrano da sole la tenuta narrativa. Se ricostruisci il processo svolto, distingui le evidenze disponibili di ideazione e revisione dalle fasi che non puoi verificare.

Prima della costruzione, confronta il piano con i vincoli originali dell'utente e del progetto, oltre che con il brief operativo. Per ogni schema obbligatorio verifica etichette, ordine e numero esatto di sezioni: controllare soltanto la presenza delle sezioni richieste non rileva quelle aggiunte. Per il profilo Novigo applica lo schema del primo contenuto definito nella guida collegata da `deck-visual-grounding`; una richiesta di decisione va collocata dove ammesso dallo schema. Un brief derivato non autorizza una violazione della fonte da cui è stato ricostruito.

Quando è richiesto un navigatore, controlla nel deck effettivo la corrispondenza con la mappa narrativa, le etichette, l'ordine, la sezione attiva e la presenza sulle slide previste. Verifica leggibilità, posizione stabile e assenza di sovrapposizioni. Un indice iniziale o il prefisso del titolo non sostituisce automaticamente la navigazione ricorrente; il navigatore deve preservare gli schemi di contenuto obbligatori.

Confronta il contributo dei messaggi nell'intera sequenza, non solo i titoli o la somiglianza delle parole. Per ogni ripetizione indica se aggiunge una prova, una decisione o un collegamento necessario; altrimenti proponi accorpamento o rimozione. Leggi il testo dal punto di vista dell'audience dichiarata: termini e dettagli tecnici devono avere una funzione comprensibile per quella decisione. Nelle coppie problemi/soluzioni controlla corrispondenze e significato delle frecce.

Controlla le famiglie compositive nell'intera sequenza e la motivazione delle alternative considerate. Una ripetizione è utile se permette un confronto coerente; è un difetto se appiattisce messaggi diversi che il catalogo rappresenta meglio con altre composizioni. Valuta il riuso della struttura completa, non il solo richiamo a un oggetto. L'ID del layout e il numero di famiglie utilizzate non dimostrano da soli varietà o qualità; non imporre quote e non penalizzare gli schemi obbligatori.

Confronta i contenuti finali con le fonti e con la specifica della slide dopo accorpamenti, sintesi e cambi di rappresentazione. Verifica che restino leggibili le informazioni utili alla decisione: durate e milestone di un piano, componenti e totale di una stima, unità e periodo dei numeri, scenari e sensibilità economica, assunzioni, dipendenze, rischi e criteri di completamento. Una freccia di sequenza non sostituisce un piano temporale, né un solo KPI sostituisce un confronto tra scenari. Se un dato essenziale non entra, riorganizza o separa la slide; non eliminarlo per conformare il contenuto al pattern. In una rigenerazione indipendente, confronta il deck precedente soltanto dopo aver congelato il nuovo output.

Confronta la resa con il riferimento selezionato: fedeltà stretta solo quando richiesta o per pattern formalmente vincolanti; altrove giudica messaggio, brand e chiarezza. Un materiale cliente di reference non autorizza il riuso dei suoi contenuti.

Usa il profilo di `deck-visual-grounding` come riferimento unico per i valori grafici. Controlla le slide renderizzate sia singolarmente sia nella sequenza e verifica nel PPTX gli aspetti che un'immagine non dimostra: placeholder, master/layout, stili effettivi, segmenti del titolo e delle enfasi, riempimenti e bordi con gradiente, collegamenti al tema, tabelle native e testo nel proprio oggetto. Verifica proporzioni delle immagini, leggibilità e capienza; una tabella nativa può comunque avere stile o dimensioni errati. Applica i requisiti generali a tutte le slide pertinenti, anche se il feedback li cita solo su alcune.

Verifica separatamente che il master sia collegato, che gli elementi comuni siano ereditati e che font/colori/geometria mantengano i collegamenti presenti nel riferimento. Confronta gli override con gli oggetti sorgente e con i vincoli espliciti: la sola somiglianza del rendering non prova l'ereditarietà, ma una formattazione diretta prevista dal modello non è un difetto.

Controlla che le fonti siano conservate nelle note o nei commenti richiesti e che sulla superficie delle slide non rimangano bibliografie aggiunte, salvo richiesta esplicita. Verifica insieme che la pulizia delle fonti non abbia nascosto qualificazioni necessarie a interpretare costi, benefici, stime o simulazioni.

Associa le segnalazioni alla versione effettivamente recensita e al contenuto/oggetto indicato. Se numeri o nomi non coincidono con il file disponibile, segnala la discrepanza e non inventare una corrispondenza. Prosegui con le regole generali verificabili; non eliminare una slide soltanto perché occupa il numero citato. Se il rendering usa font sostitutivi, dichiarane il limite e non attestare fedeltà tipografica a PowerPoint.

La cartella della presentazione e le convenzioni di output sono quelle di `AGENTS.md`, non la root del repository per default. Delega integrità tecnica a `pptx-package-validation` senza replicare il validator. Distingui file tecnicamente valido, aspetto controllato e apertura PowerPoint verificata.

Riporta riscontri per gravità, slide/evidenza, impatto e correzione, poi incertezze e verifiche reali. Niente attestazione di completezza con grounding critico mancante; nessuna nuova sezione o cartella solo per riempire una checklist.
