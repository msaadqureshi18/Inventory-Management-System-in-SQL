/* 
Inventory Management 

Skills used: Basic CRUD, Joins, CTEs, Temp Tables, Windows Functions, Aggregate Functions, Converting Data Types

*/

-- Switching to new database
USE ProductInventoryDB

-- Inserting a new product into the database
Insert Into Products (Name, Description, Price, Quantity, CategoryID, SupplierID)
Values ('Flip phone', 'Foldable smart phone', 699.99, 10, 1, 1);



-- Updating quantity of a product
Update Products 
Set Quantity = 200 
Where ProductID = 3;



-- Deleting Power Drill (Product ID = 25) from products table
Delete From Products
Where ProductID = 25;



-- Listing all products and their quantities in stock
Select P.ProductID, P.Name AS ProductName, C.Name AS ProductCategoryName, P.Quantity, S.Name AS SupplierName
From Products P
Join Categories C ON C.CategoryID = P.CategoryID
Join Suppliers S ON S.SupplierID = P.SupplierID;



-- Summarizing Sales by Product
Select P.ProductID, P.Name AS ProductName, SUM(T.Quantity) AS Totalsold, SUM(T.Quantity * P.Price) AS Totalrevenue
From Products P
Left Join Transactions T ON P.ProductID = T.ProductID
Where T.TransactionType = 'OUT'
Group by P.ProductID, P.Name;



-- Summarizing Sales by Date, including the Total Quantity Sold and Total Revenue generated on each date
Select TransactionDate, SUM(T.Quantity) AS TotalQuantity, SUM(T.Quantity * P.Price) AS TotalPrice
From Transactions T
Left Join Products P ON P.ProductID = T.ProductID
Where TransactionType = 'Out'
Group by TransactionDate
Order by TransactionDate;



--Summarizing Sales by Category, including total quantity sold and total revenue generated for each category
Select C.CategoryID, sum(T.Quantity) AS TotalQuantity, sum(T.Quantity*P.Price) AS TotalRevenue
From Categories C
Left Join Products P ON C.CategoryID = P.CategoryID 
Left Join Transactions T ON P.ProductID = T.ProductID 
Where TransactionType = 'OUT'
Group by C.CategoryID
Order by CategoryID;



-- Querying to retrieve a list of products that have a quantity below a specified threshold (less than 10 in this case). This can help identify products that need restocking.
Select ProductID, Name AS ProductName, Quantity
From Products
Where Quantity < 10;



-- Querying to find the top 3 suppliers with the highest total revenue generated from their products. This can help identify the most valuable suppliers.
Select TOP 3 s.SupplierID, s.Name AS SupplierName, sum(T.Quantity) AS TotalQuantity, sum(T.Quantity*P.Price) AS TotalRevenue
From Products P
Join Suppliers S ON P.SupplierID = S.SupplierID
Join Transactions T ON T.ProductID = P.ProductID
Where TransactionType = 'Out'
Group by S.SupplierID, S.Name
Order by TotalRevenue DESC;



-- Monthly total revenue for the past year displayed in a table
Select MONTH(TRANSACTIONDATE) AS TransactionMonth, YEAR(TRANSACTIONDATE) AS TransactionYear, sum(P.Price * T.Quantity) AS TotalRevenue
From Transactions T 
Join Products P ON P.ProductID = T.ProductID
Where TransactionType = 'Out' AND TransactionDate >= DATEADD(MONTH, -12, GETDATE())
Group by MONTH(TRANSACTIONDATE), YEAR(TRANSACTIONDATE)
Order by MONTH(TRANSACTIONDATE), YEAR(TRANSACTIONDATE);



--Retrieving monthly sales data of products, filtered for 'Out' transactions, and displaying product names, IDs, transaction months, and quantities, ordered by product and month
With Sales as (
	Select ProductID, MONTH(TransactionDate) AS TransactionMonth, Quantity
	From Transactions
	Where TransactionType = 'Out'
	)

Select Sales.ProductID, Name AS ProductName, TransactionMonth, Sales.Quantity
From Products P
Join Sales ON P.ProductID = Sales.ProductID
Order by ProductID, TransactionMonth;



-- Creating Temporary table for reorder information
--Drop Table #ReorderInfo;
Create Table #ReorderInfo (
	ProductName NVARCHAR(255),
	AverageMonthlySales DECIMAL(10, 2),
	SuggestedReorderQuantity INT
)


-- Calculating Average Monthly Sales for the past year
Insert Into #ReorderInfo (ProductName, AverageMonthlySales)
Select P.Name AS ProductName, AVG(CAST(T.Quantity AS DECIMAL(10,2))) AS AverageMonthlySales
From Products P
Join Transactions T ON P.ProductID = T.ProductID
Where T.TransactionType = 'Out' AND T.TransactionDate >= DATEADD(MONTH, -12, GETDATE())
Group by P.Name;



-- Retrieving all rows from the temporary table #ReorderInfo
Select *
From #ReorderInfo;



-- Calculating suggested reorder quantity
UPDATE #ReorderInfo
SET SuggestedReorderQuantity = CAST(AverageMonthlySales * 2 AS int);



-- Retrieving all rows from the temporary table #ReorderInfo
Select *
From #ReorderInfo;



-- Calculating Running Total of Product Quantity
With Inventory AS (
	Select P.ProductID, P.Name AS ProductName, T.TransactionDate, T.Quantity
	From Products P
	Join Transactions T ON P.ProductID = T.ProductID
	)
SELECT ProductID, ProductName, TransactionDate, Quantity, Sum(Quantity) OVER(PARTITION BY PRODUCTID ORDER BY TransactionDate) As RunningTotal
From Inventory
ORDER BY TransactionDate;