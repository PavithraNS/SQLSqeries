--------------UC1 create databese--------------
create database PayRollServiceDB281Batch
use PayRollServiceDB281Batch
----------------UC2 create table ---------------
create table EmployeePayRoll
(
EmployeeId int identity(1,1) primary key,
Name varchar(255),
Salary float,
StartDate date
)
-------------------UC3 insert query------------
insert into EmployeePayRoll values('UV',87000,getdate())
insert into EmployeePayRoll (Name,StartDate) values('Dhoni',getdate())
----------------UC4 fetch data from table-----------
select * from EmployeePayRoll
----------update query----------
update EmployeePayRoll set StartDate='03-05-2019',Salary=93456 where Name='Dhoni'
insert into EmployeePayRoll values('Ashwin',77000,'09-20-1991')
----------------UC5 fetch specify employee data and fetch all employee based date range------------
select * from EmployeePayRoll where Name='UV'
select * from EmployeePayRoll where StartDate between cast('2000-01-01' as date) and getDate()
----------------UC6 add gender column and update gender column based on employee's data----------
alter table EmployeePayRoll add Gender char(1)
update EmployeePayRoll set Gender='M'
insert into EmployeePayRoll values('Usha',34000,'01-10-1997','F'),('Sandhya',78000,'09-10-2000','F'),('Kalpana',94000,'01-20-1987','F')
----------------------UC7 aggregate functions-----

Select Sum(Salary) as TotalSalary,Gender from EmployeePayRoll group by Gender
Select Avg(Salary) as AverageSalary,Gender from EmployeePayRoll group by Gender
select * from EmployeePayRoll
select * from EmployeePayRoll where Salary in(Select Max(Salary) as TotalSalary from EmployeePayRoll group by Gender);
select * from EmployeePayRoll
select * from EmployeePayRoll where Salary in(Select Min(Salary) as TotalSalary from EmployeePayRoll group by Gender);
Select Count(Salary) as NumberOfEmployees,Gender from EmployeePayRoll group by Gender
----------------------------UC8 add new coulmns---------------
alter table EmployeePayRoll add Phone bigint
alter table EmployeePayRoll add Address varchar(255) default 'bnglr'
alter table EmployeePayRoll add Department1 varchar(255) not null default 'NULL'
--------------------------remove constraint first then only u vcan column from table-----
ALTER TABLE EmployeePayRoll DROP CONSTRAINT DF__EmployeeP__Depar__36B12243;
ALTER TABLE EmployeePayRoll DROP COLUMN Department1;
--------------------------UC9 introduce new columns----------
alter table EmployeePayRoll add TaxablePay float,NetPay float,Deductions float,IncomeTax float 
------------------------renaming existing column----------------------
exec sp_rename 'EmployeePayRoll.Salary','BasicPay'