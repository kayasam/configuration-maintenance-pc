"""Import only declared PC chapters; the Obsidian vault is strictly read-only."""
from pathlib import Path
import json, re, subprocess, shutil
from urllib.parse import quote

ROOT=Path(__file__).resolve().parents[1]
VAULT=Path('C:/Users/kayaw/Nextcloud/Obsidian/CoffreSam/Formations/configuration-maintenance-pc')
BASE='https://kayasam.github.io/configuration-maintenance-pc'
SLUGS=['01-role-du-technicien','02-composants-pc','03-pc-portables','04-bios-demarrage','05-stockage','06-peripheriques']
TPS={'01-role-du-technicien':'01-tp-role-technicien','02-composants-pc':'02-tp-composants-pc','04-bios-demarrage':'04-tp-bios-demarrage','05-stockage':'05-tp-stockage','06-peripheriques':'06-tp-peripheriques'}

def write(path,text):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(text,encoding='utf-8',newline='\n')

def main():
    sources=ROOT/'sources'; sources.mkdir(exist_ok=True)
    mappings={}
    for slug in SLUGS:
        mappings[slug]=slug+'.md'
        if slug in TPS: mappings[TPS[slug]]=TPS[slug]+'.md'
    images=VAULT/'Ressources/images'
    assert images.is_dir(),images
    for file in images.iterdir():
        if file.is_file():
            dst=ROOT/'assets/media'/file.name; dst.parent.mkdir(exist_ok=True)
            shutil.copy2(file,dst)
            dst=sources/'assets/media'/file.name; dst.parent.mkdir(parents=True,exist_ok=True)
            shutil.copy2(file,dst)
    def normalize(text):
        text=re.sub(r'(?m)^> Correction : \[\[[^\n]+\]\]\s*$', '',text)
        text=re.sub(r'\s+Voir \[\[[^\]\n]*07-maintenance-diagnostic[^\]\n]*\]\]\.', '.',text)
        text=re.sub(r'(?m)^[-*] [^\n]*\[\[[^\]\n]*07-maintenance-diagnostic[^\]\n]*\]\]\s*$', '',text)
        # Retain Markdown examples verbatim; only demote extra document-level headings.
        parts=re.split(r'(^```[^\n]*\n.*?^```\s*$)',text,flags=re.M|re.S)
        first=True
        def heading(m):
            nonlocal first
            if first: first=False;return m[0]
            return '#'+m[0]
        for i in range(0,len(parts),2):parts[i]=re.sub(r'^# .+$',heading,parts[i],flags=re.M)
        text=''.join(parts)
        def wiki(m):
            image,target=m[1],m[2]; name=target.split('|')[0]; label=target.split('|')[-1] if '|' in target else Path(name).stem
            stem=Path(name).stem
            if image:
                filename=Path(name).name
                assert (images/filename).is_file(),f'Image absente: {filename}'
                return '!['+filename+'](assets/media/'+quote(filename)+')'
            if stem in mappings:return '['+label+']('+mappings[stem]+')'
            # Internal notes, unpublished answers and retired chapter are not public pages.
            return label
        return re.sub(r'(!?)\[\[([^\]\n]+)\]\]',wiki,text)
    banks=json.loads(subprocess.check_output(['node','--input-type=module','-e',
        "import fs from 'node:fs';import vm from 'node:vm';const c={window:{}};vm.runInNewContext(fs.readFileSync('site-content/assets/quiz/quiz-banks.js','utf8'),c);console.log(JSON.stringify(c.window.pcQuizBanks));"],cwd=ROOT))
    chapters=[]
    for slug in SLUGS:
        source=VAULT/'cours'/slug
        write(sources/(slug+'.md'),normalize((source/(slug+'.md')).read_text(encoding='utf-8-sig')))
        raw=(source/(slug+'-interactif.html')).read_text(encoding='utf-8-sig')
        raw=re.sub(r'<a\b[^>]*href="(?:\.\./)?07-maintenance-diagnostic/07-maintenance-diagnostic-interactif\.html"[^>]*>.*?</a>','',raw,flags=re.S)
        # Embedded navigation targets parent Quartz pages; relative paths are resolved offline too.
        for other in SLUGS:
            raw=re.sub(r'href="(?:\.\./'+re.escape(other)+r'/)?'+re.escape(other)+r'-interactif\.html"', 'href="'+BASE+'/pc/'+other+'/html/" target="_top"',raw)
        raw=raw.replace('../assets/',BASE+'/assets/').replace('../../assets/',BASE+'/assets/')
        additions='<link rel="stylesheet" href="'+BASE+'/assets/themes/theme.css"><link rel="stylesheet" href="'+BASE+'/assets/pc-support.css"><script src="'+BASE+'/assets/themes/theme.js"></script><script>if(window.parent!==window)document.documentElement.classList.add("support-embedded");</script>'
        raw=raw.replace('</head>',additions+'</head>')
        write(sources/(slug+'.html'),raw)
        bank=banks[slug];bank['track']='Maintenance PC';write(sources/(slug+'-quiz.json'),json.dumps(bank,ensure_ascii=False,indent=2))
        ch={'slug':slug,'course':slug+'.md','html':slug+'.html','quiz':slug+'-quiz.json'}
        if slug in TPS:
            stem=TPS[slug]
            write(sources/(stem+'.md'),normalize((source/'tp'/(stem+'.md')).read_text(encoding='utf-8-sig')))
            correction=source/'tp'/(stem+'-correction.md')
            if correction.exists():
                write(sources/(stem+'-correction.md'),normalize(correction.read_text(encoding='utf-8-sig')))
                ch['correction']=stem+'-correction.md'
            ch['tp']=stem+'.md'
        chapters.append(ch)
    site={'title':'Configuration et maintenance PC','shortTitle':'Maintenance PC','description':'Comprendre le matériel, configurer un poste et diagnostiquer avec méthode.','baseUrl':BASE,'sourceRoot':'sources','tracks':[{'id':'pc','title':'Configuration et maintenance PC','description':'Six chapitres pour apprendre, pratiquer et vérifier ses acquis.','chapters':chapters}]}
    write(ROOT/'site.json',json.dumps(site,ensure_ascii=False,indent=2)+'\n')
    print('Import PC : 6 cours et HTML, 6 quiz, 5 TP. Coffre non modifie.')

if __name__=='__main__':main()
