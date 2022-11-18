#Zadanie 1;
SELECT * from postac;
SELECT * from postac WHERE rodzaj='wiking' ORDER BY wiek DESC limit 2;
DELETE FROM postac ORDER BY wiek DESC limit 2;
#1.2
		#1 sposób 
ALTER TABLE postac drop CONSTRAINT postac_ibfk_1;
  ALTER table przetwory DROP constraint przetwory_ibfk_2;
  ALTER table przetwory DROP constraint przetwory_ibfk_1;
  ALTER table walizka DROP constraint walizka_ibfk_1;
  ALTER TABLE izba drop constraint izba_ibfk_1;
      ALTER TABLE postac drop id_postaci;
      #2 sposób
alter table postac modify id_postaci int;
SET foreign_key_checks = 0;

#zadanie 2
ALTER table postac ADD pesel char(11);
ALTER table postac ADD primary key(pesel);
  #2.2
   ALTER table postac MODIFY COLUMN rodzaj enum('wiking','ptak','kobieta','syrena');
  #2.3
  INSERT INTO postac(nazwa,rodzaj,data_ur,wiek,pesel) 
  VALUES('Gertruda Nieszczera','syrena','1966-02-04',30,'28572857298');
  #zadanie 3
UPDATE postac SET statek='statek1' WHERE nazwa LIKE '%a%';
		# lub WHERE nazwa regexp '[a]'; '[0-9]{0,3}' wystepuja liczby od 0 do 9 maksymalnie 3 razy
#3.2
 UPDATE statek SET max_ladownosc=max_ladownosc * 0.7
 WHERE data_wodowanie < '2000-01-01' AND data_wodowanie >= '1900-01-01';
 #add check(wiek<=1000) nie pozwoli inserta jesli warunek
#3.3
SELECT * from postac WHERE wiek <= 1000;

#zadanie 4
SELECT * from postac;
INSERT into postac(nazwa,data_ur,wiek,pesel) VALUES ('LOKO','1994-04-15','20','72847265789');
#4.2
CREATE TABLE `Marynarz` (
  `nazwa` varchar(40) NOT NULL,	
  `rodzaj` enum('wiking','ptak','kobieta','syrena') DEFAULT NULL,
  `data_ur` date DEFAULT NULL,
  `wiek` int unsigned DEFAULT NULL,
  `funkcja` varchar(50) DEFAULT NULL,
  `statek` varchar(50) DEFAULT NULL,
  `pesel` char(11) NOT NULL,
  PRIMARY KEY (`pesel`));
#4.2
    INSERT into Marynarz(nazwa,rodzaj,data_ur,wiek,funkcja,statek,pesel) 
    SELECT nazwa,rodzaj,data_ur,wiek,funkcja,statek,pesel FROM postac WHERE statek IS not null;
#4.3
ALTER TABLE Marynarz ADD foreign key(pesel) REFERENCES postac(pesel);

#zad 5
UPDATE Marynarz SET statek='null';
SELECT * from Marynarz;
#5.2
DELETE from Marynarz WHERE nazwa='Wiking1';
#5.3
SELECT * from statek;
DELETE from statek;
#5.4,
DROP table statek;
#5.5
CREATE table zwierz (zwierz_id char(11) NOT NULL ,nazwa  varchar(40), wiek INT, PRIMARY KEY(zwierz_id));
#5.6
INSERT into zwierz(zwierz_id,nazwa,wiek) SELECT pesel,nazwa,wiek FROM postac WHERE rodzaj='ptak';
SELECT * from zwierz;



