# Projet SIGESR - Base de Données Répartie MICDA

## 📂 Structure du projet
```
projet-bdd-repartie-micda/
├── admin/
│   ├── create_users.sql          # Création des utilisateurs par zone
│   └── init_system.sql           # Configuration système initiale
│
├── global/
│   ├── create_tables.sql         # Tables globales SIGESR
│   └── insert_data.sql           # Données de base
│
├── zones/
│   ├── nord/
│   │   ├── fragments.sql         # Définition des fragments zone nord
│   │   ├── materialized_views.sql# Vues matérialisées ENOs nord
│   │   └── triggers.sql          # Déclencheurs synchronisation
│   ├── centre/
│   ├── cap_vert/
│   └── sud/
│
├── tests/
│   ├── test_system.sql          # Tests configuration système
│   ├── test_fragments.sql       # Tests fragmentation par zone
│   └── test_sync.sql           # Tests synchronisation
│
└── queries/
    ├── global_queries.sql       # Requêtes statistiques SIGESR
    └── zone_queries.sql         # Requêtes spécifiques par zone
```

## 🎯 Organisation par composants

### 1. Système Central (SIGESR)
- Gestion des numéros INE
- Attribution codes SIGESR
- Statistiques globales
- Gestion préinscriptions CAMPUSEN

### 2. Zones d'implantation
- **Zone Nord** : Saint-Louis, Louga, Linguère, Podor
- **Zone Centre** : Kaolack, Diourbel, Thiès, Mbour
- **Zone Cap-Vert** : Dakar, Guédiawaye, Sébikotane, Keur Massar, Pikine
- **Zone Sud** : Ziguinchor, Kolda, Bignona

### 3. Fragmentation des données
- Fragments horizontaux par zone
- Fragments dérivés par ENO
- Réplication des données de référence

### 4. Synchronisation
- Vues matérialisées par zone
- Déclencheurs de mise à jour
- Logs de synchronisation

## 📝 État d'avancement

### Réalisé ✅
- Configuration utilisateurs zones
- Tables de base

### En cours 🚧
- Fragmentation des données
- Vues matérialisées

### À faire ❌
- Synchronisation entre zones
- Requêtes statistiques
- Interface utilisateur

## 🚀 Prochaines étapes
1. Définir les fragments par zone
2. Implémenter les vues matérialisées
3. Configurer les déclencheurs
4. Développer les requêtes statistiques
5. Créer l'interface utilisateur