-- Indeks na koloni indeks u tabeli studenti
CREATE INDEX IF NOT EXISTS idx_studenti_indeks
ON fakultet_schema.studenti (indeks);

-- Indeks na koloni predmet_id u tabeli predmeti
CREATE INDEX idx_predmeti_predmet_id
ON fakultet_schema.predmeti (predmet_id);

-- Indeks na koloni prijava_id u tabeli prijave_ispita
CREATE INDEX idx_prijave_ispita_prijava_id
ON fakultet_schema.prijave_ispita (prijava_id);

-- Indeks na koloni student_id u tabeli uplate
CREATE INDEX idx_uplate_student_id
ON fakultet_schema.uplate (student_id);

-- Komande za brisanje indeksa
DROP INDEX IF EXISTS fakultet_schema.idx_studenti_indeks;
DROP INDEX IF EXISTS fakultet_schema.idx_predmeti_predmet_id;
DROP INDEX IF EXISTS fakultet_schema.idx_prijave_ispita_prijava_id;
DROP INDEX IF EXISTS fakultet_schema.idx_uplate_student_id;

-- Upiti nad tabelama sa indeksima i bez indeksa (poredjenje performansi)
-- 1) Nad tabelom studenti
EXPLAIN ANALYZE SELECT * FROM fakultet_schema.studenti WHERE indeks = '2018/067' AND smer_id = 2;

-- 2) Nad tabelom predmeti
EXPLAIN ANALYZE SELECT * FROM fakultet_schema.predmeti WHERE predmet_id = 1;

-- 3) Nad tabelom prijave_ispita
EXPLAIN ANALYZE SELECT * FROM fakultet_schema.prijave_ispita WHERE prijava_id = 10;

-- 4) Nad tabelom uplate
EXPLAIN ANALYZE SELECT * FROM fakultet_schema.uplate WHERE student_id = 5;