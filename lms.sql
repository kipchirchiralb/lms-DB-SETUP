CREATE TABLE students( 
    student_id INT,
    full_name VARCHAR(30),
    email VARCHAR(30),
    password VARCHAR(255),
    phone_number VARCHAR(15),
    PRIMARY KEY (student_id)
 );

CREATE TABLE courses(
    course_id INT,
    course_name VARCHAR(50),
    course_description TEXT,
    lecturer VARCHAR(50),
    duration_in_months INT,
    PRIMARY KEY (course_id)
);


CREATE TABLE enrollments(
    enrollment_id INT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE resources(
    resource_id INT,
    course_id INT,
    title VARCHAR(50),
    resource_type VARCHAR(20),
    resource_url VARCHAR(255),
    PRIMARY KEY (resource_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- CRUD Operations - Create/INSERT, Read/SELECT, Update/UPDATE, Delete/DELETE DATA FROM THE TABLES

-- create/insert data into courses table
INSERT INTO courses(course_id, course_name, course_description, lecturer, duration_in_months) VALUES
(112, 'Introduction to Programming', 'Learn the basics of programming using Python.', 'Dr. Smith', 3);
INSERT INTO courses(course_id, course_name, course_description, lecturer, duration_in_months) VALUES
(113, 'Data Structures and Algorithms', 'Explore fundamental data structures and algorithms in computer science.', 'Dr. Johnson', 4),
(114, 'Web Development', 'Learn how to build dynamic websites using HTML, CSS, and JavaScript.', 'Dr. Lee', 5),
(115, 'Database Management Systems', 'Understand the principles of database design and management.', 'Dr. Brown', 3);

-- read/select data from courses table
SELECT course_name, lecturer FROM courses;
SELECT * FROM courses WHERE duration_in_months = 3 OR duration_in_months = 4; --- SELECT COURSES THAT RUN FOR 3 OR 4 MONTHS
SELECT * FROM courses WHERE course_description LIKE '%using%';

-- update data in courses table
-- CHANGE LECTURE FOR DATABAES COURSE TO dR. Albert
UPDATE courses SET lecturer = 'Dr. Albert' WHERE course_id = 115;


-- insert into resources table
INSERT INTO resources(resource_id, course_id, title, resource_type, resource_url) VALUES
(201, 112, 'Python Basics', 'Video', 'https://example.com/python-basics');

-- ASSIGNMENTS

-- 1. Insert THREE new students into the students table.
-- 2. Update the email address of ONE student in the students table.
-- 3. ENROLL TWO STUDENTS INTO THE INTRODUCTION TO PROGRAMMING COURSE.

INSERT INTO students(student_id, full_name, email, password, phone_number) VALUES
(4545, 'Alice Johnson', 'alice@eldohub.com', 'passwokjhvjklrd123', '0725551234'),
(4546, 'Bob Smith', 'bob@eldohub.com', 'passwokjhvjklrd123', '0725551235'),
(4547, 'Charlie Brown', 'charlie@eldohub.com', 'passwokjhvjklrd123', '0725551236');

INSERT into enrollments(enrollment_id, student_id, course_id, enrollment_date) VALUES
(301, 4545, 112, '2024-06-01'),
(302, 4546, 112, '2024-06-02'),
(303, 4547, 113, '2024-06-03');


-- Select students enrolled to data structures course
SELECT s.full_name, s.email FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 113;


--- 4. DESIGN A DATABASE FOR YOUR CAPTSTONE PROJECT. CREATE TABLES, DEFINE RELATIONSHIPS, AND PERFORM CRUD OPERATIONS TO MANAGE YOUR DATA EFFECTIVELY. - HAVE ATLEAST TEN RECORD PER TABLE