# Employee-Management-System
This project provides a relational database schema for managing employee information, including their departments and salaries. It also includes SQL queries for various operations such as finding recently hired employees, calculating total salary expenditure for departments, and identifying the top-paid employees.


## Table of Contents

- [Introduction](#introduction)
- [Database Schema](#database-schema)
- [Sample Data](#sample-data)
- [SQL Queries](#sql-queries)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)


## Introduction

This project is designed to test the ability to design relational databases, write complex SQL queries, and handle data relationships. The schema includes tables for employees, departments, and salaries.


## Database Schema

The database schema includes the following tables:

### Departments

| Column         | Type   | Description          |
|----------------|--------|----------------------|
| department_id  | INT    | Primary Key          |
| department_name| VARCHAR(255) | Department Name |

### Employees

| Column         | Type   | Description          |
|----------------|--------|----------------------|
| employee_id    | INT    | Primary Key          |
| first_name     | VARCHAR(255) | Employee First Name |
| last_name      | VARCHAR(255) | Employee Last Name |
| department_id  | INT    | Foreign Key (References `departments(department_id)`) |
| hire_date      | DATE   | Hire Date            |

### Salaries

| Column         | Type   | Description          |
|----------------|--------|----------------------|
| employee_id    | INT    | Foreign Key (References `employees(employee_id)`) |
| salary         | DECIMAL(10, 2) | Salary Amount    |
| from_date      | DATE   | Start Date of the Salary |
| to_date        | DATE   | End Date of the Salary  |


## Sample Data

### Departments

| department_id  | department_name |
|----------------|-----------------|
|      1         | Human Resources |
|      2         | Engineering     |
|      3         | Marketing       |
|      4         | Sales           |

### Employees

| employee_id    | first_name      | last_name  | department_id | hire_date |
|----------------|-----------------|------------|---------------|-----------|
|      101       | John            | Doe        | 2             | 2023-06-16 |
|      102       | Jane            | Smith      | 3             | 2023-06-16 |
|      103       | Alice           | Johnson    | 1             | 2021-08-21 |
|      104       | Bob             | Brown      | 2             | 2020-12-05 |
|      105       | Charlie         | Davis      | 4             | 2020-06-17 |

### Salaries

| employee_id    | Salary          | from_date  | to_date       |
|----------------|-----------------|------------|---------------|
|      101       | 80000           | 2023-06-16 | NULL          |
|      102       | 70000           | 2023-06-16 | NULL          |
|      103       | 75000           | 2021-08-21 | NULL          |
|      104       | 90000           | 2020-12-05 | NULL          |
|      105       | 65000           | 2020-06-17 | NULL          |


## SQL Queries

### Query to Find All Employees Hired in the Last Year

```SQL
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
```
### Result

![image](https://github.com/Iammdfaz12/Employee-Management-System/assets/145699767/b908ecde-ddd8-4cb0-8771-65ebc868f3a4)


### Query to Calculate the Total Salary Expenditure for Each Department

```SQL
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;
```

### Result
![image](https://github.com/Iammdfaz12/Employee-Management-System/assets/145699767/61cb0592-c7fa-4e11-a39f-a5f411b4a691)

### Query to Find the Top 5 Highest-Paid Employees Along with Their Department Names

```SQL
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY s.salary DESC
LIMIT 5;
```

### Result

![image](https://github.com/Iammdfaz12/Employee-Management-System/assets/145699767/9bd00b07-9c47-4936-ad06-fc4230adf95b)


# Getting Started

### Prerequisites
- MySQL Server
- MySQL Workbench or any SQL client

# Installation
1. Clone the repository:
```sh
git clone https://github.com/your-username/employee-management-database.git
cd employee-management-database
```
2. Create the database and tables by running the SQL scripts provided in the Employee Management System.sql file.
3. Insert the sample data by running the SQL scripts.

# Usage
1. Connect to your MySQL server using MySQL Workbench or any SQL client.
2. Execute the provided SQL queries to interact with the database.
3. Modify and extend the schema and queries as needed for your use case.

# Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.
# License
This project is licensed under the MIT License.
