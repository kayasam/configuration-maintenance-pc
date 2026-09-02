# Chapitre 6 – Périphériques, réseau et impression

> TP associé : [[Formations/configuration-maintenance-pc/cours/06-peripheriques/tp/06-tp-peripheriques.md]]
> Correction : [[Formations/configuration-maintenance-pc/cours/06-peripheriques/tp/06-tp-peripheriques-correction.md]]

## Pourquoi ce chapitre

C'est le chapitre du **quotidien du technicien support**. Un écran qui reste noir, une imprimante « hors connexion », un poste sans Internet : ces trois appels représentent l'essentiel des tickets de niveau 1.

Le point commun de ces pannes : elles se résolvent en **remontant une chaîne**, pas en devinant. Ce chapitre fournit les chaînes.

---

## Installer un périphérique

Un **périphérique** est un matériel connecté à l'ordinateur pour étendre ses fonctions. Quel qu'il soit, il suit toujours le même parcours :

```
Branchement
     ↓
Détection par le système (identifiants VID/PID)
     ↓
Recherche et chargement d'un pilote
     ↓
Périphérique utilisable
```

### Le rôle du pilote

Le **pilote** (*driver*) est le traducteur entre le système d'exploitation et le matériel. Sans lui, le système voit un appareil mais ne sait pas lui parler.

| Type de pilote | Ce qu'il apporte | Quand il suffit |
|---|---|---|
| **Générique** (fourni par Windows) | Les fonctions de base | Clavier, souris, clé USB, écran |
| **Constructeur** | Toutes les fonctions, réglages avancés, performances | Imprimante, carte graphique, dock, scanner |

> [!tip] Où trouver le bon pilote
> Toujours sur le **site du constructeur**, à partir du numéro de série ou du modèle exact. Jamais sur un site agrégateur de pilotes : c'est un vecteur classique d'infection.

### Le gestionnaire de périphériques

C'est l'outil central. Il se lance par `devmgmt.msc` ou par un clic droit sur le menu Démarrer.

| Symbole | Signification | Action |
|---|---|---|
| **Triangle jaune** | Périphérique en erreur | Lire le code d'erreur dans les propriétés |
| **Flèche vers le bas** | Périphérique désactivé | Le réactiver |
| **« Périphérique inconnu »** | Aucun pilote trouvé | Identifier par l'ID matériel, puis installer |

> [!tip] Identifier un périphérique inconnu
> Propriétés → onglet **Détails** → **ID de matériel**. On y lit `VID_xxxx` (fabricant) et `PID_xxxx` (produit). Une recherche sur ces deux codes identifie le matériel à coup sûr.

### Logique de diagnostic

Quatre questions, dans l'ordre, pour isoler la cause :

1. **Autre port ?** Élimine un port défaillant
2. **Autre câble ?** Élimine le câble — cause la plus fréquente et la moins soupçonnée
3. **Autre poste ?** Sépare le matériel du logiciel : si ça marche ailleurs, le périphérique est bon
4. **Autre pilote ?** Désinstaller, redémarrer, laisser Windows redétecter

---

## Reconnaître les connectiques

Un technicien identifie un connecteur **à l'œil**, sans le brancher. La forme donne le type, la couleur et le logo précisent la norme.

![[connecteurs-planche.svg]]

| Connecteur | Signe distinctif | Usage |
|---|---|---|
| **USB-A** | Rectangulaire, un seul sens | Périphériques classiques |
| **USB-B** | Carré, coins supérieurs biseautés | Imprimantes |
| **Micro-USB** | Petit trapèze | Anciens téléphones |
| **USB-C** | Ovale, réversible | Universel : données, vidéo, alimentation |
| **Thunderbolt** | Port USB-C + logo éclair | Docks, écrans, stockage rapide |
| **HDMI** | 19 broches, base biseautée | TV, écrans grand public |
| **DisplayPort** | Un seul coin biseauté | Écrans PC, multi-écrans |
| **DVI** | Grille de broches + lame plate | Écrans anciens, sans audio |
| **VGA** | Trapèze, 15 broches sur 3 rangées | Obsolète, analogique |
| **RJ45** | 8 broches + clip plastique | Réseau filaire |

---

## Écrans et affichage

### Critères de choix

| Critère | Repères |
|---|---|
| **Résolution** | HD (1366×768) → FHD (1920×1080) → QHD (2560×1440) → 4K (3840×2160) |
| **Taille** | 22-24" bureautique · 27" confort · 32"+ usage spécifique |
| **Fréquence** | 60 Hz bureautique · 120 Hz et plus pour le jeu |
| **Temps de réponse** | 1 à 5 ms pour le jeu et la vidéo rapide |

![[resolutions-ecran.svg]]

### Types de dalle

| Dalle | Points forts | Points faibles | Usage |
|---|---|---|---|
| **TN** | Rapide, peu chère | Couleurs et angles médiocres | Jeu compétitif, parc à bas coût |
| **IPS** | Couleurs fidèles, larges angles | Contraste moyen | Bureautique, graphisme — **le choix par défaut** |
| **VA** | Très bon contraste | Rémanence possible | Multimédia |
| **OLED** | Noirs parfaits | Cher, risque de marquage | Haut de gamme |

> [Écran d'ordinateur — Wikipédia](https://fr.wikipedia.org/wiki/%C3%89cran_d%27ordinateur)

### Connectiques vidéo : la version compte

Le connecteur ne dit pas tout. Un câble HDMI physiquement identique peut être limité à 1080p ou monter à 8K selon sa version.

| Connectique | Signal | Capacité réelle |
|---|---|---|
| **VGA** | Analogique | 1080p, qualité dégradée. À remplacer |
| **DVI** | Numérique | 1080p (single-link) à QHD (dual-link). **Pas d'audio** |
| **HDMI 1.4** | Numérique | 4K à **30 Hz** seulement |
| **HDMI 2.0** | Numérique | 4K à 60 Hz |
| **HDMI 2.1** | Numérique | 4K à 120 Hz, 8K |
| **DisplayPort 1.2** | Numérique | 4K à 60 Hz, multi-écrans |
| **DisplayPort 1.4** | Numérique | 4K à 120 Hz, 8K |
| **USB-C (DP Alt Mode)** | Numérique + alimentation | Jusqu'à 4K, écran alimenté par le même câble |

<iframe width="560" height="315" src="https://www.youtube.com/embed/LLZLlgfGGrE?si=IZG68nj3VsPBh5mT" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> [!warning] « 4K à 144 Hz » ne passe pas partout
> Une configuration exigeante impose **DisplayPort 1.4 ou HDMI 2.1**. Avec un câble HDMI 1.4, l'écran fonctionnera — mais bridé à 30 Hz, ce qui donne une sensation de saccade que l'utilisateur décrira comme « l'écran rame ».

### Multi-écrans et adaptateurs

* **DisplayPort MST** permet de chaîner plusieurs écrans sur un seul port (*daisy chain*)
* Les **adaptateurs passifs** ne convertissent pas le signal : ils exploitent une compatibilité native. DP → HDMI fonctionne en passif, l'inverse rarement
* Les **adaptateurs actifs** contiennent une puce de conversion. Nécessaires pour HDMI → VGA (numérique vers analogique) et pour la plupart des conversions montantes

### Problèmes fréquents

| Symptôme | Piste |
|---|---|
| Aucun signal | Mauvaise source d'entrée sur l'écran, câble, ou écran branché sur la carte mère au lieu de la carte graphique |
| Résolution incorrecte, image floue | Pilote graphique générique — installer le pilote constructeur |
| Image qui scintille, saccades | Fréquence mal réglée dans les paramètres d'affichage |
| Second écran non détecté | Câble, ou détection à forcer (`Win + P`) |
| Bandes de couleur, image instable | Câble trop long ou de mauvaise qualité |

---

## L'USB

<iframe width="560" height="315" src="https://www.youtube.com/embed/G1eRFPZoV-E?si=ye-CVF_n4cAD0U_S" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Le désordre des appellations

L'USB-IF a renommé ses normes **deux fois**, en gardant les anciens noms en circulation. Trois noms peuvent désigner la même chose. Le seul repère fiable est le **débit**.

![[usb-normes-timeline.svg]]

| Débit | Nom d'origine | Renommage 1 | Renommage 2 (actuel) |
|---|---|---|---|
| 480 Mbps | USB 2.0 | — | USB 2.0 |
| **5 Gbps** | USB 3.0 | USB 3.1 Gen 1 | **USB 3.2 Gen 1** / USB 5Gbps |
| **10 Gbps** | USB 3.1 | USB 3.1 Gen 2 | **USB 3.2 Gen 2** / USB 10Gbps |
| **20 Gbps** | — | USB 3.2 Gen 2×2 | USB 20Gbps |
| **40 Gbps** | — | — | USB4 / USB 40Gbps |

> [!tip]
> Face à une fiche technique, **chercher le débit en Gbps**, pas le numéro de version. « USB 3.2 » sans autre précision ne veut rien dire : ça peut être 5, 10 ou 20 Gbps.

### USB-C, USB4 et Thunderbolt

Trois notions qu'on confond systématiquement :

| | Ce que c'est |
|---|---|
| **USB-C** | Un **connecteur**, une forme physique. Rien d'autre |
| **USB4 / USB 3.x** | Un **protocole**, qui définit le débit |
| **Thunderbolt** | Une **certification Intel** exigeant 40 Gbps, la vidéo, le PCIe et 100 W minimum |

Un port USB-C peut donc n'être qu'en USB 2.0 à 480 Mbps. Le logo à côté du port tranche : **éclair** = Thunderbolt, **chiffre** = débit garanti.

### Alimentation

| Norme | Puissance |
|---|---|
| USB 2.0 | 2,5 W |
| USB 3.x | 4,5 W |
| USB-C standard | 15 W |
| **USB-C Power Delivery** | jusqu'à 240 W |

Le **Power Delivery** permet d'alimenter un PC portable par le même câble que les données — c'est le principe du dock USB-C.

### Le câble compte autant que le port

Un câble USB-C peut n'être qu'un câble de **charge**, sans les paires de données rapides. Brancher un SSD 10 Gbps avec un câble de téléphone donnera 480 Mbps — sans aucun message d'erreur. C'est une cause classique de « mon disque externe est lent ».

### Bonnes pratiques

* Tester d'abord les ports **arrière** sur un poste fixe : ils sont câblés directement sur la carte mère
* USB 3.0 = intérieur du port **bleu** (convention fréquente, pas systématique)
* Éviter les hubs non alimentés pour les périphériques gourmands
* Un périphérique non reconnu sur tous les ports oriente vers le périphérique, pas vers le poste

---

## Les imprimantes

### Types

| Type | Caractéristiques | Coût/page | Usage |
|---|---|---|---|
| **Jet d'encre** | Bonne qualité photo, achat peu cher | Élevé, encre qui sèche | Domicile, faible volume |
| **Laser** | Rapide, toner longue durée | Faible | **Entreprise** |
| **Multifonction** | Scanner et copieur intégrés | Variable | Polyvalent |
| **Thermique** | Étiquettes, tickets, sans encre | Très faible | Logistique, commerce |

> [!tip]
> Une imprimante jet d'encre peu utilisée coûte cher : les buses sèchent et le nettoyage consomme de l'encre. En entreprise, le **laser** est presque toujours le bon choix.

### Modes de connexion

| Mode | Avantage | Limite |
|---|---|---|
| **USB direct** | Simple, fiable | Un seul poste |
| **Réseau (port TCP/IP)** | Chaque poste imprime directement, en **Ethernet ou en Wi-Fi** | Nécessite une **IP fixe** sur l'imprimante |
| **Partagée depuis un poste** | Aucune config réseau | Le poste hôte doit rester allumé |
| **Wi-Fi Direct** | Aucune infrastructure : l'imprimante crée son propre réseau | Un seul appareil à la fois, hors gestion du parc |

![[imprimante-connexions.svg]]

> [!important] Wi-Fi n'est pas un mode de connexion
> Une imprimante branchée sur le **Wi-Fi de l'entreprise** est une imprimante **réseau TCP/IP** : elle a une adresse IP, on l'ajoute par son port TCP/IP, et elle se dépanne exactement comme une imprimante Ethernet. Seul le média change — le câble est remplacé par des ondes.
> Le Wi-Fi n'est un mode distinct que sous la forme du **Wi-Fi Direct**, où l'imprimante se comporte en point d'accès autonome, sans passer par le réseau.

> [!tip] Wi-Fi Direct en intervention
> Pratique pour imprimer depuis le téléphone d'un visiteur, ou pour tester une imprimante sans toucher au réseau. Deux réserves : l'appareil qui s'y connecte **perd souvent son accès Internet** pendant la liaison (il quitte le Wi-Fi de l'entreprise), et l'imprimante échappe à toute supervision centralisée.

> [!warning]
> Une imprimante réseau en **DHCP** change d'adresse au redémarrage — et tous les postes la voient « hors connexion ». Une imprimante réseau doit avoir une **IP fixe**, ou une réservation DHCP.

### Le spouleur d'impression

Le **spouleur** est le service Windows qui met les documents en file d'attente. C'est le point de panne n°1 en impression.

Symptômes : les documents s'empilent sans s'imprimer, impossible de les supprimer, l'imprimante ne répond plus alors qu'elle est allumée et joignable.

![[spouleur-impression.svg]]

La procédure de remise à zéro, en invite de commandes **administrateur** :

```
net stop spooler
del /Q /F /S "%systemroot%\System32\spool\PRINTERS\*.*"
net start spooler
```

> [!tip]
> Ces trois commandes règlent une très grande partie des tickets d'impression. À connaître par cœur.

### Problèmes fréquents

| Symptôme | Cause probable | Action |
|---|---|---|
| Imprimante non détectée | Câble, pilote absent | Vérifier le câble, installer le pilote constructeur |
| Documents bloqués dans la file | Spouleur figé | Redémarrer le spouleur (ci-dessus) |
| « Hors connexion » | L'IP a changé | Fixer l'IP, recréer le port TCP/IP |
| Imprime des caractères aberrants | Mauvais langage (PCL / PostScript) | Installer le bon pilote |
| Qualité dégradée, traînées | Buses encrassées, tambour usé | Nettoyage, remplacement du consommable |
| Imprime des pages blanches | Consommable vide malgré l'indicateur | Vérifier le toner ou la cartouche |

---

## Le réseau : carte, normes et câbles

### Ethernet

| Norme | Débit | Remarques |
|---|---|---|
| **Fast Ethernet** | 100 Mbps | Ancien, encore présent |
| **Gigabit Ethernet** | 1 Gbps | Standard actuel |
| **2,5G / 5G** | 2,5 / 5 Gbps | Multi-gig, NAS |
| **10G** | 10 Gbps | RJ45 ou SFP+, réseaux pro |

### Les câbles

| Catégorie | Débit supporté | Portée |
|---|---|---|
| **Cat 5e** | 1 Gbps | 100 m |
| **Cat 6** | 1 Gbps, 10 Gbps sur 55 m | 100 m |
| **Cat 6a** | 10 Gbps | 100 m |

> [!warning] Le câble bride tout le reste
> Un port Gigabit relié par un câble Cat 5 abîmé négociera en **100 Mbps** sans prévenir. Un débit anormalement bas se vérifie d'abord dans les propriétés de la carte : si elle affiche 100 Mbps sur un équipement Gigabit, c'est le câble ou la prise murale.

### Wi-Fi

| Norme | Débit théorique | Bandes | Année |
|---|---|---|---|
| **Wi-Fi 4 (802.11n)** | ~300 Mbps | 2,4 / 5 GHz | 2009 |
| **Wi-Fi 5 (802.11ac)** | ~1,3 Gbps | 5 GHz | 2014 |
| **Wi-Fi 6 (802.11ax)** | ~9,6 Gbps | 2,4 / 5 GHz | 2019 |
| **Wi-Fi 6E** | ~9,6 Gbps | + 6 GHz | 2021 |
| **Wi-Fi 7 (802.11be)** | > 30 Gbps | 2,4 / 5 / 6 GHz | 2024 |

**2,4 GHz ou 5 GHz** — arbitrage permanent :

* **2,4 GHz** : plus grande portée, traverse mieux les murs, mais peu de canaux et beaucoup d'interférences (micro-ondes, Bluetooth, voisins)
* **5 GHz** : bien plus rapide, beaucoup de canaux, mais portée réduite et murs pénalisants

Les débits annoncés sont **théoriques et partagés** entre tous les appareils connectés. En pratique, on obtient une fraction de ces valeurs.

---

## Les bases de l'adressage IP

Pour communiquer, une machine a besoin de **quatre informations**. Chacune répond à une question distincte, et chacune provoque une panne différente si elle manque.

![[adressage-ip.svg]]

| Paramètre | Question | Exemple |
|---|---|---|
| **Adresse IP** | Qui suis-je ? | `192.168.56.50` |
| **Masque de sous-réseau** | Qui est mon voisin direct ? | `255.255.255.0` |
| **Passerelle** | Par où je sors du réseau local ? | `192.168.56.1` |
| **DNS** | Comment je traduis un nom en adresse ? | `8.8.8.8` |

### Adresses privées et publiques

Les adresses **privées** ne circulent pas sur Internet. Elles sont réutilisables dans chaque réseau local :

| Plage privée | Usage courant |
|---|---|
| `10.0.0.0` → `10.255.255.255` | Grandes entreprises |
| `172.16.0.0` → `172.31.255.255` | Entreprises |
| `192.168.0.0` → `192.168.255.255` | Box, PME, labos |

La box effectue la traduction (**NAT**) entre le réseau privé et l'adresse publique unique fournie par le fournisseur d'accès.

### DHCP ou adresse statique ?

| | DHCP | Statique |
|---|---|---|
| Attribution | Automatique par un serveur | Saisie manuelle |
| Avantage | Aucune configuration, pas de conflit | L'adresse ne change jamais |
| Pour qui | **Les postes utilisateurs** | Serveurs, imprimantes, switches, NAS |

> [!warning] L'adresse 169.254.x.x — le symptôme à reconnaître
> Une machine qui affiche une adresse en `169.254.x.x` (**APIPA**) n'a **pas trouvé de serveur DHCP** et s'est auto-attribué une adresse. Elle ne communiquera avec personne.
> Causes : câble débranché, switch éteint, serveur DHCP en panne, ou VLAN mal configuré. C'est le « triangle jaune » classique.

> [!warning] Ne jamais choisir une IP statique au hasard
> Poser une adresse déjà attribuée provoque un **conflit** : les deux machines perdent le réseau. Sur un réseau d'entreprise, l'adressage suit un plan, et les IP fixes sont réservées hors de la plage DHCP.

---

## Diagnostiquer une panne réseau

La méthode consiste à **tester de plus en plus loin**. La première étape qui échoue désigne le composant fautif.

![[diagnostic-reseau.svg]]

### Les commandes à connaître

| Commande | Ce qu'elle donne |
|---|---|
| `ipconfig /all` | Toute la configuration : IP, masque, passerelle, DNS, adresse MAC |
| `ping <adresse>` | La machine visée répond-elle ? |
| `nslookup <nom>` | Le DNS traduit-il correctement ce nom ? |
| `tracert <nom>` | Par où passe le trafic, et où il se bloque |
| `ipconfig /release` puis `/renew` | Redemander une adresse au DHCP |
| `ipconfig /flushdns` | Vider le cache DNS local |

> [!important] Le réflexe qui fait gagner le plus de temps
> **`ping 8.8.8.8` fonctionne mais `ping google.com` échoue → c'est le DNS.** Rien d'autre. La connectivité est bonne, seule la traduction des noms est cassée.

### Tableau de synthèse

| Symptôme | Étape en cause | Piste |
|---|---|---|
| Aucun réseau, pas de câble détecté | Physique | Câble, prise murale, switch, carte désactivée |
| Adresse en `169.254.x.x` | DHCP | Serveur DHCP injoignable |
| Passerelle injoignable | Réseau local | Câble, switch, Wi-Fi, masque incorrect |
| Ping IP publique OK, ping nom KO | DNS | DNS mal configuré ou injoignable |
| Tout répond mais rien ne s'affiche | Applicatif | Proxy, pare-feu, navigateur |
| Débit anormalement bas | Physique | Câble, port négocié en 100 Mbps |
| Wi-Fi absent de la liste | Matériel | Carte désactivée, mode avion, pilote |

---

> [!summary] À retenir
> * Tout périphérique suit la chaîne **détection → pilote → utilisable**. Le pilote constructeur débloque les fonctions avancées.
> * Diagnostic périphérique : **autre port, autre câble, autre poste, autre pilote**.
> * **Le connecteur ne détermine pas la norme** : USB-C peut être en USB 2.0, et Thunderbolt utilise le même port.
> * Pour l'USB, se fier au **débit en Gbps**, jamais au numéro de version.
> * Sur les écrans, la **version** du HDMI ou du DisplayPort décide de la résolution et de la fréquence.
> * Imprimante réseau = **IP fixe**. Documents bloqués = **redémarrer le spouleur**.
> * Une configuration IP tient en quatre éléments : **IP, masque, passerelle, DNS**.
> * **`169.254.x.x` = pas de DHCP.** **Ping IP OK + ping nom KO = DNS.**

---

## Pour aller plus loin

* Lignes PCIe et cartes d'extension → [[Formations/configuration-maintenance-pc/cours/02-composants-pc/02-composants-pc.md]]
* Connectiques et ports des portables, docks → [[Formations/configuration-maintenance-pc/cours/03-pc-portables/03-pc-portables.md]]
* Stockage réseau, NAS et partages → [[Formations/configuration-maintenance-pc/cours/05-stockage/05-stockage.md]]
* Méthode générale de diagnostic → [[Formations/configuration-maintenance-pc/cours/07-maintenance-diagnostic/07-maintenance-diagnostic.md]]

<!--
VISUELS — tous locaux dans Ressources/images/, aucun lien externe.
  connecteurs-planche.svg · resolutions-ecran.svg · usb-normes-timeline.svg
  imprimante-connexions.svg · spouleur-impression.svg · adressage-ip.svg
  diagnostic-reseau.svg                                    (charte du coffre §2)

Les 2 iframes YouTube d'origine sont conservées, mais le texte est autonome.

Les liens externes commerciaux de la version d'origine (config-gamer.fr,
materiel.net) ont été retirés : contenu désormais couvert par le cours.
-->
