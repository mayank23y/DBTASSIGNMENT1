create database assignment7;
use assignment7;
create table Ord_master( Ord_no int, Cust_cd char(5),Status char(5));
insert into Ord_master values(1	,'C1','P');
create table  Ord_dtl( Ord_no int,Prod_cd char(5), Qty int);
insert into Ord_dtl values( 1,'P1',100);
insert into  Ord_dtl values( 1,'P2',200);
create table  Prod_master(Prod_cd char(5),Prod_name varchar(25),Qty_in_stock int,Booked_qty int);
insert into Prod_master values('P1',"Floppies", 10000,1000);
insert into Prod_master values('P2' ,"Printers" ,5000 ,600);
insert into Prod_master values( 'P3',"Modems",3000,200);
select * from Ord_master;
select * from Ord_dtl;
select * from Prod_master;

-- 1

-- Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the
-- Booked_qty in Prod_master should be increased accordingly.

delimiter $$
create trigger que1  before insert  
on Ord_dtl
for each row
begin 
SET SQL_SAFE_UPDATES = 0;
update Prod_master set Booked_qty=Booked_qty+new.qty where Prod_cd=new.Prod_cd;-- same value in both tables.
end $$
insert into Ord_dtl values(1,'p3',100);
insert into Ord_dtl values(2,'p1',200);
insert into Ord_dtl values(1,'p3',100);
insert into Ord_dtl values(1,'p1',180);


--2

Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
Booked_qty in Prod_mastershould be decreased accordingly.

delimiter $$
create trigger que2 before delete
on Ord_dtl
for each row
begin
SET SQL_SAFE_UPDATES = 0;
update Prod_master set Booked_qty=Booked_qty-old.qty where Prod_cd=old.Prod_cd;
end $$
drop trigger que2 ;
SET SQL_SAFE_UPDATES = 0;
delete from Ord_dtl where Prod_cd='p3'
delete from Ord_dtl where Prod_cd='p4'

-- 3
-- department write A trigger to update the total salary of a department in dept_sal 
--  table  when an employee is added or removed from  emp table .

Create table dept_sal (dept_no int primary key, tota_salary int)
insert into dept_sal  values(10,10000);
insert into dept_sal  values(20,20000);
insert into dept_sal  values(30,30000);
create table employees (emp_id int,
emp_name varchar(20),
dept_no int,
salary float,	 
    manager char(30),
    constraint dept_no_fk foreign key(dept_no) references dept_sal(dept_no));
    insert into  employees values(1001,'Mayuri',10,3000,'s1');
    insert into  employees values(1002,'Meghana',20,2000,'s2');
    insert into  employees values(1003,'Mrunali',30,1000,'s3');
    select * from dept_sal;
    select * from employees; 
    delimiter $$
    create trigger que3 after  insert 
    on employees 
    for each row
    begin 
    SET SQL_SAFE_UPDATES = 0;
    update dept_sal set tota_salary = tota_salary + new.salary where dept_no=new.dept_no;
    end $$
    insert into employees values(1001,'Mayuri',10,1500,'s1')
   
    -- 4
    delimiter $$
    create trigger que4  after delete
    on employees 
    for each row
    begin
    SET SQL_SAFE_UPDATES = 0;
    update dept_sal set tota_salary = tota_salary - old.salary where dept_no=old.dept_no;
    end $$
    SET SQL_SAFE_UPDATES = 0;
    delete from employees where emp_id=1003;

