--Extract Customer table 
SELECT *
FROM Customer


--Extract Product table
SELECT*
FROM Product


--How many orders 'Technology' of Category column are in Product table?
SELECT COUNT(*) AS NumOFProduct
FROM Product
WHERE Category = 'Technology'


--Indicate data of CustomerName, Segment, State và Region column in table Customer
SELECT CustomerName, Segment, State, Region
FROM Customer


--Which region are there maximum clients? First 
SELECT MAX(Region) As TheMostRegion
FROM Customer


--Which region are there maximum clients? Second 
SELECT TOP 1 Region, COUNT(*) As TheMostRegion
FROM Customer
GROUP BY Region
ORDER BY Region DESC


--How many clients belong to Corporate of Segment column in Customer table?
SELECT COUNT(Segment) AS NumOfCusBelongCorporate
FROM Customer
WHERE Segment = 'Corporate'


--Indicate orders of OrderDate, CustomerID, ProductID, Sales, Profit column
SELECT OrderDate, CustomerID, ProductID, Sales, Profit
FROM Orders


--Which the latest order is orderred in Order table? First
SELECT MAX((OrderDate)) As TheLatestOrrderdate
FROM Orders


--Which the latest order is orderred in Order table? Second
SELECT *
FROM Orders
WHERE OrderNumber= 'CA-2018-126221'
ORDER BY OrderDate DESC 


--Which orders Cho biết OrderNumber, OrderDate, ProductID, Sales, Profit của đơn hàng có Profit thấp nhất trong năm 2018 Câu 8
SELECT OrderNumber, OrderDate, ProductID, Sales, Profit
FROM Orders
WHERE Profit = -6599.978
ORDER BY Profit ASC 


--Indicate the highest order profit in 2018 of these following columns: OrderNumber, OrderDate, ProductID, Sales, Profit
SELECT OrderNumber, OrderDate, ProductID, Sales, Profit
FROM Orders
WHERE Profit = 8399.976
ORDER BY Profit DESC


--The list of orders with Profit less than 0 and Discount greater than 0, included information: OrderNumber, OrderDate, ProductID, Sales, Profit
SELECT OrderNumber, OrderDate, ProductID, Sales, Profit, Discount
FROM Orders
WHERE Profit <0 AND Discount >0
ORDER BY Profit DESC

--Câu lệnh Distinct
SELECT COUNT(*) AS NumOfCus
FROM (Select Distinct CustomerName 
        FROM Customer) AS P 


