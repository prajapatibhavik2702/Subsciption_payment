-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 07, 2023 at 05:29 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stripesubscription`
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
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_05_03_000001_create_customer_columns', 1),
(5, '2019_05_03_000002_create_subscriptions_table', 1),
(6, '2019_05_03_000003_create_subscription_items_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(9, '2023_07_03_092902_create_plans_table', 1),
(10, '2023_07_03_124018_create_jobs_table', 2);

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
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `stripe_plan`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Basic Plan', 'free', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 99, 'Business Plan', '2023-07-03 05:45:25', '2023-07-03 05:45:25'),
(2, 'Business Plan', 'business-plan', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 299, 'Business Plan', '2023-07-03 06:01:08', '2023-07-03 06:01:08'),
(3, 'Premium', 'premium', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 999, 'Premium', '2023-07-03 06:01:08', '2023-07-03 06:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `name`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(49, 5, '1', 'sub_1NQS5eGHl4KbN4XuOnTvsQoQ', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-07-05 04:03:39', '2023-07-05 04:03:42'),
(48, 4, '2', 'sub_1NQ7CkGHl4KbN4XuHGsaOBct', 'active', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, NULL, NULL, '2023-07-04 05:45:42', '2023-07-04 05:45:44'),
(47, 3, '1', 'sub_1NQ6rnGHl4KbN4XuP66Mx807', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-06-07 05:24:03', '2023-07-04 05:24:05'),
(46, 3, '1', 'sub_1NQ6lgGHl4KbN4Xu2o7uLdSv', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-06-05 05:17:44', '2023-07-04 05:17:46'),
(45, 2, '1', 'sub_1NQ6E1GHl4KbN4XuhFXUohD9', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-07-04 04:42:57', '2023-07-04 04:42:59'),
(44, 2, '3', 'sub_1NQ5vAGHl4KbN4XuVeNOCCBd', 'active', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, NULL, NULL, '2023-07-04 04:23:29', '2023-07-04 04:23:31'),
(43, 2, '2', 'sub_1NQ5uMGHl4KbN4XuCoBYGDIk', 'active', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, NULL, NULL, '2023-07-04 04:22:38', '2023-07-04 04:22:40'),
(42, 1, '1', 'sub_1NQ5rUGHl4KbN4Xugtu4VjW1', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-06-05 04:19:40', '2023-07-04 04:19:43'),
(41, 1, '1', 'sub_1NQ5q0GHl4KbN4XuKQE7X927', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-07-04 04:18:09', '2023-07-04 04:18:11'),
(40, 1, '1', 'sub_1NQ5pUGHl4KbN4XuVQBaW86U', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-07-04 04:17:36', '2023-07-04 04:17:38'),
(39, 1, '1', 'sub_1NQ5oLGHl4KbN4XuDhiHkOIw', 'active', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, NULL, NULL, '2023-07-04 04:16:25', '2023-07-04 04:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE IF NOT EXISTS `subscription_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_items`
--

INSERT INTO `subscription_items` (`id`, `subscription_id`, `stripe_id`, `stripe_product`, `stripe_price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 'si_OC95Cx2kCMOYGm', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-03 05:49:36', '2023-07-03 05:49:36'),
(2, 2, 'si_OCAyCyNno1FDum', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 07:46:51', '2023-07-03 07:46:51'),
(3, 3, 'si_OCB2oOJVMxiXlD', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 07:50:57', '2023-07-03 07:50:57'),
(4, 4, 'si_OCB4zjUJaKUUoj', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 07:53:17', '2023-07-03 07:53:17'),
(5, 5, 'si_OCB8dmlPdYhXkv', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 07:57:04', '2023-07-03 07:57:04'),
(6, 6, 'si_OCBAZcAuUH22Xb', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 07:59:14', '2023-07-03 07:59:14'),
(7, 7, 'si_OCPeko5Rj9xz6F', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 22:56:44', '2023-07-03 22:56:44'),
(8, 8, 'si_OCPltvWQIbYLWf', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-03 23:03:41', '2023-07-03 23:03:41'),
(9, 9, 'si_OCPneqNm0h0GLT', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-03 23:05:39', '2023-07-03 23:05:39'),
(10, 10, 'si_OCPqlLl9Ie48lo', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:09:09', '2023-07-03 23:09:09'),
(11, 11, 'si_OCPy2uRk5qkBbp', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:16:57', '2023-07-03 23:16:57'),
(12, 12, 'si_OCQCuY7itBi9Eg', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:30:45', '2023-07-03 23:30:45'),
(13, 13, 'si_OCQMy9aAhtzlLW', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:41:26', '2023-07-03 23:41:26'),
(14, 14, 'si_OCQP6lnadzl61F', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:43:33', '2023-07-03 23:43:33'),
(15, 15, 'si_OCQQZihsSlynZh', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:44:42', '2023-07-03 23:44:42'),
(16, 16, 'si_OCQRZ6TZ2DWHz7', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:46:23', '2023-07-03 23:46:23'),
(17, 17, 'si_OCQTFlFHEwYu3P', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:48:17', '2023-07-03 23:48:17'),
(18, 18, 'si_OCQZtQyJ6cs2gX', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-03 23:54:15', '2023-07-03 23:54:15'),
(19, 19, 'si_OCQn2QcuWrl99c', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:07:57', '2023-07-04 00:07:57'),
(20, 20, 'si_OCQsEHQrG3fSrm', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:12:41', '2023-07-04 00:12:41'),
(21, 21, 'si_OCQwWZufiJ95Ob', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:17:04', '2023-07-04 00:17:04'),
(22, 22, 'si_OCQz1v6KBmMkTf', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:19:30', '2023-07-04 00:19:30'),
(23, 23, 'si_OCR1g1Mt3W3t2U', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:21:32', '2023-07-04 00:21:32'),
(24, 24, 'si_OCR9aSZ8UiIgyg', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 00:29:42', '2023-07-04 00:29:42'),
(25, 25, 'si_OCSWjeqkUuI4Ug', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 01:55:01', '2023-07-04 01:55:01'),
(26, 26, 'si_OCSf186SdbZuOj', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 02:03:36', '2023-07-04 02:03:36'),
(27, 27, 'si_OCUO6JAjpTYw7v', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-04 03:50:28', '2023-07-04 03:50:28'),
(28, 28, 'si_OCUaPxXtVWNHT3', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:03:13', '2023-07-04 04:03:13'),
(29, 29, 'si_OCUdgSxU6cTDTP', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:05:32', '2023-07-04 04:05:32'),
(30, 30, 'si_OCUdzfnqNe33rT', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:05:56', '2023-07-04 04:05:56'),
(31, 31, 'si_OCUeN0GyEoBgWC', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:06:31', '2023-07-04 04:06:31'),
(32, 32, 'si_OCUfxLGZ4AtdcU', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:08:02', '2023-07-04 04:08:02'),
(33, 33, 'si_OCUfBpBgBDN424', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:08:26', '2023-07-04 04:08:26'),
(34, 34, 'si_OCUgGxIDeKSyW8', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:08:49', '2023-07-04 04:08:49'),
(35, 35, 'si_OCUgyIZdxOayqK', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:09:01', '2023-07-04 04:09:01'),
(36, 36, 'si_OCUhbODNB83Xgz', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:09:41', '2023-07-04 04:09:41'),
(37, 37, 'si_OCUhjdT64Hyw1w', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:10:07', '2023-07-04 04:10:07'),
(38, 38, 'si_OCUiT4YeLrMBNW', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:10:48', '2023-07-04 04:10:48'),
(39, 39, 'si_OCUn1B3knFkOpD', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 04:16:25', '2023-07-04 04:16:25'),
(40, 40, 'si_OCUppgNT8Ziu0Y', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 04:17:36', '2023-07-04 04:17:36'),
(41, 41, 'si_OCUpsINWj3JrCF', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 04:18:09', '2023-07-04 04:18:09'),
(42, 42, 'si_OCUrLCX2nAlxfs', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 04:19:40', '2023-07-04 04:19:40'),
(43, 43, 'si_OCUuQIfUc5EPhT', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-04 04:22:38', '2023-07-04 04:22:38'),
(44, 44, 'si_OCUvz7PXrwtaa5', 'prod_OC7uVjLzeJVu9M', 'price_1NPjepGHl4KbN4XuPCUuDeRK', 1, '2023-07-04 04:23:29', '2023-07-04 04:23:29'),
(45, 45, 'si_OCVEv495tUECQM', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 04:42:57', '2023-07-04 04:42:57'),
(46, 46, 'si_OCVnV1TswRdX3c', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 05:17:44', '2023-07-04 05:17:44'),
(47, 47, 'si_OCVtrFMkGmVLkP', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-04 05:24:03', '2023-07-04 05:24:03'),
(48, 48, 'si_OCWFRPb0pqL7fR', 'prod_OC7tyJK1ZBldlJ', 'price_1NPjdVGHl4KbN4Xu7qu11aaT', 1, '2023-07-04 05:45:42', '2023-07-04 05:45:42'),
(49, 49, 'si_OCrphPuGJRSmJe', 'prod_OC8yjIHqXfbV2k', 'price_1NPkgwGHl4KbN4XugIp7YZOc', 1, '2023-07-05 04:03:39', '2023-07-05 04:03:39');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Bhavik', 'bhavik@gmail.com', NULL, '$2y$10$vwb73Bd0P38meMd3y7VVTeTzJkqC9StdvQtUQb.yuz.3lwql0JJ/K', NULL, '2023-07-03 05:46:10', '2023-07-03 05:49:35', 'cus_OC95GMVLkJv1UN', 'visa', '4242', NULL),
(2, 'Bhavlo', 'bhavlo@gmail.com', NULL, '$2y$10$srs9ft0I8EZFSVkKmLhnleWwSjZleOpw5EwuwOBgi.jV3LJ3ne6JK', NULL, '2023-07-04 04:21:59', '2023-07-04 04:22:37', 'cus_OCUuD4hybUYfLX', 'visa', '4242', NULL),
(3, 'yattik', 'yatrik@gmail.com', NULL, '$2y$10$gEEbd4ydBj4KySKpUFEDKOkQeatqNK5arLbT3fdWxBdURakcd7cPC', NULL, '2023-07-04 05:14:39', '2023-07-04 05:17:43', 'cus_OCVnmqNdcbH45g', 'visa', '4242', NULL),
(4, 'rohan', 'rohan@gmail.com', NULL, '$2y$10$rejIVev2ZB9rThiW9gOAueZDtDDBOaTHescMmIAMpKP9lNXrCPYZ6', NULL, '2023-07-04 05:42:01', '2023-07-04 05:45:41', 'cus_OCWFV9lF1A2w7L', 'visa', '4242', NULL),
(5, 'abc', 'abc@gmail.com', NULL, '$2y$10$QtU3bwArPZJUTuUFEjd1b.CaLMM2306PJFDN2KrjRISedfmX6yDY.', NULL, '2023-07-04 23:54:47', '2023-07-05 04:03:38', 'cus_OCrpt0RW3cHInQ', 'visa', '4242', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
