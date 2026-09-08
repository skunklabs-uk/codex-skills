---
name: pptx-package-validation
description: "Usa prima della consegna di un PowerPoint quando occorre verificare integrità del pacchetto e possibili avvisi di repair."
---

# Validazione tecnica PPTX

Leggi i requisiti del task e le istruzioni di esecuzione del progetto. Riusa gli strumenti di validazione già presenti; non costruire un nuovo validator se i controlli disponibili coprono il caso.

Controlla sul file effettivamente consegnato: integrità ZIP; parsing XML; Override di `[Content_Types].xml` verso parti esistenti; target interni delle relazioni; master/layout e media; extents non negativi; integrità delle relazioni notes master/theme quando presenti. I target esterni non sono file interni mancanti.

Verifica anche che il sorgente non sia stato sovrascritto senza permesso. Usa render/export disponibile per le verifiche visuali richieste, ma distinguine l'esito dalla validità del pacchetto e dall'apertura nel programma PowerPoint.

Se PowerPoint ripara il file, confronta i pacchetti originali/riparati: correggi dangling override, relazioni o geometrie invalide dimostrate, non pattern innocui per supposizione. Non imporre `theme2.xml` o normalizzazioni dei tag vuoti a ogni file: valgono struttura e riferimenti corretti, non una topologia fissa. Non alterare theme e aspetto visivo approvati durante una riparazione tecnica.

Un errore richiede identificazione della parte, correzione in un nuovo output salvo autorizzazione e ripetizione delle verifiche pertinenti. Riporta file, controlli eseguiti, esiti e rischi residui. Se non puoi provare l'apertura senza repair in PowerPoint, dichiarala non verificata. La review commerciale è separata.
