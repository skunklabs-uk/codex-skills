# Baialupo — catalogo delle cinque reference visive

**Stato: Draft (review editoriale).** Le reference canoniche sono cinque immagini originali selezionate dall'utente nella conversazione del 26 ottobre 2026, con nomi approvati. Questo documento ne descrive le caratteristiche per la skill `baia-publish`; **non sostituisce la visione dei file**.

| ID | Nome | Nome asset previsto | Carattere discriminante |
| --- | --- | --- | --- |
| 01 | Cinematic Editorial | `01-cinematic-editorial.png` | Realismo cinematografico, luce calda, profondità e dettagli naturali |
| 02 | Vibrant Illustration | `02-vibrant-illustration.png` | Pittura digitale luminosa e colorata, composizione scenografica |
| 03 | Technical Blueprint | `03-technical-blueprint.png` | Fondo chiaro, modellazione pulita, linee di costruzione azzurre e minimalismo |
| 04 | Technical Sketchbook | `04-technical-sketchbook.png` | Matita, tratteggio visibile, texture avorio e dettagli tecnici illustrati |
| 05 | Sketch to Reality | `05-sketch-to-reality.png` | Transizione graduale da disegno in grafite a resa tridimensionale realistica |

Il campione `Sketch to Reality` **non** sostituisce `Technical Sketchbook`: il primo enfatizza la transizione materiale schizzo/realismo, il secondo conserva un trattamento disegnato complessivo.

## Integrità e provenienza

I cinque PNG originali sono stati copiati senza ritocchi nel pacchetto di reference consegnato all'utente (`baialupo-cover-styles-references.zip`). Il pacchetto contiene anche un manifesto SHA-256 per verificare in seguito che le reference non siano state ricampionate o rigenerate.

**Limite attuale:** le immagini binarie non sono ancora caricate in questa directory GitHub; questo README non deve essere preso come prova della loro presenza. Per rendere autonomamente utilizzabile il catalogo da Codex, importare dal pacchetto i cinque PNG originali accanto a questo file, conservarne i nomi e verificare gli SHA-256 contro il manifesto. Finché mancano, la skill deve dichiarare la reference non consultabile, senza inventare una somiglianza.

## Uso

1. Selezionare uno stile per nome e aprire **la relativa immagine reale**.
2. Distinguere trattamento grafico da soggetto rappresentato; non trasformare il contenuto della reference in vincolo su velivoli, persone, colori o luoghi del nuovo articolo.
3. Generare un'immagine di base **senza loghi o mascotte**.
4. Applicare nel secondo passaggio il file originale `public/img/covers/baialupo-logo-aviator.svg` come overlay deterministico, non un logo copiato dalle reference.
5. Verificare stilisticamente la cover confrontandola con la reference scelta e controllare anche il crop delle card.

I loghi già inclusi nelle immagini storiche sono parte della documentazione visiva, **non** asset da ritagliare o riutilizzare.
