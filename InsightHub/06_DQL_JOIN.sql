
SELECT 
    u.id, 
    p.full_name, 
    u.email, 
    p.bio
FROM users AS u INNER JOIN user_profiles AS p 
ON u.id = p.user_id
WHERE u.id<5
ORDER BY u.id;
















SELECT
    u.id,
    u.email,
    p.full_name,
    p.avatar_url,
    p.bio
FROM users AS u INNER JOIN user_profiles AS p 
ON p.user_id = u.id;



------------------------------------------------------------------------------------
SELECT
    u.id AS user_id,
    u.email,
    d.id AS document_id,
    d.title,
    d.created_at
FROM users AS u INNER JOIN documents AS d 
ON d.user_id = u.id;



------------------------------------------------------------------------------------
SELECT
    d.id,
    d.title,
    dt.tag_id
FROM documents AS d INNER JOIN document_tags AS dt
ON dt.document_id = d.id;





SELECT d.title, t.name
FROM documents AS d INNER JOIN document_tags AS dt
ON d.id =dt.document_id INNER JOIN tags AS t
ON dt.tag_id=t.id;








------------------------------------------------------------------------------------
SELECT
    d.id AS document_id,
    d.title,
    t.id AS tag_id,
    t.name AS tag_name
FROM documents AS d INNER JOIN document_tags AS dt  
ON dt.document_id = d.id INNER JOIN tags AS t
ON t.id = dt.tag_id;



------------------------------------------------------------------------------------
SELECT
    u.email,
    p.full_name,
    d.title,
    d.content
FROM users AS u INNER JOIN user_profiles AS p 
ON p.user_id = u.id INNER JOIN documents AS d
ON d.user_id = u.id
ORDER BY p.full_name, d.title;



------------------------------------------------------------------------------------
SELECT
    p.full_name,
    u.email,
    d.title,
    t.name AS tag_name
FROM users AS u INNER JOIN user_profiles AS p 
ON p.user_id = u.id INNER JOIN documents AS d
ON d.user_id = u.id INNER JOIN document_tags AS dt 
ON dt.document_id = d.id INNER JOIN tags AS t
ON t.id = dt.tag_id
ORDER BY p.full_name, d.title, t.name;


------------------------------------------------------------------------------------
SELECT
    u.id,
    u.email,
    p.full_name,
    p.bio
FROM users AS u LEFT JOIN user_profiles AS p
ON p.user_id = u.id;



------------------------------------------------------------------------------------
SELECT 
    u.id,
    u.email,
    p.full_name,
    p.bio
FROM users AS u LEFT JOIN user_profiles AS p
ON p.user_id = u.id;



------------------------------------------------------------------------------------
SELECT
    u.id,
    u.email,
    d.title
FROM users AS u LEFT JOIN documents AS d
ON d.user_id = u.id
ORDER BY u.id, d.id;



------------------------------------------------------------------------------------
SELECT
    d.id,
    d.title,
    t.name AS tag_name
FROM documents AS d LEFT JOIN document_tags AS dt
ON dt.document_id = d.id LEFT JOIN tags AS t
ON t.id = dt.tag_id
ORDER BY d.id, t.name;



------------------------------------------------------------------------------------
SELECT
    t.id,
    t.name
FROM tags AS t LEFT JOIN document_tags AS dt 
ON dt.tag_id = t.id
WHERE dt.document_id IS NULL
ORDER BY t.name;