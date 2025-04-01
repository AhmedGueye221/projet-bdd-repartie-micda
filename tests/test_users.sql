-- Création des utilisateurs manquants
CREATE USER c##zone_centre IDENTIFIED BY centre123;
CREATE USER c##zone_capvert IDENTIFIED BY capvert123;
CREATE USER c##zone_sud IDENTIFIED BY sud123;

-- Attribution des privilèges
GRANT CONNECT, RESOURCE TO c##zone_centre;
GRANT CONNECT, RESOURCE TO c##zone_capvert;
GRANT CONNECT, RESOURCE TO c##zone_sud;

GRANT CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_centre;
GRANT CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_capvert;
GRANT CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_sud;

-- Test des utilisateurs et leurs privilèges
SELECT username, account_status, created 
FROM dba_users 
WHERE username IN ('C##ZONE_NORD', 'C##ZONE_CENTRE', 'C##ZONE_CAPVERT', 'C##ZONE_SUD');

-- Test des privilèges système
SELECT grantee, privilege 
FROM dba_sys_privs 
WHERE grantee IN ('C##ZONE_NORD', 'C##ZONE_CENTRE', 'C##ZONE_CAPVERT', 'C##ZONE_SUD')
ORDER BY grantee;

-- Test des connexions
CONNECT c##zone_nord/nord123
SELECT USER FROM dual;
DISCONNECT;

CONNECT c##zone_centre/centre123
SELECT USER FROM dual;
DISCONNECT;

CONNECT c##zone_capvert/capvert123
SELECT USER FROM dual;
DISCONNECT;

CONNECT c##zone_sud/sud123
SELECT USER FROM dual;
DISCONNECT;