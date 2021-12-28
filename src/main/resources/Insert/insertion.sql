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

INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE,codF)
    -- george lucas ha contribuito al fondo
VALUES (1, '1977-01-05', 2000000, '53179880082', null, 1);


INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF)
-- scena
VALUES (00456, 'Scena in cui luke skywalker salva la principessa leila dalle grinfie di Dart Vader', 4, 5, 2, 200, 1),
    (04745, 'Scena in cui luke skywalker distrugge la morte nera', 15, 1, .5, 200, 1),
    (03245, 'Scena in cui luke skywalker assiste alla morte di obi wan', 11, 7, 4, 200, 1),
    (00789, 'Scena in cui luke skywalker guida il millenium falcon con Ian solo', 5, 5, 3, 200, 1);

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

-- FAKEEEEEEEE


INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES(00002, 'Il signore degli anelli, la compagnia dell anello','fantascienza', 134, '1983/05/25'  , NULL) ;


INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES
(55671, 'Ludovica a mare', 'Vicolo Mogherini', '21', 52675),
(70396, 'Tacchini lido', 'Rotonda Papafava', '0', 45280),
(53784, 'Quarto Oreste terme', 'Stretto Gabriella', '24', 91197),
(89214, 'San Amico', 'Via Giorgia', '2', 68760),
(56764, 'Sesto Antonio', 'Viale Pertini', '66', 24988),
(28926, 'Camuccini a mare', 'Contrada Comolli', '234', 34418),
(40323, 'Borgo Gianpaolo', 'Piazza Don�', '64', 62579),
(48933, 'Marissa salentino', 'Viale Muratori', '035', 37890),
(83540, 'Tomasetti calabro', 'Canale Ornella', '17', 57551),
(24450, 'Settimo Cassandra sardo', 'Canale Piersanti', '49', 1134),
(56085, 'Buonauro a mare', 'Strada Germana', '76', 43369),
(82388, 'Pellegrino calabro', 'Stretto Uberto', '7', 61208),
(17386, 'Borgo Gionata', 'Contrada Siffredi', '260', 76300),
(53519, 'San Stella a mare', 'Strada Boito', '77', 81034),
(75459, 'Vittorio a mare', 'Viale Marinetti', '56', 34694),
(60901, 'Coardi umbro', 'Contrada Sagnelli', '856', 54923),
(42371, 'Greca umbro', 'Piazza Lauretta', '191', 38812),
(89658, 'Girolamo salentino', 'Stretto Foletti', '737', 32034),
(70482, 'Borgo Ottavio', 'Incrocio Ninetta', '20', 43724);
INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono, codInd) VALUES
('MDNPRD21S12L219Z', 'Modiano', 'Paride', 'IT67F1238721499172549050729', '2021-12-11', '+39 931 7175255', 55671),
('BRGCSN21T15L219B', 'Borghese', 'Cassandra', 'IT29W8461878678716168659467', '2021-12-15', '+39 7897 21859241', 70396),
('TLNMME21T16L219X', 'Tolentino', 'Emma', 'IT48Q7727721049168561970957', '2021-12-16', '+39 7741 2320215', 53784),
('CVNFMM21E12L219K', 'Cavanna', 'Fiamma', 'IT92U5262530806363367530437', '2021-12-05', '+39 133 36023546', 89214),
('PZZMLD21T15L219M', 'Pizzo', 'Matilda', 'IT50X7630394681807095992732', '2021-12-15', '+39 9642 77040347', 56764),
('PNNRTI21T21L219F', 'Pennetta', 'Rita', 'IT50W5471862424360581079570', '2021-12-21', '+39 74 9865415', 28926),
('PCLBTN21T22L219Y', 'Pacelli', 'Bettina', 'IT74M5154536686612755798088', '2021-12-22', '+39 3662 69576338', 40323),
('CBNRMN21T19L219Y', 'Cibin', 'Romana', 'IT53D0655627380693965175235', '2021-12-19', '+39 62 4280941', 48933),
('CLLGCM21T20L219A', 'Collodi', 'Giacomo', 'IT60Y8429242145201582881613', '2021-12-20', '+39 98 4728480', 83540),
('CSLRLL21T15L219B', 'Casaleggio', 'Ornella', 'IT87P1434093086756617972081', '2021-12-15', '+39 266 98 17 5021', 24450),
('GLGLSI21M12L219K', 'Golgi', 'Lisa', 'IT91C5753649765610012514091', '2021-12-08', '+39 118 56 02 4038', 56085),
('MNTSMN21E12L219X', 'Montalti', 'Simone', 'IT86X5418572993780323277210', '2021-12-05', '+39 62 25747525', 82388),
('NTNLGO21C12L219Y', 'Antonetti', 'Olga', 'IT89C8869639087114525460600', '2021-12-03', '+39 6054 83993970', 17386),
('MRCFRC21T12L219P', 'Mercalli', 'Federica', 'IT58G8793370424853990182411', '2021-12-12', '+39 694 45362080', 53519),
('BRTLCU21T14L219F', 'Bertoni', 'Lucio', 'IT40R3419089113866843166728', '2021-12-14', '+39 025 7657439', 75459),
('SSNRMN21T24L219L', 'Ossani', 'Ramona', 'IT71S1396547240746013669314', '2021-12-24', '+39 3063 38620804', 60901),
('PLMFRG21S29L219A', 'Palmisano', 'Federigo', 'IT68J1817534331435233873159', '2021-11-29', '+39 84 91829338', 42371),
('SLNLNE21R12L219G', 'Salandra', 'Leone', 'IT75T5421519163109004409298', '2021-12-10', '+39 10 81779662', 89658),
('SSNGLI21T26L219N', 'Ossani', 'Gioele', 'IT89R5155352165522411135115', '2021-12-26', '+39 52 79560091', 70482);
INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES
('MDNPRD21S12L219Z', 'operatore fotografico'),
('BRGCSN21T15L219B', 'regista'),
('TLNMME21T16L219X', 'sceneggiatore'),
('CVNFMM21E12L219K', 'attore'),
('PZZMLD21T15L219M', 'regista'),
('PNNRTI21T21L219F', 'stilista'),
('PCLBTN21T22L219Y', 'produttore esecutivo'),
('CBNRMN21T19L219Y', 'stilista'),
('CLLGCM21T20L219A', 'regista'),
('CSLRLL21T15L219B', 'produttore'),
('GLGLSI21M12L219K', 'regista'),
('MNTSMN21E12L219X', 'operatore fotografico'),
('NTNLGO21C12L219Y', 'aiuto regista'),
('MRCFRC21T12L219P', 'produttore'),
('BRTLCU21T14L219F', 'sceneggiatore'),
('SSNRMN21T24L219L', 'produttore'),
('PLMFRG21S29L219A', 'regista'),
('SLNLNE21R12L219G', 'operatore fotografico'),
('SSNGLI21T26L219N', 'stilista');
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF) VALUES
(2, 'MDNPRD21S12L219Z'),
(2, 'BRGCSN21T15L219B'),
(2, 'TLNMME21T16L219X'),
(2, 'CVNFMM21E12L219K'),
(2, 'PZZMLD21T15L219M'),
(2, 'PNNRTI21T21L219F'),
(2, 'PCLBTN21T22L219Y'),
(2, 'CBNRMN21T19L219Y'),
(2, 'CLLGCM21T20L219A'),
(2, 'CSLRLL21T15L219B'),
(2, 'GLGLSI21M12L219K'),
(2, 'MNTSMN21E12L219X'),
(2, 'NTNLGO21C12L219Y'),
(2, 'MRCFRC21T12L219P'),
(2, 'BRTLCU21T14L219F'),
(2, 'SSNRMN21T24L219L'),
(2, 'PLMFRG21S29L219A'),
(2, 'SLNLNE21R12L219G'),
(2, 'SSNGLI21T26L219N');
INSERT IGNORE INTO Membro_Troupe_Scena(codScena ,CF) VALUES
(71581, 'SSNRMN21T24L219L'),
(71581, 'CLLGCM21T20L219A'),
(71581, 'PLMFRG21S29L219A'),
(71581, 'CSLRLL21T15L219B'),
(58874, 'TLNMME21T16L219X'),
(58874, 'MDNPRD21S12L219Z'),
(58874, 'SSNGLI21T26L219N'),
(58874, 'BRTLCU21T14L219F'),
(11524, 'SSNRMN21T24L219L'),
(11524, 'GLGLSI21M12L219K'),
(11524, 'NTNLGO21C12L219Y'),
(11524, 'CBNRMN21T19L219Y'),
(88818, 'CLLGCM21T20L219A'),
(88818, 'SSNRMN21T24L219L'),
(88818, 'CBNRMN21T19L219Y'),
(88818, 'CBNRMN21T19L219Y'),
(79773, 'SSNGLI21T26L219N'),
(79773, 'SSNGLI21T26L219N'),
(79773, 'SLNLNE21R12L219G'),
(79773, 'PNNRTI21T21L219F'),
(36694, 'CVNFMM21E12L219K'),
(36694, 'GLGLSI21M12L219K'),
(36694, 'MNTSMN21E12L219X'),
(36694, 'CVNFMM21E12L219K'),
(42630, 'BRTLCU21T14L219F'),
(42630, 'PZZMLD21T15L219M'),
(42630, 'GLGLSI21M12L219K'),
(42630, 'SSNRMN21T24L219L'),
(28021, 'BRGCSN21T15L219B'),
(28021, 'BRTLCU21T14L219F'),
(28021, 'GLGLSI21M12L219K'),
(28021, 'CBNRMN21T19L219Y'),
(96019, 'CSLRLL21T15L219B'),
(96019, 'BRTLCU21T14L219F'),
(96019, 'SSNRMN21T24L219L'),
(96019, 'BRGCSN21T15L219B'),
(12771, 'TLNMME21T16L219X'),
(12771, 'MDNPRD21S12L219Z'),
(12771, 'SSNGLI21T26L219N'),
(12771, 'PNNRTI21T21L219F'),
(36693, 'BRGCSN21T15L219B'),
(36693, 'CBNRMN21T19L219Y'),
(36693, 'BRTLCU21T14L219F'),
(36693, 'SLNLNE21R12L219G'),
(11047, 'SSNRMN21T24L219L'),
(11047, 'MNTSMN21E12L219X'),
(11047, 'MRCFRC21T12L219P'),
(11047, 'PCLBTN21T22L219Y'),
(49448, 'SSNRMN21T24L219L'),
(49448, 'BRGCSN21T15L219B'),
(49448, 'CLLGCM21T20L219A'),
(49448, 'PZZMLD21T15L219M'),
(83119, 'NTNLGO21C12L219Y'),
(83119, 'TLNMME21T16L219X'),
(83119, 'MNTSMN21E12L219X'),
(83119, 'MNTSMN21E12L219X'),
(78031, 'SSNGLI21T26L219N'),
(78031, 'NTNLGO21C12L219Y'),
(78031, 'NTNLGO21C12L219Y'),
(78031, 'MNTSMN21E12L219X'),
(36318, 'PNNRTI21T21L219F'),
(36318, 'PCLBTN21T22L219Y'),
(36318, 'CVNFMM21E12L219K'),
(36318, 'MDNPRD21S12L219Z'),
(97090, 'CSLRLL21T15L219B'),
(97090, 'PNNRTI21T21L219F'),
(97090, 'CBNRMN21T19L219Y'),
(97090, 'CLLGCM21T20L219A'),
(71315, 'PZZMLD21T15L219M'),
(71315, 'BRGCSN21T15L219B'),
(71315, 'CSLRLL21T15L219B'),
(71315, 'PLMFRG21S29L219A'),
(74647, 'PNNRTI21T21L219F'),
(74647, 'CLLGCM21T20L219A'),
(74647, 'PLMFRG21S29L219A'),
(74647, 'SLNLNE21R12L219G');
INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome) VALUES
('IT59R8851983256032379929003', 'Chevron');
INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno) VALUES
 ('IT22Q7726435055547424435868', 'Johnson & Johnson', 81735, 0.5557367978330571),
 ('IT93D1199916844817071051228', 'Bank of America', 53178, 0.15846973275013188),
 ('IT85J3255311792353701262713', 'Chevron', 65611, 0.7525756149516913),
 ('IT64Z8940558839232834774506', 'Boeing', 75618, 0.9269581558630238);
INSERT IGNORE INTO ScenaCiak(codScena, noteDiProduzione, rullo, numRiprese, durataOre, costoAffittoGiornaliero, codF) VALUES
 (78363, 'Scena n. 0', 10, 986, 718, 59, 2),
 (89850, 'Scena n. 1', 79, 709, 607, 17, 2),
 (47206, 'Scena n. 2', 77, 909, 428, 96, 2),
 (73611, 'Scena n. 3', 81, 100, 699, 28, 2),
 (38746, 'Scena n. 4', 52, 762, 699, 37, 2),
 (40719, 'Scena n. 5', 32, 780, 115, 48, 2),
 (84101, 'Scena n. 6', 86, 460, 327, 17, 2),
 (24162, 'Scena n. 7', 43, 178, 730, 42, 2),
 (52803, 'Scena n. 8', 24, 588, 527, 84, 2),
 (55566, 'Scena n. 9', 67, 314, 351, 99, 2),
 (90899, 'Scena n. 10', 24, 813, 954, 14, 2),
 (33504, 'Scena n. 11', 16, 949, 246, 93, 2),
 (12547, 'Scena n. 12', 48, 597, 391, 92, 2),
 (15829, 'Scena n. 13', 30, 306, 266, 60, 2),
 (51663, 'Scena n. 14', 11, 766, 943, 95, 2),
 (91646, 'Scena n. 15', 81, 543, 508, 39, 2),
 (12985, 'Scena n. 16', 78, 972, 909, 32, 2),
 (65086, 'Scena n. 17', 20, 380, 282, 34, 2),
 (76656, 'Scena n. 18', 48, 765, 574, 69, 2);
INSERT IGNORE INTO Fondo(codFondo, dataAccredito, patrimonio, P_IVA_SPONSOR, P_IVA_FINANZIATORE, codF) VALUES
 (82171, '1996-08-02', 905726, 'NULL', 'IT22Q7726435055547424435868', 2),
 (56035, '2021-11-07', 602526, 'NULL', 'IT93D1199916844817071051228', 2),
 (93559, '2005-11-22', 176009, 'NULL', 'IT85J3255311792353701262713', 2),
 (42523, '1984-04-20', 704837, 'NULL', 'IT64Z8940558839232834774506', 2);
INSERT IGNORE INTO Membro_Troupe_Scena(codScena ,CF) VALUES
 (78363, 'PNNRTI21T21L219F'),
 (78363, 'SLNLNE21R12L219G'),
 (78363, 'GLGLSI21M12L219K'),
 (78363, 'PCLBTN21T22L219Y'),
 (78363, 'CSLRLL21T15L219B'),
 (89850, 'TLNMME21T16L219X'),
 (89850, 'BRTLCU21T14L219F'),
 (89850, 'CLLGCM21T20L219A'),
 (89850, 'CVNFMM21E12L219K'),
 (89850, 'CBNRMN21T19L219Y'),
 (47206, 'CLLGCM21T20L219A'),
 (47206, 'SSNGLI21T26L219N'),
 (47206, 'CSLRLL21T15L219B'),
 (47206, 'MRCFRC21T12L219P'),
 (47206, 'SSNGLI21T26L219N'),
 (73611, 'PZZMLD21T15L219M'),
 (73611, 'NTNLGO21C12L219Y'),
 (73611, 'GLGLSI21M12L219K'),
 (73611, 'CVNFMM21E12L219K'),
 (73611, 'MNTSMN21E12L219X'),
 (38746, 'PZZMLD21T15L219M'),
 (38746, 'TLNMME21T16L219X'),
 (38746, 'MDNPRD21S12L219Z'),
 (38746, 'PNNRTI21T21L219F'),
 (38746, 'PZZMLD21T15L219M'),
 (40719, 'TLNMME21T16L219X'),
 (40719, 'CLLGCM21T20L219A'),
 (40719, 'PCLBTN21T22L219Y'),
 (40719, 'PZZMLD21T15L219M'),
 (40719, 'MNTSMN21E12L219X'),
 (84101, 'PLMFRG21S29L219A'),
 (84101, 'SSNRMN21T24L219L'),
 (84101, 'TLNMME21T16L219X'),
 (84101, 'SSNGLI21T26L219N'),
 (84101, 'CLLGCM21T20L219A'),
 (24162, 'MRCFRC21T12L219P'),
 (24162, 'MRCFRC21T12L219P'),
 (24162, 'MDNPRD21S12L219Z'),
 (24162, 'BRTLCU21T14L219F'),
 (24162, 'SSNRMN21T24L219L'),
 (52803, 'CSLRLL21T15L219B'),
 (52803, 'CSLRLL21T15L219B'),
 (52803, 'BRGCSN21T15L219B'),
 (52803, 'BRTLCU21T14L219F'),
 (52803, 'CBNRMN21T19L219Y'),
 (55566, 'TLNMME21T16L219X'),
 (55566, 'PCLBTN21T22L219Y'),
 (55566, 'TLNMME21T16L219X'),
 (55566, 'SSNGLI21T26L219N'),
 (55566, 'TLNMME21T16L219X'),
 (90899, 'CBNRMN21T19L219Y'),
 (90899, 'SSNGLI21T26L219N'),
 (90899, 'CBNRMN21T19L219Y'),
 (90899, 'PLMFRG21S29L219A'),
 (90899, 'MRCFRC21T12L219P'),
 (33504, 'MRCFRC21T12L219P'),
 (33504, 'SLNLNE21R12L219G'),
 (33504, 'GLGLSI21M12L219K'),
 (33504, 'SLNLNE21R12L219G'),
 (33504, 'PNNRTI21T21L219F'),
 (12547, 'BRGCSN21T15L219B'),
 (12547, 'CSLRLL21T15L219B'),
 (12547, 'CSLRLL21T15L219B'),
 (12547, 'CLLGCM21T20L219A'),
 (12547, 'MRCFRC21T12L219P'),
 (15829, 'PLMFRG21S29L219A'),
 (15829, 'CVNFMM21E12L219K'),
 (15829, 'MNTSMN21E12L219X'),
 (15829, 'BRGCSN21T15L219B'),
 (15829, 'CBNRMN21T19L219Y'),
 (51663, 'TLNMME21T16L219X'),
 (51663, 'PZZMLD21T15L219M'),
 (51663, 'BRGCSN21T15L219B'),
 (51663, 'PCLBTN21T22L219Y'),
 (51663, 'MRCFRC21T12L219P'),
 (91646, 'PNNRTI21T21L219F'),
 (91646, 'BRTLCU21T14L219F'),
 (91646, 'SLNLNE21R12L219G'),
 (91646, 'PLMFRG21S29L219A'),
 (91646, 'PNNRTI21T21L219F'),
 (12985, 'GLGLSI21M12L219K'),
 (12985, 'GLGLSI21M12L219K'),
 (12985, 'BRGCSN21T15L219B'),
 (12985, 'BRGCSN21T15L219B'),
 (12985, 'CSLRLL21T15L219B'),
 (65086, 'MDNPRD21S12L219Z'),
 (65086, 'NTNLGO21C12L219Y'),
 (65086, 'CSLRLL21T15L219B'),
 (65086, 'CBNRMN21T19L219Y'),
 (65086, 'TLNMME21T16L219X'),
 (76656, 'PZZMLD21T15L219M'),
 (76656, 'MNTSMN21E12L219X'),
 (76656, 'CBNRMN21T19L219Y'),
 (76656, 'BRTLCU21T14L219F'),
 (76656, 'MDNPRD21S12L219Z');
INSERT IGNORE INTO BustaPaga(codB, retribuzioneOraria, oreLavorate, mese) VALUES
(29490, 38, 127, 'aprile'),
(23187, 45, 104, 'maggio'),
(73221, 12, 139, 'febbraio'),
(45784, 45, 83, 'febbraio'),
(80290, 36, 179, 'gennaio'),
(36016, 31, 124, 'aprile'),
(69395, 51, 187, 'febbraio'),
(56042, 17, 160, 'febbraio'),
(88842, 51, 99, 'febbraio'),
(54963, 47, 148, 'marzo'),
(35445, 28, 154, 'settembre'),
(20926, 19, 110, 'gennaio'),
(74309, 30, 51, 'dicembre'),
(69813, 26, 73, 'dicembre'),
(37163, 39, 122, 'gennaio'),
(73740, 39, 197, 'novembre'),
(91084, 21, 115, 'gennaio'),
(99047, 44, 51, 'dicembre'),
(85060, 13, 155, 'agosto');
INSERT IGNORE INTO Retribuzione(CF, CodB) VALUES
('MDNPRD21S12L219Z', 29490),
('BRGCSN21T15L219B', 23187),
('TLNMME21T16L219X', 73221),
('CVNFMM21E12L219K', 45784),
('PZZMLD21T15L219M', 80290),
('PNNRTI21T21L219F', 36016),
('PCLBTN21T22L219Y', 69395),
('CBNRMN21T19L219Y', 56042),
('CLLGCM21T20L219A', 88842),
('CSLRLL21T15L219B', 54963),
('GLGLSI21M12L219K', 35445),
('MNTSMN21E12L219X', 20926),
('NTNLGO21C12L219Y', 74309),
('MRCFRC21T12L219P', 69813),
('BRTLCU21T14L219F', 37163),
('SSNRMN21T24L219L', 73740),
('PLMFRG21S29L219A', 91084),
('SLNLNE21R12L219G', 99047),
('SSNGLI21T26L219N', 85060);
