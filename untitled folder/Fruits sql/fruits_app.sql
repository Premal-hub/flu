-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 05:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fruits_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `fruits`
--

CREATE TABLE `fruits` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_organic` tinyint(1) NOT NULL DEFAULT 0,
  `seller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fruits`
--

INSERT INTO `fruits` (`id`, `name`, `description`, `price`, `stock`, `is_organic`, `seller`, `image_url`) VALUES
(1, 'Apple', 'Fresh red apples', '120.00', 50, 0, 'Green Orchards', 'https://via.placeholder.com/300x200.png?text=Apple'),
(2, 'Banana', 'Sweet bananas (bunch)', '40.00', 120, 0, 'Tropical Farm', 'https://via.placeholder.com/300x200.png?text=Banana'),
(3, 'Mango (Alphonso) 1', 'Premium Alphonso mangoes', '250.00', 30, 0, 'Mango King', 'https://via.placeholder.com/300x200.png?text=Mango'),
(5, 'chiku', 'none', '200.00', 50, 1, 'xyz', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7CJJHueXZcxG-Sgr4CN2jwZF40MHnEA9Ktg&s'),
(6, 'Apple', 'None', '400.00', 100, 1, 'Test', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiKewyfGIp3YniSF4KqyxrUFEV9k_PrinnkA&s');

-- --------------------------------------------------------

--
-- Table structure for table `fruits_upd`
--

CREATE TABLE `fruits_upd` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `is_organic` tinyint(1) DEFAULT 0,
  `seller` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fruits_upd`
--

INSERT INTO `fruits_upd` (`id`, `name`, `description`, `price`, `stock`, `is_organic`, `seller`, `image_url`) VALUES
(1, 'Apple', 'Fresh red apples', '120.00', 50, 0, 'Green Orchards', 'https://via.placeholder.com/300x200.png?text=Apple'),
(2, 'Banana', 'Sweet ripe bananas', '60.00', 100, 1, 'Yellow Farm', 'https://via.placeholder.com/300x200.png?text=Banana'),
(3, 'Mango', 'Delicious summer mangoes', '150.00', 80, 1, 'Tropical Fresh', 'https://via.placeholder.com/300x200.png?text=Mango'),
(4, 'Orange', 'Citrus oranges full of vitamin C', '90.00', 70, 0, 'Citrus Valley', 'https://via.placeholder.com/300x200.png?text=Orange');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fruits`
--
ALTER TABLE `fruits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fruits_upd`
--
ALTER TABLE `fruits_upd`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fruits`
--
ALTER TABLE `fruits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fruits_upd`
--
ALTER TABLE `fruits_upd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
