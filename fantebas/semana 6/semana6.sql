--Vitor Mendes 203

--Consultas para enviar /world

USE world;

Select Country.Name as Pais, City.Name as Capital from Country inner join City on Country.Continent = "South America" and City.ID=Country.Capital;

SELECT CountryLanguage.Language FROM CountryLanguage  JOIN Country  ON CountryLanguage.CountryCode = Country.Code WHERE Country.Region = 'Caribbean';

select C.Code, C.Name, count(Cl.CountryCode) as NumerodeLinguas from Country C join CountryLanguage Cl on C.Code=Cl.CountryCode where IsOfficial = 'T' group by Cl.CountryCode order by NumerodeLinguas desc;

select C.Code, C.Name, count(Cl.CountryCode) as NumerodeLinguas from Country C join CountryLanguage Cl on C.Code=Cl.CountryCode where IsOfficial = 'T' group by Cl.CountryCode having NumerodeLinguas >=3;

select C.Code, C.Name, count(Cl.CountryCode) as NumerodeLinguas from Country C join CountryLanguage Cl on C.Code=Cl.CountryCode where IsOfficial = 'T' group by Cl.CountryCode having NumerodeLinguas >=3 order by NumerodeLinguas desc;

select C.Code, C.Name, count(Cl.Language) as Language from Country C join CountryLanguage Cl on C.Code=Cl.CountryCode group by Cl.CountryCode having Language >=3 order by Language desc;

--Consultas parte 4 /employees

use employees;

show tables;
