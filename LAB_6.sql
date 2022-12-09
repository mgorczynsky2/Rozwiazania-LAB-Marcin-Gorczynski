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
select * from kreatura,ekwipunek where kreatura.idKreatury=ekwipunek.idKreatury;
#inner join
select * from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatury;
select * from kreatura;
select * from ekwipunek;
select * from zasob;
SELECT nazwa,ilosc from kreatura INNER JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury GROUP by nazwa;
#3.2
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury 
INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu);
#3.3
SELECT kreatura.nazwa,ekwipunek.idKreatury FROM kreatura LEFT JOIN ekwipunek on (kreatura.idKreatury=ekwipunek.idKreatury) 
WHERE ekwipunek.idEkwipunku is null;
#LEFT JOIN BIERZE WSZYSTKO Z ZBIORU A;
#select * idKreatury from kreatura where id kreatury not in (select distinct idKreatury from ekwipunek WHERE idKreatury is not null); 
#---------------------------------------------zad4-------------------------------------------------------
#4.1
SELECT kreatura.nazwa,kreatura.dataUr,zasob.nazwa from kreatura 
INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu)
WHERE year(dataUr) between 1670 and 1680;
SELECT kreatura.nazwa,kreatura.dataUr from kreatura natural join ekwipunek;

#4.2
SELECT kreatura.nazwa,kreatura.dataUr,zasob.nazwa from kreatura 
INNER JOIN ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu)
WHERE zasob.rodzaj ='jedzenie' ORDER BY dataUr asc limit 5;
select * from kreatura;
#4.3
SELECT k1.nazwa,k2.nazwa FROM kreatura k1 INNER JOIN kreatura k2 on (k1.idKreatury+5=k2.idKreatury);
#---------------------------------------------zad5-------------------------------------------------------
#5.1
SELECT kreatura.rodzaj,avg(zasob.waga*ekwipunek.ilosc) AS srednia from kreatura INNER JOIN ekwipunek ON (kreatura.idKreatury=ekwipunek.idKreatury)
INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu) WHERE kreatura.rodzaj!='malpa' OR kreatura.rodzaj!='waz' 
GROUP by rodzaj having sum(ekwipunek.ilosc)<30;
#5.2
SELECT kreatura.nazwa,kreatura.rodzaj,kreatura.dataUr FROM kreatura ,(SELECT min(dataUr) AS min,max(dataUr) AS max from kreatura group by rodzaj) e2 
WHERE dataUr = min OR dataUr=max;
