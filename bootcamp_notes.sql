CREATE DATABASE my_company;

USE my_company;

--> table Employees

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 60000.00),
(2, 'Jane', 'Smith', 'Finance', 75000.00),
(3, 'Michael', 'Brown', 'IT', 85000.00),
(4, 'Emily', 'Davis', 'Marketing', 70000.00),
(5, 'William', 'Johnson', 'Sales', 65000.00);

-->table Projects

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12, 2)
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES
(1, 'Project Alpha', '2024-01-15', '2024-06-30', 150000.00),
(2, 'Project Beta', '2024-02-01', '2024-07-15', 120000.00),
(3, 'Project Gamma', '2024-03-10', '2024-08-25', 180000.00),
(4, 'Project Delta', '2024-04-20', '2024-09-30', 200000.00),
(5, 'Project Epsilon', '2024-05-05', '2024-10-15', 170000.00),
(6, 'Project Zeta', '2024-06-01', '2024-11-20', 140000.00);


--> SELECT


select * from Employees; -- * shows all the data, select will choose data

select FirstName, LastName from Employees; --specific columns only retrieved

select Department, concat(FirstName, ' ', LastName ) from Employees; --columns added together

select Department, concat(FirstName, ' ', LastName ) as FullName from Employees; --columns added together with a new title


-->SELECT DISTINCT

SELECT DISTINCT * FROM Employees; --shows all the distinct rows

SELECT DISTINCT Department FROM Employees; --shows distinct rows of  specific columns

-----------------------------------

-->Temporary files

select*into #temp1
from [dbo].[Employees];

select*from #temp1

select*from [dbo].[Employees]

select*into ##temp2
from [dbo].[Employees];

select*from ##temp2

select*from [dbo].[Employees]

------------------------------------

-->WHERE

select*from [dbo].[Employees]

select*from [dbo].[Employees] where Salary=60000;

select Firstname, LastName, Department from [dbo].[Employees] where Salary>60000;

select distinct FirstName from Employees where Department='HR';

select Department from dbo.Employees where FirstName='John' OR LastName='Davis';

------------------------------------------------------------------------------------

-->ORDER BY

select*from employees order by FirstName;  --ascending order by default

select*from Employees order by lastname desc;  --descending order

select*from Employees ORDER BY Salary ASC, LastName DESC; --it will first sort salary by asc, then if there are multiple rows with same salary, then those will be sorted with descending order of the lastname
------------------------------------------------------------------------------------------------
-->AND & OR


select*from [dbo].[Projects]

select*from [dbo].[Projects] where ProjectName='Project Beta' AND Budget=120000;

select*from [dbo].[Projects] where ProjectName='Project Beta' OR Budget=170000;

select*from [dbo].[Projects] where (ProjectName='Project Beta' OR ProjectName='Project Epsilon') AND Budget=170000;

---------------------------------------------------------------------------------------------------

--NOT, BETWEEN, IN

select*from dbo.Employees where NOT Firstname='John';

select*from dbo.Employees where NOT Firstname='John' AND NOT LastName='Smith';

select*from dbo.Employees where NOT Firstname='John' OR NOT LastName='Smith';



select*from dbo.Employees where Salary BETWEEN 50000 AND 70000;

select*from dbo.Employees where Salary NOT BETWEEN 50000 AND 70000;

select*from dbo.Employees where NOT Salary BETWEEN 50000 AND 70000;



select*from dbo.Employees where FirstName='Jane' OR FirstName='William';

select*from dbo.Employees where FirstName IN ('Jane','William');

select*from dbo.Employees where FirstName NOT IN ('Jane','William');
--------------------------------------------------------------------------------------------------------

-->INSERT INTO

select*from [dbo].[Employees] 

insert into [dbo].[Employees] (EmployeeID,FirstName,LastName,Department,Salary) values (6,'Arsha','Joy','IT',60000.00);

insert into dbo.Employees (EmployeeID,LastName,FirstName,Salary,Department) values (7,'Manish','Shradda',70000.00, 'Admin');

insert into Employees values (9,'Anjali','Jayprakash','IT',60000.00);

insert into Employees values (8,'Jackson','','Finance',70000.00);

insert into Employees (EmployeeID,FirstName,LastName,Department) values (11,'Maya','Joy','IT');

insert into Employees (EmployeeID,FirstName,LastName,Department) values (10,'Emily','Joy','Sales');

------------------------------------------------------------------------------------------------------------


select*from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='Employees'; --This will show the ordinal position of column in which order the data will be entered by default if not specified.

--------------------------------------------------------------------------------------------------------------
-->NULL

select*from [dbo].[Employees] where Salary=NULL; --even though this won't give any error, it wont give any result as well.

select*from [dbo].[Employees] where Salary IS NULL;

select*from [dbo].[Employees] where Salary IS NOT NULL;

----------------------------------------------------------------------------------------------------------------

-->UPDATE

select*into #2 from Employees;

select*from #2;

update #2 set Salary=50000.00 where Salary IS NULL;

update #2 set Salary=65000.00, Department='Marketing' where FirstName='Anjali';

select*into #3 from Employees;

select*from #3;

update #3 set Salary=NULL; --When using UPDATE, DELETE, the keyword WHERE should be used or else entire table will get updated

-------------------------------------------------------------------------------------------------------------------------------------

--> DELETE, DROP. TRUNCATE

select*from [dbo].[Employees]

select*into #1 from [dbo].[Employees]

select*from #1

delete from #1 where LastName='' or Department='0';  --where is necessary while using delete


select*into #4 from [dbo].[Employees]  

select*from #4

delete from #4 --If we use delete without where, then the entire data will be deleted, but table structure will be intact

select*from #1

truncate table #1  --truncate deletes all the table data but keeps the table structure

drop table #1  ---drop deletes the table completely


--------------------------------------------------------------------------
--COMMENTS AND TOP N

 --This is a comment   ctrl K ctrl C
/*      */  Multiline comment    ctrl K ctrl U



select*from Employees

select top 5 * from Employees

select top 2 EmployeeID, FirstName from Employees

select top 3 EmployeeID, FirstName from dbo.Employees   --This top n keyword will show the first n records

-----------------------------------------------------------------
-- Creating a table with more columns, including a varchar column
CREATE TABLE dbo.Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)  -- New varchar column for payment method
);

-- Inserting more sample data (10 records), including NULL values
INSERT INTO dbo.Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 2, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-04', 12, 300.00, 106, 3, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 3, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-05', 15, 375.00, 109, 3, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 2, 203, 'Credit Card');



--MAX & Group by

select*from dbo.Sales


select max(totalamount) [Maximum Amount] from dbo.Sales

select max(totalamount) as "Maximum Amount" from dbo.Sales




select max(SaleDate) [Max SaleDate] from dbo.Sales

select max(PaymentMethod) [Maximum paymethod] from dbo.Sales


--Maxiumum quantity sold for each productID
select ProductID, max(Quantity) [Maximum Quantity] from dbo.Sales
group by ProductID

--maximum total amount for disctinct dates in saledate column
select*from dbo.Sales

select SaleDate,max(TotalAmount) [Maximum total Amount] from dbo.Sales 
group by SaleDate


--MAX function can be used on int, date, and char dtypes. for integers, it will show the biggest number, for the date it will show the latest date, for the character it will show the alphabetically sorted result end values.
--Max function will ignore the NULL values.

----------------------------------------------------------------------------------


--MIN & group By

select*from dbo.Sales

select min(Quantity) [Min Quantity] from dbo.Sales

select min(SaleDate) [Min SaleDate] from dbo.Sales

select min(PaymentMethod) [Min Paymethod] from dbo.Sales

select StoreID, min(TotalAmount) [Min TotalAmount] from dbo.Sales
group by StoreID

------------------------------------------------------------------------------

--SUM, Average, Count, Group by

select*from dbo.Sales


select sum(quantity) [Total Quantity] from dbo.Sales

select sum(quantity)[Total Quantity],sum(TotalAmount) [ Sum of Amount] from dbo.Sales

select avg(quantity) [Average quantity] from dbo.Sales

select avg(quantity) [Average quantity], avg(totalamount) [Avg amount] from dbo.Sales


-- sum of quantity, sum of total amount, average of quantity, average of total amount for each distinct product

select*from dbo.Sales

select ProductID, sum(Quantity)[S_quantity], sum(TotalAmount)[s_totalamount], avg(Quantity)[Avg quantity],avg(TotalAmount)[Avg Total amount] from dbo.Sales
group by ProductID

select ProductID, sum(Quantity) as [S_quantity], sum(TotalAmount) as [s_totalamount], avg(Quantity) as [Avg quantity],avg(TotalAmount) as [Avg Total amount] from dbo.Sales
group by ProductID

-- sum of quantity, sum of total amount, average of quantity, average of total amount for each distinct combinations of product and store

select ProductID, StoreID , sum(Quantity) as [S_quantity], sum(TotalAmount) as [s_totalamount], avg(Quantity) as [Avg quantity],avg(TotalAmount) as [Avg Total amount] from dbo.Sales
group by ProductID, StoreID

-- sum of quantity, sum of total amount, average of quantity, average of total amount for each distinct combinations of product and store

select ProductID, StoreID , sum(Quantity) as [S_quantity], sum(TotalAmount) as [s_totalamount], avg(Quantity) as [Avg quantity],avg(TotalAmount) as [Avg Total amount] from dbo.Sales
group by ProductID, StoreID

select count(*) [no of rows] from dbo.sales

select*from dbo.sales
select count(paymentmethod) [no of rows] from dbo.sales

select count(distinct productid) [distinct prods] from dbo.sales

select count(distinct paymentmethod) [distinct mode] from dbo.sales

select paymentmethod , count(distinct paymentmethod) [distinct mode] from dbo.sales
group by paymentmethod

select paymentmethod , count( paymentmethod) [paymode] from dbo.sales
group by paymentmethod


select paymentmethod , count(*) [paymode] from dbo.sales
group by paymentmethod

-------------------------------------------------------------------------------
--group by 

select*from dbo.Sales

select PaymentMethod, sum(TotalAmount) as[Sum of Sales] from dbo.Sales
group by PaymentMethod;

select ProductID, PaymentMethod, sum(TotalAmount) as[Sum of Sales] from dbo.Sales
group by ProductID, PaymentMethod 
order by ProductID;

-------------------------------------------
--Having

select*from dbo.Sales

--total sales, avg sales, total qty, avg qty for each distinct product

select 
ProductID,
sum(TotalAmount)[Sum of sales],
sum(Quantity)[Total QTY],
avg(TotalAmount)[ AVG amount],
avg(Quantity)[AVG QTY]
from dbo.Sales
group by
ProductID;

select 
ProductID,
sum(TotalAmount)[Sum of sales],
sum(Quantity)[Total QTY],
avg(TotalAmount)[ AVG amount],
avg(Quantity)[AVG QTY]
from dbo.Sales
group by
ProductID
having sum(TotalAmount)<700 AND sum(Quantity)=21;