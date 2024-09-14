-- Purpose: insert records into tables

-- Academic Sessions
-- NOTE: usual shorthand to insert multiple rows at once does not work in 
-- Oracle, but Oracle provides INSERT ALL, which will require SELECT * FROM dual to work
INSERT ALL
    INTO academic_sessions VALUES (100, 'SPRING SESSION')
    INTO academic_sessions VALUES (200, 'FALL SESSION')
    INTO academic_sessions VALUES (300, 'SUMMER SESSION')
SELECT * FROM dual;

-- Departments
INSERT ALL
    INTO departments VALUES (10, 'ACCOUNTING', 'MARK SMITH')
    INTO departments VALUES (20, 'BIOLOGY', 'DAVE GOLD')
    INTO departments VALUES (30, 'COMPUTER SCIENCE', 'LINDA BROWN')
    INTO departments VALUES (40, 'LITERATURE', 'ANITA TAYLOR')
SELECT * FROM dual;

-- Parent Info
ALTER TABLE parent_information READ WRITE;
INSERT ALL
    INTO parent_information VALUES (600, 'NEIL', 'SMITH', 'DORIS', 'SMITH')
    INTO parent_information VALUES (610, 'WILLIAM', 'BEN', 'NITA', 'BEN')
    INTO parent_information VALUES (620, 'SEAN', 'TAYLOR', 'RHEA', 'TAYLOR')
    INTO parent_information VALUES (630, 'DAVE', 'CARMEN', 'CATHY', 'CARMEN')
    INTO parent_information VALUES (640, 'JOHN', 'AUDRY', 'JANE', 'AUDRY')
SELECT * FROM dual;

-- Students
INSERT ALL
    INTO students VALUES ('720', 'JACK', 'SMITH', TO_DATE('01-Jan-2012', 'DD-MON-YYYY'), 'JSMITH@SCHOOL.EDU', '600')
    INTO students VALUES ('730', 'NOAH', 'AUDRY', TO_DATE('01-Jan-2012', 'DD-MON-YYYY'), 'NAUDRY@SCHOOL.EDU', '640')
    INTO students VALUES ('740', 'RHONDA', 'TAYLOR', TO_DATE('01-Sep-2012', 'DD-MON-YYYY'), 'RTAYLOR@SCHOOL.EDU', '620')
    INTO students VALUES ('750', 'ROBERT', 'BEN', TO_DATE('01-Mar-2012', 'DD-MON-YYYY'), 'RBEN@SCHOOL.EDU', '610')
    INTO students VALUES ('760', 'JEANNE', 'BEN', TO_DATE('01-Mar-2012', 'DD-MON-YYYY'), 'JBEN@SCHOOL.EDU', '610')
    INTO students VALUES ('770', 'MILLS', 'CARMEN', TO_DATE('01-Apr-2013', 'DD-MON-YYYY'), 'MCARMEN@SCHOOL.EDU', '630')
SELECT * FROM dual;

-- Courses, Seated, Online
-- Seated and online must have records put into it first b/c course has some of these attr as foreign keys
-- seated
INSERT ALL
    INTO seated_courses VALUES ('A', 101, 'MWF 12-1')
    INTO seated_courses VALUES ('B', 201, 'THUR 2-4')
    INTO seated_courses VALUES ('C', 301, 'TUES 5-7')
    INTO seated_courses VALUES ('D', 401, 'MWF 9-10')
SELECT * FROM dual;

-- online
INSERT ALL
    INTO online_courses VALUES ('TAX123', 'PASSWORD')
    INTO online_courses VALUES ('BIO123', 'PASSWORD')
SELECT * FROM dual;

-- courses w/ filled columns that indicate seated
INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    building,
    room,
    date_time
)
VALUES (195, 'CELL BIOLOGY', 200, 20, 'D', 401, 'MWF 9-10');

INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    building,
    room,
    date_time
)
VALUES (190, 'PRINCIPLES OF ACCOUNTING', 100, 10, 'A', 101, 'MWF 12-1');

INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    building,
    room,
    date_time
)
VALUES (191, 'INTRODUCTION TO BUSINESS LAW', 100, 10, 'B', 201, 'THUR 2-4');

INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    building,
    room,
    date_time
)
VALUES (192, 'COST ACCOUNTING', 100, 10, 'C', 301, 'TUES 5-7');

-- courses w/ filled columns that indicate online
INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    login_id
)
VALUES (193, 'STRATEGIC TAX PLANNING FOR BUSINESS', 100, 10, 'TAX123');

INSERT INTO courses (
    id, 
    course_name,
    aca_ses_id,
    dept_id,
    login_id
)
VALUES (194, 'GENERAL BIOLOGY', 200, 20, 'BIO123');

-- Faculties
INSERT INTO faculties
VALUES (800, 'JILL', 'MILLER', 'JMILL@SCHOOL.EDU', 10000, 'HEALTH', NULL, 20);

INSERT INTO faculties
VALUES (810, 'JAMES', 'BORG', 'JBORG@SCHOOL.EDU', 30000, 'HEALTH,DENTAL', NULL, 10);

INSERT INTO faculties
VALUES (820, 'LYNN', 'BROWN', 'LBROWN@SCHOOL.EDU', NULL, NULL, 50, 30);

INSERT INTO faculties
VALUES (830, 'ARTHUR', 'SMITH', 'ASMITH@SCHOOL.EDU', NULL, NULL, 40, 10);

INSERT INTO faculties
VALUES (840, 'SALLY', 'JONES', 'SJONES@SCHOOL.EDU', 50000, 'HEALTH,DENTAL,VISION', NULL, 40);

-- Exam Types
INSERT ALL
    INTO exam_types VALUES ('MCE', 'Multiple Choice Exams', 'CHOOSE MORE THAN ONE ANSWER')
    INTO exam_types VALUES ('TF', 'TRUE AND FALSE Exams', 'CHOOSE EITHER TRUE OR FALSE')
    INTO exam_types VALUES ('ESS', 'ESSAY Exams', 'WRITE PARAGRAPHS')
    INTO exam_types VALUES ('SA', 'SHORT ANSWER Exams', 'WRITE SHORT ANSWERS')
    INTO exam_types VALUES ('FIB', 'FILL IN THE BLANKS Exams', 'TYPE IN THE CORRECT ANSWER')
SELECT * FROM dual;


-- Exams
INSERT ALL
    INTO exams VALUES (500, TO_DATE('12-Sep-2013', 'DD-MON-YYYY'), 'MCE', 190)
    INTO exams VALUES (510, TO_DATE('15-Sep-2013', 'DD-MON-YYYY'), 'SA', 191)
    INTO exams VALUES (520, TO_DATE('18-Sep-2013', 'DD-MON-YYYY'), 'FIB', 192)
    INTO exams VALUES (530, TO_DATE('21-Mar-2014', 'DD-MON-YYYY'), 'ESS', 193)
    INTO exams VALUES (540, TO_DATE('02-Apr-2014', 'DD-MON-YYYY'), 'TF', 194)
SELECT * FROM dual;

-- Exam Results
INSERT ALL
    INTO exam_results VALUES (91, 720, 500, 190)
    INTO exam_results VALUES (87, 730, 540, 195)
    INTO exam_results VALUES (85, 730, 530, 194)
    INTO exam_results VALUES (97, 750, 510, 195)
    INTO exam_results VALUES (78, 750, 520, 191)
    INTO exam_results VALUES (70, 760, 510, 192)
    INTO exam_results VALUES (97, 720, 520, 193)
    INTO exam_results VALUES (60, 750, 500, 192)
    INTO exam_results VALUES (65, 760, 540, 192)
    INTO exam_results VALUES (60, 760, 530, 191)
SELECT * FROM dual;

-- Exam Attendance
INSERT ALL
    INTO student_attendances VALUES (180, 11, 'Y', 730, 200)
    INTO student_attendances VALUES (180, 12, 'Y', 740, 300)
    INTO student_attendances VALUES (180, 13, 'Y', 770, 300)
    INTO student_attendances VALUES (180, 21, 'Y', 720, 100)
    INTO student_attendances VALUES (180, 14, 'Y', 750, 100)
    INTO student_attendances VALUES (180, 15, 'Y', 760, 200)
SELECT * FROM dual;

-- Student Course Details
INSERT ALL
    INTO student_course_details VALUES ('A', 720, 190)
    INTO student_course_details VALUES ('A', 750, 192)
    INTO student_course_details VALUES ('B', 760, 190)
    INTO student_course_details VALUES ('A', 770, 194)
    INTO student_course_details VALUES ('B', 720, 193)
    INTO student_course_details VALUES ('C', 730, 191)
    INTO student_course_details VALUES ('F', 740, 195)
    INTO student_course_details VALUES ('C', 760, 192)
    INTO student_course_details VALUES ('D', 770, 192)
    INTO student_course_details VALUES ('F', 770, 193)
SELECT * FROM dual;

-- Faculty Course Details
INSERT ALL
    INTO faculty_course_details VALUES (3, 192, 800)
    INTO faculty_course_details VALUES (4, 193, 800)
    INTO faculty_course_details VALUES (5, 190, 800)
    INTO faculty_course_details VALUES (3, 191, 800)
    INTO faculty_course_details VALUES (4, 194, 810)
    INTO faculty_course_details VALUES (5, 195, 810)
SELECT * FROM dual;

-- Faculty Login Detail
INSERT ALL
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.10.39.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 800)
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.13.15.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 800)
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.13.21.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 810)
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.13.26.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 840)
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.13.31.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 820)
    INTO faculty_login_details VALUES (TO_TIMESTAMP('01-JUN-17 05.13.36.000000 PM', 'DD-MON-RR HH.MI.SS.FF6 PM'), 830)
SELECT * FROM dual;