
# 📦 Fragmentation des Données - Projet MICDA

## 🎯 Objectif

Ce module explique **la fragmentation horizontale** des tables `etudiants`, `preinscriptions`, et `inscriptions` selon les **zones géographiques** du projet MICDA : NORD, CENTRE, CAP-VERT et SUD.  
Cela permet de **répartir les données entre plusieurs sites** tout en gardant un schéma global dans `system`.

---

## 📁 Fichiers concernés

```bash
fichier_sql/
├── fragmentation_zone_nord.sql
├── fragmentation_zone_centre.sql
├── fragmentation_zone_capvert.sql
├── fragmentation_zone_sud.sql

tests/
├── verifier_fragments.sql
├── clear_fragments.sql
├── retest_complet.sql
```

---

## 🛠️ Étapes d'exécution

### 1. Connexion à Oracle

```sql
sqlplus /nolog
CONNECT system;
```

### 2. Créer les tables globales dans SYSTEM (si pas encore fait)

```sql
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/Tables.sql"
```

### 3. Insérer des données de test (étudiants, enos, etc.)

```sql
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/test_insert_data.sql"
```

### 4. Donner les droits aux utilisateurs des zones

```sql
GRANT SELECT ON etudiants TO c##zone_nord, c##zone_centre, c##zone_capvert, c##zone_sud;
GRANT SELECT ON enos TO c##zone_nord, c##zone_centre, c##zone_capvert, c##zone_sud;
GRANT SELECT ON preinscriptions TO c##zone_nord, c##zone_centre, c##zone_capvert, c##zone_sud;
GRANT SELECT ON inscriptions TO c##zone_nord, c##zone_centre, c##zone_capvert, c##zone_sud;
```

---

## 🧩 Création des fragments par zone

> ⚠️ Exécuter chaque script **en étant connecté à l’utilisateur de la zone**

### 🔹 Zone Nord

```sql
CONNECT c##zone_nord/nord123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_nord.sql"
```

### 🔹 Zone Cap-Vert

```sql
CONNECT c##zone_capvert/capvert123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_capvert.sql"
```

### 🔹 Zone Centre

```sql
CONNECT c##zone_centre/centre123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_centre.sql"
```

### 🔹 Zone Sud

```sql
CONNECT c##zone_sud/sud123;
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/fichier_sql/fragmentation_zone_sud.sql"
```

---

## ✅ Vérification des fragments (recommandé)

```sql
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/verifier_fragments.sql"
```

Chaque bloc affichera le nombre de lignes présentes dans les fragments comme :
- `etudiants_nord`, `preinscriptions_nord`, `inscriptions_nord`
- `etudiants_capvert`, etc.

---

## 🔁 Pour tout réinitialiser automatiquement

```sql
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/retest_complet.sql"
```

Ce script :
1. Supprime tous les fragments
2. Réinsère les données dans SYSTEM
3. Crée tous les fragments de chaque zone
4. Vérifie les résultats

---

## 🧹 Pour supprimer manuellement les fragments

```sql
@"c:/Users/Surface Laptop/projet-bdd-repartie-micda/tests/clear_fragments.sql"
```

---

## 📌 Date de dernière mise à jour : 04/04/2025
Auteur : ndieye diop & Mohamed Gueye

