--CREATE TABLE MyOrders
--(Order_ID	Numeric(4),
--Order_Date	DATETIME,
--Customer_ID	smallint)

--SELECT * FROM MyOrders
--INSERT INTO MyOrders
--VALUES(9999,'10/21/1999',1)




--CREATE TABLE MyOrdersWithDefaultDate
--(Order_ID	smallint,
--If the user do not enter a date the system altomatically enters the current date.
--Order_Date	datetime DEFAULT GETDATE(),
--Customer_ID	smallint)

-- Current date
--SELECT GETDATE()

-- Insert two values of the table
--INSERT INTO MyOrdersWithDefaultDate(Order_ID, Customer_ID)
--VALUES(9999,1)
--SELECT * FROM MyOrdersWithDefaultDate



--CREATE TABLE MyOrdersWithKey
--(Order_ID	smallint NOT NULL,
--Order_Date	datetime DEFAULT GETDATE(),
--Customer_ID	smallint NOT NULL

--CONSTRAINT orderid_pk PRIMARY KEY (Order_ID)

--)

--INSERT INTO MyOrdersWithKey
--VALUES(9999,'10/21/1999',1)
--SELECT * FROM MyOrdersWithDefaultDate





CREATE TABLE MyOrdersWithKeyAndCheck
(Order_ID	smallint NOT NULL,
Order_Date	datetime DEFAULT GETDATE(),
Customer_ID	smallint NOT NULL

CONSTRAINT orderid2_pk PRIMARY KEY (Order_ID),
CONSTRAINT order_date_cc CHECK (YEAR(Order_Date) >= 2000)

)

INSERT INTO MyOrdersWithKeyAndCheck
VALUES (9999,'10/21/2001',1)




CREATE TABLE MyOrdersWithForeignKey
(Order_ID	smallint NOT NULL,
Order_Date	datetime DEFAULT GETDATE(),
Customer_ID	smallint NOT NULL

CONSTRAINT orderid3_pk PRIMARY KEY (Order_ID),
CONSTRAINT order_customer_fk FOREIGN KEY(Customer_ID) REFERENCES customer(Customer_ID)
--Tell which table it is connecting to

)

INSERT INTO MyOrdersWithKeyAndCheck
VALUES (9999,'10/21/2001',1)