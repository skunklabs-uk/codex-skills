---
name: homelab-proxmox-operations
description: "Usa quando un’operazione Homelab interessa nodi Proxmox, PBS, Ceph, VM o rete di management."
---

# Proxmox Homelab

Leggi i runbook pertinenti sotto `doc/`: installazione nodi, rete Proxmox, cluster, Ceph/RBD, VM K3s e PBS/offsite. Verifica i percorsi correnti dall'indice, non da un titolo storico.

Prima di interventi identifica nodo e VM/LXC/disco senza ambiguità, quorum, salute Ceph, capacità storage, backup/restore e dipendenze delle VM K3s. Preferisci diagnostica read-only. L'assenza di un warning in documentazione non è prova di salute live.

Non modificare rete da remoto senza console/rollback. Non cancellare dischi, pool, VM o snapshot PBS senza richiesta esplicita. Reboot e manutenzione devono preservare quorum e disponibilità delle dipendenze coinvolte.

Riporta osservazioni reali e condizioni residue; se il target, la salute o il recupero restano incerti, ferma l'operazione dipendente invece di proporre comandi distruttivi generici. Per rete usa `homelab-network-readiness`; per backup e storage i rispettivi runbook.
