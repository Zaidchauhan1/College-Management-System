--SQL__It stand for STRUCTURED QUERY LANGUAGE.
--SQL Server/Databse__ It is a RDBMS developed by MICROSOFT.It is used to retrieve and manage the data
                       --stored in DATABASE in a tabular format(coln,row)

---------------How to create a Database in SQL Server.
create database SQL_DB

---------------How we use the SQL Database.
use SQL_DB

---------------How to create table in SQL.                      DDL(create, alter, drop, truncate)


create table Student_Details
(
S_ID int primary key ,
S_Name char(20),
S_Program char(20),
S_Enroll varchar(20)
)

create table Teacher_Detail
(
T_ID int primary key identity(1,1),
T_Name char (20),
T_Subject char (20),
Joining_Date date not null,
T_Salary money not null
)

create table College_Staff_Data
(
St_ID int primary key,
St_Name char(20),
St_Email varchar(25),
St_Salary money not null,
St_Age int check(St_age>18),
Joining_Date date not null,
Time_in time not null,
Time_out time not null
)

create table Hostel_Detail
(
S_ID int primary key ,
Room_no int,
Admission_date date not null ,
S_Email varchar(25),
Fee money not null
)

create table Transport_Detail
(
Driver_ID int primary key,
Driver_Name char(24),
Driver_Salary money not null
)


---------------------------------------------we can add and delete the column by the ALTER and DROP command
alter table Student_Details
add S_Phone int ,S_Class varchar (20)

alter table Student_Details
drop column S_Class
---------------------------------------------Difference between Delete, Drop, and Truncate.
--Delete: - Delete command is used to delete a specific row from a table by using where clause.
--Truncate: -Truncate command is used to delete all rows from a table. It is faster than delete. It does not use where clause.
--Drop: -- Drop command is used to delete the entire table structure from a database

truncate table Transport_Detail

Drop Transport_Detail



----------------------------------------------------DML (select, insert , update, delete)

select*from Student_Details
select*from Teacher_Detail
select*from College_Staff_Data
select*from Hostel_Detail
select*from Transport_Detail

---------------------------------------------------3 type of insert method.

insert into Student_Details values (1,'Atif','BCA','ITM2241546',012-2344)
insert into Student_Details values (2,'Anshul','BBA','ITM2241547',012-2345)
insert into Student_Details values (3,'Bobby','BA','ITM2241548',012-2346)

insert into Student_Details values (4,'Arya','B.com','ITM2241549',012-2347),
(5,'Bran','BCA','ITM2241550',012-2348)

insert into Student_Details(S_ID,S_Name,S_Program)
values(6,'Aish','Btech')


insert into Hostel_Detail values (1,101,'14-September-2025','atif@gmail.com',80000),
(2,102,'17-September-2025','anshul@gmail.com',82000),
(3,103,'19-September-2025','bobby@gmail.com',79000),
(4,104,'21-September-2025','arya@gmail.com',81000),
(5,105,'23-September-2025','bran@gmail.com',85000)



insert into College_Staff_Data values(1,'Anand','anand@gmail.com',25000,34,'11-March-2025','8:00am','6:00pm'),
(2,'Amit','amit@gmail.com',29000,32,'12-April-2025','8:00am','4:00pm'),
(3,'Asif','asif@gmail.com',25000,33,'13-May-2025','10:00am','8:00pm'),
(4,'Sumit','sumit@gmail.com',30000,35,'14-June-2025','7:00am','5:00pm')

insert into College_Staff_Data(St_ID,St_Name,St_Email,St_Salary,St_Age,Joining_Date,Time_in,Time_out)
values (5,'Prakash','prakash@gmail.com',25000,40,'15-July-2025','6:00am','4:00pm'),
(6,'Shyam','shyam@gmail.com',29000,33,'16-july-2025','03:00am','5:00pm'),
(7,'Sergio','sergio@gmail.com',30000,34,'17-august-2025','9:00am','6:00pm')


-----------------------------------------------------update-> we can update single or multiple value.

update Student_Details set S_Enroll='ITM2241551',S_Phone=012-2349
where S_ID=6

select*from Student_Details
----------------------------------------------------delete-> User can delete whole table in once or delete the data column-wise.
delete Student_Details
where S_ID=6

delete Transport_Detail


---------------------------------------------------Generated Auto ID  (on / off)

select*from Teacher_Detail

insert into Teacher_Detail values('Ashima','Python','11-April-2025',50000),
('Khushi','SQL','23-May-2025',45000)

set identity_insert Teacher_Detail on
insert into Teacher_Detail(T_ID,T_Name,T_Subject,Joining_Date,T_Salary)
values(3,'Diwakar','ML','19-June-2025',67000)

set identity_insert Teacher_Detail off
insert into Teacher_Detail (T_Name,T_Subject,Joining_Date,T_Salary)
values('Avinash','AI','19-July-2025',56000 )



--------------------------------------Aggregate Function with check constraints and time ,date Data type
--------------Aggregate function always summrize the values column wise.
--------------There are five types if aggregate function.
--------------1-Max() 2-Min() 3-Sum() 4-Avg() 5-Count()

--How to create check constraints
--Check constraints always use for condition as we mention below.
--Constraints define set of rules on the table.
--BELOW THE TABLE WE GAVE THE CONDITION that is  (age>=18) 

select*from College_Staff_Data


select max(St_Salary) as 'Highest Salary'
from College_Staff_Data

select min(St_Salary) as 'Minimum Salary'
from College_Staff_Data

select sum(St_Salary) as 'Total Salary'
from College_Staff_Data

select avg(St_Salary) as 'Average Salary'
from College_Staff_Data

select count(St_Salary) as 'no of Salary'
from College_Staff_Data

------all operator in one-line.(For Horizontal Presentation)

select max(St_Salary) as 'Highest Salary',min(St_Salary) as 'Minimum Salary',sum(St_Salary) as 'Total Salary',
avg(St_Salary) as 'Average Salary',count(St_Salary) as 'no of Salary'
from College_Staff_Data



----------------------------------------------------------------clause
-------------------------------where clause
select *from College_Staff_Data
where St_ID=6

/*-----------------------------order by clause
there are two types of order by clause
1. Ascending Order  2. Descending Order
*/
select*from College_Staff_Data
order by St_Salary asc

select*from College_Staff_Data
order by St_Salary desc

/*----------------------------range Operator 
--define & work on numbers)
--There are two types of Range Operator
--1_Between & 2_Not Between
*/
select*from College_Staff_Data
where St_Salary between 20000 and 25000

select*from College_Staff_Data
where St_Salary not between 20000 and 25000

-----------------------------Relational Operator (==,<,>,<=,>=)
select*from College_Staff_Data
where St_Salary >= 25000 
order by St_Salary asc

select*from College_Staff_Data
where St_Salary <30000 

----------------------------IN  or NOT IN
----------------------------IN keyword always return the list of values
select*from College_Staff_Data
where St_Name  in ('Asif','Amit','Sergio')

select*from College_Staff_Data
where St_Name not in ('Asif','Amit','Sergio')



-------------------------------                    How to use group by clause and having clause. 

--Group by clause always work with aggregate function.
--Having clause always work with Group by clause.
--We can't use where clause with group by clause.
--Having clause filter the Group of records.
--Where as where clause always filter single recorded from table.

select max (St_Name) as 'Name', St_Salary
from College_Staff_Data
group by St_Salary

select max (St_Name) as 'Name', St_Salary
from College_Staff_Data
group by St_Salary
order by St_Salary desc

select count(St_ID) as 'NO.',St_Salary
from College_Staff_Data
group by St_Salary
having count(St_Salary)>2

select count(St_ID) as 'NO.',St_Salary
from College_Staff_Data
group by St_Salary
having count(St_Salary)<=2

-----------------------------------------------string concatenate.
select 'Data'+' '+'Analytics' as 'Classes'

select	     'SQL'            as 'Classes'

select 'Python'+'  '+'Tabluea'+'  '+'SQl'+'  '+'Power BI'+'  '+'Excel' as 'Data analytics'



----------------------------What is like keyword why we use it.
--Like keyword use for search the any name in alphabat order like(a-z).

--If you want to check the who name start with a alphabat
--so we have to use module % sign before the alphabat.

select *from College_Staff_Data
where St_Name like 'a%'

--If you want to check the who name end with a alphabat
--so we have to use module % sign after the alphabat.

select *from College_Staff_Data
where St_Name like '%t'

--If you want to check from middle so you to give the space and then second word.
--we can check by giving the second or any alphabat of name.

select *from College_Staff_Data
where St_Name like '_er%'


--If you want to check all the name [A-Z]

select*from College_Staff_Data
where St_Name like '[a-z]%'

--How to check who name start with 's' and end with 'r'.

select *from College_Staff_Data
where St_Name like 's%o'

--Write the query in SQL who E_name start with vovel and end with vovel
select *from  College_Staff_Data
where St_Name like '[a,e,i,o,u]%[a,e,i,o,u]'



---------------------------------------------What is schema in SQL Server.
--Schema is a collection of SQL objects.
--By default schema name in sql(DBO).
--DBO-stand for DATABASE OBJECT
--we can create our own schema in sql.

create schema College

create table College.Student
(
S_ID int primary key,
S_name char (20),
S_Program varchar(20)
)

insert into College.Student values (1,'Ned','BCA'),
(2,'Robb','BBA'),
(3,'Sansa','BA')

select*from College.Student


-----------------------------------------------How to create inner join
--We have to compare the values from multiple table based on the common column.

select*from Student_Details
select*from Hostel_Detail


select S_name,S_Program,Fee
from Student_Details
inner join Hostel_Detail on Student_Details.S_ID=Hostel_Detail.S_ID

select S_name,Room_no,S_Enroll 
from Hostel_Detail
inner join Student_Details on Hostel_Detail.S_ID=Student_Details.S_ID



-------------------------------------------INDEX IN SQL->
-- How to disable the index
--First you have to right click on the index and select the disable option
--click on the table info and click on ok button

--How to enable the index
--double click on index pk 
--rebuild the table 

/* There are two type of Index-->
   1> Clustered Index
   2> Non-Clustered Index

   clustered used for arrange the data in a sequence
   where non-clustered mess the data ,unorganized the whole table data
*/

select*from Transport_Detail

INSERT INTO Transport_Detail values(1,'Sam',20000),
(2,'Billy',30000)


create clustered index index_1
on  Transport_Detail (Driver_ID)

create nonclustered index index_2
on Transport_Detail (Driver_ID)

create nonclustered index index_3
on Transport_Detail (Driver_ID,Driver_Name)
---------------------------------------------How to drop A Index in SQL.
drop nonclustered index index_2
on Transport_Detail

---------------------------------------------How to create Filter Index.(add single value in index)
create nonclustered index filter_index
on Transport_Detail (Driver_ID)
where (Driver_ID)<1



---------------------------------------------How to create currency format?
-------------------------------------------------- C define by default the number of decimal values.
-------------------------------------------------- C0 define a single decimal value. C2 define two decimal value after the original value.
--Currency format with decimal values
select FORMAT(12454,'C') Result

--Currency format without decimal values
select FORMAT (12454,'C0') Result

select FORMAT (12454,'C2') Result


--How to format different country currency.
select
FORMAT (4578,'C','INR-in') 'India',
FORMAT(2345,'C','fr-FR') 'France',
FORMAT(2314,'C','zh-cn') 'China',
FORMAT(6789,'C','Th-TH') 'Thailand',
FORMAT(4567,'C','de-DE') 'Germany'


---------------------------------------------------View and Schemabinding.
---------------------------------------------------it is a virtual based table.it doesn't affect the original table.
create view Staff_view123
as 
select St_Name,St_Age,St_Email
from College_Staff_Data

select*from Staff_view123
-- --------------------------Alter the View.  If we want add more column so we direct add in alter with same name of table 
--                                            but in create view we have chng everytime the name of view. 
alter view Staff_view
as
select St_ID,St_Salary
from College_Staff_Data

select*from Staff_view
-----------------------------drop the view
drop view Staff_view

--------------------------------------------Schema-binding.
--------------------------------------------it binds the view's schema to the table.
create view Staff_view12
with schemabinding
as
select St_Name,St_Salary
from dbo.College_Staff_Data

select*from Staff_view12

---------------------------------------------How to create view catalog

select*from sys.views

select*from sys.all_objects

--we can see specific view details by copy any specific address of column.

select*from sys.views
where create_date='2025-09-27 21:53:23.453'



---------------------------------------------Transfer the data
select*from College_Staff_Data

select St_Name,St_Age,St_Salary
into Staff_Data
from College_Staff_Data

select*from Staff_Data





/*-----------------------------------------------                   Batch in SQL.
There are two types of Batches in SQL.

Anonyms Batch----is a collection of SQL statements without any name is called anonyms batch.

Named Batch  ----  1-Stored Procedures(SP)
                   2-User define function(UDF)
                   3-Triggers
*/
--                                        Batches execute whole program.
create database batch0
go
use batch0

create table batch1
(
b_name char (20),
b_program varchar(22)
)

insert into batch1 values ('zaid','bca'),
('anas','bba')

select*from batch1


--                                                Anonyms Batch-> execute once whole program.
declare @E_name char(10)
declare @E_Salary money

set @E_name='Zaid'
set @E_Salary=10000

print @E_name
print @E_Salary
---------              we can use select in place of set so we have to write code in a singe line 
--Example 2
declare @S_name char(10)
declare @S_Fee money

select @S_name='Zaid' ,@S_Fee=40000

print @S_name
print @S_Fee

--                                               Stored procedures(execute whole program at once).
-----                      parameter less

create procedure Staff_sp
as
select*from College_Staff_Data
go

exec Staff_sp

--                         single parameter
create procedure Staff_sp1
@St_Name char(22)
as
select *from College_Staff_Data
where St_name='Asif'
go
exec Staff_sp1 @St_Name='Asif'

--                          Multiple parameter(in where we can both or single name value like St_name=@St_name).
create procedure Staff_sp00
@St_Name char(20),@St_Salary money 
as
select*from College_Staff_Data
where St_Name='Sergio' and St_Salary=30000
go
exec Staff_sp00 @St_Name='Sergio',@St_Salary=30000

--Another method.

create procedure Staff_sp31
@St_Name char(22),@St_Salary money
as
select*from College_Staff_Data
where St_Name=@St_Name and St_Salary=@St_Salary
go
exec Staff_sp31 @St_Name='Anand',@St_Salary=25000

--                         drop method

drop procedure Staff_sp3

--                                                               TRIGGERS in SQL.
--It is a special type of Stored Procedure that automatically executes.
--it is automatically fired when an event occurs on a table.

----Trigger is a set of T-SQL statements activated in response to certain actions such as insert, delete.
----used to ensure data integrity(correct, clean)
----trigger word derieved from GUN.
----work on DDL & DML (create, alter, truncate, drop), (insert, update, select, delete)


--                                                     How to create trigger in SQl.
select*from Student_Details
--                        insert method.
create trigger insert_trigger22
on Student_Details
for insert
as   
    print('Print the value')

	insert into Student_Details
	values(7,'Ankit','MCA','ITM2241552',012-2564)
	insert into Student_Details
	values(8,'Sundar','MBA','ITM2241553',012-2574)
   


--                         update method.
create trigger update_trigger
on Student_Details
for update
as
      print('Print the value')
	  update Student_Details set S_Name='Shami'
	  where S_ID=7

select*from Student_Details

--                               delete method.

create trigger delete_trigger
on Student_Details
for delete
as
    print('delete the value')
	delete from Student_Details
	where S_ID=7

select*from Student_Details

--                               Drop method.

create trigger drop_trigger
on Student_Details
for drop
as
    print('drop the table')
	drop Student_Details

select*from Student_Details



--                                                               FOREIGN KEY in SQL.


create table HOD_Info
(
HOD_ID int primary key,
HOD_Name char(20),
HOD_Address varchar(20),
T_ID int foreign key references Teacher_Detail(T_ID)
)

insert into HOD_Info values (111,'Ruchi','Delhi',1),
(222,'Gaurav','Noida',2),
(333,'Asad','Jaipur',3),
(444,'Anas','Kolkata',4)

select*from HOD_Info
select*from Teacher_Detail



--How to check second highest salary.

select max(St_Salary) as 'secondary salary'
from College_Staff_Data

where St_Salary<(
                 select max(St_Salary) from College_Staff_Data
				 )


--How to check top salary.

select distinct top 3 St_Salary
from College_Staff_Data

order by St_Salary desc

