--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON salaries.emp_no=employees.emp_no;


--List employees who were hired in 1986.
SELECT emp_no, hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no=e.emp_no
INNER JOIN departments d ON dm.dept_no=d.dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no=e.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees
WHERE (first_name LIKE 'Hercules') AND (last_name LIKE 'B%')

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no=e.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE (d.dept_name LIKE 'Sales');

--List all employees in the Sales and Development departments
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no=e.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE (d.dept_name IN ('Sales','Development'))
ORDER BY e.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as "employee count"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC


