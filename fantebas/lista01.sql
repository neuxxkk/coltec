--Vitor Neuenschwander Mendes da Silva - 203

--EX01
use world;
select code, name from country order by code limit 10;
select code, name from (select * from country order by code desc limit 10) as subquery order by code asc;
select name, code from country where name like "United%";
select count(*) from country; //239
SELECT countrycode, COUNT(language) FROM countrylanguage GROUP BY countrycode ORDER BY countrycode LIMIT 10;
select countrycode Code, group_concat(language separator ', ') Language from countrylanguage group by code limit 20;
select countrycode Code, group_concat(language separator ', ') Language from countrylanguage where isofficial = 'T' group by code limit 20;
select CountryCode, count(IsOfficial) as OL from CountryLanguage where Isofficial='T' group by CountryCode having OL>=2;
select distinct(region) from Country;
select Code, name, LifeExpectancy from Country where region='Nordic Countries';
select ROW_NUMBER() over() ID, name, surfacearea from Country order by surfacearea desc limit 10;
select row_number() over() ID, Code, SurfaceArea from Country order by SurfaceArea limit 5;
select row_number() over() ID, Code, SurfaceArea from Country where continent='Europe' order by SurfaceArea limit 5;
select ROW_NUMBER() over() ID, Code, Population from Country order by population desc limit 5;
select name Nome, surfacearea 'Extensao Territorial' from Country where name in ("Germany", "France", "Italy", "United Kingdom", "Portugal", "Spain") order by surfacearea desc;
select continent Continente, count(code) 'Numero de paises' from Country group by continent limit 10;
select count(*) 'Quantidade de Cidadades' from City;
select Name, Population from City where countrycode="BRA";
select count(*) "Quantidade de cidades BR" from City where countrycode="BRA";
select CountryCode País, count(name) "Quantidade de cidades" from City group by CountryCode order by count(name) desc;

--EX02

--CREATING!!
create table Pessoa(
ID int AUTO_INCREMENT,
Nome varchar(255) NOT NULL,
Apelido varchar(255),
Relacao enum('parente','amigo(a)','conjuge','comercial'),
Cidade varchar(255),
Estado char(2),
Pais varchar(255),
PRIMARY KEY(ID)
);

create table Contato(
ID int AUTO_INCREMENT,
Nome varchar(255) NOT NULL,
Status enum('ativo', 'desativo'),
Celular varchar(20),
Email varchar(255),
PRIMARY KEY(ID)
);

create table Rede(
ID int AUTO_INCREMENT,
Nome varchar(255) NOT NULL,
WhatsApp varchar(20),
Twitter varchar(255),
Instagram varchar(255),
PRIMARY KEY(ID)
);

create table Informacao(
ID int AUTO_INCREMENT,
Nome varchar(255) NOT NULL,
DataUltimaConversa DATE,
FrequenciaContato enum('diario','semanal','anual','raramente'),
Observacao varchar(255),
PRIMARY KEY(ID)
);

--INSERTING!!
insert into Pessoa (Nome, Apelido, Relacao, Cidade, Estado, Pais)
values ( 'Vitor Mendes', 'Alemao', 'parente', 'Belo Horizonte', 'MG', 'Brasil'),
('Marina Meinberg', 'Nina', 'amigo(a)', 'Rio de Janeiro', 'RJ', 'Brasil'),
('Pamela Eduarda', 'Pamps', 'conjuge', 'Belo Horizonte', 'MG', 'Brasil');

