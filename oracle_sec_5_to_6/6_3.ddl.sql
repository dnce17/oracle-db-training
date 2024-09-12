CREATE TABLE parent_information (
    id      NUMBER NOT NULL,
    parent1_first_name   VARCHAR2(25) NOT NULL,
    parent1_last_name    VARCHAR2(25) NOT NULL,
    parent2_first_name   VARCHAR2(25) NOT NULL,
    parent2_last_name    VARCHAR2(25) NOT NULL
);

CREATE TABLE students (
    id      NUMBER NOT NULL,
    first_name      VARCHAR2(25) NOT NULL,
    last_name       VARCHAR2(25) NOT NULL,
    registration_yr NUMBER NOT NULL,
    email           VARCHAR2(255) NOT NULL
);

CREATE TABLE student_attendances (
    work_days_count NUMBER NOT NULL,
    days_off_count NUMBER NOT NULL,
    exam_eligibility VARCHAR2(1)
);

CREATE TABLE academic_sessions (
    id NUMBER NOT NULL,
    session_name VARCHAR2(15) NOT NULL
);

CREATE TABLE courses (
    id NUMBER NOT NULL,
    course_name VARCHAR2(15) NOT NULL
);

CREATE TABLE online_courses (
    login_id VARCHAR2(20) NOT NULL,
    login_password VARCHAR2(20) NOT NULL
);

CREATE TABLE seated_courses (
    building VARCHAR2(10) NOT NULL,
    room VARCHAR2(10) NOT NULL,
    date_time DATE NOT NULL
);

CREATE TABLE student_course_details (
    grade VARCHAR2(2) NOT NULL
);

CREATE TABLE exam_results (
    grade VARCHAR2(2) NOT NULL
); 

CREATE TABLE exams (
    id NUMBER NOT NULL,
    date_start DATE 
); 

CREATE TABLE exam_types (
    exam_type VARCHAR2(15) NOT NULL,
    exam_name VARCHAR2(30) NOT NULL,
    exam_description VARCHAR2(255)
);

CREATE TABLE departments (
    id      NUMBER NOT NULL,
    dept_name      VARCHAR2(25) NOT NULL,
    head       VARCHAR2(25) NOT NULL
);

CREATE TABLE faculties (
    id      NUMBER NOT NULL,
    first_name      VARCHAR2(25) NOT NULL,
    last_name       VARCHAR2(25) NOT NULL,
    email           VARCHAR2(255) NOT NULL
);

CREATE TABLE full_time (
    salary NUMBER NOT NULL,
    insurance VARCHAR2(20) NOT NULL
);

CREATE TABLE part_time (
    hourly_rate NUMBER NOT NULL
);

CREATE TABLE faculty_course_details (
    contact_hrs VARCHAR2(255) NOT NULL
);

CREATE TABLE faculty_login_details (
    login_date_time DATE NOT NULL
);