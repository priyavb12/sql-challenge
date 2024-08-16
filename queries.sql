-- List the employee number, last name, first name, sex, and salary of each employee.
 select emp.emp_no,
	 emp.last_name,
	 emp.first_name,
	 emp.sex,
	 sal.salary	 
from employees as emp
	left join salaries as sal
	on emp.emp_no = sal.emp_no
order by emp.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select emp.first_name,
	emp.last_name,
	emp.hire_date 
	from employees as emp
	where hire_date between '1986-01-01' and '1986-12-31';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

select d.dept_no,d.dept_name,dm.emp_no,e.first_name,e.last_name 
	from departments as d 
	inner join dept_manager as dm 
on (d.dept_no = dm.dept_no) inner join
employees as e on (dm.emp_no = e.emp_no)

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no,de.emp_no,d.dept_name,e.first_name,e.last_name
from dept_emp as de
inner join departments as d on (de.dept_no = d.dept_no)
inner join employees as e on (e.emp_no = de.emp_no)

-- List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B.
select e.first_name,e.last_name,e.sex from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'

-- List each employee in the Sales department, including their employee number, 
--last name, and first name.
select e.emp_no,e.last_name,e.first_name,d.dept_name from employees as e
inner join dept_emp as de on (e.emp_no = de.emp_no)
inner join departments as d on (d.dept_no = de.dept_no)
where d.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
	
select e.emp_no,e.first_name,e.last_name, d.dept_name from employees as e
	inner join dept_emp as de on (e.emp_no = de.emp_no)
	inner join departments as d on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales' , 'Development')
order by e.emp_no;

-- List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
select last_name, count(last_name)
	from employees
group by last_name
order by count (last_name) desc;

