1-

SELECT users.id, users.name, cities.name AS city FROM users
JOIN cities
ON cities.id = 3658;

2-

SELECT testimonials.id, testimonials.message, u1.name AS writer, u2.name AS recipient FROM testimonials
JOIN users u1
ON testimonials."writerId"=u1.id
JOIN users u2
ON testimonials."recipientId"=u2.id

3-

SELECT educations."userId", educations."endDate", schools.name AS school, users.name, courses.name AS course
FROM educations 
JOIN users
ON educations."userId" = users.id
JOIN courses
ON educations."courseId" = courses.id
JOIN schools
ON educations."schoolId" = schools.id
WHERE "userId"=30;

4-

SELECT users.id, users.name, companies.name AS company, roles.name AS role, experiences."startDate"
FROM experiences
JOIN users
ON experiences."userId" = users.id
JOIN companies
ON experiences."companyId" = companies.id
JOIN roles
ON experiences."roleId" = roles.id
WHERE "userId" = 50;
