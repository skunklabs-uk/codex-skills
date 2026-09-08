---
name: homelab-network-readiness
description: "Usa prima di modifiche di rete Homelab che possono incidere su management, VLAN, DHCP, DNS o accesso remoto."
---

# Readiness rete Homelab

Questa è una checklist locale ridotta, non un pacchetto ECC upstream verificato. Leggi piano IP, topologia, runbook di rete e configurazioni correnti del progetto. Non imporre VLAN, subnet, VPN o resolver presi da una topologia generica.

Prima di fornire comandi di modifica, verifica piattaforma/versione, porte/SSID interessati, indirizzi, DHCP/DNS, route, ACL e percorso amministrativo utilizzato. Controlla duplicati IP, sovrapposizioni anche con reti VPN, riferimenti mancanti e azioni distruttive usando strumenti della piattaforma; una regex di esempio non certifica una configurazione.

Per modifiche a management VLAN, trunk, policy firewall, DHCP/DNS o rete Proxmox, richiedi un accesso console/out-of-band e rollback praticabili. Preserva quorum e dipendenze del cluster quando coinvolte. Non pubblicare console, resolver o hypervisor per semplificare l'accesso.

Prova il cambiamento su un client o segmento autorizzato prima del rollout. Verifica lease, resolver, route, accesso Internet e isolamento richiesto, poi soprattutto la raggiungibilità del management. Un incidente di rete non autorizza allow-all, cambi di trust zone o nuove credenziali. Per sicurezza generale usa `security-and-hardening`; per quorum/storage usa il runbook Proxmox/Ceph.
