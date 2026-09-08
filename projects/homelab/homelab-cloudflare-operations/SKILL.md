---
name: homelab-cloudflare-operations
description: "Usa quando un intervento Homelab attraversa DNS Cloudflare, Access, tunnel ed esposizione GitOps."
---

# Cloudflare Homelab

Controlla le fonti attive in `infra/opentofu/cloudflare-zero-trust/` e `gitops/infra/cloudflare/`: OpenTofu possiede DNS/Access/Zero Trust; GitOps possiede workload cloudflared e secret. Ricava gli oggetti esatti dalla configurazione corrente.

Verifica insieme DNS, applicazione/policy Access, ingresso del tunnel, Gateway/HTTPRoute e backend. Parti da service ed endpoint interni prima di attribuire un guasto a Cloudflare. Le integrazioni interne devono usare il service DNS quando il public hostname è protetto da Access.

Non esporre console amministrative o dati pubblicamente senza il controllo approvato. Non rimuovere Access né ruotare token per tentativi. Per il contratto della route usa `homelab-gateway-routes`; per modifiche IaC usa `homelab-opentofu-terraform`. Un plan non è un apply e un apply non prova la raggiungibilità applicativa.

Redigi soltanto evidenze prive di token, credenziali o state sensibile; segnala disallineamenti e verifiche live mancanti.
