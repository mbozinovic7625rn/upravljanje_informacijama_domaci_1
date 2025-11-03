-- Funkcija za izračunavanje prosečne ocene studenta
CREATE OR REPLACE FUNCTION fakultet_schema.izracunaj_prosecnu_ocenu(p_student_id INT)
RETURNS NUMERIC AS $$
DECLARE
    prosecna_ocena NUMERIC;
BEGIN
    SELECT ROUND(AVG(ocena), 2) INTO prosecna_ocena
    FROM fakultet_schema.prijave_ispita AS pi
    WHERE pi.student_id = p_student_id AND pi.ocena > 5;

    RETURN prosecna_ocena;
END;
$$ LANGUAGE plpgsql;

-- Poziv za ovu funkciju može izgledati ovako:
-- SELECT fakultet_schema.izracunaj_prosecnu_ocenu(1);
-- SELECT fakultet_schema.izracunaj_prosecnu_ocenu(2);

-- Funkcija za broj položenih ispita u datom ispitnom roku
CREATE OR REPLACE FUNCTION fakultet_schema.broj_polozenih_ispita_u_roku(p_ispitni_rok_id INT)
RETURNS INT AS $$
DECLARE
    broj_polozenih INT;
BEGIN
    SELECT COUNT(pi.prijava_id) INTO broj_polozenih
    FROM fakultet_schema.prijave_ispita AS pi
    JOIN fakultet_schema.ispiti AS i ON pi.ispit_id = i.ispit_id
    WHERE i.rok_id = p_ispitni_rok_id AND pi.ocena > 5;

    RETURN broj_polozenih;
END; 
$$ LANGUAGE plpgsql;

-- Poziv za ovu funkciju može izgledati ovako:
-- SELECT fakultet_schema.broj_polozenih_ispita_u_roku(1);
-- SELECT fakultet_schema.broj_polozenih_ispita_u_roku(2);