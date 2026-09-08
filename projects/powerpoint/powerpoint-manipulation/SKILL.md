---
name: powerpoint-manipulation
description: "Usa per ispezionare, modificare, unire, generare o riparare pacchetti PowerPoint editabili nel workspace TXT/Novigo."
---

# Manipolazione PowerPoint

Le istruzioni correnti di `skunklabs-uk/powerpoint-ai`, in particolare `AGENTS.md`, `.codex/deck-pipeline.md` e i materiali pertinenti `docs/reference*.md`, governano il lavoro. Per grafica usa `deck-visual-grounding`; per integrità tecnica `pptx-package-validation`; per contenuto la review commerciale. Non duplicare questi flussi qui.

Ispeziona il pacchetto sorgente, inclusi slide, relazioni, master/layout, theme e media. Per cambi testuali preserva stile e geometria; per nuovi pattern riusa quelli autorizzati. Loghi e decorazioni esistenti restano i media originali, non testo o forme approssimate. Preferisci testo, tabelle, forme e connettori editabili; non rasterizzare l'intero deck per comodità.

Salva nel percorso della presentazione previsto dalle fonti correnti, non nella root generica né nelle reference. Non sovrascrivere un deck sorgente senza autorizzazione. Non copiare contenuto riservato da una reference. Le dipendenze e il generatore si scelgono dal progetto: non creare un backend o una pipeline permanente per un singolo file.

In caso di repair, confronta originale e copia salvata da PowerPoint: preserva contenuto visibile, theme e asset autorizzati. Correggi solo parti realmente invalide o differenze tecniche motivate, in un nuovo output. Non assumere che tag XML vuoti equivalenti o decorazioni siano difetti. Non copiare alla cieca il tema di un file riparato, che può aver introdotto font/colori fallback.

Verifica il file risultante e riporta strategia, sorgente/output, riusi, evidenze e controlli manuali mancanti. Un export riuscito non certifica apertura senza repair in PowerPoint.
