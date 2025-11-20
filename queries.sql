-- TechMart E-commerce Database

USE TechMart;
GO

-- Basic Queries
-- 1. View all products

SELECT * FROM Products;
GO
    
-- 2. Find products under £100

SELECT ProductName, Price, Brand 
FROM Products 
WHERE Price < 100;
GO
    
-- 3. Count products by category

SELECT c.CategoryName, COUNT(p.ProductID) as ProductCount
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;
GO
    
-- Join Queries
-- 1. Customer orders with details

SELECT 
    c.FirstName + ' ' + c.LastName as CustomerName,
    o.OrderDate,
    o.TotalAmount,
    o.OrderStatus
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC;
GO
    
-- 2. Top-selling products

SELECT 
    p.ProductName,
    p.Brand,
    SUM(oi.Quantity) as TotalSold,
    SUM(oi.Quantity * oi.UnitPrice) as Revenue
FROM Products p
JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductName, p.Brand
ORDER BY TotalSold DESC;
GO
    
-- 3. Customer purchase summary

SELECT 
    c.FirstName + ' ' + c.LastName as CustomerName,
    c.City,
    COUNT(o.OrderID) as OrderCount,
    SUM(o.TotalAmount) as TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City
ORDER BY TotalSpent DESC;
GO
    
-- 4. Orders with product details (complex join)

SELECT 
    c.FirstName + ' ' + c.LastName as Customer,
    o.OrderDate,
    p.ProductName,
    cat.CategoryName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) as LineTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
ORDER BY o.OrderDate DESC, o.OrderID;
GO
