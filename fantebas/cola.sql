USE myWork;

CREATE TABLE IF NOT EXISTS Angulos(
	id INT,
	radian varchar(255),
	degree INT,
	sin_ varchar(255),
	cos_ varchar(255),
	aprox_sin varchar(255),
	aprox_cos varchar(255)
)

	
LOAD DATA INFILE '/var/lib/mysql-files/lista1.csv' --secure-file-priv
INTO TABLE Angulos
FIELDS TERMINATED BY ','
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

UPDATE Angulos SET radian = CAST(REPLACE(radian, ',', '.') AS DOUBLE);
UPDATE Angulos SET sin_ = CAST(REPLACE(sin_, ',', '.') AS DOUBLE);
UPDATE Angulos SET cos_ = CAST(REPLACE(cos_, ',', '.') AS DOUBLE);
UPDATE Angulos SET aprox_sin = CAST(REPLACE(aprox_sin, ',', '.') AS DOUBLE);
UPDATE Angulos SET aprox_cos = CAST(REPLACE(aprox_cos, ',', '.') AS DOUBLE);

alter table Angulos modify column cos_ float; //MUDA NOME AUTOMÁTICO "coS__"

update Dados set Nascimento= concat(floor(1924+rand()*100),'-',floor(rand()*12),'-',floor(rand()*30)) --rand() = random(0,1)  aaaa-mm-dd

delete from Dados where Id=1;

select n from A where n not in(select n from B);

select N from (
	select * from A
	union all
	select * from B
	union
	select * from C
	) AS TU
where N%2=0;


docker run --name alemaosql -e MYSQL_ROOT_PASSWORD=9841 -d mysql:8.3
docker run --name alemaophp -d --link alemaosql:db -p 8080:80 phpmyadmin

docker start alemaosql

docker exec -it alemaosql bash



