BEGIN;

INSERT INTO  users (email)
            VALUES ('ahmad@example.com');


INSERT INTO user_profiles (user_id, full_name, bio)
                    VALUES(
                            (SELECT id FROM users WHERE email = 'ahmad@example.com'),
                            'Ahmad Ahmadi',
                            'Python backend developer'
                          );

COMMIT;
   


------------------------------------------------------------------------------------
BEGIN;

INSERT INTO  users (email)
            VALUES ('mina@example.com');

INSERT INTO  user_profiles (user_id, full_name)
                    VALUES (10000, 'Mina Karimi');

ROLLBACK;


------------------------------------------------------------------------------------
BEGIN;

INSERT INTO users (email)
VALUES ('mina@example.com');

INSERT INTO user_profiles (user_id, full_name)
VALUES (10000, 'Mina Karimi');

COMMIT;



------------------------------------------------------------------------------------
BEGIN;

INSERT INTO tags (name)
          VALUES ('Docker');

SAVEPOINT tag_created;

INSERT INTO tags (name)
          VALUES ('PostgreSQL');

ROLLBACK TO SAVEPOINT tag_created;

COMMIT;

