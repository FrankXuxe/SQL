--- SPECIAL OPERATORS  ---

Select * from Person

-- what if i wanted to see only PersonID 2,5,7,8,10,25,26?

select * from Person
where PersonID = 2 OR PersonID = 5 OR PersonID = 7 OR PersonID = 8 OR PersonID = 10 OR PersonID = 25 OR PersonID = 26

SELECT * FROM Person WHERE PersonID IN(2,5,7,8,10,25,26)
--IN is another way of writing OR statement

/*
Show me the corresponding Title for the following course numbers
1045, 1050, 1061, 2021 (Course table, 4 Records returned)
*/

SELECT CourseID, Title FROM Course WHERE CourseID IN(1045,1050,1061,2021)

-- display the customer ID and order date that customers 1,3 and 5 placed orders

SELECT customer_id, Order_Date FROM Orders WHERE customer_id IN (1,3,5)

-- Display customerID and date of order placed by customers 1 thru 5

SELECT customer_ID, Order_date FROM Orders WHERE customer_id BETWEEN 1 And 5



-- what if i wanted to see everyone who was enrolled between 2000 and 2003

SELECT * FROM person WHERE EnrollmentDate BETWEEN '01/01/2000' AND '12/31/2003'


/*
show me all records in the Course table that have department IDs between
between 2 and 5

CourseID	Title			Credits	DepartmentID
2021		Composition		3		2
2030		Poetry			2		2
2042		Literature		4		2
4022		Microeconomics	3		4
4041		Macroeconomics	3		4
4061		Quantitative	2		4

*/

SELECT * FROM Course WHERE DepartmentID BETWEEN 2 and 5

-- show me all records in the Course table that have a title between
-- 'C' and 'N'

SELECT * FROM Course WHERE Title between 'c' and 'n'


-- USING LIKE operators --

-- What if i wanted to look up a department but cant remember what it is called
-- I know it starts with an 'E'

--% is to ignore all (beofre/ in betweeen/ end), _ is one space

SELECT * FROM Department 
WHERE Name LIKE 'E%'



-- I know it ends with an 'S'

SELECT * FROM Department 
WHERE Name LIKE '%S'

-- I know it has 7 characters

SELECT * FROM Department 
WHERE Name LIKE '_______'

 
-- Show me all departments that have AT LEAST 7 characters
-- in the name

SELECT * FROM Department 
WHERE Name LIKE '_______%'

-- Show customer names with 'furn' in their names

SELECT customer_name From Customer where customer_name like '%furn%'


-- Show customer names with 'furn' + 5 characters in their names

SELECT customer_name From Customer where customer_name like '%furn_____'



-- What if i wanted to look up a course but cant remember what it is called
-- I know it starts with a 'C'

SELECT * FROM Course where Title like 'C%'


-- Cant remember the last name but I know
-- it has a 'C' in it somewhere

SELECT * FROM Person where LastName like '%C%'


-- I know it starts with a C 

SELECT * FROM Person where LastName like 'C%'



-- I know it starts with a C and has 7 characters

SELECT * FROM Person where LastName like 'C_______'


-- I know it has the letter 'c' in the second to last character

SELECT * FROM Person where LastName like '%C_'



--List customers who do not have an address listed.
	SELECT 	*
	FROM 	Person
	WHERE 	HireDate IS NULL;
	
-- BEWARE OF USING '=' with NULL
	SELECT 	*
	FROM 	Person
	WHERE 	HireDate = NULL;
--Does not recognize =



-- Using TOP operator --
-- TOP N -- 

-- Display the first 3 orders…

SELECT TOP 3 * FROM Orders


-- display the first three orders by order date. What would Top 1 tell us?

SELECT TOP 3 * FROM Orders ORDER BY order_date ASC


-- How would you change it to give us the latest order placed?

SELECT TOP 1 order_date FROM Orders ORDER BY order_date DESC

/*

select top 1000 is default in SQL Server, in case large table
Top usually always goes with order by
Top 1 with order ascending by date gives you ---- earliest date
Top 1 with order descending by date gives you --- latest date
Top 10 with order ascending by price gives you --- top 10 cheapest products
Top 5 with order descending by prices gives you --- top 5 most expensive products

*/

--Right click table select top 1000




--Which 2 products have the highest inventory levels?
-- list the ID, description and quantity on hand

SELECT TOP 2 WITH TIES product_id, product_description, qty_on_hand FROM Product ORDER BY qty_on_hand DESC

--WITH ties show any thing have teh same value
	



-- shows in the order it is stored in the database

SELECT TOP 3 * FROM StudentGrade

-- shows in the order stated by the Order clause

SELECT TOP 3* FROM StudentGrade ORder by Grade desc

-- shows in the order stated by the Order clause
-- includes all records that are tied to the top 3

SELECT TOP 3 WITH TIES* FROM StudentGrade ORder by Grade desc

-- NOTE: this could be an error made in the financial aid system
-- awarding scholarships to top students but if they don't
-- put WITH TIES they could miss out on other diserving students


-- who was the first student to ever register based on enrollmentID in the studentgrade table? Show only 1 row.

SELECT TOP 1 *FROM StudentGrade Order by EnrollmentID

-- who was the last student to ever register based on enrollmentID in the studentgrade table? show only 1 row.

SELECT TOP 1 *FROM StudentGrade Order by EnrollmentID DESC

-- Is it enough to know just their IDs> What about their name?

SELECT TOP 1 *, Firstname, Lastname 
FROM StudentGrade
LEFT JOIN Person ON StudentGrade.StudentID = Person.PersonID
Order by EnrollmentID DESC


-- ************* ALIAS ***************

Select * from person

-- Using Column Alias

-- Exercise - Can you display column name
-- firstname as First Name and lastname as Last Name?

SELECT firstname as [First Name],
lastname as [Last Name],
hiredate as [Date of Employment]
FROM Person



-- Using Table Alias

-- List descriptions of all products with any kind of “natural” finish.

SELECT product_description from product p 
where p.product_finish like 'Natural%'

SELECT * FROM Product






-- Expressions --

-- Display productID, standard price and a new column to 
-- show the effect of increasing product prices by 10% for 
-- those products that are currently priced under $300.


-- NOTE: calculated columns don't have a column name so you have to give it an alias

SELECT product_id, standard_price as "Old Price", standard_price * 1.1 as "New Price"
FROM Product 


/*
show all product_descriptions along with standard price, qty_on_hand,
and Total Value (standard price * qty_on_hand). Calculated column name 
should be 'Total Value'.

*/

SELECT product_description, standard_price, qty_on_hand, standard_price * qty_on_hand as "Total Value"
FROM Product 


/*
What is the effect of slashing the budget of the Engineering Department
by half as well as a quarter? Display the name of the department and the 
projected budgets as shown below:

Department Name		Original Budget		50% Slashed		25% Slashed
Engineering			$350,000.00			$175,000.00		$262,500.00

*/

SELECT name, Format(Budget, 'c')as "Original Budget", Format(Budget *0.5, 'c') as "50% Slashed", Format(Budget*0.75, 'c') as "25% Slashed"
FROM Department 
WHERE name = 'engineering'

--Select the function and hit F1 key to go to web search



/* 
Show me the 2 most highest department budgets, FORMAT budget in currency
only show DepartmentID, Name and Budget.
REMEMBER you can use F1 to get the syntax of any SQL function.

DepartmentID	Name			Dept_Budget
1				Engineering		$350,000.00
7				Mathematics		$250,000.00
*/

SELECT TOP 2 DepartmentID, Name, format(Budget,'c') as Dept_Budget 
FROM Department 
order by Budget desc

--When there is no space, "" would not be nessesary

 -- Concatenation --

/*

Display personID, first name and last name as Full Name
from person table as shown below:
ID	Full Name
1	Kim Abercrombie
2	Gytis Barzdukas
3	Peggy Justice

*/

SELECT PersonID, FirstName + ' ' + LastName as [Full Name]
FROM Person



/* 
show me all faculty from the person table in the format
'{firstname} {lastname} was hired on {hiredate}'
Name the column 'Concatenation'

Concatenation
Kim Abercrombie was hired on 03/11/1995
Fadi Fakhouri was hired on 08/06/2002
Roger Harui was hired on 07/01/1998

*/

SELECT FirstName + ' ' + LastName + ' was hired on' + ' ' +
CONVERT(varchar, HireDate, 101) as Concatenation
FROM Person
WHERE hiredate is not null



/*
Display orders placed by customers living in Flordia.
customer ID and Name should be in one column named Customer and 
their complete address in one column named Full Address
in the following format (5 rows):

Customer 					Full Address									Orders_placed
1: contemporary casuals		1355 s. hines blvd., gainesville, fl, 35934		3
2: value furniture			15145 sw 17th st., plano, fl, 75094				1

*/

-- Step 1) columns and where statement

SELECT customer_id, customer_name, city, state, postal_code, orders_placed
FROM Customer
WHERE state = 'fl'

-- Step 2) Combine customer_id and customer_name -- Step 3) make it more cleaner

SELECT CAST(customer_id as VARCHAR) + ',' + customer_name as [Customer], city, state, postal_code, orders_placed
FROM Customer
WHERE state = 'fl'

-- Step 3) make it more cleaner

SELECT CAST(customer_id as VARCHAR) + ',' + customer_name as [Customer], customer_address + city + state + postal_code as [Full Address], orders_placed
FROM Customer
WHERE state = 'fl'

-- Step 4) Combine address

SELECT CAST(customer_id as VARCHAR) + ',' + customer_name as [Customer], customer_address + ', ' + city + ', ' + state + + ', '+ postal_code as [Full Address], orders_placed
FROM Customer
WHERE state = 'fl'

-- Step 5) Clean it up



-- Step 6) Add in last column - Orders placed








/*
create a report that shows each department's old and new slashed budgets as shown below. 
Use currency and date format as shown in the example. Use the step by step approach of 
trial and error.

Budget Report
The <department name> Department had an original budget of <budget> but 
will now operate under a new budget of <new_budget> starting on <start_date>

Example:

Budget Report
The Engineering Department had an original budget of $350,000.00 but will 
now operate under a new budget of $175,000.00 starting on 09/01/2007

*/

SELECT 'The ' + Name + 
' Department had an original budget of ' + FORMAT(budget, 'c') + 
' but will now operate under a new budget of ' + FORMAT(Budget * 0.5, 'c') + 
' starting on' + CONVERT(varchar, StartDate, 101)
FROM Department

SELECT *
From Department






