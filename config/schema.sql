DROP TABLE IF EXISTS articles;

CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    slug TEXT NOT NULL,
    body TEXT,
    published INTEGER DEFAULT 0,
    created TEXT,
    modified TEXT
);

INSERT INTO articles (
    title,
    slug,
    body,
    published,
    created,
    modified
)
VALUES (
    'Primer Post',
    'primer-post',
    'Hola desde Railway',
    1,
    datetime('now'),
    datetime('now')
);