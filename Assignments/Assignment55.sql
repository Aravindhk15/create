CREATE DATABASE cte_practice;
USE cte_practice;


-- ==========================================
-- TABLE 1: EMPLOYEES
-- ==========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1, 'Arun', 'IT', 50000),
(2, 'Bala', 'HR', 30000),
(3, 'Kumar', 'IT', 70000),
(4, 'Priya', 'Finance', 45000),
(5, 'Divya', 'HR', 35000),
(6, 'Ravi', 'Finance', 60000);


-- ==========================================
-- TASK 1: EMPLOYEES WITH SALARY GREATER
-- THAN AVERAGE
-- ==========================================

WITH avg_salary AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT average_salary
    FROM avg_salary
);


-- ==========================================
-- TASK 2: DEPARTMENT-WISE AVERAGE SALARY
-- ==========================================

WITH dept_salary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT department, average_salary
FROM dept_salary;


-- ==========================================
-- TABLE 2: STUDENTS
-- ==========================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(50),
    mark INT
);

INSERT INTO students VALUES
(1, 'Arun', 'Java', 85),
(2, 'Bala', 'Python', 70),
(3, 'Kumar', 'Java', 95),
(4, 'Priya', 'Python', 60),
(5, 'Divya', 'SQL', 90),
(6, 'Ravi', 'SQL', 75);


-- ==========================================
-- TASK 3: STUDENTS WHO SCORED ABOVE AVERAGE
-- ==========================================

WITH average_mark AS (
    SELECT AVG(mark) AS avg_mark
    FROM students
)
SELECT student_name, course, mark
FROM students
WHERE mark > (
    SELECT avg_mark
    FROM average_mark
);


-- ==========================================
-- TABLE 3: PRODUCTS
-- ==========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Mobile', 'Electronics', 18000),
(3, 'TV', 'Electronics', 35000),
(4, 'Washing Machine', 'Home Appliances', 28000),
(5, 'Headphones', 'Accessories', 2500),
(6, 'Refrigerator', 'Home Appliances', 42000);


-- ==========================================
-- TASK 4: HIGH-PRICED PRODUCTS
-- ==========================================

WITH product_data AS (
    SELECT
        product_name,
        category,
        price
    FROM products
)
SELECT product_name, category, price
FROM product_data
WHERE price > 20000;


-- ==========================================
-- TASK 5: CALCULATE EMPLOYEE BONUS
-- ==========================================

WITH employee_bonus AS (
    SELECT
        emp_id,
        emp_name,
        salary,
        salary * 0.10 AS bonus
    FROM employees
)
SELECT
    emp_name,
    salary,
    bonus,
    salary + bonus AS total_salary
FROM employee_bonus;
