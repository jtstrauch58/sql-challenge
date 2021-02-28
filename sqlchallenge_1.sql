-- Create schemas
-- Employee table

drop table employees;

create table employees (
	emp_no int primary key,
	emp_title varchar(50) not null,
	birth_date date not null,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	sex char(1),
	hire_date date not null
	);
	
select * from employees;

create table departments(
	dept_no varchar(50) primary key,
	dept_name varchar(50) not null
);
select * from departments;

