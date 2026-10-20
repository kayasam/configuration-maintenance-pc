"""Retain the old public chapter, HTML, quiz and download addresses."""
from pathlib import Path
import html,json,shutil
ROOT=Path(__file__).resolve().parents[1]
site=json.loads((ROOT/'site.json').read_text(encoding='utf-8'))
base=site['baseUrl'];content=ROOT/'content'
def redirect(old,new):
    path=content/old;path.parent.mkdir(parents=True,exist_ok=True)
    target=html.escape(base+'/'+new,quote=True)
    path.write_text('<!doctype html><html lang="fr"><meta charset="utf-8"><meta http-equiv="refresh" content="0;url='+target+'"><title>Page deplacee</title><link rel="canonical" href="'+target+'"><p><a href="'+target+'">Ouvrir le chapitre</a></p></html>',encoding='utf-8')
for track in site['tracks']:
    for ch in track['chapters']:
        key=track['id']+'/'+ch['slug'];slug=ch['slug']
        redirect(slug+'/index.html',key+'/')
        redirect('cours/'+slug+'.html',key+'/')
        redirect('cours/'+slug+'-interactif.html',key+'/html/')
        redirect('cours/quiz/'+slug+'.html',key+'/quiz/')
        if ch.get('tp'):
            stem=Path(ch['tp']).stem
            redirect(slug+'/tp/'+stem+'.html',key+'/tp')
            redirect('tp/'+stem+'.html',key+'/tp')
        download=content/'telechargements/cours'/Path(ch['course']).name
        download.parent.mkdir(parents=True,exist_ok=True)
        shutil.copy2(content/'telechargements'/track['id']/'cours'/Path(ch['course']).name,download)
redirect('cours/parcours-interactif.html','pc/')
shutil.copy2(content/'pc-obsidian.zip',content/'configuration-maintenance-pc-obsidian.zip')
print('Anciennes adresses conservees.')
