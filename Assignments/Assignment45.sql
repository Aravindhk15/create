
-- =====================================
-- 1. CREATE DATABASE
-- =====================================

CREATE DATABASE CompanyDB;
USE CompanyDB;


-- =====================================
-- 2. CREATE 5 TABLES
-- =====================================

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Email VARCHAR(100),
    Marks INT
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    Brand VARCHAR(50)
);


-- =====================================
-- 3. DDL OPERATIONS
-- =====================================

-- ALTER ADD

ALTER TABLE Employee ADD Email VARCHAR(100);
ALTER TABLE Customer ADD Gender VARCHAR(10);
ALTER TABLE Student ADD City VARCHAR(50);
ALTER TABLE Staff ADD Phone VARCHAR(15);
ALTER TABLE Product ADD Description VARCHAR(100);


-- ALTER MODIFY

ALTER TABLE Employee MODIFY Salary DECIMAL(12,2);
ALTER TABLE Customer MODIFY CustomerName VARCHAR(100);
ALTER TABLE Student MODIFY StudentName VARCHAR(100);
ALTER TABLE Staff MODIFY StaffName VARCHAR(100);
ALTER TABLE Product MODIFY ProductName VARCHAR(100);


-- ALTER DROP COLUMN

ALTER TABLE Employee DROP COLUMN Email;
ALTER TABLE Customer DROP COLUMN Gender;
ALTER TABLE Student DROP COLUMN City;
ALTER TABLE Staff DROP COLUMN Phone;
ALTER TABLE Product DROP COLUMN Description;


-- RENAME TABLES

RENAME TABLE Employee TO Employee_Details;
RENAME TABLE Customer TO Customer_Details;
RENAME TABLE Student TO Student_Details;
RENAME TABLE Staff TO Staff_Details;
RENAME TABLE Product TO Product_Details;


-- TRUNCATE TABLES
-- Removes all records but keeps structure

TRUNCATE TABLE Employee_Details;
TRUNCATE TABLE Customer_Details;
TRUNCATE TABLE Student_Details;
TRUNCATE TABLE Staff_Details;
TRUNCATE TABLE Product_Details;


-- DROP TABLES
-- Removes complete tables

DROP TABLE Employee_Details;
DROP TABLE Customer_Details;
DROP TABLE Student_Details;
DROP TABLE Staff_Details;
DROP TABLE Product_Details;


-- =====================================
-- 4. RECREATE TABLES FOR DML
-- =====================================

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Email VARCHAR(100),
    Marks INT
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Experience INT
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    Brand VARCHAR(50)
);


-- =====================================
-- 5. DML OPERATIONS - INSERT
-- =====================================

-- EMPLOYEE

INSERT INTO Employee VALUES
(1,'Arun',25,'IT',30000,'Chennai'),
(2,'Kumar',28,'HR',35000,'Madurai'),
(3,'Ravi',30,'Sales',40000,'Coimbatore'),
(4,'Ajay',26,'IT',32000,'Salem'),
(5,'Vijay',32,'Finance',45000,'Trichy');


-- CUSTOMER

INSERT INTO Customer VALUES
(1,'Aravind','aravind@gmail.com','9876543210','Anna Nagar','Chennai'),
(2,'Bala','bala@gmail.com','9876543211','Gandhipuram','Coimbatore'),
(3,'Charan','charan@gmail.com','9876543212','KK Nagar','Madurai'),
(4,'Deepak','deepak@gmail.com','9876543213','Fairlands','Salem'),
(5,'Ezhil','ezhil@gmail.com','9876543214','Thillai Nagar','Trichy');


-- STUDENT

INSERT INTO Student VALUES
(1,'Ajith',20,'Computer Science','ajith@gmail.com',85),
(2,'Bharath',21,'Commerce','bharath@gmail.com',90),
(3,'Charan',19,'Computer Science','charan@gmail.com',78),
(4,'Dinesh',22,'Mathematics','dinesh@gmail.com',88),
(5,'Eswar',20,'Physics','eswar@gmail.com',92);


-- STAFF

INSERT INTO Staff VALUES
(1,'Anand','Male','IT',25000,2),
(2,'Priya','Female','HR',30000,3),
(3,'Karthik','Male','Sales',28000,4),
(4,'Divya','Female','Finance',35000,5),
(5,'Manoj','Male','IT',32000,3);


-- PRODUCT

INSERT INTO Product VALUES
(1,'Laptop','Electronics',55000,10,'HP'),
(2,'Mobile','Electronics',20000,15,'Samsung'),
(3,'Keyboard','Accessories',1000,25,'Dell'),
(4,'Mouse','Accessories',500,30,'Logitech'),
(5,'Monitor','Electronics',12000,8,'LG');


-- =====================================
-- 6. DML OPERATIONS - UPDATE
-- =====================================

UPDATE Employee
SET Salary = 50000
WHERE EmpID = 1;

UPDATE Customer
SET City = 'Chennai'
WHERE CustomerID = 2;

UPDATE Student
SET Marks = 95
WHERE StudentID = 1;

UPDATE Staff
SET Salary = 40000
WHERE StaffID = 1;

UPDATE Product
SET Price = 60000
WHERE ProductID = 1;


-- =====================================
-- 7. DML OPERATIONS - DELETE
-- =====================================

DELETE FROM Employee
WHERE EmpID = 5;

DELETE FROM Customer
WHERE CustomerID = 5;

DELETE FROM Student
WHERE StudentID = 5;

DELETE FROM Staff
WHERE StaffID = 5;

DELETE FROM Product
WHERE ProductID = 5;


-- =====================================
-- 8. SELECT - DISPLAY ALL TABLES
-- =====================================

SELECT * FROM Employee;

SELECT * FROM Customer;

SELECT * FROM Student;

SELECT * FROM Staff;

SELECT * FROM Product;
