SELECT * FROM ksiegowosc.pracownicy;
--Wykorzystuj¹c bazê danych stworzon¹ na poprzednich æwiczeniach wykonaj nastêpuj¹ce polecenia:
--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)
ALTER TABLE firmaa.ksiegowosc.pracownicy 
ALTER COLUMN telefon VARCHAR(20);
UPDATE ksiegowosc.pracownicy
SET telefon = REPLACE(telefon, '+48 ', '(+48) ')
WHERE telefon LIKE '+48 %'
--b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’ 
update ksiegowosc.pracownicy
set telefon = concat(SUBSTRING(pracownicy.telefon,1,9),'-',SUBSTRING(pracownicy.telefon,11,3),'-',SUBSTRING(pracownicy.telefon,15,3));
--c) Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter
select ksiegowosc.pracownicy.id_pracownika, UPPER(ksiegowosc.pracownicy.imie) as imie, UPPER(ksiegowosc.pracownicy.nazwisko) as nazwisko
from ksiegowosc.pracownicy
where LEN(pracownicy.nazwisko) = (select MAX(LEN(pracownicy.nazwisko)) from ksiegowosc.pracownicy);
--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
select HASHBYTES('md5',imie) as imie, HASHBYTES('md5',nazwisko) as nazwisko,HASHBYTES('md5',cast(ksiegowosc.pensje.kwota as varchar(32))) as pensje
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika 
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
--f) Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota as pensje, ksiegowosc.premia.kwota as premie
from ksiegowosc.wynagrodzenie
left join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
left join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
left join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii;
--g) wygeneruj raport (zapytanie), które zwróci w wyniki treœæ wg poni¿szego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma³ pensjê ca³kowit¹ na kwotê 7540 z³, gdzie 
--wynagrodzenie zasadnicze wynosi³o: 5000 z³, premia: 2000 z³, nadgodziny: 540 z³

select 'Pracownik '+ imie +' '+ nazwisko +', w dniu '+ CONVERT(varchar(10), CONVERT(date, ksiegowosc.wynagrodzenie.dataa), 104)
+' otrzyma³ pensjê ca³kowit¹ na kwotê '+ convert(varchar(10),(ksiegowosc.pensje.kwota+ksiegowosc.premia.kwota+
CASE WHEN (ksiegowosc.godziny.liczba_godzin*20)-160 < 0 
THEN 0 
ELSE ((ksiegowosc.godziny.liczba_godzin*20)-160)*20 
END))
+ ' z³, gdzie wynagrodzenie zasadnicze wynosi³o '
+ cast(ksiegowosc.pensje.kwota as varchar(10)) + ' z³, premia: ' + cast(ksiegowosc.premia.kwota as varchar(10)) + ' z³, nadgodziny: '+ 
CONVERT(varchar(7),(CASE WHEN (ksiegowosc.godziny.liczba_godzin*20)-160 < 0 THEN 0 ELSE ((ksiegowosc.godziny.liczba_godzin*20)-160)*20 END)) + ' z³.' as raport
from ksiegowosc.wynagrodzenie 
left join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
left join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji 
left join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
left join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny;
