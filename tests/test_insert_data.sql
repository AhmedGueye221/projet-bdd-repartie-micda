

-- *******************************
-- Insertion globale par zone
-- *******************************

-- 🚩 ZONE NORD
INSERT INTO enos (nom_eno, zone) VALUES ('ENO Saint-Louis', 'NORD');
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE001', 'Diop', 'Awa', TO_DATE('2001-05-15', 'YYYY-MM-DD'),
        (SELECT eno_id FROM enos WHERE nom_eno = 'ENO Saint-Louis'));

-- 🚩 ZONE CAP-VERT
INSERT INTO enos (nom_eno, zone) VALUES ('ENO Dakar', 'CAP-VERT');
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE002', 'Fall', 'Moussa', TO_DATE('2000-11-23', 'YYYY-MM-DD'),
        (SELECT eno_id FROM enos WHERE nom_eno = 'ENO Dakar'));

-- 🚩 ZONE SUD
INSERT INTO enos (nom_eno, zone) VALUES ('ENO Ziguinchor', 'SUD');
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE003', 'Sarr', 'Fatou', TO_DATE('2001-06-10','YYYY-MM-DD'),
        (SELECT eno_id FROM enos WHERE nom_eno = 'ENO Ziguinchor'));

-- 🚩 ZONE CENTRE
INSERT INTO enos (nom_eno, zone) VALUES ('ENO Mbour', 'CENTRE');
INSERT INTO etudiants (ine, nom, prenom, date_naissance, eno_fk)
VALUES ('INE004', 'Ndour', 'Aliou', TO_DATE('2000-12-05','YYYY-MM-DD'),
        (SELECT eno_id FROM enos WHERE nom_eno = 'ENO Mbour'));


-- 📚 Tous sont dans la même filière (id=1) pour les tests
-- Tu peux adapter selon ton besoin.

-- 📌 Préinscriptions
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE001', 1, '2021/2022', 'VALIDE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE002', 1, '2021/2022', 'EN_ATTENTE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE003', 1, '2021/2022', 'VALIDE');
INSERT INTO preinscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE004', 1, '2021/2022', 'VALIDE');

-- 📌 Inscriptions
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE001', 1, '2021/2022', 'ACTIF');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE002', 1, '2021/2022', 'ACTIF');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE003', 1, '2021/2022', 'ACTIF');
INSERT INTO inscriptions (ine_fk, filiere_fk, annee_academique, statut)
VALUES ('INE004', 1, '2021/2022', 'ACTIF');

COMMIT;
