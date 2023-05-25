--stworzenie tabel
create table GeoEon(id_eon int primary key,nazwa_eon varchar(30));

create table GeoEra( id_era int primary key, nazwa_era varchar(30),
		id_eon int );

create table GeoOkres(id_okres int primary key, nazwa_okres varchar(30),
		id_era int );

create table GeoEpoka( id_epoka int primary key, nazwa_epoka varchar(30),
		id_okres int );

create table GeoPietro(id_pietro int primary key, nazwa_pietro varchar(30),
		id_epoka int );


alter table GeoEra add foreign key (id_eon) references GeoEon (id_eon);
alter table GeoOkres add foreign key (id_era) references GeoEra (id_era);
alter table GeoEpoka add foreign key (id_okres) references GeoOkres (id_okres);
alter table GeoPietro add foreign key (id_epoka) references GeoEpoka (id_epoka);

select * from GeoEra;
--wypelnienie tabel
insert into GeoEon values(1,'fanerozoik');

insert into GeoEra values(1,'paleozoik',1);
insert into GeoEra values(2,'mezozoik',1);
insert into GeoEra values(3,'kenozoik',1);

insert into GeoOkres values(1, 'dewon',1);
insert into GeoOkres values(2, 'karbon',1);
insert into GeoOkres values(3, 'perm',1);
insert into GeoOkres values(4, 'trias',2);
insert into GeoOkres values(5, 'jura',2);
insert into GeoOkres values(6, 'kreda',2);
insert into GeoOkres values(7, 'palogen',3);
insert into GeoOkres values(8, 'neogen',3);
insert into GeoOkres values(9, 'czwartorzad',3);

insert into GeoEpoka values(1, 'dolny', 1);
insert into GeoEpoka values(2, 'srodkowy', 1);
insert into GeoEpoka values(3, 'gorny', 1);
insert into GeoEpoka values(4, 'dolny', 2);
insert into GeoEpoka values(5, 'gorny', 2);
insert into GeoEpoka values(6, 'dolny', 3);
insert into GeoEpoka values(7, 'gorny', 3);
insert into GeoEpoka values(8, 'dolny', 4);
insert into GeoEpoka values(9, 'srodkowy', 4);
insert into GeoEpoka values(10, 'gorny', 4);
insert into GeoEpoka values(11, 'dolna', 5);
insert into GeoEpoka values(12, 'srodkowa', 5);
insert into GeoEpoka values(13, 'gorna', 5);
insert into GeoEpoka values(14, 'dolna', 6);
insert into GeoEpoka values(15, 'gorna', 6);
insert into GeoEpoka values(16, 'paleocen', 7);
insert into GeoEpoka values(17, 'eocen', 7);
insert into GeoEpoka values(18, 'oligocen', 7);
insert into GeoEpoka values(19, 'miocen', 8);
insert into GeoEpoka values(20, 'pliocen', 8);
insert into GeoEpoka values(21, 'plejstocen', 9);
insert into GeoEpoka values(22, 'holocen', 9);


insert into GeoPietro values (1,'megalaj',22);
insert into GeoPietro values(2,'nortgryp',22);
insert into GeoPietro values(3,'grenland',22);

insert into GeoPietro values(4,'tarant',21);
insert into GeoPietro values(5,'chiban',21);
insert into GeoPietro values(6,'kalabr',21);
insert into GeoPietro values(7,'gelas',21);

insert into GeoPietro values(8,'piacent',20);
insert into GeoPietro values(9,'zankl',20);

insert into GeoPietro values(10,'messyn',19);
insert into GeoPietro values(11,'torton',19);
insert into GeoPietro values(12,'serrawal',19);
insert into GeoPietro values(13,'lang',19);
insert into GeoPietro values(14,'burdyga',19);
insert into GeoPietro values(15,'akwitan',19);

insert into GeoPietro values(16,'szat',18);
insert into GeoPietro values(17,'rupel',18);

insert into GeoPietro values(18,'priabon',17);
insert into GeoPietro values(19,'barton',17);
insert into GeoPietro values(20,'lutet',17);
insert into GeoPietro values(21,'iprez',17);

insert into GeoPietro values(22,'tanet',16);
insert into GeoPietro values(23,'zeland',16);
insert into GeoPietro values(24,'dan',16);

insert into GeoPietro values(25,'mastrycht',15);
insert into GeoPietro values(26,'kampan',15);
insert into GeoPietro values(27,'santon',15);
insert into GeoPietro values(28,'koniak',15);
insert into GeoPietro values(29,'turon',15);
insert into GeoPietro values(30,'cenoman',15);

insert into GeoPietro values(31,'alb',14);
insert into GeoPietro values(32,'apt',14);
insert into GeoPietro values(33,'barrem',14);
insert into GeoPietro values(34,'hoteryw',14);
insert into GeoPietro values(35,'walanzyn',14);
insert into GeoPietro values(36,'berrias',14);

insert into GeoPietro values(37,'tyton',13);
insert into GeoPietro values(38,'kimeryd',13);
insert into GeoPietro values(39,'oksford',13);

insert into GeoPietro values(40,'kelowej',12);
insert into GeoPietro values(41,'baton',12);
insert into GeoPietro values(42,'bajos',12);
insert into GeoPietro values(43,'aalen',12);

insert into GeoPietro values(44,'toark',11);
insert into GeoPietro values(45,'pliensbach',11);
insert into GeoPietro values(46,'synemur',11);
insert into GeoPietro values(47,'hettang',11);

insert into GeoPietro values(48,'retyk',10);
insert into GeoPietro values(49,'noryk',10);
insert into GeoPietro values(50,'karnik',10);

insert into GeoPietro values(51,'ladyn',9);
insert into GeoPietro values(52,'anizyk',9);

insert into GeoPietro values(53,'olenek',8);
insert into GeoPietro values(54,'ind',8);

insert into GeoPietro values(55,'czangsing',7);
insert into GeoPietro values(56,'wucziaping',7);
insert into GeoPietro values(57,'kapitan',7);
insert into GeoPietro values(58,'word',7);
insert into GeoPietro values(59,'road',7);

insert into GeoPietro values(60,'kungur',6);
insert into GeoPietro values(61,'artinsk',6);
insert into GeoPietro values(62,'sakmar',6);
insert into GeoPietro values(63,'assel',6);

insert into GeoPietro values(64,'gzel',5);
insert into GeoPietro values(65,'kasimow',5);
insert into GeoPietro values(66,'moskow',5);
insert into GeoPietro values(67,'baszkir',5);

insert into GeoPietro values(68,'serpuchow',4);
insert into GeoPietro values(69,'wizen',4);
insert into GeoPietro values(70,'turnej',4);

insert into GeoPietro values(71,'famen',3);
insert into GeoPietro values(72,'fran',3);

insert into GeoPietro values(73,'zywet',2);
insert into GeoPietro values(74,'eifel',2);

insert into GeoPietro values(75,'ems',1);
insert into GeoPietro values(76,'prag',1);
insert into GeoPietro values(77,'lochkow',1);

select *from GeoTabela;

--tabel GeoTable
 CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL
JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);

--tabele milion i dziesiec
create table Dziesiec(cyfra int,bit int);
create table Milion(liczba int,cyfra int, bit int);

insert into Dziesiec values (0,1);
insert into Dziesiec values (1,1);
insert into Dziesiec values (2,1);
insert into Dziesiec values (3,1);
insert into Dziesiec values (4,1);
insert into Dziesiec values (5,1);
insert into Dziesiec values (6,1);
insert into Dziesiec values (7,1);
insert into Dziesiec values (8,1);
insert into Dziesiec values (9,1);


insert into Milion 
select a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra
+ 10000*a5.cyfra + 10000*a6.cyfra as liczba , a1.cyfra as cyfra, a1.bit as bit
from Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

--ZAPYTANIE 1
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON 
(mod(Milion.liczba,77)=(GeoTabela.id_pietro));
--ZAPYTANIE 2
SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON 
(mod(Milion.liczba,77)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;
--ZAPYTANIE 3
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,77)=(id_pietro));
--ZAPYTANIE 4
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77) in
(SELECT GeoPietro.id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);

--indeksy
create index indxEon on GeoEon(id_eon);
create index indxEra on GeoEra(id_era, id_eon);
create index indxOkres on GeoOkres(id_okres, id_era);
create index indxEpoka on GeoEpoka(id_epoka, id_okres);
create index indxPietro on GeoPietro(id_pietro, id_epoka);
create index indxLiczba on Milion(liczba);
create index indxGeoTabela on GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);


