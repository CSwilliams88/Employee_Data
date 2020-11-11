--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, sal.salary
FROM employees as emp 
INNER JOIN salaries as sal
ON emp.emp_no = sal.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp_1986.first_name, emp_1986.last_name, emp_1986.hire_date 
FROM employees as emp_1986
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, dp.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager as dm
INNER JOIN departments as dp on dm.dept_no = dp.dept_no
INNER JOIN employees as emp on dm.emp_no = emp.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees as emp
INNER JOIN dept_emp as de on emp.emp_no = de.emp_no
INNER JOIN departments as dp on de.dept_no = dp.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees as emp
WHERE first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees as emp
INNER JOIN dept_emp as de on emp.emp_no = de.emp_no
INNER JOIN departments as dp on de.dept_no = dp.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees as emp
INNER JOIN dept_emp as de on emp.emp_no = de.emp_no
INNER JOIN departments as dp on de.dept_no = dp.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "Total For This Name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;