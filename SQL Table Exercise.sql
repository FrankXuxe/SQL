CREATE TABLE Customer
(customer_id	smallint Not Null,
customer_name	VARCHAR(50) Not Null,
customer_address	VARCHAR(100) Not Null,
city			VARCHAR(50) Not Null,
state			VARCHAR(2) Not Null,
postal_code		VARCHAR(10) Not Null,
owner_id		smallint,
orders_placed	smallint

CONSTRAINT customerid_pk primary key (customer_id))

CREATE TABLE Product
(product_id		smallint Not Null,
product_description	VARCHAR(50) Not Null,
product_finish	VARCHAR(50) Not Null,
standard_price	NUMERIC(5,2) Not Null,
qty_on_hand		smallint Not Null,
product_line_id	smallint,

CONSTRAINT productid_pk primary key (product_id))

CREATE TABLE Orders
(order_id		smallint Not Null,
order_date		DATETIME DEFAULT GETDATE(),
customer_id		smallint Not Null,

CONSTRAINT order_id_pk primary key (order_id),
CONSTRAINT customerid_fk FOREIGN KEY(customer_id) REFERENCES Customer(customer_id))

CREATE TABLE Order_Line
(order_id		smallint Not Null,
product_id		smallint Not Null,
ordered_quantity	smallint Not Null, 

CONSTRAINT orderproduct_pk primary key (order_id,product_id),
CONSTRAINT orderid_fk FOREIGN KEY(order_id) REFERENCES Orders(order_id),
CONSTRAINT product_fk FOREIGN KEY(product_id) REFERENCES Product(product_id))

--Adding data: Right click your database, tasks, import, file, browse, last option(SQL11.0), check ignores, finish)
/*
select count(*) from customer
select count(*) from orders
select count(*) from Product
select count(*) from Order_Line
--number of rows
