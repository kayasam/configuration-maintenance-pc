---
title: "TP 1 — Support et ticketing"
aliases:
  - "/tp/01-tp-role-technicien"
---

# TP 1 – Prise en main du support et du ticketing

> [!TIP] Ressource du TP
>
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/01-tp-role-technicien.md" download>Télécharger ce TP en Markdown</a>

> Chapitre associé : `cours/01-role-du-technicien.md`

## Accès GLPI

**URL** : https://glpi.kaya.ovh

**Comptes** : prénom sans majuscule

**Mot de passe** :

```
s%~6Mf1E5oV9=V,"Lg5k:g
```

Chaque compte dispose d'un **profil Technicien**.

---

## Objectif

Traiter un ticket support en appliquant une démarche logique :

1. Comprendre le problème
2. Identifier les symptômes
3. Poser des questions utiles
4. Émettre des hypothèses
5. Formuler un diagnostic
6. Proposer une solution claire
7. Documenter dans GLPI
8. Produire une note réutilisable

> [!info]
> Samuel joue le rôle de l'utilisateur. Il a créé le ticket. Vous êtes le technicien.

---

## 1. Prise en charge du ticket

- Ouvrir votre ticket dans GLPI
- Le lire attentivement
- Identifier :
  - ce qui est décrit clairement
  - ce qui manque pour pouvoir avancer
  - une première hypothèse

---

## 2. Premier contact avec l'utilisateur

Ajoutez un **suivi dans GLPI** pour répondre à l'utilisateur.

Votre message doit :

- **reformuler le problème** dans vos mots — pour valider que vous avez bien compris
- **poser les questions** qui vous manquent pour diagnostiquer
- **indiquer votre première piste** sans la présenter comme une certitude

Soyez naturel et professionnel. Pas de template imposé — c'est à vous de formuler selon le contexte du ticket.

> [!tip] Auto-évaluation
> **Bon signe** : votre message est court, ciblé, et l'utilisateur peut y répondre facilement.
>
> **Mauvais signe** : vous listez 10 questions ou vous proposez une solution sans avoir assez d'infos.

---

## 3. Diagnostic

Après échange avec l'utilisateur, ajoutez un second suivi structuré :

```md
## Diagnostic

### Symptômes observés

- ...
- ...

### Hypothèses

- ...
- ...

### Vérifications à effectuer

1. ...
2. ...

### Conclusion

...
```

---

## 4. Solution proposée

Ajoutez un troisième suivi :

```md
## Solution proposée

### Étapes

1. ...
2. ...
3. ...

### Vérification

- Comment s'assurer que le problème est résolu ?
- ...
```

---

## 5. Clôture du ticket

- Identifier la cause probable
- Marquer le ticket comme résolu dans GLPI
- Vérifier que l'utilisateur a confirmé (ou que le problème est objectivement résolu)

---

## 6. Documentation dans votre HedgeDoc

Dans votre HedgeDoc personnel, créez une note avec la structure suivante :

```md
# [Titre du problème]

## Problème

Description du problème tel que signalé par l'utilisateur.

## Symptômes

- ...
- ...

## Hypothèses

- ...
- ...

## Diagnostic

Explication de votre raisonnement.

## Solution

Étapes de résolution.

## Vérification

Comment confirmer que le problème est corrigé.
```

---

## 7. Base de connaissances GLPI

- Créer un **article de base de connaissances**
- Titre clair et explicite
- Copier la procédure Markdown
- Lier l'article au ticket si possible

---

## Rendu attendu

| Élément               | Attendu                             |
| --------------------- | ----------------------------------- |
| Suivis GLPI           | 3 (contact / diagnostic / solution) |
| Note HedgeDoc         | 1 note structurée                   |
| Base de connaissances | 1 article lié au ticket             |
