#LAB 7
#---------------------------------------------zad1-------------------------------------------------------
#1.1
CREATE TABLE gorczynskim.kreatura2 AS SELECT * from wikingowie.kreatura;
CREATE table gorczynskim.uczestnicy AS SELECT * from wikingowie.uczestnicy;
CREATE table gorczynskim.etapy_wyprawy AS SELECT * from wikingowie.etapy_wyprawy;
CREATE table gorczynskim.sektor AS SELECT * from wikingowie.sektor; 
CREATE table gorczynskim.wyprawa AS SELECT * from wikingowie.wyprawa;
#1.3
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
SELECT wyprawa.nazwa,count(uczestnicy.id_uczestnika),GROUP_CONCAT(kreatura.nazwa) AS 'nazwa, liczba uczestnikow, nazwa uczestnika' 
FROM wyprawa INNER JOIN uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy 
INNER JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.idKreatury group by wyprawa.nazwa;
#2.2
SELECT * from sektor;
SELECT * from etapy_wyprawy;
select w.nazwa,s.nazwa,ew.kolejnosc,k.nazwa as kierownik from wyprawa w join kreatura k on w.kierownik=k.idKreatury 
join etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy join sektor s on s.id_sektora=ew.sektor order by w.data_rozpoczecia ASC, ew.kolejnosc desc;

