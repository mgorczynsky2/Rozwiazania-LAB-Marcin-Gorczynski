#LAB 6
#---------------------------------------------zad1-------------------------------------------------------
#1.1
SELECT avg(waga) from kreatura where rodzaj='wiking';
#sum,max,min,count
#1.2
SELECT * from kreatura;
SELECT avg(waga),rodzaj from kreatura GROUP BY rodzaj;
#1.3
SELECT avg(wiek),rodzaj from kreatura GROUP BY rodzaj;
SELECT rodzaj,avg(year(now())-year(dataUr)) AS wiek from kreatura GROUP BY rodzaj;
#---------------------------------------------zad2-------------------------------------------------------
#2.1
SELECT * from zasob;
SELECT rodzaj,sum(waga) from zasob GROUP BY rodzaj;
#2.2
SELECT sum(waga),nazwa,avg(waga) from zasob group by nazwa HAVING avg(waga)>=4 AND sum(waga)>=10;
#2.3
SELECT rodzaj,count(distinct(nazwa)) from zasob WHERE ilosc >1 GROUP by rodzaj;
#---------------------------------------------zad3-------------------------------------------------------
#3.1
select * from kreatura;
select * from ekwipunek;
select * from zasob;
SELECT nazwa,ilosc from kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury GROUP by nazwa;
#3.2
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury 
INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu);
#3.3
SELECT kreatura.nazwa,ekwipunek.idKreatury FROM kreatura LEFT JOIN ekwipunek on (kreatura.idKreatury=ekwipunek.idKreatury) 
WHERE ekwipunek.idEkwipunku is null;
#---------------------------------------------zad4-------------------------------------------------------
#4.1
SELECT kreatura.nazwa,kreatura.dataUr,zasob.nazwa from kreatura 
INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu)
WHERE year(dataUr) between 1670 and 1680;
#4.2
SELECT kreatura.nazwa,kreatura.dataUr,zasob.nazwa from kreatura 
INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu)
WHERE zasob.rodzaj ='jedzenie';
#4.3
SELECT * from kreatura where
