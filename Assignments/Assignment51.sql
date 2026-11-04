
-- ==========================================
-- MYSQL STORED PROCEDURE TASK
-- ALL 10 QUESTIONS - SINGLE FILE
-- ==========================================

-- 1. CREATE DATABASE

CREATE DATABASE CustomerDB;

USE CustomerDB;


-- 2. CREATE TABLE

CREATE TABLE customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Address VARCHAR(200),
    RegisteredDate DATE
);


-- 3. INSERT SAMPLE RECORDS

INSERT INTO customers
(FirstName, LastName, Email, Phone, City, Address, RegisteredDate)
VALUES
('Arun', 'Kumar', 'arun@gmail.com', '9876543210', 'Chennai', 'Anna Nagar', '2025-01-10'),
('Bala', 'Raj', 'bala@gmail.com', '9876543211', 'Madurai', 'KK Nagar', '2025-02-15'),
('Charan', 'Kumar', NULL, '9876543212', 'Chennai', 'Velachery', '2025-03-20'),
('Deepa', 'Devi', 'deepa@gmail.com', '9876543213', 'Coimbatore', 'Gandhipuram', '2025-04-05'),
('Ezhil', 'Raja', NULL, '9876543214', 'Salem', 'Fairlands', '2025-05-12');


-- ==========================================
-- STORED PROCEDURES
-- ==========================================

DELIMITER //


-- QUESTION 1: ADD NEW CUSTOMER

CREATE PROCEDURE AddCustomer(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15),
    IN p_City VARCHAR(50),
    IN p_Address VARCHAR(200),
    IN p_RegisteredDate DATE
)
BEGIN
    INSERT INTO customers
    (FirstName, LastName, Email, Phone, City, Address, RegisteredDate)
    VALUES
    (p_FirstName, p_LastName, p_Email, p_Phone,
     p_City, p_Address, p_RegisteredDate);
END //


-- QUESTION 2: GET CUSTOMER BY CUSTOMER ID

CREATE PROCEDURE GetCustomerByID(
    IN p_CustomerID INT
)
BEGIN
    SELECT *
    FROM customers
    WHERE CustomerID = p_CustomerID;
END //


-- QUESTION 3: UPDATE EMAIL AND PHONE NUMBER

CREATE PROCEDURE UpdateCustomerContact(
    IN p_CustomerID INT,
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15)
)
BEGIN
    UPDATE customers
    SET Email = p_Email,
        Phone = p_Phone
    WHERE CustomerID = p_CustomerID;
END //


-- QUESTION 4: GET CUSTOMERS BY CITY

CREATE PROCEDURE GetCustomersByCity(
    IN p_City VARCHAR(50)
)
BEGIN
    SELECT *
    FROM customers
    WHERE City = p_City;
END //


-- QUESTION 5: DELETE CUSTOMER BY ID

CREATE PROCEDURE DeleteCustomer(
    IN p_CustomerID INT
)
BEGIN
    DELETE FROM customers
    WHERE CustomerID = p_CustomerID;
END //


-- QUESTION 6: GET CUSTOMERS BY DATE RANGE

CREATE PROCEDURE GetCustomersByDateRange(
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    SELECT *
    FROM customers
    WHERE RegisteredDate BETWEEN p_StartDate AND p_EndDate;
END //


-- QUESTION 7: SEARCH CUSTOMER BY PARTIAL NAME

CREATE PROCEDURE SearchCustomer(
    IN p_Search VARCHAR(50)
)
BEGIN
    SELECT *
    FROM customers
    WHERE FirstName LIKE CONCAT('%', p_Search, '%')
       OR LastName LIKE CONCAT('%', p_Search, '%');
END //


-- QUESTION 8: UPDATE ENTIRE CUSTOMER ADDRESS

CREATE PROCEDURE UpdateCustomerAddress(
    IN p_CustomerID INT,
    IN p_Address VARCHAR(200),
    IN p_City VARCHAR(50)
)
BEGIN
    UPDATE customers
    SET Address = p_Address,
        City = p_City
    WHERE CustomerID = p_CustomerID;
END //


-- QUESTION 9: GET TOTAL NUMBER OF CUSTOMERS

CREATE PROCEDURE GetTotalCustomers(
    OUT p_Total INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_Total
    FROM customers;
END //


-- QUESTION 10: GET CUSTOMERS WITHOUT EMAIL

CREATE PROCEDURE GetCustomersWithoutEmail()
BEGIN
    SELECT *
    FROM customers
    WHERE Email IS NULL OR Email = '';
END //


DELIMITER ;


-- ==========================================
-- CALL ALL 10 STORED PROCEDURES
-- ==========================================


-- QUESTION 1
CALL AddCustomer(
    'Karthik',
    'Raj',
    'karthik@gmail.com',
    '9876500000',
    'Chennai',
    'Tambaram',
    '2025-06-10'
);


-- QUESTION 2
CALL GetCustomerByID(1);


-- QUESTION 3
CALL UpdateCustomerContact(
    1,
    'arunnew@gmail.com',
    '9999999999'
);


-- QUESTION 4
CALL GetCustomersByCity('Chennai');


-- QUESTION 5
CALL DeleteCustomer(5);


-- QUESTION 6
CALL GetCustomersByDateRange(
    '2025-01-01',
    '2025-04-30'
);


-- QUESTION 7
CALL SearchCustomer('Ku');


-- QUESTION 8
CALL UpdateCustomerAddress(
    1,
    'T Nagar',
    'Chennai'
);


-- QUESTION 9
CALL GetTotalCustomers(@Total);

SELECT @Total AS TotalCustomers;


-- QUESTION 10
CALL GetCustomersWithoutEmail();


-- ==========================================
-- DISPLAY FINAL CUSTOMER TABLE
-- ==========================================

SELECT * FROM customers;


