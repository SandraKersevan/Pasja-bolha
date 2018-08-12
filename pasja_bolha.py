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
    notranjost = request.query.get('notranjost')
    izkusnje = request.query.get('izkusnje')
    obcutljivost = request.query.get('obcutljivost')
    samota = request.query.get('samota')
    hladno = request.query.get('hladno')
    toplo = request.query.get('toplo')
    druzina = request.query.get('druzina')
    otroci = request.query.get('otroci')
    drugi_psi = request.query.get('drugi_psi')
    tujci = request.query.get('tujci')
    dlaka = request.query.get('dlaka')
    slinjenje = request.query.get('slinjenje')
    dlaka_skrb = request.query.get('dlaka_skrb')
    zdravje = request.query.get('zdravje')
    debelost = request.query.get('debelost')
    velikost = request.query.get('velikost')
    ucljivost = request.query.get('ucljivost')
    inteligenca = request.query.get('inteligenca')
    grizenje = request.query.get('grizenje')
    lovski_nagon = request.query.get('lovski_nagon')
    lajanje = request.query.get('lajanje')
    potepanje = request.query.get('potepanje')
    energicnost = request.query.get('energicnost')
    utrujenost = request.query.get('utrujenost')
    gibanje = request.query.get('gibanje')
    igrivost =  request.query.get('igrivost')
    izbrano = [stevilka(notranjost), stevilka(izkusnje), stevilka(obcutljivost),
               stevilka(samota), stevilka(hladno), stevilka(toplo), stevilka(druzina),
               stevilka(otroci), stevilka(drugi_psi), stevilka(tujci), stevilka(dlaka),
               stevilka(slinjenje), 6-stevilka(dlaka_skrb), stevilka(zdravje),
               stevilka(debelost), stevilka(velikost), stevilka(ucljivost),
               stevilka(inteligenca), stevilka(grizenje), stevilka(lovski_nagon),
               stevilka(lajanje), stevilka(potepanje), stevilka(energicnost),
               stevilka(utrujenost), stevilka(gibanje), stevilka(igrivost)]
    print(izbrano)

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
        
    vsota = sum(izbrano)

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
        razlika_pasme = abs(sum(row[1:]) - vsota)
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
    print("Cookie izbrano pobrisan, samo ni zares")
    # OPOMBA: Tu je nek bug, ker ne pobriše cookija, ko gre nazaj
    return redirect("/izbira_psa/")


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
        print("Najdeno")
        response.set_cookie('username', username, path='/')
        response.status = 303
        response.set_header('Location', '/oglasi/1')
    
    else:
        print("Ni v bazi")
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

    # Dolocimo kraj (za postno stevilko)
    ## OPOMBA: ali je res potrebno iskati kraj, saj je v bazi tabela povezana s tabelo poste (+ lahko jo preberemo direktno iz strani,
    ##         saj imamo obliko postna_st+kraj v spustnem seznamu)
    kraj = ""
    cur.execute('''SELECT posta FROM posta ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapiše v rows v obliki (postna_st, posta, regija)
    for row in rows:
        (postna_st, posta, regija) = tuple(row[0].split(','))
        posta = re.sub('"', '', posta)
        postna_st = int(postna_st[1:])
        if postna_stevilka == postna_st:
            kraj = posta

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
            elif not geslo==geslo2:
                # Gesli se ne ujemata
                ## OPOMBA: ali je res potrebno, saj nas stran (naj) ne bi spustila cez, če se gesli ne ujemata (JavaScript koda v css)
                print('Gesli se ne ujemata.')
            else:
                # Vse je v redu, vstavi novega uporabnika v bazo
                cur.execute("SELECT COUNT(*) FROM uporabniki")
                [[stevilo_uporabnikov]] = cur.fetchall()
                st_uporabnika = int(stevilo_uporabnikov)+1
                nov_uporabnik = (st_uporabnika, '{0}'.format(ime), '{0}'.format(priimek),
                                 '{0}'.format(naslov), '{0}'.format(postna_stevilka),
                                 '{0}'.format(email), '{0}'.format(telefon), '{0}'.format(uporabnik), '{0}'.format(geslo))
                cur.execute("INSERT INTO uporabniki VALUES {0}".format(nov_uporabnik))
                response.set_cookie('username', username, path='/')
                response.status = 303
                response.set_header('Location', '/oglasi/1')

# Stran z oglasi
@route('/oglasi/<stran>', method='GET')
def oglasi_get(stran):
    username = request.get_cookie('username')
    # preverimo, če je kdo prijavljen
    if username==None:
        return redirect('/prijava/')

    oglasi = []
    cur.execute('''SELECT id_oglasa, id_uporabnika, cas_oddaje, id_pasme, cena,
                st_samick, st_samckov FROM oglas''')
    rows = cur.fetchall()
    for row in rows:
        id_oglasa, id_uporabnika, cas_oddaje, id_pasme, cena, st_samick, st_samckov = row
        
        cur.execute("SELECT slovensko_ime, slike FROM pasma WHERE id_pasme={0}".format(id_pasme))
        pasma, slika = cur.fetchone()

        if cena != 0:
            cena = str(cena) + ' €'
        else:
            cena = 'Podarim'

        #regija
        cur.execute('''SELECT regija.regija FROM uporabniki
                    INNER JOIN posta ON uporabniki.posta=posta.postna_st
                    INNER JOIN regija ON posta.regija=regija.id
                    WHERE uporabniki.id_uporabnika={0}'''.format(id_uporabnika))
        [regija] = cur.fetchone()

        oglasi.append((cas_oddaje,id_oglasa,slika,pasma,cena,regija,st_samick,st_samckov))        

    # uredimo oglase od najnovejšega do najstarejšega
    oglasi = oglasi[::-1]

    # stevilo strani
    if len(oglasi)%10 == 0:
        st_strani = len(oglasi)//10
    else:
        st_strani = len(oglasi)//10 + 1

    # vzamemo 10 oglasov
    stran = int(stran)
    oglasi = oglasi[(stran-1)*10:stran*10]
         
    return template('oglasi',
                    username=username,
                    oglasi=oglasi,
                    st_strani=st_strani)

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

    if cena != 0:
        cena = str(cena) + ' €'
    else:
        cena = 'Podarim'

    #regija
    cur.execute('''SELECT regija.regija FROM uporabniki
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
    cena = int(request.forms.cena)
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
    
    # Iz baze preberemo id_uporabnika
    cur.execute("SELECT id_uporabnika FROM uporabniki WHERE uporabnisko_ime='" + uporabnik + "'")
    [[id_uporabnika]] = cur.fetchall()
    id_uporabnika = int(id_uporabnika)

    # Pogledamo za id_oglasa
    # OPOMBA:  Vedno gledamo število oglasov, kaj če kakšnega vmes izbrišemo iz baze? (potem imata dva isti id)
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
    return redirect("/oglasi/1")


################################################################################################
# Glavni program
# poženemo strežnik na portu 8080, glej http://localhost:8080/
run(host='localhost', port=8080)
