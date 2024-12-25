-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 25, 2024 at 12:30 PM
-- Server version: 10.5.27-MariaDB
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kavianla_reservations`
--

-- --------------------------------------------------------

--
-- Table structure for table `aminity`
--

CREATE TABLE `aminity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aminity`
--

INSERT INTO `aminity` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Bed', NULL, NULL),
(4, 'Bathroom', NULL, NULL),
(5, 'Television', NULL, NULL),
(6, 'Air Conditioning/Heating', NULL, NULL),
(7, 'Desk and Chair', NULL, NULL),
(8, 'Closet or Wardrobe', NULL, NULL),
(9, 'Mirror', NULL, NULL),
(10, 'Phone', NULL, NULL),
(11, 'Free Wi-Fi', NULL, NULL),
(12, 'Room Service', NULL, NULL),
(13, 'Coffee/Tea Maker', NULL, NULL),
(14, 'Mini-Fridge', NULL, NULL),
(15, 'Safe', NULL, NULL),
(16, 'Hairdryer', NULL, NULL),
(17, 'Iron and Ironing Board', NULL, NULL),
(18, 'Clock/Alarm', NULL, NULL),
(19, 'Complimentary Water', NULL, NULL),
(20, 'Balcony or Terrace', NULL, NULL),
(21, 'Robes and Slippers', NULL, NULL),
(22, 'Jacuzzi or Whirlpool Tub', NULL, NULL),
(23, 'Separate Living Area', NULL, NULL),
(24, 'Kitchenette', NULL, NULL),
(25, 'DVD/Blu-ray Player', NULL, NULL),
(26, 'Sound System', NULL, NULL),
(27, 'Multiple Beds', NULL, NULL),
(28, 'Pillow Menu', NULL, NULL),
(29, 'Turn-Down Service', NULL, NULL),
(30, 'Express Check-In/Check-Out', NULL, NULL),
(31, 'Concierge Services', NULL, NULL),
(32, 'Fitness Equipment', NULL, NULL),
(33, 'Spa Services', NULL, NULL),
(34, 'Private Pool', NULL, NULL),
(35, 'Fireplace', NULL, NULL),
(36, 'Expansive Views', NULL, NULL),
(37, 'Entertainment System', NULL, NULL),
(38, 'Executive Lounge Access', NULL, NULL),
(39, 'Free Breakfast', NULL, NULL),
(40, 'Complimentary Airport Transfers', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `bookingNumber` varchar(50) NOT NULL,
  `numRooms` int(5) DEFAULT NULL,
  `checkinDate` date NOT NULL,
  `checkoutDate` date NOT NULL,
  `numAdults` int(5) NOT NULL,
  `numChildren` int(5) NOT NULL,
  `numInfants` int(5) NOT NULL,
  `bookedByGuest` tinyint(1) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `guestTitle` varchar(10) DEFAULT NULL,
  `guestFirstName` varchar(50) DEFAULT NULL,
  `guestLastName` varchar(50) DEFAULT NULL,
  `guestEmail` varchar(150) DEFAULT NULL,
  `guestPhone` varchar(50) DEFAULT NULL,
  `guestAddressOne` varchar(150) DEFAULT NULL,
  `guestAddressTwo` varchar(150) DEFAULT NULL,
  `guestCity` varchar(150) DEFAULT NULL,
  `guestPostcode` varchar(50) DEFAULT NULL,
  `guestCountry` varchar(50) DEFAULT NULL,
  `guestDocumentNumber` varchar(50) DEFAULT NULL,
  `guestDocumentType` varchar(15) DEFAULT NULL,
  `status` int(3) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookingRooms`
--

CREATE TABLE `bookingRooms` (
  `id` int(11) NOT NULL,
  `bookingID` int(11) NOT NULL,
  `roomID` int(11) NOT NULL,
  `numRooms` int(3) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `countryID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `countryID`, `created_at`, `updated_at`) VALUES
(1, 'Phnom Penh', 1, NULL, NULL),
(2, 'Siem Reap', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cambodia', NULL, NULL),
(2, 'Sri Lanka', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `bookingId` int(11) NOT NULL,
  `userId` int(11) DEFAULT 0,
  `invoiceNumber` varchar(16) DEFAULT NULL,
  `billingFirstName` varchar(50) NOT NULL,
  `billingLastName` varchar(50) NOT NULL,
  `billingPhoneNumber` varchar(50) DEFAULT NULL,
  `billingEmail` varchar(50) DEFAULT NULL,
  `InvoiceDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `status` int(3) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceLines`
--

CREATE TABLE `invoiceLines` (
  `id` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `roomID` int(11) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `unitPrice` float(10,2) NOT NULL,
  `qty` int(3) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoicePayments`
--

CREATE TABLE `invoicePayments` (
  `id` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` double(10,2) NOT NULL,
  `paymentReference` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0015c94d70e4a6dfe1495cbad2d8d73ccd69cdac1e218be3da3bf75f22a834cb04c586501782170e', 20, 1, 'Laravel Password Grant Client', '[]', 0, '2022-04-21 06:39:51', '2022-04-21 06:39:51', '2023-04-21 02:39:51'),
('02074e974c558cfbff9caa2841f0c620e66ea66d6c85ef785d8524a4fcd75e905e71b80a8157bcf6', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 23:46:32', '2023-08-11 23:46:32', '2024-08-11 19:46:32'),
('0429714f5fbd8dc7713dcfa98cc8dec3f8de4138ab614c9f22955d9155fa8a670c04095068e0c6b6', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:44:48', '2022-03-25 12:44:48', '2023-03-25 08:44:48'),
('044e2dd427274b22892f9fe3ff56bc714276d738b3ba428b9a56a56a2e8d5f1bd098bebe545924bf', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 09:05:37', '2023-09-03 09:05:37', '2024-09-03 05:05:37'),
('07be78daaa094b5fa6b3a88a579b48880c7c7e1b31a0cc7fdf7736878fd722b271f80febc6bf8133', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:25:04', '2022-06-04 13:25:04', '2023-06-04 09:25:04'),
('07c21d68387cec69b6af6802e544064006d48c095f8112ce766ff71fbad576dedc4a35311fd30514', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 18:38:14', '2022-03-27 18:38:14', '2023-03-27 14:38:14'),
('07c2342fd0e7557d6e4e6dd7a074172105c68a496dabf2252d25e78c2713647a780b5ae940830b22', 31, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-13 15:35:51', '2022-07-13 15:35:51', '2023-07-13 11:35:51'),
('0949d612f95a61b089acbd566e4907c6fd6679cf2382308695bd58804b80051332eb46442605c151', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 20:51:06', '2022-08-09 20:51:06', '2023-08-09 16:51:06'),
('0a5fbdf24c7fde1a68c8b7d1be8ada69bbfb70987d39131d4c511200ea317a72809ddbd9e7774cb0', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 03:54:13', '2023-08-10 03:54:13', '2024-08-09 23:54:13'),
('0a80204c3c7225fbfa8cb643e380838f0fb8ebd6064ababdeb147089e852d635fdce59de7209becb', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 18:15:45', '2023-08-11 18:15:45', '2024-08-11 14:15:45'),
('0ac0834ba0eeb4b7878f3dbac1eb4bba747d171c1d69d308657f02113c7beedf34c4b715eeef2727', 48, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-15 18:40:00', '2022-12-15 18:40:00', '2023-12-15 13:40:00'),
('0aff96a295c95c23d0c92e51c9b7fa575bb5f5bb1599d0f830d80e31f609f45e94fc2f6411a64f56', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 15:07:07', '2022-03-27 15:07:07', '2023-03-27 11:07:07'),
('0b5ef4b241338f65988775ca21c7b4d07d8a4f0035b80be041640910107c5d1ac3e4023193cbcc0a', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-02 12:38:20', '2023-09-02 12:38:20', '2024-09-02 08:38:20'),
('0b689aa23a4955f923aa8e5171e561958364ebb171ed645d1f12ac0059eece9c9a353bb9ebc9cf15', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 09:19:15', '2023-09-03 09:19:15', '2024-09-03 05:19:15'),
('0bc71b2693faf97b277134f621d3737c936917ca664972ec0de3a3d715dee43989ddbcd1fb4f202c', 12, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 20:23:32', '2022-03-25 20:23:32', '2023-03-25 16:23:32'),
('0c1dfcc16c6b1d29be0d45cad66e9786a5c0bd9d4c25b89548970c891f1764e462f62164d1ee253e', 58, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-21 10:53:17', '2023-08-21 10:53:17', '2024-08-21 06:53:17'),
('0d18ea8c8ae635c3153aa84d51c735d1cc572000a642eb55153ccd0c26f404d85655a2f3b7dde1d1', 35, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-15 13:42:18', '2022-08-15 13:42:18', '2023-08-15 09:42:18'),
('0dc09058c56514d84c0d8d6638a35e9aba92be6199f12606c55082b816407bee6ec1bbdeb7fffbf0', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 11:56:49', '2022-06-04 11:56:49', '2023-06-04 07:56:49'),
('0e8cb0133beb3346ab7f495df9832adc65e2ff757f8c12f07f103d5e5a204f243f9b2a39882b5fbe', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-23 15:33:16', '2022-07-23 15:33:16', '2023-07-23 11:33:16'),
('104a6cd3e590e06f7177d0e43a45aa1bed1d45b67aa3e23f397dd282fac7368d1d3392eac2f4f3b9', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 07:35:22', '2022-06-05 07:35:22', '2023-06-05 03:35:22'),
('1086d8f43a9dd3055bac98dd2ae44bdebc681cee7e9f3c526e785fc01ec6e258887b3e2f3c7e39be', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:35:20', '2022-06-03 18:35:20', '2023-06-03 14:35:20'),
('10b21ed942b3284e6f728b8b6b11a5e59a14cd810ac6ced84969c59708c0c20e1edd7733baefe023', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:46:24', '2023-03-27 19:46:24', '2024-03-27 15:46:24'),
('1176c727620726fdbfd02d11d4ce57cdba5e19255a86f13ad8c5ea95fec75735d093db9715298c1d', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-03 08:09:20', '2022-08-03 08:09:20', '2023-08-03 04:09:20'),
('1181439f8543380f3f91c44b8910ec1b6b1a392d3be2bdf25b41d2c3db2809ab6d2311d82044e20d', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-04-29 21:26:32', '2022-04-29 21:26:32', '2023-04-29 17:26:32'),
('1312180d415ff42858c5011dcbd7632265a4049ee63cee75afc86cee5acdebf3520161ab8532e069', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 20:08:55', '2022-12-13 20:08:55', '2023-12-13 15:08:55'),
('13f3568f85d325cb152809ac17fa31e153a1a9c5834c1230f994895bf81cc2f77d15a7e031faa6c0', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:01:50', '2022-06-04 12:01:50', '2023-06-04 08:01:50'),
('143ebcde3cb080664db2f1f3a7f87b53c56648abc7de0933e7faa4c68f3855cc2843adf300c8fb92', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:20:51', '2022-06-03 18:20:51', '2023-06-03 14:20:51'),
('1489b7e3eb5c2b71d3c0234856338cf71c1022c73343bb4375640e5a1baff7af491de0fbafac943b', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:11:42', '2022-06-04 14:11:42', '2023-06-04 10:11:42'),
('1527e7b6eda5bd526b16573e19709382722478e901aed1059086bb3658bbf8678ec886f3bc6af655', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:04:00', '2022-06-05 09:04:00', '2023-06-05 05:04:00'),
('154b75eaedfafedd943e142e70444919f92d1103d6a9682c0ee6f24d3052f861ea8e09ef1c4738ef', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:45:53', '2022-06-04 13:45:53', '2023-06-04 09:45:53'),
('18ce5ddd82b2f43b943fccf4c0213a65698b2feeb7faa0a6455a774fdcf2cf76861ca93a4cb4758c', 21, 1, 'Laravel Password Grant Client', '[]', 0, '2022-04-22 23:01:30', '2022-04-22 23:01:30', '2023-04-22 19:01:30'),
('1b53038ea60e21f296130a6b28de7b6322297a102a82c1487c5e3ecbe2925267ad1259a1a3c1d66e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:25:32', '2022-06-04 14:25:32', '2023-06-04 10:25:32'),
('1bd036316ae5397fe041f57b9c0921daf13b6c23c4a4377ffd3700b2b01a1dc47651602d0faa821f', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-03 17:55:31', '2022-12-03 17:55:31', '2023-12-03 12:55:31'),
('1c3bc9888b2e35a7ca6b8a1dfc495c27b3dc38dedbb32867cfc26b52aa8371ece587cfa1ce9a6bda', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 19:34:49', '2022-06-10 19:34:49', '2023-06-10 15:34:49'),
('1c87ae4b90ad84e0a94313cdd190f05b8b7463a7de28dd842c8cf2dfa598dab02e6e02a6bbdd142a', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-21 06:02:01', '2022-05-21 06:02:01', '2023-05-21 02:02:01'),
('1cf8335fc03e269f5ef3eacdd2b345c6ff302d5edb77c020eb964ab509b00850df46348504d717d1', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 17:02:57', '2022-06-10 17:02:57', '2023-06-10 13:02:57'),
('1d4736d10e4edb7915488bc8e34aeb17bfb91bbf286d0a1f3644afd035e51f419a136114b6dd25cc', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 18:53:37', '2022-03-27 18:53:37', '2023-03-27 14:53:37'),
('1f1a9caf4e41e0ac965090125cb9a8a292cf84cb02d5c0ba2a78f35fbaf6cd8cde4201485155a31d', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 10:29:57', '2023-08-10 10:29:57', '2024-08-10 06:29:57'),
('1f84ea5ade3033d1314c98b0ad83af3674e6dee1376a0805d564fd69e2b315da039d2e25283b7cf9', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-16 17:50:21', '2022-08-16 17:50:21', '2023-08-16 13:50:21'),
('1fc8bf094eb374f203ac19ddbf16e64f4a94840da50eb5334e0ccf21f191eba0d6c9648250d367f0', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-06 09:28:53', '2022-06-06 09:28:53', '2023-06-06 05:28:53'),
('21316da31cfeed5bd6f8bcc9bb97e8f93392b6962b25f9720f6c0b78602ee2c1763deaf235ba5314', 53, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:47:41', '2023-03-30 21:47:41', '2024-03-30 17:47:41'),
('220d5a6c10ecb9eab1b8bc90d99583b40bbf60dbc89edae123902f828bff09492094325f6763d7f1', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:09:42', '2022-06-05 09:09:42', '2023-06-05 05:09:42'),
('2589cd08eeaba7de6a95fd710b85da3550290ec9e77d15492f2787f5423598a604845e82b63f010f', 55, 1, 'Laravel Password Grant Client', '[]', 0, '2023-05-30 04:50:07', '2023-05-30 04:50:07', '2024-05-30 00:50:07'),
('27864513e73f4b05fe07ddcad84b43a105fe7f84786ef0ae6bb2d04c8a425156768a25ac4c3ff437', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 19:01:50', '2022-08-09 19:01:50', '2023-08-09 15:01:50'),
('280f19c6b93133f3175e6ed5144c369778071eafe80cce85051befcee800417551105f674cf3fbc9', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 20:43:19', '2022-03-25 20:43:19', '2023-03-25 16:43:19'),
('299dd54117302e3f46362d2a3f8a5e51cc3cb392353f9b33f75e5e5c411e3f8d4f2f6abdfaeb8805', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-13 11:24:51', '2022-03-13 11:24:51', '2023-03-13 07:24:51'),
('2a4da4fe3ed27e687f431cbd67a779117b026021b94705e9f1a2e823bdfabb56c1f348a9b7e4244e', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 20:02:17', '2022-12-13 20:02:17', '2023-12-13 15:02:17'),
('2b6b9c6bda34039e1394018ce26a8cd9c0a3adf94ec15b21aae259142d7c6891e489b4b6fc362f84', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-08 22:16:28', '2022-06-08 22:16:28', '2023-06-08 18:16:28'),
('2bdfd4b61c66af58b181ff1ed52f92c7bbf17d46bd93b0f6c2729a17a54ff3d90ee056283e2d84a5', 52, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:05:39', '2023-03-30 21:05:39', '2024-03-30 17:05:39'),
('2c8a7c8783bb883587b74e80bc187cb19a51afb5041c1ab10942f6280d8049b39b965fa3cd7cd1ff', 66, 1, 'Laravel Password Grant Client', '[]', 0, '2024-11-06 17:27:09', '2024-11-06 17:27:09', '2025-11-06 12:27:09'),
('2ccd3dd4c0670b874e554031a2401cf0e8010e9ff38b5a7e36dfa6dc5d7a17f961dc42d96694a770', 3, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-06 12:46:06', '2023-08-06 12:46:06', '2024-08-06 08:46:06'),
('2f0630e5fef321a7b9c6d7238424eda5e6fd3850d165efd5412afd4e9911fb98a037a98e1e6ad596', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 18:08:19', '2023-03-27 18:08:19', '2024-03-27 14:08:19'),
('30093c9928f19c1b9dd194a93a7696eccfde57094d00d3f06a3a1db3a52e3b0cc0bfbae9ebb3f4b7', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-02 12:37:48', '2023-09-02 12:37:48', '2024-09-02 08:37:48'),
('3052322fc65f0b2758ccc53b38d7d8d0593af80b5d3c6e002cf9ff22aeb00442e82ef5fd85011d82', 11, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:51:13', '2022-03-25 12:51:13', '2023-03-25 08:51:13'),
('309cd8fe752cc34ae3ac45151702d03192ca3c7d4ddd32a2be06043d5f7a5df90bc3b418f95fe0b1', 3, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-06 17:23:30', '2023-08-06 17:23:30', '2024-08-06 13:23:30'),
('317a109e8ec38a1ee53565b8139c3a997b30708f943b906ebd8382549d4128e02f02db72a908830d', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-09-18 14:03:48', '2022-09-18 14:03:48', '2023-09-18 10:03:48'),
('32d03569117af98d12a09982fca2d6a084d3bae08b1ed808ed1486e19eacb7a00d250f90b4a26f0d', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-04 13:19:14', '2023-09-04 13:19:14', '2024-09-04 09:19:14'),
('3301e333c297a870cbdcee30aedde4d56e116b505b092b0c778b48d4a6b821c6a37f503fe799a115', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-16 18:58:21', '2024-05-16 18:58:21', '2025-05-16 14:58:21'),
('33106fa7bb1f24b766dd9fde5d1639f6f16b2f102ea3a4c9674e56f961009d8b9b67ccaf99ed06fb', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:43:06', '2023-03-27 19:43:06', '2024-03-27 15:43:06'),
('3387b9e64daf33eaf3c8d83d70679b1e3884778350dae3d90381a7ebf766f41492363ef14f1d96ad', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-28 18:51:53', '2023-08-28 18:51:53', '2024-08-28 14:51:53'),
('33a98fe2591d4dc9ee16579a31409ea1d8cb508f6cf0afea2cea76a67d697f5b28474e7cd01cfe68', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:17:52', '2023-03-27 19:17:52', '2024-03-27 15:17:52'),
('33c2f93ddd39d873ce3b14112a194a347d7ebfab79a79dea0150f8c1904efbff4baf611cbf5ac34b', 64, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 09:30:40', '2023-09-03 09:30:40', '2024-09-03 05:30:40'),
('3433a29d947cb34908a7b9f915d87c472d5480d0f370bcf02defd5c8f17c44cf4fbf3e9c77f484ad', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:13:12', '2022-06-04 14:13:12', '2023-06-04 10:13:12'),
('34f54b25fa5d2f3ac4be4dc25b8880c95d9eb185bd1507eec73513e9c2d939c445134a2c03feae3e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:23:14', '2022-06-03 18:23:14', '2023-06-03 14:23:14'),
('3516c4948a5e0b566ab363aa6037375b7226f952a7b5397388c9edd52ee7586ea17d9f9bca86915c', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-16 18:53:53', '2024-05-16 18:53:53', '2025-05-16 14:53:53'),
('35210273679e2dd0919a0c75656d18a4dadcd33877c6286ad970dd312602593869460d8b9c74e3d3', 14, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 15:05:47', '2022-03-27 15:05:47', '2023-03-27 11:05:47'),
('35336afd80efcec709cefb759eb6be328f7ce5b1ab37501aff5d20a06e0f59c41bb6162507144327', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 18:06:05', '2022-06-13 18:06:05', '2023-06-13 14:06:05'),
('3658e08f17f328adb36e13ae53e90294226b45ab1fb6987145179247dbfcf445173eda015004ff3e', 39, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 18:19:12', '2022-12-13 18:19:12', '2023-12-13 13:19:12'),
('36c80d6a8ec48dbed419d0ca078a5b0c9e5952a13203dafaaaa82aeacd3cbd7add6b93d42e21890d', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 15:27:08', '2023-07-28 15:27:08', '2024-07-28 11:27:08'),
('37a669c179a2cb6d34d3d85d959cb27591c192e33f6c9623ed5c0486c0d8c3806dcbda6b50046f5a', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-31 15:51:21', '2022-12-31 15:51:21', '2023-12-31 10:51:21'),
('388bab6d11b2b59d7eb76efc42d138c2e0a5a8b9cf9d91e587d00ee838c3faabaffd3c17c0b7ffb8', 2, 1, 'Laravel Password Grant Client', '[]', 1, '2022-04-20 19:50:02', '2022-04-20 19:50:02', '2023-04-20 15:50:02'),
('3934a2e64a9b4fb8ac8173a65450ab4b0bbc451814fa5a2027b7e1541b91d24e5e1b1d0714a66eb0', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-14 13:46:04', '2022-08-14 13:46:04', '2023-08-14 09:46:04'),
('3958827b248c89046843a14fbb1a30f35fb9124b0cc202299275a2863c5d66bf9e7a9fb6dbbd8b83', 38, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-05 15:32:56', '2022-12-05 15:32:56', '2023-12-05 10:32:56'),
('3be079dfd8c484cc02945734bc7ca846a9f995472197b4493d97745746c76782bc5703028608d41a', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 21:14:50', '2022-03-25 21:14:50', '2023-03-25 17:14:50'),
('3bfadb564e3861d39206ae60318fd8e2423d1e3c092d0defdc485eaa8a19577196e179dd9caeddc6', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-02 06:52:12', '2022-06-02 06:52:12', '2023-06-02 02:52:12'),
('3c62a00f2d8c60cb2240bef60e219b2031234de35e4df99be9ff20a072be4f564135be2431bd30be', 60, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-13 12:47:56', '2023-08-13 12:47:56', '2024-08-13 08:47:56'),
('3c9c1d46cf9b384f103df02b2786423167fd7352131f9398acede302641aa6a138fc338fe2ad7f65', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:40:09', '2022-06-04 14:40:09', '2023-06-04 10:40:09'),
('3ca43ab16dc2607683b911083dc95ddcb1a4bf9d38fe32af7594bac36103aa0be3e2d28eb9fe46d0', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 17:06:17', '2022-06-10 17:06:17', '2023-06-10 13:06:17'),
('3d376b55eff2beb242ca08ef93e671c194f134b4efd56cb3109f02c97e3129f95e5dacfd2ae4625c', 58, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-13 12:25:28', '2023-08-13 12:25:28', '2024-08-13 08:25:28'),
('3d63422f0878ac6ac569281dc992d51c43e645f744c1e46071665cc6b227e074ae923f7367b04476', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:27:12', '2022-06-04 12:27:12', '2023-06-04 08:27:12'),
('3dee25294ec5c2e8a7bb5085684650ad5119e6fc1861733265f5b829706f78e7c9b6565def5c25bb', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2023-06-08 14:27:01', '2023-06-08 14:27:01', '2024-06-08 10:27:01'),
('3e8ea1913ba1bd21ca3b4bd5671be5e5c18f193da12921ac26c66a76b15918724cdde7caad782f78', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:18:29', '2023-03-27 19:18:29', '2024-03-27 15:18:29'),
('3fb24967e0b66113462ed50e787428732e52fa0725ef815bc7810678948c68d9d7452d080b8b2918', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-22 15:04:41', '2022-07-22 15:04:41', '2023-07-22 11:04:41'),
('423b3279fce8ab65273c0b04d1c3bf8781afcd5df5d3028a60aa13102c56ea7fe08c9a408a681a7f', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:19:19', '2022-06-04 12:19:19', '2023-06-04 08:19:19'),
('42a0ffa72aa3853ed686ad224b2fd574a72c9062e78b9c69bc616c8aa89cfaa8a412a5a97e672bca', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:08:58', '2022-06-04 12:08:58', '2023-06-04 08:08:58'),
('43ee920c6b48e8cb8dcaa1b15f43d35eaf58c2eb75cf1e28fc44c0f048d6069a72a7c8ca4e387648', 18, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 18:55:09', '2022-03-27 18:55:09', '2023-03-27 14:55:09'),
('43f2b6d93a80726caf9b2c5388383352dc48cc81be7c95d26b8e2986dfb83a902fcaca899b269a02', 39, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-15 18:38:14', '2022-12-15 18:38:14', '2023-12-15 13:38:14'),
('43fc1528d7234e8a7e8ad55f4fc4ddfad997c93f675e932e691d33ef551776e4bbcc91abc23f771c', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-11 23:07:12', '2022-08-11 23:07:12', '2023-08-11 19:07:12'),
('44c50abf3c67d0530e7d49e4d7ba93060177bd307c6dbf8db6a6f98c6550e2ae5d069911655b003f', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:20:41', '2022-06-04 12:20:41', '2023-06-04 08:20:41'),
('4726540d2f1ef42be3de505ad2eaf932b56f300a4f57319805e2ccb7239cbac9b24f63aa385a6e9e', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:00:27', '2023-03-30 21:00:27', '2024-03-30 17:00:27'),
('480f1b877f4488bfb69c179a33b3f1c1ee8164a3ed7136fe4d842420cf140197a59d4fa759acd64a', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 08:58:40', '2022-06-05 08:58:40', '2023-06-05 04:58:40'),
('484db78868f9c5aa59366b6eb3afc8f8acaf88c0f745d95c5d7ab68a3a092981c77fda4663207bfe', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:27:26', '2023-03-27 19:27:26', '2024-03-27 15:27:26'),
('49a4e5acc176f1e2626734226ad1ad027afcfda84eeb31142749dcb291cefac6b47aa030787174b9', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 09:56:08', '2023-08-10 09:56:08', '2024-08-10 05:56:08'),
('49b70777d45acaff053cba050e11cb46ef002400cb3e148d9efef1d40eabd9f6282c0c7a377da096', 47, 1, 'Laravel Password Grant Client', '[]', 0, '2023-10-03 08:23:20', '2023-10-03 08:23:20', '2024-10-03 04:23:20'),
('4a4e750cac673e6fad50840a410c9e049e91e1796c700ab003a279be6dda1e47970915b934fb15e3', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-06 20:38:22', '2022-06-06 20:38:22', '2023-06-06 16:38:22'),
('4b264596089139e2eedc8aa91bdb862b752bd9f262e1e56ad132db239d3869aeb3fc29811c1e9345', 39, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 20:22:10', '2022-12-13 20:22:10', '2023-12-13 15:22:10'),
('4cd3e572b15c1ba8586d01d4338abc332efc8753c7d77c46f4276933f9efe84c7edcb6580d16e187', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-16 15:21:18', '2022-08-16 15:21:18', '2023-08-16 11:21:18'),
('4da542587168d5bc2f01489b03339a7c8a62ed9258cab316c6b1fe6dd85f5b148efac3153917206b', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-02 21:43:40', '2022-06-02 21:43:40', '2023-06-02 17:43:40'),
('4e11b623035d5c4921869879324b68edf9841d56dfb7f9f019c7da6ffc4474156a06c41b21ac1108', 16, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 16:09:03', '2022-03-27 16:09:03', '2023-03-27 12:09:03'),
('4f9bbaf2ab854f56d86eb774caa9000053cc4e7ebb4d1def41fca143c113b9c1cce54affee864dde', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:05:45', '2022-03-25 12:05:45', '2023-03-25 08:05:45'),
('4fa7e2e588335bd75477ec7babdadbcaae2b186d08d5619ab8e39c50fe1220a56463fa35245314ad', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2024-05-16 18:57:00', '2024-05-16 18:57:00', '2025-05-16 14:57:00'),
('4fe74c36ae8f0824f03d2886b19591e7d08b9dcd3aff9607b4de18357bbf1c0047da367088a75963', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:03:12', '2022-06-05 09:03:12', '2023-06-05 05:03:12'),
('512cddd6f44b62e34d74ea71142f739f3547f248e0d81345e77393550c3c4c892143046ac29e95e7', 47, 1, 'Laravel Password Grant Client', '[]', 0, '2023-10-03 07:45:39', '2023-10-03 07:45:39', '2024-10-03 03:45:39'),
('52857a20186a1009bb9c6022e60c8854ba6dc66d614db2e9df217c9b8d9d93149ce9d3bb59157554', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 09:54:25', '2023-08-10 09:54:25', '2024-08-10 05:54:25'),
('52971d281301817a8846de645ad71bb828dbb7f6392f950e4eddfc81088e2b648761c3999ae1aadc', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:39:43', '2022-06-04 14:39:43', '2023-06-04 10:39:43'),
('52b937d6042b64df35bfb55c681caa7d262028634734d8a585bf6ca0f1605b8b626d475f8b58880b', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-06 21:06:07', '2022-06-06 21:06:07', '2023-06-06 17:06:07'),
('534a77fa8c8461e5543efd2ae76b20ac341d8dac8d2a3df2825e65253d48e6ab92cabcea228230ed', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:10:47', '2022-06-05 09:10:47', '2023-06-05 05:10:47'),
('54819c65d63de0f75984b15798952cef391e09193b48b3d164553e52c94ade81199fa3be40d78b47', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 16:37:03', '2022-06-05 16:37:03', '2023-06-05 12:37:03'),
('54a10c8c1609c74b7d949d7f52afb7951aaacdd570515893a1fbd75b5ffdc8ee995dcebca28d723c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 17:13:07', '2022-06-10 17:13:07', '2023-06-10 13:13:07'),
('554ff066d05c86eb44bde79614b351abaf9d8ea7e0628d1d42ab44656d6ab92e5eee35bf1df90d6b', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:14:56', '2022-06-03 18:14:56', '2023-06-03 14:14:56'),
('5565c127f9e69633259c31a9df2b75ae43eae632067fe1451c3c3c7a62ef1ff2b4032d9a5d0df659', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:48:12', '2022-06-03 18:48:12', '2023-06-03 14:48:12'),
('570453cddb1788f9ec5d61972f84c0165f8e432e546220e80c5e580d4f46ee7035af949604e5241c', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-08 16:00:20', '2022-08-08 16:00:20', '2023-08-08 12:00:20'),
('574dcd8540ec5f4b3e766122c097cf398050c9985572e32ba0ebf32f84e3f4e530c9137a87eba1a7', 39, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 18:19:17', '2022-12-13 18:19:17', '2023-12-13 13:19:17'),
('58d2330dd37e0119ff5c528ac9b063089b4d3eeb96cb7244c124c99e464b09c58326a7219b69e0ce', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-08 22:17:39', '2022-06-08 22:17:39', '2023-06-08 18:17:39'),
('5a0d3d8059dbebb60ce74b7f6d284b1b30a5b9dca54babeb3ed191bbdcaf535bb69d7eac415f898a', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 23:47:59', '2023-08-11 23:47:59', '2024-08-11 19:47:59'),
('5a6ee095e3d4c3c85442e825493ab975c9b2abfb338b8af812abc924bfeae4da1e77466d233eb37f', 18, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 18:55:58', '2022-03-27 18:55:58', '2023-03-27 14:55:58'),
('5af18fd8929e55d7185b2182036360dd80c061da7c2be890121f964bb9461f249ef30774e3bd3941', 62, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-28 19:40:22', '2023-08-28 19:40:22', '2024-08-28 15:40:22'),
('5bc9446157ad937beaa8d52cccf7b7d8dab67e2adc82a089d90f72c9a96b3bf8acce496f08f62510', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:19:48', '2023-03-27 19:19:48', '2024-03-27 15:19:48'),
('5d2312b75f27a123d134ca504bcbb6596d38f2abbe098cf8562e9a558f218743728b6a768513c348', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-02 08:16:48', '2022-06-02 08:16:48', '2023-06-02 04:16:48'),
('5d30871d68ca5f3b27c67a030ef81e04d1b2580a0d7066866e2ebe0179d06cb09e14b412c259db3f', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 18:26:56', '2022-06-13 18:26:56', '2023-06-13 14:26:56'),
('5d6ed1839a1208cea7102f0e7f01a7ad1e952449e717c6f8a3d80a10f92640b6adf3ce7a1a93e350', 56, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-04 18:07:06', '2023-07-04 18:07:06', '2024-07-04 14:07:06'),
('5e218d9af7414be5dbc2f09558a8a9306422f8b7d37ae6cafc5f48bb85c3bda0dcc36ab99965915c', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-06 18:14:36', '2023-03-06 18:14:36', '2024-03-06 13:14:36'),
('5f9891558f23ef479b74acd00cdbb06fd25459510b62be48bd064a4feea1fc10866a5594bbaebf6c', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 15:53:32', '2023-07-28 15:53:32', '2024-07-28 11:53:32'),
('61bb47bc47ea506f1560f735a47911822380a62fb655787c289ff61bc6baede3ddf14ce6acfd9141', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 19:01:51', '2022-08-09 19:01:51', '2023-08-09 15:01:51'),
('61f0846620b849650a173b8d7a2be7757a021e2bab5347eca69c342d0973906c56618e322d7d83e0', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 18:43:26', '2022-03-27 18:43:26', '2023-03-27 14:43:26'),
('62732439934cd8d35326425bb9aed2494d4b643017fad2aa981438d9cb40a748e8e568406c10549e', 61, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-13 12:49:44', '2023-08-13 12:49:44', '2024-08-13 08:49:44'),
('62cc9ef8f19fc9f709c5982aa5c80c299e6ae7ea9bf414627118e84642eae4625052ca6330823aea', 5, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-24 19:45:26', '2022-03-24 19:45:26', '2023-03-24 15:45:26'),
('64526ae771bd96d185120c95ba79a3c1cbcebee37b950c64b28abb8099153953a86ef571ec5c4473', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-04-10 15:19:34', '2022-04-10 15:19:34', '2023-04-10 11:19:34'),
('6677b6c6adf87efa72aa89fc9a171bee6279d70d5595216ef010a9732b02298b94e20e7f1228ffdc', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 18:58:12', '2022-12-13 18:58:12', '2023-12-13 13:58:12'),
('66b5bf98866304c94fd508a5e51248b121e4bfce828b916440679b5daae70d0ea311bb9bec57a875', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 06:43:27', '2023-08-10 06:43:27', '2024-08-10 02:43:27'),
('673666470527167136c0eec97076681775e3c90e22021197f41b6183ddc96b9c87116db2994f30c4', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 18:12:52', '2023-08-11 18:12:52', '2024-08-11 14:12:52'),
('686166ea9cb839f982368c250d3c537f6ff52a3ccc7961a15c922cd3f646ef0ef93d86af40743b2c', 8, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:18:24', '2022-03-25 12:18:24', '2023-03-25 08:18:24'),
('688b4ea3914225ca4a25a20c570df43fd2d8b66a340a146ff2e0578c44c0aa1cef9a4ba10ab09319', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 13:44:17', '2023-07-28 13:44:17', '2024-07-28 09:44:17'),
('68aa2df2d35501f0bea8ae1fceb2861ecf7772ddc62f52a24b69756bd7d0b1a08b09cac52975026c', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-04-23 18:49:48', '2022-04-23 18:49:48', '2023-04-23 14:49:48'),
('69a374d5c005c34c14c870a1ca0d19ad9d338fad66c8418c50feb9aa6e6d2599cecd100eaf77b63a', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-03 17:56:53', '2022-12-03 17:56:53', '2023-12-03 12:56:53'),
('69c511e3f76cc6e5e92d847f423f8e8922e10cf57442d76814c80df9fa54c5068e0bd210835c3cd1', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:47:41', '2022-06-04 13:47:41', '2023-06-04 09:47:41'),
('6a44634718dbf509ee37cdcbb15c2c43d52d7b4a58ea52419c75c8dbb5f8f9619241017adc672789', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:05:03', '2022-03-25 12:05:03', '2023-03-25 08:05:03'),
('6c29b89bac839360d840ba6968317f3af3b3203280c4308d8c41a179d1eefe8332311e113728fdf1', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:15:52', '2022-06-03 18:15:52', '2023-06-03 14:15:52'),
('6cd9f270cd9637c46fa9d3c4e18d53ff5c059d95062a4afea6234f67d09f7ba5f4a836f3c7a6aecd', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-22 15:04:38', '2022-07-22 15:04:38', '2023-07-22 11:04:38'),
('6db5eb96d13f518f4ef0931940aa49c6606bacd08fea5b33d7a3bb5cb472ee5b5aeea90837ef6fe5', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-06 18:13:42', '2023-03-06 18:13:42', '2024-03-06 13:13:42'),
('6e6bcb864d97030eb05340ce1fdc542a77daa81913f164b7750ca88a40b0659a5860c72bd657c117', 5, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-24 19:42:12', '2022-03-24 19:42:12', '2023-03-24 15:42:12'),
('70993c180097f03e58a6a0ce439888fe8d8ed81da54ea30a742b004af95f6e55fcf026e8c6373143', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 18:16:36', '2023-08-11 18:16:36', '2024-08-11 14:16:36'),
('70b137f9d3e61a5de760cc03464c56f27e32e4df725dcd0d44401faf7acde81958c9fe27c6500698', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-13 11:24:32', '2022-03-13 11:24:32', '2023-03-13 07:24:32'),
('71d487243af2317a8306c5de682599a40c624fde8d4ade5401488d33f7d4013cdd12b30b5c2f7573', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 16:59:36', '2022-06-10 16:59:36', '2023-06-10 12:59:36'),
('731e967876d7fb84ee32384b820b9bc75a0c5007eef372642b07d8af28c46d012695f63932a89942', 58, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-21 10:54:30', '2023-08-21 10:54:30', '2024-08-21 06:54:30'),
('768e599e1a1fb28cb464eefa3382a1d9f6d3f0a92c1deb5f6e4683bcbb91d14268e59f02c6939848', 3, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-06 17:24:58', '2023-08-06 17:24:58', '2024-08-06 13:24:58'),
('76c8cf99e83b67925311bb7b3ecce261319cf8d201975efd7047a5c6e30b0f6fd16085e78f3d1123', 6, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 11:47:08', '2022-03-27 11:47:08', '2023-03-27 07:47:08'),
('773e78e2ddb1dceea1cf5d92a1613f1623a27df4cd6bc20e381ff3700ea96ea66dded61445bd3a92', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 18:14:51', '2023-08-11 18:14:51', '2024-08-11 14:14:51'),
('79c536ce3281332c0edbeade7cd09265e6c1c5c4dc029980f61a7ea4e5d5293aa7570a9e0eb32cbc', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:00:41', '2022-06-04 14:00:41', '2023-06-04 10:00:41'),
('7a0299b41b0ea89744d3aa140517e2c63d1fe29074307948023f36badfc8bca623be367e6a50d460', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-09 12:07:05', '2022-12-09 12:07:05', '2023-12-09 07:07:05'),
('7b08f327cdeb8aeb447cd6c2c3c5f5e0b66f9fa792d9eefc74e83e02e38353233b0e79870729ff07', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-08 21:08:48', '2022-06-08 21:08:48', '2023-06-08 17:08:48'),
('7bbfc9be198d2dd4dc8f392d41a601943880f2dfab63209c4745f45c0f8cbfbb87393d3b86ae350c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:03:17', '2022-06-05 09:03:17', '2023-06-05 05:03:17'),
('7c2471dbb615a03280ecef73091860f47d9fa11e2bd44c24c1d2ed33898eed0db981646f3d460000', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-11 12:14:34', '2022-08-11 12:14:34', '2023-08-11 08:14:34'),
('7d30363676f7858dd9781e4f84f430384abde559ceb0ec62d34f0b69326a640e3261d21ef9718d31', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-29 19:13:05', '2023-03-29 19:13:05', '2024-03-29 15:13:05'),
('7d61896937f7561550a02ddfbe6094f9fa4d52269fd8ef83d33caa36e256554fd5d013b1506d0cdd', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 07:57:07', '2022-06-05 07:57:07', '2023-06-05 03:57:07'),
('7d7a470bd5c1069c7c38443aa4369ddb5dcd6d4cf5c5a83a28f3072fb9d409537cfce1fda6f56838', 61, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-13 12:49:13', '2023-08-13 12:49:13', '2024-08-13 08:49:13'),
('7d9801117621b145e897cee480829a9f90eab0186f1cd6e0734eabc969ea26734db7c285e2221154', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 18:07:14', '2022-06-13 18:07:14', '2023-06-13 14:07:14'),
('7dc05e979d67fe56b91b070dffcf6eabdb411586918a042f8cece1db98c28bef4b2953ba0a7685fe', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-02 09:01:27', '2022-05-02 09:01:27', '2023-05-02 05:01:27'),
('7ec957f8a7990e273c81c703c3488141d4fd03f064f168325d98e7c95ac0c6f07e7524e18e81bd1d', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 06:11:30', '2023-08-10 06:11:30', '2024-08-10 02:11:30'),
('7fbc05dc6752183e21bfb0cf267f66c3a9d0ece2d9f9ae156a90816e882f68c0ee1dd1b8f40efb46', 53, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:47:35', '2023-03-30 21:47:35', '2024-03-30 17:47:35'),
('80249b3fdc4659301df8318343ac9dfb479918db857747363880453692db5cce66910088e3a3b38e', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:37:56', '2022-06-04 13:37:56', '2023-06-04 09:37:56'),
('805e5ad65bab0b6bc858dc60bee6f0bd4821f07f5eb6c6259b726cd196af31217706973177779565', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-02 21:44:41', '2022-06-02 21:44:41', '2023-06-02 17:44:41'),
('8126976787608bdfc476299d556f3b6f18adac3f40548c88aaa6a9a221de091e985b608225a5318b', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:15:22', '2022-06-04 14:15:22', '2023-06-04 10:15:22'),
('85014c7474a81c54e990574d59b7131d5b51492c7805d2c70c5146d9f208c927c439941e1c1ec53c', 56, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-24 04:29:43', '2023-08-24 04:29:43', '2024-08-24 00:29:43'),
('86e1b80d2c47db3c81707ab293a0dae13cd9de393268ad360610a5e512e69a74c2cf5d7c3428019a', 54, 1, 'Laravel Password Grant Client', '[]', 1, '2023-04-03 14:10:03', '2023-04-03 14:10:03', '2024-04-03 10:10:03'),
('889818182d3d8c581a7695aa054183c68b48d230547dd27556fb1a9e35dcf33429e9e24ecce4d919', 34, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-13 15:36:44', '2022-07-13 15:36:44', '2023-07-13 11:36:44'),
('88c2c551559503fd5a00bf80a213d8effacf38fe18607f8ff8f92d1029e727469ec7e6e4489b6fbf', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-06 17:58:49', '2022-06-06 17:58:49', '2023-06-06 13:58:49'),
('89147fb6e6bf6cdada797bf9e21d4bccfbce32c3ea9b2fdc6d2cfa70e813532cc37a710807e5b3e6', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:02:30', '2022-06-04 12:02:30', '2023-06-04 08:02:30'),
('8a4b25849b1adcaa6a2645c109c0ffb2987c44942d309a9db96fb05e3c89f0e25c2d49154350b91e', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-31 18:54:05', '2023-03-31 18:54:05', '2024-03-31 14:54:05'),
('8ab5e9f93b03fa198bb9639fe80eb3b1b70407f7c6fff4df18b0a5f30e0b1c16431d84cc14bf23e9', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 14:31:20', '2023-07-28 14:31:20', '2024-07-28 10:31:20'),
('8b3a3b2ed97fff2c4e5512262f56b217da1d6a670a11abc817dcd7f6b1af7a86967a5ca2d8a16474', 19, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-28 17:30:40', '2022-03-28 17:30:40', '2023-03-28 13:30:40'),
('8ba734af6b11acef1bc687dff680e4600b6b212030dbc1d71e34317922026e4d351e1f59d1d1345a', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 20:09:02', '2023-03-27 20:09:02', '2024-03-27 16:09:02'),
('8d85133aba481d7ad321c1191469d9cae1d9a5baccead7e808fb01680d09bcfdef3036504f5a261a', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-23 15:13:10', '2022-07-23 15:13:10', '2023-07-23 11:13:10'),
('8e03caebd40e4fb7f9da8ad39ded0b11dbb08c5bb570ffada8f1ca6ae70e247b8280742a0bf4b64e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:59:46', '2022-06-03 17:59:46', '2023-06-03 13:59:46'),
('8ea86d1149b35d4f7f2ea8fd83f58c9a3106a6773031a3762ef2ada93a8ccaa2f64a5033119a0d6a', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 11:50:58', '2022-06-04 11:50:58', '2023-06-04 07:50:58'),
('8f3e8b08e043ec7ad3b1f1c4d816fa8b05ad594d12e52e4907a799e416259b1b173ab283165f7490', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-14 16:53:10', '2022-08-14 16:53:10', '2023-08-14 12:53:10'),
('90c79dd86b9140e3dd526456a22a6e8a34ed3a75f8998b47148a616691d17e90371abc665d3aabbf', 16, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 16:09:56', '2022-03-27 16:09:56', '2023-03-27 12:09:56'),
('9102300b5994b81b311f5e8687a008b93abdf7a31852f76279fd43af2a6fbf75b4b8aa859a620eef', 19, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-28 17:30:49', '2022-03-28 17:30:49', '2023-03-28 13:30:49'),
('9126276b0316d9c66041cad42000387cc2cbc7d571a3c35ad8521c070de86ef47e116a5ae326092f', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-08 06:18:21', '2022-06-08 06:18:21', '2023-06-08 02:18:21'),
('913ee28aa2656204932814b1f2092b5535e7665f9c3c8f0c8a9e3d8dc053eae34c619cb63517ac0b', 38, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-05 15:32:35', '2022-12-05 15:32:35', '2023-12-05 10:32:35'),
('9278e1fe6138d3d1c67fa0f75033854a529acb049ed57710a200d360b7962959ac3fba5195bee775', 7, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:08:21', '2022-03-25 12:08:21', '2023-03-25 08:08:21'),
('92ca07d3d1609278d62e49e937b086232cf5573774ba78f659ae9c8e0dc669470e30846f912cb0c5', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 05:52:25', '2023-08-10 05:52:25', '2024-08-10 01:52:25'),
('9350405e060eb421b6500ba7fc16963aa851d70139b008b35ea00ca905c667a16736c66064acb0d4', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-30 13:29:20', '2023-08-30 13:29:20', '2024-08-30 09:29:20'),
('94a98b4edb62d55b22fc31a76a7ee886d3ed1c5b3a8b9f9e3fb25d61d2186c35e2a881ef8bc0c308', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 10:27:52', '2023-09-03 10:27:52', '2024-09-03 06:27:52'),
('9563ef4518074b9ffe0a9f544cb28ff9e3c0f91e63dd476bc4440d1634b63083e31feaf834950484', 39, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 18:37:47', '2022-12-13 18:37:47', '2023-12-13 13:37:47'),
('956e0648a79d4bab1dc5c4b2a504326970a0c106fe6fd21f980b2ce38e8704a736014c0f6bfacfed', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:22:11', '2022-06-04 12:22:11', '2023-06-04 08:22:11'),
('95c374a00b62eccc0a870574252c0e16b06ce140ffc373f82c583f7230d3d5c0d7c788808c0d16f4', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 19:37:06', '2022-06-03 19:37:06', '2023-06-03 15:37:06'),
('9774aadb3d386d61dd3806c676da4dc2957be5c6b84d1722cee070cc6d03d006785304a29abb132d', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 14:56:40', '2022-03-27 14:56:40', '2023-03-27 10:56:40'),
('9774af717aa09cbf1e18a65025e5abecf0bcad13a5cb95f99f3412ac780c608459f64d03096af3f7', 25, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 17:11:28', '2022-06-10 17:11:28', '2023-06-10 13:11:28'),
('97c840e4dd91ca0c3a8dd461300e247d7d2590c4d37e0b051338e5d33d622595214c0820c0ac2a6c', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-11 12:23:32', '2023-03-11 12:23:32', '2024-03-11 07:23:32'),
('9893e4a1f48fbdf79b6b6346d0b83cfa68bf970c74e0a72b4f92245a72c0ac4eda0a6616f7a7a9ed', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-06 07:23:01', '2022-06-06 07:23:01', '2023-06-06 03:23:01'),
('9909e4eda4dfa0c9cc353ffa62234ec71521b1fb555912aff4b44eaee06cac7c9a14d8d1f2f5ab90', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 20:45:40', '2022-08-09 20:45:40', '2023-08-09 16:45:40'),
('99c8c7aedf5a0641b2f8924110be1e93608b627107e3e2dda52bbf5090ce41746631fc0b87918f76', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:45:11', '2022-06-04 12:45:11', '2023-06-04 08:45:11'),
('99f0aa4ce937c14347df865ec06668f4a96b84dbf14da3bc255530240a0c1ab0d65c8338ad0687d2', 3, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-06 13:46:55', '2023-08-06 13:46:55', '2024-08-06 09:46:55'),
('9a38df924b3763ecdd2c25699a6aeb05c61b55f6acc0ab35a2863b78684402e8bd764e50b54cf3fc', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:13:38', '2022-06-04 14:13:38', '2023-06-04 10:13:38'),
('9a4bcbe7655f5f6b7901f8ec9da4edd05721162cc0bc79142326cb5030060018406d88a0d7a9840a', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-28 18:25:39', '2023-03-28 18:25:39', '2024-03-28 14:25:39'),
('9b529c833ad751f6a23fae1b4c5aa9e380a063a621d1a6c769b021d4857c35cb0e354e4cba1ea234', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-31 18:53:02', '2023-03-31 18:53:02', '2024-03-31 14:53:02'),
('9b692554af6519d646c783d0e5974e4515dacd1868e89010b69367b6b7067c0ae131aeeff224b261', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-03 09:00:14', '2022-08-03 09:00:14', '2023-08-03 05:00:14'),
('9b9df2a50201ed62b7bcfcb7a0ec2e36b237ce66c564e8d7b38417aa77189a178e1a6a0fbf42e426', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 15:03:21', '2022-03-27 15:03:21', '2023-03-27 11:03:21'),
('9cfbc4ae16a9d34b715a92f167e44468539297b1278ade637cf851c217bf469f2f7e343dbbfece37', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:00:57', '2022-06-04 12:00:57', '2023-06-04 08:00:57'),
('9e7deb828b23a3930162171497bfb8ccb02a3067dc098f6588e7f9b74c826533093c49f498fbd030', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-07-28 13:43:51', '2023-07-28 13:43:51', '2024-07-28 09:43:51'),
('9f2eb186dd9e13e57b50f83a5f8ef43dd1ae1ab2106e09a51935b8c53f7974b47dab59a343614709', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 17:28:27', '2022-06-04 17:28:27', '2023-06-04 13:28:27'),
('9f8fd57d1c84ecfb1dc30504ec8d8b37fa32f814aa224d7d825f871b01594627db0ee833b96b0a11', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 11:56:44', '2022-06-04 11:56:44', '2023-06-04 07:56:44'),
('a0f05cdbebe2f9ac2f2d49dd6019feffb5c7b566b12cb87d1952962a605ed63baed20c41ab7e23c9', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 20:28:36', '2022-03-25 20:28:36', '2023-03-25 16:28:36'),
('a1d791fae4e3a7e290302cb611f6c5bac7850d51ec16bbf7001bbba13e8546c3a4a81649409475c4', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:17:16', '2022-06-04 14:17:16', '2023-06-04 10:17:16'),
('a28a04f4d470ebc8c8aef7dfdebfe4244230fd7f485fc62a3a97b09413ff96d811cc18377e91c5cc', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:03:49', '2022-06-04 12:03:49', '2023-06-04 08:03:49'),
('a3ffe24b8df30a58f36decea08677dabe136d7c3d962c8b5bca4599182f305bc082fff651e6064c7', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 15:33:49', '2023-07-28 15:33:49', '2024-07-28 11:33:49'),
('a70fc8c9d109a6a7fd83adbbc09730b8923c7dfd00d2d0c02b1b4551957caa1ab0c098b0b78d77a2', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:49:14', '2022-06-03 17:49:14', '2023-06-03 13:49:14'),
('a7ecb70aa6642fa000afd4efcc2990d94f9926671a11521ca0d3740167a176cc4a6a888fc5880c12', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:06:40', '2022-06-05 09:06:40', '2023-06-05 05:06:40'),
('a80e97eacb58b16b41d79bf210211906466cd068ec899d744f9488f3c72fd63718092e6314b2322c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:01:58', '2022-06-04 12:01:58', '2023-06-04 08:01:58'),
('a8242afa883f4ab53864bbd6b8b16db622872d9cb3f725d142b510ab45a9fd99314a4b6b2e5b4516', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 08:03:02', '2022-06-05 08:03:02', '2023-06-05 04:03:02'),
('a83c7f0b2f2cf038039b8aec52c4df888d8c5c1e73763731cdb75d0bd5b821f4b164c0a50e376f0e', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 15:39:04', '2023-07-28 15:39:04', '2024-07-28 11:39:04'),
('a8783e2d155202c2d80a54552cd518b677d6fbd046966b2186bc9716a10181656937b97ea0194288', 38, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-05 15:53:43', '2022-12-05 15:53:43', '2023-12-05 10:53:43'),
('aaaaa833ba8a4151f40969b83ffa1d1499c1940dba0fc64dcaa5d7530191f438a86dc1170b74d560', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 15:25:29', '2023-07-28 15:25:29', '2024-07-28 11:25:29'),
('aac73a3ee09fd469fd12699c5238881fe2d06507f6da7340daf6f3372078db68fa80f55852557e43', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-31 18:45:07', '2023-03-31 18:45:07', '2024-03-31 14:45:07'),
('ad5ad0152ff17e0267df1e19541685d68c3f6445b1f974569278582de624b0fcc38476761258b9c1', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2023-02-23 10:01:12', '2023-02-23 10:01:12', '2024-02-23 05:01:12'),
('ad653b2e2eba43af9889baf84033e6480feae447381776bfe2ffc904c126f2503c05ac788d9cd740', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-11 23:50:58', '2023-08-11 23:50:58', '2024-08-11 19:50:58'),
('ae124c69b49a5cd0560c7848721deeee6e258f0b146764eafc983caf92ecdda532916f43834268e0', 59, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-13 12:29:51', '2023-08-13 12:29:51', '2024-08-13 08:29:51'),
('aeeb28d8b45dd6863a2cafafc577455b540585265edd31b4ec790c3e00bf5fcee51a2a09943325b0', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:44:24', '2023-03-30 21:44:24', '2024-03-30 17:44:24'),
('af1004b2b1c2974b993b3e6419ae811330486aedca7137ba4bfe79a06b6446749d25eebf774f5497', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:13:46', '2022-06-04 14:13:46', '2023-06-04 10:13:46'),
('af2259779e0699ba010f567e8033d3146400104bb0b26da6c7a14f0409e71ee94229bb431600b200', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:25:04', '2022-06-04 13:25:04', '2023-06-04 09:25:04'),
('af2fc481f27627c104a3f10a0d68985743e27d6a59f1248079352037c0aa8722ad04ae23e358f6aa', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-11 21:34:57', '2022-08-11 21:34:57', '2023-08-11 17:34:57'),
('afdc7c2f7c47811d97bb24481de025e050ee1a223adfcd54750610dc48342cf0a21c5d9fce5c8185', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:25:04', '2022-06-04 13:25:04', '2023-06-04 09:25:04'),
('aff9903491a76c4bfc84ba9d320bc9c80cbb3f2fd0c3076eb3300a9e1dba96770d2644cdb055ddcb', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 20:44:02', '2022-03-25 20:44:02', '2023-03-25 16:44:02'),
('b01c6106215ed89ab91453ff076355c44481c64743926b242193385f4d1dfc6ee87b0d0e15b106d3', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:41:47', '2022-06-03 18:41:47', '2023-06-03 14:41:47'),
('b07f16970f11a4277a668a1dbf80f078b919a554911a8fa8dcc2da70f990fe93cf3265ebd4716db0', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-02 15:08:52', '2023-08-02 15:08:52', '2024-08-02 11:08:52'),
('b0f0c61c1ddb71556807e880f762775b714926951c8deca1bf4b458ad9d665e4a4dd3017012dd0c1', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:47:49', '2022-06-04 13:47:49', '2023-06-04 09:47:49'),
('b1e5bc856e41b95d023c8c3cfcedbc639e83ccd713ef43612e2d98a551ae72bb64587cc55af1ccbd', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:25:04', '2022-06-04 13:25:04', '2023-06-04 09:25:04'),
('b2c112e004ecdf592a329021c192b9b3f65bb27d5cbd31fadc2129a0757a84750b1973275f49950a', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:17:08', '2022-06-03 18:17:08', '2023-06-03 14:17:08'),
('b33963bae41b5f6933f87c5b0988441a72970632d3db574e2f11e796708d35b4bd7f9e771f3eb48f', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-18 07:19:42', '2023-03-18 07:19:42', '2024-03-18 03:19:42'),
('b38415641cf0bc0397c15b7604f78a15f0dfe1fc802ea89f60278a70d7662d12c88b6165eba218a2', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-05-17 23:46:48', '2022-05-17 23:46:48', '2023-05-17 19:46:48'),
('b4a60690f1143890d79c0d8ef373fd80294d541cb785e3da74c5aa6b1b30766c1fb2545d8bac84e5', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 05:58:12', '2023-08-10 05:58:12', '2024-08-10 01:58:12'),
('b5518bf961c28716409a72a8ccf8f739fd09837bbbd6c8f2285e0f2f7da2aca3b16b429e01fe10cb', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:26:05', '2023-03-27 19:26:05', '2024-03-27 15:26:05'),
('b588cd4e8fc112a02d6e50c962c27c4d180a20204628c12f10cadd741295a38a3cf2f02c9101dfb5', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-11 21:28:40', '2022-06-11 21:28:40', '2023-06-11 17:28:40'),
('b7655bcb5debea6efb2617cc86aa2a953e6e21cb62215b9fe459165dbbf0027e0b63b5ee9bcaed4c', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-10-05 19:13:42', '2022-10-05 19:13:42', '2023-10-05 15:13:42'),
('b9202c64695e62114dca024beea6e53f58f9467145764da2afd4cddeb08a6ad36b51d49f66f6bd88', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 18:17:15', '2023-08-11 18:17:15', '2024-08-11 14:17:15'),
('b94c7e9d2c8c117c9c1d0977651d578c9989eaf724317a94abe09fe09a56a7152a1cd589be0d702c', 63, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 10:48:33', '2023-09-03 10:48:33', '2024-09-03 06:48:33'),
('b97917f5c73fd11ec31edd6e587762e56dbbe6d7bdd0bc2138253cecbad74a8eebfdaa7a3ff18770', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:12:43', '2022-06-03 17:12:43', '2023-06-03 13:12:43'),
('ba31590672b3cc31ed8ced65c94cbc3f043d63c1d0a57217e84e6afb875c874af29bf2483a4f26fb', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 10:17:45', '2023-08-10 10:17:45', '2024-08-10 06:17:45'),
('ba42c6d55b86d95172c131951b23cba27049a024f91f929337ea8e9807041a21ebb67c939dfc1f67', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-07 15:25:02', '2022-06-07 15:25:02', '2023-06-07 11:25:02'),
('ba615364f27af0ca185d6b59c2d204911047154b08eaf291cac373e6e2f5972d0d39fddeaa9a328d', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-11 09:09:24', '2022-06-11 09:09:24', '2023-06-11 05:09:24'),
('bb09babb21b118ede851dc406bcc6938f173b4f14be2092f3d030824b8e255cd931d10bf32d487e1', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-06 18:13:51', '2023-03-06 18:13:51', '2024-03-06 13:13:51'),
('bb66cbfaed7b57c44498f060348b4f1cd5621253aa02be04a79d28a989a397476cbb124af7aa47b2', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:44:10', '2022-06-03 17:44:10', '2023-06-03 13:44:10'),
('bd2c7eec578d9eb1fc05c17b65a92c11587baff6a8fb37d61383162f87c2be9f2da987fc598a3e12', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:13:22', '2022-06-04 14:13:22', '2023-06-04 10:13:22'),
('bdfae197f1a01ac61c9ca4d63add59508c0bb79de392fec2e37a42ba5b266ff3fd8a844f952b4f02', 26, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-07 21:55:24', '2022-07-07 21:55:24', '2023-07-07 17:55:24'),
('be7f992016d216741c02e5106274b926416d0f44308234a9719def515c3ca91120d6af76dd00bb34', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:30:09', '2022-06-04 12:30:09', '2023-06-04 08:30:09'),
('be921c919995a126c44ddcf55d232785aaf33fdb0519657ed1bd75dbc8d83c4e1d541fc454d76bb8', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:20:36', '2023-03-27 19:20:36', '2024-03-27 15:20:36');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('beb90eeb1ee6348a978e75b1038acec983ab72614004bd30c0dbb1fe95f17b3b5c4750ff134e761d', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:45:17', '2022-06-03 17:45:17', '2023-06-03 13:45:17'),
('bebb64767218d78f6445feeec12dd98ac9577b43c2e609802e07e04ca9e089b140b5f3c7da971d27', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:42:12', '2022-06-03 18:42:12', '2023-06-03 14:42:12'),
('c056648ca28e51d145c9d36b9225302903b2e404e7836a19c5271a20b3cb02dece5dd945d744c650', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-11 17:24:55', '2022-06-11 17:24:55', '2023-06-11 13:24:55'),
('c0d6847a5641fba71ccaf075f23403e4fb9ba6d09705a0ed5fbe43979995f6efb351ac57ac286472', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-14 13:45:34', '2022-08-14 13:45:34', '2023-08-14 09:45:34'),
('c0f48b4665eaed51660b31b544b37aa607af061c59108af2be502d51e6994b293cda515b00ce92e7', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-07-04 18:06:36', '2023-07-04 18:06:36', '2024-07-04 14:06:36'),
('c21ed95707a21c2464a2adfedc6c72116484903622f67c867129d818cb5b695be72e320beb16d992', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 18:59:07', '2022-08-09 18:59:07', '2023-08-09 14:59:07'),
('c2fd6d8206925cd1f41ea2fb58fe6233c8fccfcf0d603695a89730540289996e1805a92641d16408', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 08:02:23', '2022-06-05 08:02:23', '2023-06-05 04:02:23'),
('c30a389c36063cf6b899878b5103985c16882121474bad320d8889967ded55b45dc4eb978500e614', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-11 23:15:08', '2023-08-11 23:15:08', '2024-08-11 19:15:08'),
('c3d8190bb6af3a31116c4e7c3de64317f14ba1f00361d1e45da41221e4f5ee5f9dfe530b12f1cf9c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 16:59:36', '2022-06-10 16:59:36', '2023-06-10 12:59:36'),
('c45aa4f26c8c507ca72ed1b9dd17c52f721aeca7cd4898b2e30e78b900dcfdcc3005b7d4b4aede8e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:47:10', '2022-06-04 12:47:10', '2023-06-04 08:47:10'),
('c45e757eb5acf30bf4cca7d14134835ef6064f215164acf5d0920b140afa61bbbd9bf7928f707786', 41, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-15 18:33:44', '2022-12-15 18:33:44', '2023-12-15 13:33:44'),
('c465bb25aa0b44dbca5850a12ab757727e8131119d301413773516a0ceaa9cd6b1ff8f39db0ae68c', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-31 18:52:20', '2023-03-31 18:52:20', '2024-03-31 14:52:20'),
('c486901c4810bfd6fec3dbdb6187d97b913bbb2e5995292506fb619921c6074f7f81fca60cfd67e4', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 07:33:29', '2022-06-05 07:33:29', '2023-06-05 03:33:29'),
('c568c162138832fb5c0c5a18b2ba93127994d5b2196b402899f860c905b262a33987de8ea508cd60', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:06:28', '2023-03-27 19:06:28', '2024-03-27 15:06:28'),
('c869339efc917b67d4e62625511ebdd41028cafba6711850ebef0141a74e118407fcd48a00e5f5bb', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-11 23:48:51', '2023-08-11 23:48:51', '2024-08-11 19:48:51'),
('c9537cb7e07e0b3db1d68e169f3d76aa60061d3fe32507f07512ed17960fd712849b1f1a1bee819e', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 19:01:13', '2022-12-13 19:01:13', '2023-12-13 14:01:13'),
('cbad95ea0c669499b056838f5be0000506cfe3bb725f84f200e3272ca5aa585bfe2a7c0203aabf69', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-11 11:16:31', '2023-08-11 11:16:31', '2024-08-11 07:16:31'),
('cc18defe5376ebda74ad03ec794081b0275dee5852ebfdca0a30c80633428aeb3a5fdc95fefeccce', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:41:51', '2023-03-27 19:41:51', '2024-03-27 15:41:51'),
('cc5ba1447c75371f2cd449c08105d56267ffe993366e474ba98fcfcaec736fcea66725ba821a245d', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 06:09:19', '2023-08-10 06:09:19', '2024-08-10 02:09:19'),
('cc68657fcf317e3915fbabdadd19212f09ee2eac4d18293dfc1b5f5fcbd8a2b15411834fe3b9044e', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:22:23', '2023-03-27 19:22:23', '2024-03-27 15:22:23'),
('cd766aa36e314479df951827fdc4a6b128ba591ad6b3b7eae17020754098034ec64820b4886d3378', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-14 17:04:18', '2022-08-14 17:04:18', '2023-08-14 13:04:18'),
('ce1d3e014210bbf7d157c0ea348eada6526d3ff57ec6650e07003d7afa6951f9a1e4878a2bc8b2b6', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 07:59:10', '2022-06-05 07:59:10', '2023-06-05 03:59:10'),
('ce25e750da2e1f2dbeaa43a0dd20ff55c51607e3b283764ebf4295d963d3db6549f2bf9d5534ac97', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 10:51:47', '2023-08-10 10:51:47', '2024-08-10 06:51:47'),
('ce3904db6799d32af4c0645eb5c6fa68759c9ae4226a7d1f79a8107fff9c16f512dbcf8062179c74', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 07:02:50', '2022-06-13 07:02:50', '2023-06-13 03:02:50'),
('ce6b9598ca55904ade372c8d46a3c53042f37ee87ce009276ab70b3572a49ae0639281f0a44bcbdb', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:24:00', '2022-06-03 18:24:00', '2023-06-03 14:24:00'),
('cf2814884257f15168424726cc507653cef88cb318b69c52eea3c828ef23fcd61549a2a61f63b5f5', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 16:13:07', '2022-06-05 16:13:07', '2023-06-05 12:13:07'),
('cf976ad4c8cbccf32ab5085cdfb5b0a8a912cae440fd7e5256d4f6f3bf84f71756b25c123ef5ddc5', 23, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 18:06:05', '2022-06-13 18:06:05', '2023-06-13 14:06:05'),
('cffd520f541f760941a39ad97fdd7d19f99d085c0b9f3da1362a5a1c09dfcf574ac957930e72edb7', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:59:52', '2022-06-03 17:59:52', '2023-06-03 13:59:52'),
('d01fa77efc56b311ee34ec552ea0cdd3918ec522469238b77b52814c8991b6c391b6808d764f6dc0', 47, 1, 'Laravel Password Grant Client', '[]', 0, '2023-10-03 07:45:26', '2023-10-03 07:45:26', '2024-10-03 03:45:26'),
('d0458109ba121750592f6a68d73eb8992bde5719674c20b1a28131716d78ab55346ac6626a9aaeee', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:33:16', '2022-06-04 13:33:16', '2023-06-04 09:33:16'),
('d248a3056342bb3f82237ebeec3a80ff37481b6f7404bfd612ae5cf10e6cc1ccb307e57eb6393ed9', 65, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-03 10:24:25', '2023-09-03 10:24:25', '2024-09-03 06:24:25'),
('d2623a5d655ddbe6178c689ade5316e8d3e9da15b28fa02379f13ac124009c5f3622092842347454', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:00:53', '2022-06-05 09:00:53', '2023-06-05 05:00:53'),
('d3fae5dfd071376bcfd523ce551f1467c7e03ec4e7a98197e6a47728f0e78de6a8442452a7f55a85', 9, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:19:22', '2022-03-25 12:19:22', '2023-03-25 08:19:22'),
('d4ab453df511b712f0f7603535266a0817b0a1f1448a12f3b417222ebae37e1b51060d07048d72f4', 47, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-15 18:36:20', '2022-12-15 18:36:20', '2023-12-15 13:36:20'),
('d58c02f30850f034b5a7e6ac0742f9f1cd28546331fa299e6b13fe4a042e471dd798300f53d677af', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 06:54:31', '2023-08-10 06:54:31', '2024-08-10 02:54:31'),
('d5a21b89ab87a3b5b89e50b2564dbd5c3d52b495203b8b0e470f292fba77fc45f2e93bcae6ca481a', 50, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-27 18:08:38', '2023-03-27 18:08:38', '2024-03-27 14:08:38'),
('d5b117926b0a8e8c32d799c97a3d8af3c16853a0b1b12b6c6721a8ae613af8c22dbfbe0a7e16c270', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-08 22:22:42', '2022-06-08 22:22:42', '2023-06-08 18:22:42'),
('d5ef29b2d817a093e67cf118084267f108a256c53a125032fdf9c750a875dc8437327c9688409363', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:05:05', '2022-06-03 18:05:05', '2023-06-03 14:05:05'),
('d70b9ae92a426d57fcd49612284790d129f3b3649e3c81c8416fad9025b7fcbce4cf232fceb3e9c5', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-10 17:13:08', '2022-06-10 17:13:08', '2023-06-10 13:13:08'),
('d797e08107cdd5f90b0f0f3b2321b40beba57ee4e38e6955bb5aeadeae8b369038ba0995ab70e745', 18, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 19:05:25', '2022-03-27 19:05:25', '2023-03-27 15:05:25'),
('d87a39be3961b4e42746ee454f58910f9d324f293e876f44aa804b86f642d9c9d90b4f750c1b6d55', 16, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 16:08:51', '2022-03-27 16:08:51', '2023-03-27 12:08:51'),
('d89bb025b5949e341d35962bd7c1a1616f8cff7fdb213e5bfe5f4c0b1f47e9e56cafd18defeed2a5', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:23:35', '2022-06-03 18:23:35', '2023-06-03 14:23:35'),
('d96c801746630880cba4f4762c9523b6f609e8f623e9a1003686a1030e6dbe34ced6c798e070aa90', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-05 13:23:54', '2023-03-05 13:23:54', '2024-03-05 08:23:54'),
('d98768f15be7552d39ef5ded6567c65a8332c1d03182c7d82fdb4c0651f7d5e72a097dbfcfc62cc8', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:24:49', '2023-03-27 19:24:49', '2024-03-27 15:24:49'),
('da6baef1dfced607c56d1b0a1c6b3ec54ccf0637246ea664104d7f20607705b8d54fbea52575e00f', 66, 1, 'Laravel Password Grant Client', '[]', 0, '2024-11-06 17:26:56', '2024-11-06 17:26:56', '2025-11-06 12:26:56'),
('daf900da48fa0d309130ea8b00cfa81e8f434abf7ad96b28e502b6bd58b152b1e0f601b03f97c2b6', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 11:51:41', '2022-03-27 11:51:41', '2023-03-27 07:51:41'),
('db69f43bc969f60e7d0f314228858096b7c607ca0ecf62dc88fb931406bc48b0b5e0f57a42755614', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-15 13:40:22', '2022-08-15 13:40:22', '2023-08-15 09:40:22'),
('dbfe9123b71e58869c63ca1da7e4e4a0bb7ae3aad658ca6257f0eb9744db4028b0c30dc22b12de41', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 06:41:55', '2023-08-10 06:41:55', '2024-08-10 02:41:55'),
('dc37a75655fc0b3501f586d15f1f89741009185c2ab7d8910116d7fa0a0b4a9acee47e63dc92800d', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-18 16:14:35', '2023-09-18 16:14:35', '2024-09-18 12:14:35'),
('dd07b02ad2fab31a116b5cc0c9cc0bbe8ce842955d8be6ac1ff7edfe6950deced9545877e31902be', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 17:35:43', '2022-06-04 17:35:43', '2023-06-04 13:35:43'),
('dd264704bcec3863ab0aebf69f0ad9adac08d81565839d44068c8aa4f836effaebdde184fed4546f', 24, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 13:47:34', '2022-06-04 13:47:34', '2023-06-04 09:47:34'),
('dd527f31d00f16f511b521c287b0e329f549e232c14db2ec291af2f9e6946dcd8ccb39e640fbf86c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:21:54', '2022-06-03 18:21:54', '2023-06-03 14:21:54'),
('dd6c6d65699fd997173837522f1eeaa43eb04b7d69e11ff85cc8b842bca1349ccd6db7a39b846882', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-04-06 19:20:08', '2023-04-06 19:20:08', '2024-04-06 15:20:08'),
('dd79de7d7621f3514e5bfc3f1c92d57d11a974c14d33514ca1f788067849d1deafdc7e8ac6eac135', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 12:44:38', '2022-06-04 12:44:38', '2023-06-04 08:44:38'),
('de4c16f8c7eee30ba1337964da6b6cabf0e3f650b60c759c4fb2702e3ac497311e00b1e4917330c7', 40, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-10 07:45:33', '2023-08-10 07:45:33', '2024-08-10 03:45:33'),
('e283a95165a5e935cfe7e0dd2a492b47e9c0d0388a7a177caa05fc4f44b58e8b59c4c5d0793303d9', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 11:56:00', '2022-06-04 11:56:00', '2023-06-04 07:56:00'),
('e3308d03e9b558856316fa48b369fd1eb9405755a8598c15b3763f4fea6119c794c8b7b4daaf85b9', 5, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-24 19:48:14', '2022-03-24 19:48:14', '2023-03-24 15:48:14'),
('e3a25172b24a8e5c0e70caf19650a111df9fb28bb75b60617a420d0a279e25915237e646422c8b19', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:45:19', '2023-03-27 19:45:19', '2024-03-27 15:45:19'),
('e40c504a26099ecc53e2f79ab3bebc0a2e200e5e75a15689ab7c12fa0e9fc5ab4159a1403098543f', 2, 1, 'Laravel Password Grant Client', '[]', 1, '2022-04-22 09:39:54', '2022-04-22 09:39:54', '2023-04-22 05:39:54'),
('e4ed4b3d24fa17a77c85af6aaa569cfd525e5633aac422cac293bad5c0f565c3b3a2aa0243bc75fd', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-10-05 18:38:35', '2022-10-05 18:38:35', '2023-10-05 14:38:35'),
('e50883fbb8ef9fc82214a29c2bdfb31dee806b46914365372e8b3f57091d8baed799e5cb46d5a52d', 57, 1, 'Laravel Password Grant Client', '[]', 1, '2023-07-28 13:59:00', '2023-07-28 13:59:00', '2024-07-28 09:59:00'),
('e55809591c51c96606347a71ea7b256d4091ba0a85e711b35c007c4eee76076ab3e79129fda1d979', 53, 1, 'Laravel Password Grant Client', '[]', 1, '2023-03-31 18:50:41', '2023-03-31 18:50:41', '2024-03-31 14:50:41'),
('e62ac10c7c520a89c705578ab3efc53249bbe2f387a39b3c86240e7e9feb2761e88582f6294a83d3', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-09-18 16:11:59', '2023-09-18 16:11:59', '2024-09-18 12:11:59'),
('e7ce42807c1264a274bc9ae4b6d42fe89fb5f4a8de4284f70b7d33a0b98ef8301a28a8875d4d9ac9', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-09 18:59:25', '2022-08-09 18:59:25', '2023-08-09 14:59:25'),
('ea71884590f1b5f8ba6fbdedade1437eef9ed566c1fe7969ac199cf9a5617cbb910bd1a72b718ff6', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-06 18:12:13', '2023-03-06 18:12:13', '2024-03-06 13:12:13'),
('eb1ef7cc1328c606c4f81010de0eac442e43544265273b28d4210b56b096ed3ab87bf65457b382af', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2023-06-08 14:27:01', '2023-06-08 14:27:01', '2024-06-08 10:27:01'),
('ebb54e133b2ed84db58b1a7460d84a34cb066b349d83465098bb4ab3b33c31b47552d17882880dd3', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-30 13:30:30', '2023-08-30 13:30:30', '2024-08-30 09:30:30'),
('ebc0f728a5de651afed5c8d3d1b93a496c12a56e82b0b1ea4f17510411a54fec0eb41bf6cc22d024', 10, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 12:49:09', '2022-03-25 12:49:09', '2023-03-25 08:49:09'),
('ec4d0c2a8569a9eb9f5d207189c00f3e6dfd43891df7df17b9d083bd128ebcbaa01f0b6c99704724', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 18:34:37', '2022-06-03 18:34:37', '2023-06-03 14:34:37'),
('edce5b1af581231d5c532cd7df2c9559f8a804900bf3bf4b40a83208557bedd9095530229e68b875', 29, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-12 10:24:51', '2022-07-12 10:24:51', '2023-07-12 06:24:51'),
('eded9405cd9e098967c91fcb23aac966152b8c6ac143b921d137ed5ff963b4c48ae65d7c18dda5b7', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-10 05:59:21', '2023-08-10 05:59:21', '2024-08-10 01:59:21'),
('ee6ffee400f507e8b14b4fe6d250a388767ed1fa01d5c144070690dc31949a7b28934ca8abd9b951', 58, 1, 'Laravel Password Grant Client', '[]', 1, '2023-09-02 18:46:59', '2023-09-02 18:46:59', '2024-09-02 14:46:59'),
('efb3c3c3148fb8aa5da9f2ae997f343a385eab8b22992c065154253703043806b2e875164fc167af', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 19:44:53', '2022-06-03 19:44:53', '2023-06-03 15:44:53'),
('f1a37a823a513e8698ad0150d7e8d98701b3e845a04a1d853b11835f6e147122752f66bb25698d78', 60, 1, 'Laravel Password Grant Client', '[]', 0, '2023-08-13 12:47:50', '2023-08-13 12:47:50', '2024-08-13 08:47:50'),
('f21b7955da9d262443573b972ffa47e4edb21bdbcb031362b7f0b1047f43e7ea02c83fda6b118652', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-07-28 15:31:45', '2023-07-28 15:31:45', '2024-07-28 11:31:45'),
('f22490ba9819eb4f8c49b8d24e594ce5dd30025b758c079cd4b7e0eeb1cbe0c415526e36c8ee389b', 51, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-29 19:21:55', '2023-03-29 19:21:55', '2024-03-29 15:21:55'),
('f2eb91ed4dfa565aa182770e14f9cd2165d6d7f2d5fc9a3d6ec43920c92df56f79dfb957ec0d41b0', 56, 1, 'Laravel Password Grant Client', '[]', 0, '2023-10-25 19:00:07', '2023-10-25 19:00:07', '2024-10-25 15:00:07'),
('f379e59dc9717454a15dbfa05150724fdf840a2e6bc7313883eee4c955461834e0fc2c7c832a938f', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 14:47:51', '2022-03-27 14:47:51', '2023-03-27 10:47:51'),
('f3d06ddb42d28d89b4942634fdbce67439f99025898cd9ad388a5cd0c1a7bd4e31805819ec98c855', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-07-21 16:03:51', '2022-07-21 16:03:51', '2023-07-21 12:03:51'),
('f3f47b771ac88095a4aa7b2d08a7efc8066d0cd470ab650e78e332a1a2dd6c4927789795516f5a7e', 52, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-30 21:05:30', '2023-03-30 21:05:30', '2024-03-30 17:05:30'),
('f41499165dbee79d1edd79fb4e695d7b644904131904c20498f7e7541cc248766107fce16c07c46f', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 16:38:16', '2022-06-05 16:38:16', '2023-06-05 12:38:16'),
('f475a732116986798e2576718aa6f24a8c731a4f282e34b9dee5bc4a15148dd415861fba5e7e565e', 4, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-29 20:15:56', '2023-03-29 20:15:56', '2024-03-29 16:15:56'),
('f58539c5447dac33b590c56168d52afe5d46d4203b5af509118b0f0834c14ab366a71903419ecb25', 13, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-25 20:47:56', '2022-03-25 20:47:56', '2023-03-25 16:47:56'),
('f68013cfd2d3fb5e2a83a4cc592187de08e5e963afbd643304064d0325662ecdeb65f48ca7990f44', 59, 1, 'Laravel Password Grant Client', '[]', 1, '2023-08-13 12:30:04', '2023-08-13 12:30:04', '2024-08-13 08:30:04'),
('f74214e31ecc350c6f84da9897ceca8202983b57c5d76a0bd4c581d4a13e90509c009438e551c4a1', 15, 1, 'Laravel Password Grant Client', '[]', 0, '2022-03-27 15:07:21', '2022-03-27 15:07:21', '2023-03-27 11:07:21'),
('f790ffcc796d4f02040575422e404963e93483f7a8ba0fdd3c4cc9679c2fb4292c5aef1ba14d123e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-05 09:10:04', '2022-06-05 09:10:04', '2023-06-05 05:10:04'),
('f8459ab132e71545207c9d37e62aa36d53167c62bd564afaac454e3da7f9d9f3499fb48f80c10022', 57, 1, 'Laravel Password Grant Client', '[]', 0, '2023-07-28 15:54:45', '2023-07-28 15:54:45', '2024-07-28 11:54:45'),
('f845d0d923f983578bf72c17d9bc9edfca03ecc6d63c8b1259175d7119d692880e3e5ed54bd87669', 40, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-13 20:12:30', '2022-12-13 20:12:30', '2023-12-13 15:12:30'),
('f8ec20b7e7089f30d6ebf7dc1424555a50ee537f9e2e8a2c3a92c6f5ebae9a6351f5613c3e6cbc7f', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:26:03', '2022-06-04 14:26:03', '2023-06-04 10:26:03'),
('f95ae808ec7dbae772f67c6d8ca17e24bf718ef55d44ea422f6fe5ab3225391e7e116ccac4095516', 49, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-28 18:22:13', '2023-03-28 18:22:13', '2024-03-28 14:22:13'),
('f96221c1493f472d09ed1ce1d18bf8d6756328b99d635546c041413a8112018a66e5bec9302914ab', 54, 1, 'Laravel Password Grant Client', '[]', 0, '2023-04-03 14:09:50', '2023-04-03 14:09:50', '2024-04-03 10:09:50'),
('fb126c36eb62596de1adfd5fbda3bf7cda140ee1a6a01911d78242d5d94acb9bb845700ba253520e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 14:14:28', '2022-06-04 14:14:28', '2023-06-04 10:14:28'),
('fcaf20cce913f685a9072c46d320e3868f17d607a6b24b5404086d04522453411da14af518c230d7', 50, 1, 'Laravel Password Grant Client', '[]', 0, '2023-03-27 19:20:05', '2023-03-27 19:20:05', '2024-03-27 15:20:05'),
('fcf9a6c122cb51be80a7ca813117e25a1dddfce30fd7c127e58532af89fbb386cf32bb43a2fa206c', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-04 11:55:01', '2022-06-04 11:55:01', '2023-06-04 07:55:01'),
('ff315d5392453857c02e87da65e1842646cc35022d62bdd61da59d11ac4a278841f33fd7054c402f', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-08-04 11:49:39', '2022-08-04 11:49:39', '2023-08-04 07:49:39'),
('ff399e2ee932bc1ec11bce2f77ff4e4e8106762c7d41c76e3bc16fb3ab4ccd5613fb82031c1dd24f', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-13 17:11:09', '2022-06-13 17:11:09', '2023-06-13 13:11:09'),
('ff571ab93f9aa8ce83a56624dc2854fd86c75123f48bab96ce39d0e614248d14b9ba9c12177a3b79', 36, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-03 17:55:15', '2022-12-03 17:55:15', '2023-12-03 12:55:15'),
('ff81010092125c446d982bef135692b3099dd202cf7fe8bc48af1b5424c7f8a05a182f578d89351e', 22, 1, 'Laravel Password Grant Client', '[]', 0, '2022-06-03 17:42:58', '2022-06-03 17:42:58', '2023-06-03 13:42:58'),
('fff1eb6a5607495f9ad2e2c75a1b8c127488825e5f0e454559eb4e1e657e04d07b6379c9f49c3d70', 48, 1, 'Laravel Password Grant Client', '[]', 0, '2022-12-15 18:39:52', '2022-12-15 18:39:52', '2023-12-15 13:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'll2zCRscpSsYPBxuNjEn0CFQtiABO2gxQSZEUc1q', NULL, 'http://localhost', 1, 0, 0, '2022-03-13 00:49:23', '2022-03-13 00:49:23'),
(2, NULL, 'Laravel Password Grant Client', 'wYGJmqwgU5qGHaBvfaqr2ecmdWOf47IqJAmVY2kE', 'users', 'http://localhost', 0, 1, 0, '2022-03-13 00:49:23', '2022-03-13 00:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-03-13 00:49:23', '2022-03-13 00:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `resource_type` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `resource_type`, `resource_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'property', 1, '1.jpg', '2023-09-18 16:16:03', '2023-09-18 16:16:03'),
(2, 'property', 1, '2.jpg', '2023-09-18 16:17:21', '2023-09-18 16:17:21'),
(3, 'property', 1, '3.jpg', '2023-09-18 16:23:00', '2023-09-18 16:23:00'),
(4, 'property', 2, '4.jpg', '2023-10-03 07:49:42', '2023-10-03 07:49:43'),
(5, 'property', 2, '5.jpg', '2023-10-03 07:50:13', '2023-10-03 07:50:13'),
(6, 'property', 2, '6.jpg', '2023-10-03 07:50:18', '2023-10-03 07:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `addressOne` varchar(255) NOT NULL,
  `addressTwo` varchar(255) DEFAULT NULL,
  `cityID` int(11) NOT NULL,
  `countryID` int(11) NOT NULL,
  `postalCode` varchar(255) NOT NULL,
  `locationLat` varchar(255) DEFAULT NULL,
  `locationLon` varchar(255) DEFAULT NULL,
  `propertyTypeID` int(11) NOT NULL,
  `properyStatus` int(11) NOT NULL,
  `cratedUserID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `name`, `email`, `phone`, `addressOne`, `addressTwo`, `cityID`, `countryID`, `postalCode`, `locationLat`, `locationLon`, `propertyTypeID`, `properyStatus`, `cratedUserID`, `created_at`, `updated_at`) VALUES
(1, 'GK SMART', 'gamini.ggmt@gmail.com', '092973194', 'Arakawa Residence Block D, Unit D414, Phoum Phsar Toeuk Thla, Sangkat Toeuk Thla, Khan Sen Sok, Phnom Penh', NULL, 1, 1, '12102', NULL, NULL, 1, 1, 56, '2023-09-18 16:15:32', '2023-09-18 16:15:32'),
(2, 'HotelPhnomPenh', 'linear.lindor@gmail.com', '012345645', 'Toul Kork, Phnom Penh', NULL, 1, 1, '12100', NULL, NULL, 1, 1, 47, '2023-10-03 07:47:07', '2023-10-03 07:47:07');

-- --------------------------------------------------------

--
-- Table structure for table `propertytype`
--

CREATE TABLE `propertytype` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `propertytype`
--

INSERT INTO `propertytype` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hotel', NULL, NULL),
(2, 'Motel', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `propertyID` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `numRooms` int(10) NOT NULL DEFAULT 0,
  `roomTypeID` int(11) NOT NULL,
  `numPersons` int(11) NOT NULL,
  `roomSatus` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `propertyID`, `description`, `numRooms`, `roomTypeID`, `numPersons`, `roomSatus`, `created_at`, `updated_at`) VALUES
(1, 1, 'test descrption', 2, 1, 1, 1, '2023-10-25 19:10:21', '2023-10-25 19:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `roomaminity`
--

CREATE TABLE `roomaminity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roomID` int(11) NOT NULL,
  `amnityID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roomaminity`
--

INSERT INTO `roomaminity` (`id`, `roomID`, `amnityID`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2023-10-25 19:10:22', '2023-10-25 19:10:22'),
(2, 1, 4, '2023-10-25 19:10:22', '2023-10-25 19:10:22'),
(3, 1, 5, '2023-10-25 19:10:22', '2023-10-25 19:10:22'),
(4, 1, 6, '2023-10-25 19:10:22', '2023-10-25 19:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `roomPricing`
--

CREATE TABLE `roomPricing` (
  `id` int(11) NOT NULL,
  `roomID` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `adultPrice` double(11,2) DEFAULT NULL,
  `childPrice` double(11,2) DEFAULT NULL,
  `infantPrice` double(11,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roomPricing`
--

INSERT INTO `roomPricing` (`id`, `roomID`, `startDate`, `endDate`, `adultPrice`, `childPrice`, `infantPrice`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-08-01', '2024-12-31', 40.00, 15.00, 0.00, '2023-10-25 19:10:21', '2023-10-25 19:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Single', NULL, NULL),
(2, 'Double', NULL, NULL),
(3, 'Triple', NULL, NULL),
(4, 'Family Suite', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `code`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Available', 'property', NULL, NULL),
(2, 0, 'Payment pending', 'booking', NULL, NULL),
(3, 1, 'Payment accepted', 'booking', NULL, NULL),
(4, 2, 'Confirmed', 'booking', NULL, NULL),
(5, 3, 'Canceled', 'booking', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `firstName`, `lastName`) VALUES
(2, NULL, 'ninecool@gmail.com', NULL, '$2y$10$Wu8Ywe.35JjMfHGCIGO8neF0jDE.TTo4h89p8.BuFB5.31nqe3k1O', NULL, '2022-03-13 11:14:17', '2023-08-20 09:41:06', 'John 2', 'Doe'),
(3, NULL, 'john2.doe@example.com', NULL, '$2y$10$gMmcLUJUa4.tmplF21nh8OWFJeqcS1/j/F/eNOADbbfNrHIo2YptG', NULL, '2022-03-13 11:21:11', '2023-08-06 17:24:38', 'John', 'Doe'),
(4, NULL, 'john3.doe@example.com', NULL, '$2y$10$fLsIIKRyA309sdBc8zXux.Qrc78HEOwaRT85rsQI6R7/6SUiYf1iK', NULL, '2022-03-13 11:24:32', '2023-09-03 10:21:03', 'John 5', 'Doe 3'),
(5, NULL, 'munysatyagaming@gmail.com', NULL, '$2y$10$kLH.gxNiVq7fFSswivW4oOPqGQmRmp0qqK2XbRJh5ujph5QUtg4A6', NULL, '2022-03-24 19:42:11', '2022-03-24 19:42:11', 'John', 'Doe'),
(6, NULL, 'jonh@gmail.com', NULL, '$2y$10$U8pvFUBdX9Q5uY5CBHZQneApFPxj8nuAU/GcyemrG6t.DHxnB3ucq', NULL, '2022-03-25 12:05:03', '2022-03-25 12:05:03', 'Jonh', 'Jonh'),
(7, NULL, 'satyagaming@gmail.com', NULL, '$2y$10$uLduXvG4Odhvfir1.MtQuOAl5nXrDmmZU0b00942gT3HxBaAkytzu', NULL, '2022-03-25 12:08:21', '2022-03-25 12:08:21', 'John', 'Doe'),
(8, NULL, 'john@gmail.com', NULL, '$2y$10$pjEEChbiIjDO5HU3UQoJHOlQ/OJj8z1Wm25JwhZYObWWn.0VhY31u', NULL, '2022-03-25 12:18:24', '2022-03-25 12:18:24', 'Jonh', 'Jonh'),
(9, NULL, 'jhn@gmail.com', NULL, '$2y$10$YIdUB6EuC2OJkrWM/kBwl.6bSaLzILrUD5omRg33FGouIOPXuOJZ2', NULL, '2022-03-25 12:19:22', '2022-03-25 12:19:22', 'Jonh', 'Jonh'),
(10, NULL, 'n@gmail.com', NULL, '$2y$10$jD8MOZ1XkROfkMPloV8Ja.ynALIN9i8TTziBqBbWHzHndw4TOG89S', NULL, '2022-03-25 12:49:09', '2022-03-25 12:49:09', 'n', 'n'),
(11, NULL, 'a@gmail.com', NULL, '$2y$10$V7nVWdurUeEWyZ/JZIKlq.Pk3P4LEjY6HaeM.iuDXMqA8BUrXm/4S', NULL, '2022-03-25 12:51:13', '2022-03-25 12:51:13', 'a', 'a'),
(12, NULL, 'b@gmail.com', NULL, '$2y$10$k/1A3PAM.UObwbt70AA6V.k2/SD0XjCFphHjHinUKhp37DL400cNO', NULL, '2022-03-25 20:23:32', '2022-03-25 20:23:32', 'b', 'b'),
(13, NULL, 'c@gmail.com', NULL, '$2y$10$SYyCaqfXOpxFoabdgAvZ.OdpLXV6DYulQtQP6.fm8KarlE7PDFeiG', NULL, '2022-03-25 20:28:36', '2022-03-25 20:28:36', 'c', 'c'),
(14, NULL, 'f@gmail.com', NULL, '$2y$10$3bBprq4FH2rc5gB84DYIVOVknKGPgRgX41j3EilOLZhtRcGB/BDFW', NULL, '2022-03-27 15:05:47', '2022-03-27 15:05:47', 'f', 'f'),
(15, NULL, 'g@gmail.com', NULL, '$2y$10$joCDZnGsNytFjWGyhyMkUev2gUC2hrya50DqAtVsq/ka5D6RBRwSu', NULL, '2022-03-27 15:07:07', '2022-03-27 15:07:07', 'g', 'g'),
(16, NULL, 'reasey.sereineath19@kit.edu.kh', NULL, '$2y$10$rRZetBjJnWAsk03DG/xXROepuAdM3/Tx8NykMPX8DM8WJojELa6Fe', NULL, '2022-03-27 16:08:51', '2022-03-27 16:08:51', 'Neath', 'Neath'),
(18, NULL, 'h@gmail.com', NULL, '$2y$10$Ng8Zcf97OPhGASWms88smO9DNR6ghz.zWGURc39gE.hW4IQKQBhgq', NULL, '2022-03-27 18:55:09', '2022-03-27 18:55:09', 'h', 'h'),
(19, NULL, 'sereineathreasey@gmail.com', NULL, '$2y$10$8Bl/aFdwg5SRn6dGoora4O9rdp/2lQUF0b1j43dvR34K43MbvSdym', NULL, '2022-03-28 17:30:39', '2022-03-28 17:30:39', 'Neath', 'Neath'),
(20, NULL, 'i@gmail.com', NULL, '$2y$10$9i60XKmdrfnYKxraDa.hOuXhl/zRTFWo.O1.rnISeKRjiQ5jrUtDC', NULL, '2022-04-21 06:39:51', '2022-04-21 06:39:51', 'i', 'i'),
(21, NULL, 'john33.doe@example.com', NULL, '$2y$10$S9gljMvRcSmkCaaLvrMvquZrum9VvuUVs3IWRpTaT0VXrs6Ll/bni', NULL, '2022-04-22 23:01:30', '2022-04-22 23:01:30', 'John', 'Doe'),
(22, NULL, 'sokchhunlynel@gmail.com', NULL, '$2y$10$hD3Ln/5A8oI9h2bUH.adZOabkISsgQRFroXZkm8LJIg0Fyw9dVUsm', NULL, '2022-06-02 21:43:39', '2022-06-02 21:43:39', 'Sokchhunly', 'Nel'),
(23, NULL, 'admin@admin.com', NULL, '$2y$10$U7WDVZ6Ybfm94SuN3Z8iuOxP1UmRvUPFqUF./RJaFB4GPNe5d4svK', NULL, '2022-06-04 13:37:56', '2022-06-04 13:37:56', 'admin', 'admin'),
(24, NULL, 'superadmin@superadmin.com', NULL, '$2y$10$5tu1ET8YEg.QCiUDMB7WSOmbjEnZr8vZgBRxlElQtqQbLTeZjBRjG', NULL, '2022-06-04 13:45:53', '2022-06-04 13:45:53', 'super', 'admin'),
(25, NULL, 'Test@jj.com', NULL, '$2y$10$IBiKzQukf3uK075dQeGcSuHl7BwaSU30Qut/0wrmQRZAht2xQVfqK', NULL, '2022-06-10 17:11:28', '2022-06-10 17:11:28', 'Test', 'Jiji'),
(26, NULL, 'abc@gmail.com', NULL, '$2y$10$rw2M27FmjmsIZyojVbNjG.//dvhkYxyKixzuxDVlsnfPx6.i80rPq', NULL, '2022-07-07 21:55:24', '2022-07-07 21:55:24', 'Abc', 'Test'),
(29, NULL, 'dush@fanaticzine.com', NULL, '$2y$10$TgQfieVSKqN1pvKlHaF8TexuOJf07XYjNSVQkLq3rnbrA9orcr2DS', NULL, '2022-07-12 10:24:50', '2022-07-12 10:24:50', 'Dushmantha', 'Gunasingha'),
(31, NULL, 'test@mail.com', NULL, '$2y$10$bj9iNTxwsNPYCmEPk6YIROwnzb9VwE0qavWjTor4UWaoXbbnqhNeC', NULL, '2022-07-13 15:35:51', '2022-07-13 15:35:51', 'GG', 'WW'),
(34, NULL, 'john.doe@example5.com', NULL, '$2y$10$P1Z.BU8MEkuhbYwN1IDcLe.wh33soipPOvBH8aReQSDSxctMYgDTa', NULL, '2022-07-13 15:36:44', '2022-07-13 15:36:44', 'Dushmantha', 'Gunasingha'),
(35, NULL, 'test1@gmail.com', NULL, '$2y$10$2EeNxPVgmE8AyUbhI0e0/em0cg2ZePzn2ZhsFtnFPZSBvmmpUuce.', NULL, '2022-08-15 13:42:18', '2022-08-15 13:42:18', 'Test1', 'Last'),
(36, NULL, 'longhakly2021@gmail.com', NULL, '$2y$10$caX9.a6ogwByhhbRdQcEVOPqRYJdbgfbvjX0JsJr1WOc5a1D9zbvm', NULL, '2022-12-03 17:55:14', '2022-12-03 17:55:14', 'Long hakly', 'Long hakly'),
(38, NULL, 'longhakly2020@gmail.com', NULL, '$2y$10$1zyfLQ3qDKIljowKitQuLOwhqHWEtaT.MKDGitBKKND2FTKXgt1uS', NULL, '2022-12-05 15:32:34', '2022-12-05 15:32:34', 'Zin 2', 'Zin 2'),
(39, NULL, 'sereineathreasey1@gmail.com', NULL, '$2y$10$DjrgBa59.knIupXanpZRSeeVyHSyFLU7tWS.zZtApIBhOyJ2T1Z1K', NULL, '2022-12-13 18:19:12', '2022-12-13 18:19:12', 'Serei Neath', 'Serei Neath'),
(40, NULL, 'soth.sambath19@kit.edu.kh', NULL, '$2y$10$uQH4TwSS0w7syZ5lyNpT3uyF.Foo/ro1dox2Vc5oWPUq.htFtHw0u', NULL, '2022-12-13 18:58:12', '2023-08-13 12:52:33', 'Sambath', 'Sambath'),
(41, NULL, 'linear_lindor@yahoo.com', NULL, '$2y$10$iIwDtlBq.9APFDbvaGwoOO8lF9nKx9ca4O8X7sN0.kOV11LXoJFiq', NULL, '2022-12-15 18:33:44', '2022-12-15 18:33:44', 'Linear', 'Linear'),
(47, NULL, 'linear.lindor@gmail.com', NULL, '$2y$10$vpVToKy/n8guMiDJZ4inueYEtdQ7oSJRRGqOBIdUgwQwpvEgjWoEu', NULL, '2022-12-15 18:36:20', '2023-10-03 08:22:31', 'Hi', 'Hi'),
(48, NULL, 'pich.rachana19@kit.edu.kh', NULL, '$2y$10$fUDyXCe9CXp/dNE2Ys3FqezoymOzqjELBgs8NMJ.P/BTqBrd7BJXW', NULL, '2022-12-15 18:39:52', '2022-12-15 18:39:52', 'Rachana', 'Rachana'),
(49, NULL, 'john4.doe@example.com', NULL, '$2y$10$2NstxnKp0wbRy1eoFXN84.OD9nuxcvgatLVDGm6L/DrHjQNyrN5o.', NULL, '2023-03-06 18:12:13', '2023-09-03 10:19:33', 'John', 'Doe'),
(50, NULL, 'sora1@example.com', NULL, '$2y$10$R.GcjHf413Ik5kcZFBtC0u6FdJZv0isyCmiPukzp1vmpQ7dSlD5FS', NULL, '2023-03-27 18:08:18', '2023-03-27 18:08:18', 'John', 'Doe'),
(51, NULL, 'boom@email.com', NULL, '$2y$10$MRfU4IVT1br78Wzy6UK6iOrAdG8Xf4OyclkWTNfxryHHzJLj7FPsG', NULL, '2023-03-29 19:21:55', '2023-03-29 19:21:55', 'Boom', 'Boom'),
(52, NULL, 'testing@123.com', NULL, '$2y$10$cn.E1vXtipP8lNpx1jq4wOPbUy.pPVZklcHnCERi3boy0WpRdFl62', NULL, '2023-03-30 21:05:30', '2023-03-30 21:05:30', 'testing@123.com', 'testing@123.com'),
(53, NULL, 'test@1234.com', NULL, '$2y$10$bCWTO3cR/y0pBtx3UHEtiO13LG49uSqjn8xFZjjZmXlyYsPfURfi6', NULL, '2023-03-30 21:47:35', '2023-03-30 21:47:35', 'test@1234.com', 'test@1234.com'),
(54, NULL, 'suy.chakriya19@kit.edu.kh', NULL, '$2y$10$KrdAkUuSM/3EoiscbtEgUeGctZ2LOp5DdLtx8AVqR2G4YkFmtbsTu', NULL, '2023-04-03 14:09:49', '2023-04-03 14:09:49', '123', '123'),
(55, NULL, 'gamini@ggmt.sg', NULL, '$2y$10$EEyv4c/IeKtP1ymCHGJpDOxhtugYeUZgobl3G5xGEEwgjZV9CZ7Fm', NULL, '2023-05-30 04:50:07', '2023-05-30 04:50:07', 'Gamini', 'K'),
(56, NULL, 'gamini.ggmt@gmail.com', NULL, '$2y$10$cIVHMl2c5FCSSKqJx7Z2NO3aMdRXf0TgRpbueX4i4zN4gS7FNVria', NULL, '2023-07-04 18:06:35', '2023-08-30 13:28:45', 'Gamini', 'Gamini'),
(57, NULL, 'test@gmail.com', NULL, '$2y$10$NAZJBFneSfygywO60V7MDeMiVygXJf1s.24yc7SlVnqK/IW929Msa', NULL, '2023-07-28 13:43:50', '2023-07-28 13:43:50', 'Test', 'Test'),
(58, NULL, 'suy.chakryya@gmail.com', NULL, '$2y$10$klkQcex9WW0Bh9YMowp1/eUg0hwLSHlbgJKhsF9yxTOWLmWlyFd0a', NULL, '2023-08-13 12:25:27', '2023-08-21 10:54:08', 'Ya', 'Ya'),
(59, NULL, 'sambath.soth.se@gmail.com', NULL, '$2y$10$7ro5dNnzYWIuqn8Ro6u3xeiDs9uPhd5/a0N01CTLNj5x3JzRDN7Ma', NULL, '2023-08-13 12:29:51', '2023-08-13 12:50:56', 'Sambath', 'Sambath'),
(60, NULL, 'channalim1975@gmail.com', NULL, '$2y$10$GfXJyECUJ0/gSP3E6.DTre9g3Py7SSNRreTfdIaBlZrw8LyiW/ebm', NULL, '2023-08-13 12:47:50', '2023-08-13 12:48:30', 'channa', 'channa'),
(61, NULL, 'test2@gmail.com', NULL, '$2y$10$uh79YpsTKw.BYtab.508PO/az9RuJeISAGvFKT0oBfv84LDkJzdN6', NULL, '2023-08-13 12:49:13', '2023-08-13 12:49:13', 'Test', 'Test'),
(62, NULL, 'mytravel@gmail.com', NULL, '$2y$10$dQUAz/YmJhq4997fv756WO7G9LaTg2ZVQxlEnc5vJoWoH8KKPtna.', NULL, '2023-08-28 19:40:22', '2023-08-28 19:40:22', 'My', 'Travel'),
(63, NULL, 'unmengtong@gmail.com', NULL, '$2y$10$fM62cHnC29HA10oBhx.Hcu.4.rXVUE9wnrmn5z/bjZ5gXMhAWoN2q', NULL, '2023-09-03 09:05:37', '2024-05-16 18:52:59', 'Mengtong', 'Un'),
(64, NULL, '23hkb@gm.com', NULL, '$2y$10$IMrmQG0LMhWP8hR/i7qaEe.zp6r6wHyNPPhY206doh64jZ5ideEqO', NULL, '2023-09-03 09:30:40', '2023-09-03 09:30:40', 'John 2', 'Doe 2'),
(65, NULL, 'john4.d2oe@example.com', NULL, '$2y$10$RE3r4yHZSgg.LtrXV1iyaeyO8g3kFIN5vN8ovyYUdCs8oQrxUUUdW', NULL, '2023-09-03 10:24:25', '2023-09-03 10:24:25', 'John 2', 'Test123'),
(66, NULL, 'testuser@gmail.com', NULL, '$2y$10$PI731GYUDWPZdixI63XS3.0455BX9caMwy9pL5QWGuQIsKVZAGfmS', NULL, '2024-11-06 17:26:56', '2024-11-06 17:26:56', 'Test', 'Test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aminity`
--
ALTER TABLE `aminity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingRooms`
--
ALTER TABLE `bookingRooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoiceLines`
--
ALTER TABLE `invoiceLines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoicePayments`
--
ALTER TABLE `invoicePayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propertytype`
--
ALTER TABLE `propertytype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomaminity`
--
ALTER TABLE `roomaminity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomPricing`
--
ALTER TABLE `roomPricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
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
-- AUTO_INCREMENT for table `aminity`
--
ALTER TABLE `aminity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookingRooms`
--
ALTER TABLE `bookingRooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoiceLines`
--
ALTER TABLE `invoiceLines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoicePayments`
--
ALTER TABLE `invoicePayments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `propertytype`
--
ALTER TABLE `propertytype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roomaminity`
--
ALTER TABLE `roomaminity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roomPricing`
--
ALTER TABLE `roomPricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
