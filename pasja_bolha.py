#!/usr/bin/env python3
import psycopg2
import sys
import re

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


######################################################################
# Pomozne funkcije:

def stevilka(besedilo):
    '''Spremeni besedilo s številko v številko.
    Uporabimo, da izbran radio button spremenimo v njegovo vrednost.
    Če ni bil izbran noben, izpiše 0.'''
    stevilka = 0

    if besedilo == None:
        return stevilka
    
    for znak in besedilo:
        if znak in "12345":
            stevilka = int(znak)
            return stevilka

            
######################################################################
# Funkcije za izgradnjo strani

# Statične datoteke damo v mapo 'static' in do njih pridemo na naslovu '/static/...'
# Uporabno za slike in CSS, poskusi http://localhost:8080/static/slika.jpg
@route('/static/<filename:path>')
def static(filename):
    return static_file(filename, root='static')


# Glavna stran
@route('/')
def zacetna_stran():
    return template('zacetna_stran')

# Stran za iskanje idealne pasme
@route('/izbira_psa/')
def izbira_psa():
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

    return template('izbira_psa')

# Stran za prijavo in registracijo
@route('/prijava/', method='GET')
def prijava():
    username = request.query.get('username')
    password = request.query.get('password')

    print(username, password)

    cur.execute('''SELECT ime, geslo FROM uporabnik''')
    rows = cur.fetchall()
    for row in rows:
        ime, geslo = row

        if ime == username and geslo == password:
            print("Najdeno")
            return redirect("/")
        
    return template('prijava')


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
    geslo = request.forms.inputPassword1
    geslo2 = request.forms.inputPassword2
    uporabnik = request.forms.uporabnik
    stevilka = int(request.forms.posta)

    # Dolocimo kraj
    kraj = ""
    cur.execute('''SELECT posta FROM posta ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapiše v rows v obliki (postna_st, posta, regija)
    for row in rows:
        (postna_st, posta, regija) = tuple(row[0].split(','))
        posta = re.sub('"', '', posta)
        postna_st = int(postna_st[1:])
        if stevilka == postna_st:
            kraj = posta
            
    kontakt = request.forms.kontakt
    if uporabnik != None:
        # Ali uporabnik že obstaja?
        cur.execute("SELECT ime FROM uporabnik WHERE ime='" + uporabnik + "'")
        if cur.fetchone():
            # Uporabnik že obstaja
            print('Uporabnik že obstaja')
        elif not geslo==geslo2:
            # Gesli se ne ujemata
            print('Gesli se ne ujemata.')
        else:
            # Vse je v redu, vstavi novega uporabnika v bazo
            cur.execute("SELECT COUNT(*) FROM uporabnik")
            [[stevilo_uporabnikov]] = cur.fetchall()
            st_uporabnika = int(stevilo_uporabnikov)+1
            nov_uporabnik = (st_uporabnika, '{0}'.format(uporabnik), '{0}'.format(kraj), '{0}'.format(kontakt), '{0}'.format(geslo))
            cur.execute("INSERT INTO uporabnik (id_uporabnika, ime, kraj, kontakt, geslo) VALUES {0}".format(nov_uporabnik))
            return redirect("/")

@route('/oglasi/')
def oglasi():
    return template('oglasi')

@route('/ustvari_oglas/')
def ustvari_oglas():

    cur.execute('''SELECT slovensko_ime FROM pasma ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapoše v rows v obliki (postna_st, posta, regija)
    pasme = []
    for row in rows:
        row = str(row).strip('[]""''')
        pasme.append(row)
        
    return template('ustvari_oglas.tpl',
                    pasme=pasme)


# Glavni program
# poženemo strežnik na portu 8080, glej http://localhost:8080/
run(host='localhost', port=8080)
