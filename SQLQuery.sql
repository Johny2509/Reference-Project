--Eliminate odd symbols in PostalCode column
SELECT *
FROM Customer

SELECT CustomerID, CustomerName, Segment, Country, City, State, SUBSTRING(PostalCode,4,5) As NewPostalCode, Region
FROM Customer

--Replace Null values in Discount column by 0
SELECT *
FROM Orders

SELECT ID, OrderDate, OrderNumber, ShipDate, ShipMode, CustomerID, ProductID, Sales, Quantity, ISNULL(Discount,0) As NewDiscount, Profit
FROM Orders

--Indicate elements of Discount column in Product tabele including OrderNumber, OrderDate, ProductName,Sales, Discount_bin. 
SELECT OrderDate, OrderNumber, Quantity, Productname,
CASE
    WHEN ISNULL(Discount,0)<=0.2 THEN 'Low'
    WHEN ISNULL(Discount,0)<=0.4 THEN 'Medium'
    ELSE 'High'
END AS Discount_Bin
FROM Product INNER JOIN Orders ON Product.ProductID = Orders.ProductID


--Indicate Consumer element in Segment column, primarily concerntrate in which State 
SELECT TOP 51 [State], Count(Segment) AS TheMostSegment
FROM Customer
GROUP BY [State] 

SELECT MAX(Segment) AS NewSegment
FROM Customer


--Indicate the list of SubCategory column corresponding with each Category column in Product Table
SELECT DISTINCT SubCategory, Category
FROM Product


--Indicate elements of Orders column on December 2018. Included information: OrderNumber, OrderDate, ProductName, Category, Sales, Profit
SELECT OrderNumber, OrderDate, ProductName, Category, Sales, Profit
FROM Orders INNER JOIN Product ON Orders.ProductID = Product.ProductID
WHERE OrderDate BETWEEN '2018-12-01' AND '2018-12-31'
ORDER BY OrderDate ASC


--Indicate element “Sauder Barrister Bookcases” in Product column sold on which latest day
SELECT OrderNumber, OrderDate, ProductName, Category, Sales, Profit
FROM Orders INNER JOIN Product ON Orders.ProductID = Product.ProductID
WHERE ProductName Like 'Sauder Barrister Bookcases'
ORDER BY OrderDate DESC


--The list of Customer column at the end of three months in 2018, included information: CustomerID, CustomerName, Segment, State, OrderDate, ProductName, Sales
SELECT Customer.CustomerID, Customer.CustomerName, Customer.Segment, Customer.[State], Orders.OrderDate, Orders.Sales, Product.ProductName
FROM Customer 
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
INNER JOIN Product
ON Orders.ProductID = Product.ProductID
WHERE OrderDate BETWEEN '2018-10-01' AND '2018-12-31'
ORDER BY OrderDate ASC

--In Sales table, indicate how many orders “Amy Cox” of Customer column are on December 2018?
SELECT SUM(Sales) AS SaleOfAmyCox
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
WHERE CustomerName = 'Amy Cox' AND OrderDate BETWEEN '2018-12-01' AND '2018-12-31'

--In Sales table, indicate how many orders at “California” state of Sate column are from 24/12/2018 to 30/12/2018?
SELECT SUM(Sales) AS SaleOfCalifornia
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
WHERE [State] = 'California' AND OrderDate BETWEEN '2018-12-24' AND '2018-12-31'

--Country
SELECT * 
FROM Customer