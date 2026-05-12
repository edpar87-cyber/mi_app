DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(191) NOT NULL,
    body TEXT,
    published INTEGER DEFAULT 0,
    created DATETIME,
    modified DATETIME
);

INSERT INTO articles (
    title,
    slug,
    body,
    published,
    created,
    modified
) VALUES (
    'Primer Post',
    'primer-post',
    'Hola desde Railway y CakePHP',
    1,
    datetime('now'),
    datetime('now')
);