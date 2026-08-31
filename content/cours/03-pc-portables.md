# Chapitre 2b – Choisir un PC portable

> [!TIP] Ressources du chapitre
>
> - [Ouvrir la version HTML interactive](https://kayasam.github.io/configuration-maintenance-pc/cours/03-pc-portables.html)
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/cours/03-pc-portables.md" download>Télécharger ce cours en Markdown</a>

## Pourquoi un PC portable ?

Un PC portable rassemble dans un seul châssis tout ce qu'un poste fixe nécessite : CPU, RAM, stockage, écran, batterie, clavier et pavé tactile. L'intérêt principal est la **mobilité** — on peut travailler depuis n'importe quel endroit sans dépendre d'une prise secteur permanente.

Cas d'usage typiques :

| Contexte                   | Avantage apporté                              |
| -------------------------- | --------------------------------------------- |
| Déplacement professionnel  | Travail en mobilité (transport, client, site) |
| Formation / salle de cours | Pas besoin d'infrastructure fixe              |
| Télétravail                | Un seul poste utilisé à domicile et au bureau |
| Technicien terrain         | Diagnostic et intervention sur site           |

Inconvénients à connaître : **évolutivité limitée** (RAM et stockage parfois soudés), **dissipation thermique réduite**, et **coût de réparation plus élevé** qu'un poste fixe équivalent.

---

## Les critères de choix

### 1. Date de fabrication / génération des composants

Un portable peut être vendu neuf mais assembler des composants d'une génération précédente pour réduire les coûts.

À vérifier :

- La **génération du processeur** (ex. Intel Core Ultra 200H vs Core i5 12e gen — plusieurs années d'écart)
- La **génération de RAM** : DDR4 vs DDR5 (performances et consommation différentes)
- Le **Wi-Fi intégré** : Wi-Fi 5 (802.11ac) vs Wi-Fi 6 (802.11ax) vs Wi-Fi 6E/7

Un modèle en stock depuis longtemps peut embarquer une génération dépassée — toujours vérifier les specs, pas seulement le prix.

---

### 2. Technologie d'écran

L'écran est le composant le moins facile à remplacer et celui qu'on utilise en permanence.

#### Dalle

| Technologie | Avantages                      | Inconvénients                               |
| ----------- | ------------------------------ | ------------------------------------------- |
| **TN**      | Réactivité élevée, prix bas    | Angles de vision médiocres, couleurs ternes |
| **IPS**     | Bons angles, couleurs fidèles  | Légère fuite lumineuse possible (IPS glow)  |
| **VA**      | Contraste élevé                | Temps de réponse plus lent                  |
| **OLED**    | Noirs parfaits, couleurs vives | Risque de burn-in, autonomie réduite        |

Pour un usage bureautique ou formation : **IPS** est le bon compromis.

#### Résolution et définition

- Full HD (1920×1080) : suffisant dans 90% des cas
- 2K / QHD (2560×1440) : overkill pour la plupart des usages professionnels, consomme plus

#### Taux de rafraîchissement

- 60 Hz : standard bureautique
- 120–144 Hz et plus : utile en jeu ou pour du travail graphique fluide

#### Luminosité

Exprimée en **nits** (candelas/m²). En dessous de 250 nits, difficile à utiliser en pleine lumière. 300–400 nits est confortable, 500+ pour une utilisation en extérieur.

---

### 3. Power Delivery (USB-PD)

#### C'est quoi le Power Delivery ?

Le **USB Power Delivery** (USB-PD) est un standard de recharge via connecteur **USB-C**. Il permet de transmettre jusqu'à **100 W** (et jusqu'à 240 W avec USB-PD 3.1) sur un même câble USB-C, en plus des données.

Concrètement : un seul câble USB-C peut à la fois recharger le portable, transférer des fichiers, et afficher une image sur un écran externe (si Thunderbolt ou DisplayPort Alt Mode est supporté).

#### Pourquoi c'est important ?

| Avantage                               | Détail                                                |
| -------------------------------------- | ----------------------------------------------------- |
| **Chargeur universel**                 | Un même chargeur pour téléphone, tablette et portable |
| **Moins de câbles**                    | Un hub USB-C remplace plusieurs adaptateurs           |
| **Alimentation bidirectionnelle**      | Le portable peut recharger un autre appareil          |
| **Charge depuis une batterie externe** | Pratique en mobilité (powerbank 65 W+)                |

#### Ce qu'il faut vérifier

- Le portable **supporte-t-il la charge via USB-C** ? (pas automatique)
- Quel est le **wattage maximum accepté** ? (45 W, 65 W, 100 W…)
- Le port USB-C est-il aussi **Thunderbolt 4** ou **USB4** ? (requis pour certains docks)
- L'adaptateur secteur fourni est-il USB-C ou propriétaire ?

> Un portable qui n'accepte que son chargeur propriétaire est une contrainte en mobilité — un chargeur oublié ou cassé bloque tout.

---

### 4. Autres paramètres à évaluer

#### Processeur et usage

| Type d'usage                  | Processeur recommandé                                |
| ----------------------------- | ---------------------------------------------------- |
| Bureautique, navigation       | Intel Core i5 / AMD Ryzen 5 série U (TDP ~15 W)      |
| Développement, virtualisation | Intel Core i7/i9 H ou AMD Ryzen 7/9 HS (TDP 35–45 W) |
| Graphisme, jeu                | GPU dédié (Nvidia RTX, AMD RX) + CPU H               |

Les processeurs **série U** consomment moins et offrent plus d'autonomie. Les **série H/HX** sont plus puissants mais consomment davantage.

#### RAM

- 8 Go : minimum acceptable
- 16 Go : confortable pour du multitâche
- 32 Go : virtualisation, développement lourd

Vérifier si la RAM est **soudée** (non évolutive) ou sur **slots SO-DIMM** (remplaçable).

#### Stockage

- Privilégier un **SSD NVMe M.2** (bien plus rapide qu'un SSD SATA)
- Vérifier la présence d'un **slot supplémentaire** pour ajouter un second SSD

#### Connectique

| Port                | Utilité                                                |
| ------------------- | ------------------------------------------------------ |
| USB-A (×2 minimum)  | Clé USB, souris, adaptateurs courants                  |
| USB-C / Thunderbolt | Écran externe, dock, charge PD                         |
| HDMI                | Vidéoprojecteur, écran externe                         |
| Jack 3,5 mm         | Audio (souvent absent sur les ultrafins)               |
| RJ45                | Réseau filaire — souvent absent, prévoir un adaptateur |
| Lecteur SD          | Utile pour les photographes / techniciens terrain      |

#### Autonomie

Annoncée par le fabricant dans des conditions idéales — diviser par 1,5 à 2 pour un usage réel.

Vérifier la **capacité batterie en Wh** (watt-heure) plutôt qu'en mAh (les tensions varient). Au-delà de 60 Wh, on parle de bonne autonomie.

#### Poids et format

| Format                 | Poids typique | Usage                |
| ---------------------- | ------------- | -------------------- |
| Ultraportable (13–14") | < 1,4 kg      | Mobilité maximale    |
| Standard (15–16")      | 1,6–2 kg      | Polyvalent           |
| Portable bureau (17")  | > 2,5 kg      | Remplacement de fixe |

#### Clavier et pavé tactile

Souvent négligé à l'achat : vérifier la **course des touches** (les claviers trop plats fatiguent vite), la présence d'un **pavé numérique** si nécessaire, et la qualité du pavé tactile (taille, précision).

#### Qualité du châssis

Le châssis détermine la durabilité et le confort au quotidien.

| Matériau                | Caractéristiques                                                        |
| ----------------------- | ----------------------------------------------------------------------- |
| **Plastique**           | Léger, économique, moins résistant aux chocs et à la torsion            |
| **Aluminium**           | Rigide, dissipe mieux la chaleur, look premium, plus lourd              |
| **Magnésium / alliage** | Léger et résistant, utilisé sur les portables pro (ex. Lenovo ThinkPad) |
| **Fibre de carbone**    | Très léger et très rigide, coût élevé                                   |

Ce qu'il faut tester ou vérifier :

- **Flexibilité du couvercle** : un écran qui se déforme au moindre appui ne protège pas bien la dalle
- **Charnières** : elles doivent être fermes sans forcer — les charnières fragiles lâchent en quelques mois
- **Certification MIL-SPEC** (MIL-STD-810) : tests de résistance aux chocs, vibrations, température — bon indicateur pour les portables pro ou terrain
- **Finition** : les surfaces mates accrochent moins les traces de doigts et résistent mieux à la rayure que le brillant

#### Dock (station d'accueil)

Un **dock** est un boîtier qui se branche en un seul câble USB-C (ou Thunderbolt) sur le portable et offre une multitude de ports supplémentaires : plusieurs USB-A, écrans HDMI/DisplayPort, RJ45, lecteur SD, audio, et parfois même l'alimentation secteur (via PD).

C'est la solution standard en entreprise pour passer instantanément du mode mobilité au mode bureau fixe.

```
Portable  ←──── 1 câble USB-C / Thunderbolt ────→  Dock
                                                      ├── Écran 1 (HDMI)
                                                      ├── Écran 2 (DisplayPort)
                                                      ├── Clavier / Souris (USB-A)
                                                      ├── RJ45 (réseau filaire)
                                                      ├── Alimentation (PD 65–100 W)
                                                      └── Stockage externe (USB-A/C)
```

> Pour utiliser un dock avec deux écrans externes, le port USB-C doit être **Thunderbolt 4** ou **USB4**. Un simple USB-C 3.2 est souvent limité à un seul écran.

#### Licence Windows

Pour un usage professionnel ou en entreprise, la version **Windows Pro** est indispensable.

| Fonctionnalité                         | Windows Famille | Windows Pro |
| -------------------------------------- | --------------- | ----------- |
| Jonction à un domaine Active Directory | ✗               | ✓           |
| Bitlocker (chiffrement disque)         | ✗               | ✓           |
| Stratégies de groupe (GPO)             | ✗               | ✓           |
| Bureau à distance (hôte RDP)           | ✗               | ✓           |
| Hyper-V                                | ✗               | ✓           |

> Un portable acheté avec **Windows Famille** ne peut pas rejoindre un domaine Active Directory. Dans un parc d'entreprise, c'est bloquant. Toujours vérifier la mention **Pro** avant l'achat — changer de licence après coup est possible mais payant (~100 €).

---

## En résumé

| Critère               | Ce qu'il faut retenir                                                                 |
| --------------------- | ------------------------------------------------------------------------------------- |
| Génération composants | Toujours vérifier le CPU, la RAM et le Wi-Fi — ne pas se fier au millésime commercial |
| Écran                 | IPS pour l'usage pro, vérifier nits et résolution selon la taille                     |
| Power Delivery        | USB-C charge = liberté en mobilité — vérifier le wattage accepté                      |
| RAM / stockage        | Préférer slots évolutifs, SSD NVMe, 16 Go minimum                                     |
| Connectique           | Anticiper les besoins (RJ45, HDMI, USB-A) avant d'acheter des adaptateurs             |
| Dock                  | Thunderbolt 4 requis pour un vrai dock multi-écrans                                   |
| Châssis               | Aluminium ou alliage pour un usage pro, vérifier les charnières                       |
| Licence Windows       | Toujours **Pro** en environnement d'entreprise (Active Directory, BitLocker)          |
| Autonomie             | Regarder les Wh, pas les heures annoncées constructeur                                |
