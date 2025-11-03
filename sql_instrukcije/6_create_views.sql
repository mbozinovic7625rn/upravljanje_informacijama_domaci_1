-- VIEW: Pregled studenata sa smerovima, brojem položenih ispita, prosečnom ocenom, minimalnom i maksimalnom ocenom
CREATE OR REPLACE VIEW fakultet_schema.studenti_analitika AS 
SELECT 
    CONCAT(
		UPPER(SUBSTRING(SPLIT_PART(sm.naziv, ' ', 1), 1, 1)), 
		UPPER(SUBSTRING(SPLIT_PART(sm.naziv, ' ', 2), 1, 1)), 
        ' ',
		st.indeks
	) AS indeks,
    st.ime,
    st.prezime,
    sm.naziv AS smer,
    COUNT(CASE WHEN pi.ocena > 5 THEN 1 END) AS broj_polozenih_ispita,
    ROUND(AVG(pi.ocena), 2) AS prosecna_ocena,
    MIN(pi.ocena) AS minimalna_ocena,
    MAX(pi.ocena) AS maksimalna_ocena
FROM fakultet_schema.studenti AS st
JOIN fakultet_schema.smerovi AS sm ON (st.smer_id = sm.smer_id)
LEFT JOIN fakultet_schema.prijave_ispita AS pi ON (pi.student_id = st.student_id)
GROUP BY st.indeks, st.ime, st.prezime, sm.naziv;

-- VIEW: Pregled profesora i predmeta koji predaju
CREATE OR REPLACE VIEW fakultet_schema.profesori_po_predmetima AS 
SELECT 
    p.ime || ' ' || p.prezime AS profesor,
    p.email AS profesor_email,
    pr.naziv AS naziv_predmeta,
    pr.espb AS espb_predmeta
FROM fakultet_schema.profesori AS p
JOIN fakultet_schema.profesori_predmeti AS pp ON (p.profesor_id = pp.profesor_id)
JOIN fakultet_schema.predmeti AS pr ON (pp.predmet_id = pr.predmet_id);

-- VIEW: Ukupan broj ESPB-a koji su studenti ostvarili po smerovima
CREATE OR REPLACE VIEW fakultet_schema.ukupni_espb_po_smerovima AS
SELECT 
    sm.naziv AS smer,
    ROUND(AVG(pi.ocena), 2) AS prosecna_ocena,
    SUM(pr.espb) AS ukupno_ostvarenih_espb
FROM fakultet_schema.studenti AS st
JOIN fakultet_schema.smerovi AS sm ON (st.smer_id = sm.smer_id)
JOIN fakultet_schema.prijave_ispita AS pi ON (st.student_id = pi.student_id)
JOIN fakultet_schema.ispiti AS i ON (pi.ispit_id = i.ispit_id)
JOIN fakultet_schema.predmeti AS pr ON (i.predmet_id = pr.predmet_id)
WHERE pi.ocena > 5
GROUP BY sm.naziv;
