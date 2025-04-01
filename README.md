# Projet Base de Données Répartie MICDA

## 📂 Structure du projet
```
projet-bdd-repartie-micda/
├── fichier_sql/
│   ├── Tables.sql                      # Création des tables globales
│   ├── DeclencheursMaterializedView.sql # Vues matérialisées et déclencheurs
│   ├── Requettes.sql                   # Requêtes par zone
│   └── admin.sql                       # Configuration admin et utilisateurs
├── tests/
│   ├── test_users.sql                  # Tests des utilisateurs
│   └── test_tables.sql                 # Tests des tables
└── docs/
    └── README.md                       # Documentation détaillée
```

## 📝 Description des fichiers

### Tables.sql
- ✅ Création des tables de base
- ✅ Définition des contraintes
- Tables créées :
  - `enos`
  - `enseignants`
  - `formations`
  - À compléter...

### admin.sql
- ✅ Création des utilisateurs zones
  ```sql
  C##ZONE_NORD
  C##ZONE_CENTRE
  C##ZONE_CAPVERT
  C##ZONE_SUD
  ```
- ✅ Attribution des privilèges
  - CREATE VIEW
  - CREATE MATERIALIZED VIEW
  - CREATE SYNONYM

### test_users.sql
- ✅ Test de création des utilisateurs
- ✅ Test des privilèges
- ✅ Test des connexions
- Résultats : Tous les tests passent

### test_tables.sql
- ✅ Test de création des tables
- ✅ Test des contraintes
- ❌ Test des insertions à compléter

### DeclencheursMaterializedView.sql (À compléter)
- Structure par zone définie
- En attente d'implémentation des :
  - Vues matérialisées
  - Déclencheurs
  - Synchronisation

### Requettes.sql (À compléter)
- Structure par zone définie
- En attente des requêtes :
  - Liste des étudiants
  - Statistiques
  - Filtres par zone

## 🔄 État d'avancement

### Réalisé ✅
1. Configuration administrative
   - Création des utilisateurs
   - Attribution des privilèges
   - Tests de connexion

2. Structure de base
   - Création des tables principales
   - Définition des contraintes
   - Tests de base

### En cours 🚧
1. Complétion des tables
2. Tests d'insertion
3. Documentation

### À faire ❌
1. Fragmentation des données
2. Vues matérialisées
3. Déclencheurs
4. Requêtes spécifiques

## 🚀 Prochaines étapes
1. Compléter Tables.sql
2. Implémenter les fragments
3. Créer les vues matérialisées
4. Configurer les déclencheurs
5. Développer les requêtes