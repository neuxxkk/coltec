--Vitor Neuenschwander Mendes da Silva
SELECT ("Vitor Neuenschwander Mendes da Silva") Aluno;

select model, speed, hd, price from PC where price<500; --Question 1

select DISTINCT(maker) from Product where type="Printer" --Question 2

select p.maker Frabricantes, l.speed Velocidade, l.hd HD from Laptop l join Product p ON l.model=p.model where hd>=10; --Question 3

select concat(FIRST_NAME, " ", last_name) Nome, Salary from employees where Salary > (SELECT Salary from employees where last_name='Partners'); --Question 4

select CONCAT(FIRST_NAME, " ", LAST_NAME) Name, Salary from employees where salary > (select avg(salary) from employees); --Question 5

select CONCAT(e.FIRST_NAME, " ", e.LAST_NAME) Name, d.department_name from employees e join departments d on d.department_id=e.department_id where d.department_name like "%IT%";--Question 6

select Name, HeadOfState from Country order by Population desc limit 1;--Question 7

select c.Code, count(l.Language) from Country c join CountryLanguage l on c.Code = l.CountryCode where l.IsOfficial = 'T' group by c.Code;--Question 8

select count(l.Language) from Country c join CountryLanguage l on c.Code = l.CountryCode where l.IsOfficial = 'T' group by c.Code order by count(l.Language) desc limit 1;--Question 9

select CustomerID, CompanyName, City, Country from Customers where City = 'Berlin' and Country = 'Germany';--Question 10

select CustomerID, CompanyName, City, Country from Customers where City = 'Berlin' or City = 'Stuttgart';--Question 11

select CustomerID, CompanyName, City, Country from Customers where Country != 'Germany';--Question 12

select sum(if(Survived = 1, 1, 0)) as Sobreviveram, sum(if(Survived = 1, 0, 1)) as "Nao Sobreviveram" from passengers;--Question 13

select sum(if(Pclass = 1, 1,0)) as Classe1, sum(if(Pclass= 2, 1,0)) as Classe2, sum(if(Pclass = 3, 1,0)) as Classe3 from passengers;--Question 14

select count(PassengerID) from passengers;--Question 15
