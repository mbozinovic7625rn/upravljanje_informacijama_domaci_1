-- KREIRANJE TABELA

CREATE TABLE IF NOT EXISTS statusi_studenata (
    status_id SERIAL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL,
    opis TEXT
);

CREATE TABLE IF NOT EXISTS nivoi_studija (
    nivo_id SERIAL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL,
    opis TEXT
);

CREATE TABLE IF NOT EXISTS titule (
    titula_id SERIAL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL,
    opis TEXT,
    skracenica VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS smerovi (
    smer_id SERIAL PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL,
    opis TEXT,
    nivo_id INT REFERENCES nivoi_studija(nivo_id)
);

CREATE TABLE IF NOT EXISTS studenti (
    student_id SERIAL PRIMARY KEY,
    ime VARCHAR(100) NOT NULL,
    prezime VARCHAR(100) NOT NULL,
    jmbg CHAR(13) UNIQUE NOT NULL,
    indeks VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    datum_rodjenja DATE NOT NULL,
    godina_upisa INT NOT NULL,
    status_id INT REFERENCES statusi_studenata(status_id),
    smer_id INT REFERENCES smerovi(smer_id)
);

CREATE TABLE IF NOT EXISTS profesori (
    profesor_id SERIAL PRIMARY KEY,
    ime VARCHAR(100) NOT NULL,
    prezime VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    titula_id INT REFERENCES titule(titula_id)
);

CREATE TABLE IF NOT EXISTS predmeti (
    predmet_id SERIAL PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL,
    espb INT NOT NULL,
    semestar INT NOT NULL
);

CREATE TABLE IF NOT EXISTS smerovi_predmeti (
    smer_id INT REFERENCES smerovi(smer_id),
    predmet_id INT REFERENCES predmeti(predmet_id),
    PRIMARY KEY (smer_id, predmet_id)
);

CREATE TABLE IF NOT EXISTS profesori_predmeti (
    profesor_id INT REFERENCES profesori(profesor_id),
    predmet_id INT REFERENCES predmeti(predmet_id),
    PRIMARY KEY (profesor_id, predmet_id)
);

CREATE TABLE IF NOT EXISTS upisani_predmeti (
    upisan_predmet_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES studenti(student_id),
    predmet_id INT REFERENCES predmeti(predmet_id),
    godina INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ispitni_rokovi (
    rok_id SERIAL PRIMARY KEY,
    naziv VARCHAR(100) NOT NULL,
    pocetak DATE NOT NULL,
    kraj DATE NOT NULL,
    godina INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ispiti (
    ispit_id SERIAL PRIMARY KEY,
    predmet_id INT REFERENCES predmeti(predmet_id),
    rok_id INT REFERENCES ispitni_rokovi(rok_id),
    datum DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS profesori_ispiti (
    profesor_id INT REFERENCES profesori(profesor_id),
    ispit_id INT REFERENCES ispiti(ispit_id),
    PRIMARY KEY (profesor_id, ispit_id)
);

CREATE TABLE IF NOT EXISTS statusi_prijave (
    status_id SERIAL PRIMARY KEY,
    naziv VARCHAR(50) NOT NULL,
    opis TEXT
);

CREATE TABLE IF NOT EXISTS prijave_ispita (
    prijava_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES studenti(student_id),
    ispit_id INT REFERENCES ispiti(ispit_id),
    datum_prijave DATE NOT NULL,
    ocena INT,
    poeni DOUBLE PRECISION,
    status_id INT REFERENCES statusi_prijave(status_id)
);

CREATE TABLE IF NOT EXISTS biblioteka (
    knjiga_id SERIAL PRIMARY KEY,
    naslov VARCHAR(200) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    isbn CHAR(13) UNIQUE NOT NULL,
    godina_izdanja INT NOT NULL,
    dostupna BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS pozajmice (
    pozajmica_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES studenti(student_id),
    knjiga_id INT REFERENCES biblioteka(knjiga_id),
    datum_pozajmice DATE NOT NULL,
    datum_vracanja DATE
);

CREATE TABLE IF NOT EXISTS uplate (
    uplata_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES studenti(student_id),
    iznos DOUBLE PRECISION NOT NULL,
    datum_uplate DATE NOT NULL,
    svrha VARCHAR(255) NOT NULL
);