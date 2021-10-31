/*
1) Creating a table from another table that already exists
   in the database.

	 structure only
	 syntax - SELECT TOP 0 * INTO {newtablename}
				FROM {existingtablename}

	structure and all data
	syntax - SELECT * INTO {newtablename}
			 FROM {existingtablename)


	structure and subset (filtered) data
	syntax - SELECT * INTO {newtablename}
			 FROM {existingtablename)
			 WHERE {condition}

*/

	-- structure only -- 
	SELECT TOP 0 *
	INTO customer_copy_1
	FROM Customer

	SELECT * from customer_copy_1





	-- structure and all data -- 
	SELECT * INTO customer_copy_2
	FROM customer

	SELECT * from customer_copy_2

	


	-- structure and subset data from orders to new table --
	SELECT * from orders
	SELECT * INTO order_customer_1
	FROM Orders
	WHERE customer_id = 1

	SELECT * FROM order_customer_1





/* 
Create a MyCustomers table that is a
copy of the customer table but only data
for customer ID  = 1
*/

SELECT * INTO MyCustomers
FROM Customer
WHERE customer_id = 1

SELECT * FROM MyCustomers

--IMPORTANT: Primary key automatically create index fomr the promary key

-- 2) Atomic Index
CREATE INDEX order_cust_idx ON MyOrders(customer_id)
--For index we use idx


	

-- 3) Composite Index
CREATE INDEX custid_orderid_idx ON MyOrders(customer_id, order_id)
 



-- 4) Filtered Index
	CREATE INDEX product_desk_idx ON Product(product_description)
	WHERE product_description IN ('end table','coffee_table')




/*
5)	Alter Table customer to change length of name field
	look at design first to verify allow nulls and length

syntax - ALTER TABLE {tablename} ALTER COLUMN {columnname} {datatype(length)} {NULL/NOT NULL}

*/

ALTER TABLE customer ALTER COLUMN customer_name VARCHAR(100) NOT NULL








/*
6)	Add order type column to the MyOrders table

syntax - ALTER TABLE {tablename} ADD {columnname} {datatype(length)}

*/

ALTER TABLE MyOrders ADD order_type VARCHAR(2)







/*
7)	Drop column order_type in the MyOrders table

syntax - ALTER TABLE {tablename} DROP column {columnname}

*/

ALTER TABLE MyOrders DROP Column order_type







/*
8)	Add a check constraint to the MyOrders table to
	ensure no orders in the first week of any year

syntax - ALTER TABLE {tablename} ADD CONSTRAINT {constraintname}
CHECK ({constraint condition})

TO TEST (it should give you an error): 
INSERT INTO MyOrders values(9903,'1/5/2005',12)

*/

ALTER TABLE MyOrders ADD CONSTRAINT no_first_week_orders_cc
CHECK ((day(order_date) > 7 AND month(order_date) = 1) OR MONTH(order_date) > 1)

INSERT INTO MyOrders values(9903,'1/8/2005',12)





/*	
9) Drop the CHECK constraint

syntax - ALTER TABLE {tablename} DROP CONSTRAINT {constraintname}

*/


ALTER TABLE MyOrders DROP CONSTRAINT no_first_week_orders_cc






/*
10) Add a primary key constraint (name it mycustomer_id_pk)
	to MyCustomers table

syntax- ALTER TABLE {tablename} ADD CONSTRAINT {constraintname}
		PRIMARY KEY ({attributename}
*/

ALTER TABLE MyCustomers ADD CONSTRAINT mycustomer_id_pk
PRIMARY KEY (customer_id)







/*
11) Add a foreign key constraint (name it myorders_mycustomers_fk)
	to MyOrders table that links the MyCustomers table to the orders 
	table through customer_id

syntax- ALTER TABLE {tablename} ADD CONSTRAINT {constraintname}
		FOREIGN KEY ({attributename}
		REFERENCES {tablename}({attributename})

*/

ALTER TABLE MyOrders ADD CONSTRAINT myorders_mycustomers_fk
FOREIGN KEY (customer_id)
REFERENCES MyCustomers(customer_id)

Select * from myorders
select * from MyCustomers

delete from MyOrders 





/*
12) Try dropping the table with a foreign key constraint i.e 
    try dropping the MyCustomers table which has a foreign key
	constraint in the MyOrders table
*/

BEGIN TRANSACTION
	DROP TABLE MyOrders
	DROP TABLE MyCustomers
ROLLBACK

Select * from MyOrders
Select * from Mycustomers

--rollback is the same as "Undo"!!!!







-- you have to drop the table with the foreign key in it before dropping
-- the table with the primary key in it









/*
13) Drop the foreign key constraint (myorders_mycustomers_fk) in the MyOrders table

	syntax - ALTER TABLE {tablename} DROP CONSTRAINT {constraintname}
*/

 ALTER TABLE MyOrders DROP CONSTRAINT myorders_mycustomers_fk