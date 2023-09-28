-- Select Concat(CustomerName, WebsiteURL) "NameAndWebSite"
-- FROM Sales.Customers;

-- select CustomerName, PhoneNumber
-- From Sales.Customers;

-- select LEFT (customerName,1) "CustomerInitial", Count(CustomerID) as COUNT
-- from Sales.Customers
-- Group By LEFT (CustomerName, 1)

-- SELECT 
-- DATEPART(ww,o.OrderDate) as "Week",
-- DATEPART(dw,o.OrderDate) as "Day",
-- Count(OrderID) as "Number of Orders"
-- FROM [Sales].[Orders] o
-- GROUP BY DATEPART (ww,o.OrderDate),DATEPART(dw,o.OrderDate)

--Create schema ba;
--select * into ba.customers from sales.customers
--drop table ba.customers
--create ba.customer by the result of select *
