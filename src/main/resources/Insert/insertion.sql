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
    --sede dell UCI
        (18302, 'Milano', 'Corso Semprione', 39, 20145),
    --sede territoriale uci savignano
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
    --indirizzo Sky forge ditta crea modelli spasa laser
        (16378,'Caverzere','Armando Diaz',1,30014),
    --indirizzo etsy
        (13859,'New York', 'Adams Street', 117, 11201),
    --indirizzo star wars industries
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

INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE,CF, codF)
    -- george lucas ha contribuito al fondo
VALUES (1, '1977-01-05', 2000000, '53179880082', null, 'GRGLCS14ES44', 1);


INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codInd,codF)
-- scena
VALUES (00456, 'Scena in cui luke skywalker salva la principessa leila dalle grinfie di Dart Vader', 4, 5, 2, 200, 74921, 1),
    (04745, 'Scena in cui luke skywalker distrugge la morte nera', 15, 1, .5, 200, 74921, 1),
    (03245, 'Scena in cui luke skywalker assiste alla morte di obi wan', 11, 7, 4, 200, 74921, 1),
    (00789, 'Scena in cui luke skywalker guida il millenium falcon con Ian solo', 5, 5, 3, 200, 74921, 1);

INSERT IGNORE INTO Membro_Troupe_Scena(codScena ,CF)
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
