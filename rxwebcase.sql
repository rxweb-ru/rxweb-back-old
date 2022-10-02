-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 15 2022 г., 15:13
-- Версия сервера: 10.6.7-MariaDB
-- Версия PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rxwebcase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cases`
--

CREATE TABLE `cases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cases_skins`
--

CREATE TABLE `cases_skins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `skin_id` bigint(20) UNSIGNED NOT NULL,
  `chance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `exteriors`
--

CREATE TABLE `exteriors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exteriors`
--

INSERT INTO `exteriors` (`id`, `title`, `title_en`, `short`) VALUES
(1, 'Прямо с завода', 'Factory New', 'FN'),
(2, 'Немного поношенное', 'Minimal Wear', 'MW'),
(3, 'После полевых испытаний', 'Field-Tested', 'FT'),
(4, 'Поношенное', 'Well-Worn', 'WW'),
(5, 'Закаленное в боях', 'Battle-Scarred', 'BS');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `guns`
--

CREATE TABLE `guns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `guns`
--

INSERT INTO `guns` (`id`, `title`) VALUES
(1, 'AK-47'),
(2, 'AWP'),
(3, 'M4A1-S'),
(4, 'M4A4'),
(5, 'USP-S'),
(6, 'P250'),
(7, 'Glock-18');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(41, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(42, '2022_08_15_102311_cases', 2),
(43, '2022_08_26_064655_create_rarities_table', 2),
(44, '2022_08_15_103137_guns', 2),
(49, '2022_08_15_102901_skins', 3),
(50, '2022_08_15_153434_cases_skins', 3),
(53, '2022_08_26_072007_add_sort_rarities_table', 2),
(54, '2022_08_26_064748_create_exteriors_table', 4),
(55, '2022_08_26_122149_create_skins_price_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rarities`
--

CREATE TABLE `rarities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rarities`
--

INSERT INTO `rarities` (`id`, `title`, `color`, `sort`) VALUES
(1, 'Ширпотреб', 'gray', 1),
(2, 'Промышленное', 'blue_l', 2),
(3, 'Армейское', 'blue', 3),
(4, 'Запрещенное', 'purple', 4),
(5, 'Засекреченное', 'pink', 5),
(6, 'Тайное', 'red', 6),
(7, 'Необычайное', 'yellow', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `skins`
--

CREATE TABLE `skins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(255) UNSIGNED DEFAULT NULL,
  `rarity_id` bigint(20) UNSIGNED NOT NULL,
  `gun_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `skins`
--

INSERT INTO `skins` (`id`, `title`, `title_en`, `img`, `price`, `rarity_id`, `gun_id`) VALUES
(4, 'Бог червей', 'Worm God', 'images/skins/p20Jl9bltj9ss4kHhdut7wFXVmkiBsRkwVQAP8LN.png', 94, 4, 2),
(5, 'Азимов', 'Asiimov', 'images/skins/VW03pULSGh1Ur5NIMqX0UwRUFmaMNNYVVIpN4cR3.png', 4683, 6, 2),
(6, 'История о драконе', 'Dragon Lore', 'images/skins/ftv3FiGqYd383oHZ8tMLzzBSPM5zei66Nxtac0mb.png', 413625, 6, 2),
(7, 'Красная линия', 'Redline', 'images/skins/Cc0vBrhoTcYK92C1J3nZauA5OSMvLAqN9BCh5Lp3.png', 2800, 5, 2),
(9, 'Азимов', 'Asiimov', 'images/skins/VCx7d9A0MAvtr8d54FdzenTkE4pVfpIVHiCcgwMC.png', 4800, 6, 1),
(11, 'Нитро', 'Nitro', 'images/skins/hmYCJrZ6StC2rM42fm4Dc7JJEBRFlNFhwholQqw2.png', 203, 4, 3),
(12, 'Скоростной зверь', 'Hyper Beast', 'images/skins/wYxcKsgYLaKGxCO0SLuMKmqynji7tYLWKl2JeRNv.png', 2658, 6, 3),
(13, 'Закрученный', 'Torque', 'images/skins/TpwyuA6lDJvV7i0R6evtAx9yWa4JPpREz76nuW3i.png', 138, 3, 5),
(14, 'Пустынный повстанец', 'Wasteland Rebel', 'images/skins/qAAxcigvQYr2lodxgz7BLYm9deqqKfzpqHnvoO2p.png', 161, 6, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `skins_price`
--

CREATE TABLE `skins_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skin_id` bigint(20) UNSIGNED NOT NULL,
  `exterior_id` bigint(20) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `stattrak` tinyint(1) DEFAULT NULL,
  `suvenir` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `skins_price`
--

INSERT INTO `skins_price` (`id`, `skin_id`, `exterior_id`, `price`, `stattrak`, `suvenir`) VALUES
(8, 5, 5, 3600, NULL, NULL),
(9, 5, 4, 4950, NULL, NULL),
(10, 5, 3, 5500, NULL, NULL),
(13, 6, 5, 231432.07, NULL, NULL),
(14, 6, 4, 292907.21, NULL, NULL),
(15, 6, 3, 286500, NULL, NULL),
(16, 6, 2, 550000, NULL, NULL),
(17, 6, 1, 707285.71, NULL, NULL),
(18, 7, 2, 3300, NULL, NULL),
(19, 7, 3, 1900, NULL, NULL),
(20, 7, 4, 2370, NULL, NULL),
(21, 9, 1, 8687.26, NULL, NULL),
(22, 9, 2, 2637.07, NULL, NULL),
(23, 9, 3, 1567, NULL, NULL),
(24, 9, 4, 1630, NULL, NULL),
(25, 9, 5, 1200, NULL, NULL),
(26, 11, 1, 466, NULL, NULL),
(27, 11, 2, 227, NULL, NULL),
(28, 11, 3, 110, NULL, NULL),
(29, 11, 4, 109, NULL, NULL),
(30, 11, 5, 105, NULL, NULL),
(32, 12, 1, 19876.55, 1, NULL),
(33, 12, 2, 2770, 1, NULL),
(34, 12, 3, 1400, 1, NULL),
(35, 12, 4, 1069, 1, NULL),
(36, 12, 5, 803, 1, NULL),
(37, 12, 1, 7158.06, NULL, NULL),
(38, 12, 2, 6560, NULL, NULL),
(39, 12, 3, 3390, NULL, NULL),
(40, 12, 4, 2511, NULL, NULL),
(41, 12, 5, 1900, NULL, NULL),
(74, 5, 1, 3000, NULL, NULL),
(98, 13, 1, 248, NULL, NULL),
(99, 13, 2, 224.84, NULL, NULL),
(100, 13, 3, 109.76, NULL, NULL),
(101, 13, 4, 153, NULL, NULL),
(102, 13, 5, 200, NULL, NULL),
(103, 13, 1, 88.58, 1, NULL),
(104, 13, 2, 72.14, 1, NULL),
(105, 13, 3, 54, 1, NULL),
(106, 13, 4, 54.9, 1, NULL),
(107, 13, 5, 132.77, 1, NULL),
(142, 14, 1, 202, NULL, NULL),
(143, 14, 2, 280, NULL, NULL),
(144, 14, 1, 602, 1, NULL),
(163, 4, 1, 145.5, NULL, NULL),
(164, 4, 2, 76.59, NULL, NULL),
(165, 4, 3, 74, NULL, NULL),
(166, 4, 4, 80.76, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Grisha', 'grisha223344@yandex.ru', NULL, '$2y$10$0xGs6vka54KfcNXwl9f.leYSZ4k.XMEtshO4iqrSXJ924YTrtt742', NULL, '2022-08-16 00:06:40', '2022-08-16 00:06:40');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cases_skins`
--
ALTER TABLE `cases_skins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cases_skins_case_id_foreign` (`case_id`),
  ADD KEY `cases_skins_skin_id_foreign` (`skin_id`);

--
-- Индексы таблицы `exteriors`
--
ALTER TABLE `exteriors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `guns`
--
ALTER TABLE `guns`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `rarities`
--
ALTER TABLE `rarities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skins_rarity_id_foreign` (`rarity_id`),
  ADD KEY `skins_gun_id_foreign` (`gun_id`);

--
-- Индексы таблицы `skins_price`
--
ALTER TABLE `skins_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skins_price_skin_id_foreign` (`skin_id`),
  ADD KEY `skins_price_exterior_id_foreign` (`exterior_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cases`
--
ALTER TABLE `cases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cases_skins`
--
ALTER TABLE `cases_skins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exteriors`
--
ALTER TABLE `exteriors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `guns`
--
ALTER TABLE `guns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `skins`
--
ALTER TABLE `skins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `skins_price`
--
ALTER TABLE `skins_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cases_skins`
--
ALTER TABLE `cases_skins`
  ADD CONSTRAINT `cases_skins_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`),
  ADD CONSTRAINT `cases_skins_skin_id_foreign` FOREIGN KEY (`skin_id`) REFERENCES `skins` (`id`);

--
-- Ограничения внешнего ключа таблицы `skins`
--
ALTER TABLE `skins`
  ADD CONSTRAINT `skins_gun_id_foreign` FOREIGN KEY (`gun_id`) REFERENCES `guns` (`id`),
  ADD CONSTRAINT `skins_rarity_id_foreign` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);

--
-- Ограничения внешнего ключа таблицы `skins_price`
--
ALTER TABLE `skins_price`
  ADD CONSTRAINT `skins_price_exterior_id_foreign` FOREIGN KEY (`exterior_id`) REFERENCES `exteriors` (`id`),
  ADD CONSTRAINT `skins_price_skin_id_foreign` FOREIGN KEY (`skin_id`) REFERENCES `skins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
