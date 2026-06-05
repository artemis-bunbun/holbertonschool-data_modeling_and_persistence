SELECT s.name AS student_name, c.title AS course_title
FROM students AS s
INNER JOIN enrollments AS e ON s.id = e.student_id
INNER JOIN courses AS c ON e.course_id = c.id
ORDER BY student_name ASC, course_title ASC;
