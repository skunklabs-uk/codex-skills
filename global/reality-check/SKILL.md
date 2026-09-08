---
name: reality-check
description: "Usa quando fonti autorevoli, piani o runbook possono essere superati o contraddire codice, configurazione, evidenze di deploy o decisioni approvate."
---

# Reality Check

Verifica la baseline del lavoro, non soltanto ciò che dice la documentazione. Rimani nel perimetro richiesto; questo controllo non autorizza un audit generale, una modifica al prodotto o un'operazione live.

## Confronto

1. Leggi le istruzioni del progetto e individua le fonti pertinenti, il loro stato e la revisione esaminata. Distingui il comportamento **approvato o desiderato** dallo stato dichiarato come **già implementato**.
2. Confronta le affermazioni che condizionano il task con codice, configurazione, dipendenze, test pertinenti e cronologia delle decisioni. Un README `Active` non è una prova che il deploy sia avvenuto; una PR aperta non è una decisione approvata.
3. Quando la conclusione dipende dal deploy o dall'operatività, cerca evidenze runtime disponibili e autorizzate in sola lettura, con ambiente e data/revisione. Un manifest in Git non dimostra lo stato live. Non ottenere permessi, leggere segreti o avviare deploy, restore, job o servizi per colmare il gap senza autorizzazione.
4. Per ogni discrepanza distingui: **drift documentale**, **difetto dell'implementazione rispetto al requisito**, **drift di deploy/configurazione**, oppure **conflitto non risolto**. Se manca l'evidenza, scrivi **non verificato**: non è prova di drift né prova di correttezza.
5. Ricostruisci l'intento dalle decisioni approvate prima di scegliere la correzione. Non riscrivere requisiti o documenti per legittimare un bug. Aggiorna una fonte soltanto quando la richiesta autorizza la modifica e la correzione è determinata; altrimenti indica il delta necessario. Preserva gli originali quando sono fonti primarie protette.
6. Porta alla fase successiva soltanto la baseline verificata e le decisioni realmente aperte. Un conflitto che cambia prodotto, architettura, sicurezza o dati richiede una decisione umana; prosegui il lavoro indipendente già autorizzato.

## Risultato

Riporta sinteticamente affermazione, stato dichiarato, evidenza osservata, fonte/revisione, esito e azione. Se utile, usa una tabella. Separa fatti, deduzioni, assunzioni e verifiche mancanti. Non dichiarare controlli runtime o test non eseguiti.

Nessun contatore di domande, intervista, nuovo ADR, ticket o report permanente è obbligatorio. Se il confronto non rileva discrepanze pertinenti, dillo con il perimetro verificato e continua. La skill non sostituisce debugging, ricerca sulle API ufficiali o test eseguibili.

## Ragione locale

Mantenuta per il confronto tra stato approvato, documentato, implementato e osservato. La sola lettura delle fonti e `source-driven-development` non coprono questo contratto. Decisione e casi concreti: `docs/reviews/2026-09-08-skill-origin-audit.md`.
