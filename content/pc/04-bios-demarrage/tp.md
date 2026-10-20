---
title: "TP 4 – BIOS, UEFI et démarrage des systèmes"
---

<nav class="chapter-resources" aria-label="Ressources du chapitre" data-course-key="pc/04-bios-demarrage"><div class="resource-buttons"><a class="resource-button" data-resource-kind="markdown" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 24"><rect x="1" y="1" width="30" height="22" rx="3" fill="none" stroke="#34495e" stroke-width="2"/><path d="M5 18V6h3l4 5 4-5h3v12h-3v-7l-4 5-4-5v7Z" fill="#34495e"/><path d="M23 6h3v7h3l-4.5 5-4.5-5h3Z" fill="#34495e"/></svg>
</span><span class="resource-label">Cours</span></a><a class="resource-button" data-resource-kind="html" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/html/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 32"><path d="M2 2h24l-2 25-10 3-10-3Z" fill="#e44d26"/><path d="M14 5v22l7-2 2-20Z" fill="#f16529"/><path d="M7 8h15l-.3 3H11l.3 3h10l-.8 9-6.5 2-6.5-2-.4-5h3l.2 2.6 3.7 1 3.7-1 .3-3.6H8Z" fill="#fff"/></svg>
</span><span class="resource-label">HTML</span></a><a class="resource-button" data-resource-kind="quiz" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/quiz/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="4" y="3" width="24" height="26" rx="6" fill="#7652ad"/><path d="M12 12a4 4 0 1 1 6 3.5c-1.5.8-2 1.4-2 3" fill="none" stroke="#fff" stroke-width="2.8" stroke-linecap="round"/><circle cx="16" cy="23" r="1.6" fill="#fff"/></svg>
</span><span class="resource-label">Quiz</span></a><a class="resource-button" data-resource-kind="tp" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/tp"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="2" y="4" width="28" height="24" rx="5" fill="#237b60"/><path d="m8 12 5 4-5 4m9 0h7" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
</span><span class="resource-label">TP</span></a></div><div class="resource-actions"><a class="resource-download" download href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/pc/tp/04-bios-demarrage.md">↓ Télécharger le TP (.md)</a><button type="button" class="support-focus-toggle" aria-pressed="false">Masquer les menus</button></div></nav>


> Chapitre associé : `cours/04-bios-demarrage.md`

## Objectif

Découvrir par l'expérimentation les différences entre BIOS et UEFI, et comprendre les contraintes modernes de démarrage, notamment pour Windows 11.

## Mise en situation

Vous disposez d'un hyperviseur et de deux ISO :
* Windows 11
* Une distribution Linux de votre choix

Votre objectif : installer une machine virtuelle de chaque, sachant que les paramètres de démarrage ne sont **pas identiques**.

## Travail demandé

1. Réaliser les installations jusqu'à obtenir un système fonctionnel
2. Tester différents réglages, noter les échecs autant que les réussites
3. Identifier le mode de démarrage utilisé pour chaque système

## Questions à traiter

1. Quels réglages ont été nécessaires pour Windows 11 ?
2. Les mêmes réglages fonctionnent-ils pour Linux ?
3. Quels éléments semblent imposés par l'OS ?
4. Quel mode vous paraît le plus adapté aujourd'hui ?
5. Que se passerait-il si ces réglages étaient appliqués à un PC inadapté ?

## Rendu attendu

* Une note Markdown structurée dans votre HedgeDoc
* Des observations personnelles issues de vos tests
* Un article dans la base de connaissances GLPI
