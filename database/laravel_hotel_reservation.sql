-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2023 at 01:50 PM
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

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `address`, `stars`, `image_link`, `google_maps_link`, `created_at`, `updated_at`, `description`, `slug`) VALUES
(1, 'VTDT Dienesta Viesnīca', 'Valmieras iela 19, Cēsis, Latvija', 5, 'assets/cesu-kojas.webp', 'https://www.google.com/maps?q=Valmieras+iela+19,Cēsis', '2023-11-25 11:02:57', '2023-11-25 11:02:57', 'Stay here pls pls pls pls pls pls pls pls pls.', 'vtdt-dienesta-viesnica'),
(2, 'Compass Hotel Medford by Margaritaville', '2399 S Pacific Hwy, Medford, OR 97501, United States', 3, 'assets/hotelis.jpg', 'https://www.google.com/maps?sca_esv=585092746&output=search&q=medford+oregon+compass+hotel&source=lnms&entry=mc&sa=X&ved=2ahUKEwjzhvXhjt2CAxXiFhAIHTgxDcwQ0pQJegQIDhAB', '2023-11-25 11:02:57', '2023-11-25 11:02:57', 'Compass Hotel Medford by Margaritaville is a luxurious hotel located in the heart of Medford, Oregon. The hotel features 118 spacious guest rooms and suites, each of which is elegantly appointed with modern amenities and stylish decor. Guests can enjoy a range of on-site amenities, including a fitness center, outdoor pool, and rooftop bar with stunning views of the city. The hotel also offers a variety of dining options, including a full-service restaurant and a coffee shop. With its prime location and exceptional amenities, Compass Hotel Medford by Margaritaville is the perfect destination for business and leisure travelers alike.', 'compass-hotel-medford');

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('kaarlisbrakis@gmail.com', '$2y$12$LJ0Mb2z6M8A3UEOfkH9XOuWsW0sljScOqmA2lHP8cM.SJmwyNnase', '2023-12-05 08:45:22');

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

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `filename`, `promotional`, `created_at`, `updated_at`, `space_id`) VALUES
(1, 1, 'hotel.webp', 0, NULL, NULL, 3),
(2, 1, 'hotel-1.jpg', 0, NULL, NULL, 6),
(3, 1, 'hotel-2.jpg', 0, NULL, NULL, 4),
(4, 1, 'hotel-3.jpeg', 0, NULL, NULL, 6),
(5, 1, 'hotel-4.webp', 0, NULL, NULL, 5);

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

--
-- Dumping data for table `room_reservations`
--

INSERT INTO `room_reservations` (`id`, `room_id`, `date_from`, `date_to`, `number_of_people`, `is_paid`, `created_at`, `updated_at`, `cancelled_at`, `user_id`, `price`) VALUES
(1, 1, '2023-11-04', '2023-11-05', 2, 1, NULL, NULL, NULL, 1, '3.44'),
(3, 1, '2023-12-08', '2023-12-09', 1, 1, NULL, NULL, NULL, 1, '5.66'),
(4, 1, '2024-01-10', '2024-01-12', 1, 0, '2023-12-01 07:35:21', '2023-12-11 11:08:50', NULL, 1, '200.00'),
(5, 1, '2024-01-01', '2024-01-02', 1, 0, '2023-12-04 10:41:30', '2023-12-11 11:08:16', NULL, 1, '100.00'),
(6, 1, '2023-12-12', '2023-12-14', 1, 0, '2023-12-05 06:04:29', '2023-12-05 06:04:29', NULL, 1, '200.00'),
(7, 1, '2023-12-28', '2023-12-29', 1, 0, '2023-12-05 11:05:05', '2023-12-06 16:05:47', NULL, 1, '100.00'),
(8, 1, '2023-12-05', '2023-12-07', 1, 0, '2023-12-05 11:08:47', '2023-12-05 11:47:11', '2023-12-05 11:47:11', 1, '200.00');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kārlis Ivars Braķis', 'kaarlisbrakis@gmail.com', '2023-11-23 22:00:00', '$2y$12$IWd15BAmayINiAzJq4Klju1U.ElhPxqrOxBpasgR/eSBCpxfbDovm', 1, '1ITZsl2JSwKQlmPOwWy6lLH6weVQWHE1LvYSaOCX02UsYm04AN1ubGcxCuKu', '2023-11-24 18:59:22', '2023-11-24 18:59:22'),
(2, 'Kārlis Ivars Braķis', '', '0000-00-00 00:00:00', '$2y$12$GtxDZ08CL67K87Pbtf0AGOR3akRmbU.NJOBHyIuW92LJIvGuPo5O6', 0, NULL, '2023-11-24 18:59:47', '2023-11-24 18:59:47'),
(3, '####', 'eewrw@wr', NULL, '$2y$12$H3yj7ZZtuh/BhVh3/s5wHuJb1gnL2bnRHC1AD9VjEfrbcdjLePZqK', 0, NULL, '2023-12-04 08:52:05', '2023-12-04 08:52:05'),
(4, 'test', 'test@test.lv', NULL, '$2y$12$7pE9TC/qiLkv9UoLXT0m4ejwmkObDpD6rncLDmm1fjE5o9tGCiaHC', 0, NULL, '2023-12-11 10:40:53', '2023-12-11 10:40:53'),
(5, 'Kārlis Ivars Braķis', 'kaarlisbrakis@lv.com', NULL, '$2y$12$KnTtSYm6ZKS1qUbJO9VSRuBFQQmQAGndudLgRYNxUYvaDtWAjo9Ay', 0, NULL, '2023-12-11 10:47:31', '2023-12-11 10:47:31'),
(6, 'Kārlis Ivars Braķis', 'kaarlisbrakis@lv.com', NULL, '$2y$12$WJGvMsVF0GufOsfIxavGme1zhPIEO0RkiBqHkunsxH32gaMVdvFvG', 0, NULL, '2023-12-11 10:49:45', '2023-12-11 10:49:45'),
(7, 'Kārlis Ivars Braķis', 'kaarlisbrakis@lv.com', NULL, '$2y$12$NyGz00hbvF9/xZ7.Sww9Xu.z1GShFT4PpGOByvy/EHtTyL1ORgOF.', 0, NULL, '2023-12-11 10:50:18', '2023-12-11 10:50:18'),
(8, 'Kārlis Ivars Braķis', 'kaarlisbrakis@lv.com', NULL, '$2y$12$4RnjxqGbIOgvanEBzz7I4OGcIAVpoy0qjTsxd0YHAeE8i6Gkk2BHi', 0, NULL, '2023-12-11 10:50:48', '2023-12-11 10:50:48'),
(9, 'Kārlis Ivars Braķis', 'kaarlisbrakis@weadr.com', NULL, '$2y$12$L1GP8zyspWpnVAOHez2Urun.LOzyXlVRKMdD30LMPC7px8qWO2jwu', 0, NULL, '2023-12-11 10:51:23', '2023-12-11 10:51:23'),
(10, 'Kārlis Ivars Braķis', 'kaarlisbrakis@4frg.com', NULL, '$2y$12$9qoYIdSl1n.LkSr4kVJf4.KjbeUQ5kJOE2FIiaKq2uRNE/Ye1/is2', 0, NULL, '2023-12-11 10:52:45', '2023-12-11 10:52:45'),
(11, 'Kārlis Ivars Braķis', 'kaarlisbrakis@germail.com', NULL, '$2y$12$C6sKvg5JdueB/XUYqV4ViuVQ2BGP4crR9RVVzpllkczrvLh5vfNTi', 0, NULL, '2023-12-11 10:53:03', '2023-12-11 10:53:03'),
(12, 'Kārlis Ivars Braķis', 'ip20.k.brakis@vtdt.edu.lv', NULL, '$2y$12$4Zz.FQFz9K4PCOhfI2fJMOYZckLnj46mL4wBoewU8eauy5tnzQEPC', 0, NULL, '2023-12-11 10:53:37', '2023-12-11 10:53:37'),
(13, 'Kārlis Ivars Braķis', 'kaarlisbrakis@rf.com', NULL, '$2y$12$r9GtVps24prf./eNoF6dDu8G6qUn4/MWxBnvZEXEa82CaQRC3v3Ua', 0, NULL, '2023-12-11 11:02:25', '2023-12-11 11:02:25'),
(14, 'test', 'test@test.lv', NULL, '$2y$12$he2zVIfzf4Pr6LBWD3DHQukeWXS8q7dyHLiOkAhOrOYkjCU8AYdIO', 0, NULL, '2023-12-11 11:05:30', '2023-12-11 11:05:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
