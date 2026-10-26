---
name: baia-publish
description: Usa quando prepari, rivedi o pubblichi contenuti editoriali Baialupo, eventi, locandine o aggiornamenti aeronautici destinati alla comunità VDS/AG.
---

# Pubblicazione Baialupo

Leggi `AGENTS.md`, `CONTEXT.md`, `wiki/handoff/programma-articoli.md`, `wiki/handoff/programma-articoli-stato.md` e, per pubblicazione/rollback, `docs/DEPLOYMENT.md` del checkout corrente. Queste sono le fonti operative; la skill non congela un vecchio meccanismo di deploy. Se codice, istruzioni e stato dichiarato divergono, usa `reality-check` prima di procedere.

## Contratto editoriale locale

Scrivi in italiano per piloti, allievi, gestori e appassionati VDS/AG. Apri con l'informazione utile, conserva tono competente, pratico e umano. Per eventi assorbi la locandina nel racconto: non spiegare al lettore il lavoro del redattore. Le sezioni e le emoji seguono gli articoli recenti e le istruzioni attive, non uno schema fisso.

Durante scouting e preparazione considera il programma e il backlog esistente prima di aprire nuove idee. Verifica fatti operativi, date, fonti tecniche e applicabilità; per eventi controlla anche il calendario JP4 e conferma con l'organizzatore. Il calendario di settore non sostituisce PPR/PNR, NOTAM, briefing o istruzioni ufficiali. Distingui norme pubblicate, annunci e interpretazioni; cita le fonti senza copiare lunghi testi.

Conserva frontmatter, categoria, slug e convenzioni del sito. I post vivono sotto `src/content/posts/<categoria>/YYYY-MM-DD-slug.md`; immagini locali sotto `public/img/stories/` o `public/img/covers/`. Usa la data editoriale per `created`/`updated` dei nuovi articoli, non una futura data evento. Non cambiare `created` o slug esistenti senza una ragione verificata. `featured` è legacy: non impostare `featured: 1` come regola per nuovi articoli o badge NEW; vale `CONTEXT.md`.

Percorsi pubblici root-based: `/img/...` e `/<categoria>/<slug>`. Never add `/web/...`: è il prefisso del sito legacy.

La copertina pertinente va anche nel corpo, cliccabile verso l'originale:

```md
[![Alt text](/img/stories/name.jpg)](/img/stories/name.jpg)
```

Per raduni cerca prima la locandina ufficiale. Le card in `src/pages/events/events.md` usano la locandina, non immagini generiche, loghi o cover generate. Esempio del contratto corrente:

```yaml
- link: "/news/<public-slug>"
  image: "/img/stories/<image>.jpg"
  title: "YYYY-MM-DD"
```

Usa il primo giorno dell'evento nella card. In assenza di locandina segui la conferma richiesta dal progetto; non inventare un asset o un'eccezione. Non inventare dettagli operativi nelle immagini generate.

## Direzione artistica delle cover

Prima di generare, controlla le **cover realmente usate** dagli articoli più recenti in `skunklabs-uk/baialupo.com`: leggi il campo `cover` nei post, poi confronta visivamente gli asset corrispondenti in `public/img/stories/`. Non usare semplicemente gli ultimi file in ordine alfabetico: possono includere fotografie di supporto, non copertine. Usa gli esempi correnti come riferimento per texture, composizione, livello di realismo e gerarchia; se non sono ispezionabili, dichiara il limite e non attestare la fedeltà visiva. Lo stile dipende dal soggetto, non è un filtro uniforme. Una fotografia pertinente e autorizzata resta preferibile quando prevista da `AGENTS.md`.

Per le **illustrazioni originali** scegli il registro adatto:

- **Tecnico-editoriale** (sicurezza, avionica, velivoli, normativa): tavola aeronautica su carta avorio o bianco caldo, tratto fine a matita/inchiostro, texture di carta, reticoli e linee di costruzione azzurre discrete, dettagli e riquadri esplicativi selettivi. Soggetto aeronautico ben riconoscibile, accurato rispetto alle fonti disponibili, impaginazione ariosa. Colori controllati: blu tecnico, grafite, grigi, accenti arancio.
- **Narrativo-editoriale** (open day, raduni, community): scena di aeroclub o volo leggero credibile e accogliente, resa **disegnata** con tratto visibile e texture da stampa, luce naturale calda, colori moderati e composizione leggibile anche nella card. Evita il fotorealismo cinematografico, la concept art patinata e il cartoon.

Non imporre titoli e annotazioni generati: sono opzionali solo quando aggiungono valore editoriale e il testo è controllabile e verificato. Per safety e normativa, non disegnare carte operative, piste, rotte, quote, marchi, aeromobili o installazioni inventati come se fossero documentari; preferisci schemi volutamente astratti o illustrazioni neutrali.

### Prompt riusabile per la sola immagine

```text
Illustrazione di copertina Baialupo, formato orizzontale panoramico.
Tema: [TEMA]. Soggetto principale: [SOGGETTO].
Dettagli secondari essenziali: [DETTAGLI]. Ambientazione: [LUOGO GENERICO].
Registro: [TECNICO-EDITORIALE / NARRATIVO-EDITORIALE].
Riprendi il trattamento visivo dalle cover recenti EFFETTIVAMENTE ISPEZIONATE:
[TRE TRATTI VISIVI OSSERVATI].
Disegno editoriale aeronautico curato e credibile, texture leggera da carta,
tratti di matita/inchiostro riconoscibili, palette sobria blu/avorio/grafite
con arancione misurato; composizione pulita e leggibile anche in miniatura.
Per il registro tecnico usa dettagli da tavola progettuale e linee di
costruzione discrete; per quello narrativo usa un momento umano e naturale
con atmosfera calda, senza effetto cinematografico.
Nessun logo, mascotte, marchio, watermark o testo inventato.
Nessun simbolo che ricordi il marchio Baialupo.
Lascia libero l'angolo [ANGOLO] per l'overlay successivo.
```

### Pipeline immagini e logo: due fasi separate

1. **Generazione (agente creativo, quando disponibile):** produci e conserva un'immagine di base **senza alcun logo**, anche se il generatore tende a introdurlo. Controlla l'output: se compare la mascotte, il wordmark o un marchio simile, rigenera o correggi prima di passare alla fase successiva. Non richiedere al modello di riprodurre l'SVG.
2. **Postprocessing (agente tecnico distinto, quando disponibile):** prendi l'immagine di base e sovrapponi in un angolo **l'esatto file** `public/img/covers/baialupo-logo-aviator.svg` del repository, senza ridisegno, alterazione di colori, font, proporzioni o parti del marchio. Usa un compositing deterministico con rendering fedele dell'SVG, margini uniformi e dimensioni leggibili sul ritaglio della card. Se il file canonico non è accessibile, ferma soltanto l'overlay e segnala il blocco: non sostituirlo con un logo generato. La presenza di più agenti non è obbligatoria, ma le due fasi e i rispettivi output devono rimanere verificabili.
3. **Review:** confronta la base senza logo con il composito finale; verifica che l'unica aggiunta sia l'overlay autentico (identità del marchio, posizione, proporzioni), e confronta la cover finale con esempi visivi recenti. Controlla anche crop desktop/mobile, leggibilità, soggetto e coerenza con l'articolo. Se non hai verificato visivamente il risultato, non dichiararlo approvato.

Conserva base e risultato finale almeno durante la review; registra nel lavoro corrente fonte dell'SVG e file finale, senza nuovi registri permanenti. Solo il file finale validato entra nel campo `cover` e nel corpo dell'articolo. Non usare la cover editoriale come locandina in `events.md`.

## Verifica e pubblicazione

La scrittura naturale non deve cancellare cautele o provenienza. Usa `humanize-writing` quando utile, senza cambiare fatti, vincoli e voce Baialupo.

Per modifiche puramente editoriali le istruzioni correnti richiedono `pnpm check`, `pnpm test:editorial` e `pnpm content:export`. Cambi applicativi, CSS, rendering o schema richiedono anche il percorso applicativo e `pnpm build`. Ricontrolla sempre i comandi nel progetto: non richiedere una nuova immagine OCI o un riavvio dei Pod soltanto per un articolo.

Export e CI verde non dimostrano pubblicazione. Verifica autorizzazione, commit `content-live` e revisione effettivamente servita secondo `docs/DEPLOYMENT.md`. Aggiorna lo stato editoriale, le date previste/effettive e i riferimenti coinvolti soltanto per gli esiti provati. Riporta route, file, verifiche e limiti; senza prova live non segnare «pubblicato».
