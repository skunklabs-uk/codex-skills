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

## Verifica e pubblicazione

La scrittura naturale non deve cancellare cautele o provenienza. Usa `humanize-writing` quando utile, senza cambiare fatti, vincoli e voce Baialupo.

Per modifiche puramente editoriali le istruzioni correnti richiedono `pnpm check`, `pnpm test:editorial` e `pnpm content:export`. Cambi applicativi, CSS, rendering o schema richiedono anche il percorso applicativo e `pnpm build`. Ricontrolla sempre i comandi nel progetto: non richiedere una nuova immagine OCI o un riavvio dei Pod soltanto per un articolo.

Export e CI verde non dimostrano pubblicazione. Verifica autorizzazione, commit `content-live` e revisione effettivamente servita secondo `docs/DEPLOYMENT.md`. Aggiorna lo stato editoriale, le date previste/effettive e i riferimenti coinvolti soltanto per gli esiti provati. Riporta route, file, verifiche e limiti; senza prova live non segnare «pubblicato».
