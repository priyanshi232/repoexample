sql

every command will be ending with ;
create database db_name;
use db_name; command to go into db_name database (to change the databse)
show databases;
show tables;

data types supported in sql
int
bigint
smallint
double
decimal
date
time
varchar (string)
char
text

create table employee(emp_no int,emp_name text,salary double,deptno int);
describe employee;
mysql> describe employee;
+----------+--------+------+-----+---------+-------+
| Field    | Type   | Null | Key | Default | Extra |
+----------+--------+------+-----+---------+-------+
| emp_no   | int    | YES  |     | NULL    |       |
| emp_name | text   | YES  |     | NULL    |       |
| salary   | double | YES  |     | NULL    |       |
| deptno   | int    | YES  |     | NULL    |       |
+----------+--------+------+-----+---------+-------+

alter table command is used to modify structure of the table like if we want to add more column
column will be added at last means appended.
mysql> alter table employee add column phoneno bigint;
mysql> describe employee
    -> ;
+----------+--------+------+-----+---------+-------+
| Field    | Type   | Null | Key | Default | Extra |
+----------+--------+------+-----+---------+-------+
| emp_no   | int    | YES  |     | NULL    |       |
| emp_name | text   | YES  |     | NULL    |       |
| salary   | double | YES  |     | NULL    |       |
| deptno   | int    | YES  |     | NULL    |       |
| phoneno  | bigint | YES  |     | NULL    |       |
+----------+--------+------+-----+---------+-------+

to add multiple columns at once
mysql> alter table employee add(gender char(1),email text);
to change data type of a colum and this is only applicable when there is no data in that column
alter table employee modify column gender varchar(8);
to change multiple column
mysql> alter table employee modify column gender char(1),modify column email varchar(20);

alter table employee rename column deptno to team;
alter table employee drop column team;
mysql> alter table employee drop column emp_no,drop column gender;
mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_name | text        | YES  |     | NULL    |       |
| salary   | double      | YES  |     | NULL    |       |
| phoneno  | bigint      | YES  |     | NULL    |       |
| email    | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> rename table employee to emp;
Query OK, 0 rows affected (0.01 sec)
mysql> desc employee;
ERROR 1146 (42S02): Table 'gainsight.employee' doesn't exist
beacause we have chnaged table name.
mysql> desc emp
    -> ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_name | text        | YES  |     | NULL    |       |
| salary   | double      | YES  |     | NULL    |       |
| phoneno  | bigint      | YES  |     | NULL    |       |
| email    | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

mysql> rename table emp to employee; chnaged to our prev name for easiness

to delete whole table and its data
mysql> drop table employee;
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
Empty set (0.00 sec)

mysql> desc employee
    -> ;
ERROR 1146 (42S02): Table 'gainsight.employee' doesn't exist

  to create other table with same structure and data with exixting table name employee
mysql> create table employee2 as select * from employee;

dml commands***************************************************
mysql> insert into employee values(101,"priyanshi");
Query OK, 1 row affected (0.01 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_no   | int         | YES  |     | NULL    |       |
| emp_name | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
date format is yy/mm/dd;
mysql> select * from employee;
+--------+-----------+
| emp_no | emp_name  |
+--------+-----------+
|    101 | priyanshi |
+--------+-----------+
inserting multiple rows 
mysql> insert into employee values(102,"bhavini"),(103,"nirali"),(104,"pavika");
mysql> select * from employee;
+--------+-----------+
| emp_no | emp_name  |
+--------+-----------+
|    101 | priyanshi |
|    102 | bhavini   |
|    103 | nirali    |
|    104 | pavika    |
+--------+-----------+

  we can skip some column values which we do not want to insert or can make the order in which we are goinng to inseert values
mysql> insert into employee(emp_name) values("rama"),("shyama");
mysql> select * from employee
    -> ;
+--------+-----------+
| emp_no | emp_name  |
+--------+-----------+
|    101 | priyanshi |
|    102 | bhavini   |
|    103 | nirali    |
|    104 | pavika    |
|   NULL | rama      |
|   NULL | shyama    |
+--------+-----------+

  if we do not want to insert at specific put null in that place in column orders
mysql> insert into employee values(null,"reeta");
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee;
+--------+-----------+
| emp_no | emp_name  |
+--------+-----------+
|    101 | priyanshi |
|    102 | bhavini   |
|    103 | nirali    |
|    104 | pavika    |
|   NULL | rama      |
|   NULL | shyama    |
|   NULL | reeta     |
+--------+-----------+

when we skip either the value will be filled with deafult value or null value.
mysql> alter table employee add column gender char(1) default 'F';
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+--------+-----------+--------+
| emp_no | emp_name  | gender |
+--------+-----------+--------+
|    101 | priyanshi | F      |
|    102 | bhavini   | F      |
|    103 | nirali    | F      |
|    104 | pavika    | F      |
|   NULL | rama      | F      |
|   NULL | shyama    | F      |
|   NULL | reeta     | F      |
+--------+-----------+--------+

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_no   | int         | YES  |     | NULL    |       |
| emp_name | varchar(20) | YES  |     | NULL    |       |
| gender   | char(1)     | YES  |     | F       |       |
+----------+-------------+------+-----+---------+-------+
ptbn: if we are giving null value to gender then it will show null instead of M.
mysql> insert into employee values(111,"heena",null);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employee;
+--------+-----------+--------+
| emp_no | emp_name  | gender |
+--------+-----------+--------+
|    101 | priyanshi | F      |
|    102 | bhavini   | F      |
|    103 | nirali    | F      |
|    104 | pavika    | F      |
|   NULL | rama      | F      |
|   NULL | shyama    | F      |
|   NULL | reeta     | F      |
|    111 | heena     | NULL   |
+--------+-----------+--------+

for saving 
mysql> commit;
mysql> exit;
Bye
ppriyanshi@GSHYD-FQJJH6L6XJ ~ % mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.1.0 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use gainsight
you can save changes and exit and can use db after 1 year or at an time 
initially autocommit is on
mysql> set autocommit = 0;   to off autocommit
after every dml query there will be no commit.
  mysql> insert into employee values(109,"suneeta",'F');
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee;
+--------+-----------+--------+
| emp_no | emp_name  | gender |
+--------+-----------+--------+
|    101 | priyanshi | F      |
|    102 | bhavini   | F      |
|    103 | nirali    | F      |
|    104 | pavika    | F      |
|   NULL | rama      | F      |
|   NULL | shyama    | F      |
|   NULL | reeta     | F      |
|    111 | heena     | NULL   |
|    109 | suneeta   | F      |
+--------+-----------+--------+
9 rows in set (0.00 sec)

mysql> desc employee;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_no   | int         | YES  |     | NULL    |       |
| emp_name | varchar(20) | YES  |     | NULL    |       |
| gender   | char(1)     | YES  |     | F       |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from employee;
+--------+-----------+--------+
| emp_no | emp_name  | gender |
+--------+-----------+--------+
|    101 | priyanshi | F      |
|    102 | bhavini   | F      |
|    103 | nirali    | F      |
|    104 | pavika    | F      |
|   NULL | rama      | F      |
|   NULL | shyama    | F      |
|   NULL | reeta     | F      |
|    111 | heena     | NULL   |
+--------+-----------+--------+
The COMMIT statement lets a user save any changes or alterations on the current transaction. These changes then remain permanent.	
The ROLLBACK statement lets a user undo all the alterations and changes that occurred on the current transaction after the last COMMIT.

update***************
for each column you have to do column vise , its not like to update multiple column at once
mysql> update table_name set colum_name = new value, col2= new val,...... where condition


delete from employee;
it will delete all rows.

you can rollback to undo operations;
mysql> delete from employee where emp_no=111;
mysql> delete from employee where emp_no in(102,103);
mysql> select * from employee;
+--------+-----------+--------+
| emp_no | emp_name  | gender |
+--------+-----------+--------+
|    101 | priyanshi | F      |
|    104 | pavika    | F      |
|   NULL | rama      | F      |
|   NULL | shyama    | F      |
|   NULL | reeta     | F      |
+--------+-----------+--------+

integrity constarints ***********************************************
constarints are data validations rules.
  unique and not null

mysql> create table transactions(acc int,type char(1),tdate date,amount double
    -> ,foreign key(acc) references master(acc) on delete cascade);



