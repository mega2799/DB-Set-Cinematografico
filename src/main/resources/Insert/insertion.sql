INSERT IGNORE INTO Film(codF, titolo, genere, durata, dataUscita, idSerie)
	VALUES(00001, 'Star Wars: Episodio VI - Il ritorno dello Jedi',
				'fantascienza', 134, '1983/05/25'  , NULL) ;

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES(24673, 'nicasio',
						'lucas valley rid', 5858, 94946);
	-- casa di george lucas


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
				'1944/05/14', '516-527-8719', 24673,1.5);



INSERT IGNORE INTO RuoloMembroTroupe(CF, nomeRuolo) VALUES ('GRGLCS14ES44', 'Produttore Esecutivo'), ('GRGLCS14ES44', 'Sceneggiatore') , ('GRGLCS14ES44', 'Produttore');

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- sceneggiatore George Lucas
	VALUES ('GRGLCS14ES44', 'George', 'Lucas', 'GB98BARC20040156884556',
				'1944/05/14', '516-527-8719', 24673,1.5);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- sceneggiatore George Lucas
	VALUES ('GRGLCS14ES44', 'George', 'Lucas', 'GB98BARC20040156884556',
				'1944/05/14', '516-527-8719', 24673,1.5);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- George lucas
    VALUES (1, 'GRGLCS14ES44');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES(38734, 'cardiff',
						'st angel str', 89, 15234);
	-- casa regista

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- regista
	VALUES ('RCHMRQ22IS37', 'Richard', 'Marquand', 'GB98BARC20035361814589',
				'1937/12/22', '205-802-5689', 38734, 1.5);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- regista
    VALUES (1, 'RCHMRQ22IS37');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES(37065, 'north malvinafurt',
						'ryan turnpike', 198, 56893);
	-- Mark Hamill

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Luke Skywalker
	VALUES ('MRKHML25IS51', 'Mark', 'Hamill', 'GB56BARC20038438638758',
				'1951/09/25', '214-989-5138', 37065, NULL);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- luke
    VALUES (1, 'MRKHML25IS51');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES(19639, 'lake khalidside',
						'heidenreich ways', 338, 81079);
	-- Harry Ford

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Ian solo
	VALUES ('HRSFRD13GS42', 'Harrison', 'Ford', 'GB25BARC20039569987273',
				'1942-07-13', '205-944-3057', 19639, NULL);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- ian
    VALUES (1, 'HRSFRD13GS42');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP) VALUES(19447, 'south erictown',
						'dereck hill', 473, 89559);
	-- Carrie Fisher

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Leila Skywalker
	VALUES ('CRRFSH21NS56','Carrie', 'Fisher', 'GB20BARC20031835638431',
				'1956-12-21', '231-687-4750', 19447, NULL);
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- leila
    VALUES (1, 'CRRFSH21NS56');


INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	--sede della twenty century
    VALUES(18302, 'san francisco', 'gorgas ave', 1, 94129);

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	--sede territoriale della twenty century
    VALUES(16395, 'roma', 'Cantalupo in Sabina', 29, 19100);

INSERT IGNORE INTO Enti(P_IVA,nome,codInd)
    -- ente di distribuizone
    VALUES (40365320379, "Twenty Century", 16395);

INSERT IGNORE INTO SediTerritoriali(P_IVA, codInd)
    VALUES (40365320379, 16395);

INSERT IGNORE INTO SerieLetteraria(idSerie, titolo, genere , CF)
    -- serie letteraria scritta da george lucas
    VALUES ( 'MRVCMCSW', 'Star Wars-Marvel Comic', 'Sci-fi', 'GRGLCS14ES44');

INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome)
    -- MC
    VALUES('21708660770', 'McDonald SPA');

INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome)
    -- Porsche
    VALUES('77072550757', 'Porsche');

INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome)
    -- Bose
    VALUES('29218600871', 'Bose');

INSERT IGNORE INTO Sponsor(P_IVA_SPONSOR, nome)
    -- Samsung
    VALUES('53179880082', 'Samsung Galaxy');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	-- indirizzo michel barnaby
    VALUES(49429, 'New Henderson', 'Gislason Ridge', 605, 47614);

INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno)
    -- Finanziatore 1
    VALUES('31562270996', 'Micheal Barnaby', 49429, 3.2);

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	-- indirizzo starbucks
    VALUES(15293, 'Vermont', 'Jayden Villages', 3444, 54808 );

INSERT IGNORE INTO Finanziatore(P_IVA_FINANZIATORE, nome,codInd ,percentualeGuadagno)
    -- La starbucks che investe in starWars !
    VALUES('40211260761', 'Starbucks',  15293 , 0.19);

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo aiuto regista
        VALUES(17349, 'Arielleport', 'Ashton Tunnel', 645, 48937);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Aiuto regista
	VALUES ('GLBTLY12DS14','Gilbert', 'Taylor', 'GB77BARC20038424775819',
				'1914-04-12', '582-583-2011', 17349, 3);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- Aiuto regista
    VALUES (1, 'GLBTLY12DS14');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo capo regista
        VALUES(19834, 'North Christellemouth', 'Keagan Circles', 6, 35637);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Capo regista
	VALUES ('ANWJRGA24S33','Andrew', 'Jorge', 'GB13BARC20038029125126',
				'1933-01-24', '342-112-5431', 19834, NULL);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- capo regista
    VALUES (1, 'ANWJRGA24S33');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo Stilista
        VALUES(17439, 'Maine', 'McDermott Manors', 339, 33812);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Stilista
	VALUES ('JNTSTYD27S39','Jonathan', 'Style', 'GB44BARC20031817174534',
				'1939-04-27', '623-988-4632', 17439, NULL);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- stilista
    VALUES (1, 'JNTSTYD27S39');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo Operatore fonico
        VALUES(19900, 'Indiana', 'Brayan Square', 672, 14329);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Operatore Fonico
	VALUES ('KVNMCGE03S18','Kevin', 'McGrail', 'GB44BARC20031817137209',
				'1918-05-03', '724-829-1163', 19900, NULL);
INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- operatore fonico
    VALUES (1, 'KVNMCGE03S18');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo Operatore fotografico
        VALUES(12346, 'Lake Nyahmouth', 'McGlynn Brooks', 418, 70444);

INSERT IGNORE INTO MembroTroupe(CF, nome, cognome, iban, dataNascita, telefono,
							codInd, percentualeContributo)
	-- Operatore fotografico
	VALUES ('DVDCLLOE03S18','David', 'Chiello', 'GB44BARC20031817137209',
				'1918-05-03', '724-829-1163', 12346, NULL);

INSERT IGNORE INTO Film_Membro_Troupe(codF, CF)
    -- operatore fotografico
    VALUES (1, 'DVDCLLOE03S18');

INSERT IGNORE INTO Indirizzo(codInd, citta, via, civico, CAP)
	    -- indirizzo Magazzino
        VALUES(19341, 'South Veronafurt', 'Alejandra Ports', 658, 28270);

INSERT IGNORE INTO Magazzino(numMagazzino, codInd)
    -- magazzino principale
    VALUES(1,19341);

INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP)
    -- costume Luke
    VALUES(49262 ,'fantasia','Costume di Luke Skywalker, kimono nero, stivali, spada Laser Verde','MRKHML25IS51', 25588);

INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso)
    -- Posizione costume luke skywalker
VALUES(25588, 1, 2, 'S');

INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP)
    -- costume Leila
    VALUES(53921 ,'fantasia','Costume di Leila, bikini Jabba the Hat','CRRFSH21NS56', 25252);

INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso)
    -- Posizione costume leila
VALUES(25252, 1, 41, 'S');


INSERT IGNORE INTO Costume(codC, tipo, descrizione, CF, codP)
    -- costume Han Solo
    VALUES(47429 ,'fantasia','Costume di Han Solo, piastra di metallo, pistola, giubboto','HRSFRD13GS42', 84425);

INSERT IGNORE INTO PosizioneMagazzino(codP, numMagazzino, scaffale, percorso)
    -- Posizione costume han solo
VALUES(84425, 1, 7, 'N');
