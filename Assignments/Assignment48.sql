-- =====================================
-- MYSQL CONSTRAINTS TASK
-- =====================================

-- 1. CREATE DATABASE
CREATE DATABASE ConstraintDB;

USE ConstraintDB;


-- =====================================
-- 2. CREATE STUDENT TABLE
-- =====================================

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50) DEFAULT 'Chennai'
);


-- =====================================
-- 3. CREATE COURSE TABLE
-- =====================================

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    Duration INT CHECK (Duration > 0),
    Fees DECIMAL(10,2) NOT NULL
);


-- =====================================
-- 4. CREATE ENROLLMENT TABLE
-- =====================================

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_student
    FOREIGN KEY (StudentID)
    REFERENCES Student(StudentID),

    CONSTRAINT fk_course
    FOREIGN KEY (CourseID)
    REFERENCES Course(CourseID)
);


-- =====================================
-- 5. INSERT STUDENT RECORDS
-- =====================================

INSERT INTO Student VALUES
(1, 'Arun', 22, 'arun@gmail.com', 'Chennai'),
(2, 'Kumar', 23, 'kumar@gmail.com', 'Madurai'),
(3, 'Ravi', 21, 'ravi@gmail.com', 'Coimbatore'),
(4, 'Priya', 24, 'priya@gmail.com', 'Salem'),
(5, 'Divya', 22, 'divya@gmail.com', 'Chennai');


-- =====================================
-- 6. INSERT COURSE RECORDS
-- =====================================

INSERT INTO Course VALUES
(101, 'Java', 6, 15000),
(102, 'Python', 4, 12000),
(103, 'SQL', 3, 8000),
(104, 'React', 5, 14000),
(105, 'HTML', 2, 5000);


-- =====================================
-- 7. INSERT ENROLLMENT RECORDS
-- =====================================

INSERT INTO Enrollment
(EnrollmentID, StudentID, CourseID)
VALUES
(1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 4, 104),
(5, 5, 105);


-- =====================================
-- 8. DISPLAY ALL TABLES
-- =====================================

SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM Enrollment;


-- =====================================
-- 9. PRIMARY KEY
-- =====================================

DESC Student;


-- =====================================
-- 10. NOT NULL CONSTRAINT
-- =====================================

-- StudentName cannot be NULL

-- Expected error:
-- INSERT INTO Student
-- VALUES (6, NULL, 22, 'test@gmail.com', 'Chennai');


-- =====================================
-- 11. UNIQUE CONSTRAINT
-- =====================================

-- Duplicate email is not allowed

-- Expected error:
-- INSERT INTO Student
-- VALUES (6, 'Mani', 22, 'arun@gmail.com', 'Chennai');


-- =====================================
-- 12. CHECK CONSTRAINT
-- =====================================

-- Age must be 18 or above

-- Expected error:
-- INSERT INTO Student
-- VALUES (6, 'Mani', 15, 'mani@gmail.com', 'Chennai');


-- =====================================
-- 13. DEFAULT CONSTRAINT
-- =====================================

INSERT INTO Student
(StudentID, StudentName, Age, Email)
VALUES
(6, 'Mani', 22, 'mani@gmail.com');

SELECT * FROM Student;


-- =====================================
-- 14. FOREIGN KEY CONSTRAINT
-- =====================================

-- Invalid StudentID is not allowed

-- Expected error:
-- INSERT INTO Enrollment
-- VALUES (6, 100, 101, CURRENT_DATE);


-- =====================================
-- 15. ALTER TABLE CONSTRAINTS
-- =====================================

-- Add UNIQUE constraint

ALTER TABLE Course
ADD CONSTRAINT unique_course_name
UNIQUE (CourseName);


-- Add CHECK constraint

ALTER TABLE Course
ADD CONSTRAINT check_fees
CHECK (Fees > 0);


-- Add NOT NULL constraint

ALTER TABLE Course
MODIFY Fees DECIMAL(10,2) NOT NULL;


-- Add DEFAULT constraint

ALTER TABLE Student
ALTER City SET DEFAULT 'Chennai';


-- =====================================
-- 16. VIEW TABLE STRUCTURE
-- =====================================

DESC Student;

DESC Course;

DESC Enrollment;


-- =====================================
-- 17. SHOW CREATE TABLE
-- =====================================

SHOW CREATE TABLE Student;

SHOW CREATE TABLE Course;

SHOW CREATE TABLE Enrollment;


-- =====================================
-- 18. DROP CONSTRAINTS
-- =====================================

-- Drop UNIQUE constraint

ALTER TABLE Course
DROP INDEX unique_course_name;


-- Drop CHECK constraint

ALTER TABLE Course
DROP CHECK check_fees;


-- Drop FOREIGN KEY constraint

ALTER TABLE Enrollment
DROP FOREIGN KEY fk_student;


-- =====================================
-- 19. FINAL DISPLAY
-- =====================================

SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM Enrollment;
