import requests # knjižnica za zajem strani
import sqlite3 # Knjižnica za delo z bazo
import re # Knjižnica za delo z regularnimi izrazi

# seznam angleških imen pasem:
imena_pasem = ['affenpinscher', 'afghan-hound', 'airedale-terrier', 'akita', 'alaskan-klee-kai', 'alaskan-malamute',
                'american-bulldog', 'american-english-coonhound', 'american-eskimo-dog', 'american-foxhound',
                'american-pit-bull-terrier', 'american-staffordshire-terrier', 'american-water-spaniel',
                'anatolian-shepherd-dog', 'appenzeller-sennenhunde', 'australian-cattle-dog', 'australian-shepherd',
                'australian-terrier', 'azawakh', 'barbet', 'basenji', 'basset-hound', 'beagle', 'bearded-collie',
                'bedlington-terrier', 'belgian-malinois', 'belgian-sheepdog', 'belgian-tervuren', 'berger-picard',
                'bernedoodle', 'bernese-mountain-dog', 'bichon-frise', 'black-and-tan-coonhound', 'black-mouth-cur',
                'black-russian-terrier', 'bloodhound', 'blue-lacy', 'bluetick-coonhound', 'boerboel', 'bolognese',
                'border-collie', 'border-terrier', 'borzoi', 'boston-terrier', 'bouvier-des-flandres', 'boxer',
                'boykin-spaniel', 'bracco-italiano', 'briard', 'brittany', 'brussels-griffon', 'bull-terrier',
                'bulldog', 'bullmastiff', 'cairn-terrier', 'canaan-dog', 'cane-corso', 'cardigan-welsh-corgi',
                'catahoula-leopard-dog', 'caucasian-shepherd-dog', 'cavalier-king-charles-spaniel', 'cesky-terrier',
                'chesapeake-bay-retriever', 'chihuahua', 'chinese-crested', 'chinese-shar-pei', 'chinook', 'chow-chow',
                'clumber-spaniel', 'cockapoo', 'cocker-spaniel', 'collie', 'coton-de-tulear', 'curly-coated-retriever',
                'dachshund', 'dalmatian', 'dandie-dinmont-terrier', 'doberman-pinscher', 'dogo-argentino',
                'dogue-de-bordeaux', 'dutch-shepherd', 'english-cocker-spaniel', 'english-foxhound', 'english-setter',
                'english-springer-spaniel', 'english-toy-spaniel', 'entlebucher-mountain-dog', 'field-spaniel',
                'finnish-lapphund', 'finnish-spitz', 'flat-coated-retriever', 'fox-terrier', 'french-bulldog',
                'german-pinscher', 'german-shepherd-dog', 'german-shorthaired-pointer', 'german-wirehaired-pointer',
                'giant-schnauzer', 'glen-of-imaal-terrier', 'goldador', 'golden-retriever', 'goldendoodle',
                'gordon-setter', 'great-dane', 'great-pyrenees', 'greater-swiss-mountain-dog', 'greyhound', 'harrier',
                'havanese', 'ibizan-hound', 'icelandic-sheepdog', 'irish-red-and-white-setter', 'irish-setter',
                'irish-terrier', 'irish-water-spaniel', 'irish-wolfhound', 'italian-greyhound', 'jack-russell-terrier',
                'japanese-chin', 'jindo', 'keeshond', 'kerry-blue-terrier', 'komondor', 'kooikerhondje',
                'kuvasz', 'labradoodle', 'labrador-retriever', 'lakeland-terrier', 'lancashire-heeler', 'leonberger',
                'lhasa-apso', 'lowchen', 'maltese', 'maltese-shih-tzu', 'maltipoo', 'manchester-terrier', 'mastiff',
                'miniature-pinscher', 'miniature-schnauzer', 'mutt', 'neapolitan-mastiff', 'newfoundland',
                'norfolk-terrier', 'norwegian-buhund', 'norwegian-elkhound', 'norwegian-lundehund', 'norwich-terrier',
                'nova-scotia-duck-tolling-retriever', 'old-english-sheepdog', 'otterhound', 'papillon', 'peekapoo',
                'pekingese', 'pembroke-welsh-corgi', 'petit-basset-griffon-vendeen', 'pharaoh-hound', 'plott',
                'pocket-beagle', 'pointer', 'polish-lowland-sheepdog', 'pomeranian', 'pomsky', 'poodle',
                'portuguese-water-dog', 'pug', 'puggle', 'puli', 'pyrenean-shepherd', 'rat-terrier',
                'redbone-coonhound', 'rhodesian-ridgeback', 'rottweiler', 'saint-bernard', 'saluki', 'samoyed',
                'schipperke', 'schnoodle', 'scottish-deerhound', 'scottish-terrier', 'sealyham-terrier',
                'shetland-sheepdog', 'shiba-inu', 'shih-tzu', 'siberian-husky', 'silky-terrier', 'skye-terrier',
                'sloughi', 'small-munsterlander-pointer', 'soft-coated-wheaten-terrier', 'stabyhoun',
                'staffordshire-bull-terrier', 'standard-schnauzer', 'sussex-spaniel', 'swedish-vallhund',
                'tibetan-mastiff', 'tibetan-spaniel', 'tibetan-terrier', 'toy-fox-terrier', 'treeing-tennessee-brindle',
                'treeing-walker-coonhound', 'vizsla', 'weimaraner', 'welsh-springer-spaniel', 'welsh-terrier',
                'west-highland-white-terrier', 'whippet', 'wirehaired-pointing-griffon', 'xoloitzuintli', 'yorkipoo',
                'yorkshire-terrier']

# seznam slovenskih imen pasem:
slovenska_imena = ['Opičji pinč', 'Afganistanski hrt', 'Airedalski terier', 'Akita', 'Aljaški Klee Kai',
                    'Aljaški malamut', 'Ameriški buldog', 'Angleški rakunar', 'Ameriški eskimski špic',
                    'Ameriški lisičar', 'Ameriški pit bull terier', 'Ameriški Stafordshire terier',
                    'Ameriški vodni španjel', 'Anatolski ovčar', 'Appenzelski planšarski pes', 'Avstralski govedar',
                    'Avstralski ovčar', 'Avstralski terier', 'Azawakh', 'Francoski vodni pes', 'Basenji', 'Baset',
                    'Beagle', 'Bradati škotski ovčar', 'Bedlingtonski terier', 'Belgijski ovčar Malinois',
                    'Belgijski ovčar Groenendael', 'Belgijski ovčar Tervueren', 'Pikardijski ovčar', 'Bernedoodle',
                    'Bernski planšarski pes', 'Kodrasti bišon', 'Črno čreslasti rakunar', '/', 'Črni ruski terier',
                    'Pes sv. Huberta', 'Blue Lacy', 'Modropikasti rakunar', 'Afriški boerboel - Južnoafriški mastif',
                    'Bolonjec', 'Mejni ovčar - Borderski ovčar', 'Borderski terier', 'Ruski hrt', 'Bostonski terier',
                    'Flandrijski govedar', 'Nemški bokser', 'Boykin španjel', 'Italijanski ptičar', 'Briard',
                    'Bretonski ptičar', 'Bruseljski grifon', 'Bulterier', 'Angleški buldog', 'Bulmastif',
                    'Cairnski terier - Gomilar', 'Kananski pes', 'Cane Corso', 'Valižanski ovčar Cardigan',
                    'Luizianski leopardji pes Catahoula', 'Kavkaški ovčar', 'Cavalier King Charles španjel',
                    'Češki terier', 'Chesapeake bay prinašalec', 'Čivava', 'Kitajski goli pes', 'Šarpej', 'Šinuk',
                    'Chow Chow', 'Clumberski španjel', 'Cockapoo', 'Koker španjel', 'Dolgodlaki škotski ovčar',
                    'Coton de Tulear', 'Kodrasti prinašalec', 'Kratkodlaki kunčji jazbečar', 'Dalmatinec',
                    'Dandie dinmontov terier', 'Doberman', 'Argentinska doga', 'Bordojska doga - Francoski mastif',
                    'Nizozemski ovčar', 'Angleški koker španjel', 'Angleški lisičar', 'Angleški seter',
                    'Angleški špringer španjel', 'Angleški pritlikavi španjel', 'Entlebuški planšarski pes',
                    'Poljski španjel', 'Finski laponski pes', 'Finski špic', 'Gladkodlaki prinašalec',
                    'Resasti foksterier', 'Francoski buldog', 'Nemški pinč', 'Nemški ovčar', 'Nemški kratkodlaki ptičar',
                    'Nemški žimavec', 'Veliki šnavcer', 'Terier Glen of Imaal', 'Goldador', 'Zlati prinašalec',
                    'Zlatokoder', 'Gordon seter', 'Nemška doga', 'Pirinejski pes', 'Veliki švicarski planšarski pes',
                    'Veliki angleški hrt', 'Beagle zajčar', 'Havanski bišon', 'Ibiški pes', 'Islandski špic',
                    'Irski rdeče beli seter', 'Irski seter', 'Irski terier', 'Irski vodni španjel', 'Irski volčji hrt',
                    'Mali italijanski hrt', 'Jack Russel terier', 'Japonski chin', 'Korejski jindo', 'Nemški volčji špic',
                    'Kerryski modri terier', 'Komondor', 'Nizozemski prepeličar', 'Kuvasz', 'Avstralski labradoodl',
                    'Labradorec', 'Lakelandski terier', 'Lancashirski priganjač', 'Leonberžan', 'Lhasa apso',
                    'Mali levji pes', 'Maltežan', '/', 'Maltipoo', 'Manchesterski terier', 'Angleški mastif',
                    'Pritlikavi pinč', 'Pritlikavi šnavcer', 'Mešanec', 'Neapeljski mastif', 'Novofundlandec',
                    'Norfolški terier', 'Norveški ovčar', 'Norveški sivi losovec', 'Norveški lovski špic',
                    'Norwiški terier', 'Novoškotski prinašalec', 'Staroangleški ovčar', 'Vidrar', 'Metuljček', 'Pekapoo',
                    'Pekinčan', 'Valižanski ovčar - Pembroke', 'Mali vendejski ostrodlaki baset', 'Faraonski pes',
                    'Plott', '/', 'Poenter', 'Poljski nižinski ovčar', 'Pomeranec', 'Pomsky', 'Pudelj',
                    'Portugalski vodni pes', 'Mops', 'Puggle', 'Madžarski puli', 'Pirenejski ovčar', 'Podganji terier',
                    'Redbonov rakunar', 'Rodezijski grebenar', 'Rottweiler', 'Bernardinec', 'Perzijski hrt', 'Samojed',
                    'Schupperke', 'Schnoodle', 'Škotski jelenar', 'Škotski terier', 'Sealyhamski terier',
                    'Šetlandski ovčar', 'Shiba Inu', 'Shih tzu - Šicu', 'Sibirski haski', 'Avstralski svilnati terier',
                    'Skye Terier', 'Sloughi - Arabski hrt', 'Mali munsterlandec', 'Mehkodlaki pšenični terier',
                    'Frizijski ptičar - Stabijhoun', 'Staffordshirski bulterier', 'Srednji šnavcer', 'Suseški španjel',
                    'Švedski špic', 'Tibetanski mastif', 'Tibetanski španjel', 'Tibetanski terier', 'Ameriški toy terier',
                    '/', 'Treeing Walker Coonhound', 'Kratkodlaki madžarski ptičar – vižla',
                    'Weimarski ptičar – Weimaranec', 'Valižanski špringer španjel', 'Valižanski Terier',
                    'Višavski terier', 'Mali angleški hrt', 'Francoski ostrodlaki ptičar – grifon', 'Mehiški goli pes',
                    'Yorkipoo', 'Yorkshirski terier']

BAZA = "projekt.db"
baza = sqlite3.connect(BAZA)

# Naredimo tabelo pasma, če je še ni
baza.execute('''CREATE TABLE IF NOT EXISTS pasma (
  id_pasme INTEGER PRIMARY KEY,
  slovensko_ime TEXT NOT NULL,
  anglesko_ime TEXT NOT NULL,
  primernost_za_stanovanja INTEGER NOT NULL,
  primernost_za_zacetnike INTEGER NOT NULL,
  obcutljivost INTEGER NOT NULL,
  prenese_samoto INTEGER NOT NULL,
  primernost_za_hladno_podnebje INTEGER NOT NULL,
  primernost_za_toplo_podnebje INTEGER NOT NULL,
  primernost_za_druzine INTEGER NOT NULL,
  prijaznost_do_otrok INTEGER NOT NULL,
  prijaznost_do_drugih_psov INTEGER NOT NULL,
  prijaznost_do_tujcev INTEGER NOT NULL,
  izpadanje_dlake INTEGER NOT NULL,
  slinjenje INTEGER NOT NULL,
  nezahtevnost_dlake INTEGER NOT NULL,
  splosno_zdravje INTEGER NOT NULL,
  potencial_za_debelost INTEGER NOT NULL,
  velikost INTEGER NOT NULL,
  ucljivost INTEGER NOT NULL,
  inteligenca INTEGER NOT NULL,
  grizenje INTEGER NOT NULL,
  lovski_pes INTEGER NOT NULL,
  lajanje INTEGER NOT NULL,
  potepanje INTEGER NOT NULL,
  potreba_po_gibanju INTEGER NOT NULL,
  energicnost INTEGER NOT NULL,
  intenzivnost INTEGER NOT NULL,
  igrivost INTEGER NOT NULL,
  druzina TEXT NOT NULL,
  min_visina TEXT,
  max_visina TEXT,
  min_teza TEXT,
  max_teza TEXT,
  min_zivljenska_doba TEXT,
  max_zivljenska_doba TEXT,
  angleski_opis TEXT,
  slike TEXT
)''')

def zapisi_vsebino(pasma):
    '''zajame stran za ime neke pasme'''
    zajem = requests.get('http://dogtime.com/dog-breeds/' + pasma + '#/slide/1', auth=('user', 'pass'))
    vsebina = zajem.text
    return(vsebina)

def shrani_vsebino(pasma, vsebina):
    '''zapiše vsebino v pasma.txt'''
    a = open('{}.txt'.format(pasma), 'w', encoding='utf-8')
    a.write(vsebina)
    a.close()

def ustvari_txt():
    '''uporabi funkciji zapisi_vsebino in shrani vsebino, da pobere vse spletne stvrani, ki jih potrebujemo
    in jih srani v .txt datoteke'''
    for i in imena_pasem:
        vsebina = zapisi_vsebino(i)
        shrani_vsebino(i, vsebina)

def beri(ime_datoteke):
    '''prebere vsebino datoteke ime_datoteke.txt'''
    a = open(ime_datoteke, 'r', encoding='utf-8')
    b = a.read()
    a.close()
    return b

def xoloitzuintli_txt():
    '''ustvari xoloitzuintli.txt z vsebino za pasmo xoloitzuintli (ker ima ta pasma drugačen link)'''
    zajem = requests.get('http://dogtime.com/dog-breeds/xoloitzuintli', auth=('user', 'pass'))
    vsebina = zajem.text
    a = open('xoloitzuintli.txt', 'w', encoding='utf-8')
    a.write(vsebina)
    a.close()

# regex stavki, za iskanje v zajemu spletnih strani:
vzorec =[
    r"Adapts Well to Apartment Living<\/span>.*?class=.star star-\d.>(?P<primernost_za_stanovanja>\d*?)<\/span>",
    r"Good For Novice Owners<\/span>.*?class=.star star-\d.>(?P<primernost_za_zacetnike>\d*?)<\/span>",
    r">Sensitivity Level<\/span>.*?class=.star star-\d.>(?P<obcutljivost>\d*?)<",
    r">Tolerates Being Alone<\/span>.*?class=.star star-\d.>(?P<prenese_samoto>\d*?)<",
    r">Tolerates Cold Weather<\/span>.*?class=.star star-\d.>(?P<primernost_za_hladno_podnebje>\d*?)<",
    r">Tolerates Hot Weather<\/span>.*?class=.star star-\d.>(?P<primernost_za_toplo_podnebje>\d*?)<",
    r">Affectionate with Family<\/span>.*?<span class=.star star-\d.>(?P<primernost_za_druzine>\d*?)<",
    r">Incredibly Kid Friendly Dogs<\/span>.*?class=.star star-\d.>(?P<prijaznost_do_otrok>\d*?)<",
    r">Dog Friendly<\/span>.*?class=.star star-\d.>(?P<prijaznost_do_drugih_psov>\d*?)<",
    r">Friendly Toward Strangers<\/span>.*?class=.star star-\d.>(?P<prijaznost_do_tujcev>\d*?)<",
    r">Amount Of Shedding<\/span>.*?class=.star star-\d.>(?P<izpadanje_dlake>\d*?)<",
    r">Drooling Potential<\/span>.*?class=.star star-\d.>(?P<slinjenje>\d*?)<",
    r">Easy To Groom<\/span>.*?class=.star star-\d.>(?P<nezahtevnost_dlake>\d*?)<",
    r">General Health<\/span>.*?class=.star star-\d.>(?P<splosno_zdravje>\d*?)<",
    r">Potential For Weight Gain<\/span>.*?class=.star star-\d.>(?P<potencial_za_debelost>\d*?)<",
    r">Size<\/span>.*?class=.star star-\d.>(?P<velikost>\d*?)<",
    r">Easy To Train<\/span>.*?class=.star star-\d.>(?P<ucljivost>\d*?)<",
    r">Intelligence<\/span>.*?class=.star star-\d.>(?P<inteligenca>\d*?)<",
    r">Potential For Mouthiness<\/span>.*?class=.star star-\d.>(?P<grizenje>\d*?)<",
    r">Prey Drive<\/span>.*?class=.star star-\d.>(?P<lovski_pes>\d*?)<",
    r">Tendency To Bark Or Howl<\/span>.*?class=.star star-\d.>(?P<lajanje>\d*?)<",
    r">Wanderlust Potential<\/span>.*?class=.star star-\d.>(?P<potepanje>\d*?)<",
    r"> Exercise Needs<\/span>.*?class=.star star-\d.>(?P<potreba_po_gibanju>\d*?)<",
    r">Energy Level<\/span>.*?class=.star star-\d.>(?P<energicnost>\d*?)<",
    r">Intensity<\/span>.*?class=.star star-\d.>(?P<intenzivnost>\d*?)<",
    r">Potential For Playfulness<\/span>.*?class=.star star-\d.>(?P<igrivost>\d*?)<",
    r">Dog Breed Group:<\/span>(?P<druzina>.*?)<br>",
    r">Height:<\/span>(?P<min_visina>.*?)to.*<br><span class",
    r">Height:<\/span> .*?to(?P<max_visina>.*?)<br>",
    r">Weight:<\/span>(?P<min_teza>.*?)to",
    r">Weight:<\/span>.*?to(?P<max_teza>.*?)pounds<br><span class",
    r">Life Span:<\/span>(?P<min_zivljenska_doba>.*?)to.*years<\/div>",
    r">Life Span:<\/span>.*?to(?P<max_zivljenska_doba>.*?)years<\/div>",
    r"<img src=(?P<slike>.*?)>.*"
]

# seznam lastnosti, ki jih iščemo:
lastnosti = ['id_pasme', 'slovensko_ime', 'anglesko_ime', 'primernost_za_stanovanja', 'primernost_za_zacetnike',
             'obcutljivost', 'prenese_samoto','primernost_za_hladno_podnebje', 'primernost_za_toplo_podnebje',
             'primernost_za_druzine', 'prijaznost_do_otrok', 'prijaznost_do_drugih_psov', 'prijaznost_do_tujcev',
             'izpadanje_dlake', 'slinjenje', 'nezahtevnost_dlake', 'splosno_zdravje', 'potencial_za_debelost', 'velikost',
             'ucljivost', 'inteligenca', 'grizenje', 'lovski_pes', 'lajanje', 'potepanje', 'potreba_po_gibanju',
             'energicnost', 'intenzivnost', 'igrivost', 'druzina', 'min_visina', 'max_visina', 'min_teza', 'max_teza',
             'min_zivljenska_doba', 'max_zivljenska_doba', 'angleski_opis', 'slike']

# TODO: v pocisti uporabi lastnosti[i], da se ne ponavljaš
def pocisti (podatki):
    '''popravi tipe v slovarju'''
    podatki['primernost_za_stanovanja'] = int(podatki['primernost_za_stanovanja'])
    podatki['primernost_za_zacetnike'] = int(podatki['primernost_za_zacetnike'])
    podatki['obcutljivost'] = int(podatki['obcutljivost'])
    podatki['prenese_samoto'] = int(podatki['prenese_samoto'])
    podatki['primernost_za_hladno_podnebje'] = int(podatki['primernost_za_hladno_podnebje'])
    podatki['primernost_za_toplo_podnebje'] = int(podatki['primernost_za_toplo_podnebje'])
    podatki['primernost_za_druzine'] = int(podatki['primernost_za_druzine'])
    podatki['prijaznost_do_otrok'] = int(podatki['prijaznost_do_otrok'])
    podatki['prijaznost_do_drugih_psov'] = int(podatki['prijaznost_do_drugih_psov'])
    podatki['prijaznost_do_tujcev'] = int(podatki['prijaznost_do_tujcev'])
    podatki['izpadanje_dlake'] = int(podatki['izpadanje_dlake'])
    podatki['slinjenje'] = int(podatki['slinjenje'])
    podatki['nezahtevnost_dlake'] = int(podatki['nezahtevnost_dlake'])
    podatki['splosno_zdravje'] = int(podatki['splosno_zdravje'])
    podatki['potencial_za_debelost'] = int(podatki['potencial_za_debelost'])
    podatki['velikost'] = int(podatki['velikost'])
    podatki['ucljivost'] = int(podatki['ucljivost'])
    podatki['inteligenca'] = int(podatki['inteligenca'])
    podatki['grizenje'] = int(podatki['grizenje'])
    podatki['lovski_pes'] = int(podatki['lovski_pes'])
    podatki['lajanje'] = int(podatki['lajanje'])
    podatki['potepanje'] = int(podatki['potepanje'])
    podatki['potreba_po_gibanju'] = int(podatki['potreba_po_gibanju'])
    podatki['energicnost'] = int(podatki['energicnost'])
    podatki['intenzivnost'] = int(podatki['intenzivnost'])
    podatki['igrivost'] = int(podatki['igrivost'])
    podatki['min_visina'] = (podatki['min_visina'])
    podatki['max_visina'] = (podatki['max_visina'])
    podatki['min_teza'] = (podatki['min_teza'])
    podatki['max_teza'] = (podatki['max_teza'])
    podatki['min_zivljenska_doba'] = (podatki['min_zivljenska_doba'])
    podatki['max_zivljenska_doba'] = (podatki['max_zivljenska_doba'])
    return podatki

def shrani_pasmo(n):
    '''na vsebini datoteke 'imena_pasem[n].txt' uporabi vzorce, da poišče iskane vrednosti, ki jih nato
    uredi (po tipih) in zapiše v bazo'''
    pasma = imena_pasem[n]
    stran = beri('{}.txt'.format(pasma))
    slovar = {}
    slovar['id_pasme'] = n
    slovar['slovensko_ime'] = slovenska_imena[n]
    slovar['anglesko_ime'] = pasma
    stevec_lastnosti = 3 # bomo potrebovali, ko neke lastnosti ne more najti in moramo poiskati ime te lastnosti
    index_slabih = []
    for i in vzorec:
        regex = re.compile(i)
        match = regex.search(stran)
        if match is not None:
            group = match.groupdict()
        else:
            group = {lastnosti[stevec_lastnosti]:None}
            index_slabih.append(stevec_lastnosti)
        slovar.update(group)
        stevec_lastnosti += 1
    index_slabih = list(reversed(index_slabih))
    slovar.update({'angleski_opis': 'http://dogtime.com/dog-breeds/' + pasma + '#/slide/1'})
    cist_slovar = pocisti(slovar)
    seznam_vrednosti = []
    nase_lastnosti = lastnosti # da si ne povozimo pravega seznama lastnosti
    for key in cist_slovar:
        seznam_vrednosti.append(cist_slovar[key])
    for i in index_slabih:
        del nase_lastnosti[i]
        del seznam_vrednosti[i]
    seznam = tuple(seznam_vrednosti)
    prave_lastnosti = tuple(nase_lastnosti)
    print(seznam, len(seznam))
    print(prave_lastnosti, len(prave_lastnosti))
    baza.execute('''INSERT INTO pasma {0} VALUES {1}'''.format(prave_lastnosti, seznam))
    return(seznam_vrednosti)

# PROBLEMI:
    # rešitve

# PROBLEMI PRI SHRANI PASMO:
# ne dela sš 119 - korean-jindo-dog:
    # 1. link ne vsebuje imena, zato sem popravila ime v seznamu pasem, da najdemo pravi link
    # 2. ta pes nima podatka o Tendency To Bark Or Howl, ki je pri nas na not null
    # zaenkrat ne vem kaj bi z njim in ga zato pustim pri miru :)
# št. 147 - nova-scotia-duck-trolling-retriever
    # na internetu je tolling, ne trolling, zato popravim seznam imen
# št 207 xoloitzcuintli
    # ne dela, ker url nima končnice #/slide/1. To csv datoteko zajamemo posebej.

# NAPAKE V .db:
# napake pri zajemu teže: 8,
# ponekod je teže up to something, in takrat je min teza == up : 98, 132, 146, 153, 178, 179, 203
# ce je teza podana s from _ to_, je pri min tezi podatek from _ (not Int) : 29
# max visina je povsod narobe (koncnica tall at the shoulder, ampak ne povsod)
# narobe zajame podatke o teži: 69, 79, 180
# narobe zajame višino: 133, 162, 195

# ustvari_txt()

# for i in range(len(imena_pasem)):
#     shrani_pasmo(i)

# commitamo naše delo z bazo:
baza.commit()
baza.close()
