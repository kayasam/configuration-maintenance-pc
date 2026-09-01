# Chapitre 5 – Périphériques, réseau et impression

## Installation des périphériques

Un **périphérique** est un matériel connecté à un ordinateur pour étendre ses fonctionnalités.

Le principe d'installation est généralement le même :

1. Détection du matériel
2. Chargement d'un **pilote**
3. Périphérique utilisable

### Types courants

* **USB** : clavier, souris, stockage, imprimantes
* **Cartes internes (PCIe)** : carte réseau, carte graphique
* **Périphériques réseau** : imprimantes partagées, NAS

### Rôle des pilotes

| Type de pilote | Caractéristiques |
|---|---|
| **Générique** | Souvent suffisant pour les fonctions de base |
| **Constructeur** | Nécessaire pour les fonctions avancées |

Sans pilote : périphérique non reconnu ou fonctionnement partiel.

### Logique de diagnostic

* Tester sur un autre port ou un autre poste
* Vérifier les pilotes dans le gestionnaire de périphériques
* Isoler la cause : matérielle ou logicielle

---

## Écrans et affichage

L'**écran** est un périphérique de sortie essentiel.

> [Écran d'ordinateur — Wikipédia](https://fr.wikipedia.org/wiki/%C3%89cran_d%27ordinateur)

### Critères de choix

| Critère | Détail |
|---|---|
| **Résolution** | HD (720p) → FHD (1080p) → QHD (1440p) → 4K |
| **Taille** | 22-24" classique / 27-32" confort / +32" spécifique |
| **Dalle TN** | Rapide, économique, angles de vue limités |
| **Dalle IPS** | Bon rendu couleurs, large angle de vue |
| **Dalle VA** | Bon contraste |
| **Dalle OLED** | Contraste très élevé, haut de gamme |
| **Fréquence** | 60 Hz bureautique / 120 Hz+ gaming |
| **Temps de réponse** | 1-5 ms recommandé pour jeu / vidéo rapide |

> [Technologies de dalle — Materiel.net](https://www.materiel.net/guide-achat/g10-les-ecrans-pc/5297/)

### Connectiques vidéo

| Connectique | Signal | Résolution supportée |
|---|---|---|
| **VGA** | Analogique | 720p/1080p (ancien) |
| **DVI** | Numérique | 1080p voire QHD |
| **HDMI** | Numérique | 1080p à 4K (selon version) |
| **DisplayPort** | Numérique | QHD à 8K, multi-écrans |
| **USB-C** | Numérique + alim | 1080p à 4K |

<iframe width="560" height="315" src="https://www.youtube.com/embed/LLZLlgfGGrE?si=IZG68nj3VsPBh5mT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> [HDMI — Wikipédia](https://fr.wikipedia.org/wiki/High-Definition_Multimedia_Interface) | [DisplayPort — Wikipédia](https://fr.wikipedia.org/wiki/DisplayPort)

### Problèmes fréquents

* Résolution incorrecte → vérifier les pilotes graphiques
* Aucun signal → vérifier la source d'entrée et le câble
* Rafraîchissement flou → régler la fréquence dans les paramètres d'affichage

---

## Imprimantes

### Types d'imprimantes

| Type | Caractéristiques | Usage typique |
|---|---|---|
| **Jet d'encre** | Bon marché, qualité couleur | Bureautique domestique |
| **Laser** | Rapide, toner, coût/page réduit | Entreprise, volume élevé |
| **Multifonction** | Scanner/copieur intégré | Usage polyvalent |
| **Thermique** | Étiquettes, tickets | Logistique, commerce |

### Modes de connexion

* **USB** : direct, simple
* **Réseau (Ethernet/Wi-Fi)** : accessible à plusieurs postes
* **Cloud / Bluetooth** : usage mobile

### Problèmes fréquents

| Symptôme | Cause possible | Solution |
|---|---|---|
| Imprimante non détectée | Câble ou pilote absent | Vérifier câble et pilotes |
| Documents bloqués | File d'attente saturée | Vider la file |
| « Hors connexion » | Mauvaise IP ou Wi-Fi instable | Redémarrer l'imprimante |
| Connectée mais muette | Mauvais pilote ou port | Réinstaller avec pilote officiel |

---

## L'USB – Normes, connectiques et débits

L'**USB** est le standard principal pour connecter des périphériques : alimentation, transfert de données, Plug & Play.

<iframe width="560" height="315" src="https://www.youtube.com/embed/G1eRFPZoV-E?si=ye-CVF_n4cAD0U_S" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Évolution des normes

| Norme | Débit max | Connecteurs | Année |
|---|---|---|---|
| USB 2.0 | 480 Mbps | USB-A, B, Mini, Micro | 2000 |
| USB 3.0 | 5 Gbps | USB-A (bleu), USB-B 3.0 | 2008 |
| USB 3.1 Gen 2 | 10 Gbps | USB-A, USB-C | 2015 |
| USB 3.2 Gen 2x2 | 20 Gbps | USB-C uniquement | 2017 |
| USB4 | 40 Gbps | USB-C | 2019 |
| Thunderbolt 3 | 40 Gbps | USB-C | 2015 |
| Thunderbolt 4 | 40 Gbps | USB-C | 2020 |

> [USB : normes et connectiques — Config Gamer](https://www.config-gamer.fr/guide-achat/usb-les-differentes-normes-et-les-differentes-formes-de-la-connectique-10000693.html)

### Connecteurs physiques

| Connecteur | Usage |
|---|---|
| **USB-A** | Standard rectangulaire — clés USB, périphériques classiques |
| **USB-B** | Carré — imprimantes |
| **Micro-USB** | Anciens smartphones |
| **USB-C** | Universel, réversible — USB 2 à USB4 et Thunderbolt |

> [!warning]
> **USB-C** n'implique pas automatiquement un haut débit. Le connecteur ne détermine pas la norme — toujours vérifier les specs.

### Alimentation via USB

| Norme | Puissance max |
|---|---|
| USB 2.0 | 2,5 W |
| USB 3.x | 4,5 W |
| USB-C standard | 15 W |
| USB-C PD | Jusqu'à 240 W |

### Bonnes pratiques support

* Toujours tester plusieurs ports (USB 3 arrière = plus fiable)
* Vérifier les codes couleurs (USB 3.0 = bleu)
* Vérifier les pilotes si périphérique non reconnu
* Pour Thunderbolt, chercher le logo éclair

> [!summary] À retenir
> Thunderbolt 4 est le standard le plus complet (vidéo, data, alimentation, PCIe). USB-C ≠ Thunderbolt.

---

## Les cartes réseau – Ethernet, Wi-Fi et débits

Une **carte réseau** connecte le poste au réseau local (LAN) ou à Internet.

### Normes Ethernet

| Norme | Débit | Connecteur | Remarques |
|---|---|---|---|
| **Fast Ethernet** | 100 Mbps | RJ45 | Ancien, encore courant |
| **Gigabit Ethernet** | 1 Gbps | RJ45 | Standard actuel |
| **2.5G / 5G Ethernet** | 2,5 / 5 Gbps | RJ45 | Multi-gig (NAS, SSD réseau) |
| **10G Ethernet** | 10 Gbps | RJ45 / SFP+ | Réseaux pro |

### Normes Wi-Fi

| Norme | Débit max | Fréquences | Année |
|---|---|---|---|
| **Wi-Fi 4 (802.11n)** | ~300 Mbps | 2,4 / 5 GHz | 2009 |
| **Wi-Fi 5 (802.11ac)** | ~1,3 Gbps | 5 GHz | 2014 |
| **Wi-Fi 6 (802.11ax)** | ~9,6 Gbps | 2,4 / 5 GHz | 2019 |
| **Wi-Fi 6E** | ~9,6 Gbps | + 6 GHz | 2021 |
| **Wi-Fi 7 (802.11be)** | >30 Gbps | 2,4 / 5 / 6 GHz | 2024 |

### Problèmes courants

| Symptôme | Cause fréquente | Action |
|---|---|---|
| Pas de connexion | Câble ou port défectueux | Tester autre câble / port |
| Pas d'IP (triangle jaune) | DHCP ou pilote manquant | Forcer IP / vérifier pilote |
| Wi-Fi non détecté | Carte désactivée | Réactiver ou réinstaller |
| Débit lent Ethernet | Port en 100 Mbps | Vérifier câble Cat 6 |
| Connecté mais pas d'Internet | DNS / proxy / passerelle | Test ping IP / DNS |

> [!summary] À retenir
> Wi-Fi 5/6 est le standard grand public actuel. Ethernet 1G/2,5G pour le filaire. Les débits réels dépendent des câbles, pilotes et équipements.
