/********************
SQL -- DML -- PART I
*********************/

/***** SELECTING *****/

--data manipulation language = DML
--data description language = DDL

-- Show all columns and all rows. How many rows?
-- What business question can this answer?

SELECT * FROM Orders


-- Show only customer_id column from orders table.

SELECT customer_id FROM Orders



-- SELECT DISTINCT column(s) FROM table;
-- What business question can this answer?

SELECT DISTINCT customer_id FROM orders

--How many customers without repeating ones.

-- NOW YOU TRY -- 

-- FIRST ALWAYS LOOK AT YOUR TABLE(S)!

SELECT * FROM Person

-- Display all rows and columns from the person table

SELECT * FROM Person

-- Display only firstname and lastname from the person table

SELECT LastName, FirstName FROM Person


-- Display all rows from the studentGrade table. How many rows?

SELECT * FROM StudentGrade

-- Display only unique studentIDs from the StudentGrade table. 
-- How many rows returned?
-- What business question can this answer?

SELECT DISTINCT StudentID FROM StudentGrade


--Last clause in sequal statement: orderby clause
--First clase in a sequal query: select clause







/***** SORTING *****/


-- List customer names and addresses 
-- in descending order of customer's name.

SELECT customer_name, customer_address FROM customer order by customer_name DESC




-- List product numbers, descriptions, and quantities on hand for all products. 
-- Show products with highest quantities first, and then in alphabetical order 
-- of product description.

SELECT product_id, product_description, qty_on_hand
from product
order by qty_on_hand DESC, product_description ASC




-- Using the person table, display the full name of all employees and their 
-- hire date showing the employee who was the first hire at the top.

SELECT FirstName,LastName,HireDate,EnrollmentDate FROM Person ORDER BY HireDate 
--Earliest date first is Acending order

-- Using the person table, display the full name of all employees showing 
-- the person who was hired last at the top

SELECT FirstName,LastName,HireDate,EnrollmentDate FROM Person ORDER BY HireDate DESC




-- this will assume you want hiredate
-- in ASC order. You have to specify 
-- for each column

SELECT * FROM person ORDER BY HireDate, EnrollmentDate ASC





/***** FILTERING *****/

-- FIRST ALWAYS LOOK AT YOUR TABLE(S)!

-- Show order IDs and dates of all orders placed by customer 1.	

SELECT order_id, order_date FROM orders WHERE customer_id = 1


-- Show the orderid and the time for all orders placed after
-- November 1st 2000. How many rows?
-- What business question can this answer?

SELECT order_id, order_date FROM orders WHERE (order_date)>'11/1/2000'





-- comparison operator
-- show all persons only fname and lname
-- that were hired after 1/1/2000
-- order by lastname then firstname asc

-- FIRST ALWAYS LOOK AT YOUR TABLE(S)!

SELECT firstname, lastname, hiredate FROM person WHERE HireDate > '01/01/2000'
ORDER BY LastName, FirstName




/***** BOOLEAN Operators *****/

-- Show orders placed by customer 1 with order ID(s) higher than 1005.

SELECT * FROM Orders WHERE customer_id = 1 AND order_id > 1005



-- Show orders placed by CUSTOMERS EXCEPT customer 1,
-- and with order ID(s)  higher than 1007

SELECT * FROM Orders WHERE NOT customer_id = 1 AND order_id > 1007

-- !=, <>, NOT all mean the same thing



-- Show orders placed by customers except customer 1, 
-- AND that have either an order ID higher than 1007 
-- OR an order date on the 24TH of the month

SELECT Customer_ID, Order_ID,Order_Date FROM Orders WHERE Customer_ID != 1 AND (Order_ID > 1007 OR day(order_date) =24)




-- show fname, lname, hiredate and enrollmentdate
-- that were hired after 1/1/2000
-- OR enrolled after 1/1/2003
-- order by lastname then firstname asc

SELECT firstname, lastname, hiredate, enrollmentdate FROM Person WHERE HireDate > '01/01/2000' OR EnrollmentDate > '01/01/2000'
ORDER BY LastName , FirstName



---  ORDER OF OPERATION ---
-- NOT, AND, OR
-- USE PARENTHESIS TO ENSURE DESIRED ORDER --

SELECT * FROM person WHERE EnrollmentDate is not null

SELECT * FROM Person WHERE PersonID = 2 OR EnrollmentDate is null

SELECT * FROM Person WHERE PersonID = 2 OR EnrollmentDate is null AND PersonID = 3

SELECT * FROM Person WHERE (PersonID = 2 OR EnrollmentDate is null) AND PersonID = 3

SELECT * FROM Person WHERE PersonID = 2 OR EnrollmentDate is not null AND PersonID = 3

/*
-- EXERCISE --
Show me all the students from the student grade table
that:
1) enrolled in CourseID 2021 and have a grade greater than or equal to 3.5 (2 records)
2) enrolled in either CourseID 2021 OR 2030 and have a grade greater than or equal to 3.0 (6 records)
3) Have a NULL grade AND enrolled in courseID 4041 OR just enrolled in CourseID 4022 (10 records)
*/

SELECT CourseID, Grade FROM StudentGrade WHERE CourseID = 2021 AND Grade >= 3.5

SELECT CourseID, Grade FROM StudentGrade WHERE CourseID = 2021 AND Grade >= 3.0 OR CourseID = 2030 AND Grade >= 3.0

SELECT CourseID, Grade FROM StudentGrade WHERE CourseID = 4022 OR Grade is NULL AND CourseID = 4041

--grant control to frank_xue1