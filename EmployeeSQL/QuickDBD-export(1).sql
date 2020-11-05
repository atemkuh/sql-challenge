-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE TITLES (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE EMPLOYEES (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR  NOT NULL,
    "sex" CHAR   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     ),
    CONSTRAINT "fk_TITLES" FOREIGN KEY(emp_title_id)
	  REFERENCES TITLES(title_id)

);

CREATE TABLE DEPARTMENTS (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE DEPARTMENT_EMPLOYEES (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_EMPLOYEES" PRIMARY KEY (
        "emp_no","dept_no"
     ),
     CONSTRAINT "fk_EMPLOYEES_EMP" FOREIGN KEY(emp_no)
     REFERENCES EMPLOYEES(emp_no),
     CONSTRAINT "fk_DEPARTMENT_EMP" FOREIGN KEY(dept_no)
     REFERENCES DEPARTMENTS(dept_no)
);

CREATE TABLE DEPARTMENT_MANAGER (
  "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,

    CONSTRAINT "pk_DEPARTMENT_MANAGER" PRIMARY KEY (
        "emp_no","dept_no"
     ),
    CONSTRAINT "fk_EMPLOYEES" FOREIGN KEY(emp_no)
 	  REFERENCES EMPLOYEES(emp_no),
    CONSTRAINT "fk_DEPARTMENT" FOREIGN KEY(dept_no)
	  REFERENCES DEPARTMENTS(dept_no)
);

CREATE TABLE "SALARIES" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_SALARIES" FOREIGN KEY (
        "emp_no"
     ),
     CONSTRAINT "unique_EMP_NO" UNIQUE ("emp_no")
);


-- ALTER TABLE "TITLES" ADD CONSTRAINT "fk_TITLES_title_id" FOREIGN KEY("title_id")
-- REFERENCES "EMPLOYEES" ("emp_no");
--
-- ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "DEPARTMENT_EMPLOYEES" ("emp_no");
--
-- ALTER TABLE "DEPARTMENT_EMPLOYEES" ADD CONSTRAINT "fk_DEPARTMENT_EMPLOYEES_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "DEPARTMENTS" ("dept_name");
--
-- ALTER TABLE "DEPARTMENT_MANAGER" ADD CONSTRAINT "fk_DEPARTMENT_MANAGER_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "DEPARTMENTS" ("dept_no");
--
-- ALTER TABLE "DEPARTMENT_MANAGER" ADD CONSTRAINT "fk_DEPARTMENT_MANAGER_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "EMPLOYEES" ("emp_no");
--
-- ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "EMPLOYEES" ("emp_no");
--
-- ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_salary" FOREIGN KEY("salary")
-- REFERENCES "EMPLOYEES" ("emp_no");
