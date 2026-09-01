---
title: "TP 5 — Connectiques et réseau"
aliases:
  - "/tp/06-tp-peripheriques"
---

# TP 5 – Connectiques et configuration réseau

> [!TIP] Ressource du TP
>
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/06-tp-peripheriques.md" download>Télécharger ce TP en Markdown</a>

> Chapitre associé : `cours/06-peripheriques.md`

## Objectif

Consolider les notions du chapitre 5 en deux temps :

1. Identifier des connectiques à partir de leur description
2. Configurer manuellement une interface réseau sous Windows 11

---

# Partie 1 – Quiz connectiques

## Règle du jeu

Pour chaque question, une seule réponse correcte.
Notez vos réponses dans votre HedgeDoc avant de comparer avec le groupe.

---

## 1. Identification par caractéristiques

Pour chaque ligne, identifiez le connecteur décrit.

| #   | Description                                                                | Réponse |
| --- | -------------------------------------------------------------------------- | ------- |
| 1   | Rectangulaire, unilatéral, bleu sur les ports USB 3.0                      |         |
| 2   | Carré, utilisé principalement pour les imprimantes                         |         |
| 3   | Réversible, peut transporter données + vidéo + alimentation jusqu'à 240 W  |         |
| 4   | Trapézoïdal, signal analogique, aujourd'hui obsolète                       |         |
| 5   | Même forme que le précédent mais signal numérique, supporte le multi-écran |         |
| 6   | 8 broches, connecteur réseau filaire RJ                                    |         |
| 7   | Identique visuellement au USB-C, logo éclair, jusqu'à 40 Gbps              |         |
| 8   | Rectangulaire, 19 broches, standard vidéo grand public actuel              |         |

> [!tip] Correction
> USB-A · USB-B · USB-C · VGA · DisplayPort · RJ45 · Thunderbolt · HDMI

---

## 2. Bon connecteur pour le bon usage

Pour chaque situation, quel connecteur utiliseriez-vous ?

| #   | Situation                                                                | Connecteur choisi |
| --- | ------------------------------------------------------------------------ | ----------------- |
| 1   | Relier un PC récent à un écran 4K à 144 Hz                               |                   |
| 2   | Connecter une imprimante laser de bureau                                 |                   |
| 3   | Brancher un dock externe qui alimente aussi le PC portable               |                   |
| 4   | Relier un switch réseau à un serveur                                     |                   |
| 5   | Connecter un écran ancien à une carte graphique moderne (via adaptateur) |                   |
| 6   | Transférer des fichiers depuis une clé USB vers un port bleu             |                   |

---

## 3. Vrai ou Faux

Répondez V ou F, et corrigez les affirmations fausses.

| #   | Affirmation                                                      | V/F | Correction si faux |
| --- | ---------------------------------------------------------------- | --- | ------------------ |
| 1   | Un câble USB-C garantit toujours un débit de 40 Gbps             |     |                    |
| 2   | Le Thunderbolt 4 utilise le même connecteur physique que l'USB-C |     |                    |
| 3   | Un SSD M.2 est forcément plus rapide qu'un SSD 2,5"              |     |                    |
| 4   | HDMI 1.4 supporte la 4K à 60 Hz                                  |     |                    |
| 5   | Un port USB 3.0 est rétrocompatible avec un périphérique USB 2.0 |     |                    |
| 6   | DisplayPort peut transporter plusieurs écrans sur un seul câble  |     |                    |

---

# Partie 2 – Configuration réseau manuelle

## Contexte

Vous prenez en charge un poste Windows 11 configuré en DHCP.
Le réseau local ne dispose pas de serveur DHCP fiable — vous devez configurer une adresse IP statique et vérifier la connectivité.

> [!info]
> Vous travaillez sur votre VM Windows 11 VirtualBox (interface en mode NAT ou Host-Only selon votre configuration).

---

## Étape 1 – Identifier la configuration actuelle

Ouvrez un terminal et notez :

```
ipconfig /all
```

Dans votre HedgeDoc, relevez :

- le nom de l'interface réseau active
- l'adresse IP actuelle
- le masque de sous-réseau
- la passerelle
- le serveur DNS

---

## Étape 2 – Passer en IP statique

Dans les **Paramètres → Réseau → Propriétés de l'adaptateur**, configurez :

| Paramètre      | Valeur à saisir |
| -------------- | --------------- |
| Adresse IP     | `192.168.56.50` |
| Masque         | `255.255.255.0` |
| Passerelle     | `192.168.56.1`  |
| DNS principal  | `8.8.8.8`       |
| DNS secondaire | `1.1.1.1`       |

---

## Étape 3 – Vérifier la configuration

```
ipconfig
```

Confirmez que l'IP statique est bien appliquée.

---

## Étape 4 – Tester la connectivité

Exécutez les commandes suivantes et notez le résultat (succès / échec / temps de réponse) :

```
ping 192.168.56.1
ping 8.8.8.8
ping google.com
nslookup google.com
```

| Commande              | Résultat | Interprétation |
| --------------------- | -------- | -------------- |
| `ping 192.168.56.1`   |          |                |
| `ping 8.8.8.8`        |          |                |
| `ping google.com`     |          |                |
| `nslookup google.com` |          |                |

---

## Étape 5 – Analyse

Répondez dans votre HedgeDoc :

1. Quelle est la différence entre un ping vers l'IP `8.8.8.8` et un ping vers `google.com` ?
2. Si `ping 8.8.8.8` fonctionne mais pas `ping google.com`, quel composant est en cause ?
3. À quoi sert le DNS secondaire ?
4. Pourquoi ne pas utiliser une IP statique au hasard sur un réseau d'entreprise ?

---

## Étape 6 – Remettre en DHCP

Repassez l'interface en **"Obtenir une adresse IP automatiquement"** et vérifiez que la connectivité est rétablie.

---

## Rendu attendu

Dans votre HedgeDoc :

```md
# TP 5 – Connectiques et configuration réseau

## Partie 1 – Quiz

[Vos réponses aux 3 exercices]

## Partie 2 – Réseau

### Configuration appliquée

[Capture ou relevé ipconfig]

### Résultats des tests

[Tableau complété]

### Analyse

[Réponses aux 4 questions]
```
