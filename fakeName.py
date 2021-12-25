from faker import Faker 
from random import randint, random
import random
from codicefiscale import codicefiscale
import datetime 

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)
    
f = Faker('it_IT')

codFilm = 1

INDIRIZZO = []

MembroTroupe = []

VALUES = 19

RUOLI = ['sceneggiatore','produttore','produttore esecutivo','aiuto regista','capo regista','regista','attore','stilista','operatore fonico','operatore fotografico']

codScena = []

BUSTAPAGA = [] 

for i in range(VALUES):
    INDIRIZZO.append([random_with_N_digits(5),f.city(),f.street_name(),f.building_number(), int(f.postcode())])
# print(INDIRIZZO)


def dateparse(d):
    return str(datetime.datetime.strptime(str(d), '%Y-%m-%d').strftime('%m/%d/%y'))

def codeFiscale(name, surname, date):
    return (codicefiscale.encode(name, surname, "M", dateparse(date),'torino'))


for i in range(VALUES):
    nome = f.last_name()
    sur = f.first_name() 
    birth = f.past_date()
    MembroTroupe.append([codeFiscale(nome, sur, birth), nome, sur, f.iban(), str(birth), f.phone_number(), INDIRIZZO[i][0]])

for i in range(VALUES):
    codScena.append(random_with_N_digits(5))

for i in range(VALUES):
    BUSTAPAGA.append([random_with_N_digits(5), randint(7, 54), randint(45, 198), f.month_name()])

file = open("try.sql", "w")

file.write("INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES ") 
for i in range(VALUES): 
    file.write("\n" + str(INDIRIZZO[i]).replace("[", "(").replace("]", ")") + ", ")
file.write(";\n")

file.write("INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES ") 
for i in range(VALUES):
    file.write("\n" + str(MembroTroupe[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES ")
for i in range(VALUES):
    file.write("\n" + str([MembroTroupe[i][0], random.choice(RUOLI)]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")


file.write("INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES ")
for i in range(VALUES):
    file.write("\n" + str([codFilm, str(MembroTroupe[i][0])]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")


file.write("INSERT IGNORE INTO Membro_Troupe_Scena(codScena ,CF) VALUES ")
for i in range(VALUES):
    for j in random.choices(MembroTroupe, k=4):
        file.write("\n" + str([codScena[i], str(j[0])]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES ")

for i in range(VALUES):
    file.write("\n" + str(BUSTAPAGA[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES")

for i in range(VALUES):
    file.write("\n" + str([MembroTroupe[i][0], BUSTAPAGA[i][0]]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.close()