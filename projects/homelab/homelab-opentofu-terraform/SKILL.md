---
name: homelab-opentofu-terraform
description: "Usa per pianificare o applicare cambi OpenTofu Homelab rispettando i confini di ownership Cloudflare, Harbor e GitOps."
---

# OpenTofu Homelab

Leggi le fonti correnti in `infra/opentofu/cloudflare-zero-trust/` e `infra/opentofu/harbor/`, i `.tf` e il runbook pertinente. OpenTofu governa la configurazione interna prevista; i workload Kubernetes restano in GitOps. Non reintrodurre il reconciler REST Harbor ritirato.

Per Harbor confronta l'ownership con `doc/27-Harbor registry mirror.md`, `doc/24-Trivy remediation backlog.md` e i values correnti: progetti/cache, retention, immutabilità, scansioni e GC non devono avere due owner. Per Cloudflare verifica anche la coerenza delle route GitOps.

Usa le capacità native di OpenTofu: formatting, validate e plan prima di un apply. Esamina sostituzioni/eliminazioni di Access, DNS, tunnel, progetti, registry e autenticazione; non applicare un piano inatteso o non approvato. State stale/locked richiede diagnosi, non un force-unlock automatico. Il targeting di risorse è per recovery giustificato, non la normale gestione del drift.

Non stampare token, credenziali o state sensibile. Distingui plan, apply e comportamento osservato; ogni cambiamento esterno resta soggetto alle autorizzazioni del progetto.
