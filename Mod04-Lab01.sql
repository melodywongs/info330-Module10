--*************************************************************************--
-- Title: Module03-Lab01
-- Author: YourNameHere
-- Desc: This file demonstrates how to select data from a database
-- Change Log: When,Who,What
-- 2017-01-01,YourNameHere,Created File
--**************************************************************************--
/*
Lab 1: Using Joins and Unions - 30

In this lab, you create some advanced select statements using Northwind database. 
You will work on your own for the first 20 minutes, then we will review the answers together in the last 10 minutes. 

Note: This lab should be done individually. 
*/

Use Northwind;
go
--Step 1: Review Database Tables
--Run the following code in a SQL query editor and review the names of the tables you have to work with.

Select * From Northwind.Sys.Tables Where type = 'u' Order By Name;

-- Step 2: Create Queries
-- Answer the following questions by writing and executing SQL code.

-- Question 1: How can you show a list of category names? Order the result by the category!
Select * From Categories;
go

Select CategoryName
From Categories
Order By CategoryName;
go



-- Question 2: How can you show a list of product names and the price of each product? Order the result by the product!
Select * From Products;
go

Select ProductName, UnitPrice
From Products
Order By ProductName;
go



-- Question 3: How can you show a list of category and product names, and the price of each product? Order the result by the category and product!
Select CategoryName, ProductName, UnitPrice
From Categories as c 
Join Products as p
On c.CategoryID=p.CategoryID
Order By CategoryName, ProductName;
go



-- Question 4: How can you show a list of order Ids, category names, product names, and order quantities the results by the Order Ids, category, product, and quantity!

Select * From [Order Details];
go

Select o.OrderID, CategoryName, ProductName, Quantity
From  Categories as c 
Join Products as p
On p.CategoryID=c.CategoryID
Join [Order Details] as od
On p.ProductID=od.ProductID
Join Orders as o 
On od.OrderID = o.OrderID
Order By o.OrderID, CategoryName, ProductName, Quantity;
go


-- Question 5: How can you show a list of order ids, order date, category names, product names, and order quantities 
-- the results by the order id, order date, category, product, and quantity!

Select * From Orders;
go

Select OrderID, OrderDate, CategoryName, ProductName, Quantity
From [Order Details] as od 
Join Orders as o
On od.OrderID = o.OrderID
Join Products as p
On od.ProductID=p.ProductID
Join Categories as c 
On p.CategoryID=c.CategoryID
Order By OrderID, OrderDate, CategoryName, ProductName, Quantity;
go


-- Step 3: Review Your Work
-- Now, you will review your work with your instructor.
-- NOTE: Unlike assignments, labs do not need to be turned in to Canvas!

