-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2023 at 08:46 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_hotel_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stars` tinyint NOT NULL,
  `image_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_maps_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `address`, `stars`, `image_link`, `google_maps_link`, `created_at`, `updated_at`, `description`, `slug`) VALUES
(1, 'VTDT Dienesta Viesnīca', 'Valmieras iela 19, Cēsis, Latvija', 5, 'assets/cesu-kojas.webp', 'https://www.google.com/maps?q=Valmieras+iela+19,Cēsis', '2023-11-25 11:02:57', '2023-11-25 11:02:57', 'Stay here pls pls pls pls pls pls pls pls pls.', 'vtdt-dienesta-viesnica'),
(2, 'Compass Hotel Medford by Margaritaville', '2399 S Pacific Hwy, Medford, OR 97501, United States', 3, 'assets/hotelis.jpg', 'https://www.google.com/maps?sca_esv=585092746&output=search&q=medford+oregon+compass+hotel&source=lnms&entry=mc&sa=X&ved=2ahUKEwjzhvXhjt2CAxXiFhAIHTgxDcwQ0pQJegQIDhAB', '2023-11-25 11:02:57', '2023-11-25 11:02:57', 'Compass Hotel Medford by Margaritaville is a luxurious hotel located in the heart of Medford, Oregon. The hotel features 118 spacious guest rooms and suites, each of which is elegantly appointed with modern amenities and stylish decor. Guests can enjoy a range of on-site amenities, including a fitness center, outdoor pool, and rooftop bar with stunning views of the city. The hotel also offers a variety of dining options, including a full-service restaurant and a coffee shop. With its prime location and exceptional amenities, Compass Hotel Medford by Margaritaville is the perfect destination for business and leisure travelers alike.', 'compass-hotel-medford');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_24_173857_create_hotels_table', 1),
(7, '2023_11_24_173920_create_reservations_table', 1),
(8, '2023_11_24_173925_create_room_suites_table', 1),
(9, '2023_11_24_174620_create_rooms_table', 1),
(10, '2023_11_24_181107_create_room_maintenances_table', 1),
(11, '2023_11_24_182733_create_room_prices_table', 1),
(12, '2023_11_24_182914_create_room_discounts_table', 1),
(13, '2023_12_01_065024_create_room_images_table', 2),
(14, '2023_12_01_071736_create_room_spaces_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('kaarlisbrakis@gmail.com', '$2y$12$LJ0Mb2z6M8A3UEOfkH9XOuWsW0sljScOqmA2lHP8cM.SJmwyNnase', '2023-12-05 08:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint UNSIGNED NOT NULL,
  `suite_id` bigint UNSIGNED NOT NULL,
  `floor` int NOT NULL,
  `room_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utilities` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extras` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_people` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sq_meters` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_hotel_foreign` (`hotel_id`),
  KEY `rooms_suite_foreign` (`suite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `suite_id`, `floor`, `room_number`, `utilities`, `extras`, `max_people`, `created_at`, `updated_at`, `sq_meters`) VALUES
(1, 1, 1, 1, '101', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(2, 1, 2, 1, '102', 'Wi-Fi, TV, Air Conditioning', 'Mini Fridge', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(3, 1, 3, 1, '103', 'Wi-Fi, TV, Air Conditioning', 'Work Desk', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(4, 1, 4, 1, '104', 'Wi-Fi, TV, Air Conditioning', 'Kitchenette', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(5, 1, 5, 1, '105', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(6, 1, 6, 1, '106', 'Wi-Fi, TV, Air Conditioning', 'Mini Bar', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(7, 1, 7, 1, '107', 'Wi-Fi, TV, Air Conditioning', 'Workspace', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(8, 1, 8, 1, '108', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(9, 1, 9, 1, '109', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(10, 1, 10, 1, '110', 'Wi-Fi, TV, Air Conditioning', 'Mini Fridge', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(11, 1, 5, 1, '111', 'Wi-Fi, TV, Air Conditioning', 'Kitchenette', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(12, 1, 7, 1, '112', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(13, 1, 1, 2, '201', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(14, 1, 2, 2, '202', 'Wi-Fi, TV, Air Conditioning', 'Kitchenette', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(15, 1, 3, 2, '203', 'Wi-Fi, TV, Air Conditioning', 'Work Desk', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(16, 1, 4, 2, '204', 'Wi-Fi, TV, Air Conditioning', 'Mini Bar', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(17, 1, 5, 2, '205', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(18, 1, 6, 2, '206', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(19, 1, 7, 2, '207', 'Wi-Fi, TV, Air Conditioning', 'Workspace', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(20, 1, 8, 2, '208', 'Wi-Fi, TV, Air Conditioning', 'Mini Fridge', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(21, 1, 9, 2, '209', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(22, 1, 10, 2, '210', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(23, 1, 4, 2, '211', 'Wi-Fi, TV, Air Conditioning', 'Mini Bar', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(24, 1, 3, 2, '212', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(25, 1, 1, 3, '301', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(26, 1, 2, 3, '302', 'Wi-Fi, TV, Air Conditioning', 'Workspace', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(27, 1, 3, 3, '303', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(28, 1, 4, 3, '304', 'Wi-Fi, TV, Air Conditioning', 'Mini Bar', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(29, 1, 5, 3, '305', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(30, 1, 6, 3, '306', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(31, 1, 7, 3, '307', 'Wi-Fi, TV, Air Conditioning', 'Workspace', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(32, 1, 8, 3, '308', 'Wi-Fi, TV, Air Conditioning', 'Mini Fridge', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(33, 1, 9, 3, '309', 'Wi-Fi, TV, Air Conditioning', 'Jacuzzi', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(34, 1, 10, 3, '310', 'Wi-Fi, TV, Air Conditioning', 'Balcony', 4, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(35, 1, 7, 3, '311', 'Wi-Fi, TV, Air Conditioning', 'Mini Bar', 3, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0),
(36, 1, 6, 3, '312', 'Wi-Fi, TV, Air Conditioning', 'Sauna', 2, '2023-11-25 11:43:21', '2023-11-25 11:43:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_discounts`
--

DROP TABLE IF EXISTS `room_discounts`;
CREATE TABLE IF NOT EXISTS `room_discounts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `level` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `occasion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_discounts_room_foreign` (`room`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

DROP TABLE IF EXISTS `room_images`;
CREATE TABLE IF NOT EXISTS `room_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_id` bigint UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotional` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `space_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_images_room_id_foreign` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `filename`, `promotional`, `created_at`, `updated_at`, `space_id`) VALUES
(1, 1, 'hotel.webp', 0, NULL, NULL, 3),
(2, 1, 'hotel-1.jpg', 0, NULL, NULL, 6),
(3, 1, 'hotel-2.jpg', 0, NULL, NULL, 4),
(4, 1, 'hotel-3.jpeg', 0, NULL, NULL, 6),
(5, 1, 'hotel-4.jpeg', 0, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `room_maintenances`
--

DROP TABLE IF EXISTS `room_maintenances`;
CREATE TABLE IF NOT EXISTS `room_maintenances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_maintenances_room_foreign` (`room`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_prices`
--

DROP TABLE IF EXISTS `room_prices`;
CREATE TABLE IF NOT EXISTS `room_prices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_id` bigint UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price_per_day` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_prices_room_foreign` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_prices`
--

INSERT INTO `room_prices` (`id`, `room_id`, `start_date`, `end_date`, `price_per_day`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '100.00', NULL, NULL),
(2, 2, NULL, NULL, '120.00', '2023-11-27 07:11:07', NULL),
(3, 3, NULL, NULL, '90.00', '2023-11-27 07:11:07', NULL),
(4, 4, NULL, NULL, '110.00', '2023-11-27 07:11:07', NULL),
(5, 5, NULL, NULL, '150.00', '2023-11-27 07:11:07', NULL),
(6, 6, NULL, NULL, '80.00', '2023-11-27 07:11:07', NULL),
(7, 7, NULL, NULL, '130.00', '2023-11-27 07:11:07', NULL),
(8, 8, NULL, NULL, '95.00', '2023-11-27 07:11:07', NULL),
(9, 9, NULL, NULL, '115.00', '2023-11-27 07:11:07', NULL),
(10, 10, NULL, NULL, '140.00', '2023-11-27 07:11:07', NULL),
(11, 11, NULL, NULL, '75.00', '2023-11-27 07:11:07', NULL),
(12, 12, NULL, NULL, '105.00', '2023-11-27 07:11:07', NULL),
(13, 13, NULL, NULL, '125.00', '2023-11-27 07:11:07', NULL),
(14, 14, NULL, NULL, '160.00', '2023-11-27 07:11:07', NULL),
(15, 15, NULL, NULL, '85.00', '2023-11-27 07:11:07', NULL),
(16, 16, NULL, NULL, '135.00', '2023-11-27 07:11:07', NULL),
(17, 17, NULL, NULL, '98.00', '2023-11-27 07:11:07', NULL),
(18, 18, NULL, NULL, '118.00', '2023-11-27 07:11:07', NULL),
(19, 19, NULL, NULL, '88.00', '2023-11-27 07:11:07', NULL),
(20, 20, NULL, NULL, '108.00', '2023-11-27 07:11:07', NULL),
(21, 21, NULL, NULL, '145.00', '2023-11-27 07:11:07', NULL),
(22, 22, NULL, NULL, '78.00', '2023-11-27 07:11:07', NULL),
(23, 23, NULL, NULL, '102.00', '2023-11-27 07:11:07', NULL),
(24, 24, NULL, NULL, '122.00', '2023-11-27 07:11:07', NULL),
(25, 25, NULL, NULL, '92.00', '2023-11-27 07:11:07', NULL),
(26, 26, NULL, NULL, '112.00', '2023-11-27 07:11:07', NULL),
(27, 27, NULL, NULL, '155.00', '2023-11-27 07:11:07', NULL),
(28, 28, NULL, NULL, '82.00', '2023-11-27 07:11:07', NULL),
(29, 29, NULL, NULL, '132.00', '2023-11-27 07:11:07', NULL),
(30, 30, NULL, NULL, '96.00', '2023-11-27 07:11:07', NULL),
(31, 31, NULL, NULL, '116.00', '2023-11-27 07:11:07', NULL),
(32, 32, NULL, NULL, '89.00', '2023-11-27 07:11:07', NULL),
(33, 33, NULL, NULL, '109.00', '2023-11-27 07:11:07', NULL),
(34, 34, NULL, NULL, '148.00', '2023-11-27 07:11:07', NULL),
(35, 35, NULL, NULL, '79.00', '2023-11-27 07:11:07', NULL),
(36, 36, NULL, NULL, '138.00', '2023-11-27 07:11:07', NULL),
(37, 1, '2023-11-25', '2023-11-27', '30.00', '2023-11-27 07:11:12', NULL),
(38, 1, '2023-11-26', '2023-11-28', '31.00', '2023-11-27 07:11:11', '2023-11-27 15:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `room_reservations`
--

DROP TABLE IF EXISTS `room_reservations`;
CREATE TABLE IF NOT EXISTS `room_reservations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `number_of_people` int NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `room_reservations_room_foreign` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_reservations`
--

INSERT INTO `room_reservations` (`id`, `room_id`, `date_from`, `date_to`, `number_of_people`, `is_paid`, `created_at`, `updated_at`, `cancelled_at`, `user_id`, `price`) VALUES
(1, 1, '2023-11-04', '2023-11-05', 2, 1, NULL, NULL, NULL, 1, '3.44'),
(3, 1, '2023-12-08', '2023-12-09', 1, 1, NULL, NULL, NULL, 1, '5.66'),
(4, 1, '2024-01-10', '2024-01-12', 1, 0, '2023-12-01 07:35:21', '2023-12-05 18:24:41', '2023-12-02 19:17:46', 1, '200.00'),
(5, 1, '2023-11-30', '2023-12-01', 1, 0, '2023-12-04 10:41:30', '2023-12-05 18:29:23', NULL, 1, '100.00'),
(6, 1, '2023-12-12', '2023-12-14', 1, 0, '2023-12-05 06:04:29', '2023-12-05 06:04:29', NULL, 1, '200.00'),
(7, 1, '2023-12-28', '2023-12-29', 1, 0, '2023-12-05 11:05:05', '2023-12-05 18:07:10', NULL, 1, '100.00'),
(8, 1, '2023-12-05', '2023-12-07', 1, 0, '2023-12-05 11:08:47', '2023-12-05 11:47:11', '2023-12-05 11:47:11', 1, '200.00');

-- --------------------------------------------------------

--
-- Table structure for table `room_spaces`
--

DROP TABLE IF EXISTS `room_spaces`;
CREATE TABLE IF NOT EXISTS `room_spaces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_spaces`
--

INSERT INTO `room_spaces` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Living room', NULL, NULL),
(2, 'Bathroom', NULL, NULL),
(3, 'Kitchen', NULL, NULL),
(4, 'Guest hall', NULL, NULL),
(5, 'Corridor', NULL, NULL),
(6, 'Bedroom', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_suites`
--

DROP TABLE IF EXISTS `room_suites`;
CREATE TABLE IF NOT EXISTS `room_suites` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_suites`
--

INSERT INTO `room_suites` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Penthouse Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(2, 'Presidential Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(3, 'Executive Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(4, 'Double Queen Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(5, 'King Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(6, 'Standard Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(7, 'Deluxe Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(8, 'Junior Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(9, 'Family Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06'),
(10, 'Honeymoon Suite', '2023-11-25 11:37:06', '2023-11-25 11:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kārlis Ivars Braķis', 'kaarlisbrakis@gmail.com', '2023-11-23 22:00:00', '$2y$12$IWd15BAmayINiAzJq4Klju1U.ElhPxqrOxBpasgR/eSBCpxfbDovm', 1, 'dbaAV5Sc61fRInifrEqll0cHKmN3VqzEc4GXuKzXvcO8Cct9CLqclKPe67l3', '2023-11-24 18:59:22', '2023-11-24 18:59:22'),
(2, 'Kārlis Ivars Braķis', 'ip20.k.brakis@vtdt.edu.lv', '0000-00-00 00:00:00', '$2y$12$GtxDZ08CL67K87Pbtf0AGOR3akRmbU.NJOBHyIuW92LJIvGuPo5O6', 0, NULL, '2023-11-24 18:59:47', '2023-11-24 18:59:47'),
(3, '####', 'eewrw@wr', NULL, '$2y$12$H3yj7ZZtuh/BhVh3/s5wHuJb1gnL2bnRHC1AD9VjEfrbcdjLePZqK', 0, NULL, '2023-12-04 08:52:05', '2023-12-04 08:52:05');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
