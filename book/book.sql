-- Create authors table
CREATE TABLE "authors" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL
);

-- Create books table
CREATE TABLE "books" (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL
);

-- Create authored table (junction table for many-to-many relationship)
CREATE TABLE "authored" (
    "author_id" INTEGER,
    "book_id" INTEGER,
    FOREIGN KEY ("author_id") REFERENCES "authors"("id"),
    FOREIGN KEY ("book_id") REFERENCES "books"("id"),
    PRIMARY KEY ("author_id", "book_id")
);

-- Insert data from the image
INSERT INTO "authors" ("id", "name") VALUES
    (23, 'Eva Baltasar'),
    (31, 'Han Kang'),
    (27, 'Gauz'),
    (58, 'Olga Tokarczuk');

INSERT INTO "books" ("id", "title") VALUES
    (1, 'Boulder'),
    (74, 'The White Book'),
    (4, 'Standing Heavy'),
    (78, 'Flights');

INSERT INTO "authored" ("author_id", "book_id") VALUES
    (23, 1),
    (31, 74),
    (27, 4),
    (58, 78);

-- Insert 20 more authors
INSERT INTO "authors" ("id", "name") VALUES
    (101, 'Gabriel García Márquez'),
    (102, 'Isabel Allende'),
    (103, 'Chimamanda Ngozi Adichie'),
    (104, 'Haruki Murakami'),
    (105, 'Margaret Atwood'),
    (106, 'Kazuo Ishiguro'),
    (107, 'Elena Ferrante'),
    (108, 'Salman Rushdie'),
    (109, 'Toni Morrison'),
    (110, 'J.M. Coetzee'),
    (111, 'Alice Munro'),
    (112, 'Orhan Pamuk'),
    (113, 'Zadie Smith'),
    (114, 'Ian McEwan'),
    (115, 'Arundhati Roy'),
    (116, 'Cormac McCarthy'),
    (117, 'Don DeLillo'),
    (118, 'Joyce Carol Oates'),
    (119, 'Philip Roth'),
    (120, 'Ursula K. Le Guin');

-- Insert 20 more books
INSERT INTO "books" ("id", "title") VALUES
    (101, 'One Hundred Years of Solitude'),
    (102, 'The House of the Spirits'),
    (103, 'Half of a Yellow Sun'),
    (104, 'Norwegian Wood'),
    (105, 'The Handmaid''s Tale'),
    (106, 'Never Let Me Go'),
    (107, 'My Brilliant Friend'),
    (108, 'Midnight''s Children'),
    (109, 'Beloved'),
    (110, 'Disgrace'),
    (111, 'Dear Life'),
    (112, 'My Name Is Red'),
    (113, 'White Teeth'),
    (114, 'Atonement'),
    (115, 'The God of Small Things'),
    (116, 'The Road'),
    (117, 'White Noise'),
    (118, 'Blonde'),
    (119, 'American Pastoral'),
    (120, 'The Left Hand of Darkness');

-- Insert relationships (20 more authored entries)
INSERT INTO "authored" ("author_id", "book_id") VALUES
    (101, 101),
    (102, 102),
    (103, 103),
    (104, 104),
    (105, 105),
    (106, 106),
    (107, 107),
    (108, 108),
    (109, 109),
    (110, 110),
    (111, 111),
    (112, 112),
    (113, 113),
    (114, 114),
    (115, 115),
    (116, 116),
    (117, 117),
    (118, 118),
    (119, 119),
    (120, 120);

-- Insert some additional authors with multiple books
INSERT INTO "authors" ("id", "name") VALUES
    (121, 'Stephen King'),
    (122, 'Agatha Christie'),
    (123, 'George Orwell');

INSERT INTO "books" ("id", "title") VALUES
    (121, 'The Shining'),
    (122, 'It'),
    (123, 'Carrie'),
    (124, 'Murder on the Orient Express'),
    (125, 'Death on the Nile'),
    (126, '1984'),
    (127, 'Animal Farm');

INSERT INTO "authored" ("author_id", "book_id") VALUES
    (121, 121),
    (121, 122),
    (121, 123),
    (122, 124),
    (122, 125),
    (123, 126),
    (123, 127);