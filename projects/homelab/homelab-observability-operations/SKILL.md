---
name: homelab-observability-operations
description: "Usa quando un intervento Homelab interessa sorgenti di monitoraggio, label Alloy, backend Grafana o ownership delle dashboard."
---

# Osservabilità Homelab

Consulta `doc/15-Monitoring (Prometheus + Grafana + Loki + Tempo) via Helm + ArgoCD.md` e le fonti correnti sotto `gitops/infra/monitoring/`, inclusi values, Alloy e route.

Ricava da queste sorgenti endpoint, label e nomi delle risorse. Grafana deve raggiungere Loki tramite il service interno previsto, non attraverso l'hostname pubblico protetto da Access. Non mantenere copie degli endpoint nelle altre skill.

Per Alloy preserva le label Kubernetes necessarie (`namespace`, `pod`, `container`, `node`) prima della sorgente Loki e verifica che il nuovo ConfigMap sia stato caricato; non dedurlo dal solo commit. Dashboard e alert durevoli devono tornare in GitOps, non rimanere modifiche manuali.

Verifica dati effettivi e query dopo cambi di label, stato dei target dopo cambi scrape, revisione Argo e log del componente interessato. Pod Ready non dimostra ingestione corretta. Distingui assenza del dato, query errata e indisponibilità dell'evidenza; non introdurre nuovi monitoraggi fuori scope.
