#1.Wyświetl nazwę działu i minimalną, maksymalną i średnią wartość pensji w każdym dziale.
SELECT dzial.nazwa,max(pracownik.pensja),min(pracownik.pensja),avg(pracownik.pensja) FROM dzial INNER JOIN pracownik ON dzial.id_dzialu = pracownik.dzial GROUP by dzial.nazwa;

#2. Wyświetl pełną nazwę klienta, wartość zamówienia dla 10 najwyższych wartości zamówienia.
SELECT klient.pelna_nazwa,ilosc*cena AS wartosc FROM klient INNER JOIN zamowienie ON klient.id_klienta=zamowienie.klient
INNER JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie ORDER BY wartosc DESC limit 5;

#3 Wyświetl nazwę działu i liczbę pracowników przypisanych do każdego z nich.
SELECT dzial.nazwa, COUNT(pracownik.id_pracownika) FROM dzial 
INNER JOIN pracownik ON dzial.id_dzialu=pracownik.dzial GROUP BY dzial.nazwa;

#4 Wyświetl nazwę kategorii oraz liczbę produktów w każdej z nich.
SELECT kategoria.nazwa_kategori,count(towar.id_towaru) FROM kategoria 
INNER JOIN towar ON kategoria.id_kategori=towar.kategoria
GROUP BY kategoria.nazwa_kategori;

#5 Wyświetl nazwę kategorii i w kolejnej kolumnie listę wszystkich produktów należącej do każdej z nich.
SELECT kategoria.nazwa_kategori, GROUP_CONCAT(towar.nazwa_towaru) FROM kategoria 
INNER JOIN towar ON kategoria.id_kategori=towar.kategoria
GROUP BY kategoria.nazwa_kategori;

#6 Wyświetl dotychczasowy dochód firmy biorąc pod uwagę tylko zamówienia zrealizowane.
SELECT sum(ilosc*(pozycja_zamowienia.cena-towar.cena_zakupu)) from pozycja_zamowienia 
INNER JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
INNER JOIN zamowienie 
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia 
INNER JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia 
WHERE status_zamowienia.nazwa_statusu_zamowienia="zrealizowane";

#7 Policz i wyświetl dochód (przychód z zamówień i cena zakupu towaru) w każdym roku działalności firmy.
SELECT year(zamowienie.data_zamowienia),sum(ilosc*(pozycja_zamowienia.cena-towar.cena_zakupu))  from pozycja_zamowienia 
INNER JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
INNER JOIN zamowienie ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia 
GROUP BY year(zamowienie.data_zamowienia);

#8 Wyświetl wartość aktualnego stanu magazynowego z podziałem na kategorię produktów.
SELECT kategoria,towar.cena_zakupu * stan_magazynowy.ilosc FROM towar 
INNER JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar GROUP BY kategoria;

#9Przygotuj zapytanie, które wyświetli dane w poniższej postaci (policz ilu pracowników urodziło się w danym miesiącu - uwaga na porządek sortowania).
SELECT monthname(data_urodzenia),count(id_pracownika) from pracownik GROUP BY month(data_urodzenia) ORDER BY month(data_urodzenia);

#10 Wyświetl imię i nazwisko pracownika i koszt jaki poniósł pracodawca od momentu jego zatrudnienia.
SELECT imie,nazwisko,(PERIOD_DIFF(concat(year(now()),LPAD(month(now()),2,0)),concat(year(data_zatrudnienia),LPAD(month(data_zatrudnienia),2,0))))*pracownik.pensja AS koszt FROM pracownik;

