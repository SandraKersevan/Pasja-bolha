#!/usr/bin/env python3
import psycopg2
import sys

from bottle import *
import auth as auth




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

# conn.cursor will return a cursor object, you can use this cursor to perform queries

print ("Connected!\n")



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
# Tu bi morali dobiti podatke iz baze
    return template('zacetna_stran')

# Stran za iskanje idealne pasme
@route('/izbira_psa/')
def izbira_psa():
    return template('izbira_psa')

# Stran za prijavo in registracijo
@route('/prijava/')
def prijava():
    return template('prijava')

@route('/registracija/')
def registracija():
    cur.execute('''SELECT posta FROM posta ''')
    rows = cur.fetchall() # prebere zgornji select in ga zapoše v rows v obliki (postna_st, posta, regija)
    postne_st = []
    poste = []
    regije = []
    for row in rows:
        (postna_st, posta, regija) = tuple(row[0].split(','))
        postna_st = int(postna_st[1:])
        regija = int(regija[:-1])
        postne_st.append(postna_st)
        poste.append(posta)
        regije.append(regija)
    return template('registracija1.html',
                    postne_st=postne_st,
                    regije=regije,
                    poste=poste)

@route('/oglasi/')
def oglasi():
    return template('oglasi')

@route('/ustvari_oglas/')
def ustvari_oglas():
    return template('ustvari_oglas')


# Glavni program
# poženemo strežnik na portu 8080, glej http://localhost:8080/
run(host='localhost', port=8080)
