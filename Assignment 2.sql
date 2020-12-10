use assignment;
show tables;
create table Publishers(Publisher_Id numeric(3) primary key,Publisher_Name varchar(50),Email varchar(30) unique,phone varchar(30));

create table Subjects(Subject_Id varchar(5) primary key,Subject_Name varchar(30));

create table Authors(Author_Id numeric(5) primary key,Author_Name varchar(30),Email varchar(50) unique,phone varchar(30));

create table Titles(Title_id numeric(5) primary key,Title varchar(30),Publisher_Id numeric(3),
Subject_Id varchar(5),Publish_Date date,Cover char(1),Price numeric(4),
constraint Titles_publisherid_fk foreign key (Publisher_Id) references Publishers(Publisher_Id),
constraint Titles_subjectsid_fk foreign key (Subject_Id) references Subjects(Subject_Id));


create table Title_Authors(
	Title_Id  numeric(5) ,Author_Id   numeric(5) ,Importance numeric(2),
   primary key(Title_Id,Author_Id),
   constraint  Title_Authors_Title_Id_fk foreign key (Title_Id) references Titles(Title_Id),
   constraint  Title_Authors_Author_Id_fk foreign key (Author_Id) references Authors(Author_Id));
   
create table Subjects_Backup(Subject_Id varchar(5) primary key,Subject_Name varchar(30));

insert into Publishers values 
	(1,'WILLEY','WDT@VSNL.NET','91-11-23260877'),
	(2,'WROX','INFO@WROX.COM',NULL),
	(3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','91-11-33333322'),
	(4,'TECHMEDIA','BOOKS@TECHMEDIA.COM','91-11-33257660');

insert into Subjects values 
	('ORA','ORACLE DATABASE 10g'),
	('JAVA','JAVA LANGUAGE'),
	('JEE','JAVA ENTEPRISE EDITION'),
	('VB','VISUAL BASIC.NET'),
    ('ASP','ASP.NET');    
insert into Authors values 
	(101, 'HERBERT SCHILD','HERBERT@YAHOO.COM',NULL),
	(102, 'JAMES GOODWILL','GOODWILL@HOTMAIL.COM',NULL),
	(103, 'DAVAID HUNTER','HUNTER@HOTMAIL.COM',NULL),
	(104, 'STEPHEN WALTHER','WALTHER@GMAIL.COM',NULL),
	(105, 'KEVIN LONEY','LONEY@ORACLE.COM',NULL),
	(106, 'ED. ROMANS','ROMANS@THESERVERSIDE.COM',NULL);
insert into Titles values 
	(1001,'ASP.NET UNLEASHED',4,'ASP','2002-04-12','P',540),
	(1002,'ORACLE10G COMP. REF.',3,'ORA','2005-05-01','P',575),
	(1003,'MASTERING EJB',1,'JEE','2005-02-03','P',475),
	(1004,'JAVA COMP. REF',3,'JAVA','2005-04-03','P',499),
	(1005,'PRO. VB.NET',2,'VB','2005-06-15','P',450);
insert into Title_Authors values 
	(1001,104,1),
    (1002,105,1),
    (1003,106,1),
    (1004,101,1),
    (1005,103,1),
    (1005,102,2);
select Publisher_Name,Email,phone from Publishers;
select Title_id,Title,Publish_Date from Titles;
select Author_Name,phone from Authors; 
select * from Title_Authors; 

-- LIKE OPERATOR
select Subject_Name from Subjects where Subject_Name like '%oracle%';
select Subject_Name from Subjects where Subject_Name like 'a%';
select Subject_Name from Subjects where Subject_Name like '%.net%';
select Author_Name from Authors where Author_Name like '%er';
select Publisher_Name from Publishers where Publisher_Name like '%hill%';

-- RELATIONAL OPERATOR
select Title from Titles where Price < 500;
select Title from Titles where Publish_Date < '2005-04-03';
select Subject_Name from Subjects where Subject_Id ='JEE' or Subject_Id ='JAVA';
select Author_Name from Authors where Author_Id > 103;
select * from Titles where Title_Id = 1001 or Price > 400;

-- IN OPERATOR
select * from Publishers where Publisher_Name IN ('TECHMEDIA', 'WROX');

-- AGGREGATE FUNCTIONS
select max(Price) from Titles;
select avg(Importance)from Title_Authors;
select count(Author_Id) from Authors;
select sum(Price) from Titles;

-- DATE
select Title from Titles where month(Publish_Date)=4;
select year(current_date());
select month(current_date());
select (Publish_date) from Titles  where Title='JAVA COMP. REF'; -- FOR THE DATE
select LAST_DAY(Publish_date) from Titles  where Title='JAVA COMP. REF'; -- FOR THE LAST DAY OF MONTH
-- DML
CREATE TABLE EMPLOYEE (EMP_ID INT , EMP_NAME char);
INSERT INTO EMPLOYEE VALUES
	(1,'MILAN'),
	(2,'MANOJ'),
	(3,'MAYANK');
ALTER TABLE EMPLOYEE ADD COLUMN DEPT_ID INT;
ALTER TABLE EMPLOYEE MODIFY COLUMN EMP_NAME varchar(20);
UPDATE EMPLOYEE SET EMP_NAME='Scott'; 
TRUNCATE TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;

-- EMP
ALTER  TABLE EMPLOYEE ADD COLUMN SALARY float(7,4);
INSERT INTO EMPLOYEE VALUES
	(1,'MILAN',3,1000.00),
    (2,'MANOJ',2,1500.00),
    (3,'MAYANK',1,2000.00),
    (4,'MAYURESH',2,2500.00);

SELECT round(SALARY) FROM EMPLOYEE;
SELECT CEIL(SALARY) FROM EMPLOYEE;
SELECT FLOOR(SALARY) FROM EMPLOYEE;
SELECT SIGN(SALARY) FROM EMPLOYEE;
SELECT mod(SALARY,2) FROM EMPLOYEE;
SELECT SQRT(SALARY) FROM EMPLOYEE;
SELECT POWER(SALARY) FROM EMPLOYEE;
SELECT truncate(SALARY) FROM EMPLOYEE;

-- STRING
SELECT length('Cdac Khargar') AS STR_LENGTH;
SELECT upper('Cdac Khargar') AS STR_LENGTH;
SELECT LOWER('Cdac Khargar') AS STR_LENGTH;

-- DATE AND TIME FUNCTIONS
SELECT current_date() AS DATE;
SELECT date_format(current_date(),'%d-%m-%y') as DATE;
SELECT date_format(current_date(),'%W-%D-%M-%Y') as DATE;
SELECT date_format(current_date(),'%W-%d-%b-%Y') as DATE;