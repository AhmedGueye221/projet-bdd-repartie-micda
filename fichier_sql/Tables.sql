/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'ADMINISTRATEUR DE LA BASE DE DONNÉES        *
*                                                                                       *   
*****************************************************************************************/

                /**************************************************************
                 *                                                            *
                 *                creation DES TABLES DE LA BDD               *
                 *                                                            *
                 **************************************************************/

                    /********************
                    *   Tables de base  *
                    *********************/
CREATE TABLE poles (
    pole_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_pole VARCHAR2(100) NOT NULL,
    responsable_pole_fk NUMBER NOT NULL,
    /* Contrainte pour specifier qu'on definis une cle etrangere [enseignant_id] de la table [enseignants], NB: la cle etrangere a ete renommer en responsable de pole */
    CONSTRAINT contrainte_cle_etrangere_responsable_pole FOREIGN KEY (responsable_pole_fk) REFERENCES enseignants(enseignant_id)
);

CREATE TABLE enos (
    eno_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_eno VARCHAR2(100) NOT NULL,
    zone VARCHAR2(10) NOT NULL,
    /* Contrainte pour specifier que la colonne [zone] ne peut prendre que 4 valeur a savoir [NORD,CENTRE,CAP-VERT,SUD]*/
    CONSTRAINT contrainte_zone CHECK (zone IN ('NORD', 'CENTRE', 'CAP-VERT', 'SUD'))
);

CREATE TABLE enseignants (
    enseignant_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    grade VARCHAR2(50) NOT NULL,
    eno_fk NUMBER,
    /* Contrainte pour specifier qu'on definis une cle etrangere [eno_id] de la table [enos] renommer en [eno_fk]*/
    CONSTRAINT contrainte_cle_etrangere_eno FOREIGN KEY (eno_fk) REFERENCES enos(eno_id),
    /* Contrainte pour specifier que la colonne [grade] ne peut prendre que 3 valeur a savoir [PROFESSEUR, MAITRE_CONFERENCE, ASSISTANT]*/
    CONSTRAINT contrainte_grade CHECK (grade IN ('PROFESSEUR', 'MAITRE_CONFERENCE', 'ASSISTANT'))
);
                    /******************************************************
                    *     Tables concernant les Structure pédagogique     *
                    *******************************************************/
CREATE TABLE formations (
    formation_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_formation VARCHAR2(100) NOT NULL,
    pole_fk NUMBER NOT NULL,
    responsable_formation_fk NUMBER NOT NULL,
    /* Contrainte pour specifier qu'on definis une cle etrangere [pole_id] de la table [poles] renommer en [pole_fk]*/
    CONSTRAINT contrainte_cle_etrangere_pole FOREIGN KEY (pole_fk) REFERENCES poles(pole_id),
    /* Contrainte pour specifier qu'on definis une cle etrangere [enseignant_id] de la table [enseignants]renommer en [responsable_formation_fk]*/
    CONSTRAINT contrainte_cle_etrangere_responsable_formation FOREIGN KEY (responsable_formation_fk) REFERENCES enseignants(enseignant_id)
);

CREATE TABLE filieres (
    filiere_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_filiere VARCHAR2(100) NOT NULL,
    formation_fk NUMBER NOT NULL,
    /* Contrainte pour specifier qu'on definis une cle etrangere [formation_id] de la table [formations] renommer en [formation_fk]*/
    CONSTRAINT contrainte_cle_etrangere_formation FOREIGN KEY (formation_fk) REFERENCES formations(formation_id)
);

CREATE TABLE unites_enseignement (
    ue_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom_ue VARCHAR2(100) NOT NULL,
    code_ue VARCHAR2(10) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    /* Contrainte pour specifier qu'on definis une cle etrangere [filiere_id] de la table [filieres] renommer en [filiere_fk]*/
    CONSTRAINT contrainte_cle_etrangere_filiere_ue FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id)
);
                    /**********************************************************
                    *             Tables concernant les étudiantes            *
                    ***********************************************************/
CREATE TABLE etudiants (
    ine VARCHAR2(20) PRIMARY KEY,
    nom VARCHAR2(50) NOT NULL,
    prenom VARCHAR2(50) NOT NULL,
    date_naissance DATE NOT NULL,
    eno_fk NUMBER NOT NULL,
    /* Contrainte pour specifier qu'on definis une cle etrangere [eno_id] de la table [enos] renommer en [eno_fk]*/
    CONSTRAINT contrainte_cle_etrangere_eno_etudiant FOREIGN KEY (eno_fk) REFERENCES enos(eno_id)
);

CREATE TABLE preinscriptions (
    preinscription_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ine_fk VARCHAR2(20) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    annee_academique VARCHAR2(9) NOT NULL,
    statut VARCHAR2(20) DEFAULT 'EN_ATTENTE',
    /* Contrainte pour specifier qu'on definis une cle etrangere [ine] de la table [etudiants] renommer en [ine_fk]*/
    CONSTRAINT contrainte_cle_etrangere_preinscription_etudiant FOREIGN KEY (ine_fk) REFERENCES etudiants(ine),
    /* Contrainte pour specifier qu'on definis une cle etrangere [filiere_id] de la table [filieres] renommer en [filiere_fk]*/
    CONSTRAINT contrainte_cle_etrangere_preinscription_filiere FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id),
    /* Contrainte de verification pour specifier qu'on accepte que ce format de date : 'yyyy/yyyy' */
    CONSTRAINT contrainte_verification_annee_preinscription CHECK (annee_academique LIKE '____/____'),
    /* Contrainte de verification pour specifier que la colonne [status] ne peut prendre que 3 valeurs à savoir [EN_ATTENTE, VALIDE, REJETE] */
    CONSTRAINT contrainte_verification_status_preinscription CHECK (statut IN ('EN_ATTENTE', 'VALIDE', 'REJETE'))
);

CREATE TABLE inscriptions (
    inscription_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ine_fk VARCHAR2(20) NOT NULL,
    filiere_fk NUMBER NOT NULL,
    annee_academique VARCHAR2(10) NOT NULL,
    statut VARCHAR2(20) DEFAULT 'ACTIF',
    /* Contrainte pour specifier qu'on definis une cle etrangere [ine] de la table [etudiants] renommer en [ine_fk]*/
    CONSTRAINT fk_inscription_etudiant FOREIGN KEY (ine_fk) REFERENCES etudiants(ine),
    /* Contrainte pour specifier qu'on definis une cle etrangere [filiere_id] de la table [filieres] renommer en [filiere_fk]*/
    CONSTRAINT fk_inscription_filiere FOREIGN KEY (filiere_fk) REFERENCES filieres(filiere_id),
    /* Contrainte de verification pour specifier qu'on accepte que ce format de date : 'yyyy/yyyy' */
    CONSTRAINT contrainte_verification_annee_inscription CHECK (annee_academique LIKE '____/____'),
    /* Contrainte de verification pour specifier que la colonne [status] ne peut prendre que 3 valeurs à savoir [ACTIF, ABANDON, DIPLOME] */
    CONSTRAINT contrainte_verification_status_inscription CHECK (statut IN ('ACTIF', 'ABANDON', 'DIPLOME'))
);





/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE NORD                 *
*                                                                                       *   
*****************************************************************************************/






/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE CAPVERT              *
*                                                                                       *   
*****************************************************************************************/






/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE CENTRE               *
*                                                                                       *   
*****************************************************************************************/







/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE SUD                  *
*                                                                                       *   
*****************************************************************************************/


















