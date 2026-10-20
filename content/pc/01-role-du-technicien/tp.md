---
title: "TP 1 – Prise en main du support et du ticketing"
---

<nav class="chapter-resources" aria-label="Ressources du chapitre" data-course-key="pc/01-role-du-technicien"><div class="resource-buttons"><a class="resource-button" data-resource-kind="markdown" href="https://kayasam.github.io/configuration-maintenance-pc/pc/01-role-du-technicien/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 24"><rect x="1" y="1" width="30" height="22" rx="3" fill="none" stroke="#34495e" stroke-width="2"/><path d="M5 18V6h3l4 5 4-5h3v12h-3v-7l-4 5-4-5v7Z" fill="#34495e"/><path d="M23 6h3v7h3l-4.5 5-4.5-5h3Z" fill="#34495e"/></svg>
</span><span class="resource-label">Cours</span></a><a class="resource-button" data-resource-kind="html" href="https://kayasam.github.io/configuration-maintenance-pc/pc/01-role-du-technicien/html/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 32"><path d="M2 2h24l-2 25-10 3-10-3Z" fill="#e44d26"/><path d="M14 5v22l7-2 2-20Z" fill="#f16529"/><path d="M7 8h15l-.3 3H11l.3 3h10l-.8 9-6.5 2-6.5-2-.4-5h3l.2 2.6 3.7 1 3.7-1 .3-3.6H8Z" fill="#fff"/></svg>
</span><span class="resource-label">HTML</span></a><a class="resource-button" data-resource-kind="quiz" href="https://kayasam.github.io/configuration-maintenance-pc/pc/01-role-du-technicien/quiz/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="4" y="3" width="24" height="26" rx="6" fill="#7652ad"/><path d="M12 12a4 4 0 1 1 6 3.5c-1.5.8-2 1.4-2 3" fill="none" stroke="#fff" stroke-width="2.8" stroke-linecap="round"/><circle cx="16" cy="23" r="1.6" fill="#fff"/></svg>
</span><span class="resource-label">Quiz</span></a><a class="resource-button" data-resource-kind="tp" href="https://kayasam.github.io/configuration-maintenance-pc/pc/01-role-du-technicien/tp"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="2" y="4" width="28" height="24" rx="5" fill="#237b60"/><path d="m8 12 5 4-5 4m9 0h7" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
</span><span class="resource-label">TP</span></a></div><div class="resource-actions"><a class="resource-download" download href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/pc/tp/01-role-du-technicien.md">↓ Télécharger le TP (.md)</a><button type="button" class="support-focus-toggle" aria-pressed="false">Masquer les menus</button></div></nav>


> Chapitre associé : `cours/01-role-du-technicien.md`

## Accès GLPI

**URL** : https://glpi.kaya.ovh

**Comptes** : prénom sans majuscule

**Mot de passe** :
```
demander au formateur
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

* Ouvrir votre ticket dans GLPI
* Le lire attentivement
* Identifier :
  * ce qui est décrit clairement
  * ce qui manque pour pouvoir avancer
  * une première hypothèse

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

* Identifier la cause probable
* Marquer le ticket comme résolu dans GLPI
* Vérifier que l'utilisateur a confirmé (ou que le problème est objectivement résolu)

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

* Créer un **article de base de connaissances**
* Titre clair et explicite
* Copier la procédure Markdown
* Lier l'article au ticket si possible

---

## Rendu attendu

| Élément | Attendu |
|---|---|
| Suivis GLPI | 3 (contact / diagnostic / solution) |
| Note HedgeDoc | 1 note structurée |
| Base de connaissances | 1 article lié au ticket |
