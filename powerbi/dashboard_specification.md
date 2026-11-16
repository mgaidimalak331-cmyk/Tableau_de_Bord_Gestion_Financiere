# Conception du rapport Power BI

## Modèle
Importer revenues, expenses, departments, budgets, activities.
Créer une table calendrier couvrant 2025 et marquer-la comme table de dates.
Relations 1-à-plusieurs : departments → revenues/expenses.
Relier Calendar[Date] à revenues[revenue_date], expenses[expense_date] et budgets[budget_month] (sens unique). Vérifier les agrégations budgétaires mensuelles.

## Page 1 — Vue d'ensemble
Cartes : Total Revenus, Total Dépenses, Résultat Net, Marge Nette %.
Courbe : revenus et dépenses par mois. Histogramme : résultat net par mois.
Segments : période, département.

## Page 2 — Dépenses
Barres : dépenses par catégorie et département.
Tableau détaillé : date, catégorie, département, montant.
Segments : mois et département.

## Page 3 — Revenus
Courbe mensuelle, anneau par catégorie, matrice mois × catégorie, nombre d'opérations.

## Page 4 — Budget
Colonnes groupées budget vs réalisé, taux de réalisation, écart budgétaire et tableau mensuel.

## Design et contrôles
Palette sobre bleu foncé/turquoise/gris clair, montants en TND, titres explicites, info-bulles et navigation.
Comparer les totaux Power BI aux requêtes SQL et tester les filtres de dates/départements.
