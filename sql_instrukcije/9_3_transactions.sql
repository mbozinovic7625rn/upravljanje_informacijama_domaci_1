-- Transakcija: Ažuriranje ocene sa kontrolom postojanja studenta
BEGIN;

-- 1. KORAK: Kreiramo kontrolnu tačku
SAVEPOINT pre_promene;

-- 2. KORAK: Pokušaj izmene ocene
UPDATE fakultet_schema.prijave_ispita
SET ocena = 5, status_id = 3
WHERE prijava_id = 10;

DO $$
DECLARE
    student_broj INT;
BEGIN
    SELECT COUNT(*) INTO student_broj
    FROM fakultet_schema.studenti s
    JOIN fakultet_schema.prijave_ispita p ON s.student_id = p.student_id
    WHERE p.prijava_id = 10;

    IF student_broj = 0 THEN
        RAISE NOTICE 'Student ne postoji – poništavamo promene ručno!';
    END IF;
END $$;

ROLLBACK TO SAVEPOINT pre_promene;

COMMIT;
