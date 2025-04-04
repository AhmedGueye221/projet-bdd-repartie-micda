SET ECHO OFF
SET FEEDBACK ON
SET HEADING ON
SET PAGESIZE 100
SET LINESIZE 100

PROMPT ===================== ÉTAPE 1 : SUPPRESSION DES FRAGMENTS =====================
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/clear_fragments.sql"

PROMPT ===================== ÉTAPE 2 : RECONNEXION SYSTEM & INSERTION =====================
CONNECT system;
PROMPT --- Création des tables si besoin ---
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/Tables.sql"

PROMPT --- Insertion des données ---
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/test_insert_data.sql"

PROMPT ===================== ÉTAPE 3 : FRAGMENTATION =====================

PROMPT --- Zone NORD ---
CONNECT c##zone_nord/nord123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_nord.sql"

PROMPT --- Zone CAP-VERT ---
CONNECT c##zone_capvert/capvert123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_capvert.sql"

PROMPT --- Zone CENTRE ---
CONNECT c##zone_centre/centre123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_centre.sql"

PROMPT --- Zone SUD ---
CONNECT c##zone_sud/sud123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_sud.sql"

PROMPT ===================== ÉTAPE 4 : VÉRIFICATION =====================
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/verifier_fragments.sql"

PROMPT ✅✅ Test complet terminé avec succès !
