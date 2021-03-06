use salesdb

select top 2 * from customers
select top 2 * from Employees
select top 2 * from Products
select * from sales

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

SELECT SalesPersonID, sum(Quantity) as 'Total Qty Sold' FROM Sales
GROUP BY SalesPersonID
ORDER BY sum(Quantity) desc


/* 
2) Display the ID of our best customer in terms of quantity.
CustomerID		Total Qty Sold
15440			28,795,662
*/





/*
3) Display the ID and full name of the customer from above using a subquery.

CustomerID	Full Name
15440		Paige Ramirez

*/







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





/* 
5) Display the name of the top 5 selling products based on quantity sold.  

Name of Product
Touring-3000 Blue, 54
LL Road Seat/Saddle
Touring Pedal
Rear Derailleur
ML Mountain Tire

*/







