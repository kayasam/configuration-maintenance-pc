# Plan de formation – Configuration et maintenance PC (TSSR – 3 jours, à distance)

## Structure

```
formations/configuration-maintenance-pc/
├── cours/                 ← un fichier par chapitre
├── tp/                    ← TP + corrections (même numérotation)
├── Ressources/
│   ├── programme/         ← ce fichier + plan officiel Dawan
│   └── archive/           ← brouillons antérieurs (chatgpt/, ancien contenu à trier)
└── sessions/
    └── YYYY-MM-DD-DD/
```

---

## Chapitre 1 – Le rôle du technicien support et l'environnement PC

> [cours](../../cours/01-role-du-technicien.md) · [TP1](../../tp/01-tp-role-technicien.md)

### Objectifs

- Comprendre le métier de technicien support
- Identifier les pannes courantes
- Savoir où chercher l'information
- Introduire la logique de diagnostic

### Contenu

- Missions du technicien support (N1 / N2)
- Différence logiciel / matériel
- Méthodologie de diagnostic (observer → tester → isoler)
- Offres constructeurs vs assembleurs
- Sources de documentation fiables :

  - constructeurs
  - forums
  - bases de connaissances
  - documentation technique

### TP 1 – Jeu de rôle support à distance (GLPI)

- Création des comptes GLPI (binômes)
- Un élève = utilisateur / un élève = technicien
- Création d'un ticket simple :

  - PC lent
  - pas de son
  - pas d'accès Internet

- Qualification du ticket + hypothèses de panne
- Conclusion collective

---

## Chapitre 2 – Les composants d'un PC et leur rôle

> [cours](../../cours/02-composants-pc.md) · [TP2](../../tp/02-tp-composants-pc.md)

### Objectifs

- Identifier les composants internes d'un PC
- Comprendre leur rôle et leurs interactions
- Savoir choisir des composants adaptés à un besoin

### Contenu

- Boîtiers (formats, airflow)
- Carte mère :

  - socket
  - chipset
  - slots RAM
  - PCIe

- Processeur :

  - cœurs / threads
  - fréquence
  - iGPU

- Mémoire :

  - DDR (principe, évolution)

- Stockage :

  - HDD / SSD SATA / NVMe

- Carte graphique
- Alimentation (puissance, 80+)
- Ports et bus (USB, PCIe, SATA – approche fonctionnelle)

### TP 2 – Configurer deux PC selon un besoin

- Utilisation d'un configurateur (au choix des apprenants)
- PC 1 : bureautique – 600 €
- PC 2 : gaming – 1400 €
- Justification orale :

  - pourquoi ce CPU ?
  - pourquoi ce type de stockage ?
  - compromis budget / performance

- Mise en commun et comparaison

---

## Chapitre 2b – Choisir un PC portable

> [cours](../../cours/03-pc-portables.md) — pas de TP dédié

### Objectifs

- Adapter les critères de choix PC fixe au contexte mobile
- Savoir évaluer un portable au-delà du prix affiché

### Contenu

- Génération réelle des composants (CPU, RAM, Wi-Fi) vs millésime commercial
- Technologie d'écran (dalle, résolution, fréquence, luminosité)
- Power Delivery (USB-C, wattage, dock)
- RAM/stockage évolutif ou soudé, connectique, autonomie (Wh)
- Qualité du châssis, licence Windows Pro (obligatoire pour rejoindre un domaine AD)

---

## Chapitre 3 – BIOS / UEFI et démarrage du PC

> [cours](../../cours/04-bios-demarrage.md) · [TP3](../../tp/04-tp-bios-demarrage.md)

### Objectifs

- Comprendre le rôle du BIOS/UEFI
- Comprendre la séquence de boot
- Différencier BIOS et UEFI

### Contenu

- Rôle du BIOS / UEFI
- Paramètres essentiels :

  - ordre de boot
  - détection RAM / disques

- Différence BIOS / UEFI
- Notion de POST

### TP 3 – Simulation BIOS et démarrage (à distance)

- VM Windows 11 + Linux sous hyperviseur :

  - accès aux paramètres firmware
  - ordre de boot

- Installation d'un système de chaque, comparaison des contraintes de démarrage
- Analyse collective

> À distance, l'objectif n'est **pas la manipulation physique**, mais la **compréhension fonctionnelle**.

---

## Chapitre 4 – Stockage et systèmes

> [cours](../../cours/05-stockage.md) · [TP4](../../tp/05-tp-stockage.md)

### Objectifs

- Comprendre les types de disques
- Savoir partitionner
- Comprendre l'impact du stockage sur le système

### Contenu

- SATA / NVMe (principe), technologie / format / bus
- Partitionnement (logique)
- Systèmes de fichiers (vue d'ensemble)
- NAS / SAN / RAID en milieu professionnel
- Lien stockage ↔ performances ↔ pannes

### TP 4 – Gestion des disques sur une VM

- Ajout d'un disque virtuel
- Initialisation et partitionnement
- Cas de panne simulée :

  - disque plein
  - disque non monté

- Diagnostic

---

## Chapitre 5 – Périphériques, réseau et impression

> [cours](../../cours/06-peripheriques.md) · [TP5](../../tp/06-tp-peripheriques.md)

### Objectifs

- Comprendre l'installation des périphériques
- Identifier les pannes simples réseau / impression

### Contenu

- Périphériques USB, pilotes
- Écrans (connectiques vidéo) et imprimantes
- Cartes réseau filaire / Wi-Fi, normes et débits
- Bases de l'adressage IP

### TP 5 – Connectiques et configuration réseau

- Quiz d'identification de connectiques (USB, HDMI, DisplayPort, RJ45, Thunderbolt...)
- Configuration IP statique sur VM Windows 11 + tests de connectivité (ping, nslookup)
- Retour en DHCP

---

## Chapitre 6 – Maintenance et résolution de pannes

> [cours](../../cours/07-maintenance-diagnostic.md) · [TP6](../../tp/07-tp-maintenance.md)

### Objectifs

- Appliquer une méthodologie
- Savoir raisonner face à une panne
- Comprendre la maintenance préventive

### Contenu

- Maintenance préventive vs corrective
- Méthodologie complète de diagnostic (8 étapes)
- Outils de diagnostic Windows
- Pannes matérielles et logicielles courantes

### TP 6 – Cellule de crise support

- 5 tickets simulés distribués (PC lent, écran noir, plus de réseau, disque plein, périphérique non reconnu)
- Travail en binôme via GLPI, indices donnés progressivement par le formateur
- Restitution orale

---

## Pourquoi ce format fonctionne bien en distanciel

- Peu de chapitres → vision claire
- 1 TP par chapitre → rythme stable
- Jeux de rôle → implication
- GLPI → contexte professionnel réel
- VM → manipulation sans risque
- Travail en binôme → dynamique de groupe

---

## Ressources

- [Plan de formation Dawan PDF](configuration-et-maintenance-pc.pdf)
