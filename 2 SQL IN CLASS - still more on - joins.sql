-- USE YOUR DATABASE HERE --

/* 
Display First Name, Last Name and corresponding personal and work email
for STUDENTS ONLY using Person and Contact_Info tables as shown below (only first row shown):


firstname	lastname	Personal Email					Work Email
Gytis		Barzdukas	josephine_darakjy@darakjy.org	ezekiel@chui.com
Peggy		Justice		art@venere.org					wkusko@yahoo.com
Yan			Li			lpaprocki@hotmail.com			bfigeroa@aol.com
Laura		Norman		donette.foller@cox.net			ammie@corrio.com
Nino		Olivotto	simona@morasca.com				francine_vocelka@vocelka.com

*/

-- Step 1 (look at the data from both tables)

select * from contact_info
select * from person




-- Step 2 (Firstname and Lastname of Students only)







-- step 3 (join table to contact_info table to grab the email)






-- there are two rows for each person. Why?

-- step 4 (apply the filter to grab just the personal email)








-- step 5 (you can use the filter in the join instead of the where clause)







-- step 6 (join to the same table again to grab the work email)







-- step 7 (you can use the filter in the join instead of the where clause)







/* EXERCISE -
Display First Name, Last Name and corresponding home,cell and work phone numbers
for instructors only using Person and Contact_Info tables as shown below (only first 2 rows shown):

FirstName	LastName		Home_Phone		Cell_Phone		Work_Phone
Kim			Abercrombie		(504) 621-8927	(410) 621-8927	(313) 621-8927
Fadi		Fakhouri		(810) 292-9388	(215) 292-9388	(815) 292-9388

*/

