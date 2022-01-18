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

INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES (2, 'Il signore degli anelli, la compagnia dell anello','fantascienza', 178, '1998/07/1'  , NULL); 

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
INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso) VALUES
 (67898, 1, 3, 'A'),
 (40493, 1, 1, 'A'),
 (35413, 1, 7, 'A'),
 (26745, 1, 8, 'A');
INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP) VALUES 
 (90251, 'armi', 'oggetto di scena n.1', 67898),
 (98393, 'armi', 'oggetto di scena n.2', 40493),
 (88587, 'armi', 'oggetto di scena n.3', 35413),
 (82292, 'armi', 'oggetto di scena n.4', 26745);
INSERT IGNORE INTO OggettoScena(codO,codScena) VALUES
(98393, 35181),
(82292, 61110),
(98393, 61110),
(88587, 61110);
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

INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES (3, 'La Mummia','fantascienza', 120, '1999/5/27'  , NULL); 

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES 
(37555, 'Gaito del friuli', 'Stretto Pagnotto', '014', 83144),
(72020, 'Silvestro sardo', 'Canale Filangieri', '0', 38108),
(13615, 'Pina calabro', 'Canale Sbarbaro', '902', 96126),
(12432, "Leone nell'emilia", 'Stretto Callegari', '515', 13405),
(41645, 'Quarto Eleanora salentino', 'Vicolo Calogero', '22', 54707),
(77230, 'Ciampi veneto', 'Piazza Andreozzi', '654', 92652),
(94723, 'Romolo del friuli', 'Piazza Amanda', '770', 46265),
(93733, 'Benussi del friuli', 'Stretto Vittoria', '7', 56291),
(28341, 'Boezio laziale', 'Piazza Oliboni', '50', 28981),
(41643, 'Quarto Mariana', 'Piazza Gualtieri', '2', 75881),
(39560, 'Luna veneto', 'Contrada Paganini', '3', 80145),
(55959, 'Mauro lido', 'Contrada Emilio', '851', 58812),
(12466, 'Quasimodo veneto', 'Via Angelo', '113', 48163),
(41803, 'Sesto Loretta', 'Viale Collodi', '0', 31355),
(93310, 'Vecellio salentino', 'Piazza Bruno', '677', 78934),
(47929, 'Borgo Piergiorgio', 'Incrocio Colletti', '67', 34986),
(73711, 'Poerio a mare', 'Stretto Vecoli', '7', 65787),
(63107, 'Quarto Osvaldo', 'Borgo Piovani', '92', 22734),
(90008, 'Vittadello salentino', 'Contrada Zola', '64', 87651),
(12056, 'Ranieri umbro', 'Viale Alessia', '64', 48433),
(98802, 'Fernanda a mare', 'Canale Valerio', '984', 29456),
(47665, 'Casagrande del friuli', 'Stretto Conti', '595', 88248),
(97888, 'Sesto Alfio', 'Rotonda Ronaldo', '12', 89528);
INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES 
('SBLLVI22S01L219Z', 'Sibilia', 'Livia', 'IT88L4857710724675045300226', '2022-01-11', '+39 363 6369621', 37555),
('NCLPPN21T20L219O', 'Nicolucci', 'Pomponio', 'IT59S3251896624335943915361', '2021-12-20', '+39 830 01143422', 72020),
('FRNFPP22D01L219V', 'Franzese', 'Filippo', 'IT62U4409610493356502066226', '2022-01-04', '+39 322 50 26 6935', 13615),
('CNDGDI21T19L219W', 'Cendron', 'Giada', 'IT75U0991996970398411696663', '2021-12-19', '+39 078 1019361', 12432),
('BGGGBB22A15L219K', 'Baggio', 'Giacobbe', 'IT17A4312086889463817340861', '2022-01-15', '+39 689 3857653', 41645),
('JCZLNZ21T23L219N', 'Jacuzzi', 'Lorenzo', 'IT75R9770907268351518846591', '2021-12-23', '+39 37 52572856', 77230),
('CRRLSS21T22L219G', 'Carriera', 'Alessia', 'IT90I7419848555392197814683', '2021-12-22', '+39 50 68676709', 94723),
('DSSRCT22T01L219H', 'Dossetti', 'Ricciotti', 'IT58R0709033449047224412265', '2022-01-12', '+39 457 0372747', 93733),
('PCCGMR21T22L219M', 'Puccini', 'Gianmarco', 'IT30B7946372200712253536629', '2021-12-22', '+39 4631 4271163', 28341),
('DSSRNT21T28L219Q', 'Dossetti', 'Renata', 'IT72L4868256778023859557336', '2021-12-28', '+39 022 74 78 1033', 41643),
('PDVRCC22T01L219V', 'Padovano', 'Rocco', 'IT35S1573424075978941442893', '2022-01-12', '+39 943 75504421', 39560),
('GRMCRD22A01L219F', 'Grimani', 'Corrado', 'IT09T9767257957602871339634', '2022-01-01', '+39 269 97 30 7541', 55959),
('TSCPGR22T01L219N', 'Toscanini', 'Piergiorgio', 'IT90M3338637800719652119942', '2022-01-12', '+39 85 1718833', 12466),
('CMBMND22C01L219Y', 'Combi', 'Amanda', 'IT19K9370968257474154807285', '2022-01-03', '+39 4640 56337266', 41803),
('SRFDNC21T24L219G', 'Sraffa', 'Domenico', 'IT27C6488463726180624936745', '2021-12-24', '+39 567 50014533', 93310),
('BRNGPP22P01L219F', 'Bernardi', 'Giuseppe', 'IT03I2300432936170117311024', '2022-01-09', '+39 305 78 87 6204', 47929),
('GRDGSI22T01L219U', 'Giradello', 'Giosuè', 'IT86S2174828023124365630894', '2022-01-12', '+39 715 95 09 7362', 73711),
('RNCLRA22H01L219D', 'Roncalli', 'Lara', 'IT75O4206183437338833578631', '2022-01-06', '+39 989 78552076', 63107),
('GRMSNN22T01L219E', 'Grimani', 'Susanna', 'IT97C8381581023482108748423', '2022-01-12', '+39 95 84052343', 90008);
INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES 
('SBLLVI22S01L219Z', 'attore'),
('NCLPPN21T20L219O', 'produttore'),
('FRNFPP22D01L219V', 'produttore'),
('CNDGDI21T19L219W', 'operatore fotografico'),
('BGGGBB22A15L219K', 'aiuto regista'),
('JCZLNZ21T23L219N', 'attore'),
('CRRLSS21T22L219G', 'produttore esecutivo'),
('DSSRCT22T01L219H', 'operatore fotografico'),
('PCCGMR21T22L219M', 'produttore esecutivo'),
('DSSRNT21T28L219Q', 'regista'),
('PDVRCC22T01L219V', 'stilista'),
('GRMCRD22A01L219F', 'operatore fotografico'),
('TSCPGR22T01L219N', 'sceneggiatore'),
('CMBMND22C01L219Y', 'capo regista'),
('SRFDNC21T24L219G', 'produttore'),
('BRNGPP22P01L219F', 'capo regista'),
('GRDGSI22T01L219U', 'produttore'),
('RNCLRA22H01L219D', 'attore'),
('GRMSNN22T01L219E', 'aiuto regista');
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES 
(3, 'SBLLVI22S01L219Z'),
(3, 'NCLPPN21T20L219O'),
(3, 'FRNFPP22D01L219V'),
(3, 'CNDGDI21T19L219W'),
(3, 'BGGGBB22A15L219K'),
(3, 'JCZLNZ21T23L219N'),
(3, 'CRRLSS21T22L219G'),
(3, 'DSSRCT22T01L219H'),
(3, 'PCCGMR21T22L219M'),
(3, 'DSSRNT21T28L219Q'),
(3, 'PDVRCC22T01L219V'),
(3, 'GRMCRD22A01L219F'),
(3, 'TSCPGR22T01L219N'),
(3, 'CMBMND22C01L219Y'),
(3, 'SRFDNC21T24L219G'),
(3, 'BRNGPP22P01L219F'),
(3, 'GRDGSI22T01L219U'),
(3, 'RNCLRA22H01L219D'),
(3, 'GRMSNN22T01L219E');
INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES
 (35598, 'Scena n. 0', 12, 879, 241, 31, 3),
 (27494, 'Scena n. 1', 30, 834, 792, 96, 3),
 (54882, 'Scena n. 2', 36, 768, 545, 72, 3),
 (15365, 'Scena n. 3', 72, 371, 552, 22, 3),
 (55212, 'Scena n. 4', 66, 663, 460, 51, 3),
 (34298, 'Scena n. 5', 24, 965, 204, 25, 3),
 (22459, 'Scena n. 6', 93, 184, 815, 65, 3),
 (15609, 'Scena n. 7', 46, 128, 520, 88, 3),
 (17419, 'Scena n. 8', 94, 879, 372, 12, 3),
 (24835, 'Scena n. 9', 47, 157, 910, 91, 3),
 (76637, 'Scena n. 10', 14, 319, 884, 56, 3),
 (58871, 'Scena n. 11', 42, 233, 831, 95, 3),
 (84134, 'Scena n. 12', 14, 573, 161, 36, 3),
 (12675, 'Scena n. 13', 53, 289, 850, 76, 3),
 (99149, 'Scena n. 14', 26, 113, 993, 75, 3),
 (68600, 'Scena n. 15', 93, 775, 977, 13, 3),
 (66509, 'Scena n. 16', 12, 764, 275, 17, 3),
 (73290, 'Scena n. 17', 64, 943, 446, 13, 3),
 (20756, 'Scena n. 18', 21, 809, 763, 97, 3);
INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP) VALUES 
 (58534, 'fantasia', 'costume di scena n.1', 'FRNFPP22D01L219V', 66147),
 (31369, 'fantasia', 'costume di scena n.2', 'CNDGDI21T19L219W', 31096),
 (59733, 'fantasia', 'costume di scena n.3', 'PCCGMR21T22L219M', 94362),
 (79614, 'fantasia', 'costume di scena n.4', 'BGGGBB22A15L219K', 26539),
 (22954, 'fantasia', 'costume di scena n.5', 'BRNGPP22P01L219F', 12929),
 (88911, 'fantasia', 'costume di scena n.6', 'DSSRNT21T28L219Q', 52665),
 (75988, 'fantasia', 'costume di scena n.7', 'DSSRCT22T01L219H', 72383),
 (16090, 'fantasia', 'costume di scena n.8', 'PCCGMR21T22L219M', 48551),
 (97462, 'fantasia', 'costume di scena n.9', 'SRFDNC21T24L219G', 81602),
 (55049, 'fantasia', 'costume di scena n.10', 'SRFDNC21T24L219G', 59780),
 (50933, 'fantasia', 'costume di scena n.11', 'SRFDNC21T24L219G', 15744),
 (67598, 'fantasia', 'costume di scena n.12', 'SRFDNC21T24L219G', 87396),
 (27374, 'fantasia', 'costume di scena n.13', 'SRFDNC21T24L219G', 65726),
 (79683, 'fantasia', 'costume di scena n.14', 'PCCGMR21T22L219M', 77053),
 (14568, 'fantasia', 'costume di scena n.15', 'GRMSNN22T01L219E', 25174),
 (23180, 'fantasia', 'costume di scena n.16', 'GRMSNN22T01L219E', 17307),
 (32666, 'fantasia', 'costume di scena n.17', 'NCLPPN21T20L219O', 45659),
 (37499, 'fantasia', 'costume di scena n.18', 'GRDGSI22T01L219U', 88983),
 (50211, 'fantasia', 'costume di scena n.19', 'CNDGDI21T19L219W', 45616);
INSERT IGNORE INTO CostumeScena(codC, codScena) VALUES 
(27494, 50933),
(22459, 58534),
(20756, 37499),
(15365, 55049),
(68600, 59733),
(15365, 32666),
(68600, 23180),
(84134, 67598),
(27494, 50933),
(12675, 67598),
(68600, 58534),
(68600, 58534),
(22459, 50933),
(24835, 88911),
(27494, 31369),
(68600, 55049),
(73290, 79683),
(54882, 79614),
(73290, 67598);
INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso) VALUES
 (66147, 1, 7, 'A'),
 (31096, 1, 2, 'A'),
 (94362, 1, 6, 'A'),
 (26539, 1, 7, 'A');
INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP) VALUES 
 (53363, 'armi', 'oggetto di scena n.1', 66147),
 (57099, 'armi', 'oggetto di scena n.2', 31096),
 (73088, 'armi', 'oggetto di scena n.3', 94362),
 (10561, 'armi', 'oggetto di scena n.4', 26539);
INSERT IGNORE INTO OggettoScena(codO,codScena) VALUES
(10561, 22459),
(10561, 35598),
(53363, 54882),
(73088, 15365);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
(35598, 'TSCPGR22T01L219N'),
(35598, 'GRMSNN22T01L219E'),
(35598, 'TSCPGR22T01L219N'),
(35598, 'SBLLVI22S01L219Z'),
(27494, 'FRNFPP22D01L219V'),
(27494, 'NCLPPN21T20L219O'),
(27494, 'DSSRCT22T01L219H'),
(27494, 'NCLPPN21T20L219O'),
(54882, 'DSSRNT21T28L219Q'),
(54882, 'GRMCRD22A01L219F'),
(54882, 'CNDGDI21T19L219W'),
(54882, 'BRNGPP22P01L219F'),
(15365, 'CMBMND22C01L219Y'),
(15365, 'PDVRCC22T01L219V'),
(15365, 'SRFDNC21T24L219G'),
(15365, 'JCZLNZ21T23L219N'),
(55212, 'PCCGMR21T22L219M'),
(55212, 'GRDGSI22T01L219U'),
(55212, 'DSSRNT21T28L219Q'),
(55212, 'CRRLSS21T22L219G'),
(34298, 'SBLLVI22S01L219Z'),
(34298, 'DSSRNT21T28L219Q'),
(34298, 'BRNGPP22P01L219F'),
(34298, 'GRDGSI22T01L219U'),
(22459, 'DSSRNT21T28L219Q'),
(22459, 'SRFDNC21T24L219G'),
(22459, 'SBLLVI22S01L219Z'),
(22459, 'BGGGBB22A15L219K'),
(15609, 'GRMSNN22T01L219E'),
(15609, 'SBLLVI22S01L219Z'),
(15609, 'CMBMND22C01L219Y'),
(15609, 'GRDGSI22T01L219U'),
(17419, 'GRMCRD22A01L219F'),
(17419, 'FRNFPP22D01L219V'),
(17419, 'BGGGBB22A15L219K'),
(17419, 'FRNFPP22D01L219V'),
(24835, 'GRMSNN22T01L219E'),
(24835, 'DSSRCT22T01L219H'),
(24835, 'BGGGBB22A15L219K'),
(24835, 'PDVRCC22T01L219V'),
(76637, 'PDVRCC22T01L219V'),
(76637, 'TSCPGR22T01L219N'),
(76637, 'FRNFPP22D01L219V'),
(76637, 'GRMCRD22A01L219F'),
(58871, 'GRMCRD22A01L219F'),
(58871, 'SBLLVI22S01L219Z'),
(58871, 'SRFDNC21T24L219G'),
(58871, 'SBLLVI22S01L219Z'),
(84134, 'TSCPGR22T01L219N'),
(84134, 'RNCLRA22H01L219D'),
(84134, 'SBLLVI22S01L219Z'),
(84134, 'PDVRCC22T01L219V'),
(12675, 'SRFDNC21T24L219G'),
(12675, 'DSSRCT22T01L219H'),
(12675, 'NCLPPN21T20L219O'),
(12675, 'CNDGDI21T19L219W'),
(99149, 'SRFDNC21T24L219G'),
(99149, 'FRNFPP22D01L219V'),
(99149, 'DSSRCT22T01L219H'),
(99149, 'SBLLVI22S01L219Z'),
(68600, 'BGGGBB22A15L219K'),
(68600, 'TSCPGR22T01L219N'),
(68600, 'RNCLRA22H01L219D'),
(68600, 'GRDGSI22T01L219U'),
(66509, 'NCLPPN21T20L219O'),
(66509, 'DSSRCT22T01L219H'),
(66509, 'BRNGPP22P01L219F'),
(66509, 'GRDGSI22T01L219U'),
(73290, 'BGGGBB22A15L219K'),
(73290, 'BRNGPP22P01L219F'),
(73290, 'BGGGBB22A15L219K'),
(73290, 'NCLPPN21T20L219O'),
(20756, 'SRFDNC21T24L219G'),
(20756, 'JCZLNZ21T23L219N'),
(20756, 'GRMCRD22A01L219F'),
(20756, 'PCCGMR21T22L219M');
INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES 
('IT62F2113782476084229979559', 'Facebook');
INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES
 ('IT37E3584077654942689224292', 'Pfizer', 12056, 0.4989847721098546),
 ('IT34J1930999830121502822513', 'Apple', 98802, 0.678353613595711),
 ('IT86W7473250393532217253332', 'UnitedHealth Group', 47665, 0.4493047876755091),
 ('IT31A2484927146583370776666', 'The Home Depot', 97888, 0.7316825733247836);
INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd) VALUES 
 ('2013-01-29', '2013-02-05', 8601512, 3, 16395),
 ('2013-02-05', '2013-02-12', 6221495, 3, 16395),
 ('2013-02-12', '2013-02-19', 1075275, 3, 16395),
 ('2013-02-19', '2013-02-26', 2940359, 3, 16395),
 ('2013-02-26', '2013-03-05', 6421984, 3, 16395),
 ('2013-03-05', '2013-03-12', 8094499, 3, 16395),
 ('2013-03-12', '2013-03-19', 8331352, 3, 16395),
 ('2013-03-19', '2013-03-26', 9519358, 3, 16395);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (96758, '1990-07-13', 732274, null, 'IT37E3584077654942689224292', 3),
 (87974, '2014-03-27', 729920, null, 'IT34J1930999830121502822513', 3),
 (99289, '2006-03-24', 306758, null, 'IT86W7473250393532217253332', 3),
 (88673, '2012-04-23', 572331, null, 'IT31A2484927146583370776666', 3);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (59685, '1981-04-28', 984669, 'IT62F2113782476084229979559', null, 3);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
 (35598, 'BGGGBB22A15L219K'),
 (35598, 'GRMSNN22T01L219E'),
 (35598, 'GRMSNN22T01L219E'),
 (35598, 'BRNGPP22P01L219F'),
 (35598, 'GRMSNN22T01L219E'),
 (27494, 'FRNFPP22D01L219V'),
 (27494, 'CRRLSS21T22L219G'),
 (27494, 'DSSRCT22T01L219H'),
 (27494, 'SRFDNC21T24L219G'),
 (27494, 'GRDGSI22T01L219U'),
 (54882, 'GRMCRD22A01L219F'),
 (54882, 'CRRLSS21T22L219G'),
 (54882, 'SRFDNC21T24L219G'),
 (54882, 'GRMSNN22T01L219E'),
 (54882, 'DSSRCT22T01L219H'),
 (15365, 'JCZLNZ21T23L219N'),
 (15365, 'GRMSNN22T01L219E'),
 (15365, 'CMBMND22C01L219Y'),
 (15365, 'CMBMND22C01L219Y'),
 (15365, 'JCZLNZ21T23L219N'),
 (55212, 'PCCGMR21T22L219M'),
 (55212, 'DSSRCT22T01L219H'),
 (55212, 'SRFDNC21T24L219G'),
 (55212, 'PCCGMR21T22L219M'),
 (55212, 'DSSRCT22T01L219H'),
 (34298, 'DSSRNT21T28L219Q'),
 (34298, 'TSCPGR22T01L219N'),
 (34298, 'DSSRCT22T01L219H'),
 (34298, 'FRNFPP22D01L219V'),
 (34298, 'SRFDNC21T24L219G'),
 (22459, 'CNDGDI21T19L219W'),
 (22459, 'BGGGBB22A15L219K'),
 (22459, 'PDVRCC22T01L219V'),
 (22459, 'GRMCRD22A01L219F'),
 (22459, 'PCCGMR21T22L219M'),
 (15609, 'JCZLNZ21T23L219N'),
 (15609, 'DSSRNT21T28L219Q'),
 (15609, 'DSSRCT22T01L219H'),
 (15609, 'GRMCRD22A01L219F'),
 (15609, 'GRMSNN22T01L219E'),
 (17419, 'SRFDNC21T24L219G'),
 (17419, 'NCLPPN21T20L219O'),
 (17419, 'NCLPPN21T20L219O'),
 (17419, 'DSSRNT21T28L219Q'),
 (17419, 'DSSRNT21T28L219Q'),
 (24835, 'NCLPPN21T20L219O'),
 (24835, 'GRDGSI22T01L219U'),
 (24835, 'PDVRCC22T01L219V'),
 (24835, 'CNDGDI21T19L219W'),
 (24835, 'GRMSNN22T01L219E'),
 (76637, 'CMBMND22C01L219Y'),
 (76637, 'DSSRNT21T28L219Q'),
 (76637, 'GRDGSI22T01L219U'),
 (76637, 'CRRLSS21T22L219G'),
 (76637, 'JCZLNZ21T23L219N'),
 (58871, 'FRNFPP22D01L219V'),
 (58871, 'CNDGDI21T19L219W'),
 (58871, 'DSSRCT22T01L219H'),
 (58871, 'NCLPPN21T20L219O'),
 (58871, 'SBLLVI22S01L219Z'),
 (84134, 'BGGGBB22A15L219K'),
 (84134, 'TSCPGR22T01L219N'),
 (84134, 'GRMCRD22A01L219F'),
 (84134, 'NCLPPN21T20L219O'),
 (84134, 'BRNGPP22P01L219F'),
 (12675, 'SBLLVI22S01L219Z'),
 (12675, 'CRRLSS21T22L219G'),
 (12675, 'CMBMND22C01L219Y'),
 (12675, 'CMBMND22C01L219Y'),
 (12675, 'JCZLNZ21T23L219N'),
 (99149, 'PDVRCC22T01L219V'),
 (99149, 'PCCGMR21T22L219M'),
 (99149, 'NCLPPN21T20L219O'),
 (99149, 'TSCPGR22T01L219N'),
 (99149, 'CNDGDI21T19L219W'),
 (68600, 'DSSRCT22T01L219H'),
 (68600, 'RNCLRA22H01L219D'),
 (68600, 'GRMCRD22A01L219F'),
 (68600, 'SRFDNC21T24L219G'),
 (68600, 'JCZLNZ21T23L219N'),
 (66509, 'BGGGBB22A15L219K'),
 (66509, 'CNDGDI21T19L219W'),
 (66509, 'PDVRCC22T01L219V'),
 (66509, 'RNCLRA22H01L219D'),
 (66509, 'GRDGSI22T01L219U'),
 (73290, 'BGGGBB22A15L219K'),
 (73290, 'SRFDNC21T24L219G'),
 (73290, 'GRMSNN22T01L219E'),
 (73290, 'PDVRCC22T01L219V'),
 (73290, 'TSCPGR22T01L219N'),
 (20756, 'DSSRNT21T28L219Q'),
 (20756, 'GRMSNN22T01L219E'),
 (20756, 'CMBMND22C01L219Y'),
 (20756, 'BRNGPP22P01L219F'),
 (20756, 'PCCGMR21T22L219M');
INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES 
(48732, 48, 140, 'agosto'),
(48889, 20, 180, 'gennaio'),
(59793, 9, 107, 'luglio'),
(62851, 45, 89, 'settembre'),
(55502, 43, 118, 'dicembre'),
(29344, 36, 158, 'ottobre'),
(22050, 47, 198, 'febbraio'),
(31720, 41, 79, 'ottobre'),
(91059, 10, 101, 'ottobre'),
(19276, 41, 46, 'gennaio'),
(75512, 52, 144, 'maggio'),
(35391, 37, 181, 'luglio'),
(76286, 52, 101, 'marzo'),
(39181, 50, 143, 'marzo'),
(45331, 53, 195, 'agosto'),
(74297, 47, 165, 'aprile'),
(73831, 28, 179, 'maggio'),
(46777, 53, 115, 'giugno'),
(82429, 53, 174, 'maggio');
INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES
('SBLLVI22S01L219Z', 48732),
('NCLPPN21T20L219O', 48889),
('FRNFPP22D01L219V', 59793),
('CNDGDI21T19L219W', 62851),
('BGGGBB22A15L219K', 55502),
('JCZLNZ21T23L219N', 29344),
('CRRLSS21T22L219G', 22050),
('DSSRCT22T01L219H', 31720),
('PCCGMR21T22L219M', 91059),
('DSSRNT21T28L219Q', 19276),
('PDVRCC22T01L219V', 75512),
('GRMCRD22A01L219F', 35391),
('TSCPGR22T01L219N', 76286),
('CMBMND22C01L219Y', 39181),
('SRFDNC21T24L219G', 45331),
('BRNGPP22P01L219F', 74297),
('GRDGSI22T01L219U', 73831),
('RNCLRA22H01L219D', 46777),
('GRMSNN22T01L219E', 82429);



INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES (4, 'ritorno al futuro II','fantascienza', 108, '1989/10/5'  , NULL); 

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES 
(81634, 'Maurizio sardo', 'Rotonda Marrone', '83', 58597),
(79242, 'Settimo Sylvia lido', 'Strada Pacetti', '4', 10439),
(92095, 'Settimo Pierpaolo a mare', 'Strada Rismondo', '89', 36152),
(97451, 'Sesto Mariana', 'Piazza Rosaria', '2', 55038),
(58286, 'Borgo Amico', 'Viale Scotti', '830', 84948),
(92231, 'Cassandra ligure', 'Strada Fiorino', '635', 88064),
(28230, 'Giuliano salentino', 'Borgo Pina', '8', 92829),
(42966, "Ugo nell'emilia", 'Vicolo Zaira', '81', 23156),
(28259, 'San Beppe terme', 'Rotonda Gibilisco', '11', 91818),
(51296, 'San Stefania a mare', 'Via Maspero', '015', 65867),
(12500, 'Sesto Amadeo calabro', 'Contrada Spinelli', '846', 90232),
(65564, "Nicoletta nell'emilia", 'Viale Leonardo', '1', 944),
(89175, 'San Ugo salentino', 'Via Paola', '5', 33699),
(68089, 'Borgo Sebastiano laziale', 'Incrocio Raffaellino', '75', 93863),
(19718, 'Goffredo veneto', 'Rotonda Sismondi', '00', 16135),
(81487, 'Gianna calabro', 'Stretto Giannetti', '95', 38159),
(36305, 'Michelotto sardo', 'Contrada Lanfranchi', '7', 51943),
(48788, "Borgo Vincentio nell'emilia", 'Vicolo Francesca', '298', 92211),
(90593, 'Calvo del friuli', 'Piazza Ariosto', '74', 76706),
(89758, "Domenico nell'emilia", 'Via Ruggiero', '0', 92255),
(73257, 'Coppola veneto', 'Vicolo Mimun', '889', 80384),
(54182, 'Mariana sardo', 'Vicolo Papafava', '897', 14287),
(39896, 'Quarto Mattia del friuli', 'Incrocio Flavia', '912', 42498);
INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES 
('CRRVIO22T01L219N', 'Corradi', 'Ivo', 'IT23E5550419462396293022014', '2022-01-12', '+39 330 66 19 5185', 81634),
('TRCBDT22L01L219I', 'Treccani', 'Benedetto', 'IT47V3824048675479544251630', '2022-01-07', '+39 86 14129320', 79242),
('CSTVNC22A14L219G', 'Castiglione', 'Venancio', 'IT85S5648910680726541420501', '2022-01-14', '+39 573 49 30 9240', 92095),
('DPRNNN22A14L219C', 'Depero', 'Nanni', 'IT47R0650478097043621342820', '2022-01-14', '+39 744 3720847', 97451),
('PRDRSN21T29L219U', 'Prodi', 'Rossana', 'IT53M5824957317572388342986', '2021-12-29', '+39 4060 58551078', 58286),
('GNSTTE22A15L219H', 'Agnesi', 'Etta', 'IT93B1240594128439656152788', '2022-01-15', '+39 20 66261296', 92231),
('TSCMSS22A15L219J', 'Toscanini', 'Melissa', 'IT09X6924632282624506296115', '2022-01-15', '+39 3011 70606601', 28230),
('SBLCLN22S01L219P', 'Sibilia', 'Carolina', 'IT87Y1563626283444426503380', '2022-01-11', '+39 0130 6920389', 42966),
('BZOGSM22E01L219Q', 'Boezio', 'Gelsomina', 'IT83S7020602712983149701893', '2022-01-05', '+39 44 68949693', 28259),
('TLDZGL22E01L219H', 'Toldo', 'Azeglio', 'IT38J7401505498365712038152', '2022-01-05', '+39 721 87802856', 51296),
('BRRDRN21T29L219A', 'Berrè', 'Adriano', 'IT20I2576869410095871430763', '2021-12-29', '+39 37 23588417', 12500),
('BRGPNI22A15L219F', 'Bragadin', 'Pina', 'IT77A5926236913142319090325', '2022-01-15', '+39 448 12 00 2546', 65564),
('PRTLCU22A01L219M', 'Proietti', 'Lucia', 'IT04P3299971926255451795417', '2022-01-01', '+39 2519 40867168', 89175),
('TGLRST22S01L219Z', 'Togliatti', 'Oreste', 'IT31P8907538103465393129332', '2022-01-11', '+39 4694 5145187', 68089),
('TRLLZR21T22L219V', 'Torlonia', 'Lazzaro', 'IT05S3554849638684141513345', '2021-12-22', '+39 47 44836931', 19718),
('LTTLRT21T23L219M', 'Letta', 'Liberto', 'IT71N5259096316589923060898', '2021-12-23', '+39 230 1422251', 81487),
('FLLVGL22B01L219Q', 'Fallaci', 'Virgilio', 'IT51M2523461090553074845863', '2022-01-02', '+39 7780 11132884', 36305),
('RLNFLV22T01L219Y', 'Orlando', 'Fulvio', 'IT86L2083056000964794548876', '2022-01-12', '+39 5360 53138972', 48788),
('PSSNZE22L01L219S', 'Passalacqua', 'Enzio', 'IT58D9773287265285009310763', '2022-01-07', '+39 386 0187901', 90593);
INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES 
('CRRVIO22T01L219N', 'operatore fotografico'),
('TRCBDT22L01L219I', 'regista'),
('CSTVNC22A14L219G', 'sceneggiatore'),
('DPRNNN22A14L219C', 'attore'),
('PRDRSN21T29L219U', 'produttore'),
('GNSTTE22A15L219H', 'operatore fonico'),
('TSCMSS22A15L219J', 'attore'),
('SBLCLN22S01L219P', 'operatore fonico'),
('BZOGSM22E01L219Q', 'capo regista'),
('TLDZGL22E01L219H', 'produttore'),
('BRRDRN21T29L219A', 'operatore fotografico'),
('BRGPNI22A15L219F', 'stilista'),
('PRTLCU22A01L219M', 'sceneggiatore'),
('TGLRST22S01L219Z', 'operatore fotografico'),
('TRLLZR21T22L219V', 'operatore fotografico'),
('LTTLRT21T23L219M', 'produttore'),
('FLLVGL22B01L219Q', 'operatore fotografico'),
('RLNFLV22T01L219Y', 'operatore fotografico'),
('PSSNZE22L01L219S', 'produttore esecutivo');
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES 
(4, 'CRRVIO22T01L219N'),
(4, 'TRCBDT22L01L219I'),
(4, 'CSTVNC22A14L219G'),
(4, 'DPRNNN22A14L219C'),
(4, 'PRDRSN21T29L219U'),
(4, 'GNSTTE22A15L219H'),
(4, 'TSCMSS22A15L219J'),
(4, 'SBLCLN22S01L219P'),
(4, 'BZOGSM22E01L219Q'),
(4, 'TLDZGL22E01L219H'),
(4, 'BRRDRN21T29L219A'),
(4, 'BRGPNI22A15L219F'),
(4, 'PRTLCU22A01L219M'),
(4, 'TGLRST22S01L219Z'),
(4, 'TRLLZR21T22L219V'),
(4, 'LTTLRT21T23L219M'),
(4, 'FLLVGL22B01L219Q'),
(4, 'RLNFLV22T01L219Y'),
(4, 'PSSNZE22L01L219S');
INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES
 (93528, 'Scena n. 0', 35, 301, 593, 35, 4),
 (34969, 'Scena n. 1', 39, 762, 348, 24, 4),
 (81453, 'Scena n. 2', 61, 143, 104, 68, 4),
 (38968, 'Scena n. 3', 78, 525, 718, 67, 4),
 (25362, 'Scena n. 4', 20, 390, 249, 26, 4),
 (73249, 'Scena n. 5', 56, 168, 547, 26, 4),
 (89196, 'Scena n. 6', 43, 429, 764, 88, 4),
 (74655, 'Scena n. 7', 79, 949, 937, 84, 4),
 (66788, 'Scena n. 8', 81, 963, 439, 56, 4),
 (76641, 'Scena n. 9', 81, 343, 621, 19, 4),
 (83772, 'Scena n. 10', 51, 362, 698, 92, 4),
 (18808, 'Scena n. 11', 76, 980, 394, 58, 4),
 (65765, 'Scena n. 12', 73, 957, 999, 14, 4),
 (69728, 'Scena n. 13', 37, 580, 114, 27, 4),
 (17653, 'Scena n. 14', 75, 863, 600, 15, 4),
 (98374, 'Scena n. 15', 65, 670, 634, 44, 4),
 (31131, 'Scena n. 16', 61, 461, 263, 33, 4),
 (39078, 'Scena n. 17', 60, 257, 884, 92, 4),
 (62097, 'Scena n. 18', 65, 978, 121, 84, 4);
INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP) VALUES 
 (54632, 'fantasia', 'costume di scena n.1', 'TLDZGL22E01L219H', 24846),
 (81498, 'fantasia', 'costume di scena n.2', 'TGLRST22S01L219Z', 90966),
 (27095, 'fantasia', 'costume di scena n.3', 'TLDZGL22E01L219H', 29416),
 (78142, 'fantasia', 'costume di scena n.4', 'CRRVIO22T01L219N', 46882),
 (53891, 'fantasia', 'costume di scena n.5', 'BZOGSM22E01L219Q', 49767),
 (92919, 'fantasia', 'costume di scena n.6', 'CSTVNC22A14L219G', 34312),
 (97662, 'fantasia', 'costume di scena n.7', 'BRGPNI22A15L219F', 72258),
 (87325, 'fantasia', 'costume di scena n.8', 'BRGPNI22A15L219F', 18224),
 (82394, 'fantasia', 'costume di scena n.9', 'PRDRSN21T29L219U', 53507),
 (75479, 'fantasia', 'costume di scena n.10', 'CSTVNC22A14L219G', 14494),
 (44399, 'fantasia', 'costume di scena n.11', 'TSCMSS22A15L219J', 32762),
 (79355, 'fantasia', 'costume di scena n.12', 'BZOGSM22E01L219Q', 34926),
 (54555, 'fantasia', 'costume di scena n.13', 'PRTLCU22A01L219M', 58552),
 (13003, 'fantasia', 'costume di scena n.14', 'TLDZGL22E01L219H', 24581),
 (91920, 'fantasia', 'costume di scena n.15', 'PRDRSN21T29L219U', 12455),
 (58862, 'fantasia', 'costume di scena n.16', 'TGLRST22S01L219Z', 32187),
 (56448, 'fantasia', 'costume di scena n.17', 'PSSNZE22L01L219S', 70366),
 (53290, 'fantasia', 'costume di scena n.18', 'PSSNZE22L01L219S', 19678),
 (61605, 'fantasia', 'costume di scena n.19', 'TRCBDT22L01L219I', 84690);
INSERT IGNORE INTO CostumeScena(codC, codScena) VALUES 
(66788, 53290),
(31131, 78142),
(93528, 82394),
(76641, 13003),
(83772, 56448),
(69728, 13003),
(74655, 79355),
(66788, 61605),
(74655, 54632),
(83772, 92919),
(76641, 61605),
(83772, 56448),
(93528, 92919),
(31131, 13003),
(89196, 27095),
(73249, 44399),
(62097, 54555),
(31131, 58862),
(89196, 54555);
INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso) VALUES
 (24846, 1, 4, 'A'),
 (90966, 1, 2, 'A'),
 (29416, 1, 5, 'A'),
 (46882, 1, 1, 'A');
INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP) VALUES 
 (25239, 'armi', 'oggetto di scena n.1', 24846),
 (44823, 'armi', 'oggetto di scena n.2', 90966),
 (75171, 'armi', 'oggetto di scena n.3', 29416),
 (12024, 'armi', 'oggetto di scena n.4', 46882);
INSERT IGNORE INTO OggettoScena(codO,codScena) VALUES
(12024, 31131),
(12024, 81453),
(44823, 98374),
(25239, 18808);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
(93528, 'BRGPNI22A15L219F'),
(93528, 'BRGPNI22A15L219F'),
(93528, 'BRRDRN21T29L219A'),
(93528, 'PRTLCU22A01L219M'),
(34969, 'TLDZGL22E01L219H'),
(34969, 'DPRNNN22A14L219C'),
(34969, 'PSSNZE22L01L219S'),
(34969, 'SBLCLN22S01L219P'),
(81453, 'PRTLCU22A01L219M'),
(81453, 'BZOGSM22E01L219Q'),
(81453, 'CSTVNC22A14L219G'),
(81453, 'TSCMSS22A15L219J'),
(38968, 'TSCMSS22A15L219J'),
(38968, 'BRRDRN21T29L219A'),
(38968, 'PRDRSN21T29L219U'),
(38968, 'PSSNZE22L01L219S'),
(25362, 'TRCBDT22L01L219I'),
(25362, 'CRRVIO22T01L219N'),
(25362, 'PRTLCU22A01L219M'),
(25362, 'SBLCLN22S01L219P'),
(73249, 'PSSNZE22L01L219S'),
(73249, 'BRGPNI22A15L219F'),
(73249, 'CSTVNC22A14L219G'),
(73249, 'BRGPNI22A15L219F'),
(89196, 'GNSTTE22A15L219H'),
(89196, 'CRRVIO22T01L219N'),
(89196, 'PRDRSN21T29L219U'),
(89196, 'TLDZGL22E01L219H'),
(74655, 'TSCMSS22A15L219J'),
(74655, 'DPRNNN22A14L219C'),
(74655, 'BRGPNI22A15L219F'),
(74655, 'CRRVIO22T01L219N'),
(66788, 'CRRVIO22T01L219N'),
(66788, 'CSTVNC22A14L219G'),
(66788, 'TLDZGL22E01L219H'),
(66788, 'TRLLZR21T22L219V'),
(76641, 'PSSNZE22L01L219S'),
(76641, 'TRCBDT22L01L219I'),
(76641, 'FLLVGL22B01L219Q'),
(76641, 'TGLRST22S01L219Z'),
(83772, 'DPRNNN22A14L219C'),
(83772, 'CSTVNC22A14L219G'),
(83772, 'LTTLRT21T23L219M'),
(83772, 'TRCBDT22L01L219I'),
(18808, 'PSSNZE22L01L219S'),
(18808, 'CSTVNC22A14L219G'),
(18808, 'PRTLCU22A01L219M'),
(18808, 'TRCBDT22L01L219I'),
(65765, 'GNSTTE22A15L219H'),
(65765, 'PSSNZE22L01L219S'),
(65765, 'LTTLRT21T23L219M'),
(65765, 'TSCMSS22A15L219J'),
(69728, 'TRCBDT22L01L219I'),
(69728, 'FLLVGL22B01L219Q'),
(69728, 'TRLLZR21T22L219V'),
(69728, 'SBLCLN22S01L219P'),
(17653, 'PSSNZE22L01L219S'),
(17653, 'TLDZGL22E01L219H'),
(17653, 'BRRDRN21T29L219A'),
(17653, 'CSTVNC22A14L219G'),
(98374, 'GNSTTE22A15L219H'),
(98374, 'CRRVIO22T01L219N'),
(98374, 'CRRVIO22T01L219N'),
(98374, 'PSSNZE22L01L219S'),
(31131, 'TSCMSS22A15L219J'),
(31131, 'BRRDRN21T29L219A'),
(31131, 'LTTLRT21T23L219M'),
(31131, 'TRLLZR21T22L219V'),
(39078, 'PRDRSN21T29L219U'),
(39078, 'CRRVIO22T01L219N'),
(39078, 'GNSTTE22A15L219H'),
(39078, 'SBLCLN22S01L219P'),
(62097, 'PSSNZE22L01L219S'),
(62097, 'PSSNZE22L01L219S'),
(62097, 'SBLCLN22S01L219P'),
(62097, 'PRTLCU22A01L219M');
INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES 
('IT32H4796555058528537624999', 'Amazon');
INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES
 ('IT22M4697607297172489213547', 'The Walt Disney Company', 89758, 0.8837189199637577),
 ('IT82K2653306338684478264657', 'ExxonMobil', 73257, 0.0484807187178532),
 ('IT44K5807034597254640726812', 'Johnson & Johnson', 54182, 0.39656142203640976),
 ('IT28V0945178209032958470309', 'Procter & Gamble', 39896, 0.9187297777838385);
INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd) VALUES 
 ('2002-08-06', '2002-08-13', 7550194, 4, 16395),
 ('2002-08-13', '2002-08-20', 7936821, 4, 16395),
 ('2002-08-20', '2002-08-27', 2760377, 4, 16395),
 ('2002-08-27', '2002-09-03', 7104269, 4, 16395),
 ('2002-09-03', '2002-09-10', 2646959, 4, 16395),
 ('2002-09-10', '2002-09-17', 8688547, 4, 16395),
 ('2002-09-17', '2002-09-24', 7506637, 4, 16395),
 ('2002-09-24', '2002-10-01', 7112007, 4, 16395);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (77143, '2000-07-12', 154579, null, 'IT22M4697607297172489213547', 4),
 (12416, '1986-07-04', 121864, null, 'IT82K2653306338684478264657', 4),
 (35969, '2017-07-01', 915353, null, 'IT44K5807034597254640726812', 4),
 (71599, '1979-05-10', 630292, null, 'IT28V0945178209032958470309', 4);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (48087, '2008-06-19', 310536, 'IT32H4796555058528537624999', null, 4);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
 (93528, 'CSTVNC22A14L219G'),
 (93528, 'PRTLCU22A01L219M'),
 (93528, 'CRRVIO22T01L219N'),
 (93528, 'BZOGSM22E01L219Q'),
 (93528, 'TRLLZR21T22L219V'),
 (34969, 'CRRVIO22T01L219N'),
 (34969, 'BZOGSM22E01L219Q'),
 (34969, 'BRRDRN21T29L219A'),
 (34969, 'PRTLCU22A01L219M'),
 (34969, 'LTTLRT21T23L219M'),
 (81453, 'TRLLZR21T22L219V'),
 (81453, 'TRCBDT22L01L219I'),
 (81453, 'TSCMSS22A15L219J'),
 (81453, 'BRGPNI22A15L219F'),
 (81453, 'CSTVNC22A14L219G'),
 (38968, 'BZOGSM22E01L219Q'),
 (38968, 'PRTLCU22A01L219M'),
 (38968, 'TGLRST22S01L219Z'),
 (38968, 'PRTLCU22A01L219M'),
 (38968, 'TRLLZR21T22L219V'),
 (25362, 'TLDZGL22E01L219H'),
 (25362, 'CRRVIO22T01L219N'),
 (25362, 'TGLRST22S01L219Z'),
 (25362, 'DPRNNN22A14L219C'),
 (25362, 'TRLLZR21T22L219V'),
 (73249, 'PRTLCU22A01L219M'),
 (73249, 'TLDZGL22E01L219H'),
 (73249, 'BRGPNI22A15L219F'),
 (73249, 'GNSTTE22A15L219H'),
 (73249, 'TLDZGL22E01L219H'),
 (89196, 'TGLRST22S01L219Z'),
 (89196, 'TGLRST22S01L219Z'),
 (89196, 'LTTLRT21T23L219M'),
 (89196, 'TGLRST22S01L219Z'),
 (89196, 'TRLLZR21T22L219V'),
 (74655, 'LTTLRT21T23L219M'),
 (74655, 'DPRNNN22A14L219C'),
 (74655, 'PRTLCU22A01L219M'),
 (74655, 'CSTVNC22A14L219G'),
 (74655, 'CRRVIO22T01L219N'),
 (66788, 'PRDRSN21T29L219U'),
 (66788, 'CSTVNC22A14L219G'),
 (66788, 'LTTLRT21T23L219M'),
 (66788, 'TLDZGL22E01L219H'),
 (66788, 'RLNFLV22T01L219Y'),
 (76641, 'BZOGSM22E01L219Q'),
 (76641, 'TGLRST22S01L219Z'),
 (76641, 'RLNFLV22T01L219Y'),
 (76641, 'CRRVIO22T01L219N'),
 (76641, 'CRRVIO22T01L219N'),
 (83772, 'BRRDRN21T29L219A'),
 (83772, 'BRRDRN21T29L219A'),
 (83772, 'PSSNZE22L01L219S'),
 (83772, 'PSSNZE22L01L219S'),
 (83772, 'PRTLCU22A01L219M'),
 (18808, 'TSCMSS22A15L219J'),
 (18808, 'BRGPNI22A15L219F'),
 (18808, 'TGLRST22S01L219Z'),
 (18808, 'TSCMSS22A15L219J'),
 (18808, 'CRRVIO22T01L219N'),
 (65765, 'TRLLZR21T22L219V'),
 (65765, 'PRTLCU22A01L219M'),
 (65765, 'BRRDRN21T29L219A'),
 (65765, 'PSSNZE22L01L219S'),
 (65765, 'RLNFLV22T01L219Y'),
 (69728, 'LTTLRT21T23L219M'),
 (69728, 'TSCMSS22A15L219J'),
 (69728, 'PRDRSN21T29L219U'),
 (69728, 'BZOGSM22E01L219Q'),
 (69728, 'TRCBDT22L01L219I'),
 (17653, 'RLNFLV22T01L219Y'),
 (17653, 'FLLVGL22B01L219Q'),
 (17653, 'FLLVGL22B01L219Q'),
 (17653, 'FLLVGL22B01L219Q'),
 (17653, 'LTTLRT21T23L219M'),
 (98374, 'GNSTTE22A15L219H'),
 (98374, 'BZOGSM22E01L219Q'),
 (98374, 'LTTLRT21T23L219M'),
 (98374, 'BRRDRN21T29L219A'),
 (98374, 'CSTVNC22A14L219G'),
 (31131, 'RLNFLV22T01L219Y'),
 (31131, 'TRCBDT22L01L219I'),
 (31131, 'TRLLZR21T22L219V'),
 (31131, 'RLNFLV22T01L219Y'),
 (31131, 'CSTVNC22A14L219G'),
 (39078, 'DPRNNN22A14L219C'),
 (39078, 'PSSNZE22L01L219S'),
 (39078, 'CRRVIO22T01L219N'),
 (39078, 'BZOGSM22E01L219Q'),
 (39078, 'GNSTTE22A15L219H'),
 (62097, 'PSSNZE22L01L219S'),
 (62097, 'TGLRST22S01L219Z'),
 (62097, 'LTTLRT21T23L219M'),
 (62097, 'BRRDRN21T29L219A'),
 (62097, 'LTTLRT21T23L219M');
INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES 
(16504, 46, 139, 'marzo'),
(68038, 30, 95, 'febbraio'),
(11315, 17, 102, 'novembre'),
(59549, 40, 83, 'settembre'),
(48767, 16, 132, 'ottobre'),
(21686, 41, 93, 'novembre'),
(22178, 20, 137, 'ottobre'),
(72869, 16, 163, 'giugno'),
(58126, 34, 94, 'febbraio'),
(75760, 48, 123, 'febbraio'),
(70728, 14, 90, 'luglio'),
(35956, 27, 68, 'novembre'),
(74941, 13, 65, 'novembre'),
(10855, 10, 134, 'settembre'),
(64556, 25, 88, 'ottobre'),
(22455, 10, 67, 'ottobre'),
(82852, 7, 100, 'novembre'),
(60342, 25, 127, 'agosto'),
(34426, 41, 177, 'marzo');
INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES
('CRRVIO22T01L219N', 16504),
('TRCBDT22L01L219I', 68038),
('CSTVNC22A14L219G', 11315),
('DPRNNN22A14L219C', 59549),
('PRDRSN21T29L219U', 48767),
('GNSTTE22A15L219H', 21686),
('TSCMSS22A15L219J', 22178),
('SBLCLN22S01L219P', 72869),
('BZOGSM22E01L219Q', 58126),
('TLDZGL22E01L219H', 75760),
('BRRDRN21T29L219A', 70728),
('BRGPNI22A15L219F', 35956),
('PRTLCU22A01L219M', 74941),
('TGLRST22S01L219Z', 10855),
('TRLLZR21T22L219V', 64556),
('LTTLRT21T23L219M', 22455),
('FLLVGL22B01L219Q', 82852),
('RLNFLV22T01L219Y', 60342),
('PSSNZE22L01L219S', 34426);

 
 