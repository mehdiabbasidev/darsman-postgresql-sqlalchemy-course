INSERT INTO users (email) 
           VALUES ('ali@example.com');



-------------------------------------------------------------------------------------
INSERT INTO users (email)
            VALUES('sara@example.com')
RETURNING id, email;





-------------------------------------------------------------------------------------
INSERT INTO users (email)
            VALUES('reza@example.com'),
                  ('maryam@example.com'),
                  ('mehdi@example.com');



-------------------------------------------------------------------------------------
INSERT INTO user_profiles  (user_id, full_name, avatar_url, bio)
                    VALUES (
                                1,
                                'Ali Mohammadi',
                                '/images/ali.jpg',
                                'Backend developer interested in PostgreSQL'
                            ),
                            (
                                2,
                                'Sara Ahmadi',
                                '/images/sara.jpg',
                                'Computer engineering student interested in data analysis'
                            ),
                            (
                                3,
                                'Reza',
                                NULL,
                                'Computer engineering'
                            ),                            
                            (
                                5,
                                'Mehdi Abbasi',
                                '/images/mehdi.jpg',
                                NULL
                            );


-------------------------------------------------------------------------------------
INSERT INTO documents (user_id, title, content)
                VALUES(
                          1,
                          'Introduction to PostgreSQL',
                          'PostgreSQL is a powerful, open-source relational database management system.'
                      ),
                      (
                          2,
                          'Difference Between Database and Schema',
                          'A database is the main container for storing data, while a schema organizes its objects.'
                      ),
                      (
                          1,
                          'Connecting Python to PostgreSQL',
                          'The psycopg library can be used to connect Python applications to PostgreSQL.'
                      ),
                      (
                          3,
                          'Database Design Principles',
                          'Proper database design includes identifying entities, relationships, and normalizing data.'
                      ),
                      (
                          3,
                          'Introduction to SQLAlchemy',
                          'SQLAlchemy provides database access through SQL Expression Language and ORM.'
                      );



------------------------------------------------------------------------------------
INSERT INTO  tags (name)
            VALUES('PostgreSQL'),
                  ('SQL'),
                  ('Database'),
                  ('Python'),
                  ('SQLAlchemy'),
                  ('Backend'),
                  ('Data Modeling'),
                  ('Performance'),
                  ('Security'),
                  ('API'),
                  ('SQL')
            ON CONFLICT (name) DO NOTHING;

    
------------------------------------------------------------------------------------
INSERT INTO document_tags (document_id, tag_id)
                    VALUES
                          -- Document 1: PostgreSQL
                          (1, 1),
                          (1, 2),
                          (1, 3),

                          -- Document 2: Database and Schema
                          (2, 2),
                          (2, 3),
                          (2, 7),
                      
                          -- Document 3: Python and PostgreSQL
                          (3, 1),
                          (3, 4),
                          (3, 6),
                      
                          -- Document 4: Database Design
                          (4, 3),
                          (4, 7),
                      
                          -- Document 5: SQLAlchemy
                          (5, 4),
                          (5, 5),
                          (5, 6);
                          




------------------------------------------------------------------------------------
UPDATE users
SET email = 'ali@gmail.com'
WHERE id = 1;



------------------------------------------------------------------------------------
UPDATE tags
SET name='FastAPI'
WHERE name='API'
RETURNING id, name;



------------------------------------------------------------------------------------
DELETE 
FROM users
WHERE id = 2

