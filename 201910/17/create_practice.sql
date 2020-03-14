
USE practice_sql;
SHOW TABLES;

CREATE TABLE person( idx int unsigned auto_increment, name varchar(30), age int, gender char(3), grade int, primary key(idx) ); 
DESC person;

INSERT INTO person(name, age, gender, grade) VALUES ('first', 20, 'M', 6);