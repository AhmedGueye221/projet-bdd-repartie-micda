-- Insertion d'un ENO dans la zone NORD
INSERT INTO enos (nom_eno, zone)
VALUES ('ENO Saint-Louis', 'NORD');

-- Insertion d'un ENO dans la zone CAP-VERT
INSERT INTO enos (nom_eno, zone)
VALUES ('ENO Dakar', 'CAP-VERT');

-- Insertion d’un enseignant
INSERT INTO enseignants (nom, prenom, grade, eno_fk)
VALUES ('Sow', 'Mame', 'PROFESSEUR', 1);

-- Insertion d’un pôle
INSERT INTO poles (nom_pole, responsable_pole_fk)
VALUES ('Pôle TIC', 1);

-- Insertion d'une formation
INSERT INTO formations (nom_formation, pole_fk, responsable_formation_fk)
VALUES ('Licence Info', 1, 1);

-- Insertion d'une filière
INSERT INTO filieres (nom_filiere, formation_fk)
VALUES ('MIC', 1);

-- Insertion des étudiants (zone NORD et CAP-VERT)
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE001', 'Diop', 'Awa', TO_DATE('2001-05-15', 'YYYY-MM-DD'), 1);

INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE002', 'Fall', 'Moussa', TO_DATE('2000-11-23', 'YYYY-MM-DD'), 2);

-- Préinscriptions
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE001', 1, '2021/2022', 'VALIDE');

INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE002', 1, '2021/2022', 'EN_ATTENTE');

-- Inscriptions
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE001', 1, '2021/2022', 'ACTIF');

INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE002', 1, '2021/2022', 'ACTIF');

COMMIT;


