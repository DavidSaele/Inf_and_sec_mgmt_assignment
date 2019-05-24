DROP DATABASE IF EXISTS university;
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Create tables
CREATE TABLE student (
student_ID CHAR(3) NOT NULL,
first_name CHAR(20) NOT NULL,
last_name CHAR(20) NOT NULL,
dob DATE NOT NULL,
sex CHAR(1) NOT NULL,
phone DECIMAL (6) NOT NULL,
PRIMARY KEY (student_ID)
);

CREATE TABLE academic_staff (
staff_ID CHAR (3) NOT NULL,
first_name CHAR(20) NOT NULL,
last_name CHAR(20) NOT NULL,
position CHAR(20) NOT NULL,
dob DATE NOT NULL,
sex CHAR(1) NOT NULL,
phone CHAR(10) NOT NULL,
PRIMARY KEY (staff_ID)
);

CREATE TABLE admin_staff (
staff_ID CHAR (3) NOT NULL,
first_name CHAR(20) NOT NULL,
last_name CHAR(20) NOT NULL,
duty CHAR(20) NOT NULL,
PRIMARY KEY (staff_ID)
);

CREATE TABLE course (
course_ID CHAR (6) NOT NULL,
course_name CHAR (40) NOT NULL,
convenor CHAR (20) NOT NULL,
staff_ID CHAR (3) NOT NULL,
trimester CHAR (5) NOT NULL,
campus CHAR (6) NOT NULL,
PRIMARY KEY (course_ID),
FOREIGN KEY (staff_ID) REFERENCES academic_staff(staff_ID)
);

CREATE TABLE enrolment (
enrolment_ID CHAR (3) NOT NULL,
course_ID CHAR (6) NOT NULL,
student_ID CHAR (3) NOT NULL,
student_name CHAR (40) NOT NULL,
year YEAR NOT NULL,
trimester  DECIMAL (1) NOT NULL,
campus CHAR (2) NOT NULL,
PRIMARY KEY (enrolment_ID),
FOREIGN KEY (student_ID) REFERENCES student(student_ID),
FOREIGN KEY (course_ID) REFERENCES course(course_ID)
);

CREATE TABLE grade (
enrolment_ID CHAR (3) NOT NULL,
student_ID CHAR (3) NOT NULL,
score  DECIMAL(3) NOT NULL,
grade_number  DECIMAL(1) NOT NULL,
PRIMARY KEY (enrolment_ID ),
FOREIGN KEY (enrolment_ID) REFERENCES enrolment(enrolment_ID),
FOREIGN KEY (student_ID) REFERENCES enrolment(student_ID)
);


-- Insert Data

-- student
INSERT INTO student VALUES ('s01', 'Angela', 'Merkal', '1991-01-01', 'F', '543210');
INSERT INTO student VALUES ('s02', 'Donaldo', 'True', '1992-02-02', 'M', '123456');
INSERT INTO student VALUES ('s03', 'Hillarious', 'Blinton', '1993-03-03', 'F', '112233');
INSERT INTO student VALUES ('s04', 'Tarra', 'Obana', '1994-04-04', 'M', '221134');


-- academic_staff 
INSERT INTO academic_staff VALUES ('a01', 'Seb', 'Binary', 'Professor', '1986-09-12', 'M', '0755527076');
INSERT INTO academic_staff VALUES ('a02', 'Jazz', 'Wood', 'Asso. Professor', '1976-10-10', 'M', '0754427099');
INSERT INTO academic_staff VALUES ('a03', 'Miguel', 'Franco', 'Lecturer', '1990-05-12', 'M', '0752270933');


-- admin_staff
INSERT INTO admin_staff VALUES ('f01', 'Cristiano', 'Penaldo', 'Enrolment');
INSERT INTO admin_staff VALUES ('f02', 'Lionel', 'Missy', 'Courses');


-- course
INSERT INTO course VALUES ('101ICT', 'Information Management', 'Seb Binary', 'a01', '1,2', 'GC');
INSERT INTO course VALUES ('102ICT', 'Object Oriented Programming', 'Jazz Wood', 'a02', '2', 'NA');
INSERT INTO course VALUES ('101STA', 'Statistics', 'Jazz Wood', 'a02', '2', 'GC, NA');
INSERT INTO course VALUES ('101CS', 'Data Analytics', 'Seb Binary', 'a01', '1', 'GC');
INSERT INTO course VALUES ('102CS', 'Information Retrieval', 'Miguel Franco', 'a03', '1,3', 'GC');


-- enrolment
INSERT INTO enrolment VALUES ('e01', '101ICT', 's01', 'Angela Merkal', '2017', '1', 'GC');
INSERT INTO enrolment VALUES ('e02', '101STA', 's01', 'Angela Merkal', '2017', '1', 'GC');
INSERT INTO enrolment VALUES ('e03', '101CS', 's01', 'Angela Merkal', '2017', '1', 'GC');
INSERT INTO enrolment VALUES ('e04', '102ICT', 's02', 'Donaldo True', '2018', '2', 'NA');
INSERT INTO enrolment VALUES ('e05', '101CS', 's02', 'Donaldo True', '2017', '1', 'GC');
INSERT INTO enrolment VALUES ('e06', '102CS', 's03', 'Hillarious Blinton', '2018', '3', 'GC');
INSERT INTO enrolment VALUES ('e07', '102ICT', 's04', 'Tarra Obana', '2018', '2', 'NA');
INSERT INTO enrolment VALUES ('e08', '101STA', 's04', 'Tarra Obana', '2017', '1', 'NA');
INSERT INTO enrolment VALUES ('e09', '101CS', 's04', 'Tarra Obana', '2017', '1', 'GC');
INSERT INTO enrolment VALUES ('e10', '102CS', 's04', 'Tarra Obana', '2018', '1', 'GC');


-- grade
INSERT INTO grade VALUES ('e01', 's01', '75', '6');
INSERT INTO grade VALUES ('e02', 's01', '80', '6');
INSERT INTO grade VALUES ('e03', 's01', '92', '7');
INSERT INTO grade VALUES ('e04', 's02', '86', '7');
INSERT INTO grade VALUES ('e05', 's02', '71', '5');
INSERT INTO grade VALUES ('e06', 's03', '65', '5');
INSERT INTO grade VALUES ('e07', 's04', '55', '4');
INSERT INTO grade VALUES ('e08', 's04', '80', '6');
INSERT INTO grade VALUES ('e09', 's04', '80', '6');
INSERT INTO grade VALUES ('e10', 's04', '86', '7');


-- users
CREATE USER 'Angela'@'%' IDENTIFIED BY '1';
CREATE USER 'Donaldo'@'%' IDENTIFIED BY 'main123';
CREATE USER 'Hillarious'@'%' IDENTIFIED BY '626';
CREATE USER 'Tarra'@'%' IDENTIFIED BY '1234';

CREATE USER 'Seb'@'%' IDENTIFIED BY 's03';
CREATE USER 'Jazz'@'%' IDENTIFIED BY 'JazzHands';
CREATE USER 'Miguel'@'%' IDENTIFIED BY 'Franco';

CREATE USER 'Cristiano'@'%' IDENTIFIED BY '!island5432';
CREATE USER 'Lionel'@'%' IDENTIFIED BY 'GreenLion12';


-- views
CREATE VIEW names_gender AS SELECT first_name, last_name, sex 
FROM university.student;


CREATE VIEW angela_grades AS SELECT student_ID, score, grade_number 
FROM university.grade WHERE student_ID = 's01';

CREATE VIEW donaldo_grades AS SELECT student_ID, score, grade_number 
FROM university.grade WHERE student_ID = 's02';

CREATE VIEW hillarious_grades AS SELECT student_ID, score, grade_number 
FROM university.grade WHERE student_ID = 's03';

CREATE VIEW tarra_grades AS SELECT student_ID, score, grade_number 
FROM university.grade WHERE student_ID = 's04';


CREATE VIEW seb_course AS SELECT c.course_ID, e.enrolment_ID, e.student_ID, 
e.student_name, e.year, e.trimester, e.campus FROM university.course c, university.enrolment e 
WHERE c.course_ID = e.course_ID AND c.staff_ID = 'a01';    

CREATE VIEW jazz_course AS SELECT c.course_ID, e.enrolment_ID, e.student_ID,
e.student_name, e.year, e.trimester, e.campus FROM university.course c, university.enrolment e 
WHERE c.course_ID = e.course_ID AND c.staff_ID = 'a02';    

CREATE VIEW miguel_course AS SELECT c.course_ID, e.enrolment_ID, e.student_ID, e.student_name, 
e.year, e.trimester, e.campus FROM university.course c, university.enrolment e 
WHERE c.course_ID = e.course_ID AND c.staff_ID = 'a03';    


CREATE VIEW seb_modify_grades AS SELECT e.course_ID, e.student_ID, e.student_name, 
e.year, e.trimester, e.campus,  g.score, g.grade_number 
FROM university.grade g, university.enrolment e, university.course c 
WHERE g.enrolment_ID = e.enrolment_ID AND e.course_ID = c.course_ID AND c.staff_ID = 'a01';

CREATE VIEW jazz_modify_grades AS SELECT e.course_ID, e.student_ID, e.student_name, 
e.year, e.trimester, e.campus,  g.score, g.grade_number 
FROM university.grade g, university.enrolment e, university.course c 
WHERE g.enrolment_ID = e.enrolment_ID AND e.course_ID = c.course_ID AND c.staff_ID = 'a02';

CREATE VIEW miguel_modify_grades AS SELECT e.course_ID, e.student_ID, e.student_name, 
e.year, e.trimester, e.campus,  g.score, g.grade_number 
FROM university.grade g, university.enrolment e, university.course c 
WHERE g.enrolment_ID = e.enrolment_ID AND e.course_ID = c.course_ID AND c.staff_ID = 'a03';


-- privileges
GRANT ALL PRIVILEGES ON university.enrolment TO 'Cristiano'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON university.course TO 'Lionel'@'%' WITH GRANT OPTION;
GRANT SELECT ON university.course TO 'Angela'@'%', 'Donaldo'@'%', 'Hillarious'@'%', 
'Tarra'@'%', 'Seb'@'%', 'Jazz'@'%', 'Miguel'@'%';
GRANT SELECT ON university.names_gender TO 'Seb'@'%', 'Jazz'@'%', 'Miguel'@'%';


GRANT SELECT ON university.angela_grades TO 'Angela'@'%';
GRANT SELECT ON university.donaldo_grades TO 'Donaldo'@'%';
GRANT SELECT ON university.hillarious_grades TO 'Hillarious'@'%';
GRANT SELECT ON university.tarra_grades TO 'Tarra'@'%';


GRANT SELECT ON university.seb_course TO 'Seb'@'%';
GRANT SELECT ON university.jazz_course TO 'Jazz'@'%';
GRANT SELECT ON university.miguel_course TO 'Miguel'@'%';


GRANT SELECT, UPDATE (score, grade_number) ON university.seb_modify_grades TO 'Seb'@'%';
GRANT SELECT, UPDATE (score, grade_number) ON university.jazz_modify_grades TO 'Jazz'@'%';
GRANT SELECT, UPDATE (score, grade_number) ON university.miguel_modify_grades TO 'Miguel'@'%';

-- end






