-- Se connecter en tant qu'administrateur
CONNECT system/votre_mot_de_passe

-- Vérifier si les tables existent
SELECT table_name 
FROM all_tables 
WHERE owner IN ('C##ZONE_NORD', 'C##ZONE_CENTRE', 'C##ZONE_CAPVERT', 'C##ZONE_SUD');

-- Test des contraintes de tables
-- Test 1: Insertion d'un ENO
INSERT INTO enos (nom_eno, zone) VALUES ('ENO Test', 'NORD');

-- Test 2: Insertion d'un enseignant
INSERT INTO enseignants (nom, prenom, grade, eno_fk)
VALUES ('Test', 'Test', 'PROFESSEUR', 1);