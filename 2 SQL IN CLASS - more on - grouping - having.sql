-- USE CREDIT DATABASE

use Credit
  
-- Display total amount charged by each member (charge table)

 SELECT member_no, SUM(charge_amt) as [Total Charges]
 from charge
 group by member_no



  -- apply formatting for currency and sort with highest first
  
 SELECT member_no, format(SUM(charge_amt),'c') as [Total Charges]
 from charge
 group by member_no
 order by [Total Charges] desc
  -- the above statement does not sort correctly because
  -- of the format function. It changes the data type to string.

   SELECT member_no, format(SUM(charge_amt),'c') as [Total Charges]
 from charge
 group by member_no
 order by SUM(charge_amt) desc




  -- NOTE: the aggregate function does not even need to be included in the select clause

 SELECT member_no
 from charge
 group by member_no
 order by SUM(charge_amt) desc





  -- Management has asked you to investigate the difference
  -- between total charges (charge table) and payments (payment table)
  --  made by member_no 83,84 and 104


  SELECT member_no, format(sum(charge_amt), 'c') 
  from charge
  WHERE member_no = 83 OR member_no =84 OR member_no =104
  GROUP by member_no
  ORder by sum(charge_amt) desc
  

  SELECT member_no, format(sum(payment_amt), 'c')
  FROM payment
  WHERE  member_no = 83 OR member_no =84 OR member_no =104
  group by member_no
  order by sum(payment_amt) desc








    -- Display total amount charged by category number

	
 SELECT category_no, SUM(charge_amt) as [Total Charges]
 from charge
 group by category_no





	-- what if manamgement asked us what is the most poplar
	-- month for transactions 
	-- we would need to see the total transactions by month
	-- and sort it with highest first

select * from charge

-- just grab the columns you are interested in

select top 10 charge_dt, charge_amt
from charge



-- modify to see only the month portion

SELECT datename(month, charge_dt), sum(charge_amt) 
from charge
group by datename(month, charge_dt)
order by sum(charge_amt) desc





-- it would be better to see it with the monthname

SELECT datename(month, charge_dt), sum(charge_amt) 
from charge
group by datename(month, charge_dt) having SUM(charge_amt) > 1000000000
order by sum(charge_amt) desc



-- now group it by month to get total charge amount







-- apply currency formatting, column aliases and sorting







-- what if we only care of those months that have over a $1,000,000,000 in total charges?














