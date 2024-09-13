-- Primary Key Constraints
ALTER TABLE parent_information ADD CONSTRAINT pk_parent_info PRIMARY KEY (id);
ALTER TABLE students ADD CONSTRAINT pk_student PRIMARY KEY (id);
ALTER TABLE academic_sessions ADD CONSTRAINT pk_aca_ses PRIMARY KEY (id);
ALTER TABLE courses ADD CONSTRAINT pk_course PRIMARY KEY (id);
ALTER TABLE online_courses ADD CONSTRAINT pk_online_crse PRIMARY KEY (login_id);
ALTER TABLE seated_courses ADD CONSTRAINT pk_seated_crse PRIMARY KEY (building, room, date_time);
ALTER TABLE exams ADD CONSTRAINT pk_exam PRIMARY KEY (id);
ALTER TABLE exam_types ADD CONSTRAINT pk_exam_types PRIMARY KEY (exam_type);
ALTER TABLE departments ADD CONSTRAINT pk_department PRIMARY KEY (id);
ALTER TABLE faculties ADD CONSTRAINT pk_fcty PRIMARY KEY (id);
ALTER TABLE faculty_login_details ADD CONSTRAINT pk_fcty_login_dtl PRIMARY KEY (login_date_time);


-- UNIQUE Key Constraints
ALTER TABLE courses ADD CONSTRAINT uk_crse_name UNIQUE (course_name);
ALTER TABLE departments ADD CONSTRAINT uk_dept_name UNIQUE (dept_name);
ALTER TABLE students ADD CONSTRAINT uk_sdt_email UNIQUE (email);
ALTER TABLE faculties ADD CONSTRAINT uk_fcty_email UNIQUE (email);
ALTER TABLE academic_sessions ADD CONSTRAINT uk_ses_name UNIQUE (session_name);

-- FOREIGN Key Constraints
ALTER TABLE students ADD CONSTRAINT fk_student_parent_info FOREIGN KEY (parent_info_id)
    REFERENCES parent_information (id);

ALTER TABLE student_attendances ADD CONSTRAINT fk_attendance_student_id FOREIGN KEY (student_id)
    REFERENCES students (id);
ALTER TABLE student_attendances ADD CONSTRAINT fk_attendance_aca_ses_id FOREIGN KEY (academic_session_id)
    REFERENCES academic_sessions (id);

ALTER TABLE courses ADD CONSTRAINT fk_course_aca_ses_id FOREIGN KEY (aca_ses_id)
    REFERENCES academic_sessions (id);
ALTER TABLE courses ADD CONSTRAINT fk_course_dept_id FOREIGN KEY (dept_id)
    REFERENCES departments (id);
ALTER TABLE courses ADD CONSTRAINT fk_course_login_id FOREIGN KEY (login_id)
    REFERENCES online_courses (login_id);

-- Recall composite key, so just 1 statement need for (building, room, date_time)
ALTER TABLE courses ADD CONSTRAINT fk_course_building FOREIGN KEY (building, room, date_time)
    REFERENCES seated_courses (building, room, date_time);

ALTER TABLE student_course_details ADD CONSTRAINT fk_sdt_crse_dtl_student_id FOREIGN KEY (student_id)
    REFERENCES students (id);
ALTER TABLE student_course_details ADD CONSTRAINT fk_sdt_crse_dtl_course_id FOREIGN KEY (course_id)
    REFERENCES courses (id);

ALTER TABLE exam_results ADD CONSTRAINT fk_exam_result_student_id FOREIGN KEY (student_id)
    REFERENCES students (id);
ALTER TABLE exam_results ADD CONSTRAINT fk_result_exam_id FOREIGN KEY (exam_id)
    REFERENCES exams (id);
ALTER TABLE exams ADD CONSTRAINT fk_exam_exam_type FOREIGN KEY (exam_type)
    REFERENCES exam_types (exam_type);

ALTER TABLE faculties ADD CONSTRAINT fk_faculty_dept_id FOREIGN KEY (dept_id)
    REFERENCES departments (id);

ALTER TABLE faculty_course_details ADD CONSTRAINT fk_fcty_crse_dtl_course_id FOREIGN KEY (course_id)
    REFERENCES courses (id);
ALTER TABLE faculty_course_details ADD CONSTRAINT fk_fcty_crse_dtl_faculty_id FOREIGN KEY (faculty_id)
    REFERENCES faculties (id);

ALTER TABLE faculty_login_details ADD CONSTRAINT fk_fcty_lgn_dtl_faculty_id FOREIGN KEY (faculty_id)
    REFERENCES faculties (id);

-- DEFAULT and READ-ONLY
ALTER TABLE faculty_login_details MODIFY (login_date_time DATE DEFAULT SYSDATE);
ALTER TABLE parent_information READ ONLY;
