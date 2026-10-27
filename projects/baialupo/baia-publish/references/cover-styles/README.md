# Baialupo — catalogo delle cinque reference visive

**Stato: Active.** Le reference canoniche sono cinque immagini originali selezionate dall'utente nella conversazione del 26 ottobre 2026, con nomi approvati. Questo documento ne descrive le caratteristiche per la skill `baia-publish`; **non sostituisce la visione dei file**.

| ID | Nome | Reference originale | Carattere discriminante |
| --- | --- | --- | --- |
| 01 | Cinematic Editorial | [01-cinematic-editorial.png](01-cinematic-editorial.png) | Realismo cinematografico, luce calda, profondità e dettagli naturali |
| 02 | Vibrant Illustration | [02-vibrant-illustration.png](02-vibrant-illustration.png) | Pittura digitale luminosa e colorata, composizione scenografica |
| 03 | Technical Blueprint | [03-technical-blueprint.png](03-technical-blueprint.png) | Fondo chiaro, modellazione pulita, linee di costruzione azzurre e minimalismo |
| 04 | Technical Sketchbook | [04-technical-sketchbook.png](04-technical-sketchbook.png) | Matita, tratteggio visibile, texture avorio e dettagli tecnici illustrati |
| 05 | Sketch to Reality | [05-sketch-to-reality.png](05-sketch-to-reality.png) | Transizione graduale da disegno in grafite a resa tridimensionale realistica |

Il campione `Sketch to Reality` **non** sostituisce `Technical Sketchbook`: il primo enfatizza la transizione materiale schizzo/realismo, il secondo conserva un trattamento disegnato complessivo.

## Integrità e provenienza

I cinque PNG originali sono importati senza ritocchi dal pacchetto `baialupo-cover-styles-references.zip` consegnato nella conversazione. La copia recuperata dai Download locali ha SHA-256 `6c4fa8ca18f9762d9c19d72f852af45b3d899f6e3db89d119ded88db20719406`. Gli hash seguenti coincidono con il manifesto contenuto nel README del pacchetto; dimensioni e numero di byte sono verificati sui PNG importati. Nessuna ricodifica, ottimizzazione o modifica dei metadati.

| File | Dimensioni (px) | Byte | SHA-256 |
| --- | --- | --- | --- |
| [01-cinematic-editorial.png](01-cinematic-editorial.png) | 1672×941 | 3344835 | `4467c043981a981f851d09301d5a7e5b71d52f437db2de19c20d3aa65792452a` |
| [02-vibrant-illustration.png](02-vibrant-illustration.png) | 1672×941 | 3144820 | `12e287581addc629d2650fe7a5867a67f688afceeee41d0b7aab5628b9b02482` |
| [03-technical-blueprint.png](03-technical-blueprint.png) | 1672×941 | 2671774 | `1efd449adc8a60cdd02ef1af837182c69a60313fb7dcdf397f040e4a42a95378` |
| [04-technical-sketchbook.png](04-technical-sketchbook.png) | 1672×941 | 3449201 | `6cb4305a16ed66a499dd971af3baf1dbdf7302485a227c5a88671ab4b957193f` |
| [05-sketch-to-reality.png](05-sketch-to-reality.png) | 1672×941 | 2809201 | `7197aedbab404ede8e35ab601a9120ee037f496700755fb20d19659cf93c4dd4` |

Dalla radice del repository, calcolare gli hash con `sha256sum projects/baialupo/baia-publish/references/cover-styles/*.png` e confrontarli con la tabella. Aprire poi la reference scelta prima di usarla.

## Uso

1. Selezionare uno stile per nome e aprire **la relativa immagine reale**.
2. Distinguere trattamento grafico da soggetto rappresentato; non trasformare il contenuto della reference in vincolo su velivoli, persone, colori o luoghi del nuovo articolo.
3. Generare un'immagine di base **senza loghi o mascotte**.
4. Applicare nel secondo passaggio il file originale `public/img/covers/baialupo-logo-aviator.svg` come overlay deterministico, non un logo copiato dalle reference.
5. Verificare stilisticamente la cover confrontandola con la reference scelta e controllare anche il crop delle card.

I loghi già inclusi nelle immagini storiche sono parte della documentazione visiva, **non** asset da ritagliare o riutilizzare.
