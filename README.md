# Tableau de bord de gestion financière
Projet BI personnel de niveau intermédiaire — données synthétiques 2025 en TND.
**Technologies :** Python/Pandas, MySQL, SQL, Power BI et DAX.
Le jeu de données est fictif et ne représente aucune entreprise réelle.

## Objectifs
- Suivre les revenus, les dépenses et le résultat net.
- Analyser les charges par catégorie et département.
- Comparer le réalisé au budget.
- Construire un rapport Power BI interactif.

## Démarrage
1. Installer Python 3.10+ et MySQL 8+.
2. `pip install -r requirements.txt`
3. Copier `.env.example` en `.env` et compléter les identifiants MySQL.
4. Exécuter `sql/schema.sql` dans MySQL.
5. Lancer `python python/clean_data.py`, puis `python python/load_mysql.py`.
6. Connecter Power BI à la base `gestion_financiere` et suivre `powerbi/dashboard_specification.md`.

Voir `START_HERE.txt` pour les étapes détaillées.
