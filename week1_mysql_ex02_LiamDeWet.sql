-- Task 1: we first use the edutrack database

USE edutrack_sa;

-- Task 2: display all trainees sorted by surname in ascending order.

SELECT *
FROM trainees
ORDER BY last_name ASC;

-- Task 3: display all courses sorted by duration from longest to shortest. 
SELECT *
FROM courses
ORDER BY duration_weeks DESC;

-- Task 4: show the 3 most recently enrolled records
SELECT *
FROM enrolments
ORDER BY enrolment_date DESC
LIMIT 3;


-- Stretch goal 1: display the 2nd and 3rd most recently enrolled records. 
SELECT *
FROM enrolments
ORDER BY enrolment_date DESC
LIMIT 2 OFFSET 1; 


-- Stretch goals: display all trainees that first name start with S
SELECT *
FROM trainees
WHERE first_name LIKE 'S%';


-- Task 5: show the total number of trainees.
SELECT COUNT(trainee_id)
FROM trainees;

-- a better way is
SELECT COUNT(*) AS total_trainees
FROM trainees;


-- Task 6: show the average course duration
SELECT AVG(duration_weeks) AS average_duration
FROM courses;


-- Stretch goals
SELECT MAX(duration_weeks) AS max_duration
FROM courses;

SELECT MIN(duration_weeks) AS min_duration 
FROM courses;

SELECT SUM(duration_weeks) AS sum_of_duration
FROM courses;

-- Task 7: display the number of trainees in each province. 
SELECT province,
	COUNT(trainee_id) AS trainee_count
FROM trainees
GROUP BY province;


-- Task 8: display all the provinces with more than one trainee
SELECT province,
	COUNT(trainee_id) AS trainee_count
FROM trainees
GROUP BY province
HAVING trainee_count > 1;


-- Task 9:display trainees from Gauteng
SELECT *
FROM trainees
WHERE province = 'Gauteng';

-- Task 10: display courses by duration
SELECT *
FROM courses
WHERE duration_weeks >= '8';

-- Task 11: show only active enrolments
SELECT * 
FROM enrolments
WHERE status = 'Active';

-- Task 12: show the number of enrolments per course
SELECT course_id,
	COUNT(*) AS enrolment_count
FROM enrolments
GROUP BY course_id;


-- stretch goal: display all trainees whose email ends with .co.za

SELECT *
FROM trainees
WHERE email LIKE '%.co.za';

SELECT *
FROM trainees
WHERE email LIKE '%@gmail.com';

-- stretch goal: display facilitators who facilitate more than one course.
SELECT 
	CONCAT(f.first_name, ' ', f.last_name) AS facilitator_name,
    COUNT(c.course_id) AS course_count
FROM facilitators AS f
JOIN courses AS c
	ON f.facilitator_id = c.facilitator_id
GROUP BY
	f.facilitator_id,
    f.first_name,
    f.last_name
HAVING COUNT(c.course_id) > 1;
