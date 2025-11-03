-- 1) Procedura za dodavanje novog studenta
CREATE OR REPLACE PROCEDURE fakultet_schema.dodaj_studenta(
    p_indeks VARCHAR,
    p_ime VARCHAR,
    p_prezime VARCHAR,
    p_jmbg VARCHAR,
    p_email VARCHAR,
    p_datum DATE,
    p_smer_id INT,
    p_godina INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO fakultet_schema.studenti (indeks, ime, prezime, jmbg, email, datum_rodjenja, smer_id, godina_upisa)
    VALUES (p_indeks, p_ime, p_prezime, p_jmbg, p_email, p_datum, p_smer_id, p_godina);
END;
$$;

-- Poziv na tu proceduru je sledeći:
-- CALL dodaj_studenta('2025/005', 'Ana', 'Marić', '1112223334445', 'amaricrn525@raf.rs', '2004-07-12', 1, 2025);
-- CALL dodaj_studenta('2025/006', 'Marko', 'Jovanović', '5556667778889', 'mjovanovicsi625@raf.rs', '2003-11-23', 3, 2025);
-- CALL dodaj_studenta('2025/007', 'Jovan', 'Pavlović', '5556667778889', 'mjovanovicri725@raf.rs', '2003-11-23', 2, 2025);

-- 2) Procedura za ažuriranje ocene studenta
CREATE OR REPLACE PROCEDURE fakultet_schema.azuziraj_ocenu_studenta(
    p_prijava_id INT,
    p_ocena INT,
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE fakultet_schema.prijave_ispita
    SET ocena = p_ocena
    WHERE prijava_id = p_prijava_id;
END;
$$;

-- Pozivi za ovu proceduru su sledeći:
-- CALL azuziraj_ocenu_studenta(1, 8);
-- CALL azuziraj_ocenu_studenta(2, 9);
-- CALL azuziraj_ocenu_studenta(3, 10);