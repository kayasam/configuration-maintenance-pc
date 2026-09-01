# Publier la formation depuis le coffre Obsidian

Les sources officielles restent dans :

- `C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\Formations\configuration-maintenance-pc\cours`

Chaque dossier de chapitre contient le cours Markdown, sa version HTML interactive et, lorsqu'il
existe, un sous-dossier `tp`. Le fichier `parcours-interactif.html` reste à la racine de `cours`.

## Publication rapide

1. Terminer les modifications dans Obsidian et attendre la synchronisation Nextcloud.
2. Ouvrir `D:\Projet-git\configuration-maintenance-pc`.
3. Double-cliquer sur `Publier les cours.cmd`.
4. Saisir un message de publication, ou appuyer sur Entrée.
5. Confirmer avec `O`.

Le script :

- range les 7 cours Markdown dans un dossier par chapitre ;
- range les 6 TP publics sous leur chapitre associé ;
- synchronise les versions HTML et les quiz ;
- copie les ressources communes des cours HTML ;
- reconstruit un coffre étudiant propre dans `student-vault` pour le ZIP ;
- conserve et publie les 7 quiz de 20 questions ;
- ajoute automatiquement le lien du quiz correspondant dans chaque chapitre ;
- exclut les sessions, archives et fichiers Excalidraw ;
- ajoute les liens HTML et téléchargements sans modifier le coffre ;
- vérifie le build Quartz avant tout commit ;
- crée le commit et l'envoie sur GitHub après confirmation.

Le programme conservé dans le coffre Obsidian n'est pas publié sur le site des élèves.
Le ZIP ne contient ni dossier `assets`, ni programme, ni session : seulement les cours Markdown
et HTML classés par chapitre, ainsi que les TP.

Site prévu : <https://kayasam.github.io/configuration-maintenance-pc/>

> [!NOTE]
> Dans les réglages du dépôt GitHub, sélectionner **GitHub Actions** comme source de GitHub Pages.

## Où modifier les quiz

Les sources durables des quiz se trouvent dans `site-content` :

- questions : `site-content/assets/quiz/quiz-banks.js` ;
- moteur : `site-content/assets/quiz/quiz-engine.js` ;
- apparence : `site-content/assets/quiz/quiz.css` ;
- pages : `site-content/cours/quiz/`.

Ne pas modifier uniquement les copies présentes dans `content`. Ce dossier est reconstruit à
chaque publication. Le script recopie les sources durables ci-dessus et refuse de continuer si
une ressource obligatoire de quiz est absente.
