-- Clean setup for test database
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE db_test;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  email varchar(255) NOT NULL,
  created_at datetime DEFAULT current_timestamp(),
  updated_at datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create the table with corrected syntax and naming consistency
CREATE TABLE `LigneFacture` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `article_id` INT NOT NULL,
    `quantite` INT NOT NULL,
    `prix_unitaire` DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert test data into the table
INSERT INTO `LigneFacture` (`article_id`, `quantite`, `prix_unitaire`) VALUES
(1, 2, 15.99),
(2, 1, 25.50);

COMMIT;
