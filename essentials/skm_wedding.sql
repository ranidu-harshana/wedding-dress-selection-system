-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 29, 2022 at 06:35 PM
-- Server version: 10.2.43-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skm_wedding`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `status`, `created_at`, `updated_at`, `prefix`) VALUES
(1, 'Sri Kula Medura Ratnapura', 1, '2022-04-11 16:39:54', '2022-04-11 16:39:54', 'SMB'),
(2, 'Sri Kula Medura Colombo', 1, '2022-04-11 16:40:10', '2022-04-11 16:40:10', 'SCB'),
(3, 'Rajashreeya Branch', 1, '2022-04-11 16:40:27', '2022-04-11 16:40:27', 'RAJ');

-- --------------------------------------------------------

--
-- Table structure for table `branch_user`
--

CREATE TABLE `branch_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_user`
--

INSERT INTO `branch_user` (`id`, `branch_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 3, 4, NULL, NULL),
(6, 1, 5, NULL, NULL),
(7, 3, 5, NULL, NULL),
(11, 3, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `costs`
--

CREATE TABLE `costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `transport` double DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `cleaning` double DEFAULT NULL,
  `depriciation` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `costs`
--

INSERT INTO `costs` (`id`, `customer_id`, `transport`, `salary`, `cleaning`, `depriciation`, `created_at`, `updated_at`) VALUES
(1, 2, 6000, 6000, 2000, 7000, '2022-04-24 05:20:41', '2022-04-24 05:20:41'),
(2, 8, 1000, 5000, 2000, 4000, '2022-04-24 06:09:42', '2022-04-24 06:09:42'),
(3, 5, 1000, 5000, 2000, 4000, '2022-04-24 06:14:17', '2022-04-24 06:14:17'),
(4, 6, 1000, 5000, 2000, 4000, '2022-04-24 07:02:02', '2022-04-24 07:02:02'),
(5, 7, 500, 5000, 2500, 3500, '2022-04-24 08:40:59', '2022-04-24 08:40:59'),
(6, 11, 1200, 5000, 2500, 5000, '2022-04-24 08:53:09', '2022-04-24 08:53:09'),
(7, 9, 500, 5000, 2500, 5000, '2022-04-24 09:05:54', '2022-04-24 09:06:08'),
(8, 10, 1500, 4000, 1500, 2000, '2022-04-24 09:08:36', '2022-04-24 09:08:36'),
(9, 12, 500, 5000, 2000, 4500, '2022-04-24 09:14:11', '2022-04-24 09:14:27'),
(10, 13, 2000, 5000, 2000, 4500, '2022-04-24 09:15:48', '2022-04-24 09:15:48'),
(11, 17, 3500, 6000, 2500, 7500, '2022-04-24 09:25:30', '2022-04-24 09:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `function_date` date NOT NULL,
  `function_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_bestmen` tinyint(4) DEFAULT NULL,
  `no_of_pageboys` tinyint(4) DEFAULT NULL,
  `dressing_place` tinyint(4) NOT NULL,
  `going_away_change_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `postponed` date DEFAULT NULL,
  `dress_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `measurement_date` date DEFAULT NULL,
  `special_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `advance_payment` int(11) DEFAULT NULL,
  `bridal_dressing_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bridal_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sec_bridal_group_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photography_place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `bill_number`, `branch_id`, `name`, `address`, `mobile_no1`, `mobile_no2`, `function_date`, `function_place`, `no_of_bestmen`, `no_of_pageboys`, `dressing_place`, `going_away_change_place`, `status`, `postponed`, `dress_description`, `measurement_date`, `special_notes`, `created_at`, `updated_at`, `user_id`, `total_amount`, `discount`, `advance_payment`, `bridal_dressing_place`, `bridal_color`, `sec_bridal_group_color`, `photography_place`) VALUES
(2, '2006', 1, 'Sabhira Wijesiri', 'Hidellana, Ratnapura', '0713889100', NULL, '2022-05-02', 'Kaluthara', 4, 0, 0, NULL, 1, NULL, NULL, '2022-04-23', NULL, '2022-04-22 20:10:58', '2022-04-24 04:26:19', 1, 50000, NULL, 5000, NULL, NULL, NULL, NULL),
(4, '4', 1, 'test', 'test', '3423', NULL, '2022-04-24', 'test', 1, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 11:50:57', '2022-04-25 14:01:08', 1, 100000, 5000, NULL, NULL, NULL, NULL, NULL),
(5, '2021', 1, 'Prabhath nawalage', 'Kalawana', '0719127000', '0702900501', '2022-05-02', 'Grand guardian', 1, 0, 1, NULL, 1, NULL, NULL, '2022-04-22', NULL, '2022-04-23 22:33:30', '2022-04-24 05:05:38', 1, 34000, NULL, 10000, NULL, NULL, NULL, NULL),
(6, '1199', 1, 'Y.H Ishan Prabhath', 'Dodampe', '0702243122', '0704378031', '2022-05-04', 'Rose Gradian', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:47:15', '2022-04-23 22:47:15', 1, 35000, NULL, 8000, 'Elegant Salon', NULL, NULL, 'Supun'),
(7, '2018', 1, 'A.K Prasanna Janaka Kumara Yasarathne', 'Ayagama', '0710538292', '0778394348', '2022-05-05', 'Deshani Reception hall', 0, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:52:59', '2022-04-23 22:52:59', 1, 35000, NULL, 5000, 'Salon Wink', 'White', NULL, 'Thineth Studio'),
(8, '1189', 1, 'Kasun Chandima', 'Godigamuwa', '0763457654', '0710614151', '2022-05-02', 'Grand guardian', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:57:07', '2022-04-23 22:57:07', 1, 38000, NULL, 10000, 'Champa Hill', NULL, NULL, 'Sumith Studio'),
(9, '1193', 1, 'Arjuna Prasad', 'Mihidugama', '0716179025', '0710444008', '2022-05-12', 'Palamino Reception Hall', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:59:24', '2022-04-23 22:59:24', 1, 43000, NULL, 10000, 'Kalani Salon', NULL, NULL, 'Click It Studio'),
(10, '2014', 1, 'Chathura Sanjaya Rathnayake', 'Elapatha', '0711962206', NULL, '2022-05-12', 'Lake Seranaty', 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:01:08', '2022-04-23 23:01:08', 1, 25000, NULL, 5000, NULL, NULL, NULL, 'Lahiru Theekshana'),
(11, '1198', 1, 'G.W.C Jinendra', 'Nivithigala', '0719419430', '0788890613', '2022-05-06', 'Rose Gradian', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:02:51', '2022-04-23 23:02:51', 1, 42000, NULL, 20001, NULL, NULL, NULL, 'Hasindu Studio'),
(12, '2017', 1, 'Chathura Bhashana', 'Kandy', '0721108284', '0824326305', '2022-05-12', 'Kethumathie', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:04:28', '2022-04-23 23:04:28', 1, 35000, NULL, 5000, NULL, 'Ivory', NULL, NULL),
(13, '2015', 1, 'R.G.A.L. Kumara', 'Ratnapura', '0713026551', NULL, '2022-05-12', 'Wijaya Holiday Resort', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:07:35', '2022-04-23 23:07:35', 1, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(14, '1164', 1, 'Y.T Nayanapriya', 'Opanayake', '0717629351', '0702612962', '2022-05-19', 'Grand guardian', 3, 0, 1, NULL, 0, '2022-04-19', NULL, NULL, NULL, '2022-04-23 23:10:01', '2022-04-23 23:12:45', 1, 50500, NULL, 5000, 'Menuka Bridal', NULL, NULL, 'Foto Story'),
(15, '2030', 1, 'Dinesh Sunanda', 'Pelmadulla', '0710897740', '0717003956', '2022-06-10', 'Saru Blue Safari', 3, 3, 0, NULL, 1, '2022-05-18', NULL, NULL, NULL, '2022-04-23 23:16:41', '2022-04-23 23:19:21', 1, 52000, NULL, 10000, 'Nilan Bridal', 'White & Gold', NULL, 'Panasara Studio'),
(16, '2012', 1, 'P.A.T Pabasara', 'Allagawa', '0712895062', NULL, '2022-05-20', 'Thewni Reception', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:21:32', '2022-04-23 23:21:32', 1, 42000, NULL, 10000, NULL, 'White', NULL, NULL),
(17, '1196', 1, 'Charitha Sandun Lekamge', 'Kahawatte', '071791642', NULL, '2022-05-20', 'Silveray', 0, 0, 0, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:26:27', '2022-04-24 14:17:44', 1, 55000, NULL, 10000, 'Menuka Bridal', NULL, NULL, NULL),
(18, '2025', 1, 'Chamod Dilhan', 'Bandaranayake mawatha, Rathnapura', '0716266967', '0716266865', '2022-05-20', 'Rajanawa Resort', 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:29:59', '2022-04-23 23:29:59', 1, 25000, NULL, 5000, NULL, NULL, NULL, NULL),
(19, '1176', 1, 'Himesha Kannangara', 'Kahawaththa', '0713227890', NULL, '2022-05-20', 'Grand guardian', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:31:24', '2022-04-23 23:31:24', 1, 38000, NULL, 10000, 'Lakshi Salon', NULL, NULL, NULL),
(20, '1395', 1, 'Nadeeshan Chamara', 'Balangoda', '0715617524', NULL, '2022-05-25', 'Grand guardian', 4, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:34:17', '2022-04-23 23:34:17', 1, 55000, NULL, 5000, 'Niroshan Dilshan', NULL, NULL, 'Dark Room'),
(21, '2002', 1, 'Senarath Harshana', 'Ratnapura', '0774944532', NULL, '2022-05-25', 'Grand guardian', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:37:22', '2022-04-23 23:37:22', 1, 45000, NULL, 5000, 'Lakshi Salon', NULL, NULL, NULL),
(22, '1191', 1, 'Vidath S Aththanayake', 'Nivithigala', '0717135495', '0789954888', '2022-05-26', 'Rajanawa Resort', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:39:00', '2022-04-23 23:39:00', 1, 35000, NULL, 5000, 'Salon Glow Heaven', 'Pearl & Gold', NULL, NULL),
(23, '2019', 1, 'D.M.C.P.K Dissanayake', 'Monaragala', '0767079914', NULL, '2022-05-26', 'Lake Seranaty', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:40:54', '2022-04-23 23:40:54', 1, 45000, NULL, 10000, 'Kalani Salon', NULL, NULL, 'Vision Angel'),
(24, '1172', 1, 'W.K Kumudu Samanthilake', 'Muwagama', '0710824348', '0760715031', '2022-05-09', 'Not decided yet', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:44:03', '2022-04-23 23:44:03', 1, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(26, '2031', 1, 'Kalana perera', 'Godakawela', '0771445621', NULL, '2022-05-12', 'Owinrich Godakawela', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-24 04:11:08', '2022-04-24 04:11:08', 1, 42000, NULL, 10000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dress_selections`
--

CREATE TABLE `dress_selections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dress_selections`
--

INSERT INTO `dress_selections` (`id`, `customer_id`, `type`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Groom\'s Jacket', 'MPW03 - Maroon Pearl work 220 [Min ] (17)', 0, '2022-04-22 20:44:35', '2022-04-28 06:52:37'),
(2, 2, 'Groom\'s Cavani', NULL, 0, '2022-04-22 20:44:35', '2022-04-22 20:44:35'),
(3, 2, 'Bestman\'s Jacket - 1', 'SGS02 - Silver gold spring work (18 1/2) [220]', 0, '2022-04-22 20:44:35', '2022-04-22 20:44:35'),
(4, 2, 'Bestman\'s Jacket - 2', 'SGS01 - Silver gold spring work (18) [220]', 0, '2022-04-22 20:44:35', '2022-04-22 20:45:26'),
(5, 2, 'Bestman\'s Jacket - 3', 'SGS03 - Silver gold spring work (17) [220]', 0, '2022-04-22 20:44:35', '2022-04-22 20:45:37'),
(6, 2, 'Bestman\'s Jacket - 4', 'SGS05 - Silver gold spring work (16 1/2) [220]', 0, '2022-04-22 20:44:35', '2022-04-28 06:54:59'),
(15, 5, 'Groom\'s Jacket', 'BPW04 - Dark Blue Pearl Work (21) [221]', 0, '2022-04-24 05:24:00', '2022-04-24 05:24:00'),
(16, 5, 'Groom\'s Cavani', NULL, 0, '2022-04-24 05:24:00', '2022-04-24 05:24:00'),
(17, 5, 'Bestman\'s Jacket - 1', NULL, 0, '2022-04-24 05:24:00', '2022-04-24 05:24:00'),
(18, 5, 'Group Cavani', NULL, 0, '2022-04-24 05:24:00', '2022-04-24 05:24:00'),
(19, 8, 'Groom\'s Jacket', 'MDS11 - Maroon Dull gold 20 ( Han) 220', 0, '2022-04-24 06:08:54', '2022-04-24 06:08:54'),
(20, 8, 'Groom\'s Cavani', NULL, 0, '2022-04-24 06:08:54', '2022-04-24 06:08:54'),
(21, 8, 'Bestman\'s Jacket - 1', 'RW05 - Dark Red White work (pearl) 16 1/2 [220]', 0, '2022-04-24 06:08:54', '2022-04-24 06:08:54'),
(22, 8, 'Pageboy\'s Jacket - 1', 'RW02 - Dark Red White work (pearl) 13+ [220]', 0, '2022-04-24 06:08:54', '2022-04-24 06:08:54'),
(23, 8, 'Group Cavani', NULL, 0, '2022-04-24 06:08:54', '2022-04-24 06:08:54'),
(24, 2, 'Group Cavani', NULL, 0, NULL, NULL),
(25, 7, 'Groom\'s Jacket', 'BPW02 - Dark Blue Pearl Work (17) [220]', 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(26, 7, 'Groom\'s Cavani', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(27, 7, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(28, 7, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(29, 7, 'Pageboy\'s Jacket - 3', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(30, 7, 'Group Cavani', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(31, 11, 'Groom\'s Jacket', 'MDS06 - Maroon soft velvet dull gold work  (17) [220]', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(32, 11, 'Groom\'s Cavani', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(33, 11, 'Bestman\'s Jacket - 1', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(34, 11, 'Bestman\'s Jacket - 2', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(35, 11, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(36, 11, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(37, 11, 'Group Cavani', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(38, 9, 'Groom\'s Jacket', 'GPW01 - Dark Gray Pearl work (17) [220]', 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(39, 9, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(40, 9, 'Bestman\'s Jacket - 1', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(41, 9, 'Bestman\'s Jacket - 2', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(42, 9, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(43, 9, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(44, 9, 'Group Cavani', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(45, 10, 'Groom\'s Jacket', 'BPW02 - Dark Blue Pearl Work (17) [220]', 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(46, 10, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(47, 10, 'Group Cavani', NULL, 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(48, 12, 'Groom\'s Jacket', 'MPW06 - Maroon Pearl work 221 [Min ] Lion (18)', 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(49, 12, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(50, 12, 'Bestman\'s Jacket - 1', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(51, 12, 'Bestman\'s Jacket - 2', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(52, 12, 'Group Cavani', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(53, 13, 'Groom\'s Jacket', 'MDC02 - Maroon Dull Gold Cutwork Soft Velvet 218 [Min] (17)', 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(54, 13, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(55, 13, 'Bestman\'s Jacket - 1', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(56, 13, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(57, 13, 'Group Cavani', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(58, 16, 'Groom\'s Jacket', 'GPW01 - Dark Gray Pearl work (17) [220]', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(59, 16, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(60, 16, 'Bestman\'s Jacket - 1', 'LG06 - Light Gray [ASH] 222 (17)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(61, 16, 'Bestman\'s Jacket - 2', 'LG07 - Light Gray [ASH] 222 (17 1/2)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(62, 16, 'Pageboy\'s Jacket - 1', 'LG02 - Light Gray [ASH] 222 (13-)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(63, 16, 'Group Cavani', NULL, 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(64, 17, 'Groom\'s Jacket', 'MPW04 - Maroon Pearl work 221 [Min ] (17 1/2)', 0, '2022-04-24 09:27:16', '2022-04-24 09:27:16'),
(65, 17, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:27:16', '2022-04-24 09:27:16'),
(66, 17, 'Group Cavani', NULL, 0, '2022-04-24 09:27:16', '2022-04-24 09:27:16'),
(109, 4, 'Groom\'s Jacket', 'MDS01 - Maroon Maroon dull gold Spring work 216 (18)', 0, '2022-04-24 12:24:39', '2022-04-24 12:24:39'),
(110, 4, 'Groom\'s Cavani', NULL, 0, '2022-04-24 12:24:39', '2022-04-24 12:24:39'),
(111, 4, 'Bestman\'s Jacket - 1', 'SGS02 - Silver gold spring work (18 1/2) [220]', 0, '2022-04-24 12:24:39', '2022-04-24 13:52:34'),
(113, 4, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 12:24:39', '2022-04-24 12:24:39'),
(115, 4, 'Group Cavani', NULL, 0, '2022-04-24 12:24:39', '2022-04-24 12:24:39'),
(127, 4, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-04-25 14:01:08', '2022-04-25 14:01:08'),
(128, 6, 'Groom\'s Jacket', 'BPW02 - Dark Blue Pearl Work (17) [220]', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(129, 6, 'Groom\'s Cavani', NULL, 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(130, 6, 'Bestman\'s Jacket - 1', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(131, 6, 'Pageboy\'s Jacket - 1', 'DB07 - Dark Beige Spring work [two tone] 219 (13+)', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(132, 6, 'Group Cavani', NULL, 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intering_payments`
--

CREATE TABLE `intering_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `intering_payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `intering_payments`
--

INSERT INTO `intering_payments` (`id`, `customer_id`, `intering_payment`, `created_at`, `updated_at`) VALUES
(1, 2, 47000, '2022-04-24 06:41:53', '2022-04-24 06:41:53'),
(2, 6, 27000, '2022-04-24 07:02:13', '2022-04-24 07:02:13'),
(3, 4, 10000, '2022-04-24 12:37:15', '2022-04-24 13:08:52'),
(4, 4, 6000, '2022-04-24 13:09:45', '2022-04-24 13:09:55');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_category_id`, `item_code`, `item_desc`, `item_type`, `item_image_url`, `created_at`, `updated_at`) VALUES
(18, 2, 'BCW01', 'Black Cutwork 218 (17 1/2)', 'Groom', NULL, '2022-04-20 00:05:38', '2022-04-20 00:05:38'),
(19, 2, 'BDS01', 'Brown dull gold spring work 218 (17+)', 'Groom', NULL, '2022-04-20 00:47:23', '2022-04-20 00:47:23'),
(20, 2, 'BPW01', 'Dark Brown Pearl Work (17) [220]', 'Groom', NULL, '2022-04-20 00:49:23', '2022-04-20 00:49:23'),
(21, 2, 'BPW02', 'Dark Blue Pearl Work (17) [220]', 'Groom', NULL, '2022-04-20 00:50:41', '2022-04-20 00:50:41'),
(22, 2, 'BPW03', 'Dark Blue Pearl Work (18) [220] Han', 'Groom', NULL, '2022-04-20 00:51:22', '2022-04-20 00:51:22'),
(23, 2, 'BPW04', 'Dark Blue Pearl Work (21) [221]', 'Groom', NULL, '2022-04-20 00:51:56', '2022-04-20 00:51:56'),
(24, 2, 'CS01', 'Ivory Spring [cream] 218 (11)', 'Pageboy', NULL, '2022-04-20 00:54:19', '2022-04-20 00:54:19'),
(25, 2, 'CS02', 'Ivory Spring [cream] 218 (12)', 'Pageboy', NULL, '2022-04-20 00:56:40', '2022-04-20 00:56:40'),
(26, 2, 'CS03', 'Ivory Spring [cream] 218 (13)', 'Pageboy', NULL, '2022-04-20 00:57:07', '2022-04-20 00:57:07'),
(27, 2, 'CS04', 'Ivory Spring [cream] 218 (14 1/2)', 'Pageboy', NULL, '2022-04-20 00:57:39', '2022-04-20 00:57:39'),
(28, 2, 'CS05', 'Ivory Spring [cream] 218 (17-)', 'Bestman', NULL, '2022-04-20 00:58:44', '2022-04-20 00:58:44'),
(29, 2, 'CS06', 'Ivory Spring [cream] 218 (16+)', 'Bestman', NULL, '2022-04-20 01:00:46', '2022-04-20 01:00:46'),
(30, 2, 'CS07', 'Ivory Spring [cream] 218 (16 1/2)', 'Bestman', NULL, '2022-04-20 01:01:30', '2022-04-20 01:01:30'),
(31, 2, 'CS08', 'Ivory Spring [cream] 218 (17 1/2)', 'Bestman', NULL, '2022-04-20 01:02:17', '2022-04-20 01:02:17'),
(32, 2, 'DB01', 'Dark Beige Spring work [two tone] 219 (18-)', 'Bestman', NULL, '2022-04-20 01:03:05', '2022-04-20 01:03:05'),
(33, 2, 'DB02', 'Dark Beige Spring work [two tone] 219 (17+)', 'Bestman', NULL, '2022-04-20 01:03:32', '2022-04-20 01:03:32'),
(34, 2, 'DB03', 'Dark Beige Spring work [two tone] 219 (15 1/2)', 'Bestman', NULL, '2022-04-20 01:04:36', '2022-04-20 01:04:36'),
(35, 2, 'DB04', 'Dark Beige Spring work [two tone] 219 (17-)', 'Bestman', NULL, '2022-04-20 01:05:16', '2022-04-20 01:05:16'),
(36, 2, 'DB05', 'Dark Beige Spring work [two tone] 219 (16)', 'Bestman', NULL, '2022-04-20 01:05:50', '2022-04-20 01:05:50'),
(37, 2, 'DB06', 'Dark Beige Spring work [two tone] 219  (13-)', 'Pageboy', NULL, '2022-04-20 01:06:54', '2022-04-20 01:06:54'),
(38, 2, 'DB07', 'Dark Beige Spring work [two tone] 219 (13+)', 'Pageboy', NULL, '2022-04-20 01:07:20', '2022-04-20 01:07:20'),
(39, 2, 'DB08', 'Dark Beige Spring work [two tone] 219 (14)', 'Pageboy', NULL, '2022-04-20 01:07:50', '2022-04-20 01:07:50'),
(40, 2, 'DB09', 'Dark Beige Spring work [two tone] 219 (14 1/2+)', 'Pageboy', NULL, '2022-04-20 01:08:18', '2022-04-20 01:08:18'),
(41, 2, 'DBC01', 'Dark Blue dull gold cutwork 217 (16)', 'Groom', NULL, '2022-04-20 01:09:42', '2022-04-20 01:09:42'),
(42, 2, 'DBS01', 'Dark Blue Spring work [dull gold work] 218  (18)', 'Groom', NULL, '2022-04-20 01:10:01', '2022-04-20 01:10:01'),
(43, 2, 'DI02', 'Gold Ivory Bead work 218 (13 1/2)', 'Pageboy', NULL, '2022-04-20 01:14:45', '2022-04-20 01:14:45'),
(44, 2, 'DI04', 'Gold Ivory Bead Work 218 (16)', 'Bestman', NULL, '2022-04-20 01:15:26', '2022-04-20 01:15:26'),
(45, 2, 'DI05', 'Gold Ivory Bead work 218 (16 1/2)', 'Bestman', NULL, '2022-04-20 01:16:02', '2022-04-20 01:16:02'),
(46, 2, 'DI08', 'Gold Ivory Bead work 218 (17 1/2)', 'Bestman', NULL, '2022-04-20 01:16:36', '2022-04-20 01:16:36'),
(47, 2, 'DIS01', 'Dark Ivory Bead work 216 (17 1/2)', 'Bestman', NULL, '2022-04-20 01:16:57', '2022-04-20 01:16:57'),
(48, 2, 'DIS02', 'Dark Ivory Bead work 216 (17 1/2)', 'Bestman', NULL, '2022-04-20 01:17:20', '2022-04-20 01:17:20'),
(49, 2, 'DIS03', 'Dark Ivory Bead work 216 (16 1/2)', 'Bestman', NULL, '2022-04-20 01:17:46', '2022-04-20 01:17:46'),
(50, 2, 'DIS04', 'Dark Ivory Bead work 216  (17)', 'Bestman', NULL, '2022-04-20 01:18:22', '2022-04-20 01:18:22'),
(53, 2, 'DI01', 'Gold Ivory Bead work 218 (12 1/2)', 'Pageboy', NULL, '2022-04-20 02:06:17', '2022-04-20 02:06:17'),
(54, 2, 'DIS05', 'Dark Ivory Bead work 216 (14 1/2)', 'Pageboy', NULL, '2022-04-20 04:22:48', '2022-04-20 04:22:48'),
(55, 2, 'DIS06', 'Dark Ivory Bead work 216 (11)', 'Pageboy', NULL, '2022-04-20 04:23:15', '2022-04-20 04:23:15'),
(56, 2, 'DRB01', 'Dark Red Bead work 217 (17)', 'Bestman', NULL, '2022-04-20 04:23:53', '2022-04-20 04:23:53'),
(57, 2, 'DRB02', 'Dark Red Bead work 217 (17)', 'Bestman', NULL, '2022-04-20 04:24:08', '2022-04-20 04:24:08'),
(58, 2, 'DRB03', 'Dark Red Bead work 217 (16)', 'Bestman', NULL, '2022-04-20 04:24:23', '2022-04-20 04:24:23'),
(59, 2, 'DRB04', 'Dark Red Bead work 217 (17-)', 'Bestman', NULL, '2022-04-20 04:24:42', '2022-04-20 04:24:42'),
(60, 2, 'DRB05', 'Dark Red Bead work 217 (12)', 'Pageboy', NULL, '2022-04-20 04:25:30', '2022-04-20 04:25:30'),
(61, 2, 'DRB06', 'Dark Red Bead work 217 (14)', 'Pageboy', NULL, '2022-04-20 04:25:46', '2022-04-20 04:25:46'),
(62, 2, 'DRB07', 'Dark Red Bead work 217 (12-)', 'Pageboy', NULL, '2022-04-20 04:26:04', '2022-04-20 04:26:04'),
(63, 2, 'DRB08', 'Dark Red Bead work 217 (13 1/2+)', 'Pageboy', NULL, '2022-04-20 04:26:23', '2022-04-20 04:26:23'),
(64, 2, 'DRB11', 'Dark Red Bead Work 217 (20)', 'Bestman', NULL, '2022-04-20 04:26:54', '2022-04-20 04:26:54'),
(65, 2, 'DRB12', 'Dark Red Bead work 217 (18-)', 'Bestman', NULL, '2022-04-20 04:27:14', '2022-04-20 04:27:14'),
(66, 2, 'DRC01', 'Dark Red Cutwork 218 [Nis] (17 1/2)', 'Groom', NULL, '2022-04-20 04:29:03', '2022-04-20 04:29:03'),
(67, 2, 'DRS01', 'Dark Red Dull gold spring work 217 (17)', 'Groom', NULL, '2022-04-20 04:29:22', '2022-04-20 04:29:22'),
(68, 2, 'GDC01', 'Dark Green Dull gold Cutwork 219 (17)', 'Groom', NULL, '2022-04-20 04:29:40', '2022-04-20 04:29:40'),
(69, 2, 'GPW01', 'Dark Gray Pearl work (17) [220]', 'Groom', NULL, '2022-04-20 04:29:57', '2022-04-20 04:29:57'),
(70, 2, 'GS01', 'Gray Spring work 218 (11+)', 'Pageboy', NULL, '2022-04-20 05:10:19', '2022-04-20 05:10:19'),
(71, 2, 'GS02', 'Gray Spring work 218 (12+)', 'Pageboy', NULL, '2022-04-20 05:16:21', '2022-04-20 05:16:21'),
(72, 2, 'GS03', 'Gray Spring work 218 (13+)', 'Pageboy', NULL, '2022-04-20 05:17:00', '2022-04-20 05:17:00'),
(73, 2, 'GS04', 'Gray Spring work 218 (14 1/2)', 'Pageboy', NULL, '2022-04-20 23:45:32', '2022-04-20 23:45:32'),
(74, 2, 'GS05', 'Gray Spring work 218 (16+)', 'Bestman', NULL, '2022-04-20 23:46:11', '2022-04-20 23:46:11'),
(75, 2, 'GS06', 'Gray Spring work 218 (16 1/2+)', 'Bestman', NULL, '2022-04-20 23:46:25', '2022-04-20 23:46:25'),
(76, 2, 'GS07', 'Gray Spring work 218 (17+)', 'Bestman', NULL, '2022-04-20 23:46:45', '2022-04-20 23:46:45'),
(77, 2, 'GS08', 'Gray Spring work 218 (17 1/2+)', 'Bestman', NULL, '2022-04-20 23:47:00', '2022-04-20 23:47:00'),
(78, 2, 'GSW01', 'Gray(ASH) Spring work  Dull gold design [two tone] 219 (17-)', 'Groom', NULL, '2022-04-20 23:47:31', '2022-04-20 23:47:31'),
(79, 2, 'IRG01', 'Ivory Dull Gold spring (Indian) 213 (18)', 'Groom', NULL, '2022-04-20 23:47:54', '2022-04-20 23:47:54'),
(80, 2, 'IS01', 'Ivory Dull Gold Spring work 213 (16 1/2)', 'Bestman', NULL, '2022-04-20 23:48:39', '2022-04-20 23:48:39'),
(81, 2, 'IS02', 'Ivory Dull Gold Spring work 213(16)', 'Bestman', NULL, '2022-04-20 23:48:59', '2022-04-20 23:48:59'),
(82, 2, 'IS03', 'Ivory Dull Gold Spring work 213 (16 1/2)', 'Bestman', NULL, '2022-04-20 23:49:17', '2022-04-20 23:49:17'),
(83, 2, 'IS04', 'Ivory Dull Gold Spring work 213 (16 1/2)', 'Bestman', NULL, '2022-04-20 23:49:34', '2022-04-20 23:49:34'),
(84, 2, 'IS05', 'Ivory Dull Gold Spring work 213 (13)', 'Pageboy', NULL, '2022-04-20 23:50:23', '2022-04-20 23:50:23'),
(86, 2, 'IS06', 'Ivory Dull Gold Spring work 213 (11)', 'Pageboy', NULL, '2022-04-21 00:06:11', '2022-04-21 00:06:11'),
(87, 2, 'IS07', 'Dark Ivory Bead work 216 (11)', 'Pageboy', NULL, '2022-04-21 00:06:29', '2022-04-21 00:06:29'),
(88, 2, 'IS08', 'Dark Ivory Bead work 216 (13)', 'Pageboy', NULL, '2022-04-21 00:06:47', '2022-04-21 00:06:47'),
(89, 2, 'ISV01', 'Ivory Dull gold Spring (Velvet) 213  (17)', 'Groom', NULL, '2022-04-21 00:07:12', '2022-04-21 00:07:12'),
(90, 2, 'JBS01', 'Black Dull gold spring work 217 (17 1/2)', 'Groom', NULL, '2022-04-21 00:07:35', '2022-04-21 00:07:35'),
(91, 2, 'JBS02', 'Black Spring work Blue+Red+Dull gold work 219  (17)', 'Groom', NULL, '2022-04-21 00:07:55', '2022-04-21 00:07:55'),
(92, 2, 'JBS03', 'Black Dull gold spring work 221 new (17 1/2)', 'Groom', NULL, '2022-04-21 00:08:15', '2022-04-21 00:08:15'),
(93, 2, 'LG01', 'Light Gray [ASH] 222 (11+)', 'Pageboy', NULL, '2022-04-21 00:08:37', '2022-04-21 00:08:37'),
(94, 2, 'LG02', 'Light Gray [ASH] 222 (13-)', 'Pageboy', NULL, '2022-04-21 00:08:55', '2022-04-21 00:08:55'),
(95, 2, 'LG03', 'Light Gray [ASH] 222 (14)', 'Pageboy', NULL, '2022-04-21 00:09:17', '2022-04-21 00:09:17'),
(96, 2, 'LG04', 'Light Gray [ASH] 222 (15)', 'Pageboy', NULL, '2022-04-21 00:09:40', '2022-04-21 00:09:40'),
(97, 2, 'LG05', 'Light Gray [ASH] 222 (16 1/2)', 'Bestman', NULL, '2022-04-21 00:10:11', '2022-04-21 00:10:11'),
(98, 2, 'LG06', 'Light Gray [ASH] 222 (17)', 'Bestman', NULL, '2022-04-21 00:10:34', '2022-04-21 00:10:34'),
(99, 2, 'LG07', 'Light Gray [ASH] 222 (17 1/2)', 'Bestman', NULL, '2022-04-21 00:11:37', '2022-04-21 00:11:37'),
(100, 2, 'LG08', 'Light Gray [ASH] 222 (20-)', 'Bestman', NULL, '2022-04-21 00:11:56', '2022-04-21 00:11:56'),
(101, 2, 'LG09', 'Light Gray [ASH] 222 (18 1/2)', 'Bestman', NULL, '2022-04-21 00:12:12', '2022-04-21 00:12:12'),
(102, 2, 'LIB01', 'Light Ivory Bead work 217 (17-)', 'Bestman', NULL, '2022-04-21 00:13:01', '2022-04-21 00:13:01'),
(103, 2, 'LIB02', 'Light Ivory Bead work 217 (16 1/2)', 'Bestman', NULL, '2022-04-21 00:13:18', '2022-04-21 00:13:18'),
(104, 2, 'LIB03', 'Light Ivory Bead work 217 (17)', 'Bestman', NULL, '2022-04-21 00:13:40', '2022-04-21 00:13:40'),
(105, 2, 'LIB04', 'Light Ivory Bead work 217 (17)', 'Bestman', NULL, '2022-04-21 00:13:57', '2022-04-21 00:13:57'),
(106, 2, 'LIB05', 'Light Ivory Bead work 217 (11)', 'Pageboy', NULL, '2022-04-21 00:14:36', '2022-04-21 00:14:36'),
(107, 2, 'LIB06', 'Light Ivory Bead work 217 (11)', 'Pageboy', NULL, '2022-04-21 00:14:49', '2022-04-21 00:14:49'),
(108, 2, 'LIB07', 'Light Ivory Bead work 217 (12+)', 'Pageboy', NULL, '2022-04-21 00:15:13', '2022-04-21 00:15:13'),
(109, 2, 'LIB08', 'Light Ivory Bead work 217 (13)', 'Pageboy', NULL, '2022-04-21 00:15:28', '2022-04-21 00:15:28'),
(110, 2, 'LIB09', 'Light Ivory Bead work 217 (14 1/2+)', 'Pageboy', NULL, '2022-04-21 00:15:43', '2022-04-21 00:15:43'),
(111, 2, 'MCS01', 'Maroon Cut work small 218 (15)', 'Groom', NULL, '2022-04-21 00:22:33', '2022-04-21 00:22:33'),
(112, 2, 'MDC01', 'Maroon Dull Gold Cutwork 217 (16 1/2)', 'Groom', NULL, '2022-04-21 00:23:43', '2022-04-21 00:23:43'),
(113, 2, 'MDC02', 'Maroon Dull Gold Cutwork Soft Velvet 218 [Min] (17)', 'Groom', NULL, '2022-04-21 02:35:22', '2022-04-21 02:35:22'),
(114, 2, 'MDC03', 'Maroon Dull Gold Cutwork Soft Velvet 218 [Han] (18)', 'Groom', NULL, '2022-04-21 02:35:40', '2022-04-21 02:35:40'),
(115, 2, 'MDC04', 'Maroon Dull Gold Cutwork with Red Springs 219 (17)', 'Groom', NULL, '2022-04-21 02:36:08', '2022-04-21 02:36:08'),
(116, 2, 'MDS01', 'Maroon Maroon dull gold Spring work 216 (18)', 'Groom', NULL, '2022-04-21 02:36:30', '2022-04-21 02:36:30'),
(117, 2, 'MDS02', 'Maroon Dull Gold Springwork Two tone 218 [Han] (18)', 'Groom', NULL, '2022-04-21 02:36:49', '2022-04-21 02:36:49'),
(118, 2, 'MDS03', 'Maroon Dull gold Spring work Checks 219  [Han] (16)', 'Groom', NULL, '2022-04-21 02:37:07', '2022-04-21 02:37:07'),
(119, 2, 'MDS04', 'MaroonMaroon dull Gold Spring Work 216 17', 'Groom', NULL, '2022-04-21 02:37:44', '2022-04-21 02:37:44'),
(120, 2, 'MDS05', 'Maroon Dull Gold Springwork 219 [Akhil](17)', 'Groom', NULL, '2022-04-21 02:38:01', '2022-04-21 02:38:01'),
(121, 2, 'MDS06', 'Maroon soft velvet dull gold work  (17) [220]', 'Groom', NULL, '2022-04-21 02:38:17', '2022-04-21 02:38:17'),
(122, 2, 'MDS07', 'Dark Maroon Dull gold Spring work XXL 219 [Han] 20+', 'Groom', NULL, '2022-04-21 02:39:17', '2022-04-21 02:39:17'),
(123, 2, 'MDS08', 'Dark Maroon Antique Gold 219 [Han] (18+)', 'Groom', NULL, '2022-04-21 02:39:32', '2022-04-21 02:39:32'),
(124, 2, 'MDS09', 'Dark Maroon Dull gold two tone  220 [Han] (18+)', 'Groom', NULL, '2022-04-21 02:39:49', '2022-04-21 02:39:49'),
(125, 2, 'MDS10', 'Maroon Dull Gold Springwork 220 [Akhil](18)', 'Groom', NULL, '2022-04-21 02:40:06', '2022-04-21 02:40:06'),
(126, 2, 'MDS11', 'Maroon Dull gold 20 ( Han) 220', 'Groom', NULL, '2022-04-21 02:40:21', '2022-04-21 02:40:21'),
(127, 2, 'MDS12', 'Maroon Dull old + Pearls Spring work', 'Groom', NULL, '2022-04-21 02:40:49', '2022-04-21 02:40:49'),
(128, 2, 'MGS01', 'Maroon Gold Spring work 212 (17)', 'Groom', NULL, '2022-04-21 02:41:06', '2022-04-21 02:41:06'),
(129, 2, 'MGS02', 'Maroon Gold Spring work 212 (18 1/2)', 'Groom', NULL, '2022-04-21 02:41:22', '2022-04-21 02:41:22'),
(130, 2, 'MGS03', 'Maroon Gold Spring work 212(16)', 'Groom', NULL, '2022-04-21 02:41:37', '2022-04-21 02:41:37'),
(131, 2, 'MPW01', 'Maroon Pearl work 218 [Min ] (17)', 'Groom', NULL, '2022-04-21 02:42:01', '2022-04-21 02:42:01'),
(132, 2, 'MPW02', 'Maroon Pearl work 219 [elephant] (17 1/2)', 'Groom', NULL, '2022-04-21 02:42:33', '2022-04-21 02:42:33'),
(133, 2, 'MPW03', 'Maroon Pearl work 220 [Min ] (17)', 'Groom', NULL, '2022-04-21 02:42:48', '2022-04-21 02:42:48'),
(134, 2, 'MPW04', 'Maroon Pearl work 221 [Min ] (17 1/2)', 'Groom', NULL, '2022-04-21 02:43:03', '2022-04-21 02:43:03'),
(135, 2, 'MPW05', 'Maroon Pearl work 221 [Min ] swan (18)', 'Groom', NULL, '2022-04-21 02:43:21', '2022-04-21 02:43:21'),
(136, 2, 'MPW06', 'Maroon Pearl work 221 [Min ] Lion (18)', 'Groom', NULL, '2022-04-21 02:43:43', '2022-04-21 02:43:43'),
(137, 2, 'MRG01', 'Maroon Rose gold cutwork 217 (17)', 'Groom', NULL, '2022-04-21 02:43:59', '2022-04-21 02:43:59'),
(138, 2, 'MS01', 'Maroon Bead work 217 (17 1/2)', 'Bestman', NULL, '2022-04-21 02:45:28', '2022-04-21 02:45:28'),
(139, 2, 'MS02', 'Maroon Bead work 217 (17 1/2)', 'Bestman', NULL, '2022-04-21 02:45:46', '2022-04-21 02:45:46'),
(140, 2, 'MS03', 'Maroon Bead work 217 (16)', 'Bestman', NULL, '2022-04-21 02:46:01', '2022-04-21 02:46:01'),
(141, 2, 'MS04', 'Maroon Bead work 217 (16)', 'Bestman', NULL, '2022-04-21 02:46:18', '2022-04-21 02:46:18'),
(142, 2, 'MS05', 'Maroon Bead work 217 (14 1/2)', 'Pageboy', NULL, '2022-04-21 02:46:46', '2022-04-21 02:46:46'),
(143, 2, 'MS06', 'Maroon Bead work 217(11 1/2)', 'Pageboy', NULL, '2022-04-21 02:47:51', '2022-04-21 02:47:51'),
(144, 2, 'MS07', 'Maroon Bead work 217(14)', 'Pageboy', NULL, '2022-04-21 02:48:06', '2022-04-21 02:48:06'),
(145, 2, 'MSS01', 'Maroon Silver Spring work 219 (17)', 'Groom', NULL, '2022-04-21 02:48:50', '2022-04-21 02:48:50'),
(146, 2, 'PDC01', 'Dark Purple dull gold cutwork 218 (16 1/2)', 'Groom', NULL, '2022-04-21 02:49:30', '2022-04-21 02:49:30'),
(147, 2, 'PDS01', 'Dark Purple Dull gold Spring Work 214 (16 1/2)', 'Groom', NULL, '2022-04-21 02:49:48', '2022-04-21 02:49:48'),
(148, 2, 'PRC01', 'Light Red cutwork 217 [wat] (17 1/2)', 'Groom', NULL, '2022-04-21 02:50:04', '2022-04-21 02:50:04'),
(149, 2, 'PS01', 'Purple Spring work 218 (11+)', 'Pageboy', NULL, '2022-04-21 02:50:27', '2022-04-21 02:50:27'),
(150, 2, 'PS02', 'Purple Spring work 218 (12+)', 'Pageboy', NULL, '2022-04-21 02:50:42', '2022-04-21 02:50:42'),
(151, 2, 'PS03', 'Purple Spring work 218 (13+)', 'Pageboy', NULL, '2022-04-21 02:50:55', '2022-04-21 02:50:55'),
(152, 2, 'PS04', 'Purple Spring work 218 (14 1/2+)', 'Pageboy', NULL, '2022-04-21 02:51:09', '2022-04-21 02:51:09'),
(153, 2, 'PS05', 'Purple Spring work 218 (16+)', 'Bestman', NULL, '2022-04-21 02:51:29', '2022-04-21 02:51:29'),
(154, 2, 'PS06', 'Purple Spring work 218 (16 1/2+)', 'Bestman', NULL, '2022-04-21 02:51:43', '2022-04-21 02:51:43'),
(155, 2, 'PS07', 'Purple Spring work 218 (17+)', 'Bestman', NULL, '2022-04-21 02:51:58', '2022-04-21 02:51:58'),
(156, 2, 'PS08', 'Purple Spring work 218 (17 1/2+)', 'Bestman', NULL, '2022-04-21 02:52:16', '2022-04-21 02:52:16'),
(157, 2, 'RCS01', 'Red Cut work small 218 (15)', 'Groom', NULL, '2022-04-21 02:56:41', '2022-04-21 02:56:41'),
(158, 2, 'RDS01', 'Rose dull gold Spring work 219 (17 1/2)', 'Groom', NULL, '2022-04-21 02:56:59', '2022-04-21 02:56:59'),
(159, 2, 'RPW01', 'Red Pearl work 221 [Min ] (18)', 'Groom', NULL, '2022-04-21 02:57:15', '2022-04-21 02:57:15'),
(160, 2, 'RS04', 'Red Spring work 218 (16 1/2)', 'Bestman', NULL, '2022-04-21 02:57:31', '2022-04-21 03:07:33'),
(161, 2, 'RS03', 'Red Spring work 218 (18-)', 'Bestman', NULL, '2022-04-21 02:57:55', '2022-04-21 02:57:55'),
(162, 2, 'RS01', 'Red Spring work 218 (17 1/2+)', 'Bestman', NULL, '2022-04-21 03:09:37', '2022-04-21 03:09:37'),
(163, 2, 'RS05', 'Red Spring work 218 (17+)', 'Bestman', NULL, '2022-04-21 03:10:12', '2022-04-21 03:10:12'),
(164, 2, 'RS06', 'Red Spring work 218 (11+)', 'Pageboy', NULL, '2022-04-21 03:10:47', '2022-04-21 03:10:47'),
(165, 2, 'RS07', 'Red Spring work 218(14+)', 'Pageboy', NULL, '2022-04-21 03:11:10', '2022-04-21 03:11:10'),
(166, 2, 'RS08', 'Red Spring work 218 (13-)', 'Pageboy', NULL, '2022-04-21 03:11:29', '2022-04-21 03:11:29'),
(167, 2, 'RS09', 'Red Spring work 218 (15-)', 'Pageboy', NULL, '2022-04-21 03:11:52', '2022-04-21 03:11:52'),
(168, 2, 'RSQ01', 'Red Seaquins work 211 (16)', 'Bestman', NULL, '2022-04-21 03:18:54', '2022-04-21 03:18:54'),
(169, 2, 'RSQ02', 'Red Seaquins work 211 (15 1/2)', 'Bestman', NULL, '2022-04-21 03:19:14', '2022-04-21 03:19:14'),
(170, 2, 'RSQ03', 'Red Seaquins work 211 (16)', 'Bestman', NULL, '2022-04-21 03:19:30', '2022-04-21 03:19:30'),
(171, 2, 'RSQ04', 'Red Seaquins work 211 (16 1/2)', 'Bestman', NULL, '2022-04-21 03:19:44', '2022-04-21 03:19:44'),
(172, 2, 'RSQ06', 'Red Seaquins work 211 (12)', 'Pageboy', NULL, '2022-04-21 03:20:26', '2022-04-21 03:20:26'),
(173, 2, 'RSQ07', 'Red Seaquins work 211 (11)', 'Pageboy', NULL, '2022-04-21 03:20:41', '2022-04-21 03:20:41'),
(174, 2, 'RSQ08', 'Red Seaquins work 211 (13)', 'Pageboy', NULL, '2022-04-21 03:20:57', '2022-04-21 03:20:57'),
(175, 2, 'RW01', 'Dark Red White work (pearl) 15- [220]', 'Pageboy', NULL, '2022-04-21 03:21:15', '2022-04-21 03:21:15'),
(176, 2, 'RW02', 'Dark Red White work (pearl) 13+ [220]', 'Pageboy', NULL, '2022-04-21 03:21:30', '2022-04-21 03:21:30'),
(177, 2, 'RW03', 'Dark Red White work (pearl) 12 1/2+ [220]', 'Pageboy', NULL, '2022-04-21 03:21:48', '2022-04-21 03:21:48'),
(178, 2, 'RW04', 'Dark Red White work (pearl) 11+ [220]', 'Pageboy', NULL, '2022-04-21 03:22:06', '2022-04-21 03:22:06'),
(179, 2, 'RSQ05', 'Red Seaquins work 211 (14 1/2)', 'Pageboy', NULL, '2022-04-21 03:22:44', '2022-04-21 03:22:44'),
(180, 2, 'RW05', 'Dark Red White work (pearl) 16 1/2 [220]', 'Bestman', NULL, '2022-04-21 03:23:22', '2022-04-21 03:23:22'),
(181, 2, 'RW06', 'Dark Red White work (pearl) 17 1/2 [220]', 'Bestman', NULL, '2022-04-21 03:23:40', '2022-04-21 03:23:40'),
(182, 2, 'RW07', 'Dark Red White work (pearl) 17- [220]', 'Bestman', NULL, '2022-04-21 03:23:57', '2022-04-21 03:23:57'),
(183, 2, 'RW08', 'Dark Red White work (pearl) 18+ [220]', 'Bestman', NULL, '2022-04-21 03:24:13', '2022-04-21 03:24:13'),
(184, 2, 'SBG01', 'Light Blue dull gold spring work 215 (16 1/2)', 'Groom', NULL, '2022-04-21 03:24:51', '2022-04-21 03:24:51'),
(185, 2, 'SBG02', 'Light Blue dull gold spring work 217 (16)', 'Groom', NULL, '2022-04-21 03:25:06', '2022-04-21 03:25:06'),
(186, 2, 'SDB01', 'Dark Blue Bead work 217  (17 1/2+)', 'Bestman', NULL, '2022-04-21 03:25:26', '2022-04-21 03:25:26'),
(187, 2, 'SDB02', 'Dark Blue Bead work 217 (17 1/2)', 'Bestman', NULL, '2022-04-21 03:25:43', '2022-04-21 03:25:43'),
(188, 2, 'SDB03', 'Dark Blue Bead work 217 (16+)', 'Bestman', NULL, '2022-04-21 03:26:00', '2022-04-21 03:26:00'),
(189, 2, 'SDB04', 'Dark Blue Bead work 217 (16 1/2+)', 'Bestman', NULL, '2022-04-21 03:26:16', '2022-04-21 03:26:16'),
(190, 2, 'SDB06', 'Dark Blue Bead work 217 (11-)', 'Pageboy', NULL, '2022-04-21 03:27:02', '2022-04-21 03:27:02'),
(191, 2, 'SDB07', 'Dark Blue Bead work 217 (10 1/2+)', 'Pageboy', NULL, '2022-04-21 03:27:21', '2022-04-21 03:27:21'),
(192, 2, 'SDB08', 'Dark Blue Bead work 217 (12+)', 'Pageboy', NULL, '2022-04-21 03:27:38', '2022-04-21 03:27:38'),
(193, 2, 'SGS01', 'Silver gold spring work (18) [220]', 'Bestman', NULL, '2022-04-21 03:28:00', '2022-04-21 03:28:00'),
(194, 2, 'SGS02', 'Silver gold spring work (18 1/2) [220]', 'Bestman', NULL, '2022-04-21 03:28:15', '2022-04-21 03:28:15'),
(195, 2, 'SGS03', 'Silver gold spring work (17) [220]', 'Bestman', NULL, '2022-04-21 03:28:30', '2022-04-21 03:28:30'),
(196, 2, 'SGS04', 'Silver gold spring work (17 1/2) [220]', 'Bestman', NULL, '2022-04-21 03:28:51', '2022-04-21 03:28:51'),
(197, 2, 'SGS05', 'Silver gold spring work (16 1/2) [220]', 'Bestman', NULL, '2022-04-21 03:29:08', '2022-04-21 03:29:08'),
(198, 2, 'SGS06', 'Silver gold spring work (16 1/2+) [220]', 'Bestman', NULL, '2022-04-21 03:29:23', '2022-04-21 03:29:23'),
(199, 2, 'SDB05', 'Dark Blue Bead work 217 (14-)', 'Pageboy', NULL, '2022-04-21 03:36:55', '2022-04-21 03:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `cat_name`, `created_at`, `updated_at`) VALUES
(1, 'Jewellery', '2022-04-11 16:57:19', '2022-04-11 16:57:19'),
(2, 'Jackets', '2022-04-11 16:57:25', '2022-04-11 16:57:25'),
(3, 'Cavani', '2022-04-11 16:57:28', '2022-04-11 16:57:28');

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shoulder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chest` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weist` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tlength` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssize` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jheight` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `measurements`
--

INSERT INTO `measurements` (`id`, `customer_id`, `type`, `head`, `shoulder`, `chest`, `weist`, `tlength`, `ssize`, `arm`, `jheight`, `other`, `created_at`, `updated_at`) VALUES
(2, 2, 'BESTMAN - 1', '22.5', '17.5', '42', NULL, '41', '11', NULL, NULL, NULL, '2022-04-22 20:41:41', '2022-04-22 20:41:41'),
(3, 2, 'BESTMAN - 2', '23.5', '18', '42', NULL, '43', '11', NULL, NULL, NULL, '2022-04-22 20:42:26', '2022-04-22 20:42:26'),
(4, 2, 'BESTMAN - 3', '22', '16', '37', NULL, '39', '10', NULL, NULL, NULL, '2022-04-22 20:42:49', '2022-04-22 20:42:49'),
(5, 8, 'GROOM', '23', '18+', '42', '0', '40', '11', '0', '0', '0', '2022-04-24 06:33:06', '2022-04-28 07:04:22'),
(6, 8, 'BESTMAN - 1', '22+', '16', '35', '0', '39', '11', '0', '0', '0', '2022-04-24 06:33:20', '2022-04-28 07:04:31'),
(7, 8, 'PAGEBOY - 1', '20', '12', '23', NULL, '23', '9', NULL, NULL, NULL, '2022-04-24 06:33:29', '2022-04-24 06:33:29'),
(8, 4, 'GROOM', '1-', '0', '0', '0', '0', '0', '0', '0', '0', '2022-04-24 07:50:51', '2022-04-24 07:52:42'),
(9, 7, 'GROOM', '22', '17', '39', NULL, '42', '11', NULL, NULL, NULL, '2022-04-24 08:46:18', '2022-04-24 08:46:18'),
(10, 7, 'PAGEBOY - 1', '19.5+', '13', '22.5', NULL, '28', '8', NULL, NULL, NULL, '2022-04-24 08:46:57', '2022-04-24 08:46:57'),
(11, 7, 'PAGEBOY - 2', '20', '12', '28', NULL, '34', '9', NULL, NULL, NULL, '2022-04-24 08:47:19', '2022-04-24 08:47:19'),
(12, 7, 'PAGEBOY - 3', '21', '12', '25', NULL, '26', '8', NULL, NULL, NULL, '2022-04-24 08:47:33', '2022-04-24 08:47:33'),
(13, 12, 'GROOM', '22', '18', '41', NULL, '42', '11', NULL, NULL, NULL, '2022-04-24 09:11:08', '2022-04-24 09:11:08'),
(14, 12, 'BESTMAN - 1', '22-', '17', '37', NULL, '41', '10.5+', NULL, NULL, NULL, '2022-04-24 09:11:28', '2022-04-24 09:11:28'),
(15, 12, 'BESTMAN - 2', '22+', '17-', '37', NULL, '39', '11', NULL, NULL, NULL, '2022-04-24 09:11:53', '2022-04-24 09:11:53'),
(16, 2, 'GROOM', '22', '17+', '40', '0', '40', '11', '0', '0', '0', '2022-04-28 06:55:27', '2022-04-28 06:55:44'),
(17, 2, 'BESTMAN - 4', '22', '15', '36', NULL, '38', '10', NULL, NULL, NULL, '2022-04-28 06:56:02', '2022-04-28 06:56:02'),
(18, 6, 'GROOM', '22.5', '17', '38', NULL, '41', '10.5', NULL, NULL, NULL, '2022-04-28 07:45:43', '2022-04-28 07:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(45, '2014_10_12_000000_create_users_table', 1),
(46, '2014_10_12_100000_create_password_resets_table', 1),
(47, '2019_08_19_000000_create_failed_jobs_table', 1),
(48, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(49, '2022_03_16_073954_create_roles_table', 1),
(50, '2022_03_16_075202_add_user_id_to_user_table', 1),
(51, '2022_03_16_075255_add_role_id_to_user_table', 1),
(52, '2022_03_16_102602_create_item_categories_table', 1),
(53, '2022_03_16_210247_create_items_table', 1),
(54, '2022_03_19_091843_create_customers_table', 1),
(55, '2022_03_19_100750_create_branches_table', 1),
(56, '2022_03_19_153151_create_notes_table', 1),
(57, '2022_03_23_062012_create_dress_selections_table', 1),
(58, '2022_03_24_112313_drop_some_columns_from_customer_table', 1),
(59, '2022_03_26_211452_add_user_id_to_customer_table', 1),
(60, '2022_03_27_090417_create_branch_user_table', 1),
(61, '2022_03_27_090830_add_prefix_column_to_branches_table', 1),
(62, '2022_03_27_115003_add_total_amount_discount_advance_payment_columns_to_customers_table', 1),
(63, '2022_03_31_054148_create_intering_payments_table', 1),
(64, '2022_03_31_120405_add_other_columns_to_customer_table', 1),
(65, '2022_03_31_202451_create_measurements_table', 1),
(66, '2022_04_16_122355_create_costs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `customer_id`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'With transport, Kaluthara', 0, '2022-04-22 20:47:55', '2022-04-22 20:47:55'),
(2, 2, 'additional 2000 charged due to Ranjith request', 0, '2022-04-24 05:21:49', '2022-04-24 05:21:49'),
(3, 8, 'Dressing time - 3.30am', 0, '2022-04-24 06:10:07', '2022-04-24 06:10:07'),
(4, 8, 'Groom Crowning time - 4.12 am', 0, '2022-04-24 06:11:09', '2022-04-24 06:11:09'),
(5, 8, 'Shop In - 3.15 am', 0, '2022-04-24 06:12:04', '2022-04-24 06:12:04'),
(6, 11, 'Arrival - 3.30AM', 0, '2022-04-24 08:52:44', '2022-04-24 08:52:44'),
(7, 13, 'Ask to Arrange transport', 0, '2022-04-24 09:16:15', '2022-04-24 09:16:25'),
(8, 16, 'Discuss about return transport', 0, '2022-04-24 09:22:51', '2022-04-24 09:22:51'),
(9, 17, 'Thamara wedding', 0, '2022-04-24 09:27:02', '2022-04-24 09:27:02'),
(10, 6, 'Arrival 4.30', 0, '2022-04-28 07:48:48', '2022-04-28 07:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'manager', NULL, NULL),
(3, 'standard_user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$lrflfaNjZ9LkuSXO90Umke.5VdQtMZpxrF.Ic8/yqFQzQJ/fKnwsa', NULL, NULL, NULL, 1),
(4, 'Rehan', 'rehan.dilmith2000@gmail.com', NULL, '$2y$10$/Nv8eeFpjKE4j.QoAgxdM.zRyIvGuLnpc7RRI8JYFt2yT2ExILLJy', NULL, '2022-04-23 01:47:39', '2022-04-26 12:20:58', 2),
(5, 'Jagath', 'jagath@gmail.com', NULL, '$2y$10$io/QKbPLoEqs6d1T8e7rQuRqYW7SJV8cYDT6iInj0zxIQbjfaN1OO', NULL, '2022-04-28 06:28:23', '2022-04-29 10:10:45', 2),
(6, 'Saman', 'Saman@gmail.com', NULL, '$2y$10$eAdAdizEc4C8GNpAicwrnODZ0WE2vVHbX3vihXpOs6BfQ1AMEgPwi', NULL, '2022-04-28 06:29:18', '2022-04-28 06:29:18', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_user`
--
ALTER TABLE `branch_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costs`
--
ALTER TABLE `costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dress_selections`
--
ALTER TABLE `dress_selections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `intering_payments`
--
ALTER TABLE `intering_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch_user`
--
ALTER TABLE `branch_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `costs`
--
ALTER TABLE `costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `dress_selections`
--
ALTER TABLE `dress_selections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intering_payments`
--
ALTER TABLE `intering_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
