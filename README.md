# Configuration et maintenance PC

Site de formation basé sur le modèle Quartz validé pour Linux et Bash : même présentation, navigation, sommaire et thèmes.

Les six chapitres publiés, leurs HTML, les cinq TP et les images proviennent du coffre Obsidian en lecture seule. Les six quiz proviennent de `site-content/assets/quiz/quiz-banks.js`. Les corrigés restent privés tant que leur publication n’est pas activée.

- Installer les dépendances : `./installer.ps1`.
- Construire et vérifier : `./construire.ps1`.
- Aperçu : `python scripts/serve-preview.py --port 8791`.
- Publier explicitement : `./publier.ps1 -Push`.

Voir [le mode d’emploi](MODE-EMPLOI-PUBLICATION.md) pour le détail. Le workflow GitHub publie le contenu public préparé sans accéder au coffre. Le modèle source dans `D:/Projet-git/modele-site-formation` reste indépendant.
