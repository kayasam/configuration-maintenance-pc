# Chapitre 3 – BIOS / UEFI et démarrage du PC

> [!TIP] Ressources du chapitre
>
> - [Faire le quiz — 20 questions](https://kayasam.github.io/configuration-maintenance-pc/cours/quiz/04-bios-demarrage.html)
> - [Ouvrir la version HTML interactive](https://kayasam.github.io/configuration-maintenance-pc/cours/04-bios-demarrage-interactif.html)
> - <a href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/cours/04-bios-demarrage.md" download>Télécharger ce cours en Markdown</a>

## Le rôle du BIOS / UEFI

Le **BIOS** ou **UEFI** est le premier programme exécuté au démarrage du PC.

Il permet de :

- initialiser le matériel (CPU, RAM, carte graphique, stockage)
- vérifier que les composants sont fonctionnels
- lancer le système d'exploitation

Sans BIOS/UEFI fonctionnel, le PC **ne peut pas démarrer**.

---

## BIOS vs UEFI

|                   | BIOS                      | UEFI                       |
| ----------------- | ------------------------- | -------------------------- |
| Âge               | Ancien (années 80)        | Moderne                    |
| Interface         | Texte, navigation clavier | Graphique, souris possible |
| Limites disque    | 2 To max (MBR)            | Pas de limite (GPT)        |
| Sécurité          | Basique                   | Secure Boot, cryptographie |
| Vitesse démarrage | Plus lente                | Plus rapide                |

Aujourd'hui, les PC utilisent presque exclusivement l'**UEFI**.

![BIOS classique](https://www.szapphone.com/wp-content/uploads/2024/05/BIOS-mode-1024x636.webp)

![UEFI moderne](https://www.easeus.fr/images/en/screenshot/partition-manager/uefi-setup-screen.jpg)

---

## La séquence de démarrage (boot)

Au démarrage, le PC suit toujours le même chemin logique :

```
Mise sous tension
       ↓
Initialisation du matériel (BIOS/UEFI)
       ↓
POST (Power-On Self Test)
       ↓
Détection des disques
       ↓
Recherche d'un système bootable
       ↓
Lancement du système d'exploitation
```

---

## Le POST (Power-On Self Test)

Le **POST** est un test rapide qui vérifie :

- la présence du processeur
- la mémoire vive
- la carte graphique

Si le POST échoue :

- bips sonores (codes d'erreur selon le constructeur)
- écran noir
- arrêt immédiat du démarrage

> [Power-on self-test — Wikipédia](<https://fr.wikipedia.org/wiki/Power-on_self-test_(informatique)>)

---

## L'ordre de démarrage (Boot Order)

Le BIOS/UEFI contient une liste ordonnée de périphériques de démarrage :

- disque interne
- clé USB
- lecteur réseau (PXE)

Un mauvais ordre peut empêcher l'installation d'un OS ou le démarrage normal.

---

## Accès au BIOS / UEFI

Au démarrage, appuyer sur (selon le constructeur) :

| Touche          | Constructeur courant |
| --------------- | -------------------- |
| **Suppr / Del** | MSI, Gigabyte, ASUS  |
| **F2**          | Dell, Lenovo, ASUS   |
| **F10**         | HP                   |
| **F12**         | Boot menu rapide     |

---

## Paramètres essentiels à connaître

- Vérifier si le disque est **détecté**
- Consulter l'**ordre de démarrage**
- Identifier le mode : **UEFI** ou **Legacy (CSM)**
- Activer/désactiver le **Secure Boot** si nécessaire

---

## Problèmes courants

| Symptôme                         | Piste                                         |
| -------------------------------- | --------------------------------------------- |
| Écran noir au démarrage          | POST échoué / composant manquant              |
| « No boot device found »         | Disque non détecté / mauvais ordre de boot    |
| Retour systématique dans le BIOS | OS non installé ou bootloader manquant        |
| Installation de l'OS impossible  | Mauvais mode UEFI/Legacy ou Secure Boot actif |

> [!summary] À retenir
> Le démarrage suit toujours une séquence logique. Un symptôme correspond à une étape précise. On vérifie avant de modifier.
