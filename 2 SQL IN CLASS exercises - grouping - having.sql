-- EXERCISES --

/* 1
How many students are enrolled in each course?
Display in order of highest enrollment first (9 rows). 
(Use student grade table)

courseid	Student Count
4022		8
4041		6
1061		6
2021		5
4061		5
2042		3
1050		3
1045		2
2030		2

*/

SELECT * FROM StudentGrade

SELECT CourseID, count(StudentID) as 'Student Count' FROM StudentGrade
Group by CourseID
Order by 'Student Count' desc






/* 2
Show me the count of each grade by each course
should not contain nulls and should be in order of
CourseID (25 rows)

CourseID	Grade	Grade_Count
1045		1.50	1
1045		2.50	1
1050		3.50	3
1061		3.00	3
*/

SELECT CourseID, Grade, count(StudentID) as 'Student Count' FROM StudentGrade
WHERE Grade IS NOT NULL
GROUP BY CourseID, Grade
ORDER BY CourseID

SELECT * FROM StudentGrade





/* 3

Display the order_id and total of ordered quantity
for all orders that have a total quantity ordered
greater than 5 (Order_line table)

*/

SELECT * FROM Order_Line

SELECT Order_id, sum(ordered_quantity) FROM Order_Line
Group by order_id
Having sum(ordered_quantity) > 5








/* 4
Display all departments that offer more than 2 courses. Display
department id and count of the courses they offer

departmentid	Total Courses
2				3
4				3

*/

SELECT * FROM Course

SELECT DepartmentID, Count(courseid) as 'Total Courses'  FROM Course
Group By DepartmentID
Having  Count(courseid) > 2







