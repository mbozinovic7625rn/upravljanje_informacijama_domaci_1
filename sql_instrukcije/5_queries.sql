-- Spisak svih studenata sa statusom i smerom
SELECT 
    s.student_id,
    s.ime || ' ' || s.prezime AS student,
    sm.naziv AS smer,
    st.naziv AS status
FROM fakultet_schema.studenti s
JOIN fakultet_schema.smerovi sm ON s.smer_id = sm.smer_id
JOIN fakultet_schema.statusi_studenata st ON s.status_id = st.status_id
ORDER BY sm.naziv, s.prezime;

-- Ukupna uplata svakog studenta
SELECT 
    s.ime || ' ' || s.prezime AS student,
    SUM(u.iznos) AS ukupno_uplaceno
FROM fakultet_schema.studenti s
JOIN fakultet_schema.uplate u ON s.student_id = u.student_id
GROUP BY s.student_id
ORDER BY ukupno_uplaceno DESC;

-- Studenti koji trenutno nisu vratili knjige
SELECT 
    s.ime || ' ' || s.prezime AS student,
    b.naslov AS knjiga,
    p.datum_pozajmice
FROM fakultet_schema.pozajmice p
JOIN fakultet_schema.studenti s ON p.student_id = s.student_id
JOIN fakultet_schema.biblioteka b ON p.knjiga_id = b.knjiga_id
WHERE p.datum_vracanja IS NULL;

-- Profesori i broj predmeta koje predaju
SELECT 
    p.ime || ' ' || p.prezime AS profesor,
    COUNT(pp.predmet_id) AS broj_predmeta
FROM fakultet_schema.profesori p
JOIN fakultet_schema.profesori_predmeti pp ON p.profesor_id = pp.profesor_id
GROUP BY p.profesor_id
ORDER BY broj_predmeta DESC;

-- Prosečna ocena po smeru
SELECT 
    sm.naziv AS smer,
    ROUND(AVG(pi.ocena), 2) AS prosecna_ocena
FROM fakultet_schema.prijave_ispita pi
JOIN fakultet_schema.studenti s ON pi.student_id = s.student_id
JOIN fakultet_schema.smerovi sm ON s.smer_id = sm.smer_id
WHERE pi.ocena IS NOT NULL
GROUP BY sm.naziv
ORDER BY prosecna_ocena DESC;

-- Detaljan prikaz svih prijava sa profesorima
SELECT 
    s.ime || ' ' || s.prezime AS student,
    pr.naziv AS predmet,
    ir.naziv AS rok,
    p2.ime || ' ' || p2.prezime AS profesor,
    pi.ocena,
    pi.poeni
FROM fakultet_schema.prijave_ispita pi
JOIN fakultet_schema.ispiti i ON pi.ispit_id = i.ispit_id
JOIN fakultet_schema.predmeti pr ON i.predmet_id = pr.predmet_id
JOIN fakultet_schema.ispitni_rokovi ir ON i.rok_id = ir.rok_id
JOIN fakultet_schema.profesori_ispiti psi ON i.ispit_id = psi.ispit_id
JOIN fakultet_schema.profesori p2 ON psi.profesor_id = p2.profesor_id
JOIN fakultet_schema.studenti s ON pi.student_id = s.student_id
ORDER BY s.prezime, pr.naziv;

-- Broj položenih, nepoloženih i diskvalifikovanih ispita po studentu
SELECT 
    s.ime || ' ' || s.prezime AS student,
    SUM(CASE WHEN sp.naziv = 'Položio' THEN 1 ELSE 0 END) AS polozeni,
    SUM(CASE WHEN sp.naziv = 'Pao' THEN 1 ELSE 0 END) AS pali,
    SUM(CASE WHEN sp.naziv = 'Diskvalifikovan' THEN 1 ELSE 0 END) AS diskvalifikovani
FROM fakultet_schema.studenti s
LEFT JOIN fakultet_schema.prijave_ispita pi ON s.student_id = pi.student_id
LEFT JOIN fakultet_schema.statusi_prijave sp ON pi.status_id = sp.status_id
GROUP BY s.student_id
ORDER BY polozeni DESC;

-- Najuspešniji studenti (prosek po oceni veći od 8)
SELECT 
    s.ime || ' ' || s.prezime AS student,
    ROUND(AVG(pi.ocena), 2) AS prosek
FROM fakultet_schema.prijave_ispita pi
JOIN fakultet_schema.studenti s ON pi.student_id = s.student_id
WHERE pi.ocena IS NOT NULL
GROUP BY s.student_id
HAVING AVG(pi.ocena) > 8
ORDER BY prosek DESC;

-- Najčešće polagani predmeti
SELECT 
    p.naziv AS predmet,
    COUNT(pi.prijava_id) AS broj_polaganja
FROM fakultet_schema.prijave_ispita pi
JOIN fakultet_schema.ispiti i ON pi.ispit_id = i.ispit_id
JOIN fakultet_schema.predmeti p ON i.predmet_id = p.predmet_id
GROUP BY p.predmet_id
ORDER BY broj_polaganja DESC
LIMIT 5;

-- Profesori koji su pregledali najviše ispita
SELECT 
    prf.ime || ' ' || prf.prezime AS profesor,
    COUNT(psi.ispit_id) AS broj_ispita
FROM fakultet_schema.profesori_ispiti psi
JOIN fakultet_schema.profesori prf ON psi.profesor_id = prf.profesor_id
GROUP BY prf.profesor_id
ORDER BY broj_ispita DESC;