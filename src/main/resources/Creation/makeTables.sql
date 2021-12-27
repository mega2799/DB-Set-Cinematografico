-- TODO incollare questo file alla fine nella relazione dopo aver ucciso i todo, me compreso :^ (

-- TODO inserire controllo len nei cod identificativi di wntita varie
CREATE TABLE if not exists Indirizzo(
    codInd int primary key,
    citta varchar(21) NOT NULL,
    via varchar(40) NOT NULL,
    civico int NOT NULL,
    CAP int NOT NULL check(length(CAP) = 5)
    );

CREATE TABLE IF NOT EXISTS  Enti(
  P_IVA varchar(11) NOT NULL,
  nome varchar(40) NOT NULL,
  codInd INT NOT NULL,
  FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  PRIMARY KEY(P_IVA)
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
    percentualeContributo float(3) check(percentualeContributo between 0  and 100)
);

CREATE TABLE if not exists BustaPaga(
    codB INT,
    retribuzioneOraria float NOT NULL,
    oreLavorate float NOT NULL,
    mese varchar(30) CHECK (mese in ('gennaio', 'febbraio', 'marzo', 'aprile', 'maggio', 'giugno', 'luglio', 'agosto', 'settembre', 'ottobre', 'novembre', 'dicembre')),
    primary key(codB)
);

CREATE TABLE if not exists Retribuzione(
    CF varchar(12),
    FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    codB INT,
    FOREIGN KEY (codB) REFERENCES BustaPaga(codB)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
    PRIMARY KEY(CF, codB)
);

-- TODO aggiornare ER con le due tabelle qui sotto

CREATE TABLE IF NOT EXISTS Ruolo(
    nomeRuolo varchar(41) Primary KEY
);

CREATE TABLE IF NOT EXISTS RuoloMembroTroupe(
    CF varchar(12),
    FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
           ON DELETE CASCADE
           ON UPDATE NO ACTION,
    nomeRuolo varchar(41),
    FOREIGN KEY (nomeRuolo) REFERENCES Ruolo(nomeRuolo)
           ON DELETE CASCADE
           ON UPDATE NO ACTION,
     PRIMARY KEY(CF, nomeRuolo)
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
  codF int NOT NULL AUTO_INCREMENT,
  titolo varchar(51) NOT NULL,
  genere varchar(40) NOT NULL CHECK (genere = 'Animazione' or genere = 'Avventura' or genere = 'Azione' or genere = 'Biografico' or genere = 'Commedia' or genere = 'Documentario' or genere = 'Drammatico' or genere = 'Pornografico' or genere = 'Fantascienza' or genere = 'Fantasy' or genere = 'Guerra' or genere = 'Horror' or genere = 'Musical' or genere = 'Storico' or genere = 'Thriller' or genere = 'Western'),
  durata int NOT NULL CHECK (durata > 0),
  dataUscita date DEFAULT NULL,
  idSerie varchar(11),
  FOREIGN KEY (idSerie) REFERENCES SerieLetteraria(idSerie)
  ON DELETE CASCADE
  ON UPDATE NO ACTION,
  PRIMARY KEY (codF)
);

-- TODO il nome non coincide su gituhb
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


CREATE TABLE if NOT EXISTS Incasso(
    dataInizio date NOT NULL,
    dataFine date NOT NULL,
    incasso int(11),
    codF INT NOT NULL,
    FOREIGN KEY (codF) REFERENCES Film(codF)
       ON DELETE CASCADE
       ON UPDATE NO ACTION,
    codInd INT NOT NULL,
    FOREIGN KEY (codInd) REFERENCES SediTerritoriali(codInd)
       ON DELETE CASCADE
       ON UPDATE NO ACTION,
    PRIMARY KEY(dataInizio, dataFine, incasso)
);

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
    codFondo INT primary key,
    dataAccredito date NOT NULL,
    patrimonio float(14) NOT NULL CHECK(patrimonio >= 0),
    P_IVA_SPONSOR varchar(11),
    FOREIGN KEY (P_IVA_SPONSOR) REFERENCES Sponsor(P_IVA_SPONSOR)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    P_IVA_FINANZIATORE varchar(11),
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

-- TODO la questione supervisore andrebbe anche risolta
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
        -- TODO HO CAMBIATO GLI ATTRIBUTI dataInizio e Fine, trovare un sostituto valido e cambiare il resto nell ER e relazione....
        --scommentando le date non da errore la query, mahhh .....
        codScena int primary key,
        noteDiProduzione varchar(255),
        rullo int NOT NULL,
        numRiprese int NOT NULL,
        -- dataInizio date,
        -- dataFine date, -- CHECK(dataFine >= dataInizio),

        -- sostituiro le date con il numero di ore
        durataOre float NOT NULL,
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
        numMagazzino int Primary Key,
        codInd INT NOT NULL,
        FOREIGN KEY (codInd) REFERENCES Indirizzo(codInd)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        );

CREATE TABLE if not exists PosizioneMagazzino(
        codP int,
        numMagazzino INT NOT NULL,
        scaffale int NOT NULL,
        percorso varchar(1) NOT NULL,
        PRIMARY KEY (codP, numMagazzino),
        FOREIGN KEY (numMagazzino) REFERENCES Magazzino(numMagazzino)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        );

CREATE TABLE if not exists Costume(
        codC int Primary Key,
        tipo varchar(12) NOT NULL CHECK(tipo='epoca' OR tipo='contemporaneo' OR tipo='fantasia'),
        descrizione varchar(255) NOT NULL,
        CF varchar(12) NOT NULL,
        FOREIGN KEY (CF) REFERENCES MembroTroupe(CF)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
        codP INT NOT NULL,
--        FOREIGN KEY (codP) REFERENCES PosizioneMagazzino(codP)
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
        codO int Primary key,
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
        idAcquisto int Primary Key,
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

CREATE TABLE if not exists AcquistoOggetto(
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