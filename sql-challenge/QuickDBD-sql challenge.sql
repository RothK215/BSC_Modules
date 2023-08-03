-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/hbAsBI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE Departments
DROP TABLE Dept_Managers
DROP TABLE Dept_Employees
DROP TABLE Employees
DROP TABLE Salaries
DROP TABLE Titles
---------------------------------------
CREATE TABLE Departments (
    dept_no VARCHAR(50)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL)
);

SELECT * FROM Departments
---------------------------------------
CREATE TABLE Dept_Managers (
    dept_no VARCHAR(50)   NOT NULL,
    emp_no VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Dept_Managers PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM Dept_Managers
---------------------------------------
CREATE TABLE Dept_Employees (
    emp_no VARCHAR(50)   NOT NULL,
    dept_no VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Dept_Employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM Dept_Employees
---------------------------------------
CREATE TABLE Employees (
    emp_no VARCHAR(50)   NOT NULL,
    emp_title VARCHAR(50)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(50)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM Employees
---------------------------------------

CREATE TABLE Salaries (
    emp_no VARCHAR(50)   NOT NULL,
    salary MONEY   NOT NULL
);

SELECT * FROM Salaries
---------------------------------------
CREATE TABLE Titles (
    title_id VARCHAR(50)   NOT NULL,
    title" VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

SELECT * FROM Titles
---------------------------------------

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title" FOREIGN KEY("title")
REFERENCES "Employees" ("emp_title");

