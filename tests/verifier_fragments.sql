SET ECHO OFF
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 100
SET LINESIZE 100

PROMPT ============ ZONE NORD ==============
CONNECT c##zone_nord/nord123;

PROMPT --- ETUDIANTS_NORD ---
SELECT COUNT(*) AS total_etudiants_nord FROM etudiants_nord;

PROMPT --- PREINSCRIPTIONS_NORD ---
SELECT COUNT(*) AS total_preinscriptions_nord FROM preinscriptions_nord;

PROMPT --- INSCRIPTIONS_NORD ---
SELECT COUNT(*) AS total_inscriptions_nord FROM inscriptions_nord;


PROMPT ============ ZONE CAP-VERT ===========
CONNECT c##zone_capvert/capvert123;

PROMPT --- ETUDIANTS_CAPVERT ---
SELECT COUNT(*) AS total_etudiants_capvert FROM etudiants_capvert;

PROMPT --- PREINSCRIPTIONS_CAPVERT ---
SELECT COUNT(*) AS total_preinscriptions_capvert FROM preinscriptions_capvert;

PROMPT --- INSCRIPTIONS_CAPVERT ---
SELECT COUNT(*) AS total_inscriptions_capvert FROM inscriptions_capvert;


PROMPT ============ ZONE CENTRE ============
CONNECT c##zone_centre/centre123;

PROMPT --- ETUDIANTS_CENTRE ---
SELECT COUNT(*) AS total_etudiants_centre FROM etudiants_centre;

PROMPT --- PREINSCRIPTIONS_CENTRE ---
SELECT COUNT(*) AS total_preinscriptions_centre FROM preinscriptions_centre;

PROMPT --- INSCRIPTIONS_CENTRE ---
SELECT COUNT(*) AS total_inscriptions_centre FROM inscriptions_centre;


PROMPT ============ ZONE SUD ===============
CONNECT c##zone_sud/sud123;

PROMPT --- ETUDIANTS_SUD ---
SELECT COUNT(*) AS total_etudiants_sud FROM etudiants_sud;

PROMPT --- PREINSCRIPTIONS_SUD ---
SELECT COUNT(*) AS total_preinscriptions_sud FROM preinscriptions_sud;

PROMPT --- INSCRIPTIONS_SUD ---
SELECT COUNT(*) AS total_inscriptions_sud FROM inscriptions_sud;
