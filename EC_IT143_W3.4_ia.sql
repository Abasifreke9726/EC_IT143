USE AdventureWorks2022;
GO

/*
Name: Abasifreke Idio
Course: IT143
Assignment: W3.4 Adventure Works - Create Answers

Description:
AdventureWorks questions and answers using SQL.

Original Question Author:
Domonic Dunaway
*/

/*
Question 1
Author: Domonic Dunaway

What are the top 50 product purchases?
*/

SELECT TOP 50
       ProductID,
       SUM(OrderQty) AS TotalPurchased
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalPurchased DESC;

/*
Question 2
Author: Domonic Dunaway

How many bikes that were sold were blue?
*/

SELECT
    COUNT(*) AS BlueBikeSales
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
WHERE p.Color = 'Blue';

/*
Question 3
Author: Domonic Dunaway

What product is in location ID 50 and how many are in stock?
*/

SELECT
      p.Name,
      pi.Quantity
FROM Production.ProductInventory pi
JOIN Production.Product p
      ON pi.ProductID = p.ProductID
WHERE pi.LocationID = 50;

/*
Question 4
Author: Domonic Dunaway

Without using the comments section, what product did John Smith review and what rating did he give?
*/

SELECT
    ReviewerName,
    ProductID,
    Rating
FROM Production.ProductReview
WHERE ReviewerName = 'John Smith';

/*
Question 5
Author: Domonic Dunaway

Customer called about order 41592.
Who is the customer, what transaction type was used,
and what product is the customer asking about?
*/

SELECT
    soh.SalesOrderID,
    p.FirstName,
    p.LastName,
    pr.Name AS ProductName
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c
    ON soh.CustomerID = c.CustomerID
JOIN Person.Person p
    ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
JOIN Production.Product pr
    ON sod.ProductID = pr.ProductID
WHERE soh.SalesOrderID = 41592;

/*
Question 6
Author: Domonic Dunaway

Our policy states that if a revision number is about 7,
we need additional review. Which orders have
revision number 7?
*/

SELECT
    SalesOrderID,
    RevisionNumber,
    OrderDate
FROM Sales.SalesOrderHeader
WHERE RevisionNumber = 7;

/*
Question 7
Author: Domonic Dunaway

What tables would be best used to find
StoreID, VendorID, and EmployeeID?
*/

SELECT
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN
(
    'StoreID',
    'VendorID',
    'EmployeeID'
)
ORDER BY TABLE_NAME;

/*
Question 8
Author: Domonic Dunaway

Can you create a view that would show me
the names of all the employees?
*/

SELECT
    p.FirstName,
    p.LastName
FROM HumanResources.Employee e
JOIN Person.Person p
    ON e.BusinessEntityID = p.BusinessEntityID;