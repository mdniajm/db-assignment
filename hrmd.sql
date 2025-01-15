-- SQL File for Human Resource Management Database

-- Table: company
CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    company_location VARCHAR(100)
);

-- Table: department
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

-- Table: employee
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Table: project
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    project_deadline DATE
);

-- Table: job_position
CREATE TABLE job_position (
    position_id INT PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL
);

-- Table: employee_project
CREATE TABLE employee_project (
    employee_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

-- Table: employee_position
CREATE TABLE employee_position (
    employee_id INT,
    position_id INT,
    PRIMARY KEY (employee_id, position_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (position_id) REFERENCES job_position(position_id)
);
