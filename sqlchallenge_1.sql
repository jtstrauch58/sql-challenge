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
	
select * from employees;

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
select * from table_1986_employees;
select count(hire_date) from table_1986_employees as num_hired_1986;











