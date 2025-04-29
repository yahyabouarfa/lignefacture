-- Clean setup for test database
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Create articles table
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `qte_stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create users table
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create BonLivraison table
CREATE TABLE `BonLivraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_bl` varchar(50) NOT NULL,
  `date_bl` date NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create LigneBonLivraison table
CREATE TABLE `LigneBonLivraison` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `libelle` VARCHAR(255) NOT NULL,
    `qte` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create ligne_facture table
CREATE TABLE `LigneFacture` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `article_id` INT NOT NULL,
    `quantite` INT NOT NULL,
    `prix_unitaire` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (`article_id`) REFERENCES `articles`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert minimal test data if needed
INSERT INTO `articles` (`ref`, `libelle`, `qte_stock`) VALUES
('TEST001', 'Test Article 1', 10),
('TEST002', 'Test Article 2', 20);

INSERT INTO `users` (`name`, `email`) VALUES
('Test User', 'test@example.com');

INSERT INTO `ligne_facture` (`article_id`, `quantite`, `prix_unitaire`) VALUES
(1, 2, 15.99),
(2, 1, 25.50);

COMMIT;
