SELECT *
FROM users;


------------------------------------------------------------------------------------
SELECT  id, email
FROM users;


------------------------------------------------------------------------------------
SELECT id AS user_id, email AS user_email
FROM users;


------------------------------------------------------------------------------------
SELECT *
FROM users
WHERE id = 1;


------------------------------------------------------------------------------------
SELECT id, user_id, title
FROM documents
WHERE user_id = 1;


------------------------------------------------------------------------------------
SELECT *
FROM documents
WHERE id > 2;


------------------------------------------------------------------------------------
SELECT *
FROM documents
WHERE user_id = 1 AND  id > 1;


------------------------------------------------------------------------------------
SELECT id, user_id, title
FROM documents
WHERE user_id = 1  OR  user_id = 3;


------------------------------------------------------------------------------------
SELECT id, user_id, title
FROM documents
WHERE user_id IN (1, 2, 3, 5);


------------------------------------------------------------------------------------
SELECT id, user_id, title
FROM documents
WHERE id BETWEEN 1 AND 4;


------------------------------------------------------------------------------------
SELECT *
FROM tags
WHERE name LIKE 'Post%';


------------------------------------------------------------------------------------
SELECT *
FROM tags
WHERE name LIKE '%sql%';


------------------------------------------------------------------------------------
SELECT *
FROM tags
WHERE name ILIKE '%sql%';


------------------------------------------------------------------------------------
SELECT * 
FROM tags 
WHERE name ILIKE 'FastA_i';



------------------------------------------------------------------------------------
SELECT * 
FROM tags 
WHERE name ILIKE '%_______'



------------------------------------------------------------------------------------
SELECT *
FROM user_profiles
WHERE avatar_url IS NULL;


------------------------------------------------------------------------------------
SELECT *
FROM user_profiles
WHERE avatar_url IS NOT NULL;


------------------------------------------------------------------------------------
SELECT DISTINCT user_id
FROM documents;


------------------------------------------------------------------------------------
SELECT id, title, created_at
FROM documents
ORDER BY created_at DESC;


------------------------------------------------------------------------------------
SELECT id, title, created_at
FROM documents
ORDER BY  title ASC, created_at DESC;


------------------------------------------------------------------------------------
SELECT id, title, created_at
FROM documents
ORDER BY id
LIMIT 2;


------------------------------------------------------------------------------------
SELECT id, title, created_at
FROM documents
ORDER BY id
LIMIT 2 OFFSET 0;


------------------------------------------------------------------------------------
SELECT id, title, created_at
FROM documents
ORDER BY id
LIMIT 2 OFFSET 2;


------------------------------------------------------------------------------------
SELECT  id, user_id, title
FROM documents
WHERE user_id IN (1, 2, 5) AND title ILIKE '%sql%' 
ORDER BY created_at DESC
LIMIT 4;





------------------------------------------------------------------------------------
SELECT  
    id, 
    user_id, 
    title
FROM documents