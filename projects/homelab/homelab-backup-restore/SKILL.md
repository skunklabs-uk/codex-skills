---
name: homelab-backup-restore
description: "Usa per verificare o modificare backup e recupero Homelab: CNPG, Barman, RGW, R2, rclone, Filestash e drill autorizzati."
---

# Backup e ripristino Homelab

Leggi `AGENTS.md`, il runbook di backup corrente, `gitops/apps/rclone/README.md`, i manifest e il runbook del workload. Ricava da queste fonti sorgente, destinazioni, retention, recovery, RPO/RTO e stato di distribuzione. Non congelare nella skill il vecchio target Google Drive o dichiarare R2 operativo dal solo piano approvato.

## Vincoli locali

- Distingui decisione approvata, manifest in Git, job realmente eseguiti e restore provato. Un nome CronJob legacy `to-gdrive` non determina il remote usato: controlla argomenti e configurazione.
- Preserva cluster/PVC sorgenti, archivi RGW e copie storiche. La rimozione di un target dalle nuove copie non autorizza cancellazione, dedupe o modifica degli archivi, né il ritiro del remote usato per altri scopi, inclusa la custodia Age.
- Non cambiare modalità di backup senza rollback e percorso di recupero verificabile. Mantieni prefissi di produzione, restore e prove temporanee separati.
- Verifica salute e writer endpoint del cluster interessato prima e dopo operazioni autorizzate. Non assumere presenti vecchi cluster di migrazione, ad esempio `postgres-green`.
- Per CNPG/Barman verifica condizioni Ready/ContinuousArchiving quando applicabili, catalogo e fase del backup, ObjectStore e plugin previsti dai manifest. Usa il `serverName` sorgente quando il contratto del restore lo richiede.

## Evidenze e prove

Per offsite, confronta le copie sui percorsi effettivamente configurati con evidenze di integrità/freschezza adeguate; un semplice elenco o confronto size-only non dimostra un restore. Mantieni distinti successo del trasferimento e recuperabilità.

Un drill autorizzato usa cluster e prefisso temporanei, verifica il dato ripristinato in sola lettura e rimuove esclusivamente le risorse temporanee create per quella prova. Non eseguire restore o job manuali durante una sola ispezione. Se mancano runtime o credenziali autorizzate, indica il limite senza inventare esiti. Non stampare secret.

Un writer senza endpoint, archiviazione richiesta in errore, plugin assente o catalogo mancante blocca l'operazione dipendente e richiede diagnosi o rollback; non un nuovo tentativo alla cieca.
