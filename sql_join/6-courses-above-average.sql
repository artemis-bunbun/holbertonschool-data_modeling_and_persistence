SELECT courses.title AS course_title
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.id, courses.title
HAVING COUNT(enrollments.course_id) > (
    SELECT AVG(course_count)
    FROM (
        SELECT COUNT(enrollments.course_id) AS course_count
        FROM courses
        LEFT JOIN enrollments ON courses.id = enrollments.course_id
        GROUP BY courses.id
    ) AS course_counts
)
ORDER BY course_title ASC;