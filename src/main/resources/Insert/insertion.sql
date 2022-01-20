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
(48324, 'Armando laziale', 'Contrada Massimo', '81', 48530),
(35571, 'Ruggero terme', 'Canale Irma', '8', 32372),
(68649, 'Sesto Flavia', 'Canale Tron', '82', 34428),
(98782, 'Saraceno salentino', 'Rotonda Dante', '431', 48766),
(86523, 'Settimo Michele sardo', 'Canale Fausto', '7', 54904),
(89243, "Bompiani nell'emilia", 'Borgo Lando', '13', 90241),
(85039, "Ajello nell'emilia", 'Incrocio Silvio', '82', 8836),
(33086, 'San Paoletta', 'Borgo Sabatino', '08', 24512),
(69039, 'San Silvio', 'Via Delle', '5', 45266),
(80398, 'Benigni sardo', 'Incrocio Antonio', '91', 64752),
(51492, 'Sesto Ranieri terme', 'Stretto Trebbi', '8', 86234),
(19196, 'San Ramona del friuli', 'Incrocio Faranda', '9', 67111),
(82426, 'Settimo Gionata', 'Contrada Calcedonio', '3', 19403),
(53612, 'Borgo Silvia calabro', 'Viale Sylvia', '1', 2284),
(25015, 'Bova calabro', 'Strada Tagliafierro', '66', 21799),
(28235, 'Matilda a mare', 'Strada Nadia', '924', 1286),
(16316, 'Benedetto ligure', 'Strada Carolina', '133', 5193),
(80745, 'Montanariello terme', 'Rotonda Costanzi', '307', 90387),
(52528, 'Amadeo umbro', 'Strada Giorgetti', '769', 65520),
(68922, 'Martucci sardo', 'Strada Graziano', '41', 11617),
(52117, 'Tornatore umbro', 'Canale Allegra', '983', 17729),
(90901, 'Vergerio lido', 'Borgo Coriolano', '73', 66520),
(68026, 'Settimo Claudia', 'Contrada Paltrinieri', '77', 18865);
INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES 
('PPEPNI21T31L219B', 'Pepe', 'Pina', 'IT51K0023186606940484806011', '2021-12-31', '+39 25 0105562', 48324),
('TMMSLL21T31L219I', 'Tommaseo', 'Isabella', 'IT03J1131729714811719091875', '2021-12-31', '+39 677 83772342', 35571),
('TZZGTV22S01L219E', 'Tuzzolino', 'Gustavo', 'IT91O3475815457772719902887', '2022-01-11', '+39 689 51 57 2778', 68649),
('VNLMRA22A15L219D', 'Vianello', 'Mauro', 'IT84Q3204985187982292399844', '2022-01-15', '+39 7194 24820023', 98782),
('CRSFRD21T26L219V', 'Crespi', 'Fredo', 'IT70F6147683137583056812053', '2021-12-26', '+39 4581 2009943', 86523),
('VRCNNT21T25L219B', 'Vercelloni', 'Antonietta', 'IT62L7906079522331032779730', '2021-12-25', '+39 857 03 03 9859', 89243),
('VRDGZN21T25L219T', 'Verdone', 'Graziano', 'IT32J3891906336063042111528', '2021-12-25', '+39 57 2600432', 85039),
('MNTMLT21T26L219Z', 'Montessori', 'Amleto', 'IT07F0301492535778895363148', '2021-12-26', '+39 05 19905016', 33086),
('LPRGZN22A13L219T', 'Lopresti', 'Graziano', 'IT94I4947483599462809366266', '2022-01-13', '+39 7550 9387815', 69039),
('MRNNNL21T22L219I', 'Marenzio', 'Antonello', 'IT81H2963033959475809495633', '2021-12-22', '+39 167 29 80 7803', 80398),
('VTTRNN21T31L219Y', 'Vittadello', 'Ermanno', 'IT26X8084412999809247008921', '2021-12-31', '+39 608 35 22 7092', 51492),
('BCCFRN21T22L219U', 'Beccaria', 'Fiorino', 'IT74U0472477667414119136295', '2021-12-22', '+39 92 6131841', 19196),
('MNDGLR22H01L219X', 'Mondaini', 'Gloria', 'IT63Q6854084991991656461052', '2022-01-06', '+39 3975 26940170', 82426),
('NTTGLI22S01L219Y', 'Nitti', 'Gioele', 'IT87U4345005171964938488104', '2022-01-11', '+39 599 32689269', 53612),
('RMNNCI22L01L219L', 'Armani', 'Nico', 'IT68A0494993419866242793360', '2022-01-07', '+39 017 40940651', 25015),
('MNTGTN21T29L219D', 'Montesano', 'Gastone', 'IT58O5095621163088756686939', '2021-12-29', '+39 29 61903267', 28235),
('MRCMRN22A18L219J', 'Mercantini', 'Marina', 'IT17U2888760819763862492096', '2022-01-18', '+39 595 0316205', 16316),
('BDNNCL22A18L219O', 'Bodoni', 'Nicola', 'IT73W3421785660985123694079', '2022-01-18', '+39 5135 05079592', 80745),
('FCNRTR21T31L219O', 'Foconi', 'Arturo', 'IT22V7896651667482064387567', '2021-12-31', '+39 825 6984708', 52528);
INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES 
('PPEPNI21T31L219B', 'operatore fotografico'),
('TMMSLL21T31L219I', 'produttore'),
('TZZGTV22S01L219E', 'sceneggiatore'),
('VNLMRA22A15L219D', 'produttore esecutivo'),
('CRSFRD21T26L219V', 'operatore fonico'),
('VRCNNT21T25L219B', 'stilista'),
('VRDGZN21T25L219T', 'produttore esecutivo'),
('MNTMLT21T26L219Z', 'operatore fotografico'),
('LPRGZN22A13L219T', 'operatore fonico'),
('MRNNNL21T22L219I', 'aiuto regista'),
('VTTRNN21T31L219Y', 'produttore esecutivo'),
('BCCFRN21T22L219U', 'attore'),
('MNDGLR22H01L219X', 'aiuto regista'),
('NTTGLI22S01L219Y', 'operatore fonico'),
('RMNNCI22L01L219L', 'produttore esecutivo'),
('MNTGTN21T29L219D', 'sceneggiatore'),
('MRCMRN22A18L219J', 'aiuto regista'),
('BDNNCL22A18L219O', 'operatore fotografico'),
('FCNRTR21T31L219O', 'stilista');
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES 
(2, 'PPEPNI21T31L219B'),
(2, 'TMMSLL21T31L219I'),
(2, 'TZZGTV22S01L219E'),
(2, 'VNLMRA22A15L219D'),
(2, 'CRSFRD21T26L219V'),
(2, 'VRCNNT21T25L219B'),
(2, 'VRDGZN21T25L219T'),
(2, 'MNTMLT21T26L219Z'),
(2, 'LPRGZN22A13L219T'),
(2, 'MRNNNL21T22L219I'),
(2, 'VTTRNN21T31L219Y'),
(2, 'BCCFRN21T22L219U'),
(2, 'MNDGLR22H01L219X'),
(2, 'NTTGLI22S01L219Y'),
(2, 'RMNNCI22L01L219L'),
(2, 'MNTGTN21T29L219D'),
(2, 'MRCMRN22A18L219J'),
(2, 'BDNNCL22A18L219O'),
(2, 'FCNRTR21T31L219O');
INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES
 (30366, 'Scena n. 0', 55, 980, 282, 75, 2),
 (36290, 'Scena n. 1', 22, 944, 162, 46, 2),
 (41029, 'Scena n. 2', 87, 788, 349, 93, 2),
 (47731, 'Scena n. 3', 58, 545, 781, 19, 2),
 (91944, 'Scena n. 4', 31, 373, 318, 17, 2),
 (94933, 'Scena n. 5', 89, 519, 227, 48, 2),
 (64303, 'Scena n. 6', 51, 142, 396, 12, 2),
 (10377, 'Scena n. 7', 45, 929, 304, 46, 2),
 (79318, 'Scena n. 8', 21, 550, 141, 34, 2),
 (41972, 'Scena n. 9', 46, 617, 701, 77, 2),
 (93610, 'Scena n. 10', 43, 730, 322, 82, 2),
 (89826, 'Scena n. 11', 91, 667, 105, 43, 2),
 (92272, 'Scena n. 12', 59, 342, 985, 85, 2),
 (74996, 'Scena n. 13', 79, 829, 847, 31, 2),
 (62135, 'Scena n. 14', 71, 701, 592, 96, 2),
 (96686, 'Scena n. 15', 29, 599, 837, 86, 2),
 (10737, 'Scena n. 16', 62, 624, 674, 74, 2),
 (96961, 'Scena n. 17', 23, 850, 922, 79, 2),
 (12939, 'Scena n. 18', 27, 721, 606, 87, 2);
INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso) VALUES
 (41876, 1, 1, 'A'),
 (17066, 1, 6, 'M'),
 (85793, 1, 2, 'I'),
 (28588, 1, 4, 'Q'),
 (91957, 1, 2, 'A'),
 (11595, 1, 9, 'T'),
 (23456, 1, 3, 'Z'),
 (91322, 1, 9, 'N'),
 (44697, 1, 3, 'L'),
 (92979, 1, 6, 'O'),
 (30225, 1, 6, 'Y'),
 (43108, 1, 1, 'C'),
 (22477, 1, 7, 'Y'),
 (62627, 1, 8, 'P'),
 (99299, 1, 2, 'F'),
 (24874, 1, 5, 'K'),
 (15883, 1, 3, 'W'),
 (53333, 1, 9, 'G'),
 (62198, 1, 1, 'I');
INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP) VALUES 
 (30535, 'fantasia', 'costume di scena n.1', 'MRNNNL21T22L219I', 41876),
 (87873, 'epoca', 'costume di scena n.2', 'TMMSLL21T31L219I', 17066),
 (19479, 'fantasia', 'costume di scena n.3', 'PPEPNI21T31L219B', 85793),
 (69613, 'contemporaneo', 'costume di scena n.4', 'BDNNCL22A18L219O', 28588),
 (29776, 'fantasia', 'costume di scena n.5', 'VNLMRA22A15L219D', 91957),
 (67480, 'epoca', 'costume di scena n.6', 'MNTMLT21T26L219Z', 11595),
 (33773, 'fantasia', 'costume di scena n.7', 'NTTGLI22S01L219Y', 23456),
 (82891, 'epoca', 'costume di scena n.8', 'VNLMRA22A15L219D', 91322),
 (27322, 'epoca', 'costume di scena n.9', 'VTTRNN21T31L219Y', 44697),
 (53635, 'contemporaneo', 'costume di scena n.10', 'MNTMLT21T26L219Z', 92979),
 (74925, 'epoca', 'costume di scena n.11', 'NTTGLI22S01L219Y', 30225),
 (25622, 'epoca', 'costume di scena n.12', 'FCNRTR21T31L219O', 43108),
 (70011, 'epoca', 'costume di scena n.13', 'FCNRTR21T31L219O', 22477),
 (59409, 'contemporaneo', 'costume di scena n.14', 'TZZGTV22S01L219E', 62627),
 (77846, 'epoca', 'costume di scena n.15', 'CRSFRD21T26L219V', 99299),
 (34731, 'contemporaneo', 'costume di scena n.16', 'TZZGTV22S01L219E', 24874),
 (23202, 'fantasia', 'costume di scena n.17', 'FCNRTR21T31L219O', 15883),
 (55579, 'fantasia', 'costume di scena n.18', 'VRCNNT21T25L219B', 53333),
 (87284, 'contemporaneo', 'costume di scena n.19', 'MNDGLR22H01L219X', 62198);
INSERT IGNORE INTO CostumeScena(codC, codScena) VALUES 
(23202, 89826),
(29776, 47731),
(53635, 30366),
(69613, 10377),
(33773, 92272),
(33773, 41972),
(67480, 96686),
(25622, 62135),
(30535, 10377),
(77846, 41972),
(59409, 12939),
(19479, 93610),
(25622, 89826),
(34731, 92272),
(69613, 91944),
(77846, 41972),
(87873, 94933),
(74925, 47731),
(82891, 36290),
(67480, 41029),
(74925, 89826),
(53635, 79318),
(19479, 96961),
(30535, 30366),
(19479, 41029),
(30535, 89826),
(30535, 89826),
(27322, 96686),
(82891, 96686),
(23202, 92272),
(69613, 79318),
(82891, 92272),
(25622, 96686),
(70011, 96686),
(87284, 93610),
(55579, 96686),
(27322, 41029),
(34731, 64303),
(82891, 30366),
(33773, 47731),
(82891, 47731),
(27322, 10737),
(27322, 41972),
(74925, 62135),
(59409, 41029),
(55579, 96961),
(19479, 64303),
(87284, 10737),
(67480, 41972),
(19479, 79318),
(29776, 36290),
(70011, 62135),
(67480, 64303),
(55579, 96686),
(77846, 94933),
(82891, 92272),
(23202, 10377);
INSERT IGNORE INTO OggettiDiScena(codO, tipo, descrizione, codP) VALUES 
 (31957, 'strumentoMusicale', 'oggetto di scena n.1', 41876),
 (44162, 'motori', 'oggetto di scena n.2', 17066),
 (40540, 'arredo', 'oggetto di scena n.3', 85793),
 (33447, 'strumentoMusicale', 'oggetto di scena n.4', 28588),
 (21192, 'armi', 'oggetto di scena n.5', 91957),
 (51028, 'mobili', 'oggetto di scena n.6', 11595),
 (23008, 'maschere', 'oggetto di scena n.7', 23456),
 (47370, 'mobili', 'oggetto di scena n.8', 91322),
 (90066, 'strumentoMusicale', 'oggetto di scena n.9', 44697),
 (51078, 'maschere', 'oggetto di scena n.10', 92979),
 (84553, 'armi', 'oggetto di scena n.11', 30225),
 (40564, 'motori', 'oggetto di scena n.12', 43108),
 (13433, 'arredo', 'oggetto di scena n.13', 22477),
 (98013, 'maschere', 'oggetto di scena n.14', 62627),
 (17515, 'maschere', 'oggetto di scena n.15', 99299),
 (77723, 'strumentoMusicale', 'oggetto di scena n.16', 24874),
 (44284, 'strumentoMusicale', 'oggetto di scena n.17', 15883),
 (35942, 'arredo', 'oggetto di scena n.18', 53333),
 (86164, 'mobili', 'oggetto di scena n.19', 62198);
INSERT IGNORE INTO OggettoScena(codO,codScena) VALUES
(33447, 36290),
(17515, 62135),
(31957, 93610),
(44162, 96686),
(51028, 64303),
(33447, 94933),
(40564, 89826),
(86164, 96686),
(13433, 47731),
(47370, 89826),
(47370, 94933),
(13433, 89826),
(98013, 74996),
(44284, 12939),
(51028, 92272),
(35942, 36290),
(13433, 94933),
(17515, 10377),
(40564, 10737),
(51028, 94933),
(40564, 92272),
(17515, 89826),
(33447, 10377),
(21192, 41029),
(44162, 41972),
(98013, 96961),
(40540, 79318),
(98013, 64303),
(90066, 93610),
(51028, 64303),
(47370, 74996),
(90066, 10737),
(86164, 96686),
(40540, 41029),
(17515, 62135),
(51028, 74996),
(51028, 94933),
(51028, 89826),
(17515, 41972),
(86164, 36290),
(35942, 30366),
(17515, 96961),
(44162, 96961),
(35942, 92272),
(44162, 94933),
(51028, 36290),
(35942, 92272),
(40540, 36290),
(51028, 64303),
(51028, 89826),
(86164, 96686),
(77723, 89826),
(51028, 79318),
(33447, 36290),
(17515, 74996),
(40540, 74996),
(40564, 36290);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
(30366, 'LPRGZN22A13L219T'),
(30366, 'VRDGZN21T25L219T'),
(30366, 'BCCFRN21T22L219U'),
(30366, 'RMNNCI22L01L219L'),
(36290, 'VRDGZN21T25L219T'),
(36290, 'BDNNCL22A18L219O'),
(36290, 'NTTGLI22S01L219Y'),
(36290, 'RMNNCI22L01L219L'),
(41029, 'VRDGZN21T25L219T'),
(41029, 'CRSFRD21T26L219V'),
(41029, 'FCNRTR21T31L219O'),
(41029, 'BDNNCL22A18L219O'),
(47731, 'MRNNNL21T22L219I'),
(47731, 'BCCFRN21T22L219U'),
(47731, 'BCCFRN21T22L219U'),
(47731, 'VTTRNN21T31L219Y'),
(91944, 'MNTMLT21T26L219Z'),
(91944, 'PPEPNI21T31L219B'),
(91944, 'VRCNNT21T25L219B'),
(91944, 'MRCMRN22A18L219J'),
(94933, 'VNLMRA22A15L219D'),
(94933, 'MNDGLR22H01L219X'),
(94933, 'TZZGTV22S01L219E'),
(94933, 'LPRGZN22A13L219T'),
(64303, 'VRCNNT21T25L219B'),
(64303, 'MNTGTN21T29L219D'),
(64303, 'MNTGTN21T29L219D'),
(64303, 'VRCNNT21T25L219B'),
(10377, 'TMMSLL21T31L219I'),
(10377, 'MNTGTN21T29L219D'),
(10377, 'VNLMRA22A15L219D'),
(10377, 'VTTRNN21T31L219Y'),
(79318, 'BCCFRN21T22L219U'),
(79318, 'VNLMRA22A15L219D'),
(79318, 'PPEPNI21T31L219B'),
(79318, 'TMMSLL21T31L219I'),
(41972, 'LPRGZN22A13L219T'),
(41972, 'VRDGZN21T25L219T'),
(41972, 'MRCMRN22A18L219J'),
(41972, 'BDNNCL22A18L219O'),
(93610, 'VNLMRA22A15L219D'),
(93610, 'TZZGTV22S01L219E'),
(93610, 'MNTGTN21T29L219D'),
(93610, 'VRDGZN21T25L219T'),
(89826, 'BCCFRN21T22L219U'),
(89826, 'PPEPNI21T31L219B'),
(89826, 'RMNNCI22L01L219L'),
(89826, 'TZZGTV22S01L219E'),
(92272, 'BDNNCL22A18L219O'),
(92272, 'MNDGLR22H01L219X'),
(92272, 'FCNRTR21T31L219O'),
(92272, 'NTTGLI22S01L219Y'),
(74996, 'MRCMRN22A18L219J'),
(74996, 'LPRGZN22A13L219T'),
(74996, 'MRNNNL21T22L219I'),
(74996, 'MNTMLT21T26L219Z'),
(62135, 'MNTGTN21T29L219D'),
(62135, 'VRCNNT21T25L219B'),
(62135, 'PPEPNI21T31L219B'),
(62135, 'TZZGTV22S01L219E'),
(96686, 'VNLMRA22A15L219D'),
(96686, 'BCCFRN21T22L219U'),
(96686, 'VRCNNT21T25L219B'),
(96686, 'VNLMRA22A15L219D'),
(10737, 'MNTMLT21T26L219Z'),
(10737, 'FCNRTR21T31L219O'),
(10737, 'FCNRTR21T31L219O'),
(10737, 'PPEPNI21T31L219B'),
(96961, 'BCCFRN21T22L219U'),
(96961, 'MNTGTN21T29L219D'),
(96961, 'LPRGZN22A13L219T'),
(96961, 'TZZGTV22S01L219E'),
(12939, 'TZZGTV22S01L219E'),
(12939, 'TMMSLL21T31L219I'),
(12939, 'PPEPNI21T31L219B'),
(12939, 'MNDGLR22H01L219X');
INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES 
('IT64A3586692220111081233032', 'Facebook');
INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES
 ('IT28C5691061322926646213631', 'The Walt Disney Company', 68922, 0.47502393020847544),
 ('IT26T1896812335575376603094', 'Wells Fargo', 52117, 0.848984283871436),
 ('IT45L1848278153874223172987', 'Comcast', 90901, 0.8017190796932201),
 ('IT32C1939957617651498822468', 'Berkshire Hathaway', 68026, 0.3075192075319094);
INSERT IGNORE INTO Incasso(dataInizio, dataFine, incasso, codF, codInd) VALUES 
 ('2006-01-10', '2006-01-17', 6464388, 2, 16395),
 ('2006-01-17', '2006-01-24', 5383317, 2, 16395),
 ('2006-01-24', '2006-01-31', 9331596, 2, 16395),
 ('2006-01-31', '2006-02-07', 7397243, 2, 16395),
 ('2006-02-07', '2006-02-14', 6532653, 2, 16395),
 ('2006-02-14', '2006-02-21', 3862953, 2, 16395),
 ('2006-02-21', '2006-02-28', 1143411, 2, 16395),
 ('2006-02-28', '2006-03-07', 1808331, 2, 16395);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (67856, '1987-03-14', 913045, null, 'IT28C5691061322926646213631', 2),
 (54583, '2006-06-22', 389257, null, 'IT26T1896812335575376603094', 2),
 (29463, '2007-03-11', 799200, null, 'IT45L1848278153874223172987', 2),
 (64546, '1973-07-21', 971189, null, 'IT32C1939957617651498822468', 2);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES 
 (29694, '1997-10-22', 880389, 'IT64A3586692220111081233032', null, 2);
INSERT IGNORE INTO MembroTroupeScena(codScena ,CF) VALUES 
 (30366, 'VRCNNT21T25L219B'),
 (30366, 'MNDGLR22H01L219X'),
 (30366, 'VRCNNT21T25L219B'),
 (30366, 'MNTGTN21T29L219D'),
 (30366, 'VNLMRA22A15L219D'),
 (36290, 'RMNNCI22L01L219L'),
 (36290, 'LPRGZN22A13L219T'),
 (36290, 'PPEPNI21T31L219B'),
 (36290, 'CRSFRD21T26L219V'),
 (36290, 'BDNNCL22A18L219O'),
 (41029, 'TMMSLL21T31L219I'),
 (41029, 'MRNNNL21T22L219I'),
 (41029, 'VRDGZN21T25L219T'),
 (41029, 'MNTMLT21T26L219Z'),
 (41029, 'VRDGZN21T25L219T'),
 (47731, 'VNLMRA22A15L219D'),
 (47731, 'MRNNNL21T22L219I'),
 (47731, 'BCCFRN21T22L219U'),
 (47731, 'MNTGTN21T29L219D'),
 (47731, 'MRNNNL21T22L219I'),
 (91944, 'TZZGTV22S01L219E'),
 (91944, 'CRSFRD21T26L219V'),
 (91944, 'TMMSLL21T31L219I'),
 (91944, 'RMNNCI22L01L219L'),
 (91944, 'MNTMLT21T26L219Z'),
 (94933, 'MNTMLT21T26L219Z'),
 (94933, 'VNLMRA22A15L219D'),
 (94933, 'VTTRNN21T31L219Y'),
 (94933, 'TZZGTV22S01L219E'),
 (94933, 'MNTMLT21T26L219Z'),
 (64303, 'VTTRNN21T31L219Y'),
 (64303, 'VRCNNT21T25L219B'),
 (64303, 'VTTRNN21T31L219Y'),
 (64303, 'MRNNNL21T22L219I'),
 (64303, 'BCCFRN21T22L219U'),
 (10377, 'MNDGLR22H01L219X'),
 (10377, 'VNLMRA22A15L219D'),
 (10377, 'MNDGLR22H01L219X'),
 (10377, 'VRDGZN21T25L219T'),
 (10377, 'MNDGLR22H01L219X'),
 (79318, 'LPRGZN22A13L219T'),
 (79318, 'MNDGLR22H01L219X'),
 (79318, 'MNDGLR22H01L219X'),
 (79318, 'BCCFRN21T22L219U'),
 (79318, 'RMNNCI22L01L219L'),
 (41972, 'VRCNNT21T25L219B'),
 (41972, 'VTTRNN21T31L219Y'),
 (41972, 'MNTMLT21T26L219Z'),
 (41972, 'MRCMRN22A18L219J'),
 (41972, 'VTTRNN21T31L219Y'),
 (93610, 'CRSFRD21T26L219V'),
 (93610, 'VNLMRA22A15L219D'),
 (93610, 'RMNNCI22L01L219L'),
 (93610, 'RMNNCI22L01L219L'),
 (93610, 'VTTRNN21T31L219Y'),
 (89826, 'BCCFRN21T22L219U'),
 (89826, 'VNLMRA22A15L219D'),
 (89826, 'VTTRNN21T31L219Y'),
 (89826, 'LPRGZN22A13L219T'),
 (89826, 'BDNNCL22A18L219O'),
 (92272, 'PPEPNI21T31L219B'),
 (92272, 'TMMSLL21T31L219I'),
 (92272, 'PPEPNI21T31L219B'),
 (92272, 'TZZGTV22S01L219E'),
 (92272, 'BCCFRN21T22L219U'),
 (74996, 'MNDGLR22H01L219X'),
 (74996, 'TZZGTV22S01L219E'),
 (74996, 'VRDGZN21T25L219T'),
 (74996, 'BCCFRN21T22L219U'),
 (74996, 'NTTGLI22S01L219Y'),
 (62135, 'LPRGZN22A13L219T'),
 (62135, 'TMMSLL21T31L219I'),
 (62135, 'VNLMRA22A15L219D'),
 (62135, 'TZZGTV22S01L219E'),
 (62135, 'NTTGLI22S01L219Y'),
 (96686, 'TZZGTV22S01L219E'),
 (96686, 'VRDGZN21T25L219T'),
 (96686, 'VTTRNN21T31L219Y'),
 (96686, 'RMNNCI22L01L219L'),
 (96686, 'MNDGLR22H01L219X'),
 (10737, 'RMNNCI22L01L219L'),
 (10737, 'PPEPNI21T31L219B'),
 (10737, 'BDNNCL22A18L219O'),
 (10737, 'LPRGZN22A13L219T'),
 (10737, 'VNLMRA22A15L219D'),
 (96961, 'CRSFRD21T26L219V'),
 (96961, 'MNTGTN21T29L219D'),
 (96961, 'VNLMRA22A15L219D'),
 (96961, 'BCCFRN21T22L219U'),
 (96961, 'NTTGLI22S01L219Y'),
 (12939, 'LPRGZN22A13L219T'),
 (12939, 'VRDGZN21T25L219T'),
 (12939, 'LPRGZN22A13L219T'),
 (12939, 'VTTRNN21T31L219Y'),
 (12939, 'LPRGZN22A13L219T');
INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES 
(30880, 14, 71, 'giugno'),
(89882, 31, 112, 'maggio'),
(73004, 25, 47, 'settembre'),
(20597, 35, 89, 'agosto'),
(92728, 26, 184, 'gennaio'),
(75938, 38, 52, 'febbraio'),
(24126, 28, 113, 'marzo'),
(39403, 11, 106, 'giugno'),
(70617, 7, 83, 'agosto'),
(48722, 30, 88, 'marzo'),
(22934, 13, 126, 'marzo'),
(62625, 39, 118, 'maggio'),
(17963, 19, 118, 'gennaio'),
(93703, 26, 66, 'luglio'),
(71646, 18, 124, 'agosto'),
(22341, 30, 157, 'ottobre'),
(91311, 45, 161, 'febbraio'),
(63034, 14, 99, 'novembre'),
(95896, 28, 136, 'marzo');
INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES
('PPEPNI21T31L219B', 30880),
('TMMSLL21T31L219I', 89882),
('TZZGTV22S01L219E', 73004),
('VNLMRA22A15L219D', 20597),
('CRSFRD21T26L219V', 92728),
('VRCNNT21T25L219B', 75938),
('VRDGZN21T25L219T', 24126),
('MNTMLT21T26L219Z', 39403),
('LPRGZN22A13L219T', 70617),
('MRNNNL21T22L219I', 48722),
('VTTRNN21T31L219Y', 22934),
('BCCFRN21T22L219U', 62625),
('MNDGLR22H01L219X', 17963),
('NTTGLI22S01L219Y', 93703),
('RMNNCI22L01L219L', 71646),
('MNTGTN21T29L219D', 22341),
('MRCMRN22A18L219J', 91311),
('BDNNCL22A18L219O', 63034),
('FCNRTR21T31L219O', 95896);




INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES (3, 'La Mummia','fantascienza', 120, '1999/5/27'  , NULL); 


INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES (4, 'ritorno al futuro II','fantascienza', 108, '1989/10/5'  , NULL); 