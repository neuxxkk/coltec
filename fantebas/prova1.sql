--Vitor Neuenschwander Mendes da Silva
SELECT ("Vitor Neuenschwander Mendes da Silva") Aluno;

select model, speed, hd, price from PC where price<500;

select DISTINCT(maker) from Product where type="Printer"

select p.maker Frabricantes, l.speed Velocidade, l.hd HD from Laptop l join Product p ON l.model=p.model where hd>=10;

select concat(FIRST_NAME, " ", last_name) Nome, Salary from employees where Salary > (SELECT Salary from employees where last_name='Partners');

select CONCAT(FIRST_NAME, " ", LAST_NAME) Name, Salary from employees where salary > (select avg(salary) from employees);

select CONCAT(e.FIRST_NAME, " ", e.LAST_NAME) Name, d.department_name from employees e join departments d on d.department_id=e.department_id where d.department_name like "%IT%";


