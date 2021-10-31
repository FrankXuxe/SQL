


-- SUBQUERY --

/* 1

What is the name of the courses that have
students currently enrolled?
( use the COURSE and StudentGrade tables)

*/

SELECT * FROM Course
SELECT * FROM StudentGrade

SELECT Title FROM Course
WHERE CourseID in (SELECT CourseID FROM StudentGrade)





/* 2

What is the only course that doesn't currently have
any students enrolled?
(use the COURSE and StudentGrade tables)

*/

SELECT Title FROM Course
WHERE CourseID not in (SELECT CourseID FROM StudentGrade)






/* 3
Show me all students (not employees) that are NOT 
enrolled in a course (1 row)

PersonID	LastName	FirstName	HireDate	EnrollmentDate
33			Gao			Erica		NULL		2003-01-30 00:00:00.000

*/

SELECT * FROM Person
SELECT * FROM StudentGrade

SELECT * 
FROM Person
WHERE PersonID not in (SELECT StudentID FROM StudentGrade) AND EnrollmentDate IS NOT NULL








