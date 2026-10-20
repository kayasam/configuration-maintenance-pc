# Chapitre 5 – Stockage et systèmes

> TP associé : [05-tp-stockage](https://kayasam.github.io/configuration-maintenance-pc/pc/05-stockage/tp)

## Pourquoi ce chapitre

Le stockage est le composant qui **se dégrade**, qui **se remplit**, et qui **perd des données**. C'est aussi, sur un poste ancien, le premier responsable de la lenteur ressentie : remplacer un disque dur par un SSD transforme davantage une machine qu'un changement de processeur.

Ce chapitre couvre trois niveaux : le disque physique, la manière dont un système le rend utilisable, et l'organisation du stockage en entreprise.

<iframe width="560" height="315" src="https://www.youtube.com/embed/oisyw58kQ4Q?si=DrGepShuOcE9dBg4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## Différencier technologie, format et bus

Un disque se décrit **toujours** par trois critères **indépendants**. Confondre ces axes est l'erreur d'achat la plus fréquente.

| Critère | Question à laquelle il répond |
|---|---|
| **Technologie** | Comment les données sont-elles stockées ? |
| **Format** | Quelle taille, quelle forme physique ? |
| **Bus / interface** | Comment le disque parle-t-il au système ? |

![technologie-format-bus.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/technologie-format-bus.svg)

---

## Technologie

### HDD (disque dur mécanique)

Des plateaux magnétiques tournent (5 400 ou 7 200 tr/min) pendant qu'une tête de lecture se déplace au-dessus. Toute lecture impose un **déplacement mécanique**, d'où la lenteur sur les accès dispersés.

* Grande capacité, coût au Go très faible
* Lent, bruyant, sensible aux chocs
* Toujours pertinent pour l'archivage et les gros volumes

![hdd-schema.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/hdd-schema.svg)

> [Disque dur — Wikipédia](https://fr.wikipedia.org/wiki/Disque_dur)

### SSD (mémoire flash)

Aucune pièce mobile : les données sont stockées dans des cellules de mémoire flash, accessibles électroniquement.

* Rapide, silencieux, résistant aux chocs, peu gourmand
* Nombre d'écritures limité par cellule
* Standard sur tout poste moderne

<iframe width="560" height="315" src="https://www.youtube.com/embed/mixHavLpwMw?si=NeUVd_tWcf3f92Wq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

![ssd-nvme-m2.jpg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/ssd-nvme-m2.jpg)

> [SSD — Wikipédia](https://fr.wikipedia.org/wiki/SSD)

### Cellules mémoire et endurance

Une cellule flash stocke plus ou moins de bits. Plus elle en stocke, moins elle est chère — et moins elle dure.

| Type | Bits/cellule | Endurance | Usage |
|---|---|---|---|
| **SLC** | 1 | Très élevée | Industriel, cache |
| **MLC** | 2 | Élevée | Professionnel (devenu rare) |
| **TLC** | 3 | Bonne | Standard grand public |
| **QLC** | 4 | Plus faible | Grande capacité, prix bas |

Deux notions qui expliquent des écarts de performance déroutants :

* **Cache SLC** — le SSD réserve une zone rapide pour absorber les écritures. Une fois saturée, le débit s'effondre. C'est pourquoi un SSD QLC peut copier 20 Go très vite, puis ralentir brutalement.
* **DRAM-less** — un SSD sans mémoire cache dédiée coûte moins cher mais s'écroule sur les petits fichiers. Fréquent en entrée de gamme.

**TBW** (*Terabytes Written*) : le volume total d'écriture garanti par le constructeur. Un SSD grand public de 1 To annonce typiquement 600 TBW — soit plusieurs dizaines d'années d'usage bureautique. L'usure n'est pas un souci en pratique sur un poste de travail.

---

## Format physique

| Format | Appareils | Technologies compatibles |
|---|---|---|
| **3,5 pouces** | PC fixes, NAS, serveurs | HDD |
| **2,5 pouces** | Portables, PC fixes | HDD ou SSD SATA |
| **M.2** | Directement sur la carte mère | SSD SATA **ou** NVMe |
| **Soudé / eMMC** | Portables fins, tablettes | Non remplaçable |

> [!warning] M.2 ne signifie pas NVMe
> M.2 est un **format**, pas un bus. Un SSD M.2 peut être SATA (550 Mo/s) ou NVMe (jusqu'à 14 Go/s) — pour le même encombrement et souvent la même apparence.

![m2-encoches.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/m2-encoches.svg)

> [!important]
> Sur les portables récents, le stockage est parfois **soudé à la carte mère** : aucune mise à niveau, aucun remplacement possible. À vérifier impérativement avant de proposer une intervention (voir [03-pc-portables](https://kayasam.github.io/configuration-maintenance-pc/pc/03-pc-portables/)).

---

## Bus / interface

| Bus | Débit théorique | Usage |
|---|---|---|
| **SATA III** | ~550 Mo/s | HDD, SSD 2,5" et SSD M.2 SATA |
| **PCIe 3.0 ×4 (NVMe)** | ~3,5 Go/s | SSD NVMe, génération courante |
| **PCIe 4.0 ×4 (NVMe)** | ~7 Go/s | SSD NVMe récents |
| **PCIe 5.0 ×4 (NVMe)** | ~14 Go/s | Haut de gamme |
| **USB 3.x** | 0,6 à 2 Go/s | Stockage externe |
| **SAS** | 12 Gb/s | Serveurs, baies professionnelles |

Le bus détermine le **plafond** de performance : un HDD branché en PCIe restera lent, mais un SSD NVMe bridé en SATA perd l'essentiel de son intérêt.

> [!tip] Lien avec la carte mère
> Les SSD NVMe consomment des **lignes PCIe**, parfois partagées avec le port graphique ou certains ports SATA. Remplir tous les slots M.2 peut désactiver des ports SATA — la documentation de la carte mère le précise. Voir [02-composants-pc](https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/).

---

## Rendre un disque utilisable

Un disque neuf n'est pas utilisable en l'état. Trois opérations successives sont nécessaires — c'est exactement la démarche du TP.

### L'analogie de l'immeuble

Trois étapes que les élèves confondent souvent, parce qu'elles se suivent et qu'on les enchaîne sans y penser dans l'assistant Windows. L'analogie du bâtiment les sépare nettement.

![analogie-immeuble.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/analogie-immeuble.svg)

| L'immeuble | Le disque | Sans cette étape |
|---|---|---|
| Un bâtiment livré brut | Disque neuf, non initialisé | Rien n'est possible |
| On monte les **cloisons** | **Partitionnement** — MBR ou GPT, puis découpage en volumes | Un seul espace indifférencié, inexploitable |
| On **aménage** : placards, étagères | **Formatage** — installation du système de fichiers | Aucune règle pour ranger et retrouver les fichiers |
| On donne une **rue et un numéro** | **Montage** — lettre `D:\` ou point de montage `/mnt/data` | Le volume existe mais reste introuvable |

> [!tip]
> Cette analogie vient du cours LPI 101 → 5, où la même démarche est menée en ligne de commande sous Linux (`cfdisk`, `mkfs.ext4`, `mount`).

### 1. La table de partition

Elle décrit le découpage du disque. Deux formats, déjà vus au chapitre précédent :

| | MBR | GPT |
|---|---|---|
| Taille maximale | ~2,2 To | ~9,4 Zo |
| Partitions | 4 principales | 128 sous Windows |
| Mode de démarrage | Legacy / CSM | UEFI |

Détail du couplage avec le firmware → [04-bios-demarrage](https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/).

### 2. Le partitionnement

Découper un disque en plusieurs volumes indépendants permet de **séparer le système des données** (réinstaller sans tout perdre), d'isoler des usages, ou de faire cohabiter plusieurs systèmes.

### 3. Le système de fichiers

Le formatage installe la structure qui permet de **ranger et retrouver** les fichiers : arborescence, noms, droits, journal.

| Système | Utilisé par | Points clés |
|---|---|---|
| **NTFS** | Windows | Droits d'accès, journalisation, chiffrement. Standard des disques Windows |
| **exFAT** | Multi-plateforme | Lu/écrit par Windows, macOS, Linux. **Idéal pour une clé USB ou un disque externe**. Pas de droits ni de journal |
| **FAT32** | Ancien, universel | Compatible partout, mais **fichier limité à 4 Go** et volume à 32 Go sous Windows. Utilisé pour la partition EFI |
| **ext4** | Linux | Système de fichiers par défaut de la plupart des distributions |

> [!tip] Quel système choisir ?
> * Disque interne Windows → **NTFS**
> * Clé USB / disque externe à échanger → **exFAT**
> * Disque interne Linux → **ext4**
>
> Une clé formatée en NTFS sera lue par Linux et macOS, mais l'écriture y est parfois problématique. exFAT évite ce piège.

> [!warning] Formater efface
> Formater une partition détruit son contenu. Avant toute opération sur un disque contenant des données, on **vérifie qu'une sauvegarde existe et qu'elle est restaurable**.

---

## Diagnostiquer un disque

### Les symptômes

| Symptôme | Piste |
|---|---|
| PC très lent au démarrage et à l'ouverture des applications | HDD en disque système — le remplacer par un SSD |
| Ralentissements soudains, système qui se fige | Disque saturé, ou secteurs défectueux |
| Cliquetis, grattement, bourdonnement | **HDD en fin de vie — sauvegarder immédiatement** |
| Fichiers corrompus, erreurs de lecture aléatoires | Secteurs défectueux, câble SATA défaillant |
| Disque absent de l'explorateur mais présent dans le BIOS | Non initialisé, non formaté, ou sans lettre de lecteur |
| Disque absent du BIOS | Câble, alimentation, ou disque mort |

### SMART — l'outil à connaître

Tous les disques modernes tiennent un journal d'auto-surveillance : le **SMART** (*Self-Monitoring, Analysis and Reporting Technology*). Il permet de détecter une défaillance **avant** la perte de données.

| Outil | Plateforme |
|---|---|
| **CrystalDiskInfo** | Windows, gratuit, lecture immédiate |
| `smartctl -a /dev/sda` | Linux (paquet `smartmontools`) |
| `wmic diskdrive get status` | Windows, indication sommaire |

Attributs à surveiller en priorité :

* **Reallocated Sectors Count** — secteurs défectueux réaffectés. Toute valeur non nulle qui **augmente** annonce une panne
* **Current Pending Sector** — secteurs suspects en attente. Signal d'alerte
* **Power On Hours** — heures de fonctionnement, utile pour situer l'âge réel
* **Wear Leveling / Percentage Used** (SSD) — usure des cellules

> [!important]
> Un disque dont l'état SMART est « Prudence » ou « Mauvais » doit être **remplacé**, pas réparé. On copie les données d'abord, on diagnostique ensuite.

### Deux réflexes d'entretien

* **TRIM** — indique au SSD quels blocs sont libres, ce qui maintient ses performances. Activé par défaut sous Windows 10/11 et Linux. Vérification : `fsutil behavior query DisableDeleteNotify` (0 = actif).
* **Ne jamais défragmenter un SSD.** La défragmentation n'a de sens que sur un disque mécanique. Sur un SSD, elle use les cellules sans rien apporter. Windows le sait et lance un TRIM à la place — mais un outil tiers mal réglé peut faire de vrais dégâts.

---

## Le stockage en milieu professionnel

Sur un poste isolé, le disque sert à une seule personne. En entreprise, le stockage doit **centraliser** les données, les **partager**, rester **fiable** malgré les pannes, et tenir la **charge** de plusieurs accès simultanés.

<iframe width="560" height="315" src="https://www.youtube.com/embed/37Qhsz6qojs?si=wUoyYqDa7gkpNjhR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### La vraie question : mode bloc ou mode fichier ?

Un NAS et une baie SAN se ressemblent physiquement. Ce qui les distingue, c'est **la façon dont le stockage est présenté au système** qui l'utilise.

| Mode | Ce que voit le système client | Qui formate ? |
|---|---|---|
| **Bloc** | Un disque brut, comme s'il était interne | Le client : il l'initialise, le partitionne, le formate |
| **Fichier** | Un dossier partagé, immédiatement utilisable | Le serveur de stockage, en amont |

![das-nas-san.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/das-nas-san.svg)

### DAS (Direct Attached Storage)

Stockage **directement rattaché à une seule machine** : le disque interne d'un PC, un disque USB, une baie en SAS sur un serveur.

* Mode **bloc**, simple et rapide
* **Non partageable** : une seule machine y accède

### NAS (Network Attached Storage)

Un boîtier autonome branché sur le **réseau local existant**, qui expose des **dossiers partagés**.

* Mode **fichier** — protocoles **SMB/CIFS** (Windows) ou **NFS** (Linux)
* Accès simultané de plusieurs utilisateurs, avec gestion des droits
* Administration par interface web, très répandu en PME (Synology, QNAP)

Limite : les performances dépendent du réseau local, partagé avec tout le reste du trafic.

### SAN (Storage Area Network)

Un **réseau dédié uniquement au stockage**, séparé du réseau bureautique, qui présente aux serveurs des **disques bruts**.

<iframe width="560" height="315" src="https://www.youtube.com/embed/m-_RPOcU19c?si=kC0KZ9kaRZRCeP_Z" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

* Mode **bloc** — protocoles **iSCSI** (sur Ethernet) ou **Fibre Channel** (fibre dédiée)
* Performances élevées et régulières, réseau non partagé
* Indispensable en virtualisation : plusieurs hyperviseurs accèdent au même stockage, ce qui permet de déplacer une VM d'un serveur à l'autre sans interruption

Limite : coûteux et complexe, réservé aux datacenters et grandes structures.

> [DAS, SAN et NAS — IT-Connect](https://www.it-connect.fr/les-das-san-nas-et-le-stockage-cloud-pour-les-debutants/)

---

## Le RAID

Le **RAID** (*Redundant Array of Independent Disks*) regroupe plusieurs disques physiques en **un seul volume logique**. Le système ne voit qu'un disque ; le contrôleur répartit les données derrière.

<iframe width="560" height="315" src="https://www.youtube.com/embed/WqGeTOt6A0Q?si=ik18LnoDE_PIGrfS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Trois mécanismes de base

| Mécanisme | Principe | Apporte |
|---|---|---|
| **Agrégation par bandes** (*striping*) | Données découpées et écrites en parallèle | De la **vitesse** |
| **Miroir** (*mirroring*) | Même donnée écrite à l'identique sur deux disques | De la **sécurité** |
| **Parité** | Bloc calculé permettant de reconstruire un disque perdu | La sécurité **sans tout dupliquer** |

### Les niveaux courants

![raid-niveaux.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/raid-niveaux.svg)

| Niveau | Disques min. | Capacité utile | Pannes tolérées | Usage typique |
|---|---|---|---|---|
| **RAID 0** | 2 | 100 % | **aucune** | Vitesse pure, données jetables |
| **RAID 1** | 2 | 50 % | 1 disque | Disque système, petits serveurs |
| **RAID 5** | 3 | n − 1 disque | 1 disque | NAS, serveurs de fichiers |
| **RAID 6** | 4 | n − 2 disques | 2 disques | Grandes baies, disques de forte capacité |
| **RAID 10** | 4 | 50 % | 1 par miroir | Bases de données, virtualisation |

> [!warning] Le RAID 0 n'apporte aucune sécurité
> Malgré son numéro, il est **plus risqué qu'un disque seul** : si l'un des disques lâche, tout le volume est perdu. Plus il y a de disques, plus le risque augmente.

### La reconstruction

Quand un disque tombe, la grappe passe en mode **dégradé** : elle fonctionne encore, mais sans protection. Après remplacement du disque, la **reconstruction** recalcule les données manquantes.

* L'opération dure des heures, parfois des jours sur de gros disques
* Pendant ce temps, la grappe reste **vulnérable** : une seconde panne est fatale (en RAID 5)
* La charge de lecture est intense — c'est souvent là qu'un second disque du même lot lâche

> [!tip]
> Remplacer un disque défaillant **sans attendre**, et éviter d'acheter tous les disques d'une grappe dans le même lot de fabrication.

### RAID matériel ou logiciel ?

| | Contrôleur matériel | RAID logiciel |
|---|---|---|
| Géré par | Une carte dédiée | Le système d'exploitation |
| Performances | Meilleures | Consomme du CPU |
| Coût | Carte à acheter | Gratuit |
| Risque | Carte HS = contrôleur identique à retrouver | Aucun matériel spécifique |
| Exemples | Cartes RAID de serveur | Espaces de stockage Windows, `mdadm`, ZFS |

> [RAID — Wikipédia](https://fr.wikipedia.org/wiki/RAID_\(informatique\))

---

## Sauvegarde : ce que le RAID ne fait pas

> [!important] Le RAID n'est pas une sauvegarde
> Le RAID protège d'**une panne de disque**, rien d'autre. Suppression accidentelle, ransomware, vol, incendie, erreur de manipulation : dans tous ces cas, la perte est répliquée instantanément sur tous les disques.

### La règle 3-2-1

| Chiffre | Signification |
|---|---|
| **3** | Trois copies des données (l'originale + deux sauvegardes) |
| **2** | Sur deux supports de nature différente |
| **1** | Dont **une hors site** (autre bâtiment, cloud, disque externe stocké ailleurs) |

Une variante moderne ajoute un **1** : une copie **hors ligne** ou non réinscriptible, seule protection réelle contre un ransomware qui chiffrerait aussi les sauvegardes accessibles.

> [!warning]
> Une sauvegarde jamais testée n'est pas une sauvegarde. La seule preuve qu'elle fonctionne est une **restauration réussie**..

---

> [!summary] À retenir
> * **Technologie / format / bus** : trois critères indépendants. Un disque se décrit toujours par les trois.
> * **M.2 ≠ NVMe** — un SSD M.2 peut être SATA. L'encoche donne un indice, la référence donne la preuve.
> * Un disque neuf passe par **initialisation → partitionnement → formatage → montage**. L'immeuble : cloisons, puis aménagement, puis adresse.
> * **NTFS** pour Windows, **exFAT** pour un support à échanger, **ext4** pour Linux.
> * **SMART** détecte une panne avant la perte de données. Bruit mécanique = sauvegarder tout de suite.
> * **Jamais de défragmentation sur un SSD.**
> * **Bloc** = disque brut à formater · **Fichier** = dossier partagé prêt à l'emploi.
> * **DAS** = un seul hôte · **NAS** = fichiers en réseau (SMB/NFS) · **SAN** = réseau dédié, mode bloc (iSCSI/FC).
> * Le **RAID n'est pas une sauvegarde**. Règle **3-2-1**.

---

## Pour aller plus loin

* Modes de démarrage, MBR/GPT et partition EFI → [04-bios-demarrage](https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/)
* Lignes PCIe et carte mère → [02-composants-pc](https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/)
* Stockage soudé sur portable → [03-pc-portables](https://kayasam.github.io/configuration-maintenance-pc/pc/03-pc-portables/)

<!--
VISUELS — tous locaux dans Ressources/images/, aucun lien externe.
  technologie-format-bus.svg · m2-encoches.svg · das-nas-san.svg · raid-niveaux.svg   (charte du coffre §2)
  hdd-schema.svg · ssd-nvme-m2.jpg                                                    (Wikimedia Commons)

Les 4 iframes YouTube d'origine sont conservées, mais le texte est autonome :
si une vidéo disparaît, aucune notion n'est perdue.
-->
