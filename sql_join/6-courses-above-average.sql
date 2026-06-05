SELECT course_title
FROM (
    SELECT courses.title AS course_title, COUNT(enrollments.student_id) AS enrollment_count
    FROM courses
    LEFT JOIN enrollments ON courses.id = enrollments.course_id
    GROUP BY courses.id, courses.title
) AS course_enrollments
WHERE enrollment_count > (
    SELECT AVG(enrollment_count)
    FROM (
        SELECT COUNT(enrollments.student_id) AS enrollment_count
        FROM courses
        LEFT JOIN enrollments ON courses.id = enrollments.course_id
        GROUP BY courses.id
    ) AS average_enrollments
)
ORDER BY course_title ASC;