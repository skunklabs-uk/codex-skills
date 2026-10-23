---
name: powerpoint-manipulation
description: "Usa per ispezionare, modificare, unire, generare o riparare pacchetti PowerPoint editabili nel workspace TXT/Novigo."
---

# Manipolazione PowerPoint

Le istruzioni correnti di `skunklabs-uk/powerpoint-ai`, in particolare `AGENTS.md`, `.codex/deck-pipeline.md` e i materiali pertinenti `docs/reference*.md`, governano il lavoro. Per grafica usa `deck-visual-grounding`; per integrità tecnica `pptx-package-validation`; per contenuto la review commerciale. Non duplicare questi flussi qui.

Ispeziona il pacchetto sorgente, inclusi slide, relazioni, master/layout, theme e media. Per cambi testuali preserva stile e geometria; per nuovi pattern riusa quelli autorizzati. Loghi e decorazioni esistenti restano i media originali, non testo o forme approssimate. Preferisci testo, tabelle, forme e connettori editabili; non rasterizzare l'intero deck per comodità.

Quando il brief prescrive un modello, costruisci su una copia del PPTX sorgente e riusa i layout pertinenti con i loro master e placeholder nativi. Compila il titolo nel suo placeholder; conserva i placeholder necessari e rimuovi solo quelli non pertinenti al risultato. Risolvi l'ereditarietà dello stile prima di applicare override: il valore generico del master può essere sostituito da layout o oggetto. Usa il profilo definito da `deck-visual-grounding` senza duplicarne qui i valori.

Conserva la formattazione interna dei testi: un titolo bicolore o un paragrafo con enfasi richiedono segmenti distinti con i relativi colori, gradienti e pesi. Sostituire tutto il contenuto con il solo stile del primo segmento perde questa informazione. Inserisci il testo appartenente a una forma nel suo corpo testuale. Per dati tabellari usa una tabella nativa e conserva anche la formattazione diretta della reference, non soltanto il suo identificativo di stile.

Mantieni le proporzioni intrinseche delle immagini e il ritaglio autorizzato. Se le immagini vanno usate come fornite, preservane il contenuto senza maschere, cornici o fondi aggiunti. Verifica separatamente icone, loghi e screenshot quando cambi le loro dimensioni.

Esegui il progetto grafico deciso dall'LLM usando il codice necessario, senza rendere un motore Python specifico un prerequisito della skill. Se uno strumento non preserva placeholder, segmenti formattati, gradienti o oggetti nativi richiesti, usa una capacità disponibile che li conservi oppure riporta il limite; non degradare il risultato senza segnalarlo.

Salva nel percorso della presentazione previsto dalle fonti correnti, non nella root generica né nelle reference. Non sovrascrivere un deck sorgente senza autorizzazione. Non copiare contenuto riservato da una reference. Le dipendenze e il generatore si scelgono dal progetto: non creare un backend o una pipeline permanente per un singolo file.

In caso di repair, confronta originale e copia salvata da PowerPoint: preserva contenuto visibile, theme e asset autorizzati. Correggi solo parti realmente invalide o differenze tecniche motivate, in un nuovo output. Non assumere che tag XML vuoti equivalenti o decorazioni siano difetti. Non copiare alla cieca il tema di un file riparato, che può aver introdotto font/colori fallback.

Verifica il file risultante e riporta strategia, sorgente/output, riusi, evidenze e controlli manuali mancanti. Un export riuscito non certifica apertura senza repair in PowerPoint.
