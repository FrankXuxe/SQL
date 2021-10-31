-- JOINS --

-- Using a sub-query display all customers
-- that have NOT placed an order

SELECT customer_id, customer_name FROM customer
WHERE customer_id NOT IN (SELECT customer_id from orders)

--SELECT * FROM Orders
--WHERE customer_id NOT IN (SELECT customer_id from Customer)

-- USING JOIN SYNTAX ONLY FOR THIS COURSE

-- List Customer ID, Customer Name and Order ID
-- for each customer that has placed an order

SELECT customer_id, order_id FROM Orders

SELECT customer_id, customer_name FROM Customer

SELECT c.customer_id, customer_name, order_id FROM customer c
INNER JOIN orders o ON c.customer_id = o.customer_id

-- INNER JOIN --
-- retrives ONLY matching rows from BOTH table

SELECT c.customer_id, customer_name, order_id FROM customer c
INNER JOIN orders o ON c.customer_id = o.customer_id




-- reverse the join from Orders to customer
-- displaying all the columns of orders and
-- customer name

SELECT o.*, c.customer_name
FROM orders o
INNER JOIN customer c on c.customer_id = o.customer_id

SELECT * FROM ORDERS
SELECT * FROM Customer


-- Show Customer Name and No. of orders
-- placed using Customer and Orders table
-- grouping it by customer name. Display
-- customer with most orders first.

SELECT c.customer_name, count(order_id) as 'Total Orders' FROM orders o
Inner join customer c on c.customer_name = o.cname
group by c.customer_name
Order by count(order_id) asc

--Show the customer name and the products they ordered

SELECT c.customer_name, p.product_description FROM Customer c
Inner join orders o on c.customer_id = o.customer_id
INNER JOIN order_line ol on o.order_id = ol.order_id 
INNER JOIN Product p on ol.product_id = p.product_id


SELECT * FROM Product
SELECT * FROM Order_Line
SELECT * FROM ORDERS
SELECT * FROM Customer

-- LEFT (Outer Join) --
-- retrives ALL rows from first table
-- and ONLY MATCHING rows from second table

SELECT c.customer_id, customer_name, order_id FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id



-- difference between INNER JOIN and LEFT JOIN
-- INNER JOIN usually has less rows because you
-- only see the rows that exist in BOTH tables.
-- LEFT JOIN shows you all the rows in the FROM
-- table and corresponding matches in the JOIN table.








-- So using JOIN answer the same question as before
-- Which customers have not placed orders?  

SELECT c.customer_id, customer_name, order_id FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE order_id IS NULL







/*
-- SELF JOINS --




For each customer who has an owner, 
show the customer's name and their owner's name.
*/

SELECT c.customer_id, c.customer_name, c.owner_id, o.customer_name
FROM Customer c
LEFT JOIN Customer o on c.owner_id = o.customer_id






-- we can add more criteria to the join to eliminate unwanted records
-- AND O.customer_name NOT LIKE 'impressions'

