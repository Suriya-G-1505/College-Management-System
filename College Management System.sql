CREATE DATABASE college;
USE college;
CREATE TABLE departments
(department_id INT PRIMARY KEY,
department_name varchar (100) not null);
CREATE TABLE students (
    student_identifier INT PRIMARY KEY ,
    student_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    department_id INT,
    city VARCHAR(100),
    phone_number VARCHAR(15),
    email_address VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE courses (
    course_identifier INT PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL,
    course_credits INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE staffs(
    staff_id INT PRIMARY KEY ,
    staff_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    phone_number VARCHAR(15),
    email_address VARCHAR(100),
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments VALUES 
(1,'Computer Science'),
(2,'Information Technology'),
(3,'Digital Marketing'),
(4,'Computer Application');
INSERT INTO students VALUES
(1,'Suriya G', 'Male', '2002-08-15', 1, 'Chennai', '9876543210', 'suriya@example.com'),
(2,'Anjali R', 'Female', '2003-01-20', 2, 'Coimbatore', '9823456789', 'anjali@example.com'),
(3,'Karthik M', 'Male', '2002-12-05', 1, 'Madurai', '9812345678', 'karthik@example.com'),
(4,'Deepika S', 'Female', '2003-06-30', 4, 'Salem', '9801234567', 'deepika@example.com');
INSERT INTO courses VALUES
(101, 'Data Structures', 4, 1),
(102, 'Database Management Systems', 3, 1),
(103, 'Network Security', 3, 2),
(104, 'Digital Marketing Basics', 3, 3),
(105, 'Web Programming', 4, 4);
INSERT INTO staffs VALUES
(1, 'Dr. Ravi Kumar', 'Professor', '9898989898', 'ravi.kumar@college.edu', 1),
(2, 'Ms. Priya Sharma', 'Assistant Professor', '9777788888', 'priya.sharma@college.edu', 2),
(3, 'Mr. John D', 'Lecturer', '9666677777', 'john.d@college.edu', 3),
(4, 'Mrs. Latha R', 'HOD', '9555566666', 'latha.r@college.edu', 4);
SELECT 
students.student_name,
departments.department_name
From
students 
JOIN
departments ON students.department_id = departments.department_id;

SELECT 
    courses.course_name,
    courses.course_credits,
    departments.department_name
FROM 
    courses
JOIN 
    departments ON courses.department_id = departments.department_id;

SELECT 
    staff_name,
    designation,
    departments.department_name
FROM 
    staffs
JOIN 
    departments ON staffs.department_id = departments.department_id;

SELECT 
    departments.department_name,
    COUNT(students.student_identifier) AS number_of_students
FROM 
    departments
LEFT JOIN 
    students ON departments.department_id = students.department_id
GROUP BY 
    departments.department_name;

SELECT 
    course_name
FROM 
    courses
JOIN 
    departments ON courses.department_id = departments.department_id
WHERE 
    departments.department_name = 'Computer Science';
    
    SELECT 
    student_name, 
    city 
FROM 
    students 
WHERE 
    city = 'Chennai';

SELECT 
    course_name, 
    course_credits 
FROM 
    courses 
ORDER BY 
    course_credits ASC;
    
    SELECT 
    departments.department_name, 
    COUNT(staffs.staff_id) AS staff_count
FROM 
    staffs
JOIN 
    departments ON staffs.department_id = departments.department_id
GROUP BY 
    departments.department_name;

SELECT 
    staff_name 
FROM 
    staffs 
WHERE 
    staff_name LIKE 'Dr.%';

SELECT 
    student_name, 
    city 
FROM 
    students 
WHERE 
    city IN ('Chennai', 'Coimbatore');
    
    SELECT 
    student_name, 
    date_of_birth 
FROM 
    students 
WHERE 
    date_of_birth BETWEEN '2002-01-01' AND '2003-12-31';

SELECT 
distinct city
from students;
SELECT 
    course_name 
FROM 
    courses 
LIMIT 2;

SELECT 
    student_name 
FROM 
    students 
LIMIT 2 OFFSET 2;

SELECT department_name AS info FROM departments
UNION
SELECT city AS info FROM students;
