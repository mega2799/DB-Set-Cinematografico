INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES(00001, 'Star Wars: Episodio VI - Il ritorno dello Jedi','fantascienza', 134, '1983/05/25'  , NULL) ;

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	-- casa di george lucas
VALUES (24673, 'nicasio', 'lucas valley rid', 5858, 94946),
    -- casa regista
        (38734, 'cardiff', 'st angel str', 89, 15234),
    -- Mark Hamill
        (37065, 'north malvinafurt', 'ryan turnpike', 198, 56893),
    -- 	David Prowse aka Darth Vader
        (29438, 'Larsonside', 'Grimes Ferry', 4803, 70476),
    -- 	Alec Guinnes  aka Obi wan
        (18692, 'Felipeport', 'Nicolas Branch Suite 189', 78261, 97077),
    -- Harry Ford
        (19639, 'lake khalidside', 'heidenreich ways', 338, 81079),
    -- Carrie Fisher
        (19447, 'south erictown', 'dereck hill', 473, 89559),
    -- sede dell UCI
        (18302, 'Milano', 'Corso Semprione', 39, 20145),
    -- sede territoriale uci savignano
        (16395, 'savignano', 'Piazza Metropolis', 18, 47039),
    -- indirizzo finanziatore michel barnaby
        (49429, 'New Henderson', 'Gislason Ridge', 605, 47614),
    -- indirizzo starbucks
        (15293, 'Vermont', 'Jayden Villages', 3444, 54808 ),
    -- indirizzo aiuto regista
        (17349, 'Arielleport', 'Ashton Tunnel', 645, 48937),
    -- indirizzo capo regista
        (19834, 'North Christellemouth', 'Keagan Circles', 6, 35637),
    -- indirizzo Stilista
        (17439, 'Maine', 'McDermott Manors', 339, 33812),
    -- indirizzo Operatore fonico
        (19900, 'Indiana', 'Brayan Square', 672, 14329),
    -- indirizzo Operatore fotografico
        (12346, 'Lake Nyahmouth', 'McGlynn Brooks', 418, 70444),
    -- indirizzo Magazzino
        (19341, 'South Veronafurt', 'Alejandra Ports', 658, 28270),
    -- indirizzo Studio simulazione Navi spaziali
        (74921, 'Devyn Tromp', ' Aditya Lakes Apt. 670', 742, 74921),
    -- indirizzo Sky forge ditta crea modelli spasa laser
        (16378,'Caverzere','Armando Diaz',1,30014),
    -- indirizzo etsy
        (13859,'New York', 'Adams Street', 117, 11201),
    -- indirizzo star wars industries
        (16957, 'New York', 'Empire State', 23, 34534);




INSERT IGNORE INTO Ruolo(nomeRuolo) VALUES ('sceneggiatore'),
										   ('produttore'),
                                           ('produttore esecutivo'),
										   ('aiuto regista'),
									       ('capo regista'),
                                           ('regista'),
										   ('attore'),
										   ('stilista'),
										   ('operatore fonico'),
										   ('operatore fotografico');

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- produttore esecutivo George Lucas
	VALUES ('GRGLCS14ES44', 'George', 'Lucas', 'GB98BARC20040156884556',
				'1944/05/14', '516-527-8719', 24673, 1.0),
	-- regista
        ('RCHMRQ22IS37', 'Richard', 'Marquand', 'GB98BARC20035361814589',
    			'1937/12/22', '205-802-5689', 38734, .47),
	-- Luke Skywalker
    	('MRKHML25IS51', 'Mark', 'Hamill', 'GB56BARC20038438638758',
    			'1951/09/25', '214-989-5138', 37065, NULL),
    -- Darth Vader
    	('DVDPRW01GS32', 'David', 'Prose', '49371118',
    			'1932/07/01', '469-918-8933', 29438, NULL),
    -- Obi wan
    	('ALCGNS02DS14', 'Alec', 'Guinness', '49371118',
    			'1914/04/02', '449-6009-3795', 18692, NULL),
    -- Ian solo
    	('HRSFRD13GS42', 'Harrison', 'Ford', 'GB25BARC20039569987273',
    			'1942-07-13', '205-944-3057', 19639, NULL),
    -- Leila Skywalker
    	('CRRFSH21NS56','Carrie', 'Fisher', 'GB20BARC20031835638431',
    			'1956-12-21', '231-687-4750', 19447, NULL),
    	-- Aiuto regista
    	('GLBTLY12DS14','Gilbert', 'Taylor', 'GB77BARC20038424775819',
    			'1914-04-12', '582-583-2011', 17349, 0.8),
    -- Stilista
    	('JNTSTYD27S39','Jonathan', 'Style', 'GB44BARC20031817174534',
    			'1939-04-27', '623-988-4632', 17439, NULL),
    -- Operatore Fonico
	    ('KVNMCGE03S18','Kevin', 'McGrail', 'GB44BARC20031817137209',
				'1918-05-03', '724-829-1163', 19900, NULL),
    -- Operatore fotografico
    	('DVDCLLOE03S18','David', 'Chiello', 'GB44BARC20031817137209',
    			'1918-05-03', '724-829-1163', 12346, NUlL),
    -- Capo regista
    	('ANWJRGA24S33','Andrew', 'Jorge', 'GB13BARC20038029125126',
    			'1933-01-24', '342-112-5431', 19834, NULL);

INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo)
    VALUES ('GRGLCS14ES44', 'Produttore Esecutivo'),
           ('GRGLCS14ES44', 'Sceneggiatore'),
           ('GRGLCS14ES44', 'Produttore'),

           ('RCHMRQ22IS37', 'Regista'),
           ('MRKHML25IS51', 'Attore'),
           ('DVDPRW01GS32', 'Attore'),
           ('ALCGNS02DS14', 'Attore'),
           ('HRSFRD13GS42', 'Attore'),
           ('CRRFSH21NS56', 'Attore'),
           ('GLBTLY12DS14', 'Aiuto Regista'),
           ('ANWJRGA24S33', 'Capo Regista'),
           ('JNTSTYD27S39', 'Stilista'),
           ('KVNMCGE03S18', 'Operatore Fonico'),
           ('DVDCLLOE03S18', 'Operatore Fotografico');


INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- George lucas
    VALUES (1, 'GRGLCS14ES44'),
    -- regista
    (1, 'RCHMRQ22IS37'),
    -- luke
    (1, 'MRKHML25IS51'),
    -- Darth
    (1, 'DVDPRW01GS32'),
    -- Obi wan
    (1, 'ALCGNS02DS14'),
     -- ian
    (1, 'HRSFRD13GS42'),
    -- leila
    (1, 'CRRFSH21NS56'),
    -- Aiuto regista
    (1, 'GLBTLY12DS14'),
    -- capo regista
    (1, 'ANWJRGA24S33'),
    -- stilista
    (1, 'JNTSTYD27S39'),
    -- operatore fonico
    (1, 'KVNMCGE03S18'),
    -- operatore fotografico
    (1, 'DVDCLLOE03S18');

-- TODO cambiare enti-sediTerritoriali su README.md

INSERT IGNORE INTO Enti(P_IVA,nome,codInd)
    -- ente di distribuizone
    VALUES (40365320379, "UCI Milano", 18302);

INSERT IGNORE INTO SediTerritoriali(P_IVA, codInd)
    VALUES (40365320379, 16395);

INSERT IGNORE INTO SerieLetteraria(idSerie, titolo, genere , CF)
    -- serie letteraria scritta da george lucas
    VALUES ( 'MRVCMCSW', 'Star Wars-Marvel Comic', 'Sci-fi', 'GRGLCS14ES44');

INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome)
    -- MC
    VALUES('21708660770', 'McDonald SPA'),
    -- Porsche
    ('77072550757', 'Porsche'),
    -- Bose
    ('29218600871', 'Bose'),
    -- Samsung
    ('53179880082', 'Samsung Galaxy');

INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno)
    -- Finanziatore 1
    VALUES('31562270996', 'Micheal Barnaby', 49429, 1.8),
    -- La starbucks che investe in starWars !
    ('40211260761', 'Starbucks',  15293 , 0.19);

INSERT IGNORE INTO Magazzino(numMagazzino, codInd)
    -- magazzino principale
    VALUES(1,19341);

INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso)
    -- Posizione costume luke skywalker
        VALUES(25588, 1, 2, 'S'),
    -- Posizione costume Darth
        (25298, 1, 6, 'D'),
     -- Posizione costume leila
        (25252, 1, 41, 'S'),
    -- Posizione costume han solo
        (84425, 1, 7, 'N'),
    -- Posizione costume obi wan
        (74120, 1, 88, 'O'),
    -- Posizione spada blu
        (81401, 1, 11, 'B'),
    -- Posizione spada Rossa
        (91241, 1, 2, 'P');

INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP)
    -- costume Luke
    VALUES(49262 ,'fantasia','Costume di Luke Skywalker, kimono nero, stivali, spada Laser Blu','MRKHML25IS51', 25588),

    -- costume Darth vader
    (55124 ,'fantasia','Costume di Darth Vader, Maschera, Spada Rossa, Mantello','DVDPRW01GS32', 25298),

    -- costume Leila
    (53921 ,'fantasia','Costume di Leila, bikini Jabba the Hat','CRRFSH21NS56', 25252),
    -- costume   Han Solo
    (47429 ,'fantasia','Costume di Han Solo, piastra di metallo, pistola, giubboto','HRSFRD13GS42', 84425),
    -- costume Obi Wan
    (41231 ,'fantasia','Costume di Obi Wan, Sudario Jedi,  spada blu','ALCGNS02DS14', 74120);


INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd)
    -- incasssi savignano, primo mese
VALUES ('1977-10-21', '1977-10-28', 53011203, 1, 16395),
       ('1977-10-29', '1977-11-04', 46284614, 1, 16395),
       ('1977-11-05', '1977-11-12', 27595582, 1, 16395),
       ('1977-11-13', '1977-11-20', 36983558, 1, 16395);

INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE,codF)
    -- george lucas ha contribuito al fondo
VALUES (1, '1977-01-05', 2000000, '53179880082', null, 1);


INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF)
-- scena
VALUES (00456, 'Scena in cui luke skywalker salva la principessa leila dalle grinfie di Dart Vader', 4, 5, 2, 200, 1),
    (04745, 'Scena in cui luke skywalker distrugge la morte nera', 15, 1, .5, 200, 1),
    (03245, 'Scena in cui luke skywalker assiste alla morte di obi wan', 11, 7, 4, 200, 1),
    (00789, 'Scena in cui luke skywalker guida il millenium falcon con Ian solo', 5, 5, 3, 200, 1);

INSERT IGNORE INTO MembroTroupeScena(codScena ,CF)
    -- personaggi presenti in scena ???
VALUES (00456,'CRRFSH21NS56'), (00456,'MRKHML25IS51'), (00456, 'DVDPRW01GS32'),
       (00789,'MRKHML25IS51'), (00789, 'HRSFRD13GS42'),
       (04745,'MRKHML25IS51'), (04745, 'DVDPRW01GS32'),
       (03245,'MRKHML25IS51'), (03245, 'DVDPRW01GS32'), (03245, 'ALCGNS02DS14');

INSERT IGNORE INTO CostumeScena(codC, codScena)
    -- han solo 47429
    -- luke 49262
    -- leila 53921
    -- darth 55124
    VALUES (53921, 00456), (49262, 00456), (55124, 00456),
           (49262, 00789), (47429, 00789),
           (49262, 04745), (55124, 04745),
           (49262, 03245), (55124, 03245), (41231, 03245);

INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP)
    VALUES (402, 'armi', 'Spada blu Di anakin', 81401),
           (66, 'armi', 'Spada rossa Darth vader', 91241),
           (55, 'armi','Fucile Blaster E-5', 25588),
           (23, 'armi', 'Cannone blaster rotante Z-6', 25588);

INSERT IGNORE INTO OggettoScena(codO,codScena)
VALUES (402,00456), (66,00456), (402,03245), (66,03245),
        (55, 00456), (23, 00456);

INSERT IGNORE INTO Ditta(P_IVA_DITTA, nome, codInd)
VALUES (04502240270, 'Skyforge Sabers', 16378),
       (06363391001, 'Etsy', 13859),
       (03453323434,'Star Wars Industries',16957);

INSERT IGNORE INTO Acquisto(idAcquisto, data, prezzoTotale, P_IVA_DITTA)
VALUES (1,'1977-07-07', 200, 04502240270),
       (2,'1977-07-10', 100, 06363391001),
       (3,'1977-05-12', 1050, 03453323434);

INSERT IGNORE INTO AcquistoOggetto(codO, idAcquisto, prezzo)
VALUES (402, 1, 100), (66,1,100), (55,2,35), (23,2,65);

INSERT IGNORE INTO AcquistoCostume(codC, idAcquisto, prezzo)
VALUES (49262, 3, 200), (53921,3,200), (55124,3,250), (47429,3,200), (41231,3,200);


-- Le riprese sono iniziate il 22 marzo 1976 e finirono il 16 luglio 1976
-- 116 giorni - 32 sabato/domeniche = 84 giorni di lavoro "puro"

INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese)
    -- luke skywalker
    VALUES (12301, 32, 124.2, 'marzo'),
    (47918, 32, 111.2, 'aprile'),
    (09581, 32, 102.2, 'maggio'),
    (05982, 32, 141.2, 'giugno'),
    (41012, 32, 199.2, 'luglio'),
    -- ian solo
    (65481, 77, 153.2, 'aprile'),
    (96848, 77, 101.4, 'maggio'),
    (98431, 77, 169.2, 'luglio'),
    -- darth vader
    (68481, 15, 89.3, 'marzo'),
    (98741, 15, 14.8, 'luglio');

INSERT IGNORE INTO Retribuzione(CF, CodB) 
    -- luke
    VALUES  ('MRKHML25IS51', 47918),
            ('MRKHML25IS51', 09581),
            ('MRKHML25IS51', 05982),
            ('MRKHML25IS51', 41012),
    -- ian solo
            ('HRSFRD13GS42', 65481), 
            ('HRSFRD13GS42', 96848),
            ('HRSFRD13GS42', 98431),
    -- darth vader
            ('DVDPRW01GS32', 68481),
            ('DVDPRW01GS32', 98741);

-- FAKEEEEEEEE


INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES(00002, 'Il signore degli anelli, la compagnia dell anello','fantascienza', 134, '1983/05/25'  , NULL) ;
INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES
(44514, 'Monica veneto', 'Via Beatrice', '4', 83511),
(46659, 'Borgo Salvi', 'Canale Coppola', '60', 89514),
(82128, 'Barillaro veneto', 'Viale Sinisi', '15', 41792),
(45409, 'Squarcione umbro', 'Rotonda Sinisi', '229', 62752),
(80848, 'Settimo Napoleone laziale', 'Canale Tonia', '6', 61373),
(11639, 'Borgo Caterina sardo', 'Strada Sergius', '877', 61974),
(35021, 'Sandra a mare', 'Contrada Giuliana', '20', 75600),
(67824, 'Lercari sardo', 'Canale Torquato', '334', 55810),
(98966, 'Gianluca del friuli', 'Piazza Leonardo', '07', 33836),
(63446, 'Quarto Rosalia a mare', 'Viale Sanudo', '259', 7383),
(59295, "Balbi nell'emilia", 'Stretto Amanda', '544', 72192),
(56357, 'San Gian', 'Piazza Pellegrini', '913', 60529),
(90585, 'Quarto Raffaellino', 'Via Jacopo', '064', 41689),
(19601, 'Sesto Vincenza sardo', 'Stretto Lancisi', '83', 61750),
(52494, 'Corradi terme', 'Rotonda Martino', '244', 93949),
(46528, "Quarto Lolita nell'emilia", 'Strada Maura', '83', 83419),
(56947, 'Sesto Geronimo veneto', 'Via Tomei', '89', 68393),
(12686, 'Sesto Pier', 'Vicolo Raurica', '93', 57172),
(78322, 'Fantozzi veneto', 'Borgo Caccianemico', '786', 75564),
(89876, 'Borgo Silvestro', 'Contrada Caboto', '33', 97168),
(45924, 'Camanni ligure', 'Incrocio Cilibrasi', '9', 1396),
(33495, 'Sesto Livio', 'Canale Magrassi', '4', 58114),
(30807, 'Giunti umbro', 'Viale Franzese', '146', 17895);
INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES
('BRNZGL22L01L219H', 'Branciforte', 'Azeglio', 'IT09F4985356223143588143917', '2022-01-07', '+39 512 6145291', 44514),
('FBNLNE21T26L219O', 'Fibonacci', 'Eliana', 'IT06A7010074406711517951541', '2021-12-26', '+39 9607 11321446', 46659),
('PRGMHL22H01L219H', 'Praga', 'Michela', 'IT15L7240140756942373692992', '2022-01-06', '+39 157 18606710', 82128),
('CSTMSM21T31L219E', 'Castioni', 'Massimiliano', 'IT10Y1982904363987326211133', '2021-12-31', '+39 5630 92752943', 45409),
('LCCPCC21T23L219W', 'Lucciano', 'Puccio', 'IT57I4723913479402438744572', '2021-12-23', '+39 67 56134064', 80848),
('TTNRST21T19L219Z', 'Ottino', 'Ernesto', 'IT27C9767116896518372514160', '2021-12-19', '+39 662 0564865', 11639),
('BRCTTV21T25L219T', 'Barcella', 'Ottavio', 'IT80K6634386391693430728848', '2021-12-25', '+39 217 54460048', 35021),
('GLLLCU22A01L219I', 'Galilei', 'Lucia', 'IT86E1108005838331549351885', '2022-01-01', '+39 71 16097681', 67824),
('FSNSDR21T28L219Q', 'Fusani', 'Sandro', 'IT46I5020345359580510819598', '2021-12-28', '+39 86 0908769', 98966),
('DLLFNN21T27L219H', 'Dellucci', 'Fernanda', 'IT68I2045079426455002959631', '2021-12-27', '+39 251 68951965', 63446),
('MLNSGS22M01L219H', 'Malenchini', 'Sergius', 'IT73F5921000291847032903177', '2022-01-08', '+39 366 5240540', 59295),
('SPNCLL22A13L219O', 'Spinola', 'Camilla', 'IT85Q8071148262445277851792', '2022-01-13', '+39 9726 6799237', 56357),
('MCHGCM22P01L219E', 'Michelangeli', 'Giacomo', 'IT33G0089164624795007998880', '2022-01-09', '+39 3871 94541736', 90585),
('GNTNCL21T18L219T', 'Gianetti', 'Nicola', 'IT35B9014580644268559204525', '2021-12-18', '+39 554 90 48 9295', 19601),
('GRTMRT22S01L219M', 'Guarato', 'Marta', 'IT49S0173209072424560562830', '2022-01-11', '+39 87 1031837', 52494),
('RSTFLV22A01L219M', 'Rastelli', 'Fulvio', 'IT03L7988323375202051288834', '2022-01-01', '+39 8935 4016920', 46528),
('MNLSDR22S01L219E', 'Manolesso', 'Sandra', 'IT23H3694556991562040686576', '2022-01-11', '+39 9195 9235295', 56947),
('RSSSST21T26L219G', 'Rossi', 'Sebastiano', 'IT53W6607969071802520410680', '2021-12-26', '+39 846 7975184', 12686),
('CMCCHR21T23L219V', 'Camicione', 'Chiara', 'IT97Q9121022108743378092829', '2021-12-23', '+39 2853 41429362', 78322);
INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES
('BRNZGL22L01L219H', 'operatore fonico'),
('FBNLNE21T26L219O', 'capo regista'),
('PRGMHL22H01L219H', 'regista'),
('CSTMSM21T31L219E', 'operatore fotografico'),
('LCCPCC21T23L219W', 'produttore esecutivo'),
('TTNRST21T19L219Z', 'stilista'),
('BRCTTV21T25L219T', 'capo regista'),
('GLLLCU22A01L219I', 'capo regista'),
('FSNSDR21T28L219Q', 'regista'),
('DLLFNN21T27L219H', 'stilista'),
('MLNSGS22M01L219H', 'operatore fotografico'),
('SPNCLL22A13L219O', 'aiuto regista'),
('MCHGCM22P01L219E', 'stilista'),
('GNTNCL21T18L219T', 'sceneggiatore'),
('GRTMRT22S01L219M', 'operatore fonico'),
('RSTFLV22A01L219M', 'aiuto regista'),
('MNLSDR22S01L219E', 'attore'),
('RSSSST21T26L219G', 'aiuto regista'),
('CMCCHR21T23L219V', 'stilista');
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES
(2, 'BRNZGL22L01L219H'),
(2, 'FBNLNE21T26L219O'),
(2, 'PRGMHL22H01L219H'),
(2, 'CSTMSM21T31L219E'),
(2, 'LCCPCC21T23L219W'),
(2, 'TTNRST21T19L219Z'),
(2, 'BRCTTV21T25L219T'),
(2, 'GLLLCU22A01L219I'),
(2, 'FSNSDR21T28L219Q'),
(2, 'DLLFNN21T27L219H'),
(2, 'MLNSGS22M01L219H'),
(2, 'SPNCLL22A13L219O'),
(2, 'MCHGCM22P01L219E'),
(2, 'GNTNCL21T18L219T'),
(2, 'GRTMRT22S01L219M'),
(2, 'RSTFLV22A01L219M'),
(2, 'MNLSDR22S01L219E'),
(2, 'RSSSST21T26L219G'),
(2, 'CMCCHR21T23L219V');
INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES
 (82580, 'Scena n. 0', 24, 803, 854, 56, 2),
 (81142, 'Scena n. 1', 79, 227, 229, 68, 2),
 (68073, 'Scena n. 2', 83, 989, 636, 30, 2),
 (46555, 'Scena n. 3', 36, 142, 473, 85, 2),
 (77395, 'Scena n. 4', 54, 192, 932, 21, 2),
 (81013, 'Scena n. 5', 79, 231, 451, 18, 2),
 (78357, 'Scena n. 6', 70, 317, 647, 16, 2),
 (33144, 'Scena n. 7', 62, 431, 262, 47, 2),
 (93109, 'Scena n. 8', 19, 578, 301, 97, 2),
 (38557, 'Scena n. 9', 48, 158, 635, 96, 2),
 (48704, 'Scena n. 10', 54, 511, 796, 92, 2),
 (48230, 'Scena n. 11', 48, 927, 940, 52, 2),
 (44407, 'Scena n. 12', 67, 784, 837, 64, 2),
 (58313, 'Scena n. 13', 26, 545, 237, 91, 2),
 (81854, 'Scena n. 14', 91, 944, 214, 65, 2),
 (60590, 'Scena n. 15', 69, 801, 193, 42, 2),
 (85902, 'Scena n. 16', 62, 816, 645, 51, 2),
 (61110, 'Scena n. 17', 95, 727, 320, 48, 2),
 (35181, 'Scena n. 18', 15, 632, 545, 74, 2);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES
(82580, 'MCHGCM22P01L219E'),
(82580, 'GNTNCL21T18L219T'),
(82580, 'FSNSDR21T28L219Q'),
(82580, 'GLLLCU22A01L219I'),
(81142, 'BRCTTV21T25L219T'),
(81142, 'GNTNCL21T18L219T'),
(81142, 'PRGMHL22H01L219H'),
(81142, 'MLNSGS22M01L219H'),
(68073, 'DLLFNN21T27L219H'),
(68073, 'PRGMHL22H01L219H'),
(68073, 'MCHGCM22P01L219E'),
(68073, 'CSTMSM21T31L219E'),
(46555, 'FSNSDR21T28L219Q'),
(46555, 'MCHGCM22P01L219E'),
(46555, 'DLLFNN21T27L219H'),
(46555, 'BRNZGL22L01L219H'),
(77395, 'SPNCLL22A13L219O'),
(77395, 'CMCCHR21T23L219V'),
(77395, 'GNTNCL21T18L219T'),
(77395, 'RSTFLV22A01L219M'),
(81013, 'BRNZGL22L01L219H'),
(81013, 'FBNLNE21T26L219O'),
(81013, 'MLNSGS22M01L219H'),
(81013, 'TTNRST21T19L219Z'),
(78357, 'MLNSGS22M01L219H'),
(78357, 'FSNSDR21T28L219Q'),
(78357, 'FBNLNE21T26L219O'),
(78357, 'GLLLCU22A01L219I'),
(33144, 'BRNZGL22L01L219H'),
(33144, 'FBNLNE21T26L219O'),
(33144, 'GNTNCL21T18L219T'),
(33144, 'DLLFNN21T27L219H'),
(93109, 'LCCPCC21T23L219W'),
(93109, 'TTNRST21T19L219Z'),
(93109, 'LCCPCC21T23L219W'),
(93109, 'CSTMSM21T31L219E'),
(38557, 'CSTMSM21T31L219E'),
(38557, 'GLLLCU22A01L219I'),
(38557, 'GLLLCU22A01L219I'),
(38557, 'SPNCLL22A13L219O'),
(48704, 'GNTNCL21T18L219T'),
(48704, 'RSTFLV22A01L219M'),
(48704, 'DLLFNN21T27L219H'),
(48704, 'GLLLCU22A01L219I'),
(48230, 'DLLFNN21T27L219H'),
(48230, 'MCHGCM22P01L219E'),
(48230, 'LCCPCC21T23L219W'),
(48230, 'MLNSGS22M01L219H'),
(44407, 'MNLSDR22S01L219E'),
(44407, 'SPNCLL22A13L219O'),
(44407, 'TTNRST21T19L219Z'),
(44407, 'MLNSGS22M01L219H'),
(58313, 'MCHGCM22P01L219E'),
(58313, 'MNLSDR22S01L219E'),
(58313, 'BRNZGL22L01L219H'),
(58313, 'GLLLCU22A01L219I'),
(81854, 'TTNRST21T19L219Z'),
(81854, 'SPNCLL22A13L219O'),
(81854, 'FBNLNE21T26L219O'),
(81854, 'MCHGCM22P01L219E'),
(60590, 'RSSSST21T26L219G'),
(60590, 'RSSSST21T26L219G'),
(60590, 'MNLSDR22S01L219E'),
(60590, 'BRCTTV21T25L219T'),
(85902, 'FSNSDR21T28L219Q'),
(85902, 'SPNCLL22A13L219O'),
(85902, 'BRCTTV21T25L219T'),
(85902, 'TTNRST21T19L219Z'),
(61110, 'BRCTTV21T25L219T'),
(61110, 'MCHGCM22P01L219E'),
(61110, 'DLLFNN21T27L219H'),
(61110, 'PRGMHL22H01L219H'),
(35181, 'BRCTTV21T25L219T'),
(35181, 'MNLSDR22S01L219E'),
(35181, 'RSTFLV22A01L219M'),
(35181, 'SPNCLL22A13L219O');
INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES
('IT75Q6285864334549302646818', 'Wells Fargo');
INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES
 ('IT28P2382372167241374876255', 'Intel', 89876, 0.5977782123807523),
 ('IT72A5192993187389562420049', 'Adobe', 45924, 0.9983145706605355),
 ('IT85D8480723018259764571146', 'Verizon', 33495, 0.7078305796488082),
 ('IT80I4835146438187680793356', 'PepsiCo', 30807, 0.46855177220529853);

 INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd) VALUES
  ('2015-05-27', '2015-06-03', 688908, 2, 16395),
  ('2015-06-03', '2015-06-10', 210940, 2, 16395),
  ('2015-06-10', '2015-06-17', 483898, 2, 16395),
  ('2015-06-17', '2015-06-24', 764049, 2, 16395),
  ('2015-06-24', '2015-07-01', 150878, 2, 16395),
  ('2015-07-01', '2015-07-08', 548733, 2, 16395),
  ('2015-07-08', '2015-07-15', 125916, 2, 16395),
  ('2015-07-15', '2015-07-22', 940596, 2, 16395);

INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES
 (37670, '2010-10-01', 484820, null, 'IT28P2382372167241374876255', 2),
 (38896, '1991-09-07', 418712, null, 'IT72A5192993187389562420049', 2),
 (96138, '1978-07-02', 314866, null, 'IT85D8480723018259764571146', 2),
 (72942, '1984-04-04', 309383, null, 'IT80I4835146438187680793356', 2);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES
 (93679, '2009-03-16', 426649, 'IT75Q6285864334549302646818', null, 2);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES
 (82580, 'FSNSDR21T28L219Q'),
 (82580, 'MNLSDR22S01L219E'),
 (82580, 'MCHGCM22P01L219E'),
 (82580, 'FSNSDR21T28L219Q'),
 (82580, 'GLLLCU22A01L219I'),
 (81142, 'CMCCHR21T23L219V'),
 (81142, 'RSSSST21T26L219G'),
 (81142, 'DLLFNN21T27L219H'),
 (81142, 'MNLSDR22S01L219E'),
 (81142, 'FSNSDR21T28L219Q'),
 (68073, 'LCCPCC21T23L219W'),
 (68073, 'TTNRST21T19L219Z'),
 (68073, 'BRNZGL22L01L219H'),
 (68073, 'BRCTTV21T25L219T'),
 (68073, 'LCCPCC21T23L219W'),
 (46555, 'LCCPCC21T23L219W'),
 (46555, 'CMCCHR21T23L219V'),
 (46555, 'DLLFNN21T27L219H'),
 (46555, 'BRCTTV21T25L219T'),
 (46555, 'MLNSGS22M01L219H'),
 (77395, 'SPNCLL22A13L219O'),
 (77395, 'BRCTTV21T25L219T'),
 (77395, 'RSSSST21T26L219G'),
 (77395, 'CSTMSM21T31L219E'),
 (77395, 'CSTMSM21T31L219E'),
 (81013, 'BRNZGL22L01L219H'),
 (81013, 'SPNCLL22A13L219O'),
 (81013, 'BRCTTV21T25L219T'),
 (81013, 'PRGMHL22H01L219H'),
 (81013, 'FSNSDR21T28L219Q'),
 (78357, 'LCCPCC21T23L219W'),
 (78357, 'PRGMHL22H01L219H'),
 (78357, 'BRCTTV21T25L219T'),
 (78357, 'DLLFNN21T27L219H'),
 (78357, 'DLLFNN21T27L219H'),
 (33144, 'MLNSGS22M01L219H'),
 (33144, 'RSTFLV22A01L219M'),
 (33144, 'GNTNCL21T18L219T'),
 (33144, 'MNLSDR22S01L219E'),
 (33144, 'GLLLCU22A01L219I'),
 (93109, 'MNLSDR22S01L219E'),
 (93109, 'MLNSGS22M01L219H'),
 (93109, 'CMCCHR21T23L219V'),
 (93109, 'FBNLNE21T26L219O'),
 (93109, 'CSTMSM21T31L219E'),
 (38557, 'MLNSGS22M01L219H'),
 (38557, 'FBNLNE21T26L219O'),
 (38557, 'RSSSST21T26L219G'),
 (38557, 'LCCPCC21T23L219W'),
 (38557, 'BRCTTV21T25L219T'),
 (48704, 'CMCCHR21T23L219V'),
 (48704, 'BRNZGL22L01L219H'),
 (48704, 'MNLSDR22S01L219E'),
 (48704, 'BRCTTV21T25L219T'),
 (48704, 'GLLLCU22A01L219I'),
 (48230, 'RSTFLV22A01L219M'),
 (48230, 'FSNSDR21T28L219Q'),
 (48230, 'GLLLCU22A01L219I'),
 (48230, 'CSTMSM21T31L219E'),
 (48230, 'DLLFNN21T27L219H'),
 (44407, 'GRTMRT22S01L219M'),
 (44407, 'GLLLCU22A01L219I'),
 (44407, 'PRGMHL22H01L219H'),
 (44407, 'MLNSGS22M01L219H'),
 (44407, 'SPNCLL22A13L219O'),
 (58313, 'MCHGCM22P01L219E'),
 (58313, 'BRNZGL22L01L219H'),
 (58313, 'RSTFLV22A01L219M'),
 (58313, 'MCHGCM22P01L219E'),
 (58313, 'PRGMHL22H01L219H'),
 (81854, 'DLLFNN21T27L219H'),
 (81854, 'BRNZGL22L01L219H'),
 (81854, 'BRCTTV21T25L219T'),
 (81854, 'BRCTTV21T25L219T'),
 (81854, 'GRTMRT22S01L219M'),
 (60590, 'PRGMHL22H01L219H'),
 (60590, 'BRNZGL22L01L219H'),
 (60590, 'RSTFLV22A01L219M'),
 (60590, 'GNTNCL21T18L219T'),
 (60590, 'DLLFNN21T27L219H'),
 (85902, 'TTNRST21T19L219Z'),
 (85902, 'GNTNCL21T18L219T'),
 (85902, 'TTNRST21T19L219Z'),
 (85902, 'GLLLCU22A01L219I'),
 (85902, 'MNLSDR22S01L219E'),
 (61110, 'CMCCHR21T23L219V'),
 (61110, 'GLLLCU22A01L219I'),
 (61110, 'GRTMRT22S01L219M'),
 (61110, 'MNLSDR22S01L219E'),
 (61110, 'RSSSST21T26L219G'),
 (35181, 'GLLLCU22A01L219I'),
 (35181, 'BRCTTV21T25L219T'),
 (35181, 'GNTNCL21T18L219T'),
 (35181, 'MCHGCM22P01L219E'),
 (35181, 'CMCCHR21T23L219V');
INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES
(56339, 38, 173, 'maggio'),
(91841, 17, 198, 'settembre'),
(55332, 27, 65, 'febbraio'),
(22343, 24, 79, 'febbraio'),
(50748, 34, 108, 'gennaio'),
(53715, 23, 117, 'febbraio'),
(66705, 41, 72, 'luglio'),
(26041, 44, 198, 'giugno'),
(45246, 25, 72, 'dicembre'),
(86744, 10, 94, 'agosto'),
(66617, 42, 146, 'agosto'),
(13865, 20, 173, 'giugno'),
(52097, 14, 92, 'febbraio'),
(34453, 29, 125, 'maggio'),
(42026, 46, 77, 'dicembre'),
(94853, 27, 147, 'aprile'),
(85062, 25, 126, 'luglio'),
(65047, 52, 195, 'gennaio'),
(29353, 18, 186, 'aprile');
INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES
('BRNZGL22L01L219H', 56339),
('FBNLNE21T26L219O', 91841),
('PRGMHL22H01L219H', 55332),
('CSTMSM21T31L219E', 22343),
('LCCPCC21T23L219W', 50748),
('TTNRST21T19L219Z', 53715),
('BRCTTV21T25L219T', 66705),
('GLLLCU22A01L219I', 26041),
('FSNSDR21T28L219Q', 45246),
('DLLFNN21T27L219H', 86744),
('MLNSGS22M01L219H', 66617),
('SPNCLL22A13L219O', 13865),
('MCHGCM22P01L219E', 52097),
('GNTNCL21T18L219T', 34453),
('GRTMRT22S01L219M', 42026),
('RSTFLV22A01L219M', 94853),
('MNLSDR22S01L219E', 85062),
('RSSSST21T26L219G', 65047),
('CMCCHR21T23L219V', 29353);
