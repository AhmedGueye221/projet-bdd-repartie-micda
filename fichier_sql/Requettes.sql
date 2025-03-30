/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'ADMINISTRATEUR DE LA BASE DE DONNÉES        *
*                                                                                       *   
*****************************************************************************************/
    /* CREATION DES UTILISATEURS DE LA BASE DE DONNÉES DISTRIBUÉE */
    CREATE USER c##zone_nord IDENTIFIED BY nord123;
    CREATE USER c##zone_centre IDENTIFIED BY centre123;
    CREATE USER c##zone_capvert IDENTIFIED BY capvert123;
    CREATE USER c##zone_sud IDENTIFIED BY sud123;

    /* AFFECTATION DE PRIVILEGE POUR LES UTILISATEURS DE LA BASE DE DONNÉES DISTRIBUÉE */
    GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_nord;
    GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_centre;
    GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_capvert;
    GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE SYNONYM TO c##zone_sud;



/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE CAPVERT              *
*                                                                                       *   
*****************************************************************************************/







/****************************************************************************************
*                                                                                       *
*   VOICI LES RQUETTES SQL QUI CONCERNENT L'UTILISATEUR DE LA ZONE NORD                 *
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


















