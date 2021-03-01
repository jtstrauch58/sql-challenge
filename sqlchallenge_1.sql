-- Create schemas
-- Employee table

drop table employees;

create table employees (
	emp_no int primary key,
	emp_title varchar(50) not null,
	birth_date date not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	sex char(1) not null,
	hire_date date not null
	);
select * from employees
order by hire_date;
select count(emp_no) from employees;


drop table departments;

create table departments(
	dept_no varchar(50) primary key,
	dept_name varchar(50) not null
	);
select * from departments;

drop table emp_dept;

select * from emp_dept;

create table emp_dept(
	emp_no int not null,
	dept_no varchar(50) not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
	);
select * from emp_dept;

drop table dept_manager;

create table dept_manager(
	dept_no varchar(50) not null,
	emp_no int primary key
	);

select * from dept_manager;

create table salaries(
	emp_no int primary key,
	salary int not null
	);

select * from salaries;

create table titles(
	title_id varchar(50) primary key,
	title varchar(50) not null
	);

--List of employee number, last name, first name, sex, and salary
create view employee_table as
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e join salaries as s
on e.emp_no = s.emp_no
order by e.emp_no;
select * from employee_table;

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
select * from table_managers

drop table table_managers_current;

create table table_managers_current as
select dept_no, max(emp_no) as "emp_no" from table_managers
group by dept_no

select * from table_managers_current;

drop table current_managers;
create view current_managers as
select tm.dept_no, d.dept_name, tm.emp_no, e.last_name, e.first_name
from departments as d
join table_managers_current as tm on tm.dept_no = d.dept_no
join employees as e on tm.emp_no = e.emp_no
order by tm.dept_no;
select * from current_managers

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
order by d.dept_name

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
create view hercules as
select e.first_name, e.last_name, e.sex from employees as e
where e.first_name = 'Hercules'
and e.last_name like 'B%'
order by e.last_name;
select count(first_name) from hercules;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.last_name
limit 10;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e join emp_dept on e.emp_no = emp_dept.emp_no
join departments as d on emp_dept.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.last_name
limit 10;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "count of shared names" from employees
group by last_name
order by "count of shared names" desc












