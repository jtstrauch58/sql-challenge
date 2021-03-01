-- Create employee table

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

-- Create department table

drop table departments;

create table departments(
	dept_no varchar(50) primary key,
	dept_name varchar(50) not null
	);
select * from departments;

-- Create employee - department table

drop table emp_dept;

select * from emp_dept;

create table emp_dept(
	emp_no int not null,
	dept_no varchar(50) not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
	);
select * from emp_dept;

-- Create department manager table

drop table dept_manager;

create table dept_manager(
	dept_no varchar(50) not null,
	emp_no int primary key
	);

select * from dept_manager;

-- Create salaries table

create table salaries(
	emp_no int primary key,
	salary int not null
	);

select * from salaries;

-- Create employee title table

create table titles(
	title_id varchar(50) primary key,
	title varchar(50) not null
	);