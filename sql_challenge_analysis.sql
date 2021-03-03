-- Data Analysis

--List of employee number, last name, first name, sex, and salary
create view employee_table as
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no;
select * from employee_table;
select count(emp_no) from employee_table;

-- List first name, last name, and hire date for employees who were hired in 1986
create view table_1986_employees as
select e.first_name, e.last_name, e.hire_date from employees as e
where e.hire_date between '1986-01-01' and '1986-01-31'
order by e.hire_date;
select * from table_1986_employees
limit 10;
select count(hire_date) from table_1986_employees as num_hired_1986;

-- List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.
create view table_managers as
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from departments as d
join dept_manager as dm on dm.dept_no = d.dept_no
join employees as e on dm.emp_no = e.emp_no
order by dm.dept_no;
select * from table_managers;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
order by e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
create view hercules as
select e.first_name, e.last_name, e.sex from employees as e
where e.first_name = 'Hercules'
and e.last_name like 'B%'
order by e.last_name;
select * from hercules;
select count(first_name) from hercules;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.emp_no
limit 10;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.emp_no
limit 10;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "count of shared names" from employees
group by last_name
order by "count of shared names" desc
