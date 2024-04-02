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

select count(emp_no) from employees;

select count(emp_no) from salaries;

select emp_no EmployeeID, sum(salary) TotalSalary from salaries group by emp_no having emp_no<=1010;

select dept_no Department, count(emp_no) EmployeesNumber from dept_emp where dept_no = 'd005' or dept_no = 'd007' group by Department;

select (select count(emp_no) from employees where gender='M' group by gender) Homens, (select count(emp_no) from employees where gender='F' group by gender) Mulheres;

select t.title Title, avg(s.salary) SalaryAverage from salaries s join titles t on s.emp_no=t.emp_no group by t.title order by avg(s.salary) desc;

select t.title Title, round(avg(s.salary),2) SalaryAverage from salaries s join titles t on s.emp_no=t.emp_no group by t.title order by avg(s.salary) desc;

select d.emp_no ID, concat(e.first_name,' ', e.last_name) Name, count(d.emp_no) DeptNumber from dept_emp d join employees e on d.emp_no=e.emp_no group by d.emp_no having count(d.emp_no)>=2 order by count(d.emp_no), d.emp_no;

select concat(e.first_name, ' ', e.last_name) Name, max(s.salary) MaiorSalario from salaries s join employees e on e.emp_no=s.emp_no group by e.emp_no order by max(s.salary) desc limit 1;

select concat(e.first_name, ' ', e.last_name) Name, max(s.salary) MaiorSalario from salaries s join employees e on e.emp_no=s.emp_no group by e.emp_no order by max(s.salary) desc limit 1 offset 1;

select month(hire_date), count(month(hire_date)) from employees group by month(hire_date) order by count(month(hire_date)) desc limit 1;

select d.dept_no Department, min(year(e.hire_date)-year(e.birth_date)) MinAge from employees e join dept_emp d on d.emp_no=e.emp_no group by d.dept_no order by d.dept_no;

SELECT e.emp_no AS ID, CONCAT(e.first_name, ' ', e.last_name) AS Name, dp.dept_name AS Department FROM employees AS e JOIN dept_emp AS d ON e.emp_no = d.emp_no JOIN departments AS dp ON dp.dept_no = d.dept_no WHERE e.first_name REGEXP '^[^aeiouAEIOU]*$'

-- /company BD

use company;

show tables;

desc countries;
desc departments;
desc employees;
desc job_history;
desc jobs;
desc locations;
desc regions;
desc tb1;

SELECT COUNT(*) EmployeesCount FROM employees;

SELECT COUNT(DISTINCT(DEPARTMENT_ID)) DepartmentsCount FROM employees;

select CONCAT(FIRST_NAME, " ", LAST_NAME) Name, Salary from employees where salary > (select salary from employees where LAST_NAME = "Bull") ORDER BY salary desc;

SELECT concat(e.FIRST_NAME, " ", e.LAST_NAME) Name, e.department_id, d.department_name from employees e, departments d where e.department_id=d.department_id and d.department_name like "IT%";

SELECT CONCAT(e.FIRST_NAME, " ", e.LAST_NAME) Name, e.Salary Salary, d.department_name Department FROM employees e join departments d on d.department_id=e.department_id where e.Salary>(select avg(salary) from employees) and d.department_name like "IT%";

