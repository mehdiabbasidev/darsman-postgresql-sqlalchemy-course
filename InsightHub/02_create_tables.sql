-- SELECT current_database();



-- CREATE TABLE users
-- (
--     id BIGINT GENERATED ALWAYS AS IDENTITY,
--     email VARCHAR(25) NOT NULL ,
--     created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

--     CONSTRAINT pk_users PRIMARY KEY (id),
--     CONSTRAINT uq_users_email  UNIQUE (email),
--     CONSTRAINT chk_users_email_not_empty  CHECK (TRIM(email) <> '')
-- );



-- CREATE TABLE user_profiles
-- (
--     user_id BIGINT,
--     full_name VARCHAR(100) NOT NULL,
--     avatar_url TEXT,
--     bio TEXT,
--     created_at TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,



--     CONSTRAINT pk_user_profiles 
--                 PRIMARY KEY (user_id),

--     CONSTRAINT fk_user_profiles_user 
--                 FOREIGN KEY (user_id) REFERENCES users (id) 
--                 ON DELETE CASCADE,

--     CONSTRAINT chk_user_profiles_full_name  
--                 CHECK (TRIM(full_name) <> '')
-- );









-- CREATE TABLE documents
-- (
--     id BIGINT GENERATED ALWAYS AS IDENTITY,
--     user_id BIGINT NOT NULL,
--     title VARCHAR(200) NOT NULL,
--     content TEXT,
--     created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
--     CONSTRAINT pk_documents 
--                 PRIMARY KEY (id),

--     CONSTRAINT fk_documents_user 
--                 FOREIGN KEY (user_id) REFERENCES users (id) 
--                 ON DELETE CASCADE,

--     CONSTRAINT chk_documents_title CHECK (TRIM(title) <> '')
-- );








-- CREATE TABLE tags
-- (
--     id BIGINT GENERATED ALWAYS AS IDENTITY,
--     name VARCHAR(50) NOT NULL,
--     created_at TIMESTAMPTZ NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    
--     CONSTRAINT pk_tags 
--                 PRIMARY KEY (id),
                
--     CONSTRAINT uq_tags_name 
--                 UNIQUE (name),

--     CONSTRAINT chk_tags_name 
--                 CHECK (TRIM(name) <> '')
-- );











-- CREATE TABLE document_tags
-- (
--     document_id BIGINT,
--     tag_id BIGINT,
--     created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

--     CONSTRAINT pk_document_tags 
--                 PRIMARY KEY (document_id, tag_id),

--     CONSTRAINT fk_document_tags_document 
--                 FOREIGN KEY (document_id) REFERENCES documents (id) 
--                 ON DELETE CASCADE,

--     CONSTRAINT fk_document_tags_tag 
--                 FOREIGN KEY (tag_id) REFERENCES tags (id) 
--                 ON DELETE CASCADE
-- );






















