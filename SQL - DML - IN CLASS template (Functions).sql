select * from Orders

/*
Scalar - Operate against a single value and returns a single value
Can be placed anywhere

Aggregate - operate on coplete sets of data and retun a single result 
can be placed only in selected statement or with the clause 'Having'
*/

--Show the year customer 1 first placed an order.

SELECT TOP 1 YEAR(order_date) 'Year First Ordered'
FROM Orders
where customer_id = 1
ORDER By order_date

--Show the different months that orders were placed.

SELECT Month(order_date) as 'Month'
From Orders

-- what can i change about the above statement 
-- to show no repeating values?

SELECT DISTINCT Month(order_date) as 'Month'
From Orders 

-- DISTINCT eliminate repeating values

-- what can i change about the above statement 
-- to show no repeating values and the name of the month?

SELECT DISTINCT DateName(month,order_date) as 'Month'
From Orders 





-- How many months have elapsed between our 
-- order dates and today?  

SELECT DATEDIFF(MONTH,order_date,GETDATE())
FROM Orders



-- Show how old, in years, our orders are.  Show 
-- results in descending order of age

SELECT order_id,
YEAR(GETDATE()) - YEAR(order_date) as [Order Age in Years]
FROM Orders
ORDER BY [Order Age in Years] desc




-- NUMERIC SCALAR FUNCTIONS  --

--Show the effects of decreasing product prices by 
--3.5%.

SELECT product_id, standard_price, standard_price* .965, 'c' as "New Price" FROM Product

SELECT product_id, standard_price, FORMAT(round(standard_price* .965, 2),'c') as "New Price" FROM Product

SELECT product_id, standard_price, FLOOR(standard_price* .965) as "New Price" FROM Product

-- SYSTEM FUNCTIONS

SELECT SYSTEM_USER

SELECT GETDATE()


-- What orders were placed in the current month of any 
-- year?

SELECT * FROM orders WHERE MONTH(GETDATE()) = MONTH(order_date)




--  CONVERT AND CAST FUNCTIONS  --

-- SYNTAX: CONVERT ( target_data_type [ ( length ) ] , value  [ , stylecode ] ) --
-- SYNTAX: CAST ( value AS target_data_type [ ( length ) ] ) --

SELECT CONVERT(int,9.5)

SELECT CAST(9.5 AS int)

SELECT CONVERT(decimal(6,4),9.5)
SELECT CAST(9.5 AS decimal(6,4))

SELECT order_date, CONVERT(varchar(20),order_date,101)
FROM orders









-- SUGGESTION: Use CONVERT for date conversions (to use date and/or time formatting) 
-- and use CAST for all other data type conversions









-- AGGREGATE FUNCTIONS --

	-- COUNT --

--How many orders are in the DB?
	
	SELECT COUNT(*)
	FROM Orders


--How many orders were placed after Nov 1st 2000?
	
	SELECT COUNT(*)
	FROM Orders
	WHERE order_date > '11/1/2000'


--How many orders have customer IDs?
	
	SELECT COUNT(customer_id)
	FROM orders

	SELECT * FROM Customer
	SELECT COUNT(*) FROM Customer
	SELECT COUNT(owner_id) FROM Customer

--How many different customers have placed orders?
	-- DISTINCT HAVE TO BE IN THE INSIDE BECAUSE IT OPERATES INSIDE OUT!!!
	SELECT COUNT(DISTINCT Customer_id)
	FROM Orders



	-- MIN & MAX --
	
-- Find date of most recent order.	MAX

SELECT MAX(order_date) FROM Orders


-- Show the earliest year that an order was ever placed. MIN
	




-- Show the date that customer 1 first placed an order. 
	
	SELECT MIN(Order_date) FROM Orders WHERE customer_id = 1




	-- SUM & AVERAGE --

-- How many products are in inventory?
	
	SELECT SUM(qty_on_hand)
	FROM Product



-- What's the average price of our products?
	
	SELECT FORMAT(AVG(standard_price),'c') as [Average price]
	FROM Product


   
-- List the average product price and lowest product
-- quantity on hand of our products.

 SELECT AVG(standard_price) as [Average Priec],
 MIN(qty_on_hand) as [Low Quantity]
 FROM Product
 WHERE qty_on_hand > 0





