---
name: deck-visual-grounding
description: "Usa quando un deck deve rispettare reference TXT/Novigo, asset reali e un grado di fedeltà concordato."
---

# Grounding visuale

Leggi `AGENTS.md`, le reference pertinenti in `docs/ui/` e quelle della presentazione. Il riferimento scelto dall'utente prevale sulle inferenze stilistiche generiche. `docs/template.pdf`, quando applicabile, mostra la resa esportata; il `.pptx` conserva la sorgente editabile per master, layout e media.

Ispeziona template e slide pertinenti: proporzioni, gerarchie, font, palette, griglia, header/footer, loghi, gradienti e pattern per contenuto, roadmap ed economics. Non duplicare questa estrazione in un altro processo.

Separa messaggio/contenuti/fonti dalla direzione creativa. Rispetta High/Medium/Low già concordati: non prescrivere coordinate, frecce o conteggi di box ai livelli liberi. La libertà di composizione resta entro i vincoli di brand espliciti. Quando è richiesto il modello aziendale, riusa master, layout, placeholder e asset reali; una ricostruzione visivamente simile su un master generico non soddisfa il requisito. Conserva i gradienti quando fanno parte del pattern scelto.

Prima di scegliere le composizioni, riconcilia il brief operativo con i vincoli dell'utente e del progetto. Uno schema obbligatorio fissa sezioni, ordine e cardinalità; la libertà riguarda i contenuti ammessi al suo interno. Un brief ricostruito dall'assistente non può aggiungere sezioni o indebolire quei vincoli. Risolvi eventuali discrepanze prima della generazione.

Non preimpostare Poppins, colori o un particolare deck come universali: ricavali dal riferimento corrente. Un file riparato da PowerPoint è evidenza tecnica, non una nuova approvazione di tema o layout. Tieni elementi editabili dove praticabile e riferisci deviazioni e limiti visivi senza inventare asset.

## Decisioni grafiche dell'LLM

Affida all'LLM la scelta del layout e la composizione in base a messaggio, audience e relazioni tra i contenuti. Codex realizza queste decisioni con gli strumenti disponibili; un eventuale script Python resta esecutivo. Un limite del generatore va riportato al piano della slide, senza sostituire silenziosamente master, stile o struttura con un layout più semplice.

Nella specifica della slide già prevista dal progetto indica funzione narrativa, riferimento effettivamente ispezionato (file/versione, slide e oggetto quando rilevante), ragione della scelta e adattamento dei contenuti. Quando il catalogo offre più composizioni pertinenti e lo schema non è fisso, confrontane almeno due e annota brevemente perché una rappresenta meglio il messaggio. Ispeziona le anteprime prima della costruzione; non limitare la ricerca ai riferimenti già usati nelle prime slide.

Adatta la composizione completa: gerarchia, relazioni, distribuzione dello spazio e oggetti. Prelevare una freccia, un colore o lo stile di una cella non equivale a usare il pattern. Se il messaggio richiede tempo, confronto, processo o proporzioni, la composizione deve rendere leggibile quella relazione. Mantieni le informazioni necessarie a interpretarla, come durate, milestone, unità e assunzioni; segnala i dati mancanti senza inventarli.

Rivedi la sequenza delle famiglie compositive prima della costruzione. Una serie di tabelle o di paragrafi è giustificata quando sostiene confronti omogenei; quando nasconde relazioni diverse, scegli un'alternativa pertinente dal catalogo. La varietà deriva dalle funzioni narrative: non imporre quote di layout né alternanze decorative, e non cambiare uno schema obbligatorio per ottenere varietà.

Ricava lo stile effettivo dall'oggetto e dalla sua ereditarietà nel layout/master/tema. Conserva separatamente riempimenti di forma, bordi e segmenti di testo. Un solo colore, il nome del tema o l'ID di uno stile tabella non descrivono tutta la formattazione. Per i gradienti preserva stop, posizioni, direzione, trasparenza e riferimenti originali; mantieni i colori di tema dove presenti, senza convertire arbitrariamente gradienti sRGB in colori di tema o viceversa.

## Profilo TXT Novigo del 12 ottobre 2026

Applica questo profilo quando il riferimento scelto è `2026_10_12 - TXT Novigo Template PowerPoint - Con spiegazioni` oppure il brief richiama esplicitamente queste regole. Le istruzioni dell'utente prevalgono sui dettagli diversi degli esempi storici. Per un altro template ricava il suo profilo, senza trasferire questi valori.

| Elemento | Regola da applicare |
|---|---|
| Struttura | Master e layout originali, titolo nel placeholder nativo e altri placeholder richiesti dal layout. Le note didattiche e i dati degli esempi non sono contenuto della nuova presentazione. |
| Titolo con separatore | Prefisso prima di `\|` in `#A6A6A6`; seconda parte in `#000000`. Preservare il trattamento del separatore dal riferimento. Usare segmenti formattati distinti nello stesso titolo. |
| Testo ordinario | Nero puro `#000000`; font e relativi collegamenti al tema ricavati dal modello. |
| Titoli laterali e paragrafi | Titoli laterali **18 pt grassetto**, paragrafi **14 pt**. Accorciare o riorganizzare contenuti che non entrano, invece di ridurre questi corpi. I valori non definiscono la dimensione di ogni etichetta o KPI. |
| Enfasi nei paragrafi | Selezionare termini che sostengono il messaggio e applicare il gradiente TXT originale ai relativi segmenti di testo, conservando il testo editabile. |
| Barre sotto il titolo | Conservare le linee e il gradiente Novigo del master originale, compresi spessore e geometria. |
| Forme, separatori, icone e decorazioni | Applicare il trattamento dell'oggetto di riferimento e le correzioni esplicite del brief. Mantenere i riferimenti al tema delle icone/decorazioni. La presenza di un gradiente nel brand non impone gradienti a ogni forma. |
| Testo associato a una forma | Inserirlo nel corpo testuale della forma, quando ne è l'etichetta o il contenuto; evitare una casella di testo indipendente sovrapposta. |
| Immagini fornite come input | Mantenerle come immagini indipendenti, con proporzioni e contenuto originali, senza deformazioni o contenitori decorativi aggiunti. |

Prima di pianificare un deck con questo modello, leggi la [guida di selezione del catalogo Novigo](references/novigo-slide-guide.md). La guida è il riferimento per lo schema obbligatorio del primo contenuto e per scegliere tra le famiglie dell'intero catalogo. Usa i numeri delle slide originali, non quelli del nuovo deck né di un PDF che omette slide nascoste. Il catalogo guida la scelta; il PPTX fornito resta la fonte per oggetti e stili effettivi.

Il catalogo contiene trattamenti diversi: il gradiente delle barre del master non è necessariamente quello dei riempimenti delle forme o del testo. Riusa l'oggetto pertinente. Se mancano il modello o una capacità necessaria a preservarlo, dichiara il limite concreto senza presentare un'approssimazione come conforme.
