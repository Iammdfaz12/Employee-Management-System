CREATE DATABASE employee_management_system;
USE employee_management_system;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    department_id INT,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date) VALUES
(101, 'John', 'Doe', 2, '2023-06-16'),
(102, 'Jane', 'Smith', 3, '2023-06-16'),
(103, 'Alice', 'Johnson', 1, '2021-08-21'),
(104, 'Bob', 'Brown', 2, '2020-12-05'),
(105, 'Charlie', 'Davis', 4, '2022-06-17');


CREATE TABLE salaries (
    employee_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    PRIMARY KEY (employee_id, from_date)
);
INSERT INTO salaries (employee_id, salary, from_date, to_date) VALUES
(101, 80000, '2023-06-16', NULL),
(102, 70000, '2023-06-16', NULL),
(103, 75000, '2021-08-21', NULL),
(104, 90000, '2020-12-05', NULL),
(105, 65000, '2022-06-17', NULL);


# 1) Write a query to find all employees who have been hired in the last year.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

# 2) Write a query to calculate the total salary expenditure for each department.
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


# 3) Write a query to find the top 5 highest-paid employees along with their department names.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY s.salary DESC
LIMIT 5;

