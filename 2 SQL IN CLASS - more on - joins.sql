use credit

/* Create a report that shows the all charges greater than $5,000. Innclude the first and last name of the member
and the name of the category of the charge (Charge, Member and Category tables). */

select top 5 * from charge

select top 5 * from member

select top 5 * from category

SELECT m.member_no, m.firstname, m.lastname, ca.category_no, ca.category_desc, c.charge_dt from charge c
INNER JOIN member m on c.member_no = m.member_no
INNER JOIN category ca on c.category_no = ca.category_no
WHERE c.charge_amt > 5000
GROUP BY m.member_no, m.firstname,m.lastname, ca.category_no, ca.category_desc,c.charge_dt
ORDER BY c.charge_dt

/* Display all members that are located in the 'South American Region' and 
are part of the 'Corp. Expert OperaLtd.' corporation  */

SELECT 



Use BearHouse

/* Which products have not sold any units (use Product and OrderItem tables)? */

select * from product
select * from orderitem






/* Which customers have not placed orders */




