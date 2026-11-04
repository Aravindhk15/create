
-- ============================================
-- MYSQL SUBQUERY TASK (Q26 - Q50)
-- ============================================

CREATE DATABASE Subquery_Task;
USE Subquery_Task;

-- ============================================
-- 1. CREATE TABLES
-- ============================================

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_title VARCHAR(50),
    manager_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget DECIMAL(12,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Employee_Projects (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

-- ============================================
-- 2. INSERT SAMPLE DATA
-- ============================================

INSERT INTO Departments VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

INSERT INTO Employees VALUES
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000, 20),
(103, 'Charlie Brown', 'QA Engineer', 105, '2022-06-01', 70000, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000, 20);

INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000, 20),
(502, 'Zeus Initiative', 120000, 20),
(503, 'Global Branding', 85000, 30),
(504, 'CRM Migration', 150000, 40),
(505, 'Talent Acquisition', 30000, 10);

INSERT INTO Employee_Projects VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);


-- ============================================
-- Q26. Employees earning more than company
-- average salary
-- ============================================

SELECT *
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- ============================================
-- Q27. Employees working in Engineering
-- Using subquery without explicit JOIN
-- ============================================

SELECT *
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Departments
    WHERE dept_name = 'Engineering'
);


-- ============================================
-- Q28. Employees working on at least one project
-- ============================================

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT emp_id
    FROM Employee_Projects
);


-- ============================================
-- Q29. Employees NOT working on any project
-- ============================================

SELECT emp_name
FROM Employees
WHERE emp_id NOT IN (
    SELECT emp_id
    FROM Employee_Projects
);


-- ============================================
-- Q30. Project with highest budget
-- ============================================

SELECT *
FROM Projects
WHERE budget = (
    SELECT MAX(budget)
    FROM Projects
);


-- ============================================
-- Q31. Departments with higher-than-average
-- project budget allocation
-- ============================================

SELECT dept_name
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Projects
    GROUP BY dept_id
    HAVING SUM(budget) > (
        SELECT AVG(budget)
        FROM Projects
    )
);


-- ============================================
-- Q32. Employees earning more than maximum
-- Marketing department salary
-- ============================================

SELECT *
FROM Employees
WHERE salary > (
    SELECT MAX(salary)
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Marketing'
    )
);


-- ============================================
-- Q33. Correlated subquery:
-- Employees earning more than their
-- department average salary
-- ============================================

SELECT e.emp_name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.dept_id = e.dept_id
);


-- ============================================
-- Q34. Departments having employees
-- Using EXISTS
-- ============================================

SELECT d.dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.dept_id = d.dept_id
);


-- ============================================
-- Q35. Departments without projects
-- Using NOT EXISTS
-- ============================================

SELECT d.dept_name
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.dept_id = d.dept_id
);


-- ============================================
-- Q36. Employee names with total company payroll
-- Scalar subquery
-- ============================================

SELECT
    emp_name,
    salary,
    (SELECT SUM(salary) FROM Employees) AS total_payroll
FROM Employees;


-- ============================================
-- Q37. Oldest employee(s) based on hire date
-- ============================================

SELECT *
FROM Employees
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employees
);


-- ============================================
-- Q38. Second highest salary
-- ============================================

SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);


-- ============================================
-- Q39. Projects with budget greater than
-- all Sales department projects combined
-- ============================================

SELECT *
FROM Projects
WHERE budget > (
    SELECT SUM(budget)
    FROM Projects
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Sales'
    )
);


-- ============================================
-- Q40. Employees whose manager works
-- in a different department
-- ============================================

SELECT e.emp_name, e.dept_id, e.manager_id
FROM Employees e
WHERE e.manager_id IS NOT NULL
AND e.dept_id <> (
    SELECT m.dept_id
    FROM Employees m
    WHERE m.emp_id = e.manager_id
);


-- ============================================
-- Q41. Department having highest number
-- of employees
-- ============================================

SELECT d.dept_name
FROM Departments d
WHERE d.dept_id IN (
    SELECT dept_id
    FROM Employees
    GROUP BY dept_id
    HAVING COUNT(*) = (
        SELECT MAX(employee_count)
        FROM (
            SELECT COUNT(*) AS employee_count
            FROM Employees
            GROUP BY dept_id
        ) AS department_counts
    )
);


-- ============================================
-- Q42. Employees working on project
-- with longest hours logged
-- ============================================

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT emp_id
    FROM Employee_Projects
    WHERE hours_worked = (
        SELECT MAX(hours_worked)
        FROM Employee_Projects
    )
);


-- ============================================
-- Q43. Departments located in cities
-- starting with New or San
-- Using subquery
-- ============================================

SELECT dept_name, location
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Departments
    WHERE location LIKE 'New%'
       OR location LIKE 'San%'
);


-- ============================================
-- Q44. Employees earning more than any
-- employee hired in 2024
-- ============================================

SELECT *
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE YEAR(hire_date) = 2024
);


-- ============================================
-- Q45. Managers supervising at least
-- 2 employees
-- ============================================

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT manager_id
    FROM Employees
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
    HAVING COUNT(*) >= 2
);


-- ============================================
-- Q46. Projects with budget lower than
-- average project budget
-- ============================================

SELECT project_name, budget
FROM Projects
WHERE budget < (
    SELECT AVG(budget)
    FROM Projects
);


-- ============================================
-- Q47. Employees who are the only ones
-- working on their specific project
-- ============================================

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT ep.emp_id
    FROM Employee_Projects ep
    WHERE (
        SELECT COUNT(*)
        FROM Employee_Projects ep2
        WHERE ep2.project_id = ep.project_id
    ) = 1
);


-- ============================================
-- Q48. Employee salary and difference
-- from department average salary
-- Using subquery in SELECT
-- ============================================

SELECT
    e.emp_name,
    e.salary,
    e.salary - (
        SELECT AVG(e2.salary)
        FROM Employees e2
        WHERE e2.dept_id = e.dept_id
    ) AS salary_difference
FROM Employees e;


-- ============================================
-- Q49. Department(s) with minimum
-- total payroll
-- ============================================

SELECT d.dept_name,
       (
           SELECT SUM(e.salary)
           FROM Employees e
           WHERE e.dept_id = d.dept_id
       ) AS total_payroll
FROM Departments d
WHERE (
    SELECT COALESCE(SUM(e.salary), 0)
    FROM Employees e
    WHERE e.dept_id = d.dept_id
) = (
    SELECT MIN(department_payroll)
    FROM (
        SELECT COALESCE(SUM(salary), 0) AS department_payroll
        FROM Employees
        GROUP BY dept_id
    ) AS payroll_data
);


-- ============================================
-- Q50. Projects having at least one
-- Engineering department employee
-- ============================================

SELECT project_name
FROM Projects
WHERE project_id IN (
    SELECT project_id
    FROM Employee_Projects
    WHERE emp_id IN (
        SELECT emp_id
        FROM Employees
        WHERE dept_id = (
            SELECT dept_id
            FROM Departments
            WHERE dept_name = 'Engineering'
        )
    )
);


-- ============================================
-- END OF SUBQUERY TASK
-- ============================================
