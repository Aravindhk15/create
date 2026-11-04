
-- ==========================================
-- MYSQL WINDOW FUNCTIONS TASK
-- ==========================================

CREATE DATABASE IF NOT EXISTS sample;
USE sample;

-- ==========================================
-- TABLE CREATION AND SAMPLE DATA
-- ==========================================

-- 1. Students Table
DROP TABLE IF EXISTS students1;

CREATE TABLE students1 (
    id INT,
    class VARCHAR(10),
    name VARCHAR(50),
    marks INT
);

INSERT INTO students1 VALUES
(1, 'A', 'John', 85),
(2, 'A', 'Sara', 92),
(3, 'A', 'Mike', 78),
(4, 'B', 'Anna', 88),
(5, 'B', 'Tom', 90);


-- 2. Exam Table
DROP TABLE IF EXISTS exam1;

CREATE TABLE exam1 (
    student VARCHAR(50),
    subject VARCHAR(20),
    score INT
);

INSERT INTO exam1 VALUES
('Alice', 'Math', 90),
('Bob', 'Math', 90),
('Charlie', 'Math', 85),
('David', 'Science', 88),
('Eva', 'Science', 88);


-- 3. Employees Table
DROP TABLE IF EXISTS employees11;

CREATE TABLE employees11 (
    emp_name VARCHAR(50),
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees11 VALUES
('Alex', 'IT', 7000),
('Brian', 'IT', 7000),
('Chris', 'IT', 6500),
('Diana', 'HR', 6000),
('Eva', 'HR', 5800);


-- 4. Orders Table
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO orders VALUES
(1, '2024-01-01', 100),
(2, '2024-01-02', 200),
(3, '2024-01-03', 150),
(4, '2024-01-04', 300);


-- 5. Monthly Sales Table
DROP TABLE IF EXISTS monthly_sales;

CREATE TABLE monthly_sales (
    month VARCHAR(10),
    sales INT
);

INSERT INTO monthly_sales VALUES
('Jan', 5000),
('Feb', 6000),
('Mar', 5500),
('Apr', 7000);


-- ==========================================
-- WINDOW FUNCTION QUESTIONS AND ANSWERS
-- ==========================================


-- 1. Assign unique row number to students
-- in each class based on highest marks.

SELECT id, class, name, marks,
ROW_NUMBER() OVER (
    PARTITION BY class
    ORDER BY marks DESC, id
) AS row_num
FROM students1;


-- 2. Rank students in each class based on marks
-- WITH GAPS.

SELECT id, class, name, marks,
RANK() OVER (
    PARTITION BY class
    ORDER BY marks DESC
) AS student_rank
FROM students1;


-- 3. Rank students in each class based on marks
-- WITHOUT GAPS.

SELECT id, class, name, marks,
DENSE_RANK() OVER (
    PARTITION BY class
    ORDER BY marks DESC
) AS student_rank
FROM students1;


-- 4. Display average marks of each class
-- along with every student.

SELECT id, class, name, marks,
AVG(marks) OVER (
    PARTITION BY class
) AS average_marks
FROM students1;


-- 5. Show highest marks in each class
-- for every student.

SELECT id, class, name, marks,
MAX(marks) OVER (
    PARTITION BY class
) AS highest_marks
FROM students1;


-- 6. Assign row numbers to students per subject
-- based on score.

SELECT student, subject, score,
ROW_NUMBER() OVER (
    PARTITION BY subject
    ORDER BY score DESC, student
) AS row_num
FROM exam1;


-- 7. Rank students per subject WITH GAPS.

SELECT student, subject, score,
RANK() OVER (
    PARTITION BY subject
    ORDER BY score DESC
) AS student_rank
FROM exam1;


-- 8. Rank students per subject WITHOUT GAPS.

SELECT student, subject, score,
DENSE_RANK() OVER (
    PARTITION BY subject
    ORDER BY score DESC
) AS student_rank
FROM exam1;


-- 9. Show total number of students
-- appearing in each subject.

SELECT student, subject, score,
COUNT(*) OVER (
    PARTITION BY subject
) AS total_students
FROM exam1;


-- 10. Display minimum score for each subject.

SELECT student, subject, score,
MIN(score) OVER (
    PARTITION BY subject
) AS minimum_score
FROM exam1;


-- 11. Assign row numbers to employees
-- per department by salary.

SELECT emp_name, department, salary,
ROW_NUMBER() OVER (
    PARTITION BY department
    ORDER BY salary DESC, emp_name
) AS row_num
FROM employees11;


-- 12. Rank employees per department
-- based on salary.

SELECT emp_name, department, salary,
RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS employee_rank
FROM employees11;


-- 13. Rank employees per department WITHOUT GAPS.

SELECT emp_name, department, salary,
DENSE_RANK() OVER (
    PARTITION BY department
    ORDER BY salary DESC
) AS employee_rank
FROM employees11;


-- 14. Show total salary paid in each department.

SELECT emp_name, department, salary,
SUM(salary) OVER (
    PARTITION BY department
) AS total_salary
FROM employees11;


-- 15. Display average salary of each department.

SELECT emp_name, department, salary,
AVG(salary) OVER (
    PARTITION BY department
) AS average_salary
FROM employees11;


-- 16. Assign row numbers based on order date.

SELECT order_id, order_date, amount,
ROW_NUMBER() OVER (
    ORDER BY order_date, order_id
) AS row_num
FROM orders;


-- 17. Calculate running total of order amounts.

SELECT order_id, order_date, amount,
SUM(amount) OVER (
    ORDER BY order_date, order_id
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
) AS running_total
FROM orders;


-- 18. Calculate moving average of last 2 orders
-- (current order and previous order).

SELECT order_id, order_date, amount,
AVG(amount) OVER (
    ORDER BY order_date, order_id
    ROWS BETWEEN 1 PRECEDING
    AND CURRENT ROW
) AS moving_average
FROM orders;


-- 19. Show maximum order amount till current row.

SELECT order_id, order_date, amount,
MAX(amount) OVER (
    ORDER BY order_date, order_id
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
) AS maximum_amount
FROM orders;


-- 20. Display total number of orders.

SELECT order_id, order_date, amount,
COUNT(*) OVER () AS total_orders
FROM orders;


-- 21. Assign row numbers based on month.

SELECT month, sales,
ROW_NUMBER() OVER (
    ORDER BY FIELD(month,
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    )
) AS row_num
FROM monthly_sales;


-- 22. Show previous month's sales.

SELECT month, sales,
LAG(sales) OVER (
    ORDER BY FIELD(month,
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    )
) AS previous_month_sales
FROM monthly_sales;


-- 23. Show next month's sales.

SELECT month, sales,
LEAD(sales) OVER (
    ORDER BY FIELD(month,
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    )
) AS next_month_sales
FROM monthly_sales;


-- 24. Calculate difference from previous month's sales.

SELECT month, sales,
sales - LAG(sales) OVER (
    ORDER BY FIELD(month,
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    )
) AS sales_difference
FROM monthly_sales;


-- 25. Calculate cumulative sales.

SELECT month, sales,
SUM(sales) OVER (
    ORDER BY FIELD(month,
        'Jan', 'Feb', 'Mar', 'Apr',
        'May', 'Jun', 'Jul', 'Aug',
        'Sep', 'Oct', 'Nov', 'Dec'
    )
    ROWS BETWEEN UNBOUNDED PRECEDING
    AND CURRENT ROW
) AS cumulative_sales
FROM monthly_sales;


-- ==========================================
-- END OF WINDOW FUNCTIONS TASK
-- ==========================================
