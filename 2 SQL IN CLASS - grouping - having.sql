select * from product

SELECT product_description from Product group by product_description

SELECT product_finish FROM Product group by product_finish

--What is in the SELECT clause must be in the GROUP BY clause

-- List the average product price and lowest product quantity on hand 

SELECT AVG(standard_price) as Avg_price,
Min(qty_on_hand) as Qty_on_Hand
FROM product
Where qty_on_hand > 0



-- List the average product price and lowest product quantity on hand 
-- for EACH product finish we offer.

SELECT product_finish, AVG(standard_price) as Avg_price,
Min(qty_on_hand) as Qty_on_Hand
FROM product
Where qty_on_hand > 0
GROUP BY product_finish
ORDER BY product_finish







-- How many customers are there in each state?

SELECT state, count(*) as [Count] FROM Customer
GROUP BY state
ORDER BY [COUNT] desc

SELECT * FROM Customer

SELECT state, postal_code, count(*)
From Customer
Group by state, postal_code

-- from the orders table, display the total number of orders
-- placed by each customer by store for those customers

USE BikeStores

SELECT store_id, customer_id, COUNT(*)
From Orders
group by store_id, customer_id
order by store_id

-- Combination of the two

--Must be everything 





-- How many customers are in each postal_code area of each state?





-- Connect to Database BearHouse  ---
USE Bearhouse
SELECT * FROM Customer
-- Display a breakdown of customers by country
-- showing the country with the most customers first

SELECT Country, count(*) as NUM FROM Customer
GROUP BY Country
Order by NUM DESC



-- Display a breakdown of suppliers by country
-- showing the country with the most suppliers first

SELECT Country, count(*) as NUM FROM Customer
GROUP BY Country
Order by NUM DESC




-- Display total number of products by supplier ID
-- from the product table showing the biggest supplier first

SELECT SupplierId, count(*)
FROM Product
WHERE IsDiscontinued = 0
GROUP BY SupplierId
order by 2 desc

                                                                                                                                    
-- for non discontinued products


-- Display total cost by order id form the orderitem table in ascending order of orderid

SELECT Orderid, SUM(unitprice * quantity)
FROM OrderItem
group by OrderId
order by OrderId


 ----  using HAVING  ------



 /*
Like a WHERE clause for Group By


-- using BearHouse database --

Let's say we wanted to see the total cost of customer orders
by customer id. But we only care for those customers that
have a total amount of $30,000 or more

*/

SELECT CustomerId, sum(totalamount)
FROM [order]
group by customerid
Having sum(totalamount) > 30000
order by customerid




-- USE YOUR DATABASE HERE --

/*
List the average product price and lowest product quantity on 
hand for each product finish that has (a) at least 1 product with 
two or more units on hand, and (b) at least 3 products with that finish.
*/

SELECT product_finish, AVG(standard_Price), MIN(Qty_on_hand)
FROM Product
Group by product_finish
Having MIN(Qty_on_hand) >= 2 AND COUNT(product_id) >=3


