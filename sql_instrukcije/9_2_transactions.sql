-- Transakcija u proceduri: Pozajmljivanje knjige iz bibilioteke ako je knjiga dostupna
CREATE OR REPLACE PROCEDURE fakultet_schema.pozajmi_knjigu(
    p_student_id INT,
    p_knjiga_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_dostupna BOOLEAN;
    v_knjiga_postoji BOOLEAN;
BEGIN
    -- 1. Provera postojanja studenta
    IF NOT EXISTS (SELECT 1 FROM fakultet_schema.studenti WHERE student_id = p_student_id) THEN
        RAISE EXCEPTION 'Student % ne postoji!', p_student_id;
    END IF;

    -- 2. Provera postojanja knjige
    SELECT EXISTS(SELECT 1 FROM fakultet_schema.biblioteka WHERE knjiga_id = p_knjiga_id)
    INTO v_knjiga_postoji;
    
    IF NOT v_knjiga_postoji THEN
        RAISE EXCEPTION 'Knjiga % ne postoji u biblioteci!', p_knjiga_id;
    END IF;

    -- 3. Provera dostupnosti knjige
    SELECT dostupna INTO v_dostupna
    FROM fakultet_schema.biblioteka
    WHERE knjiga_id = p_knjiga_id;

    IF v_dostupna IS NULL OR v_dostupna = FALSE THEN
        RAISE EXCEPTION 'Knjiga % nije dostupna za pozajmljivanje!', p_knjiga_id;
    END IF;

    -- 4. Kreiraj pozajmicu
    INSERT INTO fakultet_schema.pozajmice (student_id, knjiga_id, datum_pozajmice)
    VALUES (p_student_id, p_knjiga_id, CURRENT_DATE);

    -- 5. Ažuriraj dostupnost knjige
    UPDATE fakultet_schema.biblioteka
    SET dostupna = FALSE
    WHERE knjiga_id = p_knjiga_id;

    RAISE NOTICE 'Student % je uspešno pozajmio knjigu %.', p_student_id, p_knjiga_id;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Greška: %', SQLERRM;
        RAISE;
END;
$$;
