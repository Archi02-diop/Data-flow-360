CREATE TABLE utilisateurs (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE regions (
    id_region INT AUTO_INCREMENT PRIMARY KEY,
    nom_region VARCHAR(100)  NOT NULL,
    ville VARCHAR(100) NOT NULL
);

CREATE TABLE etablissements (
    id_etablissement INT AUTO_INCREMENT PRIMARY KEY,
    nom_etablissement VARCHAR(100),
    status VARCHAR(50),
    id_region INT,
    CONSTRAINT fk_region_etablissement FOREIGN KEY (id_region) REFERENCES regions(id_region)
);

CREATE TABLE eleves (
    id_eleve INT AUTO_INCREMENT PRIMARY KEY,
    nom_eleve VARCHAR(100),
    prenom_eleve VARCHAR(100),
    date_naissance DATE,
    sexe VARCHAR(20),
    redouble BOOLEAN,
    id_etablissement INT,
    CONSTRAINT fk_etablissement_eleve FOREIGN KEY (id_etablissement) REFERENCES etablissements(id_etablissement)
);

CREATE TABLE matieres (
    id_matiere INT AUTO_INCREMENT PRIMARY KEY,
    nom_matiere VARCHAR(100)
);

CREATE TABLE enseignants (
    id_enseignant INT AUTO_INCREMENT PRIMARY KEY,
    nom_enseignant VARCHAR(100),
    domaine VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    sexe VARCHAR(50)
);

CREATE TABLE cours (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    niveau VARCHAR(50),
    duree INT,
    id_matiere INT,
    id_enseignant INT,
    CONSTRAINT fk_cours_matiere FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere),
    CONSTRAINT fk_cours_enseignant FOREIGN KEY (id_enseignant) REFERENCES enseignants(id_enseignant)
);



CREATE TABLE noter (
    id_note INT AUTO_INCREMENT PRIMARY KEY,
    id_eleve INT NOT NULL,
    id_matiere INT NOT NULL,
    annee INT,
    note float,
    type VARCHAR(15),
    CONSTRAINT fk_eleves_matieres FOREIGN KEY (id_eleve) REFERENCES eleves(id_eleve),
    CONSTRAINT fk_matieres_eleves FOREIGN KEY (id_matiere) REFERENCES matieres(id_matiere)
);

CREATE TABLE presence (
    id_presence INT AUTO_INCREMENT PRIMARY KEY,
    id_eleve INT NOT NULL,
    id_cours INT NOT NULL,
    date_cours DATE,
    present BOOLEAN,
    CONSTRAINT fk_eleves_cours FOREIGN KEY (id_eleve) REFERENCES eleves(id_eleve),
    CONSTRAINT fk_cours_eleves FOREIGN KEY (id_cours) REFERENCES cours(id_cours)
);
