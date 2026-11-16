USE gestion_financiere;
-- Revenus par mois
SELECT DATE_FORMAT(revenue_date,'%Y-%m') mois,SUM(amount_tnd) revenus_tnd FROM revenues GROUP BY mois ORDER BY mois;
-- Dépenses par catégorie
SELECT category,SUM(amount_tnd) depenses_tnd FROM expenses GROUP BY category ORDER BY depenses_tnd DESC;
-- Dépenses par département
SELECT d.department_name,SUM(e.amount_tnd) depenses_tnd FROM expenses e JOIN departments d USING(department_id) GROUP BY d.department_name ORDER BY depenses_tnd DESC;
-- Résultat net mensuel
WITH r AS (SELECT DATE_FORMAT(revenue_date,'%Y-%m') mois,SUM(amount_tnd) revenus FROM revenues GROUP BY mois),
e AS (SELECT DATE_FORMAT(expense_date,'%Y-%m') mois,SUM(amount_tnd) depenses FROM expenses GROUP BY mois)
SELECT r.mois,r.revenus,COALESCE(e.depenses,0) depenses,r.revenus-COALESCE(e.depenses,0) resultat_net FROM r LEFT JOIN e USING(mois) ORDER BY r.mois;
-- Écart entre revenus réels et budget
SELECT b.budget_month,b.budget_amount_tnd,COALESCE(a.reel,0) reel,COALESCE(a.reel,0)-b.budget_amount_tnd ecart
FROM budgets b LEFT JOIN (SELECT DATE_FORMAT(revenue_date,'%Y-%m-01') mois,SUM(amount_tnd) reel FROM revenues GROUP BY mois) a
ON DATE_FORMAT(b.budget_month,'%Y-%m-01')=a.mois WHERE b.category="Chiffre d'affaires" ORDER BY b.budget_month;
