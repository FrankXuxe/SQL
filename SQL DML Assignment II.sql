use salesdb

select * from customers
select * from Employees
select * from Products
select top 10 * from sales
select * from customers
/*
1) Display the ID and quantity sold of all sales staff that have sold over 
155,000,000 units across all products showing the employee with the highest sales first.

SalesPersonID	Total Qty Sold
1				253,157,371
10				164,706,674
8				159,361,160
16				156,602,520
2				155,714,556


*/

SELECT SalesPersonID, format(sum(Quantity), '###,###,###') as 'Total Qty Sold' FROM Sales
GROUP BY SalesPersonID
ORDER BY 'Total Qty Sold' desc


/* 
2) Display the ID of our best customer in terms of quantity.
CustomerID		Total Qty Sold
15440			28,795,662
*/

SELECT top 1 CustomerID, sum(Quantity) as 'Total Qty Sold' FROM Sales
Group By CustomerID
order by 'Total Qty Sold' desc



/*
3) Display the ID and full name of the customer from above using a subquery.

CustomerID	Full Name
15440		Paige Ramirez

*/

SELECT CustomerID, FirstName + ' ' + LastName as 'Full Name' FROM Customers
WHERE CustomerID in (SELECT CustomerID FROM Sales WHERE CustomerID = 15440)



/* 
4) What is the total quantity by product ordered by customer Kaitlyn Carter.
Display results  with highest quantities first.

Product ID	Total Quantity
173			4,726,567
409			1,667,136
162			880,440
420			569,100
426			931
179			684
190			570

*/

SELECT ProductID, sum(Quantity) as 'Total Quantituy' FROM Sales
WHERE CustomerID in (SELECT CustomerID FROM Customers WHERE FirstName = 'Kaitlyn' and LastName = 'Carter')
Group by ProductID
Order by sum(Quantity) desc


/* 
5) Display the name of the top 5 selling products based on quantity sold.  

Name of Product
Touring-3000 Blue, 54
LL Road Seat/Saddle
Touring Pedal
Rear Derailleur
ML Mountain Tire

*/

SELECT Top 5 ProductID From Sales GROUP by ProductID Order by Sum(Quantity) desc

SELECT Name from Products p
WHERE ProductID in (SELECT Top 5 ProductID From Sales GROUP by ProductID ORder by SUm(Quantity) desc)




