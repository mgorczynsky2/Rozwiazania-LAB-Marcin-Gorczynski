#1
SELECT imie,nazwisko,dzial.nazwa FROM pracownik INNER JOIN dzial ON pracownik.dzial=dzial.id_dzialu;
#2 Wyświetl nazwę towaru, nazwę kategorii oraz ilość towaru i posortuj dane po kolumnie ilość malejąco.
SELECT nazwa_towaru,kategoria.nazwa_kategori,stan_magazynowy.ilosc FROM towar INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori
INNER JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar ORDER BY stan_magazynowy.ilosc DESC;
#3 Wyświetl wszystkie anulowane zamówienia.
SELECT * from status_zamowienia WHERE nazwa_statusu_zamowienia LIKE "anulowane";
#4 Wyświetl wszystkich klientów, których adres podstawowy znajduje się w miejscowości Olsztyn.
SELECT pelna_nazwa, adres_klienta.miejscowosc FROM klient INNER JOIN adres_klienta ON klient.id_klienta=adres_klienta.klient 
INNER JOIN typ_adresu ON adres_klienta.typ_adresu=typ_adresu.id_typu WHERE adres_klienta.miejscowosc="Olsztyn" AND typ_adresu.nazwa="podstawowy";
#5 Wyświetl wszystkie nazwy jednostek miary, które nie zostały nigdy wykorzystane w tabeli stan_magazynowy.
SELECT sm.jm,jm.id_jednostki FROM jednostka_miary jm left join stan_magazynowy sm on sm.jm=jm.id_jednostki WHERE sm.jm is null;
#6 Wyświetl numer zamówienia, nazwę towaru, ilosc i cenę dla zamówień złożonych w 2018 roku.
SELECT zamowienie.numer_zamowienia,towar.nazwa_towaru,pozycja_zamowienia.ilosc,pozycja_zamowienia.cena FROM zamowienie 
INNER JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie INNER JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
WHERE year(data_zamowienia)=2018;
#7 Stwórz nową tabelę o nazwie towary_full_info, w której znajdą się kolumny nazwa_towaru, cena_zakupu, kategoria(nazwa),ilosc , jednostka miary(nazwa).
CREATE TABLE gorczynskim.towary_full_info AS
SELECT towar.nazwa_towaru,towar.cena_zakupu,kategoria.nazwa_kategori,stan_magazynowy.ilosc,jednostka_miary.nazwa FROM towar INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori
INNER JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar INNER JOIN jednostka_miary ON jednostka_miary.id_jednostki=stan_magazynowy.jm;
#8 Wyświetl pozycje zamówień dla 5 najstarszych zamówień.
SELECT pozycja_zamowienia.* from pozycja_zamowienia inner join( select id_zamowienia from zamowienie order by data_zamowienia asc limit 5) as t 
on pozycja_zamowienia.zamowienie=t.id_zamowienia;
#9 Wyświetl wszystkie zamówienia, które mają status inny niż zrealizowane.
SELECT zamowienie.numer_zamowienia,status_zamowienia.nazwa_statusu_zamowienia from zamowienie INNER JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia
 WHERE status_zamowienia.nazwa_statusu_zamowienia != 'zrealizowane';
#10 Wyświetl wszystkie adresy, których kod został niepoprawnie zapisany.
SELECT * FROM adres_klienta WHERE kod NOT REGEXP "[0-9]{2}-[0-9]{3}";