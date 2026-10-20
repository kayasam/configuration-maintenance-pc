---
title: "Chapitre 2 – Les composants d'un PC et leur rôle"
---

<nav class="chapter-resources" aria-label="Ressources du chapitre" data-course-key="pc/02-composants-pc"><div class="resource-buttons"><a class="resource-button" data-resource-kind="markdown" href="https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 24"><rect x="1" y="1" width="30" height="22" rx="3" fill="none" stroke="#34495e" stroke-width="2"/><path d="M5 18V6h3l4 5 4-5h3v12h-3v-7l-4 5-4-5v7Z" fill="#34495e"/><path d="M23 6h3v7h3l-4.5 5-4.5-5h3Z" fill="#34495e"/></svg>
</span><span class="resource-label">Cours</span></a><a class="resource-button" data-resource-kind="html" href="https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/html/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 32"><path d="M2 2h24l-2 25-10 3-10-3Z" fill="#e44d26"/><path d="M14 5v22l7-2 2-20Z" fill="#f16529"/><path d="M7 8h15l-.3 3H11l.3 3h10l-.8 9-6.5 2-6.5-2-.4-5h3l.2 2.6 3.7 1 3.7-1 .3-3.6H8Z" fill="#fff"/></svg>
</span><span class="resource-label">HTML</span></a><a class="resource-button" data-resource-kind="quiz" href="https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/quiz/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="4" y="3" width="24" height="26" rx="6" fill="#7652ad"/><path d="M12 12a4 4 0 1 1 6 3.5c-1.5.8-2 1.4-2 3" fill="none" stroke="#fff" stroke-width="2.8" stroke-linecap="round"/><circle cx="16" cy="23" r="1.6" fill="#fff"/></svg>
</span><span class="resource-label">Quiz</span></a><a class="resource-button" data-resource-kind="tp" href="https://kayasam.github.io/configuration-maintenance-pc/pc/02-composants-pc/tp"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="2" y="4" width="28" height="24" rx="5" fill="#237b60"/><path d="m8 12 5 4-5 4m9 0h7" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
</span><span class="resource-label">TP</span></a></div><div class="resource-actions"><a class="resource-download" download href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/pc/cours/02-composants-pc.md">↓ Télécharger le cours (.md)</a><button type="button" class="support-focus-toggle" aria-pressed="false">Masquer les menus</button></div></nav>

## Vue d'ensemble de l'architecture

Un poste de travail est composé de plusieurs éléments interdépendants :

| Composant | Rôle |
|---|---|
| **Boîtier** | Protège et organise les composants |
| **Carte mère** | Relie et fait communiquer tous les composants |
| **Processeur (CPU)** | Effectue les calculs |
| **Mémoire vive (RAM)** | Stocke temporairement les données en cours d'utilisation |
| **Stockage** | Conserve les données (SSD, HDD) |
| **Carte graphique (GPU)** | Gère l'affichage |
| **Alimentation (PSU)** | Fournit l'énergie électrique |

Chaque composant a un rôle précis. Une panne ou une limite de performance vient souvent de l'un d'eux.

---

## La carte mère

<iframe width="560" height="315" src="https://www.youtube.com/embed/-hAxNlLgBXg?si=XZKN0AU4ApMcyV9T" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

La carte mère détermine :

* le type de processeur utilisable (socket)
* le type et la quantité de RAM
* les possibilités d'évolution (slots PCIe, ports SATA, M.2)

Elle centralise toutes les connexions internes.

> [Diagramme de la carte mère — Northernmicro](https://northernmicro.com/spirit-manuals/spirit-q370-as-sff-guide-dutilisateur/Diagramme_de_la_carte_m%C3%A8re.htm)

| Composant | Rôle |
|---|---|
| **Socket CPU** | Accueil du processeur — détermine la compatibilité |
| **VRM (étages d'alimentation)** | Régule et stabilise la tension envoyée au CPU |
| **Slots RAM** | Accueillent les barrettes de RAM |
| **Alimentation 24 pins** | Alimentation principale de la carte mère |
| **Chipset** | Gère les communications entre CPU, mémoire, stockage et périphériques |
| **Slot PCIe x16** | Accueille la carte graphique |
| **Slot M.2** | SSD NVMe — stockage très haute vitesse |
| **Connecteurs SATA** | Stockage classique (HDD, SSD SATA) |
| **Backplate I/O** | USB, réseau, audio, vidéo vers l'extérieur |

---

## Le processeur (CPU)

Le **processeur (CPU)** est le composant central du PC.
Il exécute les instructions des programmes et coordonne les autres composants.

<iframe width="560" height="315" src="https://www.youtube.com/embed/z80inke28CM?si=_Mq1rdLOXmtlDRfB" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Sans CPU fonctionnel, le PC ne démarre pas.

> [Processeur — Wikipédia](https://fr.wikipedia.org/wiki/Processeur)

### Paramètres clés

| Paramètre | Rôle |
|---|---|
| **Socket** | Compatibilité avec la carte mère |
| **Cœurs / threads** | Capacité à traiter plusieurs tâches simultanément |
| **Fréquence (GHz)** | Vitesse de traitement par cœur |
| **GPU intégré** | Affichage sans carte dédiée (bureautique) |
| **TDP** | Dissipation thermique — impacte refroidissement et bruit |
| **Mémoire supportée** | Type DDR, fréquence max, quantité |

### Intel – gammes principales

| Gamme | Usage |
|---|---|
| Core i3 / i5 / i7 / i9 | Desktop et mobile, entrée au haut de gamme |
| Core Ultra 5 / 7 / 9 | Génération récente, architecture modulaire, NPU IA |

Suffixes courants : **K** (overclocking), **F** (pas de GPU), **T** (basse conso), **U/H/HX** (mobile)

> [Processeurs Intel Core](https://www.intel.fr/content/www/fr/fr/products/details/processors/core.html)

### AMD – gammes principales

| Gamme | Usage |
|---|---|
| Ryzen 3 / 5 / 7 / 9 | Desktop et mobile |
| Ryzen AI | Génération récente avec NPU IA |

Suffixes courants : **X** (haute fréquence), **3D** (cache L3 massif, gaming), **G** (GPU intégré), **U/HS/HX** (mobile)

> [Spécifications AMD](https://www.amd.com/fr/products/specifications/processors.html)

### Lien CPU ↔ usage

| Usage | CPU recommandé |
|---|---|
| Bureautique | Peu de cœurs, GPU intégré |
| Multitâche / développement | Plus de cœurs et de threads |
| Gaming | Bonne fréquence + cache, GPU dédié |
| Station de travail | Nombreux cœurs, refroidissement adapté |

### Symptômes courants

* PC lent malgré un SSD → CPU saturé
* Ventilateurs bruyants → TDP élevé ou refroidissement insuffisant
* Redémarrages en charge → problème thermique ou d'alimentation
* Écran noir au démarrage → CPU incompatible ou sans GPU intégré

> [!summary] À retenir
> Le socket conditionne toute la plateforme. Le choix du CPU dépend toujours de l'usage, jamais uniquement du prix.

---

## La mémoire vive (RAM)

La **RAM** est l'espace de travail du processeur : elle stocke temporairement les données en cours d'utilisation.

La RAM est **volatile** : son contenu est perdu à l'arrêt du PC.

<iframe width="560" height="315" src="https://www.youtube.com/embed/zoxmZkN9--Y?si=F7SsVKJVVJgxMQMO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> [La mémoire RAM — malekal.com](https://www.malekal.com/memoire-ram-ordinateur-qu-est-ce-que-c-est/)

### Principe DDR (Double Data Rate)

La RAM moderne effectue **deux transferts par cycle d'horloge** (front montant + front descendant).

* DDR5-6000 → fréquence réelle : 3000 MHz
* Chaque génération (DDR3, DDR4, DDR5) est **physiquement incompatible** avec les autres

### Single Channel vs Dual Channel

| Mode | Bus | Bande passante |
|---|---|---|
| **Single channel** | 64 bits | Performances de base |
| **Dual channel** | 2 × 64 bits | Bande passante doublée |

> [!tip]
> Toujours installer la RAM en **paires identiques** pour activer le dual channel.

### Repères capacité

| Capacité | Usage |
|---|---|
| 8 Go | Usage léger |
| 16 Go | Usage standard (recommandé) |
| 32 Go+ | Usages avancés (vidéo, dev, virtualisation) |

### La latence (CAS Latency)

```
Latence (ns) = CL / fréquence réelle (MHz) × 1000
```

Fréquence élevée ≠ latence faible — le compromis fréquence/CL compte.

### Symptômes liés à la RAM

* PC lent avec disque très actif → manque de RAM (swap actif)
* Applications qui se ferment → saturation mémoire
* Écran bleu aléatoire → barrette défectueuse
* PC ne démarre pas → RAM incompatible ou mal installée

> [!summary] À retenir
> La RAM est l'espace de travail du CPU. Dual channel améliore fortement les performances. Une RAM inadaptée provoque lenteurs et instabilités.

---

## L'alimentation (PSU)

L'**alimentation (PSU)** convertit le courant secteur en tensions stables pour tous les composants.

<iframe width="560" height="315" src="https://www.youtube.com/embed/rhh_4fkS4jk?si=Xbama00xX9FpcXGI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Une alimentation de mauvaise qualité peut provoquer instabilités, redémarrages et pannes matérielles.

### Puissance et rendement

| Paramètre | Rôle |
|---|---|
| **Puissance (W)** | Doit couvrir tous les composants + marge de stabilité |
| **Certification 80 PLUS** | Bronze → Titanium — plus le rendement est élevé, moins ça chauffe |

### Types de modularité

| Type | Câbles |
|---|---|
| **Non modulaire** | Tous fixes |
| **Semi-modulaire** | Câbles principaux fixes |
| **Modulaire** | Tous amovibles — facilite le montage et la maintenance |

### Connecteurs principaux

* **24 pins** — carte mère
* **4/8 pins CPU** — processeur
* **PCIe** — carte graphique
* **SATA** — stockage

### Symptômes liés à l'alimentation

* PC qui ne démarre pas
* Redémarrages aléatoires
* Ventilateurs qui s'arrêtent brutalement
* Instabilité lors de fortes charges

> [!summary] À retenir
> L'alimentation est un composant critique souvent sous-estimé. La puissance doit être adaptée + une marge est nécessaire. La certification 80 PLUS est un bon indicateur de qualité.

---

## Les lignes PCI Express (PCIe)

<iframe width="560" height="315" src="https://www.youtube.com/embed/isnKSodxP7o?si=yCoU1m22OtRZ6NEA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Le **PCI Express (PCIe)** est le bus de communication haut débit entre le CPU et les composants rapides : carte graphique, SSD NVMe, cartes d'extension.

> [PCI Express — Wikipédia](https://fr.wikipedia.org/wiki/PCI_Express)

### Lignes (lanes) et slots

| Slot | Lignes | Usage courant |
|---|---|---|
| **x1** | 1 | Carte réseau, USB, son |
| **x4** | 4 | SSD NVMe, carte RAID |
| **x8** | 8 | GPU en configuration dual |
| **x16** | 16 | Carte graphique principale |

### Évolution des versions

| Version | Débit par ligne | Débit x16 |
|---|---|---|
| PCIe 3.0 | ~1 Go/s | ~15,75 Go/s |
| PCIe 4.0 | ~2 Go/s | ~31,5 Go/s |
| PCIe 5.0 | ~4 Go/s | ~63 Go/s |

La **rétrocompatibilité** est assurée (une carte PCIe 3.0 fonctionne dans un slot PCIe 4.0).

### Points d'attention

* Un slot x16 peut être câblé en x8 → performances réduites si GPU dessus
* Les lignes PCIe proviennent du **CPU** (rapides) ou du **chipset** (partagées)
* La taille physique du slot ≠ nombre réel de lignes actives

> [!summary] À retenir
> Plus de lignes = plus de bande passante. Le format du slot ne garantit pas toujours le câblage réel.

---

## La carte graphique (GPU)

Une **carte graphique** produit l'affichage et accélère les calculs graphiques (2D, 3D, vidéo, IA).

<iframe width="560" height="315" src="https://www.youtube.com/embed/my_y3xEFEsE?si=SlR3pWXZfpiGsFrv" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### GPU intégré vs dédié

| Type | Caractéristiques | Usage |
|---|---|---|
| **GPU intégré** | Intégré au CPU, performances limitées | Bureautique, mobilité |
| **GPU dédié** | VRAM dédiée, performances élevées | Jeu, 3D, montage, calcul |

### Nomenclature NVIDIA

| Élément | Exemples |
|---|---|
| Préfixe | RTX (ray tracing, DLSS) / GTX (ancienne gamme) |
| Génération | 50 = série 50xx |
| Gamme | 90 = ultra-haut de gamme / 60 = milieu |
| Suffixe | Ti (plus performant), SUPER (intermédiaire) |

> [NVIDIA GeForce](https://www.nvidia.com/fr-fr/geforce/graphics-cards/)

### Nomenclature AMD

| Élément | Exemples |
|---|---|
| Préfixe | RX |
| Génération | 9 = RDNA 4 |
| Gamme | 900 = haut de gamme / 600 = milieu |
| Suffixe | XT / XTX |

> [Radeon — Wikipédia](https://fr.wikipedia.org/wiki/Radeon)

### Nomenclature Intel Arc

| Élément | Exemples |
|---|---|
| Préfixe génération | B = Battlemage |
| Gamme | 3 = entrée / 7 = performance |
| Exemple | B580 16 Go |

> [Intel Arc — Wikipédia](https://fr.wikipedia.org/wiki/Intel_Arc)

> [!summary] À retenir
> La structure des noms permet d'identifier rapidement génération et performance. GPU intégré = usage simple. GPU dédié = performances élevées.
