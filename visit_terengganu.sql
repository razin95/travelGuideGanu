-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 09:22 AM
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
-- Database: `visit_terengganu`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `available_from` date DEFAULT NULL,
  `available_to` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_url` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `name`, `type`, `description`, `price`, `available`, `available_from`, `available_to`, `image`, `image_url`) VALUES
(5, 'Homestay Husna', 'Homestay', 'Homestay Husna is in Dungun close to Sura Beach. It offers air-conditioned rooms and free private parking. Rantau Abang is just 20 km away.', 199.00, NULL, '2025-06-12', '2025-06-30', 'acc1.jpg', 'https://www.lodging-world.com/my/hotels/homestay-husna-in-dungun-910657800'),
(7, 'Villa D\'Razna', 'Homestay', 'Villa D\'Razna - A luxury 5-bedroom beachfront villa with a private pool, located in Kuala Terengganu. Just 14 km from the State Museum and 16 km from the Crystal Mosque.', 399.00, NULL, '2025-06-12', '2025-06-19', 'acc2.jpg', NULL),
(8, 'Villa Seputeh', 'Villa', 'Villa Seputeh Kuala Terengganu offers a private pool, garden views, and a balcony, perfect for a relaxing getaway.', 699.00, NULL, '2025-06-12', '2025-06-13', 'acc3.jpg', NULL),
(9, 'Kijalena Beach Inn', 'Chalet', 'Stay at Kijalena Beach Inn in Kemaman, Terengganu - just 3.5 hours from Kuala Lumpur. Enjoy sunrise mornings and sunset evenings by the sea.', 99.00, NULL, '2025-06-12', '2025-06-30', 'acc4.jpg', NULL),
(10, 'Mawar 23 with Private Pool', 'Homestay', 'Mawar 23 Chendering offers a private pool villa in Kuala Terengganu with free WiFi and parking. Perfect for a relaxing getaway.', 299.00, NULL, '2025-06-12', '2025-06-26', 'acc5.jpg', NULL),
(11, 'Chalet Su', 'Chalet', 'This beachfront chalet faces Rusila Beach, just 15 minutes from Kuala Terengganu and 5 minutes from Kapas Island jetty. It offers five room types from budget to seaview suites, with more space and privacy than other Marang chalets - all at affordable rates.', 99.00, NULL, '2025-06-12', '2025-06-19', 'acc6.jpg', NULL),
(12, 'Villa Bubu', 'Villa', 'BuBu Villa offers relaxing stays at Long Beach strip on Pulau Perhentian Kecil. The spacious and elegant villas feature a private terrace and thatched roofs. The beachfront property has a private beach and an outdoor restaurant on site.', 499.00, NULL, '2025-06-12', '2025-06-19', 'acc7.jpg', NULL),
(13, 'Villa Bubu2', 'Homestay', 'ok shaja', 499.00, NULL, '2025-06-12', '2025-06-19', 'acc7.jpg', 'https://www.tti.com.my/crystal-mosque/');

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE `attractions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('Beach','Museum','Island','Cultural Site') NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_url` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attractions`
--

INSERT INTO `attractions` (`id`, `name`, `type`, `description`, `image`, `image_url`) VALUES
(8, 'Redang Island', 'Island', 'Small island with clear water and white sand. Good for swimming, snorkeling, and seeing turtles. Quiet place with a few hotels. Best visited March-October. Take a boat from Kuala Terengganu.', 'redang.jpg', NULL),
(9, 'State Museum of Terengganu', 'Museum', 'Shows Terengganu\'s history and culture. See royal items, old boats, and local crafts. Small garden too. Closed Fridays. Cheap ticket. Good for quick culture visit.', 'museum.jpg', NULL),
(10, 'Batu Buruk Beach', 'Beach', 'Nice beach near Kuala Terengganu city. Black sandy shore with coconut trees. Good for evening walks and local food stalls. Strong currents - not safe for swimming. Popular sunset spot with playground for kids.', 'batuburuk.jpg', NULL),
(11, 'Batu Bersurat Terengganu', 'Cultural Site', 'Ancient inscribed stone near Kuala Terengganu. Features 14th-century Jawi writings - oldest Islamic monument in Malaysia. Shows early Islamic influence in Terengganu. Protected historical site under museum care.', 'batubersurat.jpg', NULL),
(12, 'Kapas Island', 'Island', 'Quiet island with nice beaches. Good for swimming and snorkeling. Take boat from Marang. Few simple hotels. Best March-October. No shops - bring what you need. Peaceful place to relax.', 'kapas.jpg', NULL),
(13, 'Museum of Kemaman', 'Museum', 'Small local museum in Chukai town. Shows Kemaman district\'s history, culture and oil industry.', 'museum2.jpg', NULL),
(14, 'Penarik Beach', 'Beach', 'Long quiet beach in Setiu. See fishing village and nice sunrises. Try local seafood. Drive from KT takes 45 mins.', 'penarik.jpg', NULL),
(15, 'Crystal Mosque', 'Cultural Site', 'Shiny glass mosque on an island in Kuala Terengganu. Looks magical at night. Visitors welcome (wear modest clothes). Near Islamic Civilization Park. Free to enter.', 'mosque.jpg', NULL),
(20, 'Pasar Payang', 'Cultural Site', 'Pasar Payang is Terengganu\'s lively riverside market, packed with colorful batik, fresh seafood, and local crafts. A must-visit for authentic flavors and culture.', 'pasarpayang.jpg', NULL),
(21, 'Masjid Tengku Tengah Zaharah', 'Cultural Site', 'Masjid Tengku Tengah Zaharah (Floating Mosque) is Terengganu\'s picturesque riverside mosque that appears to float on water during high tide, blending modern and traditional Islamic architecture. A serene landmark.', 'mosque2.jpg', NULL),
(22, 'Perhentian Island', 'Island', 'Perhentian Island is a tropical paradise off Terengganu, famous for its powdery white beaches, crystal-clear waters, and vibrant coral reefs. Perfect for snorkeling, diving, and relaxing in untouched nature.', 'perhentian.jpg', NULL),
(23, 'Seberang Takir Beach', 'Beach', 'Pantai Seberang Takir (also called Pantai Miami) is a laid-back beach near Kuala Terengganu, known for its golden sand, gentle waves, and stunning sunset views. A local favorite for picnics and breezy strolls.', 'miami.jpg', NULL),
(24, 'Seberang Takir Beacht', 'Museum', '11', 'miami.jpg', 'https://www.booking.com/hotel/my/bubu-villa.en-gb.html?aid=2276428&label=msn-wF_0el7maxHSwFuLIjUmGQ-80401932007292%3Atikwd-80402080809400%3Aloc-142515%3Aneo%3Amte%3Alp158683%3Adec%3Aqsvila%20bubu&sid=e93ee213a5fef8a7752e0d4d47531195&dest_id=900048540&dest_type=city&dist=0&group_adults=2&group_children=0&hapos=1&hpos=1&no_rooms=1&req_adults=2&req_children=0&room1=A%2CA&sb_price_type=total&sr_order=popularity&srepoch=1749873144&srpvid=a3d41b36c0140224&type=total&ucfs=1&');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expiry`) VALUES
(1, 's72404@ocean.umt.edu.my', '2c5e134e-7b74-46ce-91db-e120309e9aee', '2025-06-12 13:12:24'),
(2, 's72404@ocean.umt.edu.my', '59118d23-a3cc-42ae-822a-056ce16f6c87', '2025-06-12 13:12:29'),
(3, 'tg.ndhr@gmail.com', '31b5b413-4d99-4700-8aed-5f6651fa0a0e', '2025-06-12 13:14:37'),
(4, 's72404@ocean.umt.edu.my', '10e6b7b2-5a03-4617-b100-cc152f400c7a', '2025-06-12 13:21:15'),
(5, 'tg.ndhr@gmail.com', 'a5678d9b-f596-4083-a56a-d507de4245fd', '2025-06-12 13:21:25'),
(6, 'harithrazinm@gmail.com', '967abbb7-9755-4f45-9196-2c6327930116', '2025-06-12 13:22:07'),
(7, 'harithrazinm@gmail.com', '652852d4-89c4-4743-a167-9984f0cd55cf', '2025-06-12 13:25:38'),
(8, 's72404@ocean.umt.edu.my', '27b582ce-88de-4da3-bd1c-3b487f7255a9', '2025-06-12 13:29:45'),
(9, 'harithrazinm@gmail.com', '290cfa6e-487f-414d-977c-ce0654298605', '2025-06-12 13:29:50'),
(10, 'harithrazinm@gmail.com', 'a15337dc-6b8c-426e-b9bd-e37d7921cb58', '2025-06-12 13:38:06'),
(11, 'harithrazinm@gmail.com', 'd6b659a1-2ac7-4a28-b641-aec6867cfd72', '2025-06-12 13:50:51'),
(12, 'harithrazinm@gmail.com', 'f1bccbe5-46c3-4d20-9ec6-a8ceb81ece00', '2025-06-12 14:00:12'),
(13, 's72568@ocean.umt.edu.my', '21241988-3c28-4307-bec0-43f31fc8292a', '2025-06-12 14:32:33'),
(14, 's72568@ocean.umt.edu.my', '663b5458-e67e-4f51-a259-1ea4c8038d62', '2025-06-12 14:35:58'),
(15, 'puyuhburung32@gmail.com', '5ffd3d8b-9c5a-419a-8022-ca21cd8cfe60', '2025-06-12 14:56:19'),
(16, 's72568@ocean.umt.edu.my', '5ead679f-71c4-4137-8d4e-e086f7048c88', '2025-06-12 14:56:48'),
(17, 's72568@ocean.umt.edu.my', '74d922a2-f41f-4bde-843f-05d47caf93d0', '2025-06-12 14:57:14'),
(18, 'puyuhburung32@gmail.com', '1154b909-efad-4c36-a881-d63d463187eb', '2025-06-12 15:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','admin') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Ali', 's72404@ocean.umt.edu.my', '1', 'customer', '2025-06-12 03:45:22', '2025-06-12 03:45:22'),
(2, 'razinhensem', 'aminaldo@gmail.com', '1', 'customer', '2025-06-12 03:49:21', '2025-06-12 03:49:21'),
(4, 'Ali1', 's724014@ocean.umt.edu.my', '1', 'customer', '2025-06-12 03:52:47', '2025-06-12 03:52:47'),
(5, 'kamu', 'tg.ndhr@gmail.com', '123', 'customer', '2025-06-12 12:44:21', '2025-06-12 12:44:21'),
(6, 'raz', 'harithrazinm@gmail.com', '1', 'customer', '2025-06-12 12:52:01', '2025-06-12 12:52:01'),
(7, 'razi', 's72568@ocean.umt.edu.my', '1', 'customer', '2025-06-12 14:02:26', '2025-06-12 14:02:26'),
(8, 'Amiz', 'puyuhburung32@gmail.com', '123', 'customer', '2025-06-12 14:25:55', '2025-06-12 14:25:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attractions`
--
ALTER TABLE `attractions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `attractions`
--
ALTER TABLE `attractions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
