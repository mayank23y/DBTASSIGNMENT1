CREATE DATABASE ASSIGNMENT5;
Create table EMP ( EMPNO numeric(4) not null, ENAME varchar(30) not null, JOB varchar(10), MGR numeric(4), HIREDATE date, SAL numeric(7,2), DEPTNO numeric(2) );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL,  DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER'  ,     null    , '2000-02-18' ,6000, 10 );
 SELECT database();
Create table dept (dno numeric(4) not null, dname varchar(10) not null,area varchar(30));
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');

DELIMITER @@
create procedure QUES01(IN VAL1 INT,IN VAL2 INT)
BEGIN
SELECT VAL1 + VAL2;
SELECT VAL1 - VAL2;
SELECT VAL1 * VAL2;
SELECT VAL1 / VAL2;
END @@

CALL QUES01(20,10);

------------------2
DELIMITER $$
create procedure QUES02(INOUT STR VARCHAR(10))
BEGIN
SET @STR=(SELECT reverse(STR));
END $$
SET @STR='DATABASE';
CALL QUES02(@STR);
SELECT @STR AS REV;

---------3
DELIMITER @@
CREATE PROCEDURE QUES03()
BEGIN 
select EMPNO,ENAME,SAL FROM EMP ORDER BY SAL DESC LIMIT 5;
END @@
CALL QUES03();

--------------4
DELIMITER ##
CREATE PROCEDURE QUES04()
BEGIN 
CREATE TABLE EMP_TEST(E_ID INT,ENAME VARCHAR(10),E_JOINING_DATE date);
END ##
CALL QUES04();

--------------------5
DELIMITER @@
CREATE procedure QUES05(IN DEPT_NO INT, IN DNAME VARCHAR(10),IN AREA VARCHAR(10))
BEGIN
insert INTO DEPT VALUES( DEPT_NO,DNAME,AREA);
END @@
CALL QUES05(60,'EDUCATION','PUNE');

-------------------------6
DELIMITER @@
CREATE procedure QUES06(INOUT NUM INT,OUT SQR INT ,OUT CUBE1 INT)
BEGIN
DECLARE NUM1 INT;
SET NUM1=NUM;
SELECT NUM ,power(NUM,2) ,power(NUM,3) INTO NUM,SQR,CUBE1;
END @@
SET @NUM=2;
CALL QUES06(@NUM,@SQR,@CUBE1);
SELECT @NUM,@SQR,@CUBE1;

-----------------7
DELIMITER @@
CREATE PROCEDURE QUES07(OUT SOL INT )
BEGIN
DECLARE X1 INT;
SET X1=5;
SELECT X1 INTO SOL;
END@@

CALL QUES07(@SOL);
SELECT @SOL;

----------------------------8
DELIMITER @@
CREATE PROCEDURE QUES08(IN INPUT INT,OUT Y INT)
BEGIN 
DECLARE A INT;
SET  @A=INPUT;
SET Y=INPUT+2;
END@@

CALL QUES08(2,@Y);
SELECT @Y;




