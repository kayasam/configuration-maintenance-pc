---
title: "TP 6 — Maintenance et diagnostic"
aliases:
  - "/tp/07-tp-maintenance"
---

# TP 7 – Cellule de crise support

> [!TIP] Ressource du TP
>
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/07-tp-maintenance.md" download>Télécharger ce TP en Markdown</a>

> Chapitre associé : `cours/07-maintenance-diagnostic.md`

## Objectif

Résoudre plusieurs incidents réalistes en appliquant une méthode complète de diagnostic.

À la fin du TP, vous devez être capables de :

- interroger un utilisateur
- identifier les symptômes utiles
- formuler des hypothèses
- proposer des tests cohérents
- expliquer une solution
- documenter dans GLPI et HedgeDoc

---

## Contexte

Vous êtes techniciens support.

Plusieurs tickets arrivent le même matin. Samuel joue les utilisateurs concernés.

Votre rôle n'est pas de deviner immédiatement la panne, mais de **poser les bonnes questions** pour obtenir progressivement les informations nécessaires.

> [!info]
> Le formateur ne donne les indices que si les bonnes questions sont posées.

---

## Organisation

- Travail seul ou en binôme
- Chaque groupe prend un ticket
- Un échange avec l'utilisateur est obligatoire
- Le diagnostic doit être justifié
- La solution doit être documentée

---

## Tickets disponibles

### Ticket 1 – PC très lent

**Titre** : Poste comptabilité très lent depuis ce matin

**Message utilisateur** :

> Bonjour, mon PC met très longtemps à démarrer et tout est lent. J'ai une clôture comptable à terminer.

**Indices à donner progressivement** :

1. Le problème est surtout visible après l'ouverture de session.
2. Le Gestionnaire des tâches montre le disque à 100 % pendant plusieurs minutes.
3. Le poste utilise encore un HDD et plusieurs applications se lancent au démarrage.

**Diagnostic attendu** :

Lenteur liée au stockage et aux programmes au démarrage.

**Solution possible** :

Réduire les applications au démarrage, nettoyer le disque, vérifier l'état du HDD, recommander une migration SSD.

---

### Ticket 2 – Écran noir

**Titre** : Aucun affichage sur le poste de réunion

**Message utilisateur** :

> Le PC de la salle de réunion s'allume, mais l'écran reste noir. La réunion commence bientôt.

**Indices à donner progressivement** :

1. Le PC semble allumé, les ventilateurs tournent.
2. L'écran affiche "No signal".
3. Le câble HDMI est branché sur la carte mère alors que le PC possède une carte graphique dédiée.

**Diagnostic attendu** :

Mauvaise sortie vidéo utilisée.

**Solution possible** :

Brancher l'écran sur la carte graphique dédiée, vérifier la source de l'écran, tester l'affichage.

---

### Ticket 3 – Plus de réseau

**Titre** : Poste connecté mais aucun site ne s'ouvre

**Message utilisateur** :

> Je suis connecté au réseau, mais aucun site ne fonctionne. Les collègues n'ont pas le problème.

**Indices à donner progressivement** :

1. L'adresse IP semble correcte.
2. `ping 8.8.8.8` fonctionne.
3. `ping google.com` échoue.

**Diagnostic attendu** :

Problème DNS.

**Solution possible** :

Vérifier les DNS configurés, remettre en DHCP ou configurer un DNS valide selon la politique de l'entreprise.

---

### Ticket 4 – Disque plein

**Titre** : Impossible d'enregistrer un fichier

**Message utilisateur** :

> Windows me dit qu'il n'y a plus assez d'espace disque. Je n'ai pourtant rien fait de spécial.

**Indices à donner progressivement** :

1. Le disque système est presque plein.
2. Le dossier Téléchargements contient plusieurs ISO et archives.
3. Des fichiers temporaires occupent aussi beaucoup d'espace.

**Diagnostic attendu** :

Stockage saturé par fichiers utilisateur et temporaires.

**Solution possible** :

Identifier les fichiers volumineux, demander validation avant suppression, nettoyer les fichiers temporaires, proposer archivage.

---

### Ticket 5 – Périphérique USB non reconnu

**Titre** : Disque externe non détecté

**Message utilisateur** :

> J'ai branché le disque externe de sauvegarde, mais il n'apparaît pas.

**Indices à donner progressivement** :

1. Le disque ne s'affiche pas dans l'explorateur.
2. Il apparaît dans la Gestion des disques.
3. Le volume n'a pas de lettre de lecteur.

**Diagnostic attendu** :

Volume présent mais non monté avec une lettre.

**Solution possible** :

Attribuer une lettre de lecteur, vérifier l'accès, ne pas formater sans validation.

---

## Travail demandé

Pour votre ticket, produire dans GLPI :

1. un suivi de premier contact
2. un suivi de diagnostic
3. un suivi de solution
4. une clôture propre

Dans HedgeDoc, produire une note Markdown :

```md
# [Titre du ticket]

## Problème

## Symptômes

## Questions posées

## Hypothèses

## Tests proposés ou réalisés

## Diagnostic retenu

## Solution

## Vérification

## Prévention
```

---

## Restitution orale

Chaque groupe présente en 3 minutes :

- le symptôme initial
- les questions importantes posées
- les hypothèses envisagées
- le diagnostic retenu
- la solution proposée
- une action préventive

---

## Barème indicatif

| Critère                           | Points |
| --------------------------------- | -----: |
| Questions utilisateur pertinentes |      4 |
| Hypothèses cohérentes             |      4 |
| Tests dans un ordre logique       |      4 |
| Solution adaptée                  |      4 |
| Documentation claire              |      4 |

Total : **20 points**

> [!tip]
> Le meilleur groupe n'est pas celui qui devine le plus vite. C'est celui qui explique le mieux son raisonnement.
