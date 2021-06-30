-- 1. Salary by employee
SELECT e.emp_no, 
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e
	LEFT JOIN salaries AS s
		on (e.emp_no = s.emp_no)
ORDER BY e.emp_no;

-- 2. Employees hired in 1986
SELECT first_name, 
	last_name, 
	hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. Manager of each Department
SELECT dm.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no);
		
-- 4. Department of each Employee
SELECT 	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;

-- 5. Employees First Name Hercules and Last name starts with B
SELECT first_name,
	last_name, 
	sex
FROM employees
where first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- 6. Employees in Sales department
SELECT e.emp_no,
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7. Employees in Sales and Development
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- 8. Frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
