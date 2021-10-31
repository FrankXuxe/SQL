/* 1
Create the phone table according to specs in the data dictionary provided (5 pts)
*/

CREATE TABLE phone
(phone_id	NUMERIC(6) NOT NULL,
area_code	VARCHAR(3) NOT NULL,
phone_number	VARCHAR(5) NOT NULL,
student_id	NUMERIC(9)

CONSTRAINT phone_id_pk PRIMARY KEY (phone_id)

)




/* 2
Alter the phone table to change the data type for student_id
to INT and not allow nulls and also change the length of the
phone number field to 7 (5 pts)
*/

ALTER TABLE phone ALTER COLUMN student_id INT NOT NULL
ALTER TABLE phone ALTER COLUMN phone_number VARCHAR(7) NOT NULL





/* 3
Add a foreign key constraint that connects the studentID in the phone table
to the personID in the person table (5 pts)
*/

ALTER TABLE phone ADD CONSTRAINT student_id_fk
FOREIGN KEY (student_id)
REFERENCES Person(PersonID)





/* 4

Add a new column to the phone table named 'phone_status'.
This column does not allow nulls and is a BIT data type
column which means it only accepts 1 character (2 pts)

*/

ALTER TABLE phone ADD phone_status BIT





/* 5
Add a check constraint that makes sure that the
phone number is exactly 7 digits long (HINT: google it) (8 pts)

To check if you set it up correctly run the following:

This insert statements should fail:
Insert into phone values(1,122,33456789,11,1)

This insert statement should be successful:
Insert into phone values (1,214,9247435,11,1)

*/

ALTER TABLE phone ADD CONSTRAINT only_seven_digits_cc
CHECK (len(phone_number)=7)

Insert into phone values(1,122,33456789,11,1)

Insert into phone values (1,214,9247435,11,1)
