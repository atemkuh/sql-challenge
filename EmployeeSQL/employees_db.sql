CREATE TABLE Titles (
	title_id VARCHAR,
	title VARCHAR
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * from Titles;

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (emp_no)
);
SELECT * from Employees;

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (dept_no)
);
SELECT * from Departments;

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
	dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
SELECT * from Department_Employees;

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
	emp_no int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * from Department_Manager;

CREATE TABLE Salaries (
  	emp_no int   NOT NULL,
	salary INTEGER   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * from Salaries;

--Tables ceated and data imported

-- =========================================================================================================================================================================

--Data analysis ....the following is required

-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.

	select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
	from Employees
	Inner join Salaries ON
	Employees.emp_no = Salaries.emp_no;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.
	select emp_no, first_name, last_name, hire_date from Employees
	where hire_date >= '1985-12-31' and hire_date < '1987-01-01'
	
	
-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
	select 	Departments.dept_no,
			Departments.dept_name,
			Department_Manager.emp_no,
			Employees.last_name,
	   		Employees.first_name
	FROM Department_Manager
	inner join Departments on 
	Departments.dept_no = Departments.dept_no
	inner join Employees on 
	Department_Manager.emp_no = Employees.emp_no;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
	select Employees.emp_no, 
	   Employees.last_name, 
	   Employees.first_name,
	   Departments.dept_name
	from Employees
	inner join Department_Manager on
	Employees.emp_no = Department_Manager.emp_no
	inner join Departments ON
	Department_Manager.dept_no = Departments.dept_no;

-- 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
	select first_name,last_name,sex from Employees
	where first_name = 'Hercules'
	and last_name like 'B%';
	
	
-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
	select e.emp_no, e.last_name, e.first_name, d.dept_name
	from Employees as e
	join Department_Employees on
	e.emp_no = Department_Employees.emp_no
	inner join Departments as d on
	Department_Employees.dept_no = d.dept_no
	where dept_name = 'Sales';
-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.



-- =========
--Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

select * from Employees
	where emp_no = '499942';











