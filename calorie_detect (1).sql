-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 06:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calorie_detect`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_calories`
--

CREATE TABLE `food_calories` (
  `id` int(11) NOT NULL,
  `food_name` varchar(100) NOT NULL,
  `calories_per_100g` int(11) NOT NULL,
  `calories_per_serving` int(11) NOT NULL,
  `carbs_per_100g` decimal(5,2) NOT NULL,
  `protein_per_100g` decimal(5,2) NOT NULL,
  `fats_per_100g` decimal(5,2) NOT NULL,
  `carbs_per_serving` decimal(5,2) NOT NULL,
  `protein_per_serving` decimal(5,2) NOT NULL,
  `fats_per_serving` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_calories`
--

INSERT INTO `food_calories` (`id`, `food_name`, `calories_per_100g`, `calories_per_serving`, `carbs_per_100g`, `protein_per_100g`, `fats_per_100g`, `carbs_per_serving`, `protein_per_serving`, `fats_per_serving`) VALUES
(1, 'Apple pie', 237, 320, 35.00, 2.00, 11.00, 45.00, 2.00, 16.00),
(2, 'Baby back ribs', 320, 480, 3.00, 30.00, 22.00, 18.00, 27.00, 22.00),
(3, 'Baklava', 420, 350, 54.00, 6.00, 23.00, 45.00, 4.00, 19.00),
(4, 'Beef carpaccio', 155, 270, 0.00, 22.00, 9.00, 0.00, 31.00, 18.00),
(5, 'Beef tartare', 174, 320, 0.00, 20.00, 11.00, 0.00, 27.00, 18.00),
(6, 'Beet salad', 43, 200, 9.60, 1.60, 0.20, 19.00, 3.20, 0.40),
(7, 'Beignets', 330, 250, 32.00, 4.00, 17.00, 25.00, 2.00, 15.00),
(8, 'Bibimbap', 500, 600, 74.00, 16.00, 17.00, 60.00, 20.00, 21.00),
(9, 'Bread pudding', 320, 400, 50.00, 6.00, 10.00, 50.00, 7.00, 15.00),
(10, 'Breakfast burrito', 200, 350, 28.00, 12.00, 14.00, 40.00, 18.00, 16.00),
(11, 'Bruschetta', 150, 300, 30.00, 4.00, 9.00, 20.00, 6.00, 11.00),
(12, 'Caesar salad', 160, 220, 6.00, 5.00, 14.00, 10.00, 3.00, 12.00),
(13, 'Cannoli', 420, 350, 50.00, 6.00, 23.00, 45.00, 4.00, 19.00),
(14, 'Caprese salad', 120, 150, 8.00, 5.00, 9.00, 10.00, 7.00, 15.00),
(15, 'Carrot cake', 300, 450, 40.00, 4.00, 20.00, 55.00, 6.00, 22.00),
(16, 'Ceviche', 150, 200, 4.00, 30.00, 3.00, 10.00, 18.00, 8.00),
(17, 'Cheesecake', 350, 500, 40.00, 6.00, 21.00, 45.00, 7.00, 20.00),
(18, 'Cheese plate', 400, 450, 10.00, 20.00, 30.00, 15.00, 25.00, 18.00),
(19, 'Chicken curry', 200, 350, 10.00, 25.00, 15.00, 20.00, 22.00, 18.00),
(20, 'Chicken quesadilla', 250, 400, 30.00, 15.00, 16.00, 35.00, 18.00, 20.00),
(21, 'Chicken wings', 250, 400, 2.00, 25.00, 20.00, 15.00, 22.00, 18.00),
(22, 'Chocolate cake', 370, 500, 45.00, 4.00, 22.00, 60.00, 6.00, 24.00),
(23, 'Chocolate mousse', 350, 450, 35.00, 4.00, 25.00, 45.00, 5.00, 20.00),
(24, 'Churros', 450, 350, 55.00, 4.00, 25.00, 50.00, 5.00, 22.00),
(25, 'Clam chowder', 150, 250, 10.00, 10.00, 6.00, 20.00, 14.00, 10.00),
(26, 'Club sandwich', 250, 500, 25.00, 20.00, 18.00, 45.00, 25.00, 22.00),
(27, 'Crab cakes', 250, 350, 12.00, 20.00, 15.00, 18.00, 25.00, 18.00),
(28, 'Creme brulee', 330, 450, 30.00, 6.00, 20.00, 35.00, 7.00, 22.00),
(29, 'Croque madame', 350, 500, 25.00, 15.00, 25.00, 40.00, 30.00, 30.00),
(30, 'Cup cakes', 340, 420, 45.00, 5.00, 18.00, 50.00, 7.00, 22.00),
(31, 'Deviled eggs', 160, 250, 1.00, 13.00, 12.00, 4.00, 22.00, 15.00),
(32, 'Donuts', 400, 350, 50.00, 5.00, 20.00, 55.00, 7.00, 22.00),
(33, 'Dumplings', 200, 300, 25.00, 12.00, 6.00, 40.00, 20.00, 12.00),
(34, 'Edamame', 120, 160, 9.00, 12.00, 5.00, 16.00, 15.00, 8.00),
(35, 'Eggs benedict', 250, 400, 4.00, 15.00, 20.00, 10.00, 25.00, 18.00),
(36, 'Escargots', 150, 250, 5.00, 20.00, 5.00, 10.00, 25.00, 8.00),
(37, 'Falafel', 160, 250, 25.00, 8.00, 8.00, 35.00, 12.00, 10.00),
(38, 'Filet mignon', 250, 350, 0.00, 28.00, 20.00, 0.00, 35.00, 18.00),
(39, 'Fish and chips', 250, 450, 30.00, 15.00, 14.00, 50.00, 20.00, 18.00),
(40, 'Foie gras', 500, 600, 3.00, 6.00, 50.00, 6.00, 12.00, 45.00),
(41, 'French fries', 310, 450, 41.00, 3.00, 15.00, 45.00, 5.00, 18.00),
(42, 'French onion soup', 90, 150, 15.00, 3.00, 3.00, 20.00, 5.00, 5.00),
(43, 'French toast', 240, 400, 30.00, 6.00, 12.00, 40.00, 12.00, 18.00),
(44, 'Fried calamari', 250, 400, 30.00, 10.00, 15.00, 40.00, 15.00, 20.00),
(45, 'Fried rice', 200, 350, 40.00, 5.00, 8.00, 60.00, 15.00, 10.00),
(46, 'Frozen yogurt', 160, 250, 26.00, 4.00, 3.00, 32.00, 7.00, 4.00),
(47, 'Garlic bread', 350, 400, 45.00, 7.00, 15.00, 50.00, 10.00, 20.00),
(48, 'Gnocchi', 220, 350, 44.00, 6.00, 1.00, 55.00, 12.00, 5.00),
(49, 'Greek salad', 120, 200, 7.00, 2.00, 10.00, 15.00, 4.00, 12.00),
(50, 'Grilled cheese sandwich', 300, 450, 30.00, 10.00, 20.00, 35.00, 15.00, 18.00),
(51, 'Grilled salmon', 200, 350, 0.00, 25.00, 14.00, 0.00, 35.00, 22.00),
(52, 'Guacamole', 160, 220, 9.00, 2.00, 15.00, 15.00, 4.00, 13.00),
(53, 'Gyoza', 200, 300, 25.00, 12.00, 6.00, 40.00, 20.00, 12.00),
(54, 'Hamburger', 250, 400, 25.00, 20.00, 10.00, 35.00, 25.00, 15.00),
(55, 'Hot and sour soup', 70, 120, 10.00, 6.00, 2.00, 15.00, 8.00, 5.00),
(56, 'Hot dog', 300, 400, 2.00, 15.00, 26.00, 4.00, 18.00, 20.00),
(57, 'Huevos rancheros', 220, 350, 20.00, 12.00, 15.00, 30.00, 18.00, 18.00),
(58, 'Hummus', 170, 250, 20.00, 8.00, 10.00, 30.00, 12.00, 12.00),
(59, 'Ice cream', 200, 300, 25.00, 4.00, 12.00, 35.00, 10.00, 18.00),
(60, 'Lasagna', 250, 400, 30.00, 20.00, 12.00, 50.00, 30.00, 15.00),
(61, 'Lobster bisque', 120, 180, 10.00, 10.00, 8.00, 15.00, 18.00, 9.00),
(62, 'Lobster roll sandwich', 290, 450, 30.00, 18.00, 12.00, 35.00, 24.00, 14.00),
(63, 'Macaroni and cheese', 350, 500, 35.00, 10.00, 16.00, 45.00, 20.00, 22.00),
(64, 'Macarons', 400, 350, 45.00, 5.00, 18.00, 50.00, 7.00, 22.00),
(65, 'Miso soup', 40, 100, 6.00, 4.00, 2.00, 12.00, 10.00, 4.00),
(66, 'Mussels', 172, 280, 7.00, 20.00, 9.00, 10.00, 35.00, 12.00),
(67, 'Nachos', 200, 350, 30.00, 8.00, 15.00, 40.00, 25.00, 18.00),
(68, 'Omelette', 150, 250, 1.00, 12.00, 12.00, 4.00, 20.00, 15.00),
(69, 'Onion rings', 320, 400, 40.00, 4.00, 20.00, 50.00, 5.00, 25.00),
(70, 'Oysters', 80, 150, 4.00, 9.00, 2.00, 8.00, 15.00, 5.00),
(71, 'Pad thai', 200, 350, 40.00, 10.00, 9.00, 60.00, 25.00, 12.00),
(72, 'Paella', 230, 400, 40.00, 16.00, 9.00, 55.00, 30.00, 12.00),
(73, 'Pancakes', 220, 350, 40.00, 5.00, 8.00, 50.00, 10.00, 15.00),
(74, 'Panna cotta', 300, 450, 30.00, 7.00, 15.00, 40.00, 12.00, 18.00),
(75, 'Peking duck', 300, 500, 0.00, 25.00, 30.00, 0.00, 35.00, 25.00),
(76, 'Pho', 150, 250, 25.00, 12.00, 7.00, 40.00, 22.00, 10.00),
(77, 'Pizza', 270, 350, 35.00, 10.00, 12.00, 45.00, 18.00, 15.00),
(78, 'Pork chop', 250, 450, 0.00, 20.00, 18.00, 0.00, 30.00, 20.00),
(79, 'Poutine', 300, 500, 35.00, 8.00, 15.00, 40.00, 15.00, 20.00),
(80, 'Prime rib', 250, 450, 0.00, 26.00, 18.00, 0.00, 35.00, 22.00),
(81, 'Pulled pork sandwich', 300, 450, 35.00, 25.00, 15.00, 45.00, 30.00, 18.00),
(82, 'Ramen', 200, 350, 30.00, 10.00, 8.00, 45.00, 20.00, 12.00),
(83, 'Ravioli', 220, 350, 40.00, 10.00, 6.00, 55.00, 15.00, 10.00),
(84, 'Red velvet cake', 370, 500, 45.00, 4.00, 22.00, 60.00, 6.00, 24.00),
(85, 'Risotto', 250, 400, 35.00, 6.00, 12.00, 45.00, 15.00, 18.00),
(86, 'Samosa', 330, 450, 40.00, 8.00, 18.00, 45.00, 12.00, 16.00),
(87, 'Sashimi', 130, 180, 0.00, 28.00, 6.00, 0.00, 35.00, 8.00),
(88, 'Scallops', 120, 180, 5.00, 25.00, 2.00, 12.00, 30.00, 4.00),
(89, 'Seaweed salad', 60, 100, 8.00, 2.00, 1.00, 12.00, 6.00, 3.00),
(90, 'Shrimp and grits', 250, 350, 25.00, 20.00, 15.00, 30.00, 28.00, 18.00),
(91, 'Spaghetti bolognese', 210, 350, 30.00, 16.00, 10.00, 50.00, 25.00, 15.00),
(92, 'Spaghetti carbonara', 300, 450, 35.00, 12.00, 18.00, 50.00, 22.00, 20.00),
(93, 'Spring rolls', 150, 250, 30.00, 5.00, 9.00, 40.00, 7.00, 12.00),
(94, 'Steak', 250, 450, 0.00, 25.00, 20.00, 0.00, 35.00, 22.00),
(95, 'Strawberry shortcake', 270, 400, 35.00, 4.00, 10.00, 45.00, 7.00, 15.00),
(96, 'Sushi', 140, 200, 30.00, 6.00, 1.00, 40.00, 12.00, 4.00),
(97, 'Tacos', 250, 350, 25.00, 15.00, 15.00, 35.00, 20.00, 18.00),
(98, 'Takoyaki', 200, 300, 30.00, 12.00, 6.00, 40.00, 18.00, 8.00),
(99, 'Tiramisu', 350, 500, 45.00, 6.00, 22.00, 60.00, 8.00, 24.00),
(100, 'Tuna tartare', 120, 180, 0.00, 25.00, 4.00, 0.00, 35.00, 5.00),
(101, 'Waffles', 300, 400, 35.00, 6.00, 14.00, 45.00, 10.00, 18.00);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `calories_per_100g` float DEFAULT NULL,
  `calories_per_serving` float DEFAULT NULL,
  `carbs_per_100g` float DEFAULT NULL,
  `protein_per_100g` float DEFAULT NULL,
  `fats_per_100g` float DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `food_name`, `image_path`, `calories_per_100g`, `calories_per_serving`, `carbs_per_100g`, `protein_per_100g`, `fats_per_100g`, `timestamp`, `username`, `user_id`) VALUES
(1, 'Macarons', 'uploads\\976382.jpg', 400, 350, 45, 5, 18, '2024-12-26 10:18:38', NULL, NULL),
(29, 'Carrot cake', 'uploads\\1926.jpg', 300, 450, 40, 4, 20, '2024-12-27 18:17:20', 'karim', NULL),
(31, 'Panna cotta', 'uploads\\72190.jpg', 300, 450, 30, 7, 15, '2024-12-27 18:17:58', 'karim', NULL),
(41, 'Prime rib', 'uploads\\31011.jpg', 250, 450, 0, 26, 18, '2024-12-28 11:41:11', 'kim', NULL),
(44, 'Hamburger', 'uploads\\foodImage.jpg', 250, 400, 25, 20, 10, '2025-01-01 18:01:19', 'karim', NULL),
(45, 'French fries', 'uploads\\89974.jpg', 310, 450, 41, 3, 15, '2025-01-01 18:05:11', 'kim', NULL),
(46, 'Donuts', 'uploads\\4919.jpg', 400, 350, 50, 5, 20, '2025-01-02 09:09:13', 'karim', NULL),
(47, 'Hummus', 'uploads\\128556.jpg', 170, 250, 20, 8, 10, '2025-01-02 09:13:45', 'karim', NULL),
(48, 'Hot dog', 'uploads\\70867.jpg', 300, 400, 2, 15, 26, '2025-01-02 09:16:17', 'karim', NULL),
(49, 'Falafel', 'uploads\\download.jpg', 160, 250, 25, 8, 8, '2025-01-02 09:16:39', 'karim', NULL),
(50, 'Baklava', 'uploads\\120691.jpg', 420, 350, 54, 6, 23, '2025-01-02 09:16:49', 'karim', NULL),
(51, 'French fries', 'uploads\\89974.jpg', 310, 450, 41, 3, 15, '2025-01-02 09:25:12', 'oussama', NULL),
(52, 'Baklava', 'uploads\\120691.jpg', 420, 350, 54, 6, 23, '2025-01-02 09:26:23', 'oussama', NULL),
(53, 'Lasagna', 'uploads\\Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg', 250, 400, 30, 20, 12, '2025-01-02 09:30:09', 'oussama', NULL),
(54, 'Hummus', 'uploads\\20220211142754-margherita-9920_5a73220e-4a1a-4d33-b38f-26e98e3cd986.jpg', 170, 250, 20, 8, 10, '2025-01-02 09:30:58', 'oussama', NULL),
(55, 'Baklava', 'uploads\\120691.jpg', 420, 350, 54, 6, 23, '2025-01-02 09:45:01', 'oussama', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(2, 'karim', 'kimofayad2001@gmail.com', '$2y$10$MtBAAocsvR1CSrtNwcV1GePPS2YJkndAGn9cGp1LR3CQ4/FBD8FFG', '2024-12-26 12:13:50'),
(3, 'kim', 'kimopsplus2001@gmail.com', '$2y$10$mjApHmCARS758IFI7fXbkuTqyq4Td3FIQlUVtEMwqsF/jP9Lq4Tum', '2024-12-28 11:39:42'),
(4, 'oussama', 'oussam.hatoum@liu.edu.lb', '$2y$10$cAD56raSE8W2SPoshR/0hepp0ewVghhl6UrxzwoNEx32uQrEysJEO', '2025-01-02 09:23:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_calories`
--
ALTER TABLE `food_calories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `food_name` (`food_name`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_calories`
--
ALTER TABLE `food_calories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
