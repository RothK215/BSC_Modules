--DATA ANALYSIS--
--(1) List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW Q1 AS
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
FROM Employees AS e 
	INNER JOIN Salaries AS s
	ON (s.emp_no = e.emp_no)
--(2) List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW Q2 AS
SELECT 
	first_name,
	last_name,
	hire_date
FROM Employees
WHERE hire_date >= '1986-01-01' and hire_date < '1987-01-01'

--(3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
CREATE VIEW Q3 AS
SELECT
	d.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
FROM Departments AS d
--Links Departments with Dept_Managers
	JOIN Dept_Managers AS m
	ON (d.dept_no=m.dept_no)
--Links Dept_Managers with Employees
	JOIN Employees AS e
	ON (m.emp_no=e.emp_no)

--(4) List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees AS e
--Links Dept_Employees # with Employee #
	INNER JOIN Dept_Employees AS x
	ON (x.emp_no=e.emp_no)
	INNER JOIN Departments AS d 
	ON (d.dept_no = x.dept_no)
	
--(5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name,
	sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--(6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees AS e
	INNER JOIN Dept_Employees AS x
	ON (e.emp_no = x.emp_no)
	INNER JOIN Departments AS d
	ON (d.dept_no = x.dept_no)
WHERE d.dept_name = 'Sales'

--(7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM Employees AS e
	INNER JOIN Dept_Employees AS x
	ON (e.emp_no = x.emp_no)
	INNER JOIN Departments AS d
	ON (d.dept_no = x.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--(8) List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, 
	COUNT(last_name) AS Frequency
FROM Employees
GROUP BY last_name
ORDER BY Frequency DESC
