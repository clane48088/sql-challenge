-- Question # 1

-- List the following information:
	--get the employee number (employees table)
	--get the employee last name (employee table)
	--get the employee first name(employee table)
	--get the employee sex (employee table)
	--get the employee salary (salary table)

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.salary;

------------------------------------------------------------------------------------------------------------
-- Question # 2
-- List the following:
	-- first name (employee table)
	-- last name (employee table)
	-- hire date (employee table)
	-- hired in 1986 '1986-01-01' and '1986-12-31'
	
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';

-------------------------------------------------------------------------------------------------------------
-- Question # 3
--List the following:
	-- Manager of each department
	-- department number
	-- department name,
	-- employee number
	-- last name
	-- first name
	
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name || ' ' || e.last_name AS manager_name
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

-------------------------------------------------------------------------------------------------------------
-- Question # 4
-- List the:
	-- Dept # for each employee
	-- Employee #
	-- last name
	-- first name
	-- department name
	
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--------------------------------------------------------------------------------------------------------------
-- Question # 5
	-- List thefollowing:
	-- first name = 'Hercules'(employee table)
	-- last name begins with letter B (employee table)
	-- sex of each employee (employee table)

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' and e.last_name LIKE 'B%';

---------------------------------------------------------------------------------------------------------------

-- Question # 6
	-- List the following:
	-- Each employee in the 'Sales' dept 
	-- Show the emp_no (employee table)
	-- Show the last_name (employee table)
	-- Show the first_name (employee table)

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name, d.dept_no
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
	
---------------------------------------------------------------------------------------------------------------
	
-- Question # 7
	-- List the employees in the 'Sales' dept_no d and 'Development' depts
	-- Show the emp_no (employee table)
	-- last_name (employee table)
	-- first_name (employee table)
	-- dept_name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

----------------------------------------------------------------------------------------------------------------

-- Question # 8
	-- List the frequency counts, in decending order of all the employees LAST names (that is, how many employees 
	-- share the last name)
	
SELECT e.last_name, COUNT(*) AS frequency
FROM employees e
GROUP BY e.last_name
ORDER BY frequency DESC;

----------------------------------------------------------------------------------------------------------------

