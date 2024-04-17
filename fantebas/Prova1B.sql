-- Vitor Neuenschwander Mendes Da Silva 203
-- 09/04/2024

select "Vitor Neuenschwander Mendes Da Silva";

-- QUESTAO 1.1
use Prova1B;

-- CREATE TABLE categorias( id int auto_increment, categoria varchar(255), primary key(id) );

-- ALTER TABLE categorias AUTO_INCREMENT=10;

-- insert into categorias (categoria) values ("papelaria"),("informatica"),("oficina"),("moveis");


-- QUESTAO 1.2
select f.produto 'ID', e.quantidade 'Quantidade', f.preco_base 'Preco Base' from financeiro f join estoque e on f.produto=e.id_produto;


-- QUESTAO 1.3
select p.nome 'Nome', e.quantidade 'Quantidade', f.preco_base 'Preco Base' from financeiro f join estoque e on f.produto=e.id_produto join produtos p on p.id=f.produto;
select sleep(4);

-- QUESTAO 1.4
select c.categoria 'Categoria', p.nome 'Nome', e.quantidade 'Quantidade', f.preco_base 'Preco Base', (Quantidade*f.preco_base) 'Preco Total' from financeiro f join estoque e  on e.id_produto=f.produto join produtos p on p.id=f.produto join categorias c on c.id=p.categoria;
select sleep(4);


-- QUESTAO 1.5
select c.categoria Categoria, sum(e.quantidade) "Qtd Total de Produtos", sum(f.preco_base) "Preco Base Total" from categorias c join produtos p on p.categoria=c.id join financeiro f on f.produto=p.id join estoque e on e.id_produto=p.id group by Categoria;
select sleep(4);

-- QUESTAO 1.6
select c.categoria 'Categoria', p.nome 'Nome', e.quantidade 'Quantidade', ROUND((f.preco_base*0.95),2) 'Preco Janeiro', ROUND((f.preco_base*1.045),2) 'Preco Fevereiro' from financeiro f join estoque e on e.id_produto=f.produto join produtos p on p.id=f.produto join categorias c on c.id=p.categoria;
select sleep(4);

-- QUESTAO 1.7
select c.categoria 'Categoria', p.nome 'Nome', e.quantidade 'Quantidade', ROUND((f.preco_base*0.95),2) 'Preco Janeiro', ROUND((f.preco_base*1.045),2) 'Preco Fevereiro' from financeiro f join estoque e on e.id_produto=f.produto join produtos p on p.id=f.produto join categorias c on c.id=p.categoria WHERE c.categoria="papelaria" or c.categoria="informatica";
select sleep(4);

-- QUESTAO 1.8
select c.categoria 'Categoria', sum(e.quantidade) 'Quantidade Total', ROUND(sum((f.preco_base*0.95)),2) 'Preco Total Janeiro', ROUND(sum((f.preco_base*1.045)),2) 'Preco Total Fevereiro' from financeiro f join estoque e on e.id_produto=f.produto join produtos p on p.id=f.produto join categorias c on c.id=p.categoria group by c.id having sum((f.preco_base*0.95))>100;
select sleep(4);

-- QUESTAO 2.1

use company;

SELECT d.department_name "Departamento", count(e.employee_id) "Numero de Empregados" from departments d join employees e on d.department_id=e.department_id group by d.department_id order by count(e.employee_id) desc;
select sleep(4);

-- QUESTAO 2.2
select job_title Cargo, max_salary "Maior Salario", min_salary "Menor Salario", (max_salary-min_salary) Diferenca from jobs order by Diferenca;
select sleep(4);

-- QUESTAO 2.3
select d.department_name "Department Name", c.country_name "Country", r.region_name "Region" from departments d join locations l on l.location_id=d.location_id join countries c on c.country_id=l.country_id join regions r on r.region_id=c.region_id order by Region;
select sleep(4);

-- QUESTAO 2.4
select r.region_name "Region", count(c.country_id) "Numeros de Paises" from regions r join countries c on r.region_id=c.region_id group by r.region_id;
select sleep(4);
