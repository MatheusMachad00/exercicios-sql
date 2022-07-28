1-

SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;

2-

SELECT "userId" AS id, COUNT("userId") AS educations
FROM educations
GROUP BY "userId";

3-

SELECT u.name, COUNT(t."writerId") as "testimonailCount"
FROM testimonials t
JOIN users u ON u.id=t."writerId"
WHERE u.id=435
GROUP BY u.name;

4-

SELECT MAX(j.salary) AS "maximumSalary", r.name AS role 
FROM jobs j
JOIN roles r ON j."roleId"=r.id
WHERE j.active = true
GROUP BY role
ORDER BY "maximumSalary" ASC
