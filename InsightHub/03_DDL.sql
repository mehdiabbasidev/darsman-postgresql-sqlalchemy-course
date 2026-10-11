-- SELECT table_name
-- FROM information_schema.tables
-- WHERE table_schema = 'public'
-- ORDER BY table_name;


---------------------------------------------------------------
ALTER TABLE documents
ADD COLUMN is_published BOOLEAN;


---------------------------------------------------------------
ALTER TABLE documents
RENAME COLUMN is_published TO published;


---------------------------------------------------------------
ALTER TABLE documents
DROP COLUMN published;


---------------------------------------------------------------
INSERT INTO tags (name)
VALUES  ('PostgreSQL'),
        ('SQL'),
        ('Database'),
        ('Python'),
        ('SQLAlchemy'),
        ('Backend'),
        ('Data Modeling'),
        ('Performance'),
        ('Security'),
        ('API');


---------------------------------------------------------------
TRUNCATE TABLE tags 
RESTART IDENTITY CASCADE;


---------------------------------------------------------------
DROP TABLE document_tags;


---------------------------------------------------------------
DROP TABLE IF EXISTS document_tags;


---------------------------------------------------------------
CREATE TABLE document_tags
(
    document_id BIGINT,
    tag_id BIGINT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_document_tags 
                PRIMARY KEY (document_id, tag_id),

    CONSTRAINT fk_document_tags_document 
                FOREIGN KEY (document_id) REFERENCES documents (id) 
                ON DELETE CASCADE,

    CONSTRAINT fk_document_tags_tag 
                FOREIGN KEY (tag_id) REFERENCES tags (id) 
                ON DELETE CASCADE
);




TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE user_profiles RESTART IDENTITY CASCADE;
TRUNCATE TABLE documents RESTART IDENTITY CASCADE;
TRUNCATE TABLE tags RESTART IDENTITY CASCADE;
TRUNCATE TABLE document_tags RESTART IDENTITY CASCADE;



