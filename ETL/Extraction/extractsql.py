import mysql.connector
import pandas as pd

def recuperer_donnees_mysql(table):
    """
    Récupère toutes les données d'une table MySQL et les renvoie sous forme de DataFrame
    """
    # Connexion MySQL
    conn = mysql.connector.connect(
        host="mysql",
        user="root",
        password="    ",  # Remplace par ton mot de passe MySQL
        database="dataflow360"
    )
    
    query = f"SELECT * FROM {table};"
    df = pd.read_sql(query, conn)
    
    conn.close()
    return df

if __name__ == "__main__":
    tables = ["Cours", "Eleve", "Etablissement", "Presence", "Matiere", "Enseignant", "Note", "Region"]

    for table in tables:
        donnees = recuperer_donnees_mysql(table)
        print(f"\n--- {table.upper()} ---")
        print(donnees.head())  # Affiche les 5 premières lignes
