from faker import Faker 
from random import randint
from codicefiscale import codicefiscale
import datetime 

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)
    
f = Faker('it_IT')

# fake name 
f.unique.name()

# fake address 
f.unique.address()

# fake IBAN 
f.iban()

INDIRIZZO = []

VALUES = 50
# codInd numero random.... 

for i in range(VALUES):
    INDIRIZZO.append([random_with_N_digits(5),f.city(),f.street_name(),f.building_number(), f.postcode()])
# print(INDIRIZZO)

MembroTroupe = []

def dateparse(d):
    return str(datetime.datetime.strptime(str(d), '%Y-%m-%d').strftime('%m/%d/%y'))

def codeFiscale(name, surname, date):
    return (codicefiscale.encode(name, surname, "M", dateparse(date),'torino'))

nome = f.last_name()
sur = f.first_name() 
birth = f.past_date()
for i in range(VALUES):
    MembroTroupe.append([codeFiscale(nome, sur, birth), nome, sur, f.iban(), str(birth), f.phone_number(), INDIRIZZO[i]])

print(MembroTroupe)