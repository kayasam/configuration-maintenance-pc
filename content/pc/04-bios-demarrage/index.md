---
title: "Chapitre 4 – BIOS / UEFI et démarrage du PC"
---

<nav class="chapter-resources" aria-label="Ressources du chapitre" data-course-key="pc/04-bios-demarrage"><div class="resource-buttons"><a class="resource-button" data-resource-kind="markdown" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 24"><rect x="1" y="1" width="30" height="22" rx="3" fill="none" stroke="#34495e" stroke-width="2"/><path d="M5 18V6h3l4 5 4-5h3v12h-3v-7l-4 5-4-5v7Z" fill="#34495e"/><path d="M23 6h3v7h3l-4.5 5-4.5-5h3Z" fill="#34495e"/></svg>
</span><span class="resource-label">Cours</span></a><a class="resource-button" data-resource-kind="html" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/html/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 32"><path d="M2 2h24l-2 25-10 3-10-3Z" fill="#e44d26"/><path d="M14 5v22l7-2 2-20Z" fill="#f16529"/><path d="M7 8h15l-.3 3H11l.3 3h10l-.8 9-6.5 2-6.5-2-.4-5h3l.2 2.6 3.7 1 3.7-1 .3-3.6H8Z" fill="#fff"/></svg>
</span><span class="resource-label">HTML</span></a><a class="resource-button" data-resource-kind="quiz" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/quiz/"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="4" y="3" width="24" height="26" rx="6" fill="#7652ad"/><path d="M12 12a4 4 0 1 1 6 3.5c-1.5.8-2 1.4-2 3" fill="none" stroke="#fff" stroke-width="2.8" stroke-linecap="round"/><circle cx="16" cy="23" r="1.6" fill="#fff"/></svg>
</span><span class="resource-label">Quiz</span></a><a class="resource-button" data-resource-kind="tp" href="https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/tp"><span class="resource-icon"><svg class="resource-symbol" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"><rect x="2" y="4" width="28" height="24" rx="5" fill="#237b60"/><path d="m8 12 5 4-5 4m9 0h7" fill="none" stroke="#fff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
</span><span class="resource-label">TP</span></a></div><div class="resource-actions"><a class="resource-download" download href="https://kayasam.github.io/configuration-maintenance-pc/telechargements/pc/cours/04-bios-demarrage.md">↓ Télécharger le cours (.md)</a><button type="button" class="support-focus-toggle" aria-pressed="false">Masquer les menus</button></div></nav>

> TP associé : [04-tp-bios-demarrage](https://kayasam.github.io/configuration-maintenance-pc/pc/04-bios-demarrage/tp)

## Pourquoi ce chapitre

Entre le moment où l'on appuie sur le bouton d'alimentation et l'apparition du bureau, il se passe une dizaine de secondes pendant lesquelles le système d'exploitation **n'existe pas encore**. C'est le firmware qui travaille.

Presque toutes les pannes « le PC ne démarre pas » se situent dans cette fenêtre. Savoir ce qui s'y passe, étape par étape, permet de transformer un symptôme vague en hypothèse précise.

---

## Le rôle du firmware

Le **BIOS** ou l'**UEFI** est un programme stocké dans une puce mémoire de la carte mère (mémoire flash). Il est le premier code exécuté par le processeur à la mise sous tension.

Ses trois missions :

| Mission | Détail |
|---|---|
| **Initialiser** | Réveiller CPU, RAM, contrôleurs, carte graphique, stockage |
| **Vérifier** | Tester la présence et le bon état des composants vitaux (POST) |
| **Passer la main** | Trouver un système d'exploitation et lui céder le contrôle |

Une fois l'OS lancé, le firmware s'efface : il ne sert plus qu'à fournir quelques services de bas niveau.

> [!important]
> Le firmware est **soudé à la carte mère**, pas au disque. Changer de disque dur ne change pas le BIOS. Réinstaller Windows ne répare pas un réglage BIOS erroné.

---

## BIOS et UEFI

### Le BIOS historique

Conçu au début des années 80 pour l'IBM PC. Il fonctionne en mode 16 bits, cherche un **MBR** (Master Boot Record) dans les 512 premiers octets du disque, et y exécute un mini-programme d'amorçage.

Ses limites viennent de son âge :

* **2 To de disque maximum** — le MBR adresse les secteurs sur 32 bits ; 2³² secteurs × 512 octets ≈ **2,2 To**. Au-delà, l'espace est invisible.
* **4 partitions principales maximum**
* Interface texte, navigation exclusivement au clavier
* Aucun mécanisme de sécurité au démarrage

![bios-award-setup.png](https://kayasam.github.io/configuration-maintenance-pc/assets/media/bios-award-setup.png)

*Setup d'un BIOS Award : texte, fond bleu, navigation aux flèches. Aucune souris, aucune image.*

### L'UEFI moderne

*Unified Extensible Firmware Interface*. Ce n'est plus un simple amorceur mais un **mini-système** : il sait lire un système de fichiers, exécuter de vrais programmes (`.efi`), gérer le réseau et la souris.

| | BIOS | UEFI |
|---|---|---|
| Époque | Années 80 | Depuis ~2010 |
| Mode processeur | 16 bits | 32 ou 64 bits |
| Table de partition | MBR | GPT |
| Limite de disque | ~2,2 To | ~9,4 Zo (théorique) |
| Nombre de partitions | 4 principales | 128 sous Windows |
| Interface | Texte, clavier | Graphique, souris |
| Sécurité | Aucune | Secure Boot, signatures |
| Amorçage | Code brut dans le MBR | Fichiers `.efi` sur une partition |
| Démarrage | Plus lent | Plus rapide |

![uefi-setup-screen.jpg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/uefi-setup-screen.jpg)

*Setup UEFI (ASUS EZ Mode) : interface graphique, souris, températures et tensions en direct. En bas, la **Boot Priority** se réorganise par glisser-déposer — noter le badge « UEFI » sur les supports et le bouton **Boot Menu (F8)**.*

> [!info] État du parc aujourd'hui
> L'UEFI est la norme. À partir des chipsets Intel série 500 (2021), beaucoup de cartes mères ne proposent même plus le mode Legacy. Windows 11 impose l'UEFI. On rencontre encore du BIOS Legacy sur du matériel d'avant 2012 et sur des machines virtuelles mal configurées.

---

## Mode de démarrage et table de partition

C'est le point qui provoque le plus d'échecs d'installation, et il repose sur une règle simple.

> [!warning] La règle à retenir
> **Le mode de démarrage et la table de partition doivent être cohérents.**
> UEFI ↔ GPT · Legacy/CSM ↔ MBR
> Un disque GPT ne démarrera pas en Legacy. Un disque MBR ne démarrera pas en UEFI pur.

![uefi-gpt-vs-legacy-mbr.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/uefi-gpt-vs-legacy-mbr.svg)

### Le mode Legacy / CSM

**CSM** = *Compatibility Support Module*. C'est un mode d'émulation : l'UEFI fait semblant d'être un vieux BIOS pour démarrer un système ancien ou un disque MBR.

Activer le CSM, c'est renoncer au Secure Boot et aux disques de plus de 2 To. On ne l'active que par nécessité.

### La partition EFI (ESP)

En mode UEFI, l'amorçage ne se fait plus dans un secteur caché mais dans de **vrais fichiers**, sur une partition dédiée :

* **ESP** = *EFI System Partition*
* Formatée en **FAT32**, environ 100 à 500 Mo
* Créée automatiquement à l'installation de l'OS

Elle contient un fichier d'amorçage par système installé. Le firmware mémorise ensuite la liste de ces systèmes dans sa **NVRAM** (petite mémoire persistante de la carte mère) — c'est pour cette raison que le menu de démarrage d'un PC moderne affiche des noms (*Windows Boot Manager*, *ubuntu*) et non plus une simple liste de disques.

![partition-efi.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/partition-efi.svg)

> [!tip] Conséquence pratique
> Supprimer ou formater la partition EFI rend **tous** les systèmes du disque non démarrables, même si leurs fichiers sont intacts. C'est une erreur classique lors d'un nettoyage de partitions.

> [Unified Extensible Firmware Interface — Wikipédia](https://fr.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
> [Table de partitionnement GUID (GPT) — Wikipédia](https://fr.wikipedia.org/wiki/Table_de_partitionnement_GUID)

---

## La séquence de démarrage

Au démarrage, le PC suit **toujours** le même chemin logique. Chaque étape dépend de la précédente : c'est ce qui permet de transformer un symptôme en hypothèse.

![sequence-boot.svg](https://kayasam.github.io/configuration-maintenance-pc/assets/media/sequence-boot.svg)

> [!summary] À retenir
> Chaque symptôme correspond à une étape précise de cette chaîne. Localiser l'étape, c'est déjà avoir isolé la panne.

---

## Le POST (Power-On Self Test)

Le **POST** est la phase d'autotest du firmware. Il vérifie, dans cet ordre, la présence et la réponse des composants sans lesquels rien n'est possible :

1. Processeur
2. Mémoire vive
3. Carte graphique / sortie vidéo
4. Contrôleurs et périphériques

Si tout se passe bien, l'affichage s'allume et le logo constructeur apparaît. **Voir le logo signifie que le POST est passé** — information de diagnostic majeure.

### Quand le POST échoue

Le PC s'arrête net et signale l'erreur par les moyens du bord — puisque l'écran n'est pas forcément disponible :

| Moyen | Où on le trouve |
|---|---|
| **Bips sonores** | Machines équipées d'un haut-parleur interne (surtout avant 2015) |
| **LED de diagnostic** | Q-LED chez ASUS, EZ Debug LED chez MSI, Dr. Debug chez ASRock |
| **Afficheur 2 chiffres** | Cartes mères milieu / haut de gamme |
| **LED clignotante** | Portables : code lumineux du bouton d'alimentation ou du capot |

> [!warning]
> La plupart des PC récents **n'ont plus de haut-parleur interne**. L'absence de bips ne signifie rien. Le réflexe moderne est de regarder les **LED de la carte mère**, qui indiquent le composant fautif (CPU / DRAM / VGA / BOOT).

Les codes varient selon le constructeur : la documentation de la carte mère est la seule référence fiable.

> [Power-on self-test — Wikipédia](https://fr.wikipedia.org/wiki/Power-on_self-test_\(informatique\))

---

## Secure Boot

Le **Secure Boot** (démarrage sécurisé) est un mécanisme UEFI qui vérifie la **signature cryptographique** de chaque programme d'amorçage avant de l'exécuter.

Objectif : empêcher un logiciel malveillant de s'installer *avant* le système d'exploitation, là où aucun antivirus ne peut le voir (bootkit, rootkit).

Fonctionnement : le firmware conserve une base de signatures autorisées. Si le fichier `.efi` n'est pas signé par une clé connue, il est **refusé**.

| Système | Comportement |
|---|---|
| Windows 10 / 11 | Signé par Microsoft, fonctionne nativement |
| Ubuntu, Fedora, Debian, RHEL | Utilisent un amorceur intermédiaire (*shim*) signé par Microsoft — fonctionnent |
| Distributions confidentielles, systèmes anciens | Souvent non signés — **bloqués** |
| Clés USB de diagnostic, live CD | Souvent bloquées |

> [!tip] En intervention
> Désactiver le Secure Boot est parfois nécessaire pour démarrer un outil de diagnostic. **On le réactive après.** Une machine laissée Secure Boot désactivé est une machine moins protégée — et sous Windows 11, un réglage non conforme.

---

## TPM 2.0 et prérequis de Windows 11

Le **TPM** (*Trusted Platform Module*) est un composant sécurisé qui stocke des clés de chiffrement. Il sert notamment à BitLocker et à l'authentification Windows Hello.

Il est rarement présent sous forme de puce séparée : il est aujourd'hui **intégré au processeur**, mais souvent **désactivé par défaut** dans le firmware.

| Plateforme | Nom du réglage dans le BIOS |
|---|---|
| Intel | **PTT** (Platform Trust Technology) |
| AMD | **fTPM** (firmware TPM) |

> [!important] Les quatre conditions de Windows 11
> 1. Démarrage en mode **UEFI** (pas de CSM)
> 2. Disque en **GPT**
> 3. **Secure Boot** activé (ou au minimum supporté)
> 4. **TPM 2.0** activé
>
> Message typique en cas de manquement : *« Ce PC ne peut pas exécuter Windows 11 »*, sans préciser lequel des quatre est en cause. Il faut les vérifier un par un.

Sous Windows, `msinfo32` affiche le mode BIOS (UEFI ou Hérité) et l'état du Secure Boot ; `tpm.msc` affiche la version du TPM.

---

## L'ordre de démarrage

Le firmware conserve une **liste ordonnée** des supports à essayer :

* Disque interne (SSD NVMe, SSD SATA, disque dur)
* Clé USB / disque externe
* Lecteur optique
* Réseau (**PXE**, démarrage sur un serveur — utilisé en entreprise pour déployer des postes)

Le firmware essaie chaque entrée dans l'ordre et s'arrête à la première qui répond.

### Boot order et boot menu

Deux choses différentes, à ne pas confondre :

| | Boot order | Boot menu |
|---|---|---|
| Nature | Réglage **permanent** | Choix **ponctuel**, pour ce démarrage uniquement |
| Accès | Dans le setup du firmware | Touche dédiée au démarrage (souvent **F12** ou **F11**) |
| Usage | Configuration durable d'un poste | Démarrer une fois sur une clé USB |

> [!tip]
> Pour une installation ou un diagnostic ponctuel, **utiliser le boot menu** plutôt que de modifier l'ordre permanent. Moins de risque d'oublier de remettre le réglage d'origine.

---

## Accéder au setup du firmware

### Par la touche au démarrage

| Constructeur | Setup | Boot menu |
|---|---|---|
| ASUS, MSI, Gigabyte, ASRock (cartes mères) | **Suppr** | F11 ou F8 |
| ASUS (portables) | **F2** | Échap |
| Dell | **F2** | **F12** |
| Lenovo | **F2** (ou bouton Novo) | **F12** |
| HP | **F10** | **Échap** puis F9 |
| Acer | **F2** | **F12** |

### Par Windows — la méthode fiable

Sur une machine récente avec SSD NVMe, la fenêtre pour appuyer sur la touche dure parfois **moins d'une seconde**. Le chemin logiciel est bien plus sûr.

**Méthode 1 — par les Paramètres**

```
Paramètres → Système → Récupération → Démarrage avancé → Redémarrer maintenant
```

**Méthode 2 — Maj + Redémarrer (la plus rapide)**

Maintenir la touche **Maj (Shift)** enfoncée et cliquer sur **Redémarrer**, dans le menu Démarrer. Fonctionne aussi depuis l'**écran de connexion**, sans être connecté à une session — précieux sur un poste dont on n'a pas le mot de passe.

**Méthode 3 — en ligne de commande**, depuis une invite administrateur :

```
shutdown /r /o /t 0
```

Les trois méthodes mènent au même endroit. Ensuite :

```
Dépannage → Options avancées → Changer les paramètres du microprogramme UEFI
```

![windows-options-recuperation.png](https://kayasam.github.io/configuration-maintenance-pc/assets/media/windows-options-recuperation.png)

*L'écran « Options avancées ». La tuile **Changer les paramètres du microprogramme UEFI** redémarre directement dans le setup.*

> [!note]
> Cette tuile n'apparaît **que sur les machines démarrées en mode UEFI**. Son absence est en soi un indice de diagnostic : la machine tourne probablement en Legacy/CSM.

---

## Fast Boot et démarrage rapide : deux pièges

Deux réglages portant presque le même nom, à des endroits différents, avec des effets différents.

### Fast Boot (dans l'UEFI)

Le firmware saute une partie des tests et n'initialise pas les périphériques USB avant le chargement de l'OS.

Conséquence : **le clavier ne répond pas au démarrage**, impossible d'entrer dans le setup par la touche. C'est la cause n°1 du « je n'arrive plus à accéder au BIOS ». Solution : passer par le chemin Windows ci-dessus, ou effacer le CMOS.

### Démarrage rapide (dans Windows)

Windows ne s'éteint pas vraiment : il met le noyau en hibernation dans `hiberfil.sys` pour redémarrer plus vite.

Conséquences en intervention :

* Le disque système reste marqué « en cours d'utilisation » — **Linux refuse de le monter en écriture** en dual boot
* Un « Arrêter » ne réinitialise pas réellement le matériel : pour un vrai redémarrage à froid, utiliser **Redémarrer**, qui lui ignore le démarrage rapide
* Certains problèmes de périphériques ne disparaissent qu'après désactivation de ce réglage

> [!tip]
> Réflexe de dépannage : avant de chercher loin, désactiver le **démarrage rapide** de Windows (Panneau de configuration → Options d'alimentation → Choisir l'action des boutons d'alimentation).

---

## Gestes techniciens

### La pile CMOS

Une pile bouton **CR2032** alimente la mémoire qui conserve les réglages et l'horloge quand le PC est débranché. Elle dure 5 à 10 ans.

Symptômes d'une pile morte :

* L'**heure et la date se réinitialisent** à chaque démarrage
* Les réglages du BIOS sont perdus
* Message au démarrage : *« CMOS checksum error »*, *« Please enter Setup »*
* Erreurs de certificats sur les sites web (date incohérente)

### Réinitialiser le CMOS (Clear CMOS)

Remet le firmware à ses réglages d'usine. Utile après une configuration erronée, un overclocking instable, ou pour lever un mot de passe BIOS.

Trois méthodes, PC débranché :

1. Bouton **CLR_CMOS** à l'arrière du boîtier (cartes mères récentes)
2. Cavalier (*jumper*) à déplacer quelques secondes sur la carte mère
3. Retirer la pile CR2032 pendant 5 à 10 minutes

> [!warning]
> Toujours **débrancher l'alimentation** et non simplement éteindre : l'alimentation continue de fournir du courant de veille à la carte mère.

### Mettre à jour le firmware

**Quand** : support d'un nouveau processeur, correctif de sécurité (microcode), bug de compatibilité mémoire, instabilité documentée par le constructeur.

**Quand s'abstenir** : si la machine fonctionne et qu'aucun problème n'est identifié. On ne flashe pas « pour être à jour ».

**Le risque** : une coupure de courant pendant l'opération peut rendre la carte mère inutilisable.

**Les outils** :

| Méthode | Exemples |
|---|---|
| Depuis le setup | ASUS EZ Flash, Gigabyte Q-Flash, MSI M-Flash |
| Depuis Windows | Dell Command Update, HP Support Assistant, Lenovo Vantage |
| Sans CPU ni RAM | ASUS BIOS FlashBack, Gigabyte Q-Flash Plus, MSI Flash BIOS Button |

> [!important]
> Un flash réinitialise fréquemment les réglages. **Noter l'ordre de démarrage et le mode UEFI/Legacy avant** de commencer.

---

## Cas des machines virtuelles

Le TP de ce chapitre se déroule sur hyperviseur : les mêmes notions s'y appliquent, sous d'autres noms.

| Hyperviseur | Mode Legacy | Mode UEFI | Secure Boot / TPM |
|---|---|---|---|
| **Hyper-V** | VM **génération 1** | VM **génération 2** | Secure Boot et vTPM disponibles en gén. 2 |
| **VirtualBox** | par défaut | Case *Activer EFI* | Secure Boot non géré, TPM à ajouter |
| **VMware** | BIOS | UEFI | Secure Boot et TPM en option |

> [!warning] Point de vigilance pour le TP
> Sous Hyper-V, la génération d'une VM se choisit **à la création et ne peut plus être modifiée ensuite**. Une VM de génération 1 ne pourra jamais installer Windows 11.
> Sous Hyper-V génération 2, le Secure Boot utilise par défaut un modèle Microsoft Windows : pour installer une distribution Linux, il faut sélectionner le modèle **Autorité de certification UEFI Microsoft** ou désactiver le Secure Boot.

---

## Problèmes courants

| Symptôme | Étape concernée | Pistes |
|---|---|---|
| Aucune réaction, pas de ventilateur | Alimentation | Alimentation, câble, bouton façade |
| Ventilateurs tournent, écran noir, pas de logo | POST | LED de diagnostic, RAM à réinstaller, carte graphique |
| Bips répétés au démarrage | POST | Code constructeur — RAM ou GPU dans la majorité des cas |
| *No boot device found* / *Operating system not found* | Recherche de l'amorceur | Disque non détecté, ordre de boot, mode UEFI/Legacy incohérent |
| Retour systématique dans le setup | Amorçage | Aucun support amorçable trouvé, amorceur effacé |
| Installation d'OS impossible | Mode de démarrage | CSM/UEFI, table de partition MBR/GPT, Secure Boot |
| *« Ce PC ne peut pas exécuter Windows 11 »* | Prérequis | TPM 2.0 désactivé, Secure Boot inactif, disque MBR |
| Clé USB absente du menu de démarrage | Détection | Clé formatée en MBR/NTFS alors que la machine est en UEFI pur |
| Heure systématiquement fausse au démarrage | CMOS | Pile CR2032 à remplacer |
| Impossible d'entrer dans le BIOS par la touche | Firmware | Fast Boot actif — passer par Windows |
| Plus de démarrage après clonage de disque | Amorçage | Partition EFI non copiée, entrées NVRAM obsolètes |
| Boucle de redémarrage avant le logo | POST | Matériel instable, réglages mémoire (XMP), alimentation insuffisante |

---

## Méthode de diagnostic

Face à un PC qui ne démarre pas, se poser les questions **dans cet ordre** :

1. **Y a-t-il du courant ?** Ventilateurs, LED, bruit.
2. **Le POST passe-t-il ?** Le logo constructeur s'affiche-t-il ?
3. **Le disque est-il détecté ?** Entrer dans le setup et vérifier.
4. **L'ordre de démarrage est-il correct ?**
5. **Le mode de démarrage correspond-il au disque ?** UEFI/GPT ou Legacy/MBR.

Chaque réponse négative désigne l'étape défaillante et referme le champ des hypothèses.

> [!summary] À retenir
> * Le firmware **initialise**, **teste** puis **passe la main** — trois missions, trois familles de pannes.
> * **UEFI ↔ GPT** et **Legacy/CSM ↔ MBR** : une incohérence ici explique la majorité des échecs d'installation.
> * Windows 11 exige **UEFI + GPT + Secure Boot + TPM 2.0**.
> * Voir le logo constructeur = le POST est passé. Sinon, lire les **LED de la carte mère**, pas les bips.
> * Un boot menu ponctuel vaut mieux qu'un ordre de démarrage modifié puis oublié.
> * **On observe et on vérifie avant de modifier.** Et on note les réglages d'origine.

---
