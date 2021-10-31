/* 1
Which member(s) spent the most on a single order? Display the member number and the amount of the charge. Use the charges table (5 pts)
*/

 SELECT TOP 1 member_no, charge_amt FROM charge ORDER BY charge_amt DESC

 SELECT * FROM charge

/* 2
Display the corporation number, corporation name and region of all corporations that are in regions 1,3,5 and 7 using special operator IN (5 pts)
*/

 SELECT * FROM corporation

 SELECT corp_no, corp_name, region_no FROM corporation 
 WHERE region_no IN (1,3,5,7)

 

 

 

/* 3
List the member number and payment amount for everyone that
made payments in the month of November (of any year). Use payment table (101 rows).
Format as shown below (only 1st two rows shown) (5 pts)

Member Number    Payment Amount    Date of payment
2078                      $6,573.00                11/15/1999
2079                      $6,750.00                11/15/1999

*/

 SELECT * FROM payment

 SELECT member_no as "Member Number", FORMAT(payment_amt, 'c') as "Payment Amount", CONVERT(VARCHAR, payment_dt,101) as "Date of payment" FROM payment
 WHERE Month(payment_dt) = 11
 

 

/* 4
What are the total charges for the month of October 1999? 
What is the average customer spending for that period?
Result should be shown in currency format with appropriate headings
*/

 SELECT format(SUM(charge_amt), 'c') as "Total in October 1999" FROM charge 
 WHERE Year(charge_dt) = 1999 and Month(charge_dt) = 10

 SELECT format(AVG(payment_amt), 'c') as "Average in October 1999" FROM payment
 WHERE Year(payment_dt) = 1999 and Month(payment_dt) = 10

 SELECT * FROM charge
 SELECT * FROM payment
 


/* 5
Corporate would like to offer a 15% discount to any charges that were made 
in category 10 and over $5,000 or category 5 and charges over $4,850. Display the member number, the category, the amt of 
the original charge and the discounted charge amount. Display as shown below (random rows shown).
Member Number    Category    Charge Amount    Discounted Charge Amount
2465                          5               $4,975.00             $4,228.75
8360                        10               $5,001.00             $4,250.85
*/

SELECT member_no as "Member Number", category_no as Category, format(charge_amt, 'c') as "Charge Amount", format(charge_amt * 0.85, 'c') as "Discounted Charge Amount" FROM charge
WHERE category_no = 10 AND charge_amt > 5000 OR category_no = 5 AND charge_amt > 4850
