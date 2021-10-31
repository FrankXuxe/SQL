--  SUBQUERIES --


/*  Example 1) */

-- Show all orders placed by customers who live in California 

use FrankXue

SELECT * from Orders
SELECT * FROM Customer


--manually

select customer_id from Customer where state = 'ca'


-- check the above customers in the orders table by hard-coding the customer ID
-- not practical if it has 10,000 ids returned.

SELECT * FROM orders where customer_id in (5,8)

-- subquery, inner query is carried out first, attibutes have to match

SELECT * FROM orders where customer_id in (select customer_id from Customer where state = 'ca')


-- Show me which customers have not placed orders?  
-- Display their customer IDs and names, sorted by name

-- manually

-- all the customers in the database

SELECT * from Customer



-- all the customer ids who have placed orders

SELECT distinct customer_id from Orders

-- manually i could enter in each customer id that i got
-- from the above query to get the names of the customers
-- that HAVE placed orders

SELECT customer_id, customer_name from customer where customer_id in (1,2,3,4,5,8,11,12,15)



-- How would i change the above query to get customers
-- that have NOT placed orders

SELECT customer_id, customer_name from customer where customer_id NOT in (1,2,3,4,5,8,11,12,15)




-- to make it a sub-query

SELECT customer_id, customer_name from customer where customer_id NOT in (SELECT distinct customer_id from Orders)




/*  Example 2) */

-- Show all orders placed by customer - 'Contemporary casuals' or 'mountain scenes'

-- first let's look at the order table

SELECT * FROM orders
SELECT * FROM Customer



-- then let's look at just 'Contemporary casuals' and 'mountain scenes' 
-- from the customer table

SELECT customer_id
from Customer
WHERE customer_name = 'Contemporary casuals' or customer_name =  'moutain scenes'


-- Alternatively using IN in customer table

SELECT customer_id
from Customer
WHERE customer_name IN ('Contemporary casuals', 'mountain scenes')



-- Alternatively using IN in Orders table

SELECT * From Orders WHERE customer_id in (1,15)



-- putting those together as a subquery

SELECT * From Orders WHERE customer_id in (SELECT customer_id
from Customer
WHERE customer_name IN ('Contemporary casuals', 'mountain scenes'))