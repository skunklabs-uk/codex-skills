---
name: homelab-secret-management
description: "Usa quando un secret Homelab coinvolge SOPS, Age, eccezioni bootstrap, reflection dei database o rotazione con rollout."
---

# Secret Homelab

Consulta `.sops.yaml`, le istruzioni e i runbook GitOps attivi, i manifest cifrati e `gitops/infra/reflector/`. Non leggere o esporre valori segreti per un semplice inventario.

I nuovi Secret Kubernetes in GitOps devono essere SOPS-encrypted. Gli oggetti bootstrap intenzionalmente esterni a GitOps, inclusi `argocd/sops-age` e credenziali repository Argo, non vanno importati per inerzia. Ricava dalle fonti attuali namespace sorgente, owner e consumer; i secret DB condivisi sono riflessi secondo il contratto del progetto.

La rotazione autorizzata deve coprire sorgente, cifratura, dipendenze dei consumer e rollout/sync; non basta cambiare Git. Prima di qualsiasi azione verifica target e rollback applicabile. Non cambiare credenziali di provider esterni per aggirare un errore locale.

Verifica la decifrabilità senza stampare plaintext e controlla metadata, presenza dei secret, reflection e stato dei consumer senza `kubectl get secret -o yaml` indiscriminato. Nessun valore in log, diff o risposta finale. Un plaintext staged, decrypt fallito o consumer senza sorgente blocca il passo dipendente e richiede correzione. Non conservare copie temporanee decifrate.
