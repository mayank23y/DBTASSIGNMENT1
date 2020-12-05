create database DBT_assignment;
use DBT_assignment;
create table Member(Member_id numeric(5) unique,
Member_name varchar(30),
Member_address varchar(50),
acc_opening_Date date,
Membership_type varchar(20),
Penalty_Amount numeric(7));
alter table Member add column Membership_type1 varchar(20);
show tables;
create table Books(Book_no numeric(6),
Book_name varchar(30),
Author_name varchar(30),
Cost numeric(7),
Category char(10));
show tables;
create table Issue(Lib_Issue_Id numeric(10),
Book_No numeric(6),
Member_id numeric(5),
Issue_Date date,
Return_date date);
show tables;

select * from Member;
select * from Books;
select * from Issue;

alter table Member drop Penalty_Amount;
select * from Member;
alter table Member drop Membership_type1;
 
insert into Member values(1,"Richa Sharma","Pune",'2005-12-10',"Lifetime"),
(2,"Garima Sen","Pune", current_date(),"Annual");
select * from Member;
insert into Member values(3,"Manoj Bhoye","Nashik",'2016-02-19',"Lifetime"),
(4,"Milan MOmale","Nagar", '2018-04-14',"Annual"),
(5,"Mayank Dwevedi","Shahdol", '2014-06-01',"LifeTime");
select * from Member;
insert into Books values(101,'Let us C','Dennis Ritchie',450,'System'),
(102,'Oracle-Complete Ref','Loni',550,'Database'),
(103,'Mastering SQL','Loni',250,'Database'),
(104,'PL SQL-Ref','ScottUrman',750,'Database');
select * from Member;
select * from Books;
select * from Issue;
update books set Cost=300,Category='RDBMS' where Book_no=103;

select * from Books;
drop table Issue;
show tables;
create table Issue(Lib_Issue_Id numeric(10),
Book_No numeric(6),
Member_id numeric(5),
Issue_Date date,
Return_date date);
insert into issue (Lib_Issue_Id,Book_No,Member_id,Issue_Date)values
(7001,101,1,'2006-12-10'),
(7002,102,2,'2006-12-25'),
(7003,104,1,'2006-01-15'),
(7004,101,1,'2006-07-04'),
(7005,104,2,'2006-11-1'),
(7006,101,3,'2006-02-18');
select * from issue;