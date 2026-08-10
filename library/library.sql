PRAGMA foreign_keys = ON;

-- Create tables
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    nationality TEXT,
    birth_year INTEGER
);

CREATE TABLE publishers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT,
    founded_year INTEGER
);

CREATE TABLE translators (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    language_pair TEXT
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    isbn13 TEXT UNIQUE NOT NULL,
    title TEXT NOT NULL,
    publisher_id INTEGER NOT NULL,
    format TEXT,
    pages INTEGER CHECK(pages > 0),
    publish_date TEXT,
    year_added INTEGER NOT NULL,
    FOREIGN KEY (publisher_id) REFERENCES publishers(id)
);

CREATE TABLE authored (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    UNIQUE(book_id, author_id)
);

CREATE TABLE ratings (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    rating REAL CHECK(rating BETWEEN 0 AND 5),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert Publishers
INSERT INTO publishers (id, name, country, founded_year) VALUES
    (1, 'Penguin Random House', 'USA', 2013),
    (2, 'HarperCollins', 'USA', 1989),
    (3, 'Simon & Schuster', 'USA', 1924),
    (4, 'Macmillan Publishers', 'USA', 1843),
    (5, 'Hachette Livre', 'France', 1826),
    (6, 'Bloomsbury Publishing', 'UK', 1986),
    (7, 'Faber & Faber', 'UK', 1929),
    (8, 'Knopf Doubleday', 'USA', 1915),
    (9, 'Graywolf Press', 'USA', 1974),
    (10, 'Farrar, Straus and Giroux', 'USA', 1946);

-- Insert Authors
INSERT INTO authors (id, name, nationality, birth_year) VALUES
    (1, 'Gabriel García Márquez', 'Colombian', 1927),
    (2, 'Isabel Allende', 'Chilean', 1942),
    (3, 'Chimamanda Ngozi Adichie', 'Nigerian', 1977),
    (4, 'Haruki Murakami', 'Japanese', 1949),
    (5, 'Margaret Atwood', 'Canadian', 1939),
    (6, 'Kazuo Ishiguro', 'British', 1954),
    (7, 'Elena Ferrante', 'Italian', 1943),
    (8, 'Salman Rushdie', 'Indian-British', 1947),
    (9, 'Toni Morrison', 'American', 1931),
    (10, 'J.M. Coetzee', 'South African', 1940),
    (11, 'Alice Munro', 'Canadian', 1931),
    (12, 'Orhan Pamuk', 'Turkish', 1952),
    (13, 'Zadie Smith', 'British', 1975),
    (14, 'Ian McEwan', 'British', 1948),
    (15, 'Arundhati Roy', 'Indian', 1961),
    (16, 'Cormac McCarthy', 'American', 1933),
    (17, 'Don DeLillo', 'American', 1936),
    (18, 'Joyce Carol Oates', 'American', 1938),
    (19, 'Philip Roth', 'American', 1933),
    (20, 'Ursula K. Le Guin', 'American', 1929),
    (21, 'Stephen King', 'American', 1947),
    (22, 'Agatha Christie', 'British', 1890),
    (23, 'George Orwell', 'British', 1903),
    (24, 'Jane Austen', 'British', 1775),
    (25, 'Charles Dickens', 'British', 1812),
    (26, 'Fyodor Dostoevsky', 'Russian', 1821),
    (27, 'Leo Tolstoy', 'Russian', 1828),
    (28, 'Mark Twain', 'American', 1835),
    (29, 'Ernest Hemingway', 'American', 1899),
    (30, 'Virginia Woolf', 'British', 1882);

-- Insert Translators
INSERT INTO translators (id, name, language_pair) VALUES
    (1, 'Gregory Rabassa', 'Spanish-English'),
    (2, 'Mara Faye Lethem', 'Spanish-English'),
    (3, 'Alison Entrekin', 'Portuguese-English'),
    (4, 'Philip Gabriel', 'Japanese-English'),
    (5, 'Jay Rubin', 'Japanese-English'),
    (6, 'Ann Goldstein', 'Italian-English'),
    (7, 'Eileen Chang', 'Chinese-English'),
    (8, 'Richard Pevear', 'Russian-English'),
    (9, 'Larissa Volokhonsky', 'Russian-English'),
    (10, 'Geoffrey Strachan', 'French-English');

-- Insert Books (50 books)
INSERT INTO books (id, isbn13, title, publisher_id, format, pages, publish_date, year_added) VALUES
    -- Classic Literature
    (1, '9780061120084', 'One Hundred Years of Solitude', 1, 'Hardcover', 432, '1970-06-01', 2020),
    (2, '9781501123216', 'The House of the Spirits', 2, 'Paperback', 496, '1985-04-01', 2020),
    (3, '9780307271084', 'Half of a Yellow Sun', 3, 'Paperback', 448, '2006-08-15', 2021),
    (4, '9780375713554', 'Norwegian Wood', 4, 'Paperback', 320, '2000-08-01', 2021),
    (5, '9780385490818', 'The Handmaid''s Tale', 5, 'Paperback', 336, '1986-07-01', 2020),
    (6, '9781400078877', 'Never Let Me Go', 6, 'Paperback', 288, '2005-04-01', 2021),
    (7, '9781609450786', 'My Brilliant Friend', 7, 'Paperback', 331, '2011-09-01', 2022),
    (8, '9780812976717', 'Midnight''s Children', 8, 'Paperback', 560, '1981-01-01', 2020),
    (9, '9781400033416', 'Beloved', 9, 'Paperback', 336, '1987-08-01', 2021),
    (10, '9780143115706', 'Disgrace', 10, 'Paperback', 224, '1999-10-01', 2022),
    
    -- Modern Fiction
    (11, '9781400077542', 'Dear Life', 1, 'Paperback', 336, '2012-09-01', 2021),
    (12, '9780375706853', 'My Name Is Red', 2, 'Paperback', 448, '1998-08-01', 2020),
    (13, '9780375703869', 'White Teeth', 3, 'Paperback', 448, '2000-01-01', 2022),
    (14, '9780307456367', 'Atonement', 4, 'Paperback', 368, '2001-09-01', 2021),
    (15, '9780812980653', 'The God of Small Things', 5, 'Paperback', 352, '1997-04-01', 2020),
    (16, '9780307387896', 'The Road', 6, 'Paperback', 256, '2006-09-01', 2021),
    (17, '9780142437778', 'White Noise', 7, 'Paperback', 324, '1985-01-01', 2022),
    (18, '9780061455360', 'Blonde', 8, 'Paperback', 752, '2000-01-01', 2020),
    (19, '9780307385809', 'American Pastoral', 9, 'Paperback', 432, '1997-04-01', 2021),
    (20, '9780441007319', 'The Left Hand of Darkness', 10, 'Paperback', 304, '1969-03-01', 2022),
    
    -- Stephen King
    (21, '9780385121675', 'The Shining', 1, 'Hardcover', 447, '1977-01-28', 2020),
    (22, '9780450411434', 'It', 2, 'Paperback', 1138, '1986-09-15', 2021),
    (23, '9780307743658', 'Carrie', 3, 'Paperback', 272, '1974-04-01', 2022),
    
    -- Agatha Christie
    (24, '9780062693662', 'Murder on the Orient Express', 4, 'Hardcover', 288, '1934-01-01', 2020),
    (25, '9780062073495', 'Death on the Nile', 5, 'Paperback', 320, '1937-01-01', 2021),
    
    -- George Orwell
    (26, '9780451524935', '1984', 6, 'Paperback', 328, '1949-06-08', 2020),
    (27, '9780451526342', 'Animal Farm', 7, 'Paperback', 144, '1945-08-17', 2021),
    
    -- More Classic Authors
    (28, '9780141439518', 'Pride and Prejudice', 8, 'Paperback', 400, '1813-01-28', 2020),
    (29, '9780141439563', 'Great Expectations', 9, 'Paperback', 544, '1860-01-01', 2021),
    (30, '9780143107633', 'Crime and Punishment', 10, 'Paperback', 720, '1866-01-01', 2022),
    (31, '9780143039988', 'Anna Karenina', 1, 'Paperback', 944, '1877-01-01', 2020),
    (32, '9780143105271', 'War and Peace', 2, 'Paperback', 1392, '1869-01-01', 2021),
    (33, '9780143107336', 'The Adventures of Huckleberry Finn', 3, 'Paperback', 400, '1884-12-10', 2022),
    (34, '9780684801469', 'The Old Man and the Sea', 4, 'Hardcover', 128, '1952-09-01', 2020),
    (35, '9780156907392', 'Mrs Dalloway', 5, 'Paperback', 208, '1925-05-14', 2021),
    
    -- Contemporary Literature
    (36, '9780525559470', 'The Vanishing Half', 6, 'Hardcover', 352, '2020-06-02', 2021),
    (37, '9781984820785', 'Where the Crawdads Sing', 7, 'Hardcover', 384, '2018-08-14', 2021),
    (38, '9780525536297', 'Normal People', 8, 'Paperback', 288, '2018-08-28', 2022),
    (39, '9780525554659', 'Such a Fun Age', 9, 'Paperback', 320, '2019-12-31', 2022),
    (40, '9780593133491', 'The Midnight Library', 10, 'Hardcover', 304, '2020-08-13', 2021),
    
    -- Nobel Prize Winners
    (41, '9780307265434', 'The Remains of the Day', 1, 'Paperback', 256, '1989-01-01', 2020),
    (42, '9780307386471', 'The Unbearable Lightness of Being', 2, 'Paperback', 352, '1984-01-01', 2021),
    (43, '9780374527839', 'The Lover', 3, 'Paperback', 128, '1984-01-01', 2022),
    (44, '9780374534769', 'The Sea', 4, 'Paperback', 208, '2005-01-01', 2020),
    (45, '9780374117795', 'The Sound of Things Falling', 5, 'Paperback', 288, '2011-01-01', 2021),
    
    -- Science Fiction & Fantasy
    (46, '9780553382564', 'Dune', 6, 'Paperback', 896, '1965-08-01', 2020),
    (47, '9780547928203', 'The Hobbit', 7, 'Paperback', 320, '1937-09-21', 2021),
    (48, '9780544003415', 'The Lord of the Rings', 8, 'Paperback', 1216, '1954-07-29', 2020),
    (49, '9780316769172', 'The Catcher in the Rye', 9, 'Paperback', 224, '1951-07-16', 2022),
    (50, '9780062315007', 'To Kill a Mockingbird', 10, 'Hardcover', 336, '1960-07-11', 2020);

-- Insert Authored relationships (each book needs at least one author)
INSERT INTO authored (id, book_id, author_id) VALUES
    -- Classic Literature
    (1, 1, 1),   -- One Hundred Years of Solitude - Gabriel García Márquez
    (2, 2, 2),   -- The House of the Spirits - Isabel Allende
    (3, 3, 3),   -- Half of a Yellow Sun - Chimamanda Ngozi Adichie
    (4, 4, 4),   -- Norwegian Wood - Haruki Murakami
    (5, 5, 5),   -- The Handmaid's Tale - Margaret Atwood
    (6, 6, 6),   -- Never Let Me Go - Kazuo Ishiguro
    (7, 7, 7),   -- My Brilliant Friend - Elena Ferrante
    (8, 8, 8),   -- Midnight's Children - Salman Rushdie
    (9, 9, 9),   -- Beloved - Toni Morrison
    (10, 10, 10), -- Disgrace - J.M. Coetzee
    
    -- Modern Fiction
    (11, 11, 11), -- Dear Life - Alice Munro
    (12, 12, 12), -- My Name Is Red - Orhan Pamuk
    (13, 13, 13), -- White Teeth - Zadie Smith
    (14, 14, 14), -- Atonement - Ian McEwan
    (15, 15, 15), -- The God of Small Things - Arundhati Roy
    (16, 16, 16), -- The Road - Cormac McCarthy
    (17, 17, 17), -- White Noise - Don DeLillo
    (18, 18, 18), -- Blonde - Joyce Carol Oates
    (19, 19, 19), -- American Pastoral - Philip Roth
    (20, 20, 20), -- The Left Hand of Darkness - Ursula K. Le Guin
    
    -- Stephen King
    (21, 21, 21), -- The Shining - Stephen King
    (22, 22, 21), -- It - Stephen King
    (23, 23, 21), -- Carrie - Stephen King
    
    -- Agatha Christie
    (24, 24, 22), -- Murder on the Orient Express - Agatha Christie
    (25, 25, 22), -- Death on the Nile - Agatha Christie
    
    -- George Orwell
    (26, 26, 23), -- 1984 - George Orwell
    (27, 27, 23), -- Animal Farm - George Orwell
    
    -- More Classic Authors
    (28, 28, 24), -- Pride and Prejudice - Jane Austen
    (29, 29, 25), -- Great Expectations - Charles Dickens
    (30, 30, 26), -- Crime and Punishment - Fyodor Dostoevsky
    (31, 31, 27), -- Anna Karenina - Leo Tolstoy
    (32, 32, 27), -- War and Peace - Leo Tolstoy
    (33, 33, 28), -- The Adventures of Huckleberry Finn - Mark Twain
    (34, 34, 29), -- The Old Man and the Sea - Ernest Hemingway
    (35, 35, 30), -- Mrs Dalloway - Virginia Woolf
    
    -- Contemporary Literature
    (36, 36, 3),  -- The Vanishing Half - Chimamanda Ngozi Adichie
    (37, 37, 5),  -- Where the Crawdads Sing - Margaret Atwood
    (38, 38, 13), -- Normal People - Zadie Smith
    (39, 39, 13), -- Such a Fun Age - Zadie Smith
    (40, 40, 14), -- The Midnight Library - Ian McEwan
    
    -- Nobel Prize Winners
    (41, 41, 6),  -- The Remains of the Day - Kazuo Ishiguro
    (42, 42, 12), -- The Unbearable Lightness of Being - Orhan Pamuk
    (43, 43, 10), -- The Lover - J.M. Coetzee
    (44, 44, 10), -- The Sea - J.M. Coetzee
    (45, 45, 2),  -- The Sound of Things Falling - Isabel Allende
    
    -- Science Fiction & Fantasy
    (46, 46, 20), -- Dune - Ursula K. Le Guin
    (47, 47, 20), -- The Hobbit - Ursula K. Le Guin
    (48, 48, 20), -- The Lord of the Rings - Ursula K. Le Guin
    (49, 49, 29), -- The Catcher in the Rye - Ernest Hemingway
    (50, 50, 9);  -- To Kill a Mockingbird - Toni Morrison

-- Insert Ratings (each book gets 4-7 ratings, minimum 1)
INSERT INTO ratings (id, book_id, rating) VALUES
    -- Book 1: One Hundred Years of Solitude (6 ratings)
    (1, 1, 5.0),
    (2, 1, 4.5),
    (3, 1, 5.0),
    (4, 1, 4.0),
    (5, 1, 5.0),
    (6, 1, 3.5),
    
    -- Book 2: The House of the Spirits (5 ratings)
    (7, 2, 5.0),
    (8, 2, 4.0),
    (9, 2, 5.0),
    (10, 2, 4.5),
    (11, 2, 4.0),
    
    -- Book 3: Half of a Yellow Sun (6 ratings)
    (12, 3, 5.0),
    (13, 3, 5.0),
    (14, 3, 4.0),
    (15, 3, 4.5),
    (16, 3, 5.0),
    (17, 3, 5.0),
    
    -- Book 4: Norwegian Wood (6 ratings)
    (18, 4, 4.0),
    (19, 4, 5.0),
    (20, 4, 3.0),
    (21, 4, 4.0),
    (22, 4, 5.0),
    (23, 4, 4.0),
    
    -- Book 5: The Handmaid's Tale (7 ratings)
    (24, 5, 5.0),
    (25, 5, 5.0),
    (26, 5, 4.0),
    (27, 5, 4.5),
    (28, 5, 5.0),
    (29, 5, 5.0),
    (30, 5, 4.0),
    
    -- Book 6: Never Let Me Go (5 ratings)
    (31, 6, 4.0),
    (32, 6, 5.0),
    (33, 6, 3.5),
    (34, 6, 4.0),
    (35, 6, 5.0),
    
    -- Book 7: My Brilliant Friend (5 ratings)
    (36, 7, 5.0),
    (37, 7, 4.5),
    (38, 7, 5.0),
    (39, 7, 4.0),
    (40, 7, 5.0),
    
    -- Book 8: Midnight's Children (6 ratings)
    (41, 8, 5.0),
    (42, 8, 4.0),
    (43, 8, 5.0),
    (44, 8, 4.5),
    (45, 8, 5.0),
    (46, 8, 4.0),
    
    -- Book 9: Beloved (7 ratings)
    (47, 9, 5.0),
    (48, 9, 5.0),
    (49, 9, 4.0),
    (50, 9, 5.0),
    (51, 9, 4.5),
    (52, 9, 5.0),
    (53, 9, 5.0),
    
    -- Book 10: Disgrace (5 ratings)
    (54, 10, 4.0),
    (55, 10, 5.0),
    (56, 10, 4.5),
    (57, 10, 3.0),
    (58, 10, 5.0),
    
    -- Book 11: Dear Life (5 ratings)
    (59, 11, 5.0),
    (60, 11, 4.0),
    (61, 11, 4.5),
    (62, 11, 5.0),
    (63, 11, 4.0),
    
    -- Book 12: My Name Is Red (6 ratings)
    (64, 12, 5.0),
    (65, 12, 4.0),
    (66, 12, 4.5),
    (67, 12, 5.0),
    (68, 12, 5.0),
    (69, 12, 4.0),
    
    -- Book 13: White Teeth (7 ratings)
    (70, 13, 5.0),
    (71, 13, 4.0),
    (72, 13, 4.5),
    (73, 13, 5.0),
    (74, 13, 5.0),
    (75, 13, 4.0),
    (76, 13, 4.5),
    
    -- Book 14: Atonement (6 ratings)
    (77, 14, 5.0),
    (78, 14, 5.0),
    (79, 14, 4.0),
    (80, 14, 4.5),
    (81, 14, 5.0),
    (82, 14, 5.0),
    
    -- Book 15: The God of Small Things (7 ratings)
    (83, 15, 5.0),
    (84, 15, 5.0),
    (85, 15, 4.0),
    (86, 15, 5.0),
    (87, 15, 4.5),
    (88, 15, 4.0),
    (89, 15, 5.0),
    
    -- Book 16: The Road (5 ratings)
    (90, 16, 4.0),
    (91, 16, 5.0),
    (92, 16, 4.5),
    (93, 16, 5.0),
    (94, 16, 4.0),
    
    -- Book 17: White Noise (6 ratings)
    (95, 17, 4.0),
    (96, 17, 5.0),
    (97, 17, 4.5),
    (98, 17, 3.5),
    (99, 17, 4.0),
    (100, 17, 5.0),
    
    -- Book 18: Blonde (5 ratings)
    (101, 18, 4.0),
    (102, 18, 5.0),
    (103, 18, 3.5),
    (104, 18, 4.5),
    (105, 18, 5.0),
    
    -- Book 19: American Pastoral (7 ratings)
    (106, 19, 5.0),
    (107, 19, 4.0),
    (108, 19, 5.0),
    (109, 19, 4.5),
    (110, 19, 5.0),
    (111, 19, 4.0),
    (112, 19, 4.5),
    
    -- Book 20: The Left Hand of Darkness (5 ratings)
    (113, 20, 5.0),
    (114, 20, 5.0),
    (115, 20, 4.0),
    (116, 20, 5.0),
    (117, 20, 4.5),
    
    -- Book 21: The Shining (7 ratings)
    (118, 21, 5.0),
    (119, 21, 5.0),
    (120, 21, 4.0),
    (121, 21, 5.0),
    (122, 21, 4.5),
    (123, 21, 5.0),
    (124, 21, 5.0),
    
    -- Book 22: It (5 ratings)
    (125, 22, 4.0),
    (126, 22, 5.0),
    (127, 22, 4.5),
    (128, 22, 5.0),
    (129, 22, 4.0),
    
    -- Book 23: Carrie (5 ratings)
    (130, 23, 4.0),
    (131, 23, 5.0),
    (132, 23, 4.5),
    (133, 23, 5.0),
    (134, 23, 4.0),
    
    -- Book 24: Murder on the Orient Express (5 ratings)
    (135, 24, 5.0),
    (136, 24, 5.0),
    (137, 24, 4.0),
    (138, 24, 5.0),
    (139, 24, 4.5),
    
    -- Book 25: Death on the Nile (6 ratings)
    (140, 25, 4.0),
    (141, 25, 5.0),
    (142, 25, 4.5),
    (143, 25, 5.0),
    (144, 25, 4.0),
    (145, 25, 5.0),
    
    -- Book 26: 1984 (6 ratings)
    (146, 26, 5.0),
    (147, 26, 5.0),
    (148, 26, 5.0),
    (149, 26, 4.0),
    (150, 26, 5.0),
    (151, 26, 5.0),
    
    -- Book 27: Animal Farm (5 ratings)
    (152, 27, 4.0),
    (153, 27, 5.0),
    (154, 27, 4.5),
    (155, 27, 5.0),
    (156, 27, 5.0),
    
    -- Book 28: Pride and Prejudice (5 ratings)
    (157, 28, 5.0),
    (158, 28, 5.0),
    (159, 28, 4.0),
    (160, 28, 5.0),
    (161, 28, 5.0),
    
    -- Book 29: Great Expectations (5 ratings)
    (162, 29, 4.0),
    (163, 29, 5.0),
    (164, 29, 4.5),
    (165, 29, 5.0),
    (166, 29, 4.0),
    
    -- Book 30: Crime and Punishment (6 ratings)
    (167, 30, 5.0),
    (168, 30, 5.0),
    (169, 30, 4.0),
    (170, 30, 5.0),
    (171, 30, 5.0),
    (172, 30, 4.5),
    
    -- Book 31: Anna Karenina (6 ratings)
    (173, 31, 5.0),
    (174, 31, 5.0),
    (175, 31, 4.0),
    (176, 31, 5.0),
    (177, 31, 5.0),
    (178, 31, 4.5),
    
    -- Book 32: War and Peace (5 ratings)
    (179, 32, 5.0),
    (180, 32, 4.0),
    (181, 32, 5.0),
    (182, 32, 5.0),
    (183, 32, 4.5),
    
    -- Book 33: The Adventures of Huckleberry Finn (4 ratings)
    (184, 33, 4.0),
    (185, 33, 5.0),
    (186, 33, 4.5),
    (187, 33, 5.0),
    
    -- Book 34: The Old Man and the Sea (5 ratings)
    (188, 34, 4.0),
    (189, 34, 5.0),
    (190, 34, 4.5),
    (191, 34, 5.0),
    (192, 34, 4.0),
    
    -- Book 35: Mrs Dalloway (5 ratings)
    (193, 35, 5.0),
    (194, 35, 4.0),
    (195, 35, 5.0),
    (196, 35, 4.5),
    (197, 35, 5.0),
    
    -- Book 36: The Vanishing Half (5 ratings)
    (198, 36, 5.0),
    (199, 36, 4.0),
    (200, 36, 5.0),
    (201, 36, 4.5),
    (202, 36, 5.0),
    
    -- Book 37: Where the Crawdads Sing (5 ratings)
    (203, 37, 4.0),
    (204, 37, 5.0),
    (205, 37, 4.5),
    (206, 37, 5.0),
    (207, 37, 4.0),
    
    -- Book 38: Normal People (4 ratings)
    (208, 38, 5.0),
    (209, 38, 4.0),
    (210, 38, 5.0),
    (211, 38, 4.5),
    
    -- Book 39: Such a Fun Age (5 ratings)
    (212, 39, 4.0),
    (213, 39, 5.0),
    (214, 39, 4.5),
    (215, 39, 5.0),
    (216, 39, 4.0),
    
    -- Book 40: The Midnight Library (5 ratings)
    (217, 40, 5.0),
    (218, 40, 4.0),
    (219, 40, 5.0),
    (220, 40, 4.5),
    (221, 40, 5.0),
    
    -- Book 41: The Remains of the Day (5 ratings)
    (222, 41, 5.0),
    (223, 41, 5.0),
    (224, 41, 4.0),
    (225, 41, 5.0),
    (226, 41, 4.5),
    
    -- Book 42: The Unbearable Lightness of Being (5 ratings)
    (227, 42, 5.0),
    (228, 42, 4.0),
    (229, 42, 5.0),
    (230, 42, 4.5),
    (231, 42, 5.0),
    
    -- Book 43: The Lover (4 ratings)
    (232, 43, 4.0),
    (233, 43, 5.0),
    (234, 43, 4.5),
    (235, 43, 5.0),
    
    -- Book 44: The Sea (5 ratings)
    (236, 44, 4.0),
    (237, 44, 5.0),
    (238, 44, 4.5),
    (239, 44, 5.0),
    (240, 44, 4.0),
    
    -- Book 45: The Sound of Things Falling (4 ratings)
    (241, 45, 5.0),
    (242, 45, 4.0),
    (243, 45, 5.0),
    (244, 45, 4.5),
    
    -- Book 46: Dune (5 ratings)
    (245, 46, 5.0),
    (246, 46, 5.0),
    (247, 46, 4.0),
    (248, 46, 5.0),
    (249, 46, 5.0),
    
    -- Book 47: The Hobbit (5 ratings)
    (250, 47, 5.0),
    (251, 47, 5.0),
    (252, 47, 4.0),
    (253, 47, 5.0),
    (254, 47, 5.0),
    
    -- Book 48: The Lord of the Rings (6 ratings)
    (255, 48, 5.0),
    (256, 48, 5.0),
    (257, 48, 5.0),
    (258, 48, 4.0),
    (259, 48, 5.0),
    (260, 48, 5.0),
    
    -- Book 49: The Catcher in the Rye (6 ratings)
    (261, 49, 4.0),
    (262, 49, 5.0),
    (263, 49, 4.5),
    (264, 49, 5.0),
    (265, 49, 4.0),
    (266, 49, 5.0),
    
    -- Book 50: To Kill a Mockingbird (7 ratings)
    (267, 50, 5.0),
    (268, 50, 5.0),
    (269, 50, 5.0),
    (270, 50, 4.0),
    (271, 50, 5.0),
    (272, 50, 5.0),
    (273, 50, 5.0);