---
name: homelab-app-onboarding
description: "Usa per inserire un’applicazione nell’Homelab e definire ownership GitOps, database, secret, esposizione e Homepage."
---

# Onboarding applicazioni Homelab

Leggi `AGENTS.md`, il runbook corrente e un'app analoga sotto `gitops/apps/`. Ricava dal repository namespace, Application Argo, layout, dipendenze e convenzioni: non creare componenti soltanto perché compaiono in una ricetta.

Il layout ordinario è `gitops/apps/<app>/` con la relativa Application sotto `gitops/apps/applications/`. Verifica se servono davvero database, PVC, object storage e backup; per PostgreSQL controlla l'ownership sotto `gitops/apps/postgres/` e la reflection dei secret verso il namespace applicativo.

Determina esposizione interna/LAN/tunnel privato/tunnel pubblico e visibilità Homepage. Usa il contratto di `homelab-gateway-routes` per HTTPRoute e default espliciti, e `homelab-secret-management` per SOPS e bootstrap. Mantieni `revisionHistoryLimit: 0` dove previsto dalla convenzione corrente o motiva la deroga.

La consegna segue `homelab-gitops-operations`: manifesta in Git le risorse durevoli, valida, verifica la revisione applicata e la salute dell'app. Nessuna risorsa manuale permanente, secret plaintext o backup senza owner/retention/restore definiti.
