CREATE TABLE IF NOT EXISTS articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    slug TEXT,
    body TEXT,
    published INTEGER,
    created TEXT,
    modified TEXT
);

INSERT INTO articles (title, slug, body, published, created, modified)
VALUES (
    'Primer Post',
    'primer-post',
    'Hola desde Railway y CakePHP',
    1,
    datetime('now'),
    datetime('now')
);