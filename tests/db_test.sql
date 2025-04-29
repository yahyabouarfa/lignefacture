-- Clean setup for test database
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

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
