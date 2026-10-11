-- تعداد کل کاربران
SELECT COUNT(*) AS total_users
FROM users;




------------------------------------------------------------------------------------
-- قدیمی‌ترین و جدیدترین سند
SELECT MIN(created_at) ,MAX(created_at) 
FROM documents;







------------------------------------------------------------------------------------
-- مجموع شناسه تگ‌ها
SELECT SUM(id) AS sum_of_tag_ids
FROM tags;






------------------------------------------------------------------------------------
--  میانگین شناسه اسناد
SELECT AVG(id) AS average_document_id
FROM documents;



------------------------------------------------------------------------------------
-- تعداد اسناد هر کاربر
SELECT user_id, COUNT(*) AS document_count
FROM documents
GROUP BY user_id




------------------------------------------------------------------------------------
-- کاربرانی که بیشتر از یک سند دارند
SELECT user_id, COUNT(*) AS document_count
FROM documents
GROUP BY user_id
HAVING COUNT(*) > 1
ORDER BY document_count DESC;



------------------------------------------------------------------------------------
-- تعداد تگ‌های هر سند
SELECT d.id, d.title, COUNT(dt.tag_id) AS tag_count
FROM documents AS d LEFT JOIN document_tags AS dt 
ON dt.document_id = d.id
GROUP BY d.id, d.title
ORDER BY d.id;



------------------------------------------------------------------------------------
-- تعداد اسناد متصل به هر تگ
SELECT t.id, t.name, COUNT(dt.document_id) AS document_count
FROM tags AS t LEFT JOIN document_tags AS dt
ON dt.tag_id = t.id
GROUP BY t.id, t.name
ORDER BY document_count DESC;