# Formation PC — modèle commun Linux et Bash

Les sources officielles restent dans le coffre Obsidian. Le site lit seulement les six chapitres déclarés par `scripts/import-pc.py`, leurs HTML manuels, les cinq TP et les images. Le chapitre 07 retiré reste exclu. Aucun dossier du coffre ne doit être déplacé par ces scripts.

Les quiz se modifient dans `site-content/assets/quiz/quiz-banks.js`. Les copies intermédiaires dans `sources/` sont privées et régénérées. `content/` contient le résultat public généré, à ne pas modifier à la main.

## Prévisualiser

Exécuter `./construire.ps1`, puis `python scripts/serve-preview.py --port 8791`. Ouvrir http://127.0.0.1:8791/configuration-maintenance-pc/.

Le site propose Cours / HTML / Quiz / TP selon les ressources disponibles, les menus masquables, un ZIP et un seul PDF complet sur l’accueil. Les images et les liens des supports hors ligne sont vérifiés. Les anciennes adresses publiques redirigent vers les nouvelles pages.

## Publier

`Publier les cours.cmd` prépare et vérifie le site avant de demander confirmation. `./publier.ps1` prépare seulement ; `./publier.ps1 -Push` construit, vérifie puis publie sur le dépôt configuration-maintenance-pc.

Le workflow GitHub déploie les fichiers publics déjà préparés : il ne lit jamais le coffre local. Les corrigés restent privés tant que leur frontmatter ne comporte pas `publier: true`. Avant de publier un corrigé, utiliser la forme v2 avec énoncé et réponses repliées ; le contrôle de construction l’exige.

La sauvegarde intégrale précédant cette adaptation est conservée dans `D:/Projet-git/backups/pc-avant-modele-20261020-100726.zip`. L’historique Git conserve aussi la version précédente.
