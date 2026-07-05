-- ============================================================
--  PKL Web Bojonegara — Database Schema
--  Cleaned up and anonymized
--
--  Original export: phpMyAdmin 5.1.1, MariaDB 10.4.22, PHP 8.0.13
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- Table: category
-- --------------------------------------------------------

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'News', 'news', '2022-01-06 05:18:36', '2022-01-06 05:18:36'),
(2, 'Announcements', 'announcements', '2022-01-06 07:04:48', '2022-01-06 07:04:48'),
(3, 'Community', 'community', '2022-01-08 02:59:21', '2022-01-08 02:59:21'),
(4, 'Tips & Tricks', 'tips-tricks', '2022-01-09 04:22:31', '2022-01-09 04:22:31');

-- --------------------------------------------------------
-- Table: tags
-- --------------------------------------------------------

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'internship', 'internship', '2022-01-06 06:51:03', '2022-01-06 06:51:03'),
(2, 'update', 'update', '2022-01-06 06:58:34', '2022-01-06 06:58:34'),
(3, 'tutorial', 'tutorial', '2022-01-06 07:04:02', '2022-01-06 07:04:02'),
(4, 'event', 'event', '2022-01-09 04:22:31', '2022-01-09 04:22:31');

-- --------------------------------------------------------
-- Table: users
--
-- ⚠ NOTE: the original dump had 3 REAL user records here, with real
-- email addresses and real bcrypt password hashes. That data has
-- been fully replaced below with anonymized demo accounts.
-- Demo password for both accounts is: "password"
-- --------------------------------------------------------

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Admin Bojonegara', 'admin@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5by/PSglAd1eeQMv3Or2Hd8gscJPX8oPULTuMSm', NULL, '2022-01-09 11:53:22', '2022-01-09 11:53:22', 1),
(2, 'Content Editor', 'editor@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5by/PSglAd1eeQMv3Or2Hd8gscJPX8oPULTuMSm', NULL, '2022-01-09 22:22:14', '2022-01-09 22:22:14', 0);

-- --------------------------------------------------------
-- Table: posts
-- --------------------------------------------------------

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `title`, `category_id`, `content`, `image`, `created_at`, `updated_at`, `slug`, `deleted_at`, `user_id`) VALUES
(1, 'Welcome to the Bojonegara Sub-district Blog', 1, 'This site was built to share news and announcements for the local community in an easier, more accessible way.', NULL, '2022-01-06 11:54:18', '2022-01-06 11:54:18', 'welcome-to-the-bojonegara-sub-district-blog', NULL, 1),
(2, '2022 Internship Program Overview', 2, 'A short recap of this year internship (PKL) program, including the goals of the web development project.', NULL, '2022-01-08 02:59:21', '2022-01-08 02:59:21', '2022-internship-program-overview', NULL, 1),
(3, 'Tips for New Interns Joining the Office', 4, 'A few practical tips for students starting their internship placement, from adapting to the work culture to managing daily tasks.', NULL, '2022-01-08 03:07:17', '2022-01-08 03:07:17', 'tips-for-new-interns-joining-the-office', NULL, 2),
(4, 'Community Clean-up Event Highlights', 3, 'Photos and a short summary from the latest community clean-up event held over the weekend.', NULL, '2022-01-09 22:01:36', '2022-01-09 22:01:36', 'community-clean-up-event-highlights', NULL, 2);

-- --------------------------------------------------------
-- Table: posts_tags (pivot)
-- --------------------------------------------------------

CREATE TABLE `posts_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posts_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts_tags` (`id`, `posts_id`, `tags_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 3, 1, NULL, NULL),
(5, 3, 3, NULL, NULL),
(6, 4, 4, NULL, NULL);

-- --------------------------------------------------------
-- Table: password_resets (standard Laravel table)
-- --------------------------------------------------------

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table: personal_access_tokens (Laravel Sanctum)
-- --------------------------------------------------------

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
-- Table: failed_jobs (standard Laravel table)
-- --------------------------------------------------------

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
-- Indexes for dumped tables
-- --------------------------------------------------------

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_tags_posts_id_foreign` (`posts_id`),
  ADD KEY `posts_tags_tags_id_foreign` (`tags_id`);

ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`);

ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

-- --------------------------------------------------------
-- AUTO_INCREMENT for dumped tables
-- --------------------------------------------------------

ALTER TABLE `category` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `tags` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `users` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `posts` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `posts_tags` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `personal_access_tokens` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `failed_jobs` MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
-- Foreign key constraints
-- --------------------------------------------------------

ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_posts_id_foreign` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_tags_tags_id_foreign` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

COMMIT;
