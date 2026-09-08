---
name: homelab-review-and-debt
description: "Usa per un assessment richiesto dei rischi operativi Homelab, drift di ownership, backup o accuratezza dei runbook."
---

# Review operativa Homelab

Questa è la lente di dominio per una review richiesta, non un altro motore di audit. Usa le fonti attive e il perimetro approvato; `reality-check` confronta le affermazioni sullo stato corrente.

Valuta soltanto le aree pertinenti: revisione/sync Argo e risorse manuali; probe e storage; SOPS/reflection e rotazione; catena backup/offsite/restore; ingestione e alert; ownership OpenTofu/GitOps/Ansible; runbook superati. Una ricerca TODO o un index statico non prova un rischio live.

Per ogni riscontro indica gravità, file/revisione o osservazione, impatto operativo e azione minima. Distingui fatto, deduzione e verifica mancante. Dai priorità a perdita dati, credenziali, recuperabilità e drift di ownership, non al numero di modifiche proposte.

Non avviare remediation, nuove issue, monitoraggi o refactor solo perché possibili. Il contesto generale di code review o migrazione resta nell'upstream pertinente; le verifiche operative specifiche restano nel runbook.
