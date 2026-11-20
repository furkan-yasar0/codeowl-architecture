-- CodeOwl Database Schema (Structure Only)
-- Generated for portfolio purposes
-- No actual data included

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Ağu 2024, 13:32:15
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `codeowl`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `extension` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `commentsforum`
--

CREATE TABLE `commentsforum` (
  `comment_id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `likes` int(100) NOT NULL DEFAULT 0,
  `forum_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `devhub`
--

CREATE TABLE `devhub` (
  `id` int(100) NOT NULL,
  `creater` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `c_id` int(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `likes` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `follow`
--

CREATE TABLE `follow` (
  `id` int(100) NOT NULL,
  `follower` varchar(100) NOT NULL,
  `getFollowed` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `forum`
--

CREATE TABLE `forum` (
  `forum_id` int(100) NOT NULL,
  `creater` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `likes` int(100) NOT NULL DEFAULT 0,
  `comments` int(100) NOT NULL DEFAULT 0,
  `c_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lastmessages`
--

CREATE TABLE `lastmessages` (
  `id` int(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `m_from` varchar(100) NOT NULL,
  `m_to` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `seen` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likedevhub`
--

CREATE TABLE `likedevhub` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `d_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likes`
--

CREATE TABLE `likes` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `forum_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likescomments`
--

CREATE TABLE `likescomments` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `comment_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `m_from` varchar(100) NOT NULL,
  `m_to` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `seen` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilePhoto` varchar(100) NOT NULL DEFAULT 'default.png',
  `role` varchar(100) NOT NULL DEFAULT 'member',
  `loggedIn` int(100) NOT NULL DEFAULT 0,
  `googleAccount` int(100) NOT NULL DEFAULT 0,
  `banned` int(100) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `commentsforum`
--
ALTER TABLE `commentsforum`
  ADD PRIMARY KEY (`comment_id`);

--
-- Tablo için indeksler `devhub`
--
ALTER TABLE `devhub`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`forum_id`),
  ADD KEY `FK_forumCategories` (`c_id`);

--
-- Tablo için indeksler `lastmessages`
--
ALTER TABLE `lastmessages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `likedevhub`
--
ALTER TABLE `likedevhub`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `likescomments`
--
ALTER TABLE `likescomments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `commentsforum`
--
ALTER TABLE `commentsforum`
  MODIFY `comment_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `devhub`
--
ALTER TABLE `devhub`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `forum`
--
ALTER TABLE `forum`
  MODIFY `forum_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `lastmessages`
--
ALTER TABLE `lastmessages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `likedevhub`
--
ALTER TABLE `likedevhub`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `likescomments`
--
ALTER TABLE `likescomments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `FK_forumCategories` FOREIGN KEY (`c_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
