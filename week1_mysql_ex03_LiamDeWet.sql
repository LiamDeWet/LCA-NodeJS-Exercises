-- Task 1: using the edutack_sa database
USE edutrack_sa;

-- Task 2: create an enrolment list joining trainees, enrolments and courses. 
SELECT *
FROM trainees
INNER JOIN enrolments
ON trainees.trainee_id = enrolments.trainee_id;

-- Task 3: Course and facilitator name pairing
SELECT
	course_name,
    CONCAT(first_name, ' ', last_name) AS facilitator_name
FROM courses
INNER JOIN facilitators
ON courses.facilitator_id = facilitators.facilitator_id;

-- Same thing but with aliases(I'm trying to see what works best for me)

SELECT
	c.course_name,
    CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name
FROM courses AS c
INNER JOIN facilitators AS f
on c.facilitator_id = f.facilitator_id;


-- Real Task 1: show the enrolment list by joining trainees, enrolments and courses. 

SELECT
	CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    c.course_name,
    e.enrolment_date,
    e.status
FROM trainees AS t
INNER JOIN enrolments AS e
	ON t.trainee_id = e.trainee_id
INNER JOIN courses AS c
	ON e.course_id = c.course_id;

-- Task 2: display all trainees and their course name, including trainees with no enrolments. 

SELECT 
	CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    c.course_name
FROM trainees AS t
LEFT JOIN enrolments AS e
	ON t.trainee_id = e.trainee_id
LEFT JOIN courses AS c
	ON e.course_id = c.course_id;


-- Task 3: display all courses and the trainees enrolled in them, including courses with no trainees.

SELECT
	c.course_name,
    CONCAT(t.first_name, ' ', t.last_name) AS course_name
FROM trainees AS t
RIGHT JOIN enrolments AS e
	ON t.trainee_id = e.trainee_id
RIGHT JOIN courses AS c
	ON e.course_id = c.course_id;
    
    
-- task 4: update a trainee's data

SELECT *
FROM trainees
WHERE trainee_id = 2;

UPDATE trainees
SET province = 'Northern Cape'
WHERE trainee_id = 2;

-- check again to confirm
SELECT *
FROM trainees
WHERE trainee_id = 2;

-- Task 5: deleting the most recent record from enrolments

-- check how many enrolments there are first
SELECT *
FROM enrolments;

DELETE FROM enrolments
ORDER BY enrolment_id DESC
LIMIT 1;

-- check that it worked
SELECT *
FROM enrolments;


-- Task 6: display active enrolment counts per course using JOIN, WHERE, GROUP BY, HAVING and ORDER BY
SELECT 
	c.course_name,
    COUNT(e.enrolment_id) AS total_enrolments
FROM courses AS c
INNER JOIN enrolments AS e
	ON c.course_id = e.course_id
WHERE e.status = 'Active'
GROUP BY c.course_id, course_name
HAVING COUNT(e.enrolment_id) >= 1
ORDER BY c.course_name ASC;


-- Stretch goal: show the facilitator with the most trainees across all of  their courses
SELECT 
	CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name,
    COUNT(e.trainee_id) AS total_trainees
FROM facilitators as f
INNER JOIN courses AS c
	ON f.facilitator_id = c.facilitator_id
INNER JOIN enrolments AS e
	ON c.course_id = e.course_id
GROUP BY 
	f.facilitator_id,
    f.first_name,
    f.last_name
ORDER BY total_trainees DESC
LIMIT 1;


-- Stretch goal: adding a new facilitator, creating a new course and enrol two trainees
INSERT INTO facilitators
(first_name, last_name, email, phone)
VALUES
('Bruce', 'Wayne', 'bruce.wn@edutrack.co.za', '0823456789');

-- check:
SELECT * FROM facilitators;

INSERT INTO courses
(course_name, duration_weeks, facilitator_id)
VALUES
('Cloud Computing Fundamentals', 10, last_insert_id());
-- check table
SELECT * FROM courses;

INSERT INTO enrolments
(trainee_id, course_id, enrolment_date, status)
VALUES
(1, last_insert_id(), curdate(), 'Active'),
(2, last_insert_id(), curdate(), 'Active');
-- check table:
SELECT * FROM enrolments;


-- Stretch goal: find all trainees enrolled in more than one course
SELECT 
	CONCAT(t.first_name, ' ', t.last_name) AS trainee_name,
    COUNT(e.course_id) AS course_count
FROM trainees AS t
INNER JOIN enrolments AS e
	ON t.trainee_id = e.trainee_id
GROUP BY
	t.trainee_id,
    t.first_name,
    t.last_name
HAVING COUNT(e.course_id) > 1;
    