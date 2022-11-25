#LAB 5
#-----------------------------------------------------zad 1-------------------------------------------
#1.1
CREATE TABLE gorczynskim.kreatura AS SELECT * from wikingowie.kreatura;
#1.2
CREATE TABLE gorczynskim.zasob AS SELECT * from wikingowie.zasob;
#1.3
CREATE table gorczynskim.ekwipunek AS SELECT * from wikingowie.ekwipunek;
#-----------------------------------------------------zad 2-------------------------------------------
#2.1
SELECT * from kreatura WHERE NOT rodzaj='wiedzma' AND udzwig > 50 or udzwig = 50;
#2.2
SELECT * from zasob WHERE waga >= 2 and waga <=5;
#2.3
SELECT * from kreatura WHERE nazwa like '%or%' AND UDZWIG BETWEEN 30 and 100;
#-----------------------------------------------------zad 3-------------------------------------------
#3.1
SELECT * from zasob  where month(dataPozyskania) = 7 OR month(dataPozyskania) = 8;
#3.2
select * from zasob ORDER BY waga ASC;
#3.3
SELECT * FROM kreatura ORDER BY dataUr ASC limit 5;
#-----------------------------------------------------zad 4-------------------------------------------
#4.1
SELECT DISTINCT rodzaj from zasob;
#4.2
SELECT CONCAT(nazwa,' ',rodzaj) AS 'nazwa-rodzaj' FROM zasob;
#4.3
SELECT * from zasob;
SELECT nazwa,ilosc*waga AS waga_calkowita FROM zasob WHERE dataPozyskania >= '2000-01-01' AND dataPozyskania <= '2007-12-30';
#-----------------------------------------------------zad 5--------------------------------------------
#5.1
SELECT nazwa,waga*0.7 AS 'masa wlasciwa jedzenia', waga*0.3 AS 'waga odpadkow' from zasob WHERE rodzaj='jedzenie';
#5.2
SELECT * from zasob where rodzaj is null;
#5.3
SELECT * from zasob;
SELECT DISTINCT nazwa,rodzaj from zasob WHERE nazwa like '%os' AND nazwa like 'Ba%' ORDER BY rodzaj ASC;