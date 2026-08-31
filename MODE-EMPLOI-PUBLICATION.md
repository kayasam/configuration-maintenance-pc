# Publier la formation depuis le coffre Obsidian

Les sources officielles restent dans :

- `C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\Formations\configuration-maintenance-pc`
- `C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\cours-html\configuration-maintenance-pc`

## Publication rapide

1. Terminer les modifications dans Obsidian et attendre la synchronisation Nextcloud.
2. Ouvrir `D:\Projet-git\configuration-maintenance-pc`.
3. Double-cliquer sur `Publier les cours.cmd`.
4. Saisir un message de publication, ou appuyer sur Entrée.
5. Confirmer avec `O`.

Le script :

- synchronise les 7 cours Markdown et leurs versions HTML ;
- synchronise les 6 TP publics ;
- copie le programme Markdown et PDF ;
- copie les ressources communes des cours HTML ;
- exclut les sessions, archives et fichiers Excalidraw ;
- ajoute les liens HTML et téléchargements sans modifier le coffre ;
- vérifie le build Quartz avant tout commit ;
- crée le commit et l'envoie sur GitHub après confirmation.

Site prévu : <https://kayasam.github.io/configuration-maintenance-pc/>

> [!NOTE]
> Dans les réglages du dépôt GitHub, sélectionner **GitHub Actions** comme source de GitHub Pages.
