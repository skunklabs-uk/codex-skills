---
name: homelab-gitops-operations
description: "Usa per modificare manifest Homelab, riconciliare Application Argo o verificare una revisione distribuita."
---

# Operazioni GitOps Homelab

Leggi `AGENTS.md`, i manifest e il runbook corrente del servizio. Prima di assumere lo stato operativo, confronta sorgente, documentazione e revisione live disponibile; usa `reality-check` per discrepanze o baseline incerta.

Git governa i cambi durevoli sotto `gitops/`. Un'operazione manuale live è ammessa soltanto per diagnostica, drill o recovery autorizzati e richiede riconciliazione/cleanup; non nascondere drift cambiando soltanto il cluster.

## Esecuzione

1. Identifica Application, file e risorse interessate, impatto, verifica e rollback. Per lavori articolati usa il piano upstream appropriato, non un secondo piano Homelab. Preflight, revisione Argo, osservazioni live e cleanup devono restare nello stesso piano/runbook.
2. Valida i manifest prima del push. Per Application SOPS, un `kubectl apply -k` diretto può fallire sui secret cifrati: usa la validazione prevista dal progetto, senza decifrare in output o applicare ciphertext live.
3. Dopo commit/push autorizzati verifica che Argo riconcili la revisione attesa, non solo che mostri Healthy. Hard refresh o gestione di sync bloccati seguono il runbook, non tentativi indiscriminati.
4. Osserva le risorse effettivamente coinvolte: readiness, condizioni degli operatori, endpoint e log pertinenti. Per workload con dati controlla writer endpoint e ownership dello storage.
5. Registra esito, revisione, eventuale rollback e aggiornamento delle fonti interessate. Senza accesso al cluster la verifica live resta non eseguita.

## Confini

Non eliminare PVC senza richiesta esplicita e recuperabilità verificata. Upgrade CRD/operatori hanno impatto potenzialmente cluster-wide e richiedono verifiche proporzionate. Risorse temporanee devono avere cleanup definito. Un writer senza endpoint, revisione inattesa, mancato progresso o errore CRD blocca l'azione dipendente: prima diagnosi/rollback, non ampliamento casuale del task. Autorizzazioni, segreti, costi e stop reali restano governati dal progetto.
