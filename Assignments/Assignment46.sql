
-- ==========================================
-- 1. CREATE DATABASE
-- ==========================================

CREATE DATABASE PracticeDB;
USE PracticeDB;

-- ==========================================
-- 2. CREATE FIVE TABLES
-- ==========================================

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(50),
    Age INT,
    City VARCHAR(50),
    Amount DECIMAL(10,2)
);

CREATE TABLE Student (
    StudID INT PRIMARY KEY,
    StudName VARCHAR(50),
    Age INT,
    Marks INT,
    Course VARCHAR(50)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Designation VARCHAR(50)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    Category VARCHAR(50)
);

-- ==========================================
-- 3. INSERT RECORDS
-- ==========================================

INSERT INTO Employee VALUES
(1,'Arun',25,30000,'IT'),
(2,'Kumar',28,45000,'HR'),
(3,'Ravi',30,50000,'IT'),
(4,'Priya',24,25000,'Sales'),
(5,'Divya',27,40000,'Finance');

INSERT INTO Customer VALUES
(1,'Raj',25,'Chennai',5000),
(2,'Ram',30,'Madurai',8000),
(3,'Anu',22,'Chennai',3000),
(4,'John',35,'Coimbatore',10000),
(5,'Meena',28,'Salem',6000);

INSERT INTO Student VALUES
(1,'Arun',20,85,'Java'),
(2,'Kumar',21,75,'Python'),
(3,'Ravi',22,90,'SQL'),
(4,'Priya',20,65,'Java'),
(5,'Divya',21,95,'Python');

INSERT INTO Staff VALUES
(1,'Suresh',35,25000,'Manager'),
(2,'Mani',30,20000,'Developer'),
(3,'Karthik',28,30000,'Trainer'),
(4,'Anitha',32,35000,'HR'),
(5,'Bala',40,40000,'Manager');

INSERT INTO Product VALUES
(1,'Laptop',50000,10,'Electronics'),
(2,'Mobile',20000,15,'Electronics'),
(3,'Keyboard',1000,20,'Accessories'),
(4,'Mouse',500,30,'Accessories'),
(5,'Monitor',12000,8,'Electronics');

-- ==========================================
-- 4. DISPLAY ALL TABLES
-- ==========================================

SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;

-- ==========================================
-- 5. ARITHMETIC OPERATORS
-- + - * / %
-- ==========================================

SELECT EmpName, Salary,
Salary+5000, Salary-5000,
Salary*2, Salary/2, Salary%2
FROM Employee;

SELECT CustName, Amount,
Amount+1000, Amount-500,
Amount*2, Amount/2, Amount%2
FROM Customer;

SELECT StudName, Marks,
Marks+5, Marks-5,
Marks*2, Marks/2, Marks%2
FROM Student;

SELECT StaffName, Salary,
Salary+2000, Salary-1000,
Salary*2, Salary/2, Salary%2
FROM Staff;

SELECT ProductName, Price,
Price+1000, Price-500,
Price*2, Price/2, Price%2
FROM Product;

-- ==========================================
-- 6. COMPARISON OPERATORS
-- = != <> > < >= <=
-- ==========================================

SELECT * FROM Employee WHERE Salary=30000;
SELECT * FROM Employee WHERE Salary!=30000;
SELECT * FROM Employee WHERE Salary<>30000;
SELECT * FROM Employee WHERE Salary>30000;
SELECT * FROM Employee WHERE Salary<40000;
SELECT * FROM Employee WHERE Salary>=30000;
SELECT * FROM Employee WHERE Salary<=40000;

SELECT * FROM Customer WHERE Age=25;
SELECT * FROM Customer WHERE Age!=25;
SELECT * FROM Customer WHERE Age<>25;
SELECT * FROM Customer WHERE Age>25;
SELECT * FROM Customer WHERE Age<30;
SELECT * FROM Customer WHERE Age>=25;
SELECT * FROM Customer WHERE Age<=30;

SELECT * FROM Student WHERE Marks=85;
SELECT * FROM Student WHERE Marks!=85;
SELECT * FROM Student WHERE Marks<>85;
SELECT * FROM Student WHERE Marks>80;
SELECT * FROM Student WHERE Marks<90;
SELECT * FROM Student WHERE Marks>=75;
SELECT * FROM Student WHERE Marks<=90;

SELECT * FROM Staff WHERE Salary=25000;
SELECT * FROM Staff WHERE Salary!=25000;
SELECT * FROM Staff WHERE Salary<>25000;
SELECT * FROM Staff WHERE Salary>25000;
SELECT * FROM Staff WHERE Salary<35000;
SELECT * FROM Staff WHERE Salary>=25000;
SELECT * FROM Staff WHERE Salary<=35000;

SELECT * FROM Product WHERE Price=50000;
SELECT * FROM Product WHERE Price!=50000;
SELECT * FROM Product WHERE Price<>50000;
SELECT * FROM Product WHERE Price>10000;
SELECT * FROM Product WHERE Price<20000;
SELECT * FROM Product WHERE Price>=10000;
SELECT * FROM Product WHERE Price<=20000;

-- ==========================================
-- 7. LOGICAL OPERATORS
-- AND OR NOT
-- ==========================================

SELECT * FROM Employee
WHERE Age>25 AND Salary>30000;

SELECT * FROM Employee
WHERE Department='IT' OR Department='HR';

SELECT * FROM Employee
WHERE NOT Department='IT';

SELECT * FROM Customer
WHERE Age>25 AND Amount>5000;

SELECT * FROM Customer
WHERE City='Chennai' OR City='Salem';

SELECT * FROM Customer
WHERE NOT City='Chennai';

SELECT * FROM Student
WHERE Marks>70 AND Age<22;

SELECT * FROM Student
WHERE Course='Java' OR Course='Python';

SELECT * FROM Student
WHERE NOT Course='Java';

SELECT * FROM Staff
WHERE Age>30 AND Salary>25000;

SELECT * FROM Staff
WHERE Designation='Manager' OR Designation='HR';

SELECT * FROM Staff
WHERE NOT Designation='Manager';

SELECT * FROM Product
WHERE Price>1000 AND Quantity>10;

SELECT * FROM Product
WHERE Category='Electronics' OR Category='Accessories';

SELECT * FROM Product
WHERE NOT Category='Electronics';

-- ==========================================
-- 8. SPECIAL OPERATORS
-- BETWEEN IN NOT IN LIKE IS NULL IS NOT NULL
-- ==========================================

SELECT * FROM Employee
WHERE Salary BETWEEN 25000 AND 45000;

SELECT * FROM Employee
WHERE Department IN ('IT','HR');

SELECT * FROM Employee
WHERE Department NOT IN ('IT','HR');

SELECT * FROM Employee
WHERE EmpName LIKE 'A%';

SELECT * FROM Employee WHERE Department IS NULL;
SELECT * FROM Employee WHERE Department IS NOT NULL;

SELECT * FROM Customer
WHERE Amount BETWEEN 3000 AND 8000;

SELECT * FROM Customer
WHERE City IN ('Chennai','Salem');

SELECT * FROM Customer
WHERE City NOT IN ('Chennai','Salem');

SELECT * FROM Customer
WHERE CustName LIKE 'R%';

SELECT * FROM Customer WHERE City IS NULL;
SELECT * FROM Customer WHERE City IS NOT NULL;

SELECT * FROM Student
WHERE Marks BETWEEN 70 AND 90;

SELECT * FROM Student
WHERE Course IN ('Java','Python');

SELECT * FROM Student
WHERE Course NOT IN ('Java','Python');

SELECT * FROM Student
WHERE StudName LIKE 'A%';

SELECT * FROM Student WHERE Course IS NULL;
SELECT * FROM Student WHERE Course IS NOT NULL;

SELECT * FROM Staff
WHERE Salary BETWEEN 20000 AND 35000;

SELECT * FROM Staff
WHERE Designation IN ('Manager','HR');

SELECT * FROM Staff
WHERE Designation NOT IN ('Manager','HR');

SELECT * FROM Staff
WHERE StaffName LIKE 'S%';

SELECT * FROM Staff WHERE Designation IS NULL;
SELECT * FROM Staff WHERE Designation IS NOT NULL;

SELECT * FROM Product
WHERE Price BETWEEN 500 AND 20000;

SELECT * FROM Product
WHERE Category IN ('Electronics','Accessories');

SELECT * FROM Product
WHERE Category NOT IN ('Electronics');

SELECT * FROM Product
WHERE ProductName LIKE 'M%';

SELECT * FROM Product WHERE Category IS NULL;
SELECT * FROM Product WHERE Category IS NOT NULL;

-- ==========================================
-- 9. STRING FUNCTIONS
-- ==========================================

SELECT UPPER(EmpName), LOWER(EmpName),
LENGTH(EmpName), CONCAT(EmpName,Department),
SUBSTRING(EmpName,1,3),
TRIM(EmpName), REPLACE(EmpName,'a','@')
FROM Employee;

SELECT UPPER(CustName), LOWER(CustName),
LENGTH(CustName), CONCAT(CustName,City),
SUBSTRING(CustName,1,3),
TRIM(CustName), REPLACE(CustName,'a','@')
FROM Customer;

SELECT UPPER(StudName), LOWER(StudName),
LENGTH(StudName), CONCAT(StudName,Course),
SUBSTRING(StudName,1,3),
TRIM(StudName), REPLACE(StudName,'a','@')
FROM Student;

SELECT UPPER(StaffName), LOWER(StaffName),
LENGTH(StaffName), CONCAT(StaffName,Designation),
SUBSTRING(StaffName,1,3),
TRIM(StaffName), REPLACE(StaffName,'a','@')
FROM Staff;

SELECT UPPER(ProductName), LOWER(ProductName),
LENGTH(ProductName), CONCAT(ProductName,Category),
SUBSTRING(ProductName,1,3),
TRIM(ProductName), REPLACE(ProductName,'a','@')
FROM Product;

-- ==========================================
-- 10. NUMERIC FUNCTIONS
-- ==========================================

SELECT ROUND(Salary/3,2),
CEIL(Salary/3000),
FLOOR(Salary/3000),
ABS(-Salary),
MOD(Salary,10000),
POWER(Age,2),
SQRT(Age)
FROM Employee;

SELECT ROUND(Amount/3,2),
CEIL(Amount/3000),
FLOOR(Amount/3000),
ABS(-Amount),
MOD(Amount,1000),
POWER(Age,2),
SQRT(Age)
FROM Customer;

SELECT ROUND(Marks/3,2),
CEIL(Marks/3),
FLOOR(Marks/3),
ABS(-Marks),
MOD(Marks,10),
POWER(Marks,2),
SQRT(Marks)
FROM Student;

SELECT ROUND(Salary/3,2),
CEIL(Salary/3000),
FLOOR(Salary/3000),
ABS(-Salary),
MOD(Salary,10000),
POWER(Age,2),
SQRT(Age)
FROM Staff;

SELECT ROUND(Price/3,2),
CEIL(Price/3000),
FLOOR(Price/3000),
ABS(-Price),
MOD(Price,1000),
POWER(Price,2),
SQRT(Price)
FROM Product;

-- ==========================================
-- 11. AGGREGATE FUNCTIONS
-- COUNT SUM AVG MIN MAX
-- ==========================================

SELECT COUNT(*), SUM(Salary), AVG(Salary),
MIN(Salary), MAX(Salary)
FROM Employee;

SELECT COUNT(*), SUM(Amount), AVG(Amount),
MIN(Amount), MAX(Amount)
FROM Customer;

SELECT COUNT(*), SUM(Marks), AVG(Marks),
MIN(Marks), MAX(Marks)
FROM Student;

SELECT COUNT(*), SUM(Salary), AVG(Salary),
MIN(Salary), MAX(Salary)
FROM Staff;

SELECT COUNT(*), SUM(Price), AVG(Price),
MIN(Price), MAX(Price)
FROM Product;

-- ==========================================
-- 12. DATE AND TIME FUNCTIONS
-- ==========================================

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT CURRENT_TIMESTAMP();
SELECT YEAR(CURDATE());
SELECT MONTH(CURDATE());
SELECT DAY(CURDATE());
SELECT DAYNAME(CURDATE());
SELECT MONTHNAME(CURDATE());
SELECT DATE_ADD(CURDATE(),INTERVAL 7 DAY);
SELECT DATE_SUB(CURDATE(),INTERVAL 7 DAY);

-- ==========================================
-- 13. GENERAL FUNCTIONS
-- ==========================================

SELECT IF(100>50,'YES','NO');
SELECT IFNULL(NULL,'No Value');
SELECT COALESCE(NULL,NULL,'Hello');
SELECT NULLIF(10,10);
SELECT GREATEST(10,20,30);
SELECT LEAST(10,20,30);

-- ==========================================
-- 14. GROUP BY AND HAVING
-- ==========================================

SELECT Department, COUNT(*), AVG(Salary)
FROM Employee
GROUP BY Department;

SELECT Department, AVG(Salary)
FROM Employee
GROUP BY Department
HAVING AVG(Salary)>30000;

SELECT City, COUNT(*), SUM(Amount)
FROM Customer
GROUP BY City;

SELECT City, AVG(Amount)
FROM Customer
GROUP BY City
HAVING AVG(Amount)>4000;

SELECT Course, COUNT(*), AVG(Marks)
FROM Student
GROUP BY Course;

SELECT Course, AVG(Marks)
FROM Student
GROUP BY Course
HAVING AVG(Marks)>75;

SELECT Designation, COUNT(*), AVG(Salary)
FROM Staff
GROUP BY Designation;

SELECT Designation, AVG(Salary)
FROM Staff
GROUP BY Designation
HAVING AVG(Salary)>25000;

SELECT Category, COUNT(*), SUM(Quantity)
FROM Product
GROUP BY Category;

SELECT Category, AVG(Price)
FROM Product
GROUP BY Category
HAVING AVG(Price)>5000;

-- ==========================================
-- 15. ORDER BY
-- ASC AND DESC
-- ==========================================

SELECT * FROM Employee ORDER BY Salary ASC;
SELECT * FROM Employee ORDER BY Salary DESC;

SELECT * FROM Customer ORDER BY Amount ASC;
SELECT * FROM Customer ORDER BY Amount DESC;

SELECT * FROM Student ORDER BY Marks ASC;
SELECT * FROM Student ORDER BY Marks DESC;

SELECT * FROM Staff ORDER BY Salary ASC;
SELECT * FROM Staff ORDER BY Salary DESC;

SELECT * FROM Product ORDER BY Price ASC;
SELECT * FROM Product ORDER BY Price DESC;

-- ==========================================
-- END OF SQL PRACTICE
-- ==========================================
