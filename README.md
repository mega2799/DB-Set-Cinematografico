Set Cinematografico
===================

creare il file .sql 

```bash
mysqldump -u studente -p cinema > cinema.sql
```

#### Note personali
Ma siamo sicuri di voler rendere l'indirizzo obbligatorio per tutti ?
Risolvere i TODO in giro


## Struttura del progetto

La presente documentazione tratta nel dettaglio la progettazione e l’implementazione dell’elaborato "Set cinematografico" di Michele Nardini ()  Santoro Matteo(881608)

## Struttura:
* [1 Introduzione](#Introduzione)
* [2 Analisi requisiti]
* [2.11 Intervista](#211-intervista)
* [2.2 Estrazione Concetti Fondamentali]
* [3 Progetto dello schema Concettuale](#3-progetto-dello-schema-concettuale)
* [3.1 Distribuzione e Incasso](#distribuzione-e-incasso)
* [3.2 Inspirazione e Sceneggiatura](#inspirazione-e-sceneggiatura)
* [3.3 Gestione Fondi](#gestione-fondi)
* [3.4 Membro della Troupe](#membro-troupe)
* [3.6 Scena](#scena)

* [5 Il progetto Logico](#Il-Progetto-Logico)

Introduzione
-----------
Il gruppo si pone come obbiettivo quello di realizzare un database per la gestione  
di un set cinematografico coprendone tutti gli aspetti.  
Saranno memorizzate all'interno del database le varie figure che partecipano  
alle realizzazione di un girato, gli enti che si occuperanno della distribuzione  
la gesione delle scene e dei ciak quindi gli stipendi e gli incassi.  


2.11 Intervista
----
/* SERVE AGGIUNGERE LE QUERY IN QUESTA ROBA */
Netflix Italia possiede un sistema software da per la gestione delle persone e  
cose coinvolte della realizzazione di serie Tv e film, tale sistema necessità  
di una nuova versione. Si richiede quindi la progettazione di una database che  
possa gestire gli aspetti fondamentali per girare uno seceneggiato, il database  
sarà utilizzato da persone che si occuperanno della gestione.  
Saranno memorizzate tutte le informazioni sui membri della troupe che lavorano  
alla realizzazione di un film, il quale sarà il fulcro attorno al quale gira l'  
applicativo, di cui memorizzeremo le principali informazioni e al quale uniremo  
un eventuale serie letterarie da cui è tratto. Sarà fondamentale anche l'ente che  
si occuperà della distribuzione e gli incassi che verranno generati.
Come accade spesso in questo ambiente, per poter esistere acluni film vengono  
stanziati dei finanziamenti che possono provenire principalmente da sponsor o  
finanziatori, ossia persone che possiedono un enorme capitale che effettuano  
un investimento nella riuscita di un film e che dal quale ricaveranno un guadagno  
che è calcolato in percentuale al gaudagno del film. Le figure professionali che  
routano attorno la creazione di un girato sono fondamentali e vanno inserite all'  
interno dell'applicativo tramite un'interfaccia di inserimento, ruoli come  
sceneggiatore, produttore(con annessa percentuale guadagno), produttore esecutivo
,aiuto regista, capo regista (con annessa percentuale guadagno),regista,
attore, stilista, operatore fonico e operatore fotografico e di loro  
memorizzare l'anagrafica, telefono e IBAN che sarà poi utilizzato per l'accredito  
della paga mensile calcolata nel software, che dovrà poi contenere uno storico  
delle buste paga. Si dovrà poi indicare l'indirizzo di residenza dei vari membri  
della troupe per il loro recapito, gli attori utilizzeranno costumi progrettati  
da stilisti che vengono conservati in magazzini assieme agli oggetti di scena.  
Saranno infine regsitrati nell'applicativo i ciak presi durante le riprese del  
film, nello specifico il rullo su cui è impresso, il numero del ciak, la location  
nel quale viene girato e i costumi ed oggetti di scena presenti nel ciak.  
/* l'applicativo deve quindi anche poter ordinare gli oggetti e i costumi temporalmente utilizzati nelle riprese*/   



3 Progetto dello schema concettuale
-----
Lo schema concettuale è stato realizzato attorno ad alcune entità di base come  
i membri della troupe dai quali deriviamo i vari lavori e maestranze e l'entità  
scena-Ciak fondamentale per la realizzazione di un film 

3.1 Distribuzione e Incasso
----------
Ogni Film ha bisogno di un ente specifico che si occupi della distribuzione,  
come ad esempio Netflix che dopo aver preso i diritti per la riproduzione  
porta sulla sua piattaforma la pellicola, ogni ente da noi gestito attraverso  
un entita composta da nome, indirizzo, P.IVA ha poi una dislocazione locale  
che possiede l'attributo trattenute.
![](/res/distribuzioneIncasso.png)

3.2 Inspirazione e Sceneggiatura
--------
E' comune che i film siano stati inspirati da alcune serie letterarie, come ad  
esempio la saga di Harry Potter, abbiamo quindi deciso di inserire la possibilità  
che un dato film sia tratto da una Serie Letteraria che abbiamo modellato come  
un entita, spesso capita nell' ambiente cinematografico che lo Scenegiatore  
sia anche l'autore della Serie

![](/res/serie.png)

3.3 Gestione Fondi
---------
Un film per poter essere realizzato ha un enorme bisogno di soldi quindi di fondi  
dato che i costi sono molti, spesso questo patrimonio si crea dagli investimenti  
che la pellicola riesce a raccogliere, abbiamo creato le entità Sponsor che   
rappresentano le possibili aziende che possono in cambio di una sponsorizzazione  
del loro prodotto pagare una somma di denaro e l' entità Finanziatore per le   
persone o aziende che decidono di investire una somma di denaro per poi poter   
guadagnare grazie ad una percentuale una volta ricevuti gli incassi del film _o   
o attraverso somme pattuite_ tramite un associazione che ha come attributo   
la data di investimento e il Produttore esecutivo abbiamo modellato la gestione  
dei fondi.

![](/res/fondo.png)

3.4 Membro della Troupe
-------
In un set cinematografico le persone che lavorano alle realizzazione di un film  
sono tante e compiono lavori diversi, ma abbiamo deciso di utilizzare una   
gerarchia per poter più comodamente rappresentarle.

![](/res/gerarchia.png)

3.5	Stipendio
--------
Ogni addetto ai lavori in un set cinematografico ha uno stipendio, modellato  
attraverso un entità nella quale vengono registrati i codici singoli per busta  
paga, le ore accumulate sul set, i contributi e il periodo sul quale poi verrà 
calcolato un vero e proprio stipendio.

![](/res/stipendio.png)

3.6 Scena 
-----

![](/res/scena.png)


Schema Completo
----------
![](/res/schemaCompleto.png)

Il progetto Logico
---------------
Qui riportati gli schemi di navigazione delle operazioni

Aggiunta Film
------
Aggiungere un film consiste nell'aggiungere un instanza dell' entità FILM
```sql 
INSERT INTO Film(codF, titolo, genere, durata, dataUscita, idSerie) 
	VALUES(00001, 'Star Wars: Episodio VI - Il ritorno dello Jedi',
				'fantascienza', 134, 25/05/2983, 2551983);
```

Aggiunta Membro-Troupe
-------
Aggiungiamo prima al database un membro generico, il quale verra poi collegato al film  
tramite la tupla Film_Membro_Troupe che rappresenta l'associazione _lavora_
```sql
INSERT INTO Membro_Troupe(CF, nome, cognome, iban, data_nascita, telefono,
							codInd, percentuale_contributo[0-1],
							ruolo, tipoOperatore[0-1])
	VALUES ('GRGLCS14ES44', 'George', 'Lucas', 'GB98BARC20040156884556', 
				14/5/1944, '516-527-8719', 1.5, 'Produttore Esecutivo');

INSERT INTO Film_Membro_Troupe(00001, 'GRGLCS14ES44');
```

Distribuzione (il codice IND va aggiornato)
---------
```sql
INSERT INTO Ente(P.IVA_ENTE,nome,codInd) VALUES (40365320379,
												'20th Century Studios', 6666);

INSERT INTO Distribuzione(P.IVA, codF) VALUES (40365320379, 00001);
```

# 5.X Traduzione delle entità 
* Film(__*codF*__, titolo, genere ,durata, dataUscita, idSerie)
	+ FK: idSerie REFERENCES __Serie_Letteraria__

* Indirizzo(__*codInd*__, città, via, civico, CAP)

* Ente(__*P.IVA_ENTE*__,nome,codInd)
	+ FK: codInd REFERENCES __Indirizzo__

* Distribuzione(__*P.IVA*__, __*codF*__)
	+ FK: P.IVA_ENTE REFERENCES __Ente__
	+ FK: codF REFERENCES __Film__

* Sede_Territoriale(__*codInd*__, P.IVA_ENTE)
	+ FK: codInd REFERENCES __Indirizzo__
	+ FK: P.IVA_ENTE REFERENCES __Ente__

* Incasso(percentualeTrattenute, __*codF*__, __*indSede*__)
	+ FK: codFr REFERENCES __Film__
	+ FK: indSede REFERENCES __Sede__

* Incasso_settimanale(__*idIncasso*__, inizio_settimana, fine_settimana, incasso, codF, indSede) !!!!!!!!!!!!!!!!
	+ FK: codF, indSede REFERENCES __Incasso__

* Fondo(__*codFondo*__, data, patrimonio, P_IVA_SPONSOR, P.IVA_FINANZIATORE, CF, codF)
	+ FK: P.IVA_SPONSOR REFERENCES __Sponsor__
	+ FK: P.IVA_FINANZIATORE REFERENCES __Finanziatore__
	+ FK: CF REFERENCES __Membro_troupe__
	+ FK: codF REFERENCES __Film__

* Sponsor(__*P.IVA_SPONSOR*__, nome)

* Finanziatore(__*P.IVA_FINANZIATORE*__, nome, codInd, percentuale_guadagno)
	+ FK: codInd REFERENCES __Indirizzo__

* Serie_Letteraria(__*idSerie*__, titolo, genere, volumi, CF)
	+ FK: CF REFERENCES __Membro_troupe__

* Membro_Troupe(__*CF*__, nome, cognome, iban, data_nascita, telefono, codInd, percentuale_contributo[0-1], ruolo, tipoOperatore[0-1])
	+ FK: codInd REFERENCES __Indirizzo__

* Film_Membro_Troupe(__*codF*__, __*CF*__)
	+ FK: codF REFERENCES __Film__
	+ FK: CF REFERENCES __Membro_troupe__

* Supervisione(Supervisore, __*Subalterno*__)
	+ FK: Supervisore REFERENCES __Membro_troupe__
	+ FK: Subalterno REFERENCES __Membro_troupe__

* ScenaCiak(__*codScena*__, note_di_produzione, rullo, numRiprese, data_inizio[0-1], data_fine[0-1], costo_affitto_giornaliero[0-1], codInd[0-1], codF)
	+ FK: codInd REFERENCES __Indirizzo__
	+ FK: codF REFERENCES __Film__

* Membro_Troupe_Scena(__*codScena*__, __*CF*__)
	+ FK: codScena REFERENCES __Scena-Ciak__
	+ FK: CF REFERENCES __Membro-Troupe__

* Magazzino(__*numMagazzino*__, codInd)
	+ FK: codInd REFERENCES __Indirizzo__

* PosizioneMagazzino(__*codP*__, __*numMagazzino*__, scaffale, percorso)
	+ FK: numMagazzino REFERENCES __Magazzino__

* Costume(__*codC*__, tipo, descrizione, CF, codP)
	+ FK: CF REFERENCES __Membro_troupe__
	+ FK: codP REFERENCES __PosizioneMagazzino__

* Stilista_Costume(__*CF*__, __*codC*__)
	+ FK: CF REFERENCES __Membro_troupe__
	+ FK: codC REFERENCES __Costume__

* Costume_Scena(__*codC*__, __*codScena*__)
	+ FK: codC REFERENCES __Costume__
	+ FK: codScena REFERENCES __Scena-Ciak__

* Oggetti_di_scena(__*codO*__, tipo, descrizione, codP)
	+ FK: numMagazzino REFERENCES __PosizioneMagazzino__

* Oggetto_Scena(__*codO*__, __*codScena*__)
	+ FK: codO REFERENCES __Oggetto_di_scena__
	+ FK: codScena REFERENCES __ScenaCiak__

* Acquisto(__*idAcquisto*__, data, prezzoTotale, P.IVA_DITTA)
	+ FK: P.IVA_DITTA REFERENCES __Ditta__

* Acquisto_Costume(__*codC*__, __*idAcquisto*__, prezzo)
	+ FK: codC REFERENCES __Costume__
	+ FK: idAcquisto REFERENCES __Acquisto__

* Acquisto_Oggetto(__*codO*__, __*idAcquisto*__, prezzo)
	+ FK: codO REFERENCES __Oggetto_di_scena__
	+ FK: idAcquisto REFERENCES __Acquisto__

* Ditta(__*P.IVA_DITTA*__, nome,codInd)
	+ FK: codInd REFERENCES __Indirizzo__

# Create table 
```sql
CREATE TABLE if not exists Indirizzo(
	codInd int primary key,
	città varchar(21) NOT NULL,
    via varchar(40) NOT NULL,
    civico int(4) NOT NULL,
    CAP int(5) NOT NULL check(length(CAP) = 5)
    );

CREATE TABLE IF NOT EXISTS  Enti(
  P_IVA varchar(11) NOT NULL,
  nome varchar(40) NOT NULL,
  codInd INT NOT NULL,
  FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  PRIMARY KEY(`P_IVA`)
) ;
   
CREATE TABLE if not exists MembroTroupe(
	CF varchar(12) primary key,
    nome varchar(20) NOT NULL, 
    cognome varchar(20) NOT NULL, 
    IBAN varchar(30) NOT NULL, 
    dataNascita date NOT NULL,
    telefono varchar(15) NOT NULL, 
    codInd INT NOT NULL,
    FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    percentualeContributo float(3) check(percentualeContributo between 0  and 100),
    ruolo varchar(41) NOT NULL check (ruolo in ('sceneggiatore', 'produttore',
    'produttore esecutivo','aiuto regista', 'capo regista', 
    'regista', 'attore', 'stilista', 'operatore')),
    tipoOperatore varchar(31) check (tipoOperatore in ('fonico', 'fotografico'))
);


CREATE TABLE IF NOT EXISTS SerieLetteraria(
    idSerie varchar(11) primary key,
    titolo varchar(51) NOT NULL,
    genere varchar(40) NOT NULL, 
    CF  varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);

CREATE TABLE IF NOT EXISTS Film (
  codF int(11) NOT NULL AUTO_INCREMENT,
  titolo varchar(51) NOT NULL,
  genere varchar(40) NOT NULL CHECK (genere = 'Animazione' or genere = 'Avventura' or genere = 'Azione' or genere = 'Biografico' or genere = 'Commedia' or genere = 'Documentario' or genere = 'Drammatico' or genere = 'Pornografico' or genere = 'Fantascienza' or genere = 'Fantasy' or genere = 'Guerra' or genere = 'Horror' or genere = 'Musical' or genere = 'Storico' or genere = 'Thriller' or genere = 'Western'),
  durata int(3) NOT NULL CHECK (durata > 0),
  dataUscita date DEFAULT NULL,
  idSerie varchar(11),
  FOREIGN KEY (idSerie) REFERENCES SerieLetteraria(idSerie)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  PRIMARY KEY (codF)
);

    
CREATE TABLE IF NOT EXISTS SediTerritoriali (
  P_IVA varchar(11) NOT NULL,
  FOREIGN KEY (P_IVA) REFERENCES Enti (P_IVA)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  codInd INT NOT NULL,
  FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  PRIMARY KEY (codInd)
);


CREATE TABLE if not exists Distribuzione(
	P_IVA varchar(11) , 
	FOREIGN KEY (P_IVA) REFERENCES Enti(P_IVA)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codF INT NOT NULL,
	FOREIGN KEY (codF) REFERENCES Film(codF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    PRIMARY KEY(P_IVA, codF)
    );
    

CREATE TABLE if not exists Incasso(
	percentualeTrattenute float(3) NOT NULL,
    codF INT NOT NULL,
	FOREIGN KEY (codF) REFERENCES Film(codF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    codInd INT NOT NULL,
    FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION, 
    primary key(codF, codInd)
    );
    
-- incasso settimanale non ci piace....

CREATE TABLE if not exists Sponsor(
	P_IVA_SPONSOR varchar(11) primary key,
    nome varchar(41) NOT NULL
    );


CREATE TABLE if not exists Finanziatore(
	P_IVA_FINANZIATORE varchar(11) primary key,
    nome varchar(41) NOT NULL,
     codInd INT NOT NULL,
    FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION, 
    percentualeGuadagno float(3) NOT NULL CHECK(percentualeGuadagno between 0 and 100)
    );




CREATE TABLE if not exists Fondo(
	codFondo varchar(13) primary key,
    dataAccredito date NOT NULL,
    patrimonio float(14) NOT NULL CHECK(patrimonio >= 0),
    P_IVA_SPONSOR varchar(11) NOT NULL,
    FOREIGN KEY (P_IVA_SPONSOR) REFERENCES Sponsor(P_IVA_SPONSOR)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    P_IVA_FINANZIATORE varchar(11) NOT NULL,
    FOREIGN KEY (P_IVA_FINANZIATORE) REFERENCES Finanziatore(P_IVA_FINANZIATORE)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    CF varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
    codF INT NOT NULL,
	FOREIGN KEY (codF) REFERENCES Film(codF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
    );



CREATE TABLE if not exists Film_Membro_Troupe(
	codF INT NOT NULL,
	FOREIGN KEY (codF) REFERENCES Film(codF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION, 
	CF varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	PRIMARY KEY(codF, CF)
	);

-- CREATE TABLE if not exists Supervisione(
-- supervisore INT NOT NULL,
-- FOREIGN KEY (supervisore) REFERENCES Supervisione(supervisore) 
-- ON DELETE CASCADE
-- ON UPDATE NO ACTION,
-- subalterno INT NOT NULL,
--  FOREIGN KEY (subalterno) REFERENCES Supervisione(subalterno)
-- ON DELETE CASCADE
-- ON UPDATE NO ACTION, 
-- PRIMARY KEY(subalterno)
-- );

CREATE TABLE if not exists ScenaCiak(
	codScena int(10) Primary Key, 
	noteDiProduzione varchar(255),
	rullo int(4) NOT NULL, 
	numRiprese int(4) NOT NULL,
	dataInizio date,
	dataFine date, -- CHECK(dataFine >= dataInizio),
	costoAffittoGiornaliero float(5), 
	codInd INT NOT NULL,
	FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codF INT NOT NULL,
	FOREIGN KEY (codF) REFERENCES Film(codF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);

CREATE TABLE if not exists Membro_Troupe_Scena(
	codScena INT NOT NULL,
	FOREIGN KEY (codScena) REFERENCES ScenaCiak(codScena) 
	ON DELETE CASCADE
	ON UPDATE NO ACTION ,
	CF varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	PRIMARY KEY(codScena, CF)
	); 

CREATE TABLE if not exists Magazzino(
	numMagazzino int(8) Primary Key, 
	codInd INT NOT NULL,
	FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);

CREATE TABLE if not exists PosizioneMagazzino(
	codP int(5), -- Primary Key,
	numMagazzino INT NOT NULL,
	FOREIGN KEY (numMagazzino) REFERENCES Magazzino(numMagazzino) 
	ON DELETE CASCADE
	ON UPDATE NO ACTION, 
	scaffale int(3) NOT NULL,
	percorso varchar(1) NOT NULL,
	PRIMARY KEY(codP, numMagazzino)
	);

CREATE TABLE if not exists Costume(
	codC int(6) Primary Key,
	tipo varchar(12) NOT NULL CHECK(tipo='epoca' OR tipo='contemporaneo' OR tipo='fantasia'),
	descrizione varchar(255) NOT NULL,
	CF varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codP INT NOT NULL,
	FOREIGN KEY (codP) REFERENCES PosizioneMagazzino(codP)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);

CREATE TABLE if not exists StilistaCostume(
	CF varchar(12) NOT NULL,
	FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codC INT NOT NULL,
	FOREIGN KEY (codC) REFERENCES Costume(codC)
	ON DELETE CASCADE
	ON UPDATE NO ACTION, 
	PRIMARY KEY(CF, codC)
	);


CREATE TABLE if not exists CostumeScena(
	codC INT NOT NULL,
	FOREIGN KEY (codC) REFERENCES Costume(codC)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codScena INT NOT NULL,
	FOREIGN KEY (codScena) REFERENCES ScenaCiak(codScena) 
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	PRIMARY KEY(codC, codScena)
	);


CREATE TABLE if not exists OggettiDiScena(
	codO int(6) Primary key,
	tipo varchar(21) CHECK (tipo in ('arredo','maschere','armi','mobili','strumentoMusicale','motori')),
	descrizione varchar(255) NOT NULL,
	codP INT NOT NULL,
	FOREIGN KEY (codP) REFERENCES PosizioneMagazzino(codP)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);


CREATE TABLE if not exists OggettoScena(
	codO INT NOT NULL,
	FOREIGN KEY (codO) REFERENCES OggettiDiScena(codO)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	codScena  INT NOT NULL,
	FOREIGN KEY (codScena) REFERENCES ScenaCiak(codScena)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	PRIMARY KEY(codO, codScena)
	);

CREATE TABLE if not exists Ditta(
	P_IVA_DITTA varchar(11) Primary Key,
	nome varchar(41) NOT NULL,
	codInd INT NOT NULL,
	FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
	ON DELETE CASCADE
	ON UPDATE NO ACTION	
	);

CREATE TABLE if not exists Acquisto(
	idAcquisto int(8) Primary Key,
	data date NOT NULL,
	prezzoTotale float(8) NOT NULL,
	P_IVA_DITTA varchar(11) NOT NULL,
	FOREIGN KEY (P_IVA_DITTA) REFERENCES Ditta(P_IVA_DITTA)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	);

CREATE TABLE if not exists AcquistoCostume(
	codC INT NOT NULL,
	FOREIGN KEY (codC) REFERENCES Costume(codC)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	idAcquisto INT NOT NULL,
	FOREIGN KEY (idAcquisto) REFERENCES Acquisto(idAcquisto) 
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	prezzo float(8) NOT NULL,
	PRIMARY KEY(codC, idAcquisto)
	);

CREATE TABLE if not exists AcquistoCostume(
	codO INT NOT NULL,
	FOREIGN KEY (codO) REFERENCES OggettiDiScena(codO)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	idAcquisto INT NOT NULL,
	FOREIGN KEY (idAcquisto) REFERENCES Acquisto(idAcquisto)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
	prezzo float(8) NOT NULL,
	PRIMARY KEY(codO, idAcquisto)
	);

```

# Special thanks 
-------

[generatore di indirizzi random](https://randommer.io/random-address)

[generatore di IBAN random](http://randomiban.com/?country=UK)

[generatore di numeri telefono random](https://randommer.io/Phone)

[generatore di P.IVA random](https://strumentidev.it/partita-iva/random/result)

## possibili query per noi
 - query sullo stipendio per i membri della troupe 
 - query di aggiornamento del fondo con nuovi finanziatori/sponsor
 - selezionare tutti i lavoratori che hanno contribuito ad un film (DONE)
 - calcolo percentuale contribuito caporegista e regista
 - calcolo trattenute sede territoriale 
 - query che elenca oggetti acquistati "in magazzino" 
 - query che elenca i luoghi in cui sono state girate le scene
 - Verifica Costumi da usare per scena da un attore
 - Verifica oggetti da usare per scena
 - Incasso settimanale totale di un film
 - Spese mensili totali
 - Fatturato Annuo
 - Miglior film per incassi annuo
 - Stipendio netto percepito da un dipendente
 - Controllo scena da riprendere in giornata
 - Controllo dipendenti da richiamare per scena
 - /* l'applicativo deve quindi anche poter ordinare gli oggetti e i costumi temporalmente utilizzati nelle riprese*/ 

