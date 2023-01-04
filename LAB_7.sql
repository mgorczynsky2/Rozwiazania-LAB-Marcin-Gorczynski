#LAB 7
#---------------------------------------------zad1-------------------------------------------------------
#1.1
CREATE TABLE gorczynskim.kreatura2 AS SELECT * from wikingowie.kreatura;
CREATE table gorczynskim.uczestnicy AS SELECT * from wikingowie.uczestnicy;
CREATE table gorczynskim.etapy_wyprawy AS SELECT * from wikingowie.etapy_wyprawy;
CREATE table gorczynskim.sektor AS SELECT * from wikingowie.sektor; 
CREATE table gorczynskim.wyprawa AS SELECT * from wikingowie.wyprawa;
#1.3
SELECT * from zasob;
SELECT * from ekwipunek;
SELECT * from kreatura;
SELECT * from uczestnicy;
SELECT * from wyprawa;
SELECT kreatura.nazwa FROM kreatura left join uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika WHERE uczestnicy.id_uczestnika is null;
#1.3
SELECT wyprawa.nazwa,sum(ekwipunek.ilosc) FROM wyprawa inner join uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy 
INNER JOIN kreatura ON kreatura.idKreatury=uczestnicy.id_uczestnika INNER JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury GROUP BY wyprawa.nazwa;
SELECT wyprawa.nazwa,sum(ekwipunek.ilosc) FROM wyprawa inner join uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy 
INNER JOIN ekwipunek ON uczestnicy.id_uczestnika=ekwipunek.idKreatury GROUP BY wyprawa.nazwa;
#---------------------------------------------zad2-------------------------------------------------------
#2.1
SELECT wyprawa.nazwa,count(uczestnicy.id_uczestnika),GROUP_CONCAT(kreatura.nazwa)
FROM wyprawa INNER JOIN uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy 
INNER JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.idKreatury group by wyprawa.nazwa;
#2.2
SELECT * from sektor;
SELECT * from etapy_wyprawy;
select w.nazwa,s.nazwa,ew.kolejnosc,k.nazwa as kierownik from wyprawa w join kreatura k on w.kierownik=k.idKreatury 
join etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy join sektor s on s.id_sektora=ew.sektor order by w.data_rozpoczecia ASC, ew.kolejnosc desc;
#---------------------------------------------zad3-------------------------------------------------------
#3.1
select if(rodzaj is null,"brak rodzaju",rodzaj) from kreatura;
SELECT ifnull(count(etapy_wyprawy.sektor),0) AS ilosc_odwiedzin, sektor.nazwa FROM sektor LEFT JOIN etapy_wyprawy ON (etapy_wyprawy.sektor=sektor.id_sektora) GROUP BY sektor.id_sektora;
#3.2
SELECT count(uczestnicy.id_uczestnika),nazwa,if(count(uczestnicy.id_uczestnika)>0,"bral udzial w wyprawie","nie bral udzialu") AS "Czy brał udział"
 FROM kreatura LEFT JOIN uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika GROUP BY kreatura.nazwa;
 #---------------------------------------------zad4-------------------------------------------------------
 #4.1
 SELECT sum(length(dziennik)) dlugosc,wyprawa.nazwa FROM wyprawa INNER JOIN etapy_wyprawy ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy 
 GROUP BY wyprawa.nazwa having dlugosc < 400; #####alias dlugosc
 #4.2
 SELECT wyprawa.nazwa,sum(zasob.waga*zasob.ilosc)/count(distinct(uczestnicy.id_uczestnika)) FROM wyprawa 
 inner join uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy 
 inner join kreatura on uczestnicy.id_uczestnika=kreatura.idKreatury  
 inner join ekwipunek on kreatura.idKreatury=ekwipunek.idKreatury 
 inner join zasob ON ekwipunek.idZasobu=zasob.idZasobu GROUP BY wyprawa.nazwa;
 #
select w.nazwa, sum(e.ilosc * z.waga) / count(distinct u.id_uczestnika) as srednio
from wyprawa w
join uczestnicy u on w.id_wyprawy=u.id_wyprawy
join ekwipunek e on u.id_uczestnika=e.idKreatury
join zasob z on e.idZasobu=z.idZasobu
group by w.id_wyprawy;
 #---------------------------------------------zad5-------------------------------------------------------
 #5.1
SELECT k.nazwa,
w.nazwa,
DATEDIFF(w.data_rozpoczecia, k.dataUr) as 'Wiek w dniach'
FROM kreatura k,
etapy_wyprawy ew,
wyprawa w,
sektor s,
uczestnicy u
WHERE ew.sektor = s.id_sektora
and k.idKreatury=u.id_uczestnika
and u.id_wyprawy=w.id_wyprawy
AND ew.idWyprawy = w.id_wyprawy
AND s.nazwa = "Chatka dziadka";
 
