---
title: "TP 4 — Stockage et partitionnement"
aliases:
  - "/tp/05-tp-stockage"
---

# TP 4 – Stockage, partitionnement et analyse

> [!TIP] Ressource du TP
>
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/05-tp-stockage.md" download>Télécharger ce TP en Markdown</a>

> Chapitre associé : `cours/05-stockage.md`

## Objectif

Comprendre concrètement comment un disque devient utilisable par un système.

À la fin du TP, vous devez savoir : identifier un disque, le partitionner, le formater, le rendre accessible, et expliquer ce que vous avez fait.

## Contexte

Vous travaillez sur une **machine virtuelle Windows 11**.
Un **disque virtuel supplémentaire** a été ajouté dans VirtualBox.
Ce disque est neuf, vide, et non utilisable au départ.

## Étapes

**Étape 1 – Identifier le disque**

- Ouvrir la gestion des disques Windows
- Repérer le nouveau disque
- Vérifier qu'il n'est pas initialisé

**Étape 2 – Initialiser et partitionner**

- Initialiser le disque
- Choisir le type de table de partition
- Créer une partition unique

**Étape 3 – Formater**

- Choisir un système de fichiers adapté
- Donner un nom au volume

**Étape 4 – Rendre accessible**

- Vérifier qu'une lettre de lecteur est attribuée
- Accéder au volume depuis l'explorateur

**Étape 5 – Analyse**

- Pourquoi le disque n'était pas utilisable au départ ?
- À quoi servent le partitionnement et le formatage ?
- Que se passerait-il si le disque n'était pas formaté ?

## Rendu attendu

Une note Markdown dans votre HedgeDoc avec : titre, étapes réalisées, captures si nécessaire, paragraphe d'analyse.

> [!tip] Pour aller plus loin
> installer Debian 13 dans une nouvelle VM, ajouter un second disque virtuel, et reproduire la même démarche sous Linux.
