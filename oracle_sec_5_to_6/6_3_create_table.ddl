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
    registration_yr DATE NOT NULL,
    email           VARCHAR2(255) NOT NULL,

    parent_info_id NUMBER
);

CREATE TABLE student_attendances (
    work_days_count NUMBER NOT NULL,
    days_off_count NUMBER NOT NULL,
    exam_eligibility VARCHAR2(1),

    student_id NUMBER NOT NULL,
    academic_session_id NUMBER NOT NULL
);

CREATE TABLE academic_sessions (
    id NUMBER NOT NULL,
    session_name VARCHAR2(15) NOT NULL
);

CREATE TABLE courses (
    id NUMBER NOT NULL,
    course_name VARCHAR2(50) NOT NULL,

    aca_ses_id NUMBER NOT NULL,
    dept_id NUMBER NOT NULL,
    login_id VARCHAR2(20),
    building VARCHAR2(10),
    room VARCHAR2(10),
    date_time VARCHAR2(20)
);

CREATE TABLE online_courses (
    login_id VARCHAR2(20) NOT NULL,
    login_password VARCHAR2(20) NOT NULL
);

CREATE TABLE seated_courses (
    building VARCHAR2(10) NOT NULL,
    room VARCHAR2(10) NOT NULL,
    date_time VARCHAR2(20) NOT NULL
);

CREATE TABLE student_course_details (
    grade VARCHAR2(2) NOT NULL,

    student_id NUMBER NOT NULL,
    course_id NUMBER NOT NULL
);

CREATE TABLE exam_results (
    grade VARCHAR2(2) NOT NULL,

    student_id NUMBER NOT NULL,
    exam_id NUMBER NOT NULL
); 

CREATE TABLE exams (
    id NUMBER NOT NULL,
    date_start DATE,

    exam_type VARCHAR2(15)
); 

CREATE TABLE exam_types (
    exam_type VARCHAR2(15) NOT NULL,
    exam_name VARCHAR2(100) NOT NULL,
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
    email           VARCHAR2(255) NOT NULL,
    salary      NUMBER,
    insurance       VARCHAR2(255),
    hourly_rate     NUMBER,
    dept_id     NUMBER NOT NULL
);

CREATE TABLE faculty_course_details (
    contact_hrs VARCHAR2(255) NOT NULL,

    course_id NUMBER NOT NULL,
    faculty_id NUMBER NOT NULL
);

CREATE TABLE faculty_login_details (
    login_date_time DATE NOT NULL,

    faculty_id NUMBER NOT NULL
);
