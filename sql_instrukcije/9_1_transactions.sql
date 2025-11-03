-- Transakcija: Dodavanje novog studenta i početne uplate za studenta (I rata ili cela školarina)
BEGIN;

-- 1. KORAK: Dodavanje novog studenta (ID 6)
INSERT INTO fakultet_schema.studenti
(student_id, ime, prezime, jmbg, indeks, email, datum_rodjenja, godina_upisa, status_id, smer_id)
VALUES
(DEFAULT, 'Jovan', 'Jovanović', '1311002710047', '2025/164',
'jjovanovic16425rn@raf.rs', '2004-05-15', 2025, 1, 1);

-- 2. KORAK: Dodavanje početne uplate
INSERT INTO fakultet_schema.uplate (student_id, iznos, datum_uplate, svrha)
SELECT student_id, 30000, CURRENT_TIMESTAMP, 'Prva rata školarine'
FROM fakultet_schema.studenti AS s
WHERE s.indeks = '2025/164' AND s.smer_id = 1;

-- 3. KORAK: Validacija
DO $$
DECLARE
    v_student_count INT;
    v_uplata_count INT;
BEGIN
    -- Provera da li je student dodat
    SELECT COUNT(*) INTO v_student_count
    FROM fakultet_schema.studenti
    WHERE indeks = '2025/164' AND jmbg = '1311002710047';
    
    IF v_student_count = 0 THEN
        RAISE EXCEPTION 'ROLLBACK: Student nije uspešno dodat!';
    END IF;
    
    -- Provera da li je uplata zabeležena ZA OVOG STUDENTA
    SELECT COUNT(*) INTO v_uplata_count
    FROM fakultet_schema.uplate AS u
    JOIN fakultet_schema.studenti AS s ON s.student_id = u.student_id
    WHERE s.indeks = '2025/164'
      AND u.iznos = 30000
      AND DATE(u.datum_uplate) = CURRENT_DATE;
    
    IF v_uplata_count = 0 THEN
        RAISE EXCEPTION 'ROLLBACK: Uplata nije uspešno zabeležena!';
    END IF;
    
    RAISE NOTICE 'Transakcija uspešna! Student i uplata dodati.';
END $$;

COMMIT;