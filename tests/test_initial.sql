-- Test 1: Vérification des utilisateurs
SELECT username, account_status, created 
FROM dba_users 
WHERE username IN ('C##ZONE_NORD', 'C##ZONE_CENTRE', 'C##ZONE_CAPVERT', 'C##ZONE_SUD');

-- Test 2: Vérification des privilèges
SELECT grantee, privilege 
FROM dba_sys_privs 
WHERE grantee IN ('C##ZONE_NORD', 'C##ZONE_CENTRE', 'C##ZONE_CAPVERT', 'C##ZONE_SUD')
ORDER BY grantee;