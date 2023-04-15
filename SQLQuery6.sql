--1.UTWORZ NOWA BAZE DANYCH NAZYWAJAC JA FIRMA
CREATE DATABASE firma;

--2. DODAJ NOWY SCHEMAT O NAZWIE ROZLICZENIA
CREATE SCHEMA rozliczenia;

--3. Dodaj schematu rozliczenia dodaj cztery tabele:
--pracownicy(id_pracownika, imie, nazwisko, adres, telefon) 
CREATE TABLE rozliczenia.pracownicy(id_pracownika int primary key, imie nvarchar(30) NOT NULL, nazwisko nvarchar(80) NOT NULL, adres nvarchar(100) NOT NULL, telefon varchar(15) NOT NULL);
--godziny(id_godziny, data, liczba godzin, id_pracownika) 
CREATE TABLE rozliczenia.godziny(id_godziny int primary key, data date NOT NULL, liczba_godzin int NOT NULL, id_pracownika int NOT NULL);
--pensje(id_pensji, stanowisko, kwota, id_premii) 
CREATE TABLE rozliczenia.pensje(id_pensji int primary key, stanowisko nvarchar(50), kwota decimal(7,2) NOT NULL, id_premii int NOT NULL);
--premie(id_premii, rodzaj, kwota)
CREATE TABLE rozliczenia.premie(id_premii int primary key, rodzaj nvarchar(40), kwota decimal(7,2));
--wykonuj¹c nastêpuj¹ce dzia³ania:
--a) Ustal typy danych tak, aby przetwarzanie i sk³adowanie danych by³o optymalne.
--b) Zastanów siê, które pola musz¹ przyjmowaæ wartoœæ NOT NULL.
--c) Ustaw klucz g³ówny dla ka¿dej tabeli (jako czêœæ polecenia CREATE TABLE).
--d) Zastanów siê jakie zwi¹zki zachodz¹ pomiêdzy tabelami, a nastêpnie dodaj klucze obce tam, gdzie wystêpuj¹ (wykorzystaj polecenie ALTER TABLE - po uprzednim stworzeniu tabeli).
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);
--4. Wype³nij ka¿d¹ tabelê 10. rekordami.

-- pracownicy
INSERT INTO rozliczenia.pracownicy values(1, 'Adam', 'Adamski', 'ul.Adamowa 11, 30-318 Kraków', '+48 900 900 900');
INSERT INTO rozliczenia.pracownicy values(2, 'Bartosz', 'Bartowski', 'ul.Bartkowa 12, 30-318 Kraków', '+48 800 800 800');
INSERT INTO rozliczenia.pracownicy values(3, 'Czes³aw', 'Czeski', 'ul.Czechowa 13, 30-318 Kraków', '+48 700 700 700');
INSERT INTO rozliczenia.pracownicy values(4, 'Dawid', 'Dawidowski', 'ul.Dawidowa 14, 30-318 Kraków', '+48 600 600 600');
INSERT INTO rozliczenia.pracownicy values(5, 'Ewelina', 'Liwoñska', 'ul.Ewentualna 15e, 30-318 Kraków', '+48 500 500 500');
INSERT INTO rozliczenia.pracownicy values(6, 'Felicja', '¯urek', 'ul.Figury i ¯wirki 16, 30-318 Kraków', '+48 400 400 400');
INSERT INTO rozliczenia.pracownicy values(7, 'Grzegorz', 'Fr¹c', 'ul.Grzegórzecka 17, 30-318 Kraków', '+48 300 300 300');
INSERT INTO rozliczenia.pracownicy values(8, 'Halina', 'Kozio³', 'ul.Ranczo 18d, 30-318 Kraków', '+48 200 200 200');
INSERT INTO rozliczenia.pracownicy values(9, 'Izabela', 'Zych', 'ul.Izerska 19, 30-318 Kraków', '+48 100 100 100');
INSERT INTO rozliczenia.pracownicy values(10, 'Janusz', 'Cieœla', 'ul.Januszeks 20, 30-318 Kraków', '+48 000 000 000');

--godziny
INSERT INTO rozliczenia.godziny values(11,'2023-04-15',10,1);
INSERT INTO rozliczenia.godziny values(12,'2023-04-15',9,2);
INSERT INTO rozliczenia.godziny values(13,'2023-04-15',8,3);
INSERT INTO rozliczenia.godziny values(14,'2023-04-15',7,4);
INSERT INTO rozliczenia.godziny values(15,'2023-04-15',6,5);
INSERT INTO rozliczenia.godziny values(16,'2023-04-15',5,6);
INSERT INTO rozliczenia.godziny values(17,'2023-04-15',4,7);
INSERT INTO rozliczenia.godziny values(18,'2023-04-15',3,8);
INSERT INTO rozliczenia.godziny values(19,'2023-04-15',2,9);
INSERT INTO rozliczenia.godziny values(20,'2023-04-15',1,10);

--pensje
INSERT INTO rozliczenia.pensje values(21, 'dyrektor', 8000.00, 31);
INSERT INTO rozliczenia.pensje values(22, 'wicedyrektor', 6000.00, 31);
INSERT INTO rozliczenia.pensje values(23, 'ksiêgowy/a', 5350.50, 39);
INSERT INTO rozliczenia.pensje values(24, 'sta¿ysta', 1400.21, 40);
INSERT INTO rozliczenia.pensje values(25, 'woŸny', 4000.00, 33);
INSERT INTO rozliczenia.pensje values(26, 'programista', 7000.50, 37);
INSERT INTO rozliczenia.pensje values(27, 'technik', 7500.20, 40);
INSERT INTO rozliczenia.pensje values(28, 'menad¿er', 5555.55, 34);
INSERT INTO rozliczenia.pensje values(29, 'dostawca', 4350.98, 33);
INSERT INTO rozliczenia.pensje values(30, 'elektryk', 2300.00, 36);

--premie
INSERT INTO rozliczenia.premie values(31, '-', 0);
INSERT INTO rozliczenia.premie values(32, 'œwi¹teczna', 200.20);
INSERT INTO rozliczenia.premie values(33, 'motywacyjna', 100.10);
INSERT INTO rozliczenia.premie values(34, 'jubileusz 5 lat', 100);
INSERT INTO rozliczenia.premie values(35, 'jubileusz 10 lat', 200);
INSERT INTO rozliczenia.premie values(41, 'jubileusz 20 lat', 500);
INSERT INTO rozliczenia.premie values(36, 'prem6', 600);
INSERT INTO rozliczenia.premie values(37, 'prem7', 700);
INSERT INTO rozliczenia.premie values(38, 'prem8', 800);
INSERT INTO rozliczenia.premie values(39, 'prem9', 900);
INSERT INTO rozliczenia.premie values(40, 'za wyniki', 1000);

SELECT * FROM rozliczenia.pensje;
SELECT * FROM rozliczenia.pracownicy;
SELECT * FROM rozliczenia.premie;
SELECT * FROM rozliczenia.godziny;

--5.Za pomoc¹ zapytania SQL wyœwietl nazwiska pracowników i ich adresy.
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--6.Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2).
SET LANGUAGE 'Polish';
SELECT DATEPART ( WEEKDAY , data ) as 'dzieñ ', DATEPART ( MONTH , data ) as 'miesi¹c' FROM rozliczenia.godziny;
--lub
SELECT DATENAME(WEEKDAY,data) as 'dzieñ ', DATEPART(month,data) as 'miesi¹c' from rozliczenia.godziny;

--7. W tabeli pensje zmieñ nazwê atrybutu kwota na kwota brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwotê netto i zaktualizuj wartoœci w tabeli.
EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';
ALTER TABLE rozliczenia.pensje ADD kwota_netto decimal(7,2);
UPDATE rozliczenia.pensje set kwota_netto=kwota_brutto*0.81;
SELECT * FROM rozliczenia.pensje;
