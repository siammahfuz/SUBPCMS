-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 02:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `subcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `verification_code` varchar(10) DEFAULT NULL,
  `verification_status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contest_information`
--

CREATE TABLE `contest_information` (
  `contest_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `last_registration_date` date NOT NULL,
  `mock_contest` tinyint(1) DEFAULT 0,
  `contest_date_time` datetime NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `facebook_link` varchar(255) DEFAULT NULL,
  `notice_link` varchar(255) DEFAULT NULL,
  `web_link` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `university_name` varchar(255) NOT NULL,
  `result_link` varchar(255) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kit_management`
--

CREATE TABLE `kit_management` (
  `kit_id` int(11) NOT NULL,
  `kit_name` varchar(255) NOT NULL,
  `kit_description` text DEFAULT NULL,
  `kit_quantity` int(11) NOT NULL,
  `status` enum('Available','Reserved','Issued') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_23_215814_create_roles_table', 1),
(6, '2024_01_23_220028_create_role_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `notice_datetime` datetime DEFAULT NULL,
  `notice_subject` varchar(255) DEFAULT NULL,
  `notice_body_text` text DEFAULT NULL,
  `notice_filelink` varchar(255) DEFAULT NULL,
  `notice_author` varchar(100) DEFAULT NULL,
  `notice_status` enum('Draft','Published','Archived') DEFAULT NULL
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-01-23 18:47:58', '2024-01-23 18:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor_id` int(11) NOT NULL,
  `sponsor_name` varchar(255) NOT NULL,
  `sponsor_logo_url` varchar(255) DEFAULT NULL,
  `sponsor_website_link` varchar(255) DEFAULT NULL,
  `types_of_sponsor` varchar(50) DEFAULT NULL,
  `sponsor_status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `payment_status` enum('Pending','Paid') DEFAULT 'Pending',
  `team_status` enum('Active','Inactive') DEFAULT 'Active',
  `verification_status` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  `verification_code` varchar(10) DEFAULT NULL,
  `kit_collection_status` enum('Not Collected','Collected') DEFAULT 'Not Collected',
  `attendance_status` enum('Present','Absent') DEFAULT 'Absent',
  `certificate_status` enum('Not Issued','Issued') DEFAULT 'Not Issued'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `team_id` int(11) NOT NULL,
  `member1_name` varchar(255) NOT NULL,
  `member1_email` varchar(255) NOT NULL,
  `member1_tshirt_size` varchar(20) DEFAULT NULL,
  `member1_photo_url` varchar(255) DEFAULT NULL,
  `member1_mobile_number` varchar(15) DEFAULT NULL,
  `member2_name` varchar(255) NOT NULL,
  `member2_email` varchar(255) NOT NULL,
  `member2_tshirt_size` varchar(20) DEFAULT NULL,
  `member2_photo_url` varchar(255) DEFAULT NULL,
  `member2_mobile_number` varchar(15) DEFAULT NULL,
  `member3_name` varchar(255) DEFAULT NULL,
  `member3_email` varchar(255) DEFAULT NULL,
  `member3_tshirt_size` varchar(20) DEFAULT NULL,
  `member3_photo_url` varchar(255) DEFAULT NULL,
  `member3_mobile_number` varchar(15) DEFAULT NULL,
  `coach_name` varchar(255) DEFAULT NULL,
  `coach_email` varchar(255) DEFAULT NULL,
  `coach_tshirt_size` varchar(20) DEFAULT NULL,
  `coach_photo_url` varchar(255) DEFAULT NULL,
  `coach_mobile_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_payment_details`
--

CREATE TABLE `team_payment_details` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_type` enum('Bkash','Nogod','Cash') DEFAULT NULL,
  `verification_status` enum('Pending','Verified','Rejected') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'siam khan', 'freshmind.siamkhan@gmail.com', NULL, '$2y$10$wTC97RzXHsqJLoCaH4URDes69zfdihlXLpzEcLp/CMq6vXl9gGOPS', 'ztxJ1pkXxfddHp38TthFpjp0BJUCYZYPddQ6QMql8jEcefoYUA9SBZcyHrD9', '2024-01-23 21:29:01', '2024-01-23 21:29:01'),
(4, 'Admin', 'ksiam34090@gmail.com', NULL, '$2y$10$Dba9jCmiic.sefOmAwkmWeBN2C58bg8qG4iGWdK3Ou4vpnvPCTSTu', '41xeyGVNSF1L5gSrXSVBYDvGfGKn9yvZ1dQm58IdeRgB4JeL868xkaqMCF93', '2024-01-23 18:50:51', '2024-01-23 18:50:51'),
(5, 'Afrin', 'afrin@gmail.com', NULL, '$2y$10$NYre4Bo26pvK0yut0hezyODqfGhpVHQXTwpwVLvGjyILEtOgJCkta', 'MiZaLS4PgNJngwVU47BuIPQT69GTSF16JJZv8dH60ZC4XqKSKZXu2TxoMlZB', '2024-01-27 08:01:28', '2024-01-27 08:01:28'),
(6, 'Shovon', 'shovon@gmail.com', NULL, '$2y$10$9SxBSRFwsSABkGQoekwO7.QDCTFGbhqF6p9NBWnZd0QGEuYbTHTbm', NULL, '2024-02-06 07:25:22', '2024-02-06 07:25:22'),
(7, 'Nobel Akon', 'nobel.akon2024@gmail.com', NULL, '$2y$10$1KfRgIhg3ZA4BdOCLWsyquzz.lbe5o1ZH8o89S44QmavzZcRYVwQW', 'tRE0vBiTHzK2ZjIihUDpGV9Uk3Xlz9sCKGuVauMlpbYcYz6OTOZP6DpkbrEA', '2024-02-10 22:43:01', '2024-02-10 22:43:01'),
(8, 'Md. Mahfuzur Rahman Shium', 'creativebrightstechnology@gmail.com', NULL, '$2y$10$9bTSUDH0V1idmrXuyOLLmuyE5HjXsNnCJ8Pzsuo4RRm06HAFhpUse', NULL, '2024-02-13 18:54:41', '2024-02-13 18:54:41'),
(9, 'Alamin', 'alaminsub2024@gmail.com', NULL, '$2y$10$jyhig4kD0jeMKi6xA9DoSuS0HRKWg.q6iXgMQlTop9bsgLGpYqYhe', NULL, '2024-02-13 21:08:01', '2024-02-13 21:08:01'),
(10, 'Harry Potter', 'harrypotter@gmail.com', NULL, '$2y$10$3e2R2.tT1IP2w0xYKunFB.s7zb0BrIYG0DMgJd8Ms32dwH/NETRNu', 'mBldvvEmV1VrgP8Fbh4awI0mBcB6LbGZFYx6cwrl5ME16b97Q5GJVIFYOCad', '2024-03-18 07:54:26', '2024-03-18 07:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_list`
--

CREATE TABLE `volunteer_list` (
  `volunteer_id` int(11) NOT NULL,
  `volunteer_name` varchar(255) NOT NULL,
  `volunteer_password` varchar(255) NOT NULL,
  `volunteer_status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `contest_information`
--
ALTER TABLE `contest_information`
  ADD PRIMARY KEY (`contest_id`);

--
-- Indexes for table `kit_management`
--
ALTER TABLE `kit_management`
  ADD PRIMARY KEY (`kit_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `team_payment_details`
--
ALTER TABLE `team_payment_details`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `volunteer_list`
--
ALTER TABLE `volunteer_list`
  ADD PRIMARY KEY (`volunteer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contest_information`
--
ALTER TABLE `contest_information`
  MODIFY `contest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kit_management`
--
ALTER TABLE `kit_management`
  MODIFY `kit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `volunteer_list`
--
ALTER TABLE `volunteer_list`
  MODIFY `volunteer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_payment_details`
--
ALTER TABLE `team_payment_details`
  ADD CONSTRAINT `team_payment_details_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
