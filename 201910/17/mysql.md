### console 접속

```
$ mysql -u [유저이름] -p
[비밀번호 있으면 비밀번호 입력]
```

- https://luckyyowu.tistory.com/184

### 자주 쓰는 명령어

### database 관련
```
mysql > show databases;
+--------------------+
| Database           |
+--------------------+
| blog_test          |
| chess              |
| eunsukko_db        |
| fakebook           |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
8 rows in set (0.15 sec)

mysql > create database practice_sql;
mysql > use [DB name]

mysql > select database();
mysql > select database() FROM DUAL; // DUAL 은 오라클 DB 를 위한듯; from 이후가 없으면 안된다고함; 가상의 테이블 용도

mysql > DROP database [DB name]
```


### 테이블
```
mysql > desc [TABLE name]

mysql > desc person;
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| idx    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(30)      | YES  |     | NULL    |                |
| age    | int(11)          | YES  |     | NULL    |                |
| gender | char(3)          | YES  |     | NULL    |                |
| grade  | int(11)          | YES  |     | NULL    |                |
+--------+------------------+------+-----+---------+----------------+
5 rows in set (0.02 sec)


mysql> INSERT INTO person(name, age, gender, grade) VALUES ('hello', 20, 'M', 10);
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM person
    -> ;
+-----+-------+------+--------+-------+
| idx | name  | age  | gender | grade |
+-----+-------+------+--------+-------+
|   1 | hello |   20 | M      |    10 |
+-----+-------+------+--------+-------+
1 row in set (0.01 sec)

mysql> INSERT INTO person 
    -> VALUES (4, 'second', 20, 'W', 10);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM person;
+-----+--------+------+--------+-------+
| idx | name   | age  | gender | grade |
+-----+--------+------+--------+-------+
|   1 | hello  |   20 | M      |    10 |
|   4 | second |   20 | W      |    10 |
+-----+--------+------+--------+-------+
2 rows in set (0.00 sec)

```

#### update 

> UPDATE table_name
     SET column_name = value, column_name = value, ...
     WHERE conditions;

```
mysql> SELECT * FROM person WHERE idx=5;
+-----+--------+------+--------+-------+
| idx | name   | age  | gender | grade |
+-----+--------+------+--------+-------+
|   5 | second |   20 | W      |    10 |
+-----+--------+------+--------+-------+
1 row in set (0.00 sec)

mysql> UPDATE person
    -> SET age=100, grade=100
    -> WHERE idx=5;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM person WHERE idx=5;
+-----+--------+------+--------+-------+
| idx | name   | age  | gender | grade |
+-----+--------+------+--------+-------+
|   5 | second |  100 | W      |   100 |
+-----+--------+------+--------+-------+
1 row in set (0.00 sec)
```


#### delete data
```
mysql> SELECT * FROM person;
+-----+--------+------+--------+-------+
| idx | name   | age  | gender | grade |
+-----+--------+------+--------+-------+
|   1 | hello  |   20 | M      |    10 |
|   4 | second |   20 | W      |    10 |
|   5 | second |  100 | W      |   100 |
+-----+--------+------+--------+-------+
3 rows in set (0.00 sec)

mysql> DELETE FROM person 
    -> WHERE idx=5;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM person;
+-----+--------+------+--------+-------+
| idx | name   | age  | gender | grade |
+-----+--------+------+--------+-------+
|   1 | hello  |   20 | M      |    10 |
|   4 | second |   20 | W      |    10 |
+-----+--------+------+--------+-------+
2 rows in set (0.00 sec)
```
#### drop table
```
mysql> DROP TABLE table_name
```
