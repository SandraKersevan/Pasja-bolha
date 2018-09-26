#!/usr/bin/env python3
import psycopg2
import sys
import re
import datetime

from bottle import *
import auth_public as auth


# Zakomentiraj, če ne želiš sporočil o napakah
debug(True)

#################################################################
# Prikljapljamo bazo:
# !/usr/bin/python

import psycopg2, psycopg2.extensions, psycopg2.extras
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE) # se znebimo problemov s sumniki
conn = psycopg2.connect(database=auth.db, host=auth.host, user=auth.user, password=auth.password)
conn.set_isolation_level(psycopg2.extensions.ISOLATION_LEVEL_AUTOCOMMIT) # onemogocimo transakcije
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

print ("Connected!\n")

secret = "to skrivnost je zelo tezko uganiti 1094107c907cw982982c42"

######################################################################

# Pomozne funkcije:

def stevilka(besedilo):
    '''Spremeni besedilo s številko v številko.
    Uporabimo, da izbran radio button spremenimo v njegovo vrednost.
    Če ni bil izbran noben, izpiše 0.'''
    stevilka = 3

    if besedilo == None:
        return stevilka
    
    for znak in besedilo:
        if znak in "12345":
            stevilka = int(znak)
            return stevilka

def boolean(besedilo):
    '''Spremeni besedilo 'da' v True in 'ne' v False.'''

    if besedilo == 'da':
        return True
    
    elif besedilo == 'ne':
        return False
    
######################################################################
# Funkcije za izgradnjo strani

# Statične datoteke damo v mapo 'static' in do njih pridemo na naslovu '/static/...'
# Uporabno za slike in CSS
@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static')


# Glavna stran
@route('/')
def zacetna_stran():
    # izbrišemo uporabnika in izbiro idealnega psa
    response.delete_cookie('username')
    response.delete_cookie('izbrano')
    return template('zacetna_stran')

# Strani za napake
@route('/napaka_email/')
def napaka_email():
    return template('napaka_email')

@route('/napaka_ime/')
def napaka_uprabnisko_ime():
    return template('napaka_uporabnisko_ime')

@route('/napaka/')
def napaka():
    return template('napaka')

# Stran za iskanje idealne pasme
@route('/izbira_psa/', method='GET')
def izbira_psa_get():
    return template('izbira_psa')

@route('/izbira_psa/', method='POST')
def izbira_psa_post():
    notranjost = request.forms.notranjost
    izkusnje = request.forms.izkusnje
    obcutljivost = request.forms.obcutljivost
    samota = request.forms.samota
    hladno = request.forms.hladno
    toplo = request.forms.toplo
    druzina = request.forms.druzina
    otroci = request.forms.otroci
    drugi_psi = request.forms.drugi_psi
    tujci = request.forms.tujci
    dlaka = request.forms.dlaka
    slinjenje = request.forms.slinjenje
    dlaka_skrb = request.forms.dlaka_skrb
    zdravje = request.forms.zdravje
    debelost = request.forms.debelost
    velikost = request.forms.velikost
    ucljivost = request.forms.ucljivost
    inteligenca = request.forms.inteligenca
    grizenje = request.forms.grizenje
    lovski_nagon = request.forms.lovski_nagon
    lajanje = request.forms.lajanje
    potepanje = request.forms.potepanje
    energicnost = request.forms.energicnost
    utrujenost = request.forms.utrujenost
    gibanje = request.forms.gibanje
    igrivost =  request.forms.igrivost
    izbrano = [stevilka(notranjost), stevilka(izkusnje), stevilka(obcutljivost),
               stevilka(samota), stevilka(hladno), stevilka(toplo), stevilka(druzina),
               stevilka(otroci), stevilka(drugi_psi), stevilka(tujci), stevilka(dlaka),
               stevilka(slinjenje), 6-stevilka(dlaka_skrb), stevilka(zdravje),
               stevilka(debelost), stevilka(velikost), stevilka(ucljivost),
               stevilka(inteligenca), stevilka(grizenje), stevilka(lovski_nagon),
               stevilka(lajanje), stevilka(potepanje), stevilka(energicnost),
               stevilka(utrujenost), stevilka(gibanje), stevilka(igrivost)]

    while True:
        response.set_cookie('izbrano', izbrano, path='/', secret=secret)
        response.status = 303
        response.set_header('Location', '/idealni_psi/')
        break

# Stran z rezultati
@route('/idealni_psi/', method='GET')
def idealni_psi_get():
    izbrano = request.get_cookie('izbrano', secret=secret)

    # preverimo izbiro
    if izbrano==None:
        return redirect('/izbira_psa/')

    primerni = []
    
    lastnosti = ['primernost_za_stanovanja', 'primernost_za_zacetnike',
                 'obcutljivost', 'prenese_samoto','primernost_za_hladno_podnebje',
                 'primernost_za_toplo_podnebje','primernost_za_druzine',
                 'prijaznost_do_otrok', 'prijaznost_do_drugih_psov',
                 'prijaznost_do_tujcev','izpadanje_dlake', 'slinjenje',
                 'nezahtevnost_dlake', 'splosno_zdravje', 'potencial_za_debelost',
                 'velikost', 'ucljivost', 'inteligenca', 'grizenje', 'lovski_pes',
                 'lajanje', 'potepanje', 'potreba_po_gibanju', 'energicnost',
                 'intenzivnost', 'igrivost']
    
    cur.execute('''SELECT id_pasme, primernost_za_stanovanja, primernost_za_zacetnike,
                 obcutljivost, prenese_samoto, primernost_za_hladno_podnebje,
                 primernost_za_toplo_podnebje, primernost_za_druzine, prijaznost_do_otrok,
                 prijaznost_do_drugih_psov, prijaznost_do_tujcev, izpadanje_dlake, slinjenje,
                 nezahtevnost_dlake, splosno_zdravje, potencial_za_debelost, velikost,
                 ucljivost, inteligenca, grizenje, lovski_pes, lajanje, potepanje, potreba_po_gibanju,
                 energicnost, intenzivnost, igrivost FROM pasma''')
    rows = cur.fetchall()
    for row in rows:
        row = [int(x) for x in row]
        razlika_pasme = sum([abs(x - y) for (x, y) in zip(row[1:],izbrano)])
        primerni.append((row[0], razlika_pasme))
    primerni.sort(key=lambda x: x[1])
    primerni = primerni[0:10] #prikaze prvih 10

    psi = []
    for pes in primerni:
        (id_psa, razlika) = pes
        cur.execute('''SELECT slovensko_ime, anglesko_ime, slike FROM pasma
                    WHERE id_pasme={0}'''.format(id_psa))
        ime, ang_ime, slika = cur.fetchone()
        psi.append((ime, ang_ime, slika))
    return template('idealni_psi',
                    izbrano=izbrano,
                    psi=psi)

@route('/idealni_psi/', method='POST')
def idealni_psi_post():
    response.delete_cookie('izbrano')
    return redirect("/izbira_psa/")


@route('/vse_pasme/', method='GET')
def vse_pasme_get():
    cur.execute('''SELECT slovensko_ime, anglesko_ime, primernost_za_stanovanja, primernost_za_zacetnike,
                     obcutljivost, prenese_samoto, primernost_za_hladno_podnebje,
                     primernost_za_toplo_podnebje, primernost_za_druzine, prijaznost_do_otrok,
                     prijaznost_do_drugih_psov, prijaznost_do_tujcev, izpadanje_dlake, slinjenje,
                     nezahtevnost_dlake, splosno_zdravje, potencial_za_debelost, velikost,
                     ucljivost, inteligenca, grizenje, lovski_pes, lajanje, potepanje, potreba_po_gibanju,
                     energicnost, intenzivnost, igrivost, druzina, min_visina, max_visina, min_teza,
                     max_teza, min_zivljenska_doba, max_zivljenska_doba FROM pasma''')
    vse_pasme = cur.fetchall()                    
    return template('vse_pasme',
                    vse_pasme = vse_pasme)

@route('/pasma/', method='GET')
def vse_pasme_get():
    cur.execute('''SELECT slovensko_ime, anglesko_ime, primernost_za_stanovanja, primernost_za_zacetnike,
                     obcutljivost, prenese_samoto, primernost_za_hladno_podnebje,
                     primernost_za_toplo_podnebje, primernost_za_druzine, prijaznost_do_otrok,
                     prijaznost_do_drugih_psov, prijaznost_do_tujcev, izpadanje_dlake, slinjenje,
                     nezahtevnost_dlake, splosno_zdravje, potencial_za_debelost, velikost,
                     ucljivost, inteligenca, grizenje, lovski_pes, lajanje, potepanje, potreba_po_gibanju,
                     energicnost, intenzivnost, igrivost, druzina, min_visina, max_visina, min_teza,
                     max_teza, min_zivljenska_doba, max_zivljenska_doba, slike FROM pasma WHERE id_pasme = 1''')
    [pasma] = cur.fetchall()
    [slo_ime, ang_ime, stanovanje, zacetnik, obcutljivost, samota, hladno, toplo, druzine, otroci, psi, tujci, izp_dlake, slina,
    nez_dlake, zdravje, debelost, velikost, ucljivost, inteligenca, grizenje, lovec, lajanje, potepanje, gibanje, energicnost,
    intenzivnost, igrivost, druzina, min_visina, max_visina, min_teza, max_teza, min_leta,max_leta,slika] = pasma
    
    min_visina, max_visina = int(min_visina), int(max_visina)
    min_teza, max_teza = int(min_teza), int(max_teza)
    min_leta, max_leta = int(min_leta), int(max_leta)

    print(min_visina, max_visina, min_teza, max_teza, min_leta,max_leta)
    return template('pasma',
                    slo_ime=slo_ime,
                    ang_ime=ang_ime,
                    stanovanje=stanovanje,
                    zacetnik=zacetnik,
                    obcutljivost=obcutljivost,
                    samota=samota,
                    hladno=hladno,
                    toplo=toplo,
                    druzine=druzine,
                    otroci=otroci,
                    psi=psi,
                    tujci=tujci,
                    izp_dlake=izp_dlake,
                    slina=slina,
                    nez_dlake=nez_dlake,
                    zdravje=zdravje,
                    debelost=debelost,
                    velikost=velikost,
                    ucljivost=ucljivost,
                    inteligenca=inteligenca,
                    grizenje=grizenje,
                    lovec=lovec,
                    lajanje=lajanje,
                    potepanje=potepanje,
                    gibanje=gibanje,
                    energicnost=energicnost,
                    intenzivnost=intenzivnost,
                    igrivost=igrivost,
                    druzina=druzina,
                    min_visina=min_visina,
                    max_visina=max_visina,
                    min_teza=min_teza,
                    max_teza=max_teza,
                    min_leta=min_leta,
                    max_leta=max_leta,
                    slika=slika)

# Stran za prijavo in registracijo
@route('/prijava/', method='GET')
def prijava_get():     
    return template('prijava.tpl',
                    username=None)

@route('/prijava/', method='POST')
def prijava_post():
    username = request.forms.username
    password = request.forms.password

    cur.execute("SELECT uporabnisko_ime, geslo FROM uporabniki WHERE uporabnisko_ime='" + username + "' AND geslo='" + password + "'")
    if cur.fetchone():
        print("Uspesna prijava")
        response.set_cookie('username', username, path='/')
        response.status = 303
        response.set_header('Location', '/oglasi/starost_oglasa_nar/5/1')
    
    else:
        print("Uporabnika ni v bazi")
        return redirect("/napaka/")


@route('/registracija/', method='GET')
def registracija_get():
    cur.execute('''SELECT posta FROM posta ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapiše v rows v obliki (postna_st, posta, regija)
    postne_st = []
    poste = []
    regije = []
    stevilka_posta = []
    for row in rows:
        (postna_st, posta, regija) = tuple(row[0].split(','))
        posta = re.sub('"', '', posta)
        postna_st = int(postna_st[1:])
        regija = int(regija[:-1])
        postne_st.append(postna_st)
        poste.append(posta)
        regije.append(regija)
        stevilka_posta.append(str(postna_st) + " " + str(posta.strip()))
    stevilka_posta.sort()

    return template('registracija.tpl',
                    postne_st=postne_st,
                    regije=regije,
                    poste=poste,
                    stevilka_posta=stevilka_posta)

@route('/registracija/', method='POST')
def registracija_post():
    """Registriraj novega uporabnika."""
    ime = request.forms.ime
    priimek = request.forms.priimek
    naslov = request.forms.naslov
    postna_stevilka = int(request.forms.posta)
    email = request.forms.email
    telefon = request.forms.stevilka
    uporabnik = request.forms.uporabnik
    geslo = request.forms.geslo1
    geslo2 = request.forms.geslo2

    if uporabnik != None:
        # Ali je email že v bazi?
        cur.execute("SELECT email FROM uporabniki WHERE email='" + email + "'")
        if cur.fetchone():
            # Email že v bazi
            print('Email že uporabljen')
            return redirect("/napaka_email/")

        else:
            # Ali uporabnik že obstaja?
            cur.execute("SELECT uporabnisko_ime FROM uporabniki WHERE uporabnisko_ime='" + uporabnik + "'")
            if cur.fetchone():
                # Uporabnik že obstaja
                print('Uporabnik že obstaja')
                return redirect("/napaka_ime/")
            else:
                # Vse je v redu, vstavi novega uporabnika v bazo
                cur.execute("SELECT COUNT(*) FROM uporabniki")
                [[stevilo_uporabnikov]] = cur.fetchall()
                st_uporabnika = int(stevilo_uporabnikov)+1
                nov_uporabnik = (st_uporabnika, '{0}'.format(ime), '{0}'.format(priimek),
                                 '{0}'.format(naslov), '{0}'.format(postna_stevilka),
                                 '{0}'.format(email), '{0}'.format(telefon), '{0}'.format(uporabnik), '{0}'.format(geslo))
                cur.execute("INSERT INTO uporabniki VALUES {0}".format(nov_uporabnik))
                response.set_cookie('username', uporabnik, path='/')
                response.status = 303
                response.set_header('Location', '/oglasi/starost_oglasa_nar/5/1')
                print("Uspesna registracija")

# Stran z oglasi
@route('/oglasi/<razvrstitev>/<st_oglasov>/<stran>', method='GET')
def oglasi_get(razvrstitev, st_oglasov, stran):
    username = request.get_cookie('username')
    # preverimo, če je kdo prijavljen
    if username==None:
        return redirect('/prijava/')

    oglasi = []
    cur.execute('''SELECT id_oglasa, id_uporabnika, cas_oddaje, id_pasme, skotitev, cena,
                st_samick, st_samckov FROM oglas''')
    rows = cur.fetchall()
    for row in rows:
        id_oglasa, id_uporabnika, cas_oddaje, id_pasme, skotitev, cena, st_samick, st_samckov = row
        
        cur.execute("SELECT slovensko_ime, slike FROM pasma WHERE id_pasme={0}".format(id_pasme))
        pasma, slika = cur.fetchone()

        cena_str = ''
        if cena > 0:
            cena_str = str(cena) + ' €'
        elif cena == -10:
            cena_str = 'Po dogovoru'
        else:
            cena_str = 'Podarim'

        #regija
        cur.execute('''SELECT regija.regija FROM uporabniki
                    INNER JOIN posta ON uporabniki.posta=posta.postna_st
                    INNER JOIN regija ON posta.regija=regija.id
                    WHERE uporabniki.id_uporabnika={0}'''.format(id_uporabnika))
        [regija] = cur.fetchone()

        oglasi.append((cas_oddaje,id_oglasa,slika,pasma,cena,cena_str,regija,st_samick,st_samckov, skotitev))        

    # razvrscanje: abeceda
    oglasi_sez_abeceda = []
    for tupl in oglasi:
        podatki = list(tupl)
        podatki[0], podatki[3] = podatki[3], podatki[0]
        oglasi_sez_abeceda.append(podatki)
    oglasi_sez_abeceda = sorted(oglasi_sez_abeceda)
        
    oglasi_abeceda_az = []
    for sez in oglasi_sez_abeceda:
        sez[0], sez[3] = sez[3], sez[0]
        podatki = tuple(sez)
        oglasi_abeceda_az.append(podatki)

    # razvrscanje: cena
    oglasi_sez_cena = []
    for tupl in oglasi:
        podatki = list(tupl)
        podatki[0], podatki[4] = podatki[4], podatki[0]
        oglasi_sez_cena.append(podatki)
    oglasi_sez_cena = sorted(oglasi_sez_cena)
        
    oglasi_cena_nar = []
    for sez in oglasi_sez_cena:
        sez[0], sez[4] = sez[4], sez[0]
        podatki = tuple(sez)
        oglasi_cena_nar.append(podatki)
        
    # razvrscanje: starost psa
    oglasi_sez_pes = []
    for tupl in oglasi:
        podatki = list(tupl)
        podatki[0], podatki[9] = podatki[9], podatki[0]
        oglasi_sez_pes.append(podatki)
    oglasi_sez_pes = sorted(oglasi_sez_pes)
        
    oglasi_pes_nar = []
    for sez in oglasi_sez_pes:
        sez[0], sez[9] = sez[9], sez[0]
        podatki = tuple(sez)
        oglasi_pes_nar.append(podatki)
        
    # uredimo oglase
    if razvrstitev == 'starost_oglasa_nar':
        oglasi = oglasi[::-1]
    elif razvrstitev == 'starost_oglasa_pad':
        oglasi = oglasi
    elif razvrstitev == 'starost_psa_nar':
        oglasi = oglasi_pes_nar
    elif razvrstitev == 'starost_psa_pad':
        oglasi = oglasi_pes_nar[::-1]
    elif razvrstitev == 'abeceda_az':
        oglasi = oglasi_abeceda_az
    elif razvrstitev == 'abeceda_za':
        oglasi = oglasi_abeceda_az[::-1]
    elif razvrstitev == 'cena_nar':
        oglasi = oglasi_cena_nar
    elif razvrstitev == 'cena_pad':
        oglasi = oglasi_cena_nar[::-1]


    # stevilo strani
    if st_oglasov == "5":
        st = 5
    elif st_oglasov == "10":
        st = 10
    else:
        st = len(oglasi)

    if len(oglasi)%st == 0:
        st_strani = len(oglasi)//st
    else:
        st_strani = len(oglasi)//st + 1

    stran = int(stran)
    oglasi = oglasi[(stran-1)*st:stran*st]
    
         
    return template('oglasi',
                    username=username,
                    oglasi=oglasi,
                    st_strani=st_strani,
                    razvrstitev=razvrstitev,
                    st_oglasov=st_oglasov,
                    stran=stran)

# Stran z oglasom, njegovimi podrobnostmi in komentarji
@route('/oglas/<id_oglasa>', method='GET')
def oglas_get(id_oglasa):
    # preverimo, če je kdo prijavljen
    username = request.get_cookie('username')
    if username==None:
        return redirect('/prijava/')
    
    cur.execute('''SELECT id_uporabnika, cas_oddaje, id_pasme, opis,
                skotitev, cena, st_samick, st_samckov, rodovnik, veterinarska_oskrba,
                cepljenje, kastracija_sterilizacija, telefon, email FROM oglas
                WHERE id_oglasa={0}'''.format(id_oglasa))
    [id_uporabnika, cas_oddaje, id_pasme, opis, skotitev, cena, st_samick,
     st_samckov, rodovnik, veterinarska_oskrba, cepljenje, kastracija_sterilizacija,
     telefon, email] = cur.fetchone()

    [leto,mesec,dan] = str(skotitev).split('-')
    skotitev = dan + '.' + mesec + '.' + leto

    cur.execute('''SELECT slovensko_ime, anglesko_ime, slike FROM pasma
                WHERE id_pasme={0}'''.format(id_pasme))
    pasma, anglesko_ime, slika = cur.fetchone()

    if cena > 0:
        cena = str(cena) + ' €'
    elif cena == 0:
        cena = 'Podarim'
    else:
        cena = 'Po dogovoru'

    #regija
    cur.execute('''SELECT regija.regija_sklanjano FROM uporabniki
                    INNER JOIN posta ON uporabniki.posta=posta.postna_st
                    INNER JOIN regija ON posta.regija=regija.id
                    WHERE uporabniki.id_uporabnika={0}'''.format(id_uporabnika))
    [regija] = cur.fetchone()

    #uporabnik
    cur.execute('''SELECT email, stevilka FROM uporabniki
                WHERE id_uporabnika={0}'''.format(id_uporabnika))
    email_up, stevilka_up = cur.fetchone()
    if email:
        email = email_up
    if telefon:
        telefon = stevilka_up

    if rodovnik:
        rodovnik = 'ima rodovnik'
    else:
        rodovnik = 'nima rodovnika'

    if veterinarska_oskrba:
        veterinarska_oskrba = 'je'
    else:
        veterinarska_oskrba = 'ni'

    if cepljenje:
        cepljenje = 'je'
    else:
        cepljenje = 'ni'

    if kastracija_sterilizacija:
        kastracija_sterilizacija = 'je'
    else:
        kastracija_sterilizacija = 'ni'

    # komentariji
    cur.execute('''SELECT uporabniki.uporabnisko_ime, komentar.vsebina,
                komentar.cas_oddaje FROM komentar INNER JOIN uporabniki
                ON uporabniki.id_uporabnika=komentar.id_uporabnika
                WHERE komentar.id_oglasa={0}'''.format(id_oglasa))
    komentarji = cur.fetchall()
    komantarji = komentarji.sort(key=lambda x: x[2])
    popravljeni_komentarji = []
    for [uporabnisko_ime, vsebina, cas_oddaje] in komentarji:
        [datum, ura] = str(cas_oddaje).split()
        ura = ura[:-3]
        [leto,mesec,dan] = datum.split('-')
        datum = dan + '.' + mesec + '.' + leto
        cas_oddaje2 = datum + ' ob ' + ura
        popravljeni_komentarji.append([uporabnisko_ime, vsebina, cas_oddaje2])
        
    return template('oglas',
                    pasma=pasma,
                    anglesko_ime=anglesko_ime,
                    slika=slika,
                    st_samick=st_samick,
                    st_samckov=st_samckov,
                    skotitev=skotitev,
                    cena=cena,
                    rodovnik=rodovnik,
                    veterinarska_oskrba=veterinarska_oskrba,
                    cepljenje=cepljenje,
                    kastracija_sterilizacija=kastracija_sterilizacija,
                    opis=opis,
                    regija=regija,
                    telefon=telefon,
                    email=email,
                    popravljeni_komentarji=popravljeni_komentarji,
                    id_oglasa=id_oglasa)

 
@route('/oglas/<id_oglasa>', method='POST')
def oglas_post(id_oglasa):
    print('Nov komentar')
    
    vsebina = request.forms.comment

    # Iz baze preberemo id_uporabnika
    uporabnik = request.get_cookie('username')
    cur.execute("SELECT id_uporabnika FROM uporabniki WHERE uporabnisko_ime='" + uporabnik + "'")
    [[id_uporabnika]] = cur.fetchall()
    id_uporabnika = int(id_uporabnika)
 
    cas_oddaje = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # id_komentarja
    cur.execute("SELECT COUNT(*) FROM komentar")
    [[stevilo_komentarjev]] = cur.fetchall()
    id_komentarja = int(stevilo_komentarjev)+1

    komentar = (id_komentarja, id_uporabnika, id_oglasa, vsebina, cas_oddaje)
    cur.execute('''INSERT INTO komentar VALUES {0}'''.format(komentar))
    return redirect('/oglas/{0}'.format(id_oglasa))

@route('/ustvari_oglas/', method='GET')
def ustvari_oglas_get():
    username = request.get_cookie('username')

    # preverimo, če je kdo prijavljen
    if username==None:
        return redirect('/prijava/')
    
    cur.execute('''SELECT slovensko_ime, id_pasme FROM pasma ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapiše v rows v obliki
    pasme = []
    for row in rows:
        pasma, id_pasme = row
        pasma = str(pasma).strip('[]""''')
        pasma = pasma.replace("'", "")
        pasme.append((pasma, id_pasme))
    pasme.sort()
        
    return template('ustvari_oglas.tpl',
                    pasme=pasme,
                    username=username)

@route('/ustvari_oglas/', method='POST')
def ustvari_oglas_post():
    id_pasme = int(request.forms.pasma)
    opis = request.forms.opis
    skotitev = request.forms.skotitev
    samicke = int(request.forms.samicke)
    samcki = int(request.forms.samcki)
    rodovnik = request.forms.rodovnik
    veterinar = request.forms.veterinar
    cepljenje = request.forms.cepljenje
    kastracija = request.forms.kastracija
    email = request.forms.email
    telefon = request.forms.telefon
    uporabnik = request.get_cookie('username')

    rodovnik = boolean(rodovnik)
    veterinar = boolean(veterinar)
    cepljenje = boolean(cepljenje)
    kastracija = boolean(kastracija)
    email = boolean(email)
    telefon = boolean(telefon)

    cena_izbrano = request.forms.cena_izbrano
    if cena_izbrano:
        cena = int(request.forms.cena)

    po_dogovoru = request.forms.po_dogovoru
    if po_dogovoru:
        cena = -10

    podarim = request.forms.podarim
    if podarim:
        cena = 0
    
    # Iz baze preberemo id_uporabnika
    cur.execute("SELECT id_uporabnika FROM uporabniki WHERE uporabnisko_ime='" + uporabnik + "'")
    [[id_uporabnika]] = cur.fetchall()
    id_uporabnika = int(id_uporabnika)

    # Pogledamo za id_oglasa
    cur.execute("SELECT COUNT(*) FROM oglas")
    [[stevilo_oglasov]] = cur.fetchall()
    id_oglasa = int(stevilo_oglasov)+1

    cas_oddaje = datetime.now()

    nov_oglas = (id_oglasa, id_uporabnika, '{0}'.format(cas_oddaje), id_pasme, 
                 '{0}'.format(opis), '{0}'.format(skotitev), '{0}'.format(cena),
                 '{0}'.format(samicke), '{0}'.format(samcki), '{0}'.format(rodovnik),
                 '{0}'.format(veterinar), '{0}'.format(cepljenje), '{0}'.format(kastracija),
                 '{0}'.format(telefon), '{0}'.format(email))
    cur.execute("INSERT INTO oglas VALUES {0}".format(nov_oglas))
    print("Nov oglas")
    return redirect("/oglasi/starost_oglasa_nar/5/1")


################################################################################################
# Glavni program
# poženemo strežnik na portu 8080, glej http://localhost:8080/
run(host='localhost', port=8080)
