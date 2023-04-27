-- 1. Utw�rz now� baz� danych nazywaj�c j� firma. 
create database firmaa;
use firmaa;

--2.Dodaj schemat o nazwie ksiegowosc.
create schema ksiegowosc;

--4. Dodaj cztery tabele: 
-- pracownicy
create table ksiegowosc.pracownicy(id_pracownika int primary key, imie nvarchar(30) NOT NULL, nazwisko nvarchar(80) NOT NULL, adres nvarchar(100) NOT NULL, telefon varchar(15) NOT NULL);
-- godziny
create table ksiegowosc.godziny(id_godziny int primary key, dataa date NOT NULL, liczba_godzin int NOT NULL, id_pracownika int NOT NULL);
-- pensje
create table ksiegowosc.pensje(id_pensji int primary key, stanowisko nvarchar(50) not null, kwota money not null);
-- premia
create table ksiegowosc.premia(id_premii int primary key, rodzaj nvarchar(60), kwota money);
-- wynagrodzenie
create table ksiegowosc.wynagrodzenie(id_wynagrodzenia int primary key, dataa date not null, id_pracownika int not null, id_godziny int not null, id_pensji int not null, id_premii int not null);

--klucze
alter table ksiegowosc.godziny 
add foreign key(id_pracownika) references ksiegowosc.pracownicy(id_pracownika);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_pracownika) references ksiegowosc.pracownicy(id_pracownika);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_godziny) references ksiegowosc.godziny(id_godziny);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_pensji) references ksiegowosc.pensje(id_pensji);

alter table ksiegowosc.wynagrodzenie
add foreign key(id_premii) references ksiegowosc.premia(id_premii);

--opisy/komentarze dla ka�dej tabeli
--COMMENT on TABLE ksiegowosc.pracownicy IS 'Tabela pracownik�w';

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela pracownikow - podstawowe informacje',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pracownicy'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pracownicy')
  AND minor_id = 0
  AND class = 1;

 EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela godzin - ilosc przepracowanych godzin w ciagu dnia',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='godziny'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.godziny')
  AND minor_id = 0
  AND class = 1;

 EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela pensji - wysokosc pensji dla danego stanowiska ',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='pensje'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.pensje')
  AND minor_id = 0
  AND class = 1;

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela premii - typ i wysokosc premii',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='premia'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.premia')
  AND minor_id = 0
  AND class = 1;

EXEC sys.sp_addextendedproperty 
@name=N'Comment', 
@value=N'Tabela wynagrodzen - wysokosc wynagrodzenia dla danego pracownika oraz data wyplacenia',
@level0type=N'SCHEMA', @level0name='ksiegowosc',
@level1type=N'TABLE', @level1name='wynagrodzenie'
GO

SELECT value AS Comment
FROM sys.extended_properties
WHERE major_id = OBJECT_ID('ksiegowosc.wynagrodzenie')
  AND minor_id = 0
  AND class = 1;

--5. Wype�nij ka�d� tabel� 10. rekordami.
-- pracownicy
INSERT INTO ksiegowosc.pracownicy values(1, 'Adam', 'Adamski', 'ul.Adamowa 11, 30-318 Krak�w', '+48 900 900 900');
INSERT INTO ksiegowosc.pracownicy values(2, 'Bartosz', 'Bartowski', 'ul.Bartkowa 12, 30-318 Krak�w', '+48 800 800 800');
INSERT INTO ksiegowosc.pracownicy values(3, 'Czes�aw', 'Czeski', 'ul.Czechowa 13, 30-318 Krak�w', '+48 700 700 700');
INSERT INTO ksiegowosc.pracownicy values(4, 'Dawid', 'Dawidowski', 'ul.Dawidowa 14, 30-318 Krak�w', '+48 600 600 600');
INSERT INTO ksiegowosc.pracownicy values(5, 'Ewelina', 'Liwo�ska', 'ul.Ewentualna 15e, 30-318 Krak�w', '+48 500 500 500');
INSERT INTO ksiegowosc.pracownicy values(6, 'Felicja', '�urek', 'ul.Figury i �wirki 16, 30-318 Krak�w', '+48 400 400 400');
INSERT INTO ksiegowosc.pracownicy values(7, 'Grzegorz', 'Fr�c', 'ul.Grzeg�rzecka 17, 30-318 Krak�w', '+48 300 300 300');
INSERT INTO ksiegowosc.pracownicy values(8, 'Halina', 'Kozio�', 'ul.Ranczo 18d, 30-318 Krak�w', '+48 200 200 200');
INSERT INTO ksiegowosc.pracownicy values(9, 'Izabela', 'Zych', 'ul.Izerska 19, 30-318 Krak�w', '+48 100 100 100');
INSERT INTO ksiegowosc.pracownicy values(10, 'Janusz', 'Cie�la', 'ul.Januszeks 20, 30-318 Krak�w', '+48 000 000 000');

--godziny
INSERT INTO ksiegowosc.godziny values(11,'2023-04-15',10,1);
INSERT INTO ksiegowosc.godziny values(12,'2023-04-15',9,2);
INSERT INTO ksiegowosc.godziny values(13,'2023-04-15',8,3);
INSERT INTO ksiegowosc.godziny values(14,'2023-04-15',7,4);
INSERT INTO ksiegowosc.godziny values(15,'2023-04-15',10,5);
INSERT INTO ksiegowosc.godziny values(16,'2023-04-15',9,6);
INSERT INTO ksiegowosc.godziny values(17,'2023-04-15',8,7);
INSERT INTO ksiegowosc.godziny values(18,'2023-04-15',7,8);
INSERT INTO ksiegowosc.godziny values(19,'2023-04-15',10,9);
INSERT INTO ksiegowosc.godziny values(20,'2023-04-15',9,10);

--pensje
INSERT INTO ksiegowosc.pensje values(21, 'dyrektor',8000);
INSERT INTO ksiegowosc.pensje values(22, 'wicedyrektor', 6000);
INSERT INTO ksiegowosc.pensje values(23, 'ksi�gowy', 5350);
INSERT INTO ksiegowosc.pensje values(24, 'sta�ysta', 1400);
INSERT INTO ksiegowosc.pensje values(25, 'wo�ny', 4000);
INSERT INTO ksiegowosc.pensje values(26, 'programista', 7000);
INSERT INTO ksiegowosc.pensje values(27, 'technik', 7500);
INSERT INTO ksiegowosc.pensje values(28, 'menad�er', 5555);
INSERT INTO ksiegowosc.pensje values(29, 'dostawca', 4350);
INSERT INTO ksiegowosc.pensje values(30, 'elektryk', 2300);

--premie
INSERT INTO ksiegowosc.premia values(31, 'brak', 0);
INSERT INTO ksiegowosc.premia values(32, '�wi�teczna', 200);
INSERT INTO ksiegowosc.premia values(33, 'motywacyjna', 100);
INSERT INTO ksiegowosc.premia values(34, 'jubileusz 5 lat', 100);
INSERT INTO ksiegowosc.premia values(35, 'jubileusz 10 lat', 200);
INSERT INTO ksiegowosc.premia values(36, 'prem6', 600);
INSERT INTO ksiegowosc.premia values(37, 'prem7', 700);
INSERT INTO ksiegowosc.premia values(38, 'prem8', 800);
INSERT INTO ksiegowosc.premia values(39, 'prem9', 900);
INSERT INTO ksiegowosc.premia values(40, 'za wyniki', 1000);
--INSERT INTO ksiegowosc.premia values(41, 'jubileusz 20 lat', 500);
DELETE FROM ksiegowosc.premia WHERE id_premii = 41;

--wynagrodzenia
insert into ksiegowosc.wynagrodzenie values(51,'2023-04-24',10,11,30,31);
insert into ksiegowosc.wynagrodzenie values(52,'2023-04-24',9,12,29,32);
insert into ksiegowosc.wynagrodzenie values(53,'2023-04-24',8,13,28,33);
insert into ksiegowosc.wynagrodzenie values(54,'2023-04-24',7,14,27,34);
insert into ksiegowosc.wynagrodzenie values(55,'2023-04-24',8,15,26,35);
insert into ksiegowosc.wynagrodzenie values(56,'2023-04-24',5,16,25,36);
insert into ksiegowosc.wynagrodzenie values(57,'2023-04-24',4,17,24,37);
insert into ksiegowosc.wynagrodzenie values(58,'2023-04-24',3,18,23,38);
insert into ksiegowosc.wynagrodzenie values(59,'2023-04-24',2,19,22,39);
insert into ksiegowosc.wynagrodzenie values(60,'2023-04-24',1,20,21,40);

--wyswietlenie tabel
SELECT * FROM ksiegowosc.pracownicy;
SELECT * FROM ksiegowosc.godziny;
SELECT * FROM ksiegowosc.pensje;
SELECT * FROM ksiegowosc.premia;
SELECT * FROM ksiegowosc.wynagrodzenie;

--6. Wykonaj nast�puj�ce zapytania: 
--a) Wy�wietl tylko id pracownika oraz jego nazwisko.
select id_pracownika, nazwisko from ksiegowosc.pracownicy;
--b) Wy�wietl id pracownik�w, kt�rych p�aca jest wi�ksza ni� 1000.
Select ksiegowosc.wynagrodzenie.id_pracownika, ksiegowosc.pensje.kwota
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji =ksiegowosc.pensje.id_pensji
where ksiegowosc.pensje.kwota>1000
order by ksiegowosc.wynagrodzenie.id_pracownika;
--c) Wy�wietl id pracownik�w nieposiadaj�cych premii, kt�rych p�aca jest wi�ksza ni� 2000. 
select ksiegowosc.wynagrodzenie.id_pracownika,ksiegowosc.pensje.kwota, ksiegowosc.premia.rodzaj
from ksiegowosc.premia inner join (ksiegowosc.pensje inner join ksiegowosc.wynagrodzenie on ksiegowosc.pensje.id_pensji=ksiegowosc.wynagrodzenie.id_pensji) on ksiegowosc.premia.id_premii=ksiegowosc.wynagrodzenie.id_premii
where ksiegowosc.pensje.kwota >2000 and ksiegowosc.premia.rodzaj like 'brak';
--d) Wy�wietl pracownik�w, kt�rych pierwsza litera imienia zaczyna si� na liter� �J�. 
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy
where ksiegowosc.pracownicy.imie like 'j%'
--e) Wy�wietl pracownik�w, kt�rych nazwisko zawiera liter� �n� oraz imi� ko�czy si� na liter� �a�.
select ksiegowosc.pracownicy.id_pracownika, ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy
where ksiegowosc.pracownicy.nazwisko like '%a' and ksiegowosc.pracownicy.nazwisko like '%n%'
--f) Wy�wietl imi� i nazwisko pracownik�w oraz liczb� ich nadgodzin, przyjmuj�c, i� standardowy czas pracy to 160 h miesi�cznie. 
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko,( ksiegowosc.godziny.liczba_godzin*20)-160 as nadgodziny
from ksiegowosc.pracownicy inner join(ksiegowosc.wynagrodzenie inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny) on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
where ( ksiegowosc.godziny.liczba_godzin*20)-160>0
--g) Wy�wietl imi� i nazwisko pracownik�w, kt�rych pensja zawiera si� w przedziale 1500 � 3000 PLN.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji) inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
where ksiegowosc.pensje.kwota between 1500 and 3000;
--h) Wy�wietl imi� i nazwisko pracownik�w, kt�rzy pracowali w nadgodzinach i nie otrzymali premii.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko
from ksiegowosc.pracownicy inner join ksiegowosc.wynagrodzenie on ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika inner join ksiegowosc.godziny on ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
where (ksiegowosc.godziny.liczba_godzin*20)-160>0 and ksiegowosc.premia.rodzaj like 'brak'
--i) Uszereguj pracownik�w wed�ug pensji.
select ksiegowosc.pracownicy.imie, ksiegowosc.pracownicy.nazwisko, ksiegowosc.pensje.kwota
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika)
inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
order by ksiegowosc.pensje.kwota;
--j) Uszereguj pracownik�w wed�ug pensji i premii malej�co.
select ksiegowosc.pracownicy.imie,ksiegowosc.pracownicy.nazwisko,ksiegowosc.pensje.kwota, ksiegowosc.premia.kwota
from ((ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika)
	inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji) 
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
order by ksiegowosc.pensje.kwota desc, ksiegowosc.premia.kwota desc;
--k) Zlicz i pogrupuj pracownik�w wed�ug pola �stanowisko�.
select ksiegowosc.pensje.stanowisko, count(ksiegowosc.pensje.stanowisko) as zliczenie
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika)
	inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;
--l) Policz �redni�, minimaln� i maksymaln� p�ac� dla stanowiska �kierownik� (je�eli takiego nie masz, to przyjmij dowolne inne).
select ksiegowosc.pensje.stanowisko,AVG(ksiegowosc.pensje.kwota) as srednia, Min(ksiegowosc.pensje.kwota) as minimalna,
MAX(ksiegowosc.pensje.kwota) as maksymalna
from ksiegowosc.pensje
where ksiegowosc.pensje.stanowisko like 'dyrektor'
group by ksiegowosc.pensje.stanowisko;
--m) Policz sum� wszystkich wynagrodze�.
select Sum(ksiegowosc.pensje.kwota + ksiegowosc.premia.kwota) as wynagrodzenia,Sum(ksiegowosc.pensje.kwota) as pensje,Sum(ksiegowosc.premia.kwota) as premie
from (ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji)
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii;
--f) Policz sum� wynagrodze� w ramach danego stanowiska.
select ksiegowosc.pensje.stanowisko, Sum(ksiegowosc.pensje.kwota) as wynagrodzenie_stanowiska
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
group by ksiegowosc.pensje.stanowisko;
--g) Wyznacz liczb� premii przyznanych dla pracownik�w danego stanowiska.
select ksiegowosc.pensje.stanowisko, count(ksiegowosc.premia.kwota) as liczba_premii
from ksiegowosc.wynagrodzenie inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
	inner join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii=ksiegowosc.premia.id_premii
group by ksiegowosc.pensje.stanowisko;
--h) Usu� wszystkich pracownik�w maj�cych pensj� mniejsz� ni� 1200 z�
delete ksiegowosc.pracownicy
	from ksiegowosc.wynagrodzenie inner join ksiegowosc.pracownicy on ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika
	inner join ksiegowosc.pensje on ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
	where ksiegowosc.pensje.kwota<1200;
	