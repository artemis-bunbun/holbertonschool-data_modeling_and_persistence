SELECT title AS course_title
FROM courses
WHERE id IN (
    SELECT course_id
    FROM (
        SELECT courses.id AS course_id, COUNT(assignments.id) AS assignment_count
        FROM courses
        LEFT JOIN assignments ON courses.id = assignments.course_id
        GROUP BY courses.id
    ) AS course_assignments
    WHERE assignment_count > (
        SELECT AVG(assignment_count)
        FROM (
            SELECT COUNT(assignments.id) AS assignment_count
            FROM courses
            LEFT JOIN assignments ON courses.id = assignments.course_id
            GROUP BY courses.id
        ) AS average_assignments
    )
)
ORDER BY course_title ASC;