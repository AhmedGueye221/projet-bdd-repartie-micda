SET ECHO OFF
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 100

PROMPT ============ Suppression fragments ZONE NORD ==============
CONNECT c##zone_nord/nord123;

DROP TABLE etudiants_nord CASCADE CONSTRAINTS;
DROP TABLE preinscriptions_nord CASCADE CONSTRAINTS;
DROP TABLE inscriptions_nord CASCADE CONSTRAINTS;


PROMPT ============ Suppression fragments ZONE CAP-VERT ===========
CONNECT c##zone_capvert/capvert123;

DROP TABLE etudiants_capvert CASCADE CONSTRAINTS;
DROP TABLE preinscriptions_capvert CASCADE CONSTRAINTS;
DROP TABLE inscriptions_capvert CASCADE CONSTRAINTS;


PROMPT ============ Suppression fragments ZONE CENTRE ============
CONNECT c##zone_centre/centre123;

DROP TABLE etudiants_centre CASCADE CONSTRAINTS;
DROP TABLE preinscriptions_centre CASCADE CONSTRAINTS;
DROP TABLE inscriptions_centre CASCADE CONSTRAINTS;


PROMPT ============ Suppression fragments ZONE SUD ===============
CONNECT c##zone_sud/sud123;

DROP TABLE etudiants_sud CASCADE CONSTRAINTS;
DROP TABLE preinscriptions_sud CASCADE CONSTRAINTS;
DROP TABLE inscriptions_sud CASCADE CONSTRAINTS;

PROMPT ✅ Tous les fragments ont été supprimés avec succès !
