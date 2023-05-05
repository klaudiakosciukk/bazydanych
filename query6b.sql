SELECT * FROM ksiegowosc.pracownicy;
--Wykorzystuj�c baz� danych stworzon� na poprzednich �wiczeniach wykonaj nast�puj�ce polecenia:
--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48)
ALTER TABLE firmaa.ksiegowosc.pracownicy 
ALTER COLUMN telefon VARCHAR(20);
UPDATE ksiegowosc.pracownicy
SET telefon = REPLACE(telefon, '+48 ', '(+48) ')
WHERE telefon LIKE '+48 %'
--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333� 
update ksiegowosc.pracownicy
set telefon = concat(SUBSTRING(pracownicy.telefon,1,9),'-',SUBSTRING(pracownicy.telefon,11,3),'-',SUBSTRING(pracownicy.telefon,15,3));
--c) Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ych liter
select ksiegowosc.pracownicy.id_pracownika, UPPER(ksiegowosc.pracownicy.imie) as imie, UPPER(ksiegowosc.pracownicy.nazwisko) as nazwisko
from ksiegowosc.pracownicy
where LEN(pracownicy.nazwisko) = (select MAX(LEN(pracownicy.nazwisko)) from ksiegowosc.pracownicy);
--d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5
select HASHBYTES('md5',imie) as imie, HASHBYTES('md5',nazwisko) as nazwisko,HASHBYTES('md5',cast(ksiegowosc.pensje.kwota as varchar(32))) as pensje
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
--f) Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota as pensje, ksiegowosc.premia.kwota as premie
from ksiegowosc.wynagrodzenie
left join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
left join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
left join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii;
--g) wygeneruj raport (zapytanie), kt�re zwr�ci w wyniki tre�� wg poni�szego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma� pensj� ca�kowit� na kwot� 7540 z�, gdzie 
--wynagrodzenie zasadnicze wynosi�o: 5000 z�, premia: 2000 z�, nadgodziny: 540 z�

select 'Pracownik '+ imie +' '+ nazwisko +', w dniu '+ CONVERT(varchar(10), CONVERT(date, ksiegowosc.wynagrodzenie.dataa), 104)
+' otrzyma� pensj� ca�kowit� na kwot� '+ convert(varchar(10),(ksiegowosc.pensje.kwota+ksiegowosc.premia.kwota+
CASE WHEN (ksiegowosc.godziny.liczba_godzin*20)-160 < 0 
THEN 0 
ELSE ((ksiegowosc.godziny.liczba_godzin*20)-160)*20 
END))
+ ' z�, gdzie wynagrodzenie zasadnicze wynosi�o '
+ cast(ksiegowosc.pensje.kwota as varchar(10)) + ' z�, premia: ' + cast(ksiegowosc.premia.kwota as varchar(10)) + ' z�, nadgodziny: '+ 
CONVERT(varchar(7),(CASE WHEN (ksiegowosc.godziny.liczba_godzin*20)-160 < 0 THEN 0 ELSE ((ksiegowosc.godziny.liczba_godzin*20)-160)*20 END)) + ' z�.' as raport
from ksiegowosc.wynagrodzenie 
left join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
left join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji 
left join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
left join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny;
