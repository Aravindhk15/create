
-- ==========================================
-- MYSQL JOIN OPERATIONS - COMPLETE PROGRAM
-- ==========================================

CREATE DATABASE join_practice;
USE join_practice;

-- 1. CREATE TABLES

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);

CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE emp_projects (
    emp_id INT,
    project_id INT
);

CREATE TABLE locations (
    location_id INT,
    dept_id INT,
    city VARCHAR(50)
);

-- 2. INSERT RECORDS

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

INSERT INTO employees VALUES
(1, 'Alice', 1, NULL, 80000),
(2, 'Bob', 1, 1, 60000),
(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),
(5, 'Eva', NULL, 2, 45000);

INSERT INTO projects VALUES
(101, 'Website', 1),
(102, 'Payroll', 3),
(103, 'Recruitment', 2);

INSERT INTO emp_projects VALUES
(1, 101),
(2, 101),
(3, 103),
(4, 102);

INSERT INTO locations VALUES
(1, 1, 'New York'),
(2, 2, 'London'),
(3, 3, 'Tokyo');

-- ==========================================
-- 3. MYSQL JOIN QUERIES
-- ==========================================

-- 1. Employee names with department names
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. All employees including without departments
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 3. All departments even without employees
SELECT d.dept_name, e.emp_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- 4. Employees working on projects
SELECT e.emp_name, p.project_name
FROM employees e
INNER JOIN emp_projects ep
ON e.emp_id = ep.emp_id
INNER JOIN projects p
ON ep.project_id = p.project_id;

-- 5. Employees NOT assigned to projects
SELECT e.emp_name
FROM employees e
LEFT JOIN emp_projects ep
ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;

-- 6. Projects with department names
SELECT p.project_name, d.dept_name
FROM projects p
INNER JOIN departments d
ON p.dept_id = d.dept_id;

-- 7. Employee names with department and city
SELECT e.emp_name, d.dept_name, l.city
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN locations l
ON d.dept_id = l.dept_id;

-- 8. Employees with manager names (SELF JOIN)
SELECT e.emp_name AS Employee,
       m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 9. Departments with no projects
SELECT d.dept_name
FROM departments d
LEFT JOIN projects p
ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;

-- 10. Employees earning more than their manager
SELECT e.emp_name AS Employee,
       e.salary AS Employee_Salary,
       m.emp_name AS Manager,
       m.salary AS Manager_Salary
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- 11. Department-wise employee count
SELECT d.dept_name,
       COUNT(e.emp_id) AS Employee_Count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- 12. Employees without departments
SELECT emp_name
FROM employees
WHERE dept_id IS NULL;

-- 13. Project count per department
SELECT d.dept_name,
       COUNT(p.project_id) AS Project_Count
FROM departments d
LEFT JOIN projects p
ON d.dept_id = p.dept_id
GROUP BY d.dept_id, d.dept_name;

-- 14. Employees working in IT department
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- 15. Employees with project names (if any)
SELECT e.emp_name, p.project_name
FROM employees e
LEFT JOIN emp_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 16. Departments and their locations
SELECT d.dept_name, l.city
FROM departments d
LEFT JOIN locations l
ON d.dept_id = l.dept_id;

-- 17. Employees working in Tokyo
SELECT e.emp_name, l.city
FROM employees e
INNER JOIN locations l
ON e.dept_id = l.dept_id
WHERE l.city = 'Tokyo';

-- 18. Project name with employee count
SELECT p.project_name,
       COUNT(ep.emp_id) AS Employee_Count
FROM projects p
LEFT JOIN emp_projects ep
ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name;

-- 19. Departments having more than 1 employee
SELECT d.dept_name,
       COUNT(e.emp_id) AS Employee_Count
FROM departments d
INNER JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) > 1;

-- 20. Employees with department and project
SELECT e.emp_name,
       d.dept_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN emp_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 21. Employees without managers
SELECT e.emp_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_id IS NULL;

-- 22. All possible employee-project combinations
SELECT e.emp_name, p.project_name
FROM employees e
CROSS JOIN projects p;

-- 23. Employees working in same department as Alice
SELECT emp_name, dept_id
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM employees
    WHERE emp_name = 'Alice'
);

-- 24. FULL OUTER JOIN (MySQL using UNION)
SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id

UNION

SELECT d.dept_id,
       d.dept_name,
       e.emp_id,
       e.emp_name
FROM departments d
RIGHT JOIN employees e
ON d.dept_id = e.dept_id;

-- 25. Departments with employees but no location
SELECT DISTINCT d.dept_name
FROM departments d
INNER JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN locations l
ON d.dept_id = l.dept_id
WHERE l.location_id IS NULL;

-- ==========================================
-- END OF MYSQL JOIN PRACTICE
-- ==========================================
