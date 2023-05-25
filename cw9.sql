create database TabelaStratygraficzna;
create schema geochronologia;

--stworzenie tabel
create table geochronologia.GeoEon(id_eon int primary key,nazwa_eon varchar(30));

create table geochronologia.GeoEra( id_era int primary key, nazwa_era varchar(30),
		id_eon int foreign key references geochronologia.GeoEon(id_eon));

create table geochronologia.GeoOkres(id_okres int primary key, nazwa_okres varchar(30),
		id_era int foreign key references geochronologia.GeoEra(id_era))

create table geochronologia.GeoEpoka( id_epoka int primary key, nazwa_epoka varchar(30),
		id_okres int foreign key references geochronologia.GeoOkres(id_okres));

create table geochronologia.GeoPietro(id_pietro int primary key, nazwa_pietro varchar(30),
		id_epoka int foreign key references geochronologia.GeoEpoka(id_epoka));

--wypelnienie tabel
insert into geochronologia.GeoEon values(1,'fanerozoik');

insert into geochronologia.GeoEra values(1,'paleozoik',1);
insert into geochronologia.GeoEra values(2,'mezozoik',1);
insert into geochronologia.GeoEra values(3,'kenozoik',1);

insert into geochronologia.GeoOkres values(1, 'dewon',1);
insert into geochronologia.GeoOkres values(2, 'karbon',1);
insert into geochronologia.GeoOkres values(3, 'perm',1);
insert into geochronologia.GeoOkres values(4, 'trias',2);
insert into geochronologia.GeoOkres values(5, 'jura',2);
insert into geochronologia.GeoOkres values(6, 'kreda',2);
insert into geochronologia.GeoOkres values(7, 'palogen',3);
insert into geochronologia.GeoOkres values(8, 'neogen',3);
insert into geochronologia.GeoOkres values(9, 'czwartorzad',3);

insert into geochronologia.GeoEpoka values(1, 'dolny', 1);
insert into geochronologia.GeoEpoka values(2, 'srodkowy', 1);
insert into geochronologia.GeoEpoka values(3, 'gorny', 1);
insert into geochronologia.GeoEpoka values(4, 'dolny', 2);
insert into geochronologia.GeoEpoka values(5, 'gorny', 2);
insert into geochronologia.GeoEpoka values(6, 'dolny', 3);
insert into geochronologia.GeoEpoka values(7, 'gorny', 3);
insert into geochronologia.GeoEpoka values(8, 'dolny', 4);
insert into geochronologia.GeoEpoka values(9, 'srodkowy', 4);
insert into geochronologia.GeoEpoka values(10, 'gorny', 4);
insert into geochronologia.GeoEpoka values(11, 'dolna', 5);
insert into geochronologia.GeoEpoka values(12, 'srodkowa', 5);
insert into geochronologia.GeoEpoka values(13, 'gorna', 5);
insert into geochronologia.GeoEpoka values(14, 'dolna', 6);
insert into geochronologia.GeoEpoka values(15, 'gorna', 6);
insert into geochronologia.GeoEpoka values(16, 'paleocen', 7);
insert into geochronologia.GeoEpoka values(17, 'eocen', 7);
insert into geochronologia.GeoEpoka values(18, 'oligocen', 7);
insert into geochronologia.GeoEpoka values(19, 'miocen', 8);
insert into geochronologia.GeoEpoka values(20, 'pliocen', 8);
insert into geochronologia.GeoEpoka values(21, 'plejstocen', 9);
insert into geochronologia.GeoEpoka values(22, 'holocen', 9);


insert into geochronologia.GeoPietro values (1,'megalaj',22);
insert into geochronologia.GeoPietro values(2,'nortgryp',22);
insert into geochronologia.GeoPietro values(3,'grenland',22);

insert into geochronologia.GeoPietro values(4,'tarant',21);
insert into geochronologia.GeoPietro values(5,'chiban',21);
insert into geochronologia.GeoPietro values(6,'kalabr',21);
insert into geochronologia.GeoPietro values(7,'gelas',21);

insert into geochronologia.GeoPietro values(8,'piacent',20);
insert into geochronologia.GeoPietro values(9,'zankl',20);

insert into geochronologia.GeoPietro values(10,'messyn',19);
insert into geochronologia.GeoPietro values(11,'torton',19);
insert into geochronologia.GeoPietro values(12,'serrawal',19);
insert into geochronologia.GeoPietro values(13,'lang',19);
insert into geochronologia.GeoPietro values(14,'burdyga',19);
insert into geochronologia.GeoPietro values(15,'akwitan',19);

insert into geochronologia.GeoPietro values(16,'szat',18);
insert into geochronologia.GeoPietro values(17,'rupel',18);

insert into geochronologia.GeoPietro values(18,'priabon',17);
insert into geochronologia.GeoPietro values(19,'barton',17);
insert into geochronologia.GeoPietro values(20,'lutet',17);
insert into geochronologia.GeoPietro values(21,'iprez',17);

insert into geochronologia.GeoPietro values(22,'tanet',16);
insert into geochronologia.GeoPietro values(23,'zeland',16);
insert into geochronologia.GeoPietro values(24,'dan',16);

insert into geochronologia.GeoPietro values(25,'mastrycht',15);
insert into geochronologia.GeoPietro values(26,'kampan',15);
insert into geochronologia.GeoPietro values(27,'santon',15);
insert into geochronologia.GeoPietro values(28,'koniak',15);
insert into geochronologia.GeoPietro values(29,'turon',15);
insert into geochronologia.GeoPietro values(30,'cenoman',15);

insert into geochronologia.GeoPietro values(31,'alb',14);
insert into geochronologia.GeoPietro values(32,'apt',14);
insert into geochronologia.GeoPietro values(33,'barrem',14);
insert into geochronologia.GeoPietro values(34,'hoteryw',14);
insert into geochronologia.GeoPietro values(35,'walanzyn',14);
insert into geochronologia.GeoPietro values(36,'berrias',14);

insert into geochronologia.GeoPietro values(37,'tyton',13);
insert into geochronologia.GeoPietro values(38,'kimeryd',13);
insert into geochronologia.GeoPietro values(39,'oksford',13);

insert into geochronologia.GeoPietro values(40,'kelowej',12);
insert into geochronologia.GeoPietro values(41,'baton',12);
insert into geochronologia.GeoPietro values(42,'bajos',12);
insert into geochronologia.GeoPietro values(43,'aalen',12);

insert into geochronologia.GeoPietro values(44,'toark',11);
insert into geochronologia.GeoPietro values(45,'pliensbach',11);
insert into geochronologia.GeoPietro values(46,'synemur',11);
insert into geochronologia.GeoPietro values(47,'hettang',11);

insert into geochronologia.GeoPietro values(48,'retyk',10);
insert into geochronologia.GeoPietro values(49,'noryk',10);
insert into geochronologia.GeoPietro values(50,'karnik',10);

insert into geochronologia.GeoPietro values(51,'ladyn',9);
insert into geochronologia.GeoPietro values(52,'anizyk',9);

insert into geochronologia.GeoPietro values(53,'olenek',8);
insert into geochronologia.GeoPietro values(54,'ind',8);

insert into geochronologia.GeoPietro values(55,'czangsing',7);
insert into geochronologia.GeoPietro values(56,'wucziaping',7);
insert into geochronologia.GeoPietro values(57,'kapitan',7);
insert into geochronologia.GeoPietro values(58,'word',7);
insert into geochronologia.GeoPietro values(59,'road',7);

insert into geochronologia.GeoPietro values(60,'kungur',6);
insert into geochronologia.GeoPietro values(61,'artinsk',6);
insert into geochronologia.GeoPietro values(62,'sakmar',6);
insert into geochronologia.GeoPietro values(63,'assel',6);

insert into geochronologia.GeoPietro values(64,'gzel',5);
insert into geochronologia.GeoPietro values(65,'kasimow',5);
insert into geochronologia.GeoPietro values(66,'moskow',5);
insert into geochronologia.GeoPietro values(67,'baszkir',5);

insert into geochronologia.GeoPietro values(68,'serpuchow',4);
insert into geochronologia.GeoPietro values(69,'wizen',4);
insert into geochronologia.GeoPietro values(70,'turnej',4);

insert into geochronologia.GeoPietro values(71,'famen',3);
insert into geochronologia.GeoPietro values(72,'fran',3);

insert into geochronologia.GeoPietro values(73,'zywet',2);
insert into geochronologia.GeoPietro values(74,'eifel',2);

insert into geochronologia.GeoPietro values(75,'ems',1);
insert into geochronologia.GeoPietro values(76,'prag',1);
insert into geochronologia.GeoPietro values(77,'lochkow',1);

--tabela GeoTable
select geochronologia.GeoPietro.id_pietro,geochronologia.GeoPietro.nazwa_pietro,
geochronologia.GeoEpoka.id_epoka,geochronologia.GeoEpoka.nazwa_epoka,
geochronologia.GeoOkres.id_okres,geochronologia.GeoOkres.nazwa_okres,
geochronologia.GeoEra.id_era,geochronologia.GeoEra.nazwa_era,
GeoEon.id_eon,GeoEon.nazwa_eon
into geochronologia.GeoTabela from geochronologia.GeoEon inner join geochronologia.GeoEra on geochronologia.GeoEon.id_eon=geochronologia.GeoEra.id_eon
inner join geochronologia.GeoOkres on GeoEra.id_era=GeoOkres.id_era
inner join geochronologia.GeoEpoka on GeoOkres.id_okres=GeoEpoka.id_okres
inner join geochronologia.GeoPietro on GeoEpoka.id_epoka=GeoPietro.id_epoka

select * from geochronologia.GeoTabela;

--tabele milion i dziesiec
create table geochronologia.Dziesiec(cyfra int,bit int);

insert into geochronologia.Dziesiec values (0,1);
insert into geochronologia.Dziesiec values (1,1);
insert into geochronologia.Dziesiec values (2,1);
insert into geochronologia.Dziesiec values (3,1);
insert into geochronologia.Dziesiec values (4,1);
insert into geochronologia.Dziesiec values (5,1);
insert into geochronologia.Dziesiec values (6,1);
insert into geochronologia.Dziesiec values (7,1);
insert into geochronologia.Dziesiec values (8,1);
insert into geochronologia.Dziesiec values (9,1);

create table geochronologia.Milion(liczba int,cyfra int, bit int);

insert into geochronologia.Milion 
select a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra as liczba, 
	a1.cyfra as cyfra, 
	a1.bit as bit
from geochronologia.Dziesiec a1, geochronologia.Dziesiec a2, geochronologia.Dziesiec a3, geochronologia.Dziesiec a4, geochronologia.Dziesiec a5, geochronologia.Dziesiec a6;

select * from geochronologia.Milion;
alter table geochronologia.GeoTabela add primary key(id_pietro);
--ZAPYTANIE 1
set statistics time on;
select COUNT(*) from geochronologia.Milion INNER JOIN geochronologia.GeoTabela on Milion.liczba%77 = GeoTabela.id_pietro;
set statistics time off;

--ZAPYTANIE 2
set statistics time on;
select COUNT(*) from geochronologia.Milion inner join geochronologia.GeoPietro on
(geochronologia.Milion.liczba%77=GeoPietro.id_pietro)
inner join geochronologia.GeoEpoka on GeoPietro.id_epoka=GeoEpoka.id_epoka
inner join geochronologia.GeoOkres on GeoEpoka.id_okres= GeoOkres.id_okres
inner join geochronologia.GeoEra on GeoEra.id_era=GeoOkres.id_era
inner join geochronologia.GeoEon on GeoEon.id_eon=GeoEra.id_eon
set statistics time off;

--ZAPYTANIE 3
set statistics time on;
select COUNT(*) from geochronologia.Milion where Milion.liczba%77 = 
(select id_pietro from geochronologia.GeoTabela where Milion.liczba%77=id_pietro)
set statistics time off;

--ZAPYTANIE 4
set statistics time on;
select COUNT(*) from geochronologia.Milion where Milion.liczba%77 in
(select GeoPietro.id_pietro from geochronologia.GeoPietro 
inner join geochronologia.GeoEpoka on GeoPietro.id_epoka = GeoEpoka.id_epoka 
inner join geochronologia.GeoOkres on GeoEpoka.id_okres = GeoOkres.id_okres
inner join geochronologia.GeoEra on GeoEra.id_era = GeoOkres.id_era
inner join geochronologia.GeoEon on GeoEon.id_eon = GeoEra.id_eon)
set statistics time off;

--indeksy
create index iEon on geochronologia.GeoEon(id_eon);
create index iEra on geochronologia.GeoEra(id_era, id_eon);
create index iOkres on geochronologia.GeoOkres(id_okres, id_era);
create index iEpoka on geochronologia.GeoEpoka(id_epoka, id_okres);
create index iPietro on geochronologia.GeoPietro(id_pietro, id_epoka);
create index iLiczba on geochronologia.Milion(liczba);
create index iGeoTabela on geochronologia.GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);

drop index iEon on geochronologia.GeoEon;
drop index iEra on geochronologia.GeoEra;
drop index iOkres on geochronologia.GeoOkres;
drop index iEpoka on geochronologia.GeoEpoka;
drop index iPietro on geochronologia.GeoPietro;
drop index iLiczba on geochronologia.Milion;
drop index iGeoTabela on geochronologia.GeoTabela;