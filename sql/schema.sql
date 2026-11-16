CREATE DATABASE IF NOT EXISTS gestion_financiere CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE gestion_financiere;
CREATE TABLE IF NOT EXISTS departments(department_id INT PRIMARY KEY,department_name VARCHAR(100) NOT NULL);
CREATE TABLE IF NOT EXISTS activities(activity_id INT PRIMARY KEY,activity_name VARCHAR(100) NOT NULL,description VARCHAR(255));
CREATE TABLE IF NOT EXISTS revenues(revenue_id INT PRIMARY KEY,revenue_date DATE NOT NULL,category VARCHAR(100) NOT NULL,amount_tnd DECIMAL(12,2) NOT NULL,department_id INT,FOREIGN KEY(department_id) REFERENCES departments(department_id));
CREATE TABLE IF NOT EXISTS expenses(expense_id INT PRIMARY KEY,expense_date DATE NOT NULL,category VARCHAR(100) NOT NULL,department_id INT NOT NULL,amount_tnd DECIMAL(12,2) NOT NULL,description VARCHAR(255),FOREIGN KEY(department_id) REFERENCES departments(department_id));
CREATE TABLE IF NOT EXISTS budgets(budget_id INT PRIMARY KEY,budget_month DATE NOT NULL,category VARCHAR(100) NOT NULL,budget_amount_tnd DECIMAL(12,2) NOT NULL);
