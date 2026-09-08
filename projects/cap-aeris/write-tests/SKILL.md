---
name: write-tests
description: "Usa quando i test CAP Aeris dipendono da pratiche, permessi, requisiti documentali o revisioni dei moduli."
---

# Test CAP Aeris

Leggi `AGENTS.md`, le fonti pertinenti in `docs/cap/` e `docs/wiki/`, e i test esistenti. Il metodo di testing resta quello upstream scelto per l'implementazione, non un secondo ciclo.

Conserva i contratti CAP effettivamente interessati: transizioni e blocchi delle pratiche, documenti obbligatori, ruoli/azioni e casi negativi; identità del modello, revisione ed effective date dei moduli; ownership, metadata, immutabilità e operazioni sui documenti. Non espandere la suite a tutto il dominio per una modifica locale.

Nomi dei test, helper, fixture e commenti in inglese. Verifica comportamento osservabile e regressioni pertinenti alle interfacce concordate, senza dipendere dalla struttura interna. Usa pattern e runner del progetto e riporta i comandi realmente eseguiti. Non modificare fonti primarie per far coincidere il requisito con l'implementazione.
