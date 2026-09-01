# Chapitre 4 – Stockage et systèmes

<iframe width="560" height="315" src="https://www.youtube.com/embed/oisyw58kQ4Q?si=DrGepShuOcE9dBg4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Différencier technologie, format et bus

Un disque de stockage se décrit **toujours** avec trois éléments distincts et indépendants :

| Critère | Définition |
|---|---|
| **Technologie** | Comment les données sont stockées |
| **Format** | Taille et forme physique du disque |
| **Bus / interface** | Comment le disque communique avec le système |

---

## Technologie

### HDD (disque dur mécanique)

* Plateaux magnétiques en rotation + tête de lecture mécanique
* Grande capacité, faible coût au Go
* Lent, sensible aux chocs, bruyant

![upload.wikimedia.org/wikipedia/commons/0/01/Hard_drive-fr.svg](https://upload.wikimedia.org/wikipedia/commons/0/01/Hard_drive-fr.svg)

> [Disque dur — Wikipédia](https://fr.wikipedia.org/wiki/Disque_dur)

### SSD (mémoire flash)

<iframe width="560" height="315" src="https://www.youtube.com/embed/mixHavLpwMw?si=NeUVd_tWcf3f92Wq" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

* Aucune pièce mécanique
* Rapide, silencieux, résistant aux chocs
* Durée de vie limitée en écriture
![](https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Samsung_980_PRO_PCIe_4.0_NVMe_SSD_1TB-top_PNr%C2%B00915.jpg/960px-Samsung_980_PRO_PCIe_4.0_NVMe_SSD_1TB-top_PNr%C2%B00915.jpg?utm_source=commons.wikimedia.org&utm_campaign=imageinfo&utm_content=thumbnail)

> [SSD — Wikipédia](https://fr.wikipedia.org/wiki/SSD)

---

## Format physique

| Format | Appareils | Technologie compatible |
|---|---|---|
| **3,5 pouces** | PC fixes, serveurs | HDD |
| **2,5 pouces** | PC portables, fixes | HDD ou SSD SATA |
| **M.2** | Directement sur carte mère | SSD SATA ou NVMe |

> [!warning]
> **M.2 ne signifie pas forcément NVMe.** Un SSD M.2 peut être SATA ou NVMe — toujours vérifier le bus.

---

## Bus / interface

| Bus | Débit typique | Usage |
|---|---|---|
| **SATA** | ~550 Mo/s max | HDD, SSD SATA |
| **PCIe / NVMe** | 3,5 à 14 Go/s selon gen | SSD NVMe M.2 |

Le bus a un **impact direct sur les performances**.

---

## Cellules mémoire (TLC / QLC)

| Type | Bits/cellule | Endurance | Usage |
|---|---|---|---|
| **TLC** | 3 | Bonne | Standard, SSD grand public |
| **QLC** | 4 | Plus faible | Grande capacité, moins cher |

---

## Symptômes liés au stockage

* PC très lent au démarrage → HDD système
* Applications longues à s'ouvrir → stockage saturé ou lent
* Bruits anormaux → HDD défaillant
* Erreurs système / fichiers corrompus → stockage dégradé

---

## Le stockage en milieu professionnel

En milieu professionnel, le stockage doit assurer : centralisation, partage, fiabilité, performances.

<iframe width="560" height="315" src="https://www.youtube.com/embed/37Qhsz6qojs?si=wUoyYqDa7gkpNjhR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### NAS (Network Attached Storage)

Serveur de stockage connecté au réseau local.

* Partage de fichiers entre utilisateurs
* Administration simplifiée
* Très utilisé en PME

### SAN (Storage Area Network)

<iframe width="560" height="315" src="https://www.youtube.com/embed/m-_RPOcU19c?si=kC0KZ9kaRZRCeP_Z" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Réseau dédié au stockage, en mode bloc.

* Performances élevées
* Utilisé avec des serveurs et hyperviseurs
* Infrastructure plus complexe et coûteuse

> [DAS, SAN et NAS — IT-Connect](https://www.it-connect.fr/les-das-san-nas-et-le-stockage-cloud-pour-les-debutants/)

### RAID

<iframe width="560" height="315" src="https://www.youtube.com/embed/WqGeTOt6A0Q?si=ik18LnoDE_PIGrfS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Combine plusieurs disques en un ensemble logique pour améliorer performances et/ou tolérance aux pannes.

> [RAID — Wikipédia](https://fr.wikipedia.org/wiki/RAID_\(informatique\))

> [!summary] À retenir
> Technologie / format / bus sont trois critères indépendants. M.2 ≠ NVMe. NAS = partage de fichiers. SAN = stockage haute performance. Le RAID améliore performances et/ou tolérance aux pannes.
