-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2022 at 08:06 PM
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
-- Table structure for table `additional_payments`
--

CREATE TABLE `additional_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `additional_payment` double DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_payments`
--

INSERT INTO `additional_payments` (`id`, `customer_id`, `additional_payment`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(3, 16, 3000, 'Transport', 1, '2022-05-07 01:54:34', '2022-05-07 01:54:34'),
(4, 18, 22000, '2 bestman & 2 Pboys added', 1, '2022-05-07 02:47:40', '2022-05-07 02:47:40');

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
(11, 17, 3500, 6000, 2500, 7500, '2022-04-24 09:25:30', '2022-04-24 09:26:16'),
(12, 19, 800, 5000, 2000, 4500, '2022-04-29 23:27:02', '2022-04-29 23:27:02'),
(13, 4, NULL, NULL, NULL, NULL, '2022-05-02 12:07:54', '2022-05-02 12:10:08');

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
(4, '4', 1, 'test', 'test', '3423', NULL, '2022-04-24', 'test', 1, 2, 1, NULL, 0, NULL, NULL, NULL, NULL, '2022-04-23 11:50:57', '2022-05-02 22:23:30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2021', 1, 'Prabhath nawalage', 'Kalawana', '0719127000', '0702900501', '2022-05-02', 'Grand guardian', 1, 0, 1, NULL, 1, NULL, NULL, '2022-04-22', NULL, '2022-04-23 22:33:30', '2022-04-24 05:05:38', 1, 34000, NULL, 10000, NULL, NULL, NULL, NULL),
(6, '1199', 1, 'Y.H Ishan Prabhath', 'Dodampe', '0702243122', '0704378031', '2022-05-04', 'Rose Gradian', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:47:15', '2022-04-23 22:47:15', 1, 35000, NULL, 8000, 'Elegant Salon', NULL, NULL, 'Supun'),
(7, '2018', 1, 'A.K Prasanna Janaka Kumara Yasarathne', 'Ayagama', '0710538292', '0778394348', '2022-05-05', 'Deshani Reception hall', 0, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:52:59', '2022-04-23 22:52:59', 1, 35000, NULL, 5000, 'Salon Wink', 'White', NULL, 'Thineth Studio'),
(8, '1189', 1, 'Kasun Chandima', 'Godigamuwa', '0763457654', '0710614151', '2022-05-02', 'Grand guardian', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:57:07', '2022-04-23 22:57:07', 1, 38000, NULL, 10000, 'Champa Hill', NULL, NULL, 'Sumith Studio'),
(9, '1193', 1, 'Arjuna Prasad', 'Mihidugama', '0716179025', '0710444008', '2022-05-12', 'Palamino Reception Hall', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 22:59:24', '2022-04-23 22:59:24', 1, 43000, NULL, 10000, 'Kalani Salon', NULL, NULL, 'Click It Studio'),
(10, '2014', 1, 'Chathura Sanjaya Rathnayake', 'Elapatha', '0711962206', NULL, '2022-05-12', 'Lake Seranaty', 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:01:08', '2022-04-23 23:01:08', 1, 25000, NULL, 5000, NULL, NULL, NULL, 'Lahiru Theekshana'),
(11, '1198', 1, 'G.W.C Jinendra', 'Nivithigala', '0719419430', '0788890613', '2022-05-06', 'Rose Gradian', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:02:51', '2022-05-03 00:49:20', 1, 42000, NULL, 20000, NULL, NULL, NULL, 'Hasindu Studio'),
(12, '2017', 1, 'Chathura Bhashana', 'Kandy', '0721108284', '0824326305', '2022-05-12', 'Kethumathie', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:04:28', '2022-04-23 23:04:28', 1, 35000, NULL, 5000, NULL, 'Ivory', NULL, NULL),
(13, '2015', 1, 'R.G.A.L. Kumara', 'Ratnapura', '0713026551', NULL, '2022-05-12', 'Wijaya Holiday Resort', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:07:35', '2022-04-23 23:07:35', 1, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(14, '1164', 1, 'Y.T Nayanapriya', 'Opanayake', '0717629351', '0702612962', '2022-05-19', 'Grand guardian', 3, 0, 1, NULL, 0, '2022-04-19', NULL, NULL, NULL, '2022-04-23 23:10:01', '2022-04-23 23:12:45', 1, 50500, NULL, 5000, 'Menuka Bridal', NULL, NULL, 'Foto Story'),
(15, '2030', 1, 'Dinesh Sunanda', 'Pelmadulla', '0710897740', '0717003956', '2022-06-10', 'Saru Blue Safari', 3, 3, 0, NULL, 1, '2022-05-18', NULL, NULL, NULL, '2022-04-23 23:16:41', '2022-04-23 23:19:21', 1, 52000, NULL, 10000, 'Nilan Bridal', 'White & Gold', NULL, 'Panasara Studio'),
(16, '2012', 1, 'P.A.T Pabasara', 'Allagawa', '0712895062', NULL, '2022-05-20', 'Thewni Reception', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:21:32', '2022-04-23 23:21:32', 1, 42000, NULL, 10000, NULL, 'White', NULL, NULL),
(17, '1196', 1, 'Charitha Sandun Lekamge', 'Kahawatte', '071791642', NULL, '2022-05-20', 'Silveray', 4, 2, 0, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:26:27', '2022-05-06 02:48:58', 1, 55000, NULL, 10000, 'Menuka Bridal', NULL, NULL, 'Panasara Studio'),
(18, '2025', 1, 'Chamod Dilhan', 'Bandaranayake mawatha, Rathnapura', '0716266967', '0716266865', '2022-05-20', 'Rajanawa Resort', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:29:59', '2022-05-07 02:47:11', 1, 25000, NULL, 5000, 'Lakshi Salon', NULL, NULL, NULL),
(19, '1176', 1, 'Himesha Kannangara', 'Kahawaththa', '0713227890', NULL, '2022-05-20', 'Grand guardian', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:31:24', '2022-04-29 23:24:51', 1, 38000, NULL, 10000, 'Lakshi Salon', NULL, NULL, 'Click It Studio'),
(20, '1395', 1, 'Nadeeshan Chamara', 'Balangoda', '0715617524', NULL, '2022-05-25', 'Grand guardian', 4, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:34:17', '2022-04-23 23:34:17', 1, 55000, NULL, 5000, 'Niroshan Dilshan', NULL, NULL, 'Dark Room'),
(21, '2002', 1, 'Senarath Harshana', 'Ratnapura', '0774944532', NULL, '2022-05-25', 'Grand guardian', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:37:22', '2022-04-23 23:37:22', 1, 45000, NULL, 5000, 'Lakshi Salon', NULL, NULL, NULL),
(22, '1191', 1, 'Vidath S Aththanayake', 'Nivithigala', '0717135495', '0789954888', '2022-05-26', 'Rajanawa Resort', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:39:00', '2022-04-23 23:39:00', 1, 35000, NULL, 5000, 'Salon Glow Heaven', 'Pearl & Gold', NULL, NULL),
(23, '2019', 1, 'D.M.C.P.K Dissanayake', 'Monaragala', '0767079914', NULL, '2022-05-26', 'Lake Seranaty', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-23 23:40:54', '2022-04-23 23:40:54', 1, 45000, NULL, 10000, 'Kalani Salon', NULL, NULL, 'Vision Angel'),
(24, '1172', 1, 'W.K Kumudu Samanthilake', 'Muwagama', '0710824348', '0760715031', '2022-10-27', 'Not decided yet', 2, 1, 1, NULL, 1, '2022-05-09', NULL, NULL, NULL, '2022-04-23 23:44:03', '2022-05-03 01:09:32', 1, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(26, '2031', 1, 'Kalana perera', 'Godakawela', '0771445621', NULL, '2022-05-12', 'Owinrich Godakawela', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-24 04:11:08', '2022-04-24 04:11:08', 1, 42000, NULL, 10000, NULL, NULL, NULL, NULL),
(27, '1213', 1, 'Ajith Prasanna', 'Kaluthara', '774918722', NULL, '2019-05-02', 'Centuria', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-02 22:40:15', '2022-05-02 22:40:15', 4, 41000, NULL, 10000, NULL, NULL, NULL, NULL),
(28, '1201', 1, 'M.R Dinusha Gayan', 'Deniyaya mawatha, Rathnapura', '773786128', NULL, '2019-05-02', 'Grand Emarald - Kahawatte', 2, 1, 0, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-02 23:13:06', '2022-05-02 23:13:06', 4, 38000, NULL, 5000, NULL, NULL, NULL, NULL),
(29, '2032', 1, 'M. Niroshan', 'Paradise kuruvita', '0760443299', NULL, '2022-05-20', 'Rose Gradian', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-03 00:07:11', '2022-05-03 00:07:11', 1, 45000, NULL, 10000, 'Nilan Bridal', 'White', NULL, 'Panasara Studio'),
(30, '1206', 1, 'B.G Ruwan', 'Rathnapura', '766543913', NULL, '2019-05-02', 'Deshani - Ratnapura', 3, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-03 07:33:19', '2022-05-03 07:33:19', 4, 44500, NULL, 10000, NULL, NULL, NULL, NULL),
(31, '1130', 1, 'Menaka Prabath', 'Elapatha', '710312750', NULL, '2019-04-24', 'Kethumathie', 4, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-03 21:47:01', '2022-05-03 21:47:01', 4, 44500, NULL, 10000, NULL, NULL, NULL, NULL),
(32, '1203', 1, 'Nalaka Premathissa', 'Ellawala', '788478575', NULL, '2019-04-24', 'Rajanewa', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-03 23:21:43', '2022-05-03 23:21:43', 4, 38000, NULL, 1000, NULL, NULL, NULL, NULL),
(33, '1226', 1, 'Chandrasena', 'Lellupitiya', '716304528', NULL, '2019-05-02', 'Kethumathie', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-03 23:40:03', '2022-05-03 23:40:03', 4, 40000, NULL, 10000, NULL, NULL, NULL, NULL),
(34, '1149', 1, 'P.L Buddhika', 'Kahawatte', '76644511', NULL, '2019-05-23', 'Grand guardian', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-04 07:25:32', '2022-05-04 07:25:32', 4, 39000, NULL, 2000, NULL, NULL, NULL, NULL),
(35, '1153', 1, 'Eranga Asiri', 'Kegalle', '711559055', NULL, '2019-05-23', 'Deshani - Ratnapura', 3, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-04 07:31:55', '2022-05-04 07:31:55', 4, 43600, NULL, 11000, NULL, NULL, NULL, NULL),
(36, '1207', 1, 'Buddhi Ishara', 'Hiramadalagama', '719093943', NULL, '2019-05-23', 'Owinrich Godakawela', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-04 07:40:59', '2022-05-04 07:40:59', 4, 35000, NULL, 5000, NULL, NULL, NULL, NULL),
(37, '1219', 1, 'Nuwan Darmasiri', 'Kottagoda', '710618321', NULL, '2019-05-23', 'Vijaya Holiday Resort', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-04 07:50:44', '2022-05-04 07:50:44', 4, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(38, '1129', 1, 'M.M.C.S. Manamperiya', 'Godakawela', '771537008', NULL, '2019-05-23', 'Saru Blue Safari Godakawela', 4, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:25:21', '2022-05-05 02:25:21', 4, 45000, NULL, 10000, NULL, NULL, NULL, NULL),
(39, '1144', 1, 'Rushan Malagoda', 'Hidellana', '718139972', NULL, '2019-05-23', 'Emerland', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:31:25', '2022-05-05 02:31:25', 4, 36000, NULL, 3000, NULL, NULL, NULL, NULL),
(40, '1235', 1, 'Nadeera Samarasena', 'Kahangama', '710709936', NULL, '2019-05-30', 'Garlend Hotel', 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:36:31', '2022-05-05 02:36:31', 4, 20000, NULL, 20000, NULL, NULL, NULL, NULL),
(41, '1089', 1, 'K.D Milan Madushanka', 'Balangoda', '776358050', NULL, '2019-05-30', 'Grand guardian', 3, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:41:25', '2022-05-05 02:41:25', 4, 40600, NULL, 10000, NULL, NULL, NULL, NULL),
(42, '1216', 1, 'Chamikara', 'Embilipitiya', '778370376', NULL, '2019-06-19', 'Centuria Embilipitiya', 4, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:47:03', '2022-05-05 02:47:03', 4, 53500, NULL, 10000, NULL, NULL, NULL, NULL),
(43, '1148', 1, 'R.A Kosala Damindu ramanayaka', 'Hangamuwa', '710135300', NULL, '2019-06-06', 'Hangamuwa House', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 02:53:44', '2022-05-05 02:53:44', 4, 37600, NULL, 5000, NULL, NULL, NULL, NULL),
(44, '1239', 1, 'Suresh Eranda', 'Bandarawela', '710437430', NULL, '2019-09-12', 'Rose Garden - Malawa', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 03:03:08', '2022-05-05 03:03:08', 4, 40000, NULL, 10000, 'Lakshi Salon', NULL, NULL, NULL),
(45, '1256', 1, 'Navod Maduranga', 'Ehaliyagoda', '762276847', NULL, '2019-08-07', NULL, 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 03:07:55', '2022-05-05 03:07:55', 4, 42000, NULL, 10000, NULL, NULL, NULL, NULL),
(46, '1260', 1, 'S.T Sandaruwan', 'Kalawana', '702297311', NULL, '2019-08-08', 'Kethumathie', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 03:15:02', '2022-05-05 03:15:02', 4, 36000, NULL, 10000, NULL, NULL, NULL, NULL),
(47, '1240', 1, 'H.A.R Chandrasena', 'Ratnapura', '718196376', NULL, '2019-08-12', 'Black Lion', 1, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 03:19:04', '2022-05-05 03:19:04', 4, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(48, '1238', 1, 'M.A.C.P Jayasinghe', 'Muwagama', '715127327', NULL, '2019-08-15', 'Silveray', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:12:16', '2022-05-05 21:12:16', 4, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(49, '1263', 1, 'Prabhath Priyankara', 'Karavita', '716499138', NULL, '2019-08-28', 'Saru Blue Safari Godakawela', 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:16:02', '2022-05-05 21:16:02', 4, 40000, NULL, 5000, NULL, NULL, NULL, NULL),
(50, '1284', 1, 'Ekanayake', 'Dewalegawa', '713571690', NULL, '2019-08-28', 'Elpitiya', 2, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:25:48', '2022-05-05 21:25:48', 4, 45000, NULL, 10000, NULL, NULL, NULL, NULL),
(51, '1251', 1, 'Amila Praneeth', 'Godakawela', '761835962', NULL, '2019-08-08', 'Godakawela', 2, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:29:57', '2022-05-05 21:29:57', 4, 40000, NULL, 5000, NULL, NULL, NULL, NULL),
(52, '1205', 1, 'Kosgoda', 'Hangamuwa', '711679568', NULL, '2019-08-28', 'Grand guardian', 1, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:32:12', '2022-05-05 21:32:12', 4, 38000, NULL, 10000, NULL, NULL, NULL, NULL),
(53, '1252', 1, 'Udeesha Kaushalya', 'Sannasgama', '704072095', NULL, '2019-09-05', 'Owinrich Godakawela', 0, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:42:24', '2022-05-05 21:42:24', 4, 33000, NULL, 5000, NULL, NULL, NULL, NULL),
(54, '1253', 1, 'Sajith Prasanna Kumara', 'Kudugalwatta', '715934335', NULL, '2019-09-12', 'Savon Rest - Erathne', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:51:07', '2022-05-05 21:51:07', 4, 40000, NULL, 10000, NULL, NULL, NULL, NULL),
(55, '1254', 1, 'Danushka Laksiri', 'Kuruwita', '761567697', NULL, '2019-09-16', 'Grand guardian', 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:56:07', '2022-05-05 21:56:07', 4, 22000, NULL, 5000, NULL, NULL, NULL, NULL),
(56, '1262', 1, 'Dhanushka Prabath', 'Kuruwita', '719415442', NULL, '2019-09-04', NULL, 2, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 21:58:52', '2022-05-05 21:58:52', 4, 37600, NULL, 10000, NULL, NULL, NULL, NULL),
(57, '1264', 1, 'Ranil Udaya', 'Palmadulla', '716528834', NULL, '2019-09-11', 'Rose Garden - Malawa', 3, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 22:01:15', '2022-05-05 22:01:15', 4, 40000, NULL, 10000, NULL, NULL, NULL, NULL),
(58, '1274', 1, 'Dammika', 'Kahangama', '783421199', NULL, '2019-09-12', NULL, 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, '2022-05-05 22:04:53', '2022-05-05 22:04:53', 4, 20000, NULL, 2000, NULL, NULL, NULL, NULL);

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
(27, 7, 'Pageboy\'s Jacket - 1', 'SGS08 - Silver gold spring work (12) [220]', 0, '2022-04-24 08:40:01', '2022-05-03 00:57:59'),
(28, 7, 'Pageboy\'s Jacket - 2', 'SGS09 - Silver gold spring work (13) [220]', 0, '2022-04-24 08:40:01', '2022-05-03 01:02:03'),
(29, 7, 'Pageboy\'s Jacket - 3', 'SGS10 - Silver gold spring work (14) [220]', 0, '2022-04-24 08:40:01', '2022-05-03 01:02:15'),
(30, 7, 'Group Cavani', NULL, 0, '2022-04-24 08:40:01', '2022-04-24 08:40:01'),
(31, 11, 'Groom\'s Jacket', 'MDS06 - Maroon soft velvet dull gold work  (17) [220]', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(32, 11, 'Groom\'s Cavani', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(33, 11, 'Bestman\'s Jacket - 1', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(34, 11, 'Bestman\'s Jacket - 2', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(35, 11, 'Pageboy\'s Jacket - 1', 'DB06 - Dark Beige Spring work [two tone] 219  (13-)', 0, '2022-04-24 08:48:54', '2022-05-03 00:50:54'),
(36, 11, 'Pageboy\'s Jacket - 2', 'DB07 - Dark Beige Spring work [two tone] 219 (13+)', 0, '2022-04-24 08:48:54', '2022-05-03 00:52:20'),
(37, 11, 'Group Cavani', NULL, 0, '2022-04-24 08:48:54', '2022-04-24 08:48:54'),
(38, 9, 'Groom\'s Jacket', 'GPW01 - Dark Gray Pearl work (17) [220]', 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(39, 9, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(40, 9, 'Bestman\'s Jacket - 1', 'SDB02 - Dark Blue Bead work 217 (17 1/2)', 0, '2022-04-24 09:06:29', '2022-05-03 01:13:12'),
(41, 9, 'Bestman\'s Jacket - 2', 'SDB03 - Dark Blue Bead work 217 (16+)', 0, '2022-04-24 09:06:29', '2022-05-03 01:13:28'),
(42, 9, 'Pageboy\'s Jacket - 1', 'SDB07 - Dark Blue Bead work 217 (10 1/2+)', 0, '2022-04-24 09:06:29', '2022-05-03 01:13:49'),
(43, 9, 'Pageboy\'s Jacket - 2', 'SDB05 - Dark Blue Bead work 217 (14-)', 0, '2022-04-24 09:06:29', '2022-05-03 01:14:00'),
(44, 9, 'Group Cavani', NULL, 0, '2022-04-24 09:06:29', '2022-04-24 09:06:29'),
(45, 10, 'Groom\'s Jacket', 'BPW02 - Dark Blue Pearl Work (17) [220]', 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(46, 10, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(47, 10, 'Group Cavani', NULL, 0, '2022-04-24 09:08:05', '2022-04-24 09:08:05'),
(48, 12, 'Groom\'s Jacket', 'MPW06 - Maroon Pearl work 221 [Min ] Lion (18)', 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(49, 12, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(50, 12, 'Bestman\'s Jacket - 1', 'SGS03 - Silver gold spring work (17) [220]', 0, '2022-04-24 09:10:21', '2022-05-03 01:44:25'),
(51, 12, 'Bestman\'s Jacket - 2', 'SGS04 - Silver gold spring work (17 1/2) [220]', 0, '2022-04-24 09:10:21', '2022-05-03 01:44:34'),
(52, 12, 'Group Cavani', NULL, 0, '2022-04-24 09:10:21', '2022-04-24 09:10:21'),
(53, 13, 'Groom\'s Jacket', 'MDC02 - Maroon Dull Gold Cutwork Soft Velvet 218 [Min] (17)', 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(54, 13, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(55, 13, 'Bestman\'s Jacket - 1', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(56, 13, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(57, 13, 'Group Cavani', NULL, 0, '2022-04-24 09:15:26', '2022-04-24 09:15:26'),
(58, 16, 'Groom\'s Jacket', 'JBS03 - Black Dull gold spring work 221 new (17 1/2)', 0, '2022-04-24 09:21:17', '2022-05-07 01:39:13'),
(59, 16, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(60, 16, 'Bestman\'s Jacket - 1', 'LG06 - Light Gray [ASH] 222 (17)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(61, 16, 'Bestman\'s Jacket - 2', 'LG07 - Light Gray [ASH] 222 (17 1/2)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(62, 16, 'Pageboy\'s Jacket - 1', 'LG02 - Light Gray [ASH] 222 (13-)', 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(63, 16, 'Group Cavani', NULL, 0, '2022-04-24 09:21:17', '2022-04-24 09:21:17'),
(64, 17, 'Groom\'s Jacket', 'MDS14 - Maroon Dull gold work peacock (18+) [222]', 0, '2022-04-24 09:27:16', '2022-05-06 02:48:23'),
(65, 17, 'Groom\'s Cavani', NULL, 0, '2022-04-24 09:27:16', '2022-04-24 09:27:16'),
(66, 17, 'Group Cavani', NULL, 0, '2022-04-24 09:27:16', '2022-04-24 09:27:16'),
(128, 6, 'Groom\'s Jacket', 'BPW02 - Dark Blue Pearl Work (17) [220]', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(129, 6, 'Groom\'s Cavani', NULL, 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(130, 6, 'Bestman\'s Jacket - 1', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(131, 6, 'Pageboy\'s Jacket - 1', 'DB07 - Dark Beige Spring work [two tone] 219 (13+)', 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(132, 6, 'Group Cavani', NULL, 0, '2022-04-28 07:48:32', '2022-04-28 07:48:32'),
(145, 19, 'Groom\'s Jacket', 'MDS09 - Dark Maroon Dull gold two tone  220 [Han] (18+)', 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(146, 19, 'Groom\'s Cavani', NULL, 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(147, 19, 'Bestman\'s Jacket - 1', 'DRB12 - Dark Red Bead work 217 (18-)', 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(148, 19, 'Bestman\'s Jacket - 2', 'DRB02 - Dark Red Bead work 217 (17)', 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(149, 19, 'Pageboy\'s Jacket - 1', 'DRB08 - Dark Red Bead work 217 (13 1/2+)', 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(150, 19, 'Group Cavani', NULL, 0, '2022-04-29 23:46:28', '2022-04-29 23:46:28'),
(151, 27, 'Groom\'s Jacket', 'MDS02 - Maroon Dull Gold Springwork Two tone 218 [Han] (18)', 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(152, 27, 'Groom\'s Cavani', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(153, 27, 'Bestman\'s Jacket - 1', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(154, 27, 'Bestman\'s Jacket - 2', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(155, 27, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(156, 27, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(157, 27, 'Group Cavani', NULL, 0, '2022-05-02 22:41:20', '2022-05-02 22:41:20'),
(158, 28, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(159, 28, 'Groom\'s Cavani', NULL, 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(160, 28, 'Bestman\'s Jacket - 1', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(161, 28, 'Bestman\'s Jacket - 2', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(162, 28, 'Pageboy\'s Jacket - 1', 'LIB07 - Light Ivory Bead work 217 (12+)', 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(163, 28, 'Group Cavani', NULL, 0, '2022-05-03 00:09:31', '2022-05-03 00:09:31'),
(164, 4, 'Groom\'s Jacket', NULL, 0, '2022-05-03 04:24:41', '2022-05-03 04:24:41'),
(165, 4, 'Groom\'s Cavani', NULL, 0, '2022-05-03 04:24:41', '2022-05-03 04:24:41'),
(166, 4, 'Bestman\'s Jacket - 1', 'SGS06 - Silver gold spring work (16 1/2+) [220]', 0, '2022-05-03 04:24:41', '2022-05-03 04:24:41'),
(167, 4, 'Pageboy\'s Jacket - 1', 'DI02 - Gold Ivory Bead work 218 (13 1/2)', 0, '2022-05-03 04:24:41', '2022-05-03 04:24:58'),
(168, 4, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-05-03 04:24:41', '2022-05-03 04:24:41'),
(169, 4, 'Group Cavani', NULL, 0, '2022-05-03 04:24:41', '2022-05-03 04:24:41'),
(170, 33, 'Groom\'s Jacket', NULL, 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(171, 33, 'Groom\'s Cavani', NULL, 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(172, 33, 'Bestman\'s Jacket - 1', 'CS05 - Ivory Spring [cream] 218 (17-)', 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(173, 33, 'Bestman\'s Jacket - 2', 'CS06 - Ivory Spring [cream] 218 (16+)', 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(174, 33, 'Bestman\'s Jacket - 3', 'CS07 - Ivory Spring [cream] 218 (16 1/2)', 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(175, 33, 'Group Cavani', NULL, 0, '2022-05-03 23:49:12', '2022-05-03 23:49:12'),
(176, 31, 'Groom\'s Jacket', 'MDS05 - Maroon Dull Gold Springwork 219 [Akhil](17)', 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(177, 31, 'Groom\'s Cavani', NULL, 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(178, 31, 'Bestman\'s Jacket - 1', 'LIB01 - Light Ivory Bead work 217 (17-)', 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(179, 31, 'Bestman\'s Jacket - 2', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(180, 31, 'Bestman\'s Jacket - 3', 'LIB03 - Light Ivory Bead work 217 (17)', 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(181, 31, 'Bestman\'s Jacket - 4', 'LIB04 - Light Ivory Bead work 217 (17)', 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(182, 31, 'Group Cavani', NULL, 0, '2022-05-03 23:51:12', '2022-05-03 23:51:12'),
(183, 32, 'Groom\'s Jacket', 'PDC01 - Dark Purple dull gold cutwork 218 (16 1/2)', 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(184, 32, 'Groom\'s Cavani', NULL, 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(185, 32, 'Bestman\'s Jacket - 1', 'DI04 - Gold Ivory Bead Work 218 (16)', 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(186, 32, 'Bestman\'s Jacket - 2', 'DI05 - Gold Ivory Bead work 218 (16 1/2)', 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(187, 32, 'Bestman\'s Jacket - 3', 'DI08 - Gold Ivory Bead work 218 (17 1/2)', 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(188, 32, 'Group Cavani', NULL, 0, '2022-05-03 23:54:22', '2022-05-03 23:54:22'),
(189, 30, 'Groom\'s Jacket', NULL, 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(190, 30, 'Groom\'s Cavani', NULL, 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(191, 30, 'Bestman\'s Jacket - 1', 'DRB03 - Dark Red Bead work 217 (16)', 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(192, 30, 'Bestman\'s Jacket - 2', 'DRB04 - Dark Red Bead work 217 (17-)', 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(193, 30, 'Bestman\'s Jacket - 3', 'DRB12 - Dark Red Bead work 217 (18-)', 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(194, 30, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(195, 30, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(196, 30, 'Group Cavani', NULL, 0, '2022-05-03 23:57:56', '2022-05-03 23:57:56'),
(197, 34, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(198, 34, 'Groom\'s Cavani', NULL, 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(199, 34, 'Bestman\'s Jacket - 1', 'DI04 - Gold Ivory Bead Work 218 (16)', 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(200, 34, 'Bestman\'s Jacket - 2', 'DI05 - Gold Ivory Bead work 218 (16 1/2)', 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(201, 34, 'Bestman\'s Jacket - 3', 'DI08 - Gold Ivory Bead work 218 (17 1/2)', 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(202, 34, 'Group Cavani', NULL, 0, '2022-05-04 07:26:27', '2022-05-04 07:26:27'),
(203, 35, 'Groom\'s Jacket', 'MSS01 - Maroon Silver Spring work 219 (17)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(204, 35, 'Groom\'s Cavani', NULL, 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(205, 35, 'Bestman\'s Jacket - 1', 'MS02 - Maroon Bead work 217 (17 1/2)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(206, 35, 'Bestman\'s Jacket - 2', 'MS03 - Maroon Bead work 217 (16)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(207, 35, 'Bestman\'s Jacket - 3', 'MS04 - Maroon Bead work 217 (16)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(208, 35, 'Pageboy\'s Jacket - 1', 'MS05 - Maroon Bead work 217 (14 1/2)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(209, 35, 'Pageboy\'s Jacket - 2', 'MS07 - Maroon Bead work 217(14)', 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(210, 35, 'Group Cavani', NULL, 0, '2022-05-04 07:34:51', '2022-05-04 07:34:51'),
(211, 36, 'Groom\'s Jacket', 'MDC02 - Maroon Dull Gold Cutwork Soft Velvet 218 [Min] (17)', 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(212, 36, 'Groom\'s Cavani', NULL, 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(213, 36, 'Bestman\'s Jacket - 1', 'PS05 - Purple Spring work 218 (16+)', 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(214, 36, 'Bestman\'s Jacket - 2', 'PS06 - Purple Spring work 218 (16 1/2+)', 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(215, 36, 'Pageboy\'s Jacket - 1', 'PS02 - Purple Spring work 218 (12+)', 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(216, 36, 'Group Cavani', NULL, 0, '2022-05-04 07:42:51', '2022-05-04 07:42:51'),
(217, 37, 'Groom\'s Jacket', 'DRC01 - Dark Red Cutwork 218 [Nis] (17 1/2)', 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(218, 37, 'Groom\'s Cavani', NULL, 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(219, 37, 'Bestman\'s Jacket - 1', 'LIB01 - Light Ivory Bead work 217 (17-)', 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(220, 37, 'Bestman\'s Jacket - 2', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(221, 37, 'Pageboy\'s Jacket - 1', 'LIB09 - Light Ivory Bead work 217 (14 1/2+)', 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(222, 37, 'Group Cavani', NULL, 0, '2022-05-04 07:51:52', '2022-05-04 07:51:52'),
(223, 38, 'Groom\'s Jacket', 'MDS04 - MaroonMaroon dull Gold Spring Work 216 17', 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(224, 38, 'Groom\'s Cavani', NULL, 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(225, 38, 'Bestman\'s Jacket - 1', 'DRB01 - Dark Red Bead work 217 (17)', 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(226, 38, 'Bestman\'s Jacket - 2', 'DRB02 - Dark Red Bead work 217 (17)', 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(227, 38, 'Bestman\'s Jacket - 3', 'DRB03 - Dark Red Bead work 217 (16)', 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(228, 38, 'Bestman\'s Jacket - 4', 'DRB04 - Dark Red Bead work 217 (17-)', 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(229, 38, 'Group Cavani', NULL, 0, '2022-05-05 02:26:29', '2022-05-05 02:26:29'),
(230, 39, 'Groom\'s Jacket', 'DBS01 - Dark Blue Spring work [dull gold work] 218  (18)', 0, '2022-05-05 02:32:21', '2022-05-05 02:32:21'),
(231, 39, 'Groom\'s Cavani', NULL, 0, '2022-05-05 02:32:21', '2022-05-05 02:32:21'),
(232, 39, 'Bestman\'s Jacket - 1', 'DB01 - Dark Beige Spring work [two tone] 219 (18-)', 0, '2022-05-05 02:32:21', '2022-05-05 02:32:21'),
(233, 39, 'Bestman\'s Jacket - 2', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-05-05 02:32:21', '2022-05-05 02:32:21'),
(234, 39, 'Group Cavani', NULL, 0, '2022-05-05 02:32:21', '2022-05-05 02:32:21'),
(235, 41, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(236, 41, 'Groom\'s Cavani', NULL, 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(237, 41, 'Bestman\'s Jacket - 1', 'DI04 - Gold Ivory Bead Work 218 (16)', 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(238, 41, 'Bestman\'s Jacket - 2', 'DI05 - Gold Ivory Bead work 218 (16 1/2)', 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(239, 41, 'Bestman\'s Jacket - 3', 'DI08 - Gold Ivory Bead work 218 (17 1/2)', 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(240, 41, 'Pageboy\'s Jacket - 1', 'DI01 - Gold Ivory Bead work 218 (12 1/2)', 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(241, 41, 'Group Cavani', NULL, 0, '2022-05-05 02:42:39', '2022-05-05 02:42:39'),
(242, 42, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(243, 42, 'Groom\'s Cavani', NULL, 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(244, 42, 'Bestman\'s Jacket - 1', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(245, 42, 'Bestman\'s Jacket - 2', 'DB03 - Dark Beige Spring work [two tone] 219 (15 1/2)', 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(246, 42, 'Bestman\'s Jacket - 3', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(247, 42, 'Bestman\'s Jacket - 4', NULL, 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(248, 42, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(249, 42, 'Group Cavani', NULL, 0, '2022-05-05 02:49:19', '2022-05-05 02:49:19'),
(250, 43, 'Groom\'s Jacket', 'MDS03 - Maroon Dull gold Spring work Checks 219  [Han] (16)', 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(251, 43, 'Groom\'s Cavani', NULL, 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(252, 43, 'Bestman\'s Jacket - 1', 'IS02 - Ivory Dull Gold Spring work 213(16)', 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(253, 43, 'Bestman\'s Jacket - 2', 'IS03 - Ivory Dull Gold Spring work 213 (16 1/2)', 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(254, 43, 'Pageboy\'s Jacket - 1', 'DIS05 - Dark Ivory Bead work 216 (14 1/2)', 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(255, 43, 'Pageboy\'s Jacket - 2', 'IS05 - Ivory Dull Gold Spring work 213 (13)', 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(256, 43, 'Group Cavani', NULL, 0, '2022-05-05 02:55:34', '2022-05-05 02:55:34'),
(257, 44, 'Groom\'s Jacket', 'JBS02 - Black Spring work Blue+Red+Dull gold work 219  (17)', 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(258, 44, 'Groom\'s Cavani', NULL, 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(259, 44, 'Bestman\'s Jacket - 1', 'DI04 - Gold Ivory Bead Work 218 (16)', 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(260, 44, 'Bestman\'s Jacket - 2', 'DI05 - Gold Ivory Bead work 218 (16 1/2)', 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(261, 44, 'Bestman\'s Jacket - 3', 'DI08 - Gold Ivory Bead work 218 (17 1/2)', 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(262, 44, 'Group Cavani', NULL, 0, '2022-05-05 03:04:44', '2022-05-05 03:04:44'),
(263, 45, 'Groom\'s Jacket', 'DBC01 - Dark Blue dull gold cutwork 217 (16)', 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(264, 45, 'Groom\'s Cavani', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(265, 45, 'Bestman\'s Jacket - 1', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(266, 45, 'Bestman\'s Jacket - 2', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(267, 45, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(268, 45, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(269, 45, 'Group Cavani', NULL, 0, '2022-05-05 03:09:17', '2022-05-05 03:09:17'),
(270, 46, 'Groom\'s Jacket', 'BCW01 - Black Cutwork 218 (17 1/2)', 0, '2022-05-05 03:15:52', '2022-05-05 03:15:52'),
(271, 46, 'Groom\'s Cavani', NULL, 0, '2022-05-05 03:15:52', '2022-05-05 03:15:52'),
(272, 46, 'Bestman\'s Jacket - 1', 'DB01 - Dark Beige Spring work [two tone] 219 (18-)', 0, '2022-05-05 03:15:52', '2022-05-05 03:15:52'),
(273, 46, 'Bestman\'s Jacket - 2', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-05-05 03:15:52', '2022-05-05 03:15:52'),
(274, 46, 'Group Cavani', NULL, 0, '2022-05-05 03:15:52', '2022-05-05 03:15:52'),
(275, 47, 'Groom\'s Jacket', 'GDC01 - Dark Green Dull gold Cutwork 219 (17)', 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(276, 47, 'Groom\'s Cavani', NULL, 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(277, 47, 'Bestman\'s Jacket - 1', 'LIB01 - Light Ivory Bead work 217 (17-)', 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(278, 47, 'Pageboy\'s Jacket - 1', 'LIB05 - Light Ivory Bead work 217 (11)', 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(279, 47, 'Pageboy\'s Jacket - 2', 'LIB07 - Light Ivory Bead work 217 (12+)', 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(280, 47, 'Group Cavani', NULL, 0, '2022-05-05 03:25:42', '2022-05-05 03:25:42'),
(281, 48, 'Groom\'s Jacket', 'PDC01 - Dark Purple dull gold cutwork 218 (16 1/2)', 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(282, 48, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(283, 48, 'Bestman\'s Jacket - 1', 'DB03 - Dark Beige Spring work [two tone] 219 (15 1/2)', 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(284, 48, 'Bestman\'s Jacket - 2', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(285, 48, 'Bestman\'s Jacket - 3', 'DB05 - Dark Beige Spring work [two tone] 219 (16)', 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(286, 48, 'Group Cavani', NULL, 0, '2022-05-05 21:13:18', '2022-05-05 21:13:18'),
(287, 49, 'Groom\'s Jacket', 'DBC01 - Dark Blue dull gold cutwork 217 (16)', 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(288, 49, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(289, 49, 'Bestman\'s Jacket - 1', 'DB01 - Dark Beige Spring work [two tone] 219 (18-)', 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(290, 49, 'Bestman\'s Jacket - 2', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(291, 49, 'Pageboy\'s Jacket - 1', 'DB06 - Dark Beige Spring work [two tone] 219  (13-)', 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(292, 49, 'Pageboy\'s Jacket - 2', 'DB07 - Dark Beige Spring work [two tone] 219 (13+)', 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(293, 49, 'Group Cavani', NULL, 0, '2022-05-05 21:23:47', '2022-05-05 21:23:47'),
(294, 50, 'Groom\'s Jacket', 'MDS05 - Maroon Dull Gold Springwork 219 [Akhil](17)', 0, '2022-05-05 21:26:32', '2022-05-05 21:26:32'),
(295, 50, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:26:32', '2022-05-05 21:26:32'),
(296, 50, 'Bestman\'s Jacket - 1', 'LIB01 - Light Ivory Bead work 217 (17-)', 0, '2022-05-05 21:26:32', '2022-05-05 21:26:32'),
(297, 50, 'Bestman\'s Jacket - 2', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-05 21:26:32', '2022-05-05 21:26:32'),
(298, 50, 'Group Cavani', NULL, 0, '2022-05-05 21:26:32', '2022-05-05 21:26:32'),
(299, 51, 'Groom\'s Jacket', 'MDS05 - Maroon Dull Gold Springwork 219 [Akhil](17)', 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(300, 51, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(301, 51, 'Bestman\'s Jacket - 1', 'DRB01 - Dark Red Bead work 217 (17)', 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(302, 51, 'Bestman\'s Jacket - 2', 'DRB02 - Dark Red Bead work 217 (17)', 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(303, 51, 'Pageboy\'s Jacket - 1', 'DRB05 - Dark Red Bead work 217 (12)', 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(304, 51, 'Group Cavani', NULL, 0, '2022-05-05 21:30:44', '2022-05-05 21:30:44'),
(305, 52, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(306, 52, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(307, 52, 'Bestman\'s Jacket - 1', 'CS05 - Ivory Spring [cream] 218 (17-)', 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(308, 52, 'Pageboy\'s Jacket - 1', 'CS01 - Ivory Spring [cream] 218 (11)', 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(309, 52, 'Pageboy\'s Jacket - 2', 'CS04 - Ivory Spring [cream] 218 (14 1/2)', 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(310, 52, 'Group Cavani', NULL, 0, '2022-05-05 21:36:09', '2022-05-05 21:36:09'),
(311, 53, 'Groom\'s Jacket', 'MCS01 - Maroon Cut work small 218 (15)', 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(312, 53, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(313, 53, 'Pageboy\'s Jacket - 1', 'PS01 - Purple Spring work 218 (11+)', 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(314, 53, 'Pageboy\'s Jacket - 2', 'PS02 - Purple Spring work 218 (12+)', 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(315, 53, 'Pageboy\'s Jacket - 3', 'PS03 - Purple Spring work 218 (13+)', 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(316, 53, 'Group Cavani', NULL, 0, '2022-05-05 21:44:22', '2022-05-05 21:44:22'),
(317, 54, 'Groom\'s Jacket', 'MDS05 - Maroon Dull Gold Springwork 219 [Akhil](17)', 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(318, 54, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(319, 54, 'Bestman\'s Jacket - 1', 'PS05 - Purple Spring work 218 (16+)', 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(320, 54, 'Bestman\'s Jacket - 2', 'PS06 - Purple Spring work 218 (16 1/2+)', 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(321, 54, 'Bestman\'s Jacket - 3', 'PS07 - Purple Spring work 218 (17+)', 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(322, 54, 'Group Cavani', NULL, 0, '2022-05-05 21:52:29', '2022-05-05 21:52:29'),
(323, 55, 'Groom\'s Jacket', 'DRC01 - Dark Red Cutwork 218 [Nis] (17 1/2)', 0, '2022-05-05 21:56:49', '2022-05-05 21:56:49'),
(324, 55, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:56:49', '2022-05-05 21:56:49'),
(325, 55, 'Group Cavani', NULL, 0, '2022-05-05 21:56:49', '2022-05-05 21:56:49'),
(326, 56, 'Groom\'s Jacket', 'MPW02 - Maroon Pearl work 219 [elephant] (17 1/2)', 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(327, 56, 'Groom\'s Cavani', NULL, 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(328, 56, 'Bestman\'s Jacket - 1', 'LIB01 - Light Ivory Bead work 217 (17-)', 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(329, 56, 'Bestman\'s Jacket - 2', 'LIB02 - Light Ivory Bead work 217 (16 1/2)', 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(330, 56, 'Pageboy\'s Jacket - 1', 'LIB05 - Light Ivory Bead work 217 (11)', 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(331, 56, 'Pageboy\'s Jacket - 2', 'LIB06 - Light Ivory Bead work 217 (11)', 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(332, 56, 'Group Cavani', NULL, 0, '2022-05-05 21:59:40', '2022-05-05 21:59:40'),
(333, 57, 'Groom\'s Jacket', 'MPW01 - Maroon Pearl work 218 [Min ] (17)', 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(334, 57, 'Groom\'s Cavani', NULL, 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(335, 57, 'Bestman\'s Jacket - 1', 'MS01 - Maroon Bead work 217 (17 1/2)', 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(336, 57, 'Bestman\'s Jacket - 2', 'MS02 - Maroon Bead work 217 (17 1/2)', 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(337, 57, 'Bestman\'s Jacket - 3', 'MS03 - Maroon Bead work 217 (16)', 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(338, 57, 'Group Cavani', NULL, 0, '2022-05-05 22:02:45', '2022-05-05 22:02:45'),
(339, 17, 'Bestman\'s Jacket - 1', 'RW05 - Dark Red White work (pearl) 16 1/2 [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:49:10'),
(340, 17, 'Bestman\'s Jacket - 2', 'RW06 - Dark Red White work (pearl) 17 1/2 [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:49:24'),
(341, 17, 'Bestman\'s Jacket - 3', 'RW07 - Dark Red White work (pearl) 17- [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:50:42'),
(342, 17, 'Bestman\'s Jacket - 4', 'RW08 - Dark Red White work (pearl) 18+ [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:51:00'),
(343, 17, 'Pageboy\'s Jacket - 1', 'RW03 - Dark Red White work (pearl) 12 1/2+ [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:51:09'),
(344, 17, 'Pageboy\'s Jacket - 2', 'RW04 - Dark Red White work (pearl) 11+ [220]', 0, '2022-05-06 02:48:58', '2022-05-06 02:51:16'),
(345, 29, 'Groom\'s Jacket', 'JBS04 - Black Pearl work work 222 new (17+)', 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(346, 29, 'Groom\'s Cavani', NULL, 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(347, 29, 'Bestman\'s Jacket - 1', 'GS06 - Gray Spring work 218 (16 1/2+)', 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(348, 29, 'Bestman\'s Jacket - 2', 'GS07 - Gray Spring work 218 (17+)', 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(349, 29, 'Bestman\'s Jacket - 3', 'GS08 - Gray Spring work 218 (17 1/2+)', 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(350, 29, 'Group Cavani', NULL, 0, '2022-05-06 03:08:41', '2022-05-06 03:08:41'),
(351, 20, 'Groom\'s Jacket', 'MDS14 - Maroon Dull gold work peacock (18+) [222]', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(352, 20, 'Groom\'s Cavani', NULL, 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(353, 20, 'Bestman\'s Jacket - 1', 'DB02 - Dark Beige Spring work [two tone] 219 (17+)', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(354, 20, 'Bestman\'s Jacket - 2', 'DB04 - Dark Beige Spring work [two tone] 219 (17-)', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(355, 20, 'Bestman\'s Jacket - 3', 'DB05 - Dark Beige Spring work [two tone] 219 (16)', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(356, 20, 'Bestman\'s Jacket - 4', 'DB03 - Dark Beige Spring work [two tone] 219 (15 1/2)', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(357, 20, 'Pageboy\'s Jacket - 1', 'DB06 - Dark Beige Spring work [two tone] 219  (13-)', 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(358, 20, 'Group Cavani', NULL, 0, '2022-05-06 03:12:17', '2022-05-06 03:12:17'),
(359, 21, 'Groom\'s Jacket', 'JBS04 - Black Pearl work work 222 new (17+)', 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(360, 21, 'Groom\'s Cavani', NULL, 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(361, 21, 'Bestman\'s Jacket - 1', 'SGS04 - Silver gold spring work (17 1/2) [220]', 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(362, 21, 'Bestman\'s Jacket - 2', 'SGS05 - Silver gold spring work (16 1/2) [220]', 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(363, 21, 'Pageboy\'s Jacket - 1', 'SGS08 - Silver gold spring work (12) [220]', 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(364, 21, 'Pageboy\'s Jacket - 2', 'SGS10 - Silver gold spring work (14) [220]', 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(365, 21, 'Group Cavani', NULL, 0, '2022-05-06 03:15:30', '2022-05-06 03:15:30'),
(366, 18, 'Groom\'s Jacket', 'BPW04 - Dark Blue Pearl Work (21) [221]', 0, '2022-05-07 02:44:29', '2022-05-07 02:44:29'),
(367, 18, 'Groom\'s Cavani', NULL, 0, '2022-05-07 02:44:29', '2022-05-07 02:44:29'),
(368, 18, 'Group Cavani', NULL, 0, '2022-05-07 02:44:29', '2022-05-07 02:44:29'),
(369, 18, 'Bestman\'s Jacket - 1', NULL, 0, '2022-05-07 02:47:11', '2022-05-07 02:47:11'),
(370, 18, 'Bestman\'s Jacket - 2', NULL, 0, '2022-05-07 02:47:11', '2022-05-07 02:47:11'),
(371, 18, 'Pageboy\'s Jacket - 1', NULL, 0, '2022-05-07 02:47:11', '2022-05-07 02:47:11'),
(372, 18, 'Pageboy\'s Jacket - 2', NULL, 0, '2022-05-07 02:47:11', '2022-05-07 02:47:11');

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
(3, 4, NULL, '2022-04-24 12:37:15', '2022-05-02 12:09:49'),
(4, 4, NULL, '2022-04-24 13:09:45', '2022-05-02 12:09:53');

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
(199, 2, 'SDB05', 'Dark Blue Bead work 217 (14-)', 'Pageboy', NULL, '2022-04-21 03:36:55', '2022-04-21 03:36:55'),
(202, 2, 'SGS07', 'Silver gold spring work (15) [220]', 'Pageboy', NULL, '2022-04-29 22:43:37', '2022-04-29 22:43:37'),
(203, 2, 'SGS08', 'Silver gold spring work (12) [220]', 'Pageboy', NULL, '2022-04-29 22:44:37', '2022-04-29 22:44:37'),
(204, 2, 'SGS09', 'Silver gold spring work (13) [220]', 'Pageboy', NULL, '2022-04-29 22:45:05', '2022-04-29 22:45:05'),
(205, 2, 'SGS10', 'Silver gold spring work (14) [220]', 'Pageboy', NULL, '2022-04-29 22:45:35', '2022-04-29 22:45:35'),
(206, 2, 'MDS14', 'Maroon Dull gold work peacock (18+) [222]', 'Groom', NULL, '2022-04-29 23:50:12', '2022-04-29 23:50:12'),
(207, 2, 'JBS04', 'Black Pearl work work 222 new (17+)', 'Groom', NULL, '2022-05-03 00:18:34', '2022-05-03 00:18:34');

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
(8, 4, 'GROOM', '1-', '22.6+', '5.6-', '0', '0', '0', '0', '0', '0', '2022-04-24 07:50:51', '2022-05-02 12:03:17'),
(9, 7, 'GROOM', '22', '17', '39', NULL, '42', '11', NULL, NULL, NULL, '2022-04-24 08:46:18', '2022-04-24 08:46:18'),
(10, 7, 'PAGEBOY - 1', '19.5+', '13', '22.5', NULL, '28', '8', NULL, NULL, NULL, '2022-04-24 08:46:57', '2022-04-24 08:46:57'),
(11, 7, 'PAGEBOY - 2', '20', '12', '28', NULL, '34', '9', NULL, NULL, NULL, '2022-04-24 08:47:19', '2022-04-24 08:47:19'),
(12, 7, 'PAGEBOY - 3', '21', '12', '25', NULL, '26', '8', NULL, NULL, NULL, '2022-04-24 08:47:33', '2022-04-24 08:47:33'),
(13, 12, 'GROOM', '22', '18', '41', NULL, '42', '11', NULL, NULL, NULL, '2022-04-24 09:11:08', '2022-04-24 09:11:08'),
(14, 12, 'BESTMAN - 1', '22-', '17', '37', NULL, '41', '10.5+', NULL, NULL, NULL, '2022-04-24 09:11:28', '2022-04-24 09:11:28'),
(15, 12, 'BESTMAN - 2', '22+', '17-', '37', NULL, '39', '11', NULL, NULL, NULL, '2022-04-24 09:11:53', '2022-04-24 09:11:53'),
(16, 2, 'GROOM', '22', '17+', '40', '0', '40', '11', '0', '0', '0', '2022-04-28 06:55:27', '2022-04-28 06:55:44'),
(17, 2, 'BESTMAN - 4', '22', '15', '36', NULL, '38', '10', NULL, NULL, NULL, '2022-04-28 06:56:02', '2022-04-28 06:56:02'),
(18, 6, 'GROOM', '22.5', '17', '38', NULL, '41', '10.5', NULL, NULL, NULL, '2022-04-28 07:45:43', '2022-04-28 07:45:43'),
(19, 19, 'GROOM', '22', '17', '38', NULL, '41', '11', NULL, NULL, NULL, '2022-04-29 23:02:24', '2022-04-29 23:02:24'),
(20, 19, 'BESTMAN - 1', '22', '18', '34', NULL, '38+', '10', NULL, NULL, NULL, '2022-04-29 23:08:56', '2022-04-29 23:08:56'),
(21, 19, 'BESTMAN - 2', '21.5+', '17', '38', NULL, '37+', '10.5', NULL, NULL, NULL, '2022-04-29 23:26:11', '2022-04-29 23:26:11'),
(22, 19, 'PAGEBOY - 1', '20', '13+', '24', NULL, '32', '9', NULL, NULL, NULL, '2022-04-29 23:26:27', '2022-04-29 23:26:27'),
(23, 4, 'PAGEBOY - 2', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-02 12:04:24', '2022-05-02 12:04:24'),
(24, 6, 'BESTMAN - 1', '22.5', '17', '38', NULL, '38', '10', NULL, NULL, NULL, '2022-05-03 00:46:12', '2022-05-03 00:46:12'),
(25, 6, 'PAGEBOY - 1', '19.5', '11', '22', NULL, '29', '8', NULL, NULL, NULL, '2022-05-03 00:46:25', '2022-05-03 00:46:25'),
(26, 11, 'GROOM', '21.5+', '16+', '37', NULL, '36', '10', NULL, NULL, NULL, '2022-05-03 00:47:25', '2022-05-03 00:47:25'),
(27, 11, 'BESTMAN - 1', '22', '17', '39', NULL, '39', '11', '0', '0', '0', '2022-05-03 00:47:36', '2022-05-03 00:48:17'),
(28, 11, 'BESTMAN - 2', '21', '15', '31', NULL, '39', '10', NULL, NULL, NULL, '2022-05-03 00:47:52', '2022-05-03 00:47:52'),
(29, 11, 'PAGEBOY - 1', '20', '11', '21', NULL, '28', '8', NULL, NULL, NULL, '2022-05-03 00:48:38', '2022-05-03 00:48:38'),
(30, 11, 'PAGEBOY - 2', '19.5+', '9.5', '19', '0', '20', '7', '0', '0', '0', '2022-05-03 00:48:52', '2022-05-03 00:49:03'),
(31, 9, 'GROOM', '22', '17', '36', NULL, '41', '11', NULL, NULL, NULL, '2022-05-03 01:11:19', '2022-05-03 01:11:19'),
(32, 9, 'BESTMAN - 1', '21', '15', '32', NULL, '41', '11', NULL, NULL, NULL, '2022-05-03 01:11:31', '2022-05-03 01:11:31'),
(33, 9, 'BESTMAN - 2', '22', '17', '32', '0', '40', '10.5', NULL, NULL, NULL, '2022-05-03 01:11:54', '2022-05-03 01:11:54'),
(34, 9, 'PAGEBOY - 1', '20.5', '13', '26', '0', '30', '9', NULL, NULL, NULL, '2022-05-03 01:12:10', '2022-05-03 01:12:10'),
(35, 9, 'PAGEBOY - 2', '19.5', '10', '22', NULL, '25', '7', NULL, NULL, NULL, '2022-05-03 01:12:24', '2022-05-03 01:12:24'),
(36, 20, 'GROOM', NULL, NULL, NULL, '0', NULL, NULL, '0', '0', '0', '2022-05-06 03:09:55', '2022-05-06 03:10:52'),
(37, 4, 'BESTMAN - 1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2022-05-06 07:16:56', '2022-05-06 07:17:03'),
(38, 16, 'GROOM', '23', '18+', '42+', '33', '39', '11-', NULL, NULL, NULL, '2022-05-07 01:51:30', '2022-05-07 01:51:30'),
(39, 16, 'BESTMAN - 1', '22.5', '18', '42', '33', '37', '11-', NULL, NULL, NULL, '2022-05-07 01:51:53', '2022-05-07 01:51:53'),
(40, 16, 'BESTMAN - 2', '23', '18.5', '42.5', '36', '39', '9-', NULL, NULL, NULL, '2022-05-07 01:52:24', '2022-05-07 01:52:24'),
(41, 16, 'PAGEBOY - 1', '20.5', '14+', '26', '0', '30', '9-', '0', '0', '++++', '2022-05-07 01:52:57', '2022-05-07 01:53:14');

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
(10, 6, 'Arrival 4.30', 0, '2022-04-28 07:48:48', '2022-04-28 07:48:48'),
(11, 19, 'Arrival 3AM', 0, '2022-04-29 23:25:08', '2022-04-29 23:25:08'),
(12, 19, 'Dressing time - 3.16am', 0, '2022-04-29 23:25:20', '2022-04-29 23:25:20'),
(13, 19, 'departure - 5.35', 0, '2022-04-29 23:25:39', '2022-04-29 23:25:39'),
(14, 27, 'No going away (shop Change).. gold kawani for all', 0, '2022-05-02 22:43:21', '2022-05-02 22:43:21'),
(15, 30, 'Additional Page boy  (2500)', 0, '2022-05-03 07:40:53', '2022-05-03 07:40:53'),
(16, 31, 'kawani - light gold for groom, gold large checks for bestmen. Arrival time 3.00 am Out 5.30am groom dressing time 4.55am', 0, '2022-05-03 21:49:11', '2022-05-03 21:49:11'),
(18, 32, 'No going away.  4.00am In', 0, '2022-05-03 23:29:57', '2022-05-03 23:29:57'),
(20, 36, 'Iron Crown , maroon kawani for groom', 0, '2022-05-04 07:43:11', '2022-05-04 07:43:11'),
(21, 37, 'Dressing time=2.15,Out Time=5.45,In=3.30,Light gold Kawanifor groom. Gold for Group.', 0, '2022-05-04 07:52:18', '2022-05-04 07:52:18'),
(22, 38, 'light gold kawani for groom.. Large check gold kawani for group', 0, '2022-05-05 02:26:51', '2022-05-05 02:26:51'),
(23, 39, 'White kawani for all. In - 4.00 a.m Out - 6.00 am', 0, '2022-05-05 02:32:47', '2022-05-05 02:32:47'),
(24, 40, 'IN- 4.00AM OUT- 5.00AM', 0, '2022-05-05 02:37:32', '2022-05-05 02:37:32'),
(25, 41, 'Podi ekkena shop ekata adinna enawa.', 0, '2022-05-05 02:42:54', '2022-05-05 02:42:54'),
(26, 42, 'maroon pearl work for groom-1,Dullgold for groom(kavani),Gold for group(kavani)', 0, '2022-05-05 02:49:58', '2022-05-05 02:49:58'),
(27, 44, 'Lakshi Salon', 0, '2022-05-05 03:05:00', '2022-05-05 03:05:00'),
(28, 50, 'Transport (Yasintha)', 0, '2022-05-05 21:26:52', '2022-05-05 21:26:52'),
(29, 54, 'Grooms dress Changed to MDC01 H cutowrk soft velvet', 0, '2022-05-05 21:52:56', '2022-05-05 21:52:56'),
(30, 58, 'DRB01', 0, '2022-05-05 22:23:44', '2022-05-05 22:23:44'),
(31, 10, '3.30 In\r\n4.30 Out', 0, '2022-05-06 02:08:02', '2022-05-06 02:08:02'),
(32, 18, 'no phone answer on 5/6 at 4.37pm', 0, '2022-05-06 03:07:36', '2022-05-06 03:07:36'),
(33, 29, '4.00am IN\r\n6.00am OUT', 0, '2022-05-06 03:09:04', '2022-05-06 03:09:04'),
(34, 16, 'transport added to bill', 0, '2022-05-07 01:54:06', '2022-05-07 01:54:06'),
(35, 18, 'Came to meet \r\nChanged group mems', 0, '2022-05-07 02:45:18', '2022-05-07 02:45:18'),
(36, 18, 'Pole', 0, '2022-05-07 02:45:25', '2022-05-07 02:45:25');

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
(4, 'Rehan', 'rehan@gmail.com', NULL, '$2y$10$DsJp.4Z6B7RbtkAEzSdI7.//yiDLM5oDAokrn2dLTlyKZds1I5JYO', NULL, '2022-04-23 01:47:39', '2022-05-02 22:12:37', 2),
(5, 'Jagath', 'jagath@gmail.com', NULL, '$2y$10$1inHkMygECA1TUqicJH/leoOdPQ0eYA3YZfj/nsURESvj2n5RZ/1S', NULL, '2022-04-28 06:28:23', '2022-04-29 23:51:53', 2),
(6, 'Saman', 'Saman@gmail.com', NULL, '$2y$10$eAdAdizEc4C8GNpAicwrnODZ0WE2vVHbX3vihXpOs6BfQ1AMEgPwi', NULL, '2022-04-28 06:29:18', '2022-04-28 06:29:18', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_payments`
--
ALTER TABLE `additional_payments`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `additional_payments`
--
ALTER TABLE `additional_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `dress_selections`
--
ALTER TABLE `dress_selections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
