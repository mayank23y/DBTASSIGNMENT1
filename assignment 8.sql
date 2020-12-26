create database assignment8;
use assignment8;
Create table EMP ( EMPNO numeric(4) not null, 
ENAME varchar(30) not null, 
JOB varchar(10), 
MGR numeric(4), 
HIREDATE date,
 SAL numeric(7,2),
 DEPTNO numeric(2) ); 
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
 Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL,  DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO  ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );
select * from EMP ;
select ENAME from EMP  where ENAME  regexp '^sc';
select ENAME from EMP where ENAME regexp 'ng$';
select ENAME from EMP  where ENAME  regexp '^sa';
select ENAME from EMP where ENAME regexp 'sh$';
select JOB from EMP where JOB regexp 'io | ea';
select JOB from EMP where JOB regexp 'MA|SA';
select ENAME from EMP  where ENAME  regexp '[s,d]';

-- que2
	CREATE TABLE tutorial (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, 
title VARCHAR(200), 
description TEXT, 
FULLTEXT(title,description)
) ENGINE=InnoDB ;

INSERT INTO tutorial (title,description) VALUES
('SQL Joins','An SQL JOIN clause combines rows from two or more tables. It creates a set of rows in a temporary table.'),
('SQL Equi Join','SQL EQUI JOIN performs a JOIN against equality or matching column(s) values of the associated tables. An equal sign (=) is used as comparison operator in the where clause to refer equality.'),
('SQL Left Join','The SQL LEFT JOIN, joins two tables and fetches rows based on a condition, which is matching in both the tables and the unmatched rows will also be available from the table before the JOIN clause.'),
('SQL Cross Join','The SQL CROSS JOIN produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table, if no WHERE clause is used along with CROSS JOIN.'),
('SQL Full Outer Join','In SQL the FULL OUTER JOIN combines the results of both left and right outer joins and returns all (matched or unmatched) rows from the tables on both sides of the join clause.'),
('SQL Self Join','A self join is a join in which a table is joined with itself (which is also called Unary relationships), especially when the table has a FOREIGN KEY which references its own PRIMARY KEY.');

select * from tutorial where match(title,description) against('Left right' in natural language mode);


