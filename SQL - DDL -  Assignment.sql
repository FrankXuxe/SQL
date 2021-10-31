-- 1) Create each of the four tables from this Data Dictionary.  Download Data Dictionary.Build it according to the exact specifications listed in the spreadsheet. (10 points for each table, 40 pts total). Insert the following record in the Patient table to make sure it was set up correctly:
CREATE TABLE Patient
(patientID	smallint NOT NULL,
fname VARCHAR (50) NOT NULL,
lname VARCHAR (50) NOT NULL,
dob		date NOT NULL,
address VARCHAR (50),
city	VARCHAR (50) NOT NULL,
email	VARCHAR (100)

CONSTRAINT patientID_pk PRIMARY KEY (patientID)

)

CREATE TABLE Provider
(providerID		smallint NOT NULL,
providerSpeciality	VARCHAR (100) NOT NULL,
certification	bit

CONSTRAINT providerID_pk PRIMARY KEY (providerID)

)

CREATE TABLE Visit
(visitID	smallint NOT NULL,
visitdate	DATETIME NOT NULL,
patientID	smallint NOT NULL

CONSTRAINT visitID_pk PRIMARY KEY (visitID)
CONSTRAINT patientID_fk FOREIGN KEY (patientID) REFERENCES Patient(patientID)

)

CREATE TABLE VisitProvider
(visitID	smallint NOT NULL,
providerID	smallint NOT NULL,
diagnosis	VARCHAR (200) NOT NULL

CONSTRAINT visitproviderID_pk PRIMARY KEY (visitID, providerID),
CONSTRAINT visitID_fk FOREIGN KEY (visitID) REFERENCES Visit(visitID),
CONSTRAINT providerID_fk FOREIGN KEY (providerID) REFERENCES Provider(providerID)

)

INSERT INTO Patient
VALUES (100,'John','Doe','01/01/2001','123 Main St','Waco','johndoe@test.com')

select * from Patient

-- 2) Create a table called patient_copy that has only the structure of the patient table. Add 2 columns to this table - "state"
-- and "date_joined" based on the following specs (20 points):
SELECT TOP 0 * INTO patient_copy FROM Patient
ALTER TABLE patient_copy ADD  state VARCHAR(2) DEFAULT 'TX'
ALTER TABLE patient_copy ADD  date_joined DATE

select * from patient_copy
-- 3) Change the length of the column address in the table patient_copy from 50 to 200 and make sure it does not allow null values. (5 points) --

ALTER TABLE patient_copy ALTER COLUMN address VARCHAR(200) NOT NULL


-- 4) drop the email column from the table patient_copy (5 points) --

ALTER TABLE patient_copy DROP Column email

/* 5) Create a copy of the Visit table (structure only, no data) and name it CHRISTMAS_VISIT. In this table, You can ONLY process visits
that will occur during Christmas break (12/15 - 12/30). Create a check constraint that will allow visits ONLY during those days. Make sure you don't make Year as part of your constraint since it will be a policy every year. After creating the constraint, validate that it is working correctly by
running the following 2 commands. The first one should fail and you should get an error saying "The INSERT statement conflicted with the
CHECK constraint.....". The second one should be successful since it has a valid date.

insert into christmas_visit values (1011,'1/26/2018',100)

insert into spring_break_orders values (1011,'12/18/2019',100)

(30 points)   */

SELECT TOP 0 * INTO CHRISTMAS_VISIT FROM Visit
ALTER TABLE CHRISTMAS_VISIT ADD CONSTRAINT only_chrismas_visit_cc
CHECK (day(visitdate) < 31 AND day(visitdate) >14 AND month(visitdate) = 12) 

insert into christmas_visit values (1011,'1/26/2018',100)

insert into CHRISTMAS_VISIT values (1011,'12/18/2019',100)

select * from CHRISTMAS_VISIT