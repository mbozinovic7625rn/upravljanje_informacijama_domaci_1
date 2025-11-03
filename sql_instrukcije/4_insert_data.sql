-- NIVOI STUDIJA
INSERT INTO fakultet_schema.nivoi_studija (naziv, opis)
VALUES
('Osnovne studije', 'Trogodišnje ili četvorogodišnje osnovne akademske studije'),
('Master studije', 'Jednogodišnje ili dvogodišnje master akademske studije');

-- STATUSI STUDENATA
INSERT INTO fakultet_schema.statusi_studenata (naziv, opis)
VALUES
('Aktivan', 'Student trenutno sluša predmete i polaže ispite'),
('Na pauzi', 'Student je privremeno prekinuo studije'),
('Diplomirao', 'Student je završio studije i stekao zvanje');

-- TITULE PROFESORA
INSERT INTO fakultet_schema.titule (naziv, opis, skracenica)
VALUES
('Docent', 'Nastavnik u zvanju docenta', 'Doc.'),
('Vanredni profesor', 'Nastavnik u zvanju vanrednog profesora', 'Van.prof.'),
('Redovni profesor', 'Nastavnik u zvanju redovnog profesora', 'Prof.');

-- SMEROVI
INSERT INTO fakultet_schema.smerovi (naziv, opis, nivo_id)
VALUES
('Računarske nauke', 'Osnovne akademske studije računarskih nauka', 1),
('Računarsko inženjerstvo', 'Osnovne akademske studije računarskog inženjerstva', 1),
('Softversko inženjerstvo', 'Osnovne akademske studije softverskog inženjerstva', 1),
('Računarske nauke', 'Master akademske studije računarskih nauka', 2),
('Računarsko inženjerstvo', 'Master akademske studije računarskog inženjerstva', 2),
('Softversko inženjerstvo', 'Master akademske studije softverskog inženjerstva', 2);

-- STUDENTI
INSERT INTO fakultet_schema.studenti (ime, prezime, jmbg, indeks, email, datum_rodjenja, godina_upisa, status_id, smer_id)
VALUES
('Mihailo', 'Božinović', '0101999123456', '2020/001', 'mbozinovicrn120@raf.rs', '1999-01-01', 2020, 1, 1),
('Ana', 'Petrović', '0202000123456', '2021/023', 'apetrovicri2321@raf.rs', '2000-02-02', 2021, 1, 2),
('Nikola', 'Jovanović', '0301998123456', '2019/045', 'njovanovicrn4519@raf.rs', '1998-03-03', 2019, 3, 1),
('Teodora', 'Marković', '0402002123456', '2023/018', 'tmarkovicsi1823@raf.rs', '2002-04-04', 2023, 1, 3),
('Luka', 'Kovačević', '0501997123456', '2018/067', 'lkovacevicri6718@raf.rs', '1997-05-05', 2018, 2, 2);

-- UPLATE
INSERT INTO fakultet_schema.uplate (student_id, iznos, datum_uplate, svrha)
VALUES
(1, 120000.00, '2024-09-01', 'Školarina za 2024/2025. godinu'),
(2, 6000.00, '2025-02-15', 'Članarina biblioteke'),
(3, 115000.00, '2023-09-10', 'Školarina za 2023/2024. godinu'),
(4, 130000.00, '2025-01-22', 'Školarina - Softversko inženjerstvo'),
(5, 2000.00, '2025-03-10', 'Naknada za duplikat indeksa');

-- BIBLIOTEKA
INSERT INTO fakultet_schema.biblioteka (naslov, autor, isbn, godina_izdanja, dostupna)
VALUES
('Uvod u programiranje', 'Brian Kernighan i Dennis Ritchie', '9780131103627', 2019, TRUE),
('Baze podataka: principi i dizajn', 'Elmasri & Navathe', '9780321197849', 2020, TRUE),
('Računarske mreže', 'Andrew S. Tanenbaum', '9780132126953', 2018, FALSE),
('Mašinsko učenje: koncepti i primena', 'Tom Mitchell', '9780070428072', 2021, TRUE),
('Softversko inženjerstvo', 'Ian Sommerville', '9780137035151', 2016, TRUE),
('Kriptografija i bezbednost', 'William Stallings', '9780134444284', 2018, TRUE);

-- POZAJMICE 
INSERT INTO fakultet_schema.pozajmice (student_id, knjiga_id, datum_pozajmice, datum_vracanja)
VALUES
(1, 3, '2025-01-20', '2025-02-02'),
(2, 2, '2025-03-11', NULL),
(4, 5, '2025-06-25', '2025-07-10'),
(5, 6, '2025-04-01', NULL);

-- PROFESORI
INSERT INTO fakultet_schema.profesori (ime, prezime, email, titula_id) VALUES
('Petar', 'Milić', 'petar.milic@raf.edu.rs', 3),
('Marko', 'Stanković', 'marko.stankovic@raf.edu.rs', 2),
('Ivana', 'Radosavljević', 'ivana.radosavljevic@raf.edu.rs', 1),
('Aleksandar', 'Jovanović', 'aleksandar.jovanovic@raf.edu.rs', 2),
('Milica', 'Petrović', 'milica.petrovic@raf.edu.rs', 3),
('Dejan', 'Pavlović', 'dejan.pavlovic@raf.edu.rs', 2),
('Jelena', 'Kovačević', 'jelena.kovacevic@raf.edu.rs', 1),
('Nenad', 'Rakić', 'nenad.rakic@raf.edu.rs', 1),
('Bojan', 'Lukić', 'bojan.lukic@raf.edu.rs', 3);

-- ISPITNI ROKOVI
INSERT INTO fakultet_schema.ispitni_rokovi (naziv, pocetak, kraj, godina)
VALUES
('Januarski rok', '2025-01-10', '2025-01-30', 2025),
('Aprilski rok', '2025-04-10', '2025-04-25', 2025),
('Juniski rok', '2025-06-05', '2025-06-25', 2025),
('Septembarski rok', '2025-09-01', '2025-09-20', 2025),
('Oktobarski rok', '2025-10-05', '2025-10-20', 2025);

-- STATUSI PRIJAVE ISPITA 
INSERT INTO fakultet_schema.statusi_prijave (naziv, opis)
VALUES
('Prijavljen', 'Student se prijavio na ispit'),
('Položio', 'Student je uspešno položio ispit'),
('Diskvalifikovan', 'Student je diskvalifikovan sa ispita zbog kršenja pravila'),
('Pao', 'Student nije položio ispit');

-- PREDMETI
-- I semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Linearna algebra i analitička geometrija', 8, 1),
('Diskretne strukture', 8, 1),
('Uvod u programiranje', 8, 1),
('Engleski 1', 3, 1),
('Poslovne aplikacije', 3, 1);

-- II semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Matematička analiza', 8, 2),
('Osnovi računarskih sistema', 8, 2),
('Objektno-orijentisano programiranje', 8, 2),
('Engleski 2', 3, 2),
('Pismeno i usmeno izražavanje', 3, 2);

-- III semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Algoritmi i strukture podataka', 8, 3),
('Dizajn softvera', 8, 3),
('Inteligentni sistemi', 8, 3),
('Napredna matematička analiza', 6, 3),
('Osnovi elektronike', 8, 3),
('Signali i sistemi', 8, 3);

-- IV semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Operativni sistemi', 8, 4),
('Računarske mreže', 8, 4),
('Baze podataka', 8, 4),
('Arhitektura računara', 6, 4),
('Digitalne komunikacije', 8, 4),
('Dizajn i analiza algoritama', 6, 4);

-- V semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Verovatnoća i statistika', 6, 5),
('Programski prevodioci', 6, 5),
('Primenjena veštačka inteligencija', 6, 5),
('Paralelni algoritmi', 6, 5),
('Nauka o podacima', 6, 5),
('Osnovi nauke o podacima', 6, 5),
('Testiranje softvera', 6, 5),
('Softverske komponente', 6, 5),
('Skript jezici', 6, 5),
('Računarska grafika', 6, 5),
('Uvod u računarsku bezbednost', 6, 5);

-- VI semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Interakcija čovek-računar', 6, 6),
('Mašinsko učenje', 6, 6),
('Funkcionalno programiranje', 6, 6),
('Analitika i vizualizacija podataka', 6, 6),
('Kriptografija', 6, 6),
('Razvoj mobilnih aplikacija', 6, 6),
('Integrisani informacioni sistemi', 6, 6),
('Veb programiranje', 6, 6),
('Softverski procesi', 6, 6),
('Programiranje sistema', 6, 6),
('Konstrukcija softvera', 6, 6);

-- VII semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Kombinatorika i teorija grafova', 6, 7),
('Upravljanje projektima', 6, 7),
('DevOps', 6, 7),
('Razvoj računarskih igara', 6, 7),
('Veliki podaci', 6, 7),
('Duboko učenje', 6, 7),
('Skladišta podataka', 6, 7),
('Napredno veb programiranje', 6, 7),
('Internet stvari', 6, 7),
('Kompjuterski vid', 6, 7),
('Etika računarske bezbednosti', 6, 7),
('Bezbednost računarskih sistema', 6, 7);

-- VIII semestar
INSERT INTO fakultet_schema.predmeti (naziv, espb, semestar) VALUES
('Teorija algoritama, automata i jezika', 8, 8),
('Softversko inženjerstvo', 7, 8),
('Konkurentni i distribuirani sistemi', 6, 8),
('Namenski računarski sistemi', 7, 8),
('Digitalna obrada signala', 8, 8),
('Primenjeni distribuirani sistemi', 6, 8),
('Završni rad – Istraživanje i priprema', 4, 8),
('Završni rad – Izrada i odbrana', 2, 8),
('Stručna praksa', 3, 8);

-- Spajanje predmeta i smerova
-- 1) RN - Računarske nauke (osnovne studije)
INSERT INTO fakultet_schema.smerovi_predmeti (smer_id, predmet_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),     -- I semestar
(1, 6), (1, 7), (1, 8), (1, 9), (1, 10),   -- II semestar
(1, 11), (1, 12), (1, 13), (1, 14), (1, 15), -- III semestar
(1, 16), (1, 17), (1, 18), (1, 19), (1, 20), -- IV semestar
(1, 21), (1, 22), (1, 23), (1, 24), (1, 25), (1, 26), -- V semestar
(1, 27), (1, 28), (1, 29), (1, 30), (1, 31), (1, 32), (1, 33), (1, 34), -- VI semestar
(1, 35), (1, 36), (1, 37), (1, 38), (1, 39), (1, 40), -- VII semestar
(1, 41), (1, 42), (1, 43), (1, 44), (1, 45), (1, 46), (1, 47), (1, 48), (1, 49); -- VIII semestar

-- 2) RI - Računarsko inženjerstvo (osnovne studije)
INSERT INTO fakultet_schema.smerovi_predmeti (smer_id, predmet_id) VALUES
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(2, 11), (2, 12), (2, 13), (2, 14),
(2, 16), (2, 17), (2, 18), (2, 19),
(2, 21), (2, 23), (2, 25), (2, 26),
(2, 27), (2, 29), (2, 31), (2, 33),
(2, 35), (2, 36), (2, 37), (2, 38),
(2, 41), (2, 43), (2, 45), (2, 47);

-- 3) SI - Softversko inženjerstvo (osnovne studije)
INSERT INTO smerovi_predmeti (smer_id, predmet_id) VALUES
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
(3, 6), (3, 7), (3, 8), (3, 9),
(3, 11), (3, 12), (3, 13), (3, 14),
(3, 16), (3, 17), (3, 18),
(3, 21), (3, 22), (3, 23), (3, 24),
(3, 27), (3, 28), (3, 29), (3, 31),
(3, 35), (3, 36), (3, 37), (3, 38), (3, 39),
(3, 41), (3, 42), (3, 43), (3, 45), (3, 46), (3, 47);

-- Povezivanje profesora i predmeta koje predaju
INSERT INTO fakultet_schema.profesori_predmeti (profesor_id, predmet_id) VALUES
-- Prof. Milić (osnove programiranja i algoritmi)
(1, 3), (1, 11), (1, 12), (1, 14),
-- Prof. Stanković (računarske mreže, sistemi)
(2, 17), (2, 18), (2, 19), (2, 41),
-- Prof. Radosavljević (AI, podaci, ML)
(3, 23), (3, 24), (3, 27), (3, 35),
-- Prof. Jovanović (baze, operativni)
(4, 16), (4, 20), (4, 42),
-- Prof. Petrović (bezbednost, kripto)
(5, 30), (5, 31), (5, 32), (5, 45),
-- Prof. Pavlović (softver, devops)
(6, 25), (6, 26), (6, 37), (6, 46),
-- Prof. Kovačević (verovatnoća, matematika)
(7, 21), (7, 22), (7, 10),
-- Prof. Rakić (računarska grafika, multimedija)
(8, 29), (8, 39),
-- Prof. Lukić (projektni menadžment, teorija)
(9, 36), (9, 43), (9, 47);

-- ISPITI
INSERT INTO fakultet_schema.ispiti (predmet_id, rok_id, datum)
VALUES
(3, 1, '2025-01-15'),   -- Uvod u programiranje, januarski
(17, 3, '2025-06-12'),  -- Računarske mreže, jun
(29, 4, '2025-09-05'),  -- Računarska grafika, septembar
(23, 3, '2025-06-18'),  -- Primenjena veštačka inteligencija, jun
(21, 2, '2025-04-14'),  -- Verovatnoća i statistika, aprilski
(16, 3, '2025-06-20'),  -- Operativni sistemi, jun
(42, 4, '2025-09-10'),  -- Softversko inženjerstvo, septembar
(45, 5, '2025-10-08'),  -- Kriptografija, oktobarski
(41, 1, '2025-01-25'),  -- Teorija algoritama, automata i jezika, januarski
(27, 3, '2025-06-16');  -- Interakcija čovek-računar, jun

-- PROFESRORI ISPITI
INSERT INTO fakultet_schema.profesori_ispiti (profesor_id, ispit_id)
VALUES
(1, 1),  -- Petar Milić – Uvod u programiranje
(2, 2),  -- Marko Stanković – Računarske mreže
(8, 3),  -- Nenad Rakić – Računarska grafika
(3, 4),  -- Ivana Radosavljević – Primenjena veštačka inteligencija
(7, 5),  -- Jelena Kovačević – Verovatnoća i statistika
(4, 6),  -- Aleksandar Jovanović – Operativni sistemi
(5, 8),  -- Milica Petrović – Kriptografija
(6, 7),  -- Dejan Pavlović – Softversko inženjerstvo
(9, 9),  -- Bojan Lukić – Teorija algoritama, automata i jezika
(3, 10); -- Ivana Radosavljević – Interakcija čovek-računar

-- PRIJAVE ISPITA
INSERT INTO fakultet_schema.prijave_ispita (student_id, ispit_id, datum_prijave, ocena, poeni, status_id)
VALUES
(1, 1, '2025-01-10', 10, 96.5, 2),  -- Mihailo položio Uvod u programiranje
(2, 2, '2025-06-05', 9, 88.0, 2),   -- Ana položila Računarske mreže
(4, 3, '2025-08-28', 6, 51.0, 2),   -- Teodora položila Računarsku grafiku
(1, 4, '2025-06-10', 8, 83.0, 2),   -- Mihailo položio Primenjenu AI
(5, 5, '2025-04-05', 5, 47.0, 4),   -- Luka pao Verovatnoću
(3, 6, '2025-06-15', 7, 70.0, 2),   -- Nikola položio Operativne sisteme
(2, 7, '2025-09-01', 10, 98.0, 2),  -- Ana položila Softversko inženjerstvo
(4, 8, '2025-10-02', NULL, NULL, 1),-- Teodora samo prijavila Kriptografiju
(1, 9, '2025-01-20', 9, 89.0, 2),   -- Mihailo položio Teoriju algoritama
(5, 10, '2025-06-05', 6, 55.0, 2);  -- Luka položio Interakciju čovek-računar