-- Task 1: EduTrack SA database

CREATE DATABASE IF NOT EXISTS edutrack_sa;

USE edutrack_sa;


-- Task 2: Create the facilitators table, storing information about all facilitators.

CREATE TABLE facilitators (
	facilitator_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20)
);

-- Task 3: the course table, this stores all available courses. Each course linked to a facilitator.

CREATE TABLE courses (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_weeks INT NOT NULL,
    facilitator_id INT NOT NULL,
    FOREIGN KEY (facilitator_id)
		REFERENCES facilitators(facilitator_id)
);


-- Task 4: trainees table, this table stores information about all trainees. 

CREATE TABLE trainees (
	trainee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    province VARCHAR(50) NOT NULL -- I kept this as a normal VARCHAR because it is selective to South Africa, and not expanding over Africa, so a foreign key won't be needed unless the data were to be sored in another table. 
);


-- Task 5: enrolments table, this one links trainees to courses and stores enrolment information

CREATE TABLE enrolments (
	enrolment_id INT AUTO_INCREMENT PRIMARY KEY,
    trainee_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Active', 'Completed', 'Withdrawn')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (trainee_id)
		REFERENCES trainees(trainee_id),
        
	FOREIGN KEY (course_id)
		REFERENCES courses(course_id)
);



-- Task 6: inserting facilitator data

INSERT INTO facilitators (first_name, last_name, email, phone)
VALUES
('Aidan', 'Jacobs', 'aidan.ja@edutrack.co.za', '0826478140'),
('Lyran', 'Booys', 'lyran.by@edutrack.co.za', '0798234150'),
('Emily', 'Daniels', 'emily.dn@edutrack.co.za', '0662824575'),
('Curwin', 'Brown', 'curwinbr@edutrack.co.za', '0623645276');


SELECT * FROM facilitators; -- the data shows up mental check

-- Task 7: now inserting the course data

INSERT INTO courses (course_name, duration_weeks, facilitator_id)
VALUES
('Full Stack Web Developer', 12, 1),
('Python Programing', 10, 2),
('Database Design with MySQL', 8, 3),
('Cybersecurity Fundamentals', 6, 4);

-- mental test: 
SELECT * FROM courses;

-- Task 8: trainee data
INSERT INTO trainees (first_name, last_name, email, province)
VALUES
('Liam', 'De Wet', 'liam.dw@gmail.com', 'Western Cape'),
('Chiara', 'Jade', 'chiara.jd@gmail.com', 'Eastern Cape'),
('Sipho', 'Dlamini', 'sipho.dl@gmail.com', 'Gauteng'),
('Lerato', 'Ndlovu', 'lerato.nd@gmail.com', 'KwaZulu-Natal');

-- mental test:
SELECT * FROM trainees;


-- Task 9: Insert enrolment data

INSERT INTO enrolments (trainee_id, course_id, enrolment_date, status)
VALUES
(1, 1, '2026-07-20', 'Active'),
(2, 2, '2026-07-21', 'Completed'),
(3, 3, '2026-07-22', 'Active'),
(4, 4, '2026-07-23', 'Withdrawn');

SELECT * FROM enrolments;

SELECT CONCAT(first_name,' ', last_name) AS full_name, province
FROM trainees WHERE province = 'Gauteng';                                                                                                                                            



