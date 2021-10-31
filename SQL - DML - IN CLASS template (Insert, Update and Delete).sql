
------------ INSERT ----------------
select * from orders

-- Since we are inserting values into every column
-- we dont have to specify the column names but it does have to match.

INSERT INTO Orders Values (1011, '10/21/2000',2)


--If we want to insert values in only select columns then
-- we have to specify column names

ALTER TABLE Orders ALTER COLUMN order_date datetime NULL

INSERT INTO Orders (order_id, customer_id) VALUES (1012,8)

/* 
Add a new customer:
Name: Interior Excellence
Address: 1234 Main St. Waco, TX 76706
*/

SELECT * FROM Customer

INSERT INTO Customer(customer_id,customer_name,customer_address,city,state,postal_code) VALUES (16,'Interior Excellence','1234 Main St',' Waco', 'TX', '76706')

--Can put just NULL

--Creating a table based on existing table
SELECT * INTO Employees
FROM Person
WHERE HireDate is not null


-- We can insert multiple rows in a single insert --
SELECT * FROM Employees
INSERT INTO Employees (FirstName,LastName)
VALUES ('Jane','Doe'),('John','Doe')



-- inserting from another table into a table that 
-- CURRENTLY EXISTS 

SELECT * FROM Orders WHERE customer_id = 1
SELECT * FROM MyOrders

INSERT INTO MyOrders
SELECT * FROM Orders Where customer_id = 1

--Syntax only for tables that already exists!!

-- creating a NEW TABLE from an existing table with the data --

SELECT * INTO new_products FROM Product

SELECT * from new_products








------------ UPDATE ----------------




-- Since we don't want a permanent change
-- we can use ROLLBACK to reverse the update

-- Data entry clerk made an error on orders after order_id 1009. He assigned it to the wrong customer.
-- The orders were supposed to be for customer id 2 and not customer id 1

SELECT * FROM orders WHERE order_id > 1009

BEGIN TRANSACTION

UPDATE Orders SET customer_id =2 WHERE order_id IN (1010,9999)

SELECT * FROM orders WHERE order_id > 1009

ROLLBACK

SELECT * FROM orders WHERE order_id > 1009


/*
You can use the data in the same record and update it
HINT, if you want details of the CONVERT or any function
press F1 when the cursor is on the function name
*/

SELECT * FROM Orders WHERE order_id = 1010

UPDATE ORDERS SET order_date = CONVERT (varchar(10), order_date, 120) + ' ' + '15:15:00'
WHERE order_id = 1010




/* Add a column to Orders table
and bring in the customer name to
match the customer number
*/

ALTER TABLE orders ADD cname VARCHAR(50)

SELECT * FROM Orders
SELECT * FROM Customer

UPDATE orders
SET cname = c.customer_name
FROM Orders o
INNER JOIN Customer c
ON o.customer_id = c.customer_id

-- Can you use ALIAS above to make it easier?







--ALTER TABLE orders DROP COLUMN cname;
--GO


/* EXERCISE
create a column named 'placed_order' of type bit (boolean) in the customer table.
Update the column with everyone that has placed an order using the orders_placed 
column in the same table. 
*/

--ALTER TABLE customer ADD placed_order BIT

 
UPDATE Customer set placed_order = 1
WHERE orders_placed > 0



--ALTER TABLE customer DROP COLUMN placed_order;
--GO

Alter table customer DROP COLUMN placed_order

------------ DELETE ----------------

-- Delete data that was inserted in step 1

BEGIN TRANSACTION
SELECT * FROM orders WHERE order_id IN (1011,1012)

DELETE FROM Orders
WHERE order_id IN (1011,1012)

SELECT * FROM orders WHERE order_id IN (1011,1012)

ROLLBACK

SELECT * FROM orders WHERE order_id IN (1011,1012)

-- What happens when you do not have a where clause?

DELETE FROM new_products

/*
EXERCISE:
Delete customers 'John Doe' and 'Jane Doe' from the
customer table
*/

BEGIN TRANSACTION

SELECT * FROM Employees
DELETE FROM Employees WHERE LastName = 'Doe' 

SELECT * FROM Employees

ROLLBACK

SELECT * FROM Employees










