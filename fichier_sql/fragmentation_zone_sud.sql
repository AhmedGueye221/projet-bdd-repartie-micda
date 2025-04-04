CREATE TABLE etudiants_sud AS
SELECT e.*
FROM system.etudiants e
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'SUD';

CREATE TABLE preinscriptions_sud AS
SELECT p.*
FROM system.preinscriptions p
JOIN system.etudiants e ON p.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'SUD';

CREATE TABLE inscriptions_sud AS
SELECT i.*
FROM system.inscriptions i
JOIN system.etudiants e ON i.ine_fk = e.ine
JOIN system.enos en ON e.eno_fk = en.eno_id
WHERE en.zone = 'SUD';
