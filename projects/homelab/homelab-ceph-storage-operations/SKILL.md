---
name: homelab-ceph-storage-operations
description: "Usa quando un intervento Homelab interessa Ceph, CSI, RGW, RBD, ownership dei PVC o prefissi di backup."
---

# Storage Ceph Homelab

Consulta i runbook pertinenti `doc/08-Installazione e configurazione Ceph.md`, `doc/09-Integrazione Ceph RBD in Proxmox.md`, `doc/13-Integrazione Ceph CSI (Storage).md` e `doc/23-Ceph RGW (S3 locale) - Esposizione via MetalLB.md`, verificandone lo stato corrente.

Le sorgenti tecniche sono `gitops/infra/ceph-csi/`, `gitops/infra/ceph-rgw-internal/` e i playbook Ceph sotto `ansible/playbooks/`. Ricava StorageClass, backend, credenziali e ownership dai manifest attuali, non da esempi memorizzati.

Non alterare dischi OSD fuori da un recovery autorizzato. Non eliminare PVC, pool o dati senza richiesta esplicita e prova di recupero pertinente. I prefissi S3 sono contratti di backup: mantieni separati test, restore e produzione.

Verifica sia stato Kubernetes (PVC/PV, attachment, eventi, CSI) sia backend Ceph/RGW. Pending PVC, errori di mount o cataloghi non raggiungibili sono problemi da diagnosticare, non prove che basti ricreare lo storage. Per backup usa `homelab-backup-restore`; nessuna credenziale in diff, log o risposta.
