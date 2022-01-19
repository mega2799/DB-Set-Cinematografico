from time import strftime
from faker import Faker 
from random import choice, randint, random
import random
import string
from codicefiscale import codicefiscale
import datetime 

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)
    
f = Faker('it_IT')
 
codFilm = 3

INDIRIZZO = []

MembroTroupe = []

VALUES = 19

NumFinanziatori = 4

RUOLI = ['sceneggiatore','produttore','produttore esecutivo','aiuto regista','capo regista','regista','attore','stilista','operatore fonico','operatore fotografico']

BUSTAPAGA = [] 

AZIENDE = ['Adobe','Boeing','Wells Fargo','PepsiCo','Comcast','Cisco Systems','Chevron','Pfizer','Merck & Co.','Verizon','The Coca-Cola Company','The Walt Disney Company','The Home Depot','ExxonMobil','UnitedHealth Group','AT&T','Intel','Bank of America','Procter & Gamble','Mastercard','Walmart','Johnson & Johnson','JPMorgan Chase','Visa','Berkshire Hathaway','Facebook','Alphabet','Amazon','Apple','Microsoft']

SCENE = [] 

FINANZIATORE = [] 

SPONSOR = []

CODINDSEDE = 16395

COSTUME = []

OGGETTI = [] 

CODMAGAZZINO = 1

POSIZIONI = [] 

TIPOOGGETTI = ['arredo','maschere','armi','mobili','strumentoMusicale','motori']

TIPOCOSTUME = ['epoca', 'contemporaneo', 'fantasia']

for i in range(VALUES + NumFinanziatori):
    INDIRIZZO.append([random_with_N_digits(5),f.city(),f.street_name(),f.building_number(), int(f.postcode())])


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
    BUSTAPAGA.append( [random_with_N_digits(5), randint(7, 54), randint(45, 198), f.month_name()])

for i in range(VALUES):
    SCENE.append([random_with_N_digits(5), "Scena n. " + str(i), random_with_N_digits(2), random_with_N_digits(3), random_with_N_digits(3), random_with_N_digits(2),codFilm])

for i in range(NumFinanziatori):
    FINANZIATORE.append([f.iban(), random.choice(AZIENDE), INDIRIZZO[VALUES + i][0], random.random()])

for i in range(VALUES):
    POSIZIONI.append([random_with_N_digits(5), CODMAGAZZINO, random_with_N_digits(1), random.choice(string.ascii_letters).capitalize()])

for i in range(VALUES):
    COSTUME.append([random_with_N_digits(5), random.choice(TIPOCOSTUME), 'costume di scena n.' + str(i + 1), random.choice(MembroTroupe)[0], POSIZIONI[i][0]])

for i in range(NumFinanziatori):
    OGGETTI.append([random_with_N_digits(5), random.choice(TIPOOGGETTI), 'oggetto di scena n.' + str(i + 1), POSIZIONI[i][0]])

file = open("fakeData.sql", "w")

file.write("INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES ") 
for i in range(VALUES + NumFinanziatori): 
    file.write("\n" + str(INDIRIZZO[i]).replace("[", "(").replace("]", ")") + ",")
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

file.write("INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES") 
for i in range(VALUES):
    file.write("\n " + str(SCENE[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP) VALUES ")
for i in range(VALUES):
    file.write("\n " + str(COSTUME[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO CostumeScena(codC, codScena) VALUES ")
for i in range(VALUES):
    file.write("\n" + str([random.choice(SCENE)[0], random.choice(COSTUME)[0]]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")
 
file.write("INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso) VALUES") 
for i in range(NumFinanziatori):
    file.write("\n " + str(POSIZIONI[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

# il codP e il codice magazzino 
file.write("INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP) VALUES ")
for i in range(NumFinanziatori):
    file.write("\n " + str(OGGETTI[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO OggettoScena(codO,codScena) VALUES")
for i in range(NumFinanziatori):
    file.write("\n" + str([random.choice(OGGETTI)[0], random.choice(SCENE)[0]]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")
    

file.write("INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES ")
for i in range(VALUES):
    for j in random.choices(MembroTroupe, k=4):
        file.write("\n" + str([SCENE[i][0], str(j[0])]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES ")
for i in range(VALUES%2):
    SPONSOR.append([f.iban(), random.choice(AZIENDE)])
    file.write("\n" + str(SPONSOR[i]).replace("[", "(").replace("]", ")") + ",") 
    # nel caso siano replicate il DB non si lamenta 
file.write(";\n")

file.write("INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES")
for i in range(NumFinanziatori):
    file.write("\n " + str(FINANZIATORE[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")


file.write("INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd) VALUES ")
incDate = f.date()
for i in range(NumFinanziatori * 2):
    strpdate = datetime.datetime.strptime(incDate, '%Y-%m-%d')
    incDate2 = strpdate + datetime.timedelta(7)
    strincDate2 = incDate2.strftime('%Y-%m-%d')
    file.write("\n " + str([incDate, strincDate2, random_with_N_digits(7), codFilm, CODINDSEDE]).replace("[", "(").replace("]", ")") + ",")
    incDate = strincDate2
file.write(";\n")

file.write("INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES ")
for i in range(NumFinanziatori):
    file.write("\n " + str([random_with_N_digits(5), f.date(), random_with_N_digits(6), 'null', FINANZIATORE[i][0], codFilm]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES ")
for i in SPONSOR:
    file.write("\n " + str([random_with_N_digits(5), f.date(), random_with_N_digits(6), i[0] , 'null', codFilm]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES ")
for i in range(VALUES):
    for j in random.choices(MembroTroupe, k=5):
        file.write("\n "+ str([SCENE[i][0], str(j[0])]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")


file.write("INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES ")
for i in range(VALUES):
    file.write("\n" + str(BUSTAPAGA[i]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES")
for i in range(VALUES):
    file.write("\n" + str([MembroTroupe[i][0], BUSTAPAGA[i][0]]).replace("[", "(").replace("]", ")") + ",")
file.write(";\n")

file.write("\n \n \n \n \n incollarlo sotto le insert di star wars e soprattutto per farlo andare sostituire ,; con ;        e       \'null\' con null ")

file.close()