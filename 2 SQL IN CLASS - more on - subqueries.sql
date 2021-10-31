 -- use Credit Database

 use Credit
 
 -- Management has asked you to investigate which members
 -- have total charges of more than $120,000 but have not
 -- made any payments (charge and payment table)

 SELECT member_no, sum(charge_amt) 
 from charge
 group by member_no
 having sum(charge_amt) > 120000

 select * from charge
 
 -- who are the members that have paid

  SELECT distinct member_no from payment

  -- subquery

  SELECT member_no, sum(charge_amt) 
 from charge
 where member_no NOT IN (SELECT distinct member_no from payment)
 group by member_no
 having sum(charge_amt) > 120000

 -- what if we could provide management with thier contact info
 -- from one query (from the member table)

 -- first we remove the aggregate function because we don't need it for the sub-query
 
 SELECT member_no
 from charge
 where member_no NOT IN (SELECT distinct member_no from payment)
 group by member_no
 having sum(charge_amt) > 120000



  -- then we simply encapsulate the whole query making it the inner query
  -- and add in the outer query making sure to match member_no to member_no
  -- using IN

 SELECT * FROM member
 WHERE member_no in (SELECT member_no
 from charge
 where member_no NOT IN (SELECT distinct member_no from payment)
 group by member_no
 having sum(charge_amt) > 120000)






  -- NOTE: it is much simpler to do it as a JOIN query





/* ----  Using a subquery to insert a record into a table ----- */

use bearhouse

-- let's say order ID 1 is placed by customer id 1 but was
-- only recorded in the orderitem table but 
-- never recorded in the orders table

SELECT * FROM [OrderItem] where orderid = 1 
select * FROM [Order] Where ordernumber = 1

SELECT sum(UnitPrice * quantity)
FROM OrderItem
WHERE OrderId = 1

Begin transaction

select * FROM [Order] Where ordernumber = 1

Insert into [Order]
Values (GETDATE(),1,1,(SELECT sum(UnitPrice * quantity)
FROM OrderItem
WHERE OrderId = 1),SYSTEM_USER)

select * FROM [Order] Where ordernumber = 1

ROLLBACK

select * FROM [Order] Where ordernumber = 1