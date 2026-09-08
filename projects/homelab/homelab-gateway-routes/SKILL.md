---
name: homelab-gateway-routes
description: "Usa per esporre o verificare un servizio Homelab tramite Gateway condiviso, HTTPRoute e routing Cloudflare."
---

# Gateway e route Homelab

Leggi i manifest correnti e le istruzioni del progetto. Il modello adottato usa Gateway API/Traefik: verifica identità e listener del Gateway condiviso, namespace e service backend prima di modificare la route. Non assumere un IP live dalla documentazione.

Preferisci HTTPRoute a Ingress dove il contratto corrente lo richiede. Mantieni espliciti in Git i default che altrimenti producono drift Argo: `parentRefs.group`, `parentRefs.kind`, `backendRefs.group`, `backendRefs.kind`, `backendRefs.weight`. Verifica hostname, sectionName, porta, namespace e ownership.

Per il percorso pubblico riconcilia con le fonti Cloudflare in `infra/opentofu/cloudflare-zero-trust/` e `gitops/infra/cloudflare/`; usa `homelab-cloudflare-operations` quando serve quel contesto. Non duplicare qui endpoint di altre applicazioni.

La verifica copre condizioni della route e del listener, risoluzione del backend, endpoint, DNS/tunnel e Access previsti. Un servizio privo di endpoint o un hostname non coerente va diagnosticato prima del rollout dipendente. Nessuna console admin esposta per aggirare un guasto; le integrazioni interne non devono passare inutilmente da Access pubblico.
