# Chapitre 6 – Maintenance et résolution de pannes

> [!TIP] Ressources du chapitre
>
> - [Faire le quiz — 20 questions](https://kayasam.github.io/configuration-maintenance-pc/cours/quiz/07-maintenance-diagnostic.html)
> - [Ouvrir la version HTML interactive](https://kayasam.github.io/configuration-maintenance-pc/cours/07-maintenance-diagnostic-interactif.html)
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/cours/07-maintenance-diagnostic.md" download>Télécharger ce cours en Markdown</a>

## Maintenance préventive et corrective

La maintenance informatique ne consiste pas uniquement à intervenir quand un poste est déjà en panne.

On distingue deux grandes approches :

| Type                       | Objectif                                  | Exemple                                           |
| -------------------------- | ----------------------------------------- | ------------------------------------------------- |
| **Maintenance préventive** | Éviter les pannes avant qu'elles arrivent | Nettoyage, mises à jour, surveillance disque      |
| **Maintenance corrective** | Corriger une panne déjà présente          | Remplacer une barrette RAM, réinstaller un pilote |

> [!info]
> Un bon technicien support ne cherche pas seulement à "réparer". Il cherche aussi à éviter que le même problème revienne.

---

## Maintenance préventive

La maintenance préventive permet de garder les postes stables, performants et sécurisés.

Actions courantes :

- vérifier les mises à jour système
- contrôler l'espace disque disponible
- surveiller l'état du stockage
- nettoyer les fichiers temporaires
- limiter les programmes au démarrage
- vérifier l'antivirus / sécurité Windows
- dépoussiérer les postes fixes
- contrôler les ventilateurs et températures
- vérifier les sauvegardes

> [!warning]
> Une sauvegarde non testée n'est pas une vraie sauvegarde. Il faut vérifier qu'une restauration est possible.

---

## Maintenance corrective

La maintenance corrective intervient lorsqu'un incident est déjà présent.

Exemples :

| Symptôme                 | Action corrective possible                                  |
| ------------------------ | ----------------------------------------------------------- |
| PC lent                  | Analyse des ressources, nettoyage, remplacement HDD par SSD |
| Écran noir               | Vérification écran, câble, RAM, GPU, boot                   |
| Plus de réseau           | Test câble, IP, DNS, pilote réseau                          |
| Périphérique non reconnu | Test port/câble, pilote, autre poste                        |
| Redémarrage aléatoire    | Température, alimentation, RAM, journal système             |
| Stockage saturé          | Nettoyage, archivage, extension disque                      |

La correction doit toujours être suivie d'une **vérification**.

---

## Méthodologie complète de diagnostic

Face à une panne, il faut éviter de sauter directement sur une solution.

Méthode conseillée :

1. **Comprendre la demande**
   - Que dit l'utilisateur ?
   - Depuis quand ?
   - Quel est l'impact ?

2. **Observer les symptômes**
   - Message d'erreur ?
   - Bruit ?
   - Lenteur ?
   - Panne totale ou partielle ?

3. **Délimiter le périmètre**
   - Un seul utilisateur ?
   - Un seul poste ?
   - Tout un service ?
   - Un seul logiciel ?

4. **Formuler des hypothèses**
   - Matériel ?
   - Logiciel ?
   - Réseau ?
   - Utilisateur ?
   - Mise à jour récente ?

5. **Tester du plus simple au plus probable**
   - câble
   - redémarrage
   - autre port
   - autre compte
   - autre poste
   - journaux système

6. **Appliquer la solution**
   - corriger
   - documenter ce qui a été fait
   - éviter les manipulations inutiles

7. **Vérifier**
   - test fonctionnel
   - confirmation utilisateur
   - surveillance si nécessaire

8. **Documenter**
   - ticket GLPI
   - article de base de connaissances si le cas est réutilisable

> [!tip]
> Le diagnostic est une réduction progressive de l'incertitude.

---

## Outils de diagnostic Windows

| Outil                             | Utilité                                              |
| --------------------------------- | ---------------------------------------------------- |
| **Gestionnaire des tâches**       | CPU, RAM, disque, réseau, applications au démarrage  |
| **Moniteur de ressources**        | Analyse plus détaillée des ressources                |
| **Observateur d'événements**      | Erreurs système, redémarrages, pilotes               |
| **Gestionnaire de périphériques** | Pilotes, périphériques inconnus, erreurs matérielles |
| **Gestion des disques**           | Disques, partitions, lettres de lecteur              |
| **Paramètres réseau**             | IP, DNS, carte réseau, proxy                         |
| **Sécurité Windows**              | Antivirus, protection, menaces                       |

Commandes utiles :

```powershell
ipconfig /all
ping 8.8.8.8
nslookup google.com
chkdsk
sfc /scannow
systeminfo
```

> [!warning]
> Certaines commandes peuvent prendre du temps ou nécessiter des droits administrateur. On les utilise avec un objectif clair.

---

## PC lent : diagnostic type

Un PC lent est un symptôme très fréquent, mais la cause peut être multiple.

| Observation                | Piste                                          |
| -------------------------- | ---------------------------------------------- |
| CPU proche de 100 %        | Application lourde ou bloquée                  |
| RAM saturée                | Manque de mémoire, trop d'applications         |
| Disque à 100 %             | HDD lent, indexation, antivirus, manque de RAM |
| Espace disque faible       | Nettoyage ou archivage nécessaire              |
| Lenteur au démarrage       | Trop de programmes au démarrage                |
| Ventilateurs très bruyants | Chauffe, poussière, charge élevée              |

Méthode simple :

1. Demander depuis quand le poste est lent.
2. Ouvrir le Gestionnaire des tâches.
3. Observer CPU / RAM / disque.
4. Vérifier l'espace disque.
5. Vérifier les applications au démarrage.
6. Identifier une action corrective.
7. Mesurer si la situation s'améliore.

---

## Écran noir : diagnostic type

Un écran noir ne signifie pas automatiquement que le PC est mort.

Questions à poser :

- Le PC s'allume-t-il ?
- Les ventilateurs tournent-ils ?
- Y a-t-il un logo constructeur ?
- L'écran affiche-t-il "No signal" ?
- Le câble vidéo est-il branché au bon endroit ?
- Le poste utilise-t-il une carte graphique dédiée ?
- Un autre écran fonctionne-t-il ?

Pistes fréquentes :

| Symptôme                     | Piste                                  |
| ---------------------------- | -------------------------------------- |
| Aucun voyant                 | alimentation, prise, câble             |
| PC allumé, écran "No signal" | câble, source écran, GPU               |
| Logo visible puis écran noir | système, pilote graphique, résolution  |
| Bips au démarrage            | POST, RAM, GPU                         |
| Redémarrages en boucle       | RAM, stockage, mise à jour, surchauffe |

---

## Stockage saturé

Un stockage saturé peut provoquer :

- ralentissements
- mises à jour impossibles
- erreurs applicatives
- impossibilité d'enregistrer
- profil utilisateur instable

Actions possibles :

- identifier les dossiers volumineux
- vider les fichiers temporaires
- supprimer ou archiver les anciens fichiers
- vérifier les téléchargements
- déplacer les données vers un espace réseau
- augmenter la capacité si nécessaire

> [!warning]
> On ne supprime jamais des fichiers utilisateur sans validation.

---

## À retenir

> [!summary] À retenir
>
> - La maintenance préventive évite une partie des incidents.
> - La maintenance corrective doit suivre une méthode.
> - Un symptôme peut avoir plusieurs causes.
> - Les tests doivent aller du plus simple au plus probable.
> - Toute intervention doit être documentée.
