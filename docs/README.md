# Base de Données Répartie MICDA - Documentation des Tests

## 📋 Table des matières
- [Prérequis](#prérequis)
- [Structure des tests](#structure-des-tests)
- [Tests réalisés](#tests-réalisés)
- [Exécution des tests](#exécution-des-tests)
- [Vérification des résultats](#vérification-des-résultats)
- [Résolution des problèmes](#résolution-des-problèmes)
- [Prochaines étapes](#prochaines-étapes)

## 🔧 Prérequis
- Oracle Database 21c
- SQL*Plus
- Visual Studio Code (recommandé)

## 📁 Structure des tests
```
projet-bdd-repartie-micda/
├── tests/
│   ├── test_users.sql     # Test des utilisateurs et privilèges
│   └── test_tables.sql    # Test des tables et contraintes
└── fichier_sql/
    └── Tables.sql         # Création des tables
```

## ✅ Tests réalisés

### Test des utilisateurs
1. Connexion à Oracle :
```cmd
sqlplus system/votre_mot_de_passe
```

2. Exécution du test :
```cmd
@"c:\Users\Surface Laptop\projet-bdd-repartie-micda\tests\test_users.sql"
```

#### Résultats attendus
- [x] 4 utilisateurs créés (NORD, CENTRE, CAP-VERT, SUD)
- [x] Privilèges accordés
- [x] Connexions réussies

### Test des tables
1. Exécution :
```cmd
@"c:\Users\Surface Laptop\projet-bdd-repartie-micda\tests\test_tables.sql"
```

#### Résultats attendus
- [x] Tables créées
- [x] Contraintes actives
- [x] Insertions réussies

## 🚀 Exécution des tests

### Test complet
```cmd
# 1. Test utilisateurs
sqlplus system/votre_mot_de_passe @"c:\Users\Surface Laptop\projet-bdd-repartie-micda\tests\test_users.sql"

# 2. Test tables
sqlplus system/votre_mot_de_passe @"c:\Users\Surface Laptop\projet-bdd-repartie-micda\tests\test_tables.sql"
```

## 🔍 Vérification des résultats

### Utilisateurs
```sql
-- Vérification utilisateurs
SELECT username, account_status 
FROM dba_users 
WHERE username LIKE 'C##ZONE%';

-- Vérification privilèges
SELECT grantee, privilege 
FROM dba_sys_privs 
WHERE grantee LIKE 'C##ZONE%';
```

### Tables
```sql
-- Liste des tables
SELECT table_name 
FROM all_tables 
WHERE owner = 'SYSTEM';

-- Liste des contraintes
SELECT constraint_name, constraint_type, table_name
FROM all_constraints
WHERE owner = 'SYSTEM';
```

## ❌ Résolution des problèmes

| Erreur | Solution |
|--------|----------|
| ORA-01017 | Vérifier le mot de passe |
| SP2-0310 | Vérifier le chemin du fichier |
| Table inexistante | Exécuter Tables.sql |

## 📝 Prochaines étapes
1. Implémentation des fragmentations
2. Création des vues matérialisées
3. Tests des déclencheurs