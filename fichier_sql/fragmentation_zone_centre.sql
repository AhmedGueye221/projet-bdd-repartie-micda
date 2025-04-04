CREATE TABLE etudiants_centre AS
SELECT e.*
FROM system.etudiants e
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'CENTRE';

CREATE TABLE preinscriptions_centre AS
SELECT p.*
FROM system.preinscriptions p
JOIN system.etudiants e ON p.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'CENTRE';

CREATE TABLE inscriptions_centre AS
SELECT i.*
FROM system.inscriptions i
JOIN system.etudiants e ON i.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'CENTRE';
