-- Connexion : c##zone_nord

CREATE TABLE etudiants_nord AS
SELECT e.*
FROM system.etudiants e
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'NORD';

CREATE TABLE preinscriptions_nord AS
SELECT p.*
FROM system.preinscriptions p
JOIN system.etudiants e ON p.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'NORD';

CREATE TABLE inscriptions_nord AS
SELECT i.*
FROM system.inscriptions i
JOIN system.etudiants e ON i.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'NORD';
