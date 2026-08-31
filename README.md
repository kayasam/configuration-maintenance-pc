# Configuration et maintenance PC

Site Quartz v5 du support de formation **Configuration et maintenance PC**.

Les sources officielles restent dans le coffre Obsidian :

- Markdown et TP : `C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\Formations\configuration-maintenance-pc`
- Versions HTML : `C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\cours-html\configuration-maintenance-pc`

## Utilisation locale

```powershell
npm ci
.\publier-les-cours.ps1 -PrepareOnly
npx quartz build --serve
```

Voir [MODE-EMPLOI-PUBLICATION.md](MODE-EMPLOI-PUBLICATION.md) pour la publication.
