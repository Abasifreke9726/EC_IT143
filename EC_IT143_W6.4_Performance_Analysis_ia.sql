-- EC_IT143 W6.4 Performance Analysis
-- Student: Idio Abasifreke
-- Database: AdventureWorks2022

USE AdventureWorks2022;
GO

-- =====================================================
-- QUERY 1: Person.Address - City
-- =====================================================

-- Original performance analysis query
SELECT *
FROM Person.Address
WHERE City = 'Bothell';
GO

-- Recommended missing index
CREATE NONCLUSTERED INDEX IX_Address_City
ON Person.Address (City);
GO

-- Rerun query after creating the index
SELECT *
FROM Person.Address
WHERE City = 'Bothell';
GO


-- =====================================================
-- QUERY 2: Sales.SalesOrderDetail - CarrierTrackingNumber
-- =====================================================

-- Original performance analysis query
SELECT *
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98';
GO

-- Recommended missing index
CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_CarrierTrackingNumber
ON Sales.SalesOrderDetail (CarrierTrackingNumber);
GO

-- Rerun query after creating the index
SELECT *
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '4911-403C-98';
GO