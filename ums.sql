-- ER Diagram and SQL Schema for University Management System

-- Entities and Attributes:
-- 1. university
-- 2. department
-- 3. student
-- 4. course
-- 5. instructor
-- 6. enrollment (associative entity for student-course relationship)
-- 7. teaches (associative entity for instructor-course relationship)

-- Table: university
CREATE TABLE university (
    university_id INT PRIMARY KEY,
    university_name VARCHAR(100) NOT NULL,
    university_location VARCHAR(100)
);

-- Table: department
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES university(university_id)
);

-- Table: student
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    enrollment_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Table: course
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_credits INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Table: instructor
CREATE TABLE instructor (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Table: enrollment
CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Table: teaches
CREATE TABLE teaches (
    instructor_id INT,
    course_id INT,
    semester VARCHAR(50),
    year INT,
    PRIMARY KEY (instructor_id, course_id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);
