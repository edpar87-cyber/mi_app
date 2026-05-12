CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(255),
    slug VARCHAR(191),
    body TEXT,
    published BOOLEAN DEFAULT 0,
    created DATETIME,
    modified DATETIME
);