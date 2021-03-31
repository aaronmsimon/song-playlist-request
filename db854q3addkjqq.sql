-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 18, 2020 at 07:22 PM
-- Server version: 5.7.26-29-log
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db854q3addkjqq`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `ai` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE `acl_actions` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_categories`
--

CREATE TABLE `acl_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `category_desc` varchar(100) NOT NULL COMMENT 'Human readable description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_sessions`
--

CREATE TABLE `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('d3dec89ac3d694fbca97dd7e4c9c1e4c36702941', 2109896305, '2020-10-10 16:51:14', '2020-10-10 22:12:03', '76.102.30.16', 'Chrome 85.0.4183.121 on Windows 10'),
('b3e4061b7e84a54816c8adae1060e03fc7ed9c81', 3869454900, '2020-10-16 12:57:53', '2020-10-16 18:55:50', '76.14.51.143', 'Chrome 85.0.4183.121 on Mac OS X'),
('c45824f71b5f1e9a8b55a7478da5df8f385e0d08', 3767768159, '2020-10-10 23:39:21', '2020-10-11 04:39:21', '166.216.157.17', 'Safari 604.1 on iOS'),
('81a31f604f70f149a86bf154dac7a55227046046', 2844980724, '2020-10-10 22:10:01', '2020-10-11 03:16:33', '73.223.38.18', 'Safari 604.1 on iOS'),
('9479d33f9ccb41d4908cb6445114ce6393b6cbcf', 3170032713, '2020-10-10 22:18:23', '2020-10-11 05:32:41', '64.85.240.164', 'Safari 604.1 on iOS'),
('165af056e70b56e9ccc0d0ed70dbb02405df80b4', 3586929750, '2020-10-10 21:55:17', '2020-10-11 05:27:15', '174.194.148.241', 'Chrome 85.0.4183.127 on Android'),
('3c97dc36558b40932d374ec9987f7f5675f63369', 2227068613, '2020-10-10 21:55:31', '2020-10-11 03:00:59', '107.77.75.47', 'Safari 604.1 on iOS'),
('fe1fe985f0c23cc6835ce10524bbac880a50ba1c', 2109896305, '2020-10-10 21:43:44', '2020-10-11 05:57:29', '172.56.38.164', 'Chrome 86.0.4240.75 on Android');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ips_on_hold`
--

CREATE TABLE `ips_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_errors`
--

CREATE TABLE `login_errors` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_errors`
--

INSERT INTO `login_errors` (`ai`, `username_or_email`, `ip_address`, `time`) VALUES
(6, 'sewalaw', '166.216.157.17', '2020-10-10 23:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`) VALUES
(1, 'Good choice; that\'ll get Liz and Owen dancing close together'),
(2, 'Nothing says great pick like \'LO\''),
(3, 'That song gets Owen smiling from ear-to-ear'),
(4, 'Riley likes that song choice THIS much'),
(5, 'I think Liz thinks that song pick was questionable'),
(6, 'That song is like an Owen buzzcut'),
(7, 'Your song pick is as serene as the calm bay water'),
(8, 'They\'re all up to something'),
(9, 'That\'s a big-ass tree. Oh, cool song!'),
(10, 'Your song reminds Riley of St. Patrick\'s Day'),
(11, 'Matt doesn\'t like selfies'),
(12, 'That song makes me want to find some green, man'),
(13, 'Liz will squish your song like a Lebron fan\'s head'),
(14, 'I think Owen didn\'t get the memo to make a funny face'),
(15, 'Doesn\'t this remind you of The Matrix?'),
(16, 'Such a great Christmas song!'),
(17, 'That song is like the cool side of the pillow'),
(18, 'The kids are getting ready to make some PSLs'),
(20, 'Pro tip: look at the camera lens, not yourself when taking selfies'),
(21, 'Pro tip: look at the camera lens, not yourself when taking selfies'),
(22, 'I think they\'re trying to say, \'Sup cuz, cool song choice\''),
(26, 'Your song is dedicated to all our service men and women'),
(28, 'I think Liz would have PICKED the same song'),
(29, 'Don\'t be a pussy - pick a better song'),
(32, 'That should bring a Sparc(o) to the party!'),
(33, 'They both LOVED your song choice!'),
(34, 'Mostly in sync. Pick an N*Sync song next'),
(36, 'This doesn\'t need a caption');

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `artist` varchar(50) NOT NULL,
  `uri` varchar(50) NOT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  `insertdatetime` datetime NOT NULL,
  `requestedby` int(10) UNSIGNED NOT NULL,
  `played` tinyint(1) NOT NULL,
  `playdatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `name`, `artist`, `uri`, `img_url`, `insertdatetime`, `requestedby`, `played`, `playdatetime`) VALUES
(1, 'I\'m Yours', 'Vitamin String Quartet', 'spotify:track:7g5oISO4ErqRfyfWDZPEVc', 'https://i.scdn.co/image/ab67616d00001e02180666756159a050a1128d19', '2020-10-03 22:14:26', 3162486421, 0, NULL),
(2, 'Sucker', 'Jonas Brothers', 'spotify:track:22vgEDb5hykfaTwLuskFGD', 'https://i.scdn.co/image/ab67616d00001e02de1a3a5eaa0c75bb18e7b597', '2020-10-11 02:56:17', 2227068613, 0, NULL),
(3, 'Landslide', 'Fleetwood Mac', 'spotify:track:5ihS6UUlyQAfmp48eSkxuQ', 'https://i.scdn.co/image/ab67616d00001e024fb043195e8d07e72edc7226', '2020-10-11 02:57:01', 2227068613, 0, NULL),
(4, 'In Your Eyes - 2012 Remaster', 'Peter Gabriel', 'spotify:track:4qN7nSAVTjPfOOz0wkRQpM', 'https://i.scdn.co/image/ab67616d00001e028b1f1cbeff8a145a79cf7228', '2020-10-11 03:00:22', 2227068613, 0, NULL),
(5, 'One Margarita', 'Luke Bryan', 'spotify:track:6NhS5LwYbJ6xD7BGvlWRJO', 'https://i.scdn.co/image/ab67616d00001e02c2a11891f48798bb10ba75ac', '2020-10-11 03:16:33', 2844980724, 0, NULL),
(6, 'Sail Away', 'David Gray', 'spotify:track:7w5GAUVhimHVPSwTsPnxq5', 'https://i.scdn.co/image/ab67616d00001e02248a1fed548434258c112e34', '2020-10-11 03:21:24', 3170032713, 0, NULL),
(7, 'Sweet Child O\' Mine', 'Guns N\' Roses', 'spotify:track:7snQQk1zcKl8gZ92AnueZW', 'https://i.scdn.co/image/ab67616d00001e0221ebf49b3292c3f0f575f0f5', '2020-10-11 03:47:39', 3586929750, 0, NULL),
(8, 'B.Y.O.B.', 'System Of A Down', 'spotify:track:0EYOdF5FCkgOJJla8DI2Md', 'https://i.scdn.co/image/ab67616d00001e02c65f8d04502eeddbdd61fa71', '2020-10-11 04:39:41', 3767768159, 0, NULL),
(9, 'Jump Around', 'House Of Pain', 'spotify:track:3TZwjdclvWt7iPJUnMpgcs', 'https://i.scdn.co/image/ab67616d00001e02663ceb45ca1f25c247034c31', '2020-10-11 04:40:26', 3767768159, 0, NULL),
(10, 'The Humpty Dance', 'Digital Underground', 'spotify:track:3OcQkcvTcohs8vO8Rd3sKF', 'https://i.scdn.co/image/ab67616d00001e02c5a8971932c4539c1b6ea229', '2020-10-11 04:40:56', 3767768159, 0, NULL),
(11, 'Baby Got Back', 'Sir Mix-A-Lot', 'spotify:track:1SAkL1mYNJlaqnBQxVZrRl', 'https://i.scdn.co/image/ab67616d00001e02f82c7e4376cf8267fb396b7d', '2020-10-11 04:41:56', 3767768159, 0, NULL),
(12, 'Paradise City', 'Guns N\' Roses', 'spotify:track:6eN1f9KNmiWEhpE2RhQqB5', 'https://i.scdn.co/image/ab67616d00001e0221ebf49b3292c3f0f575f0f5', '2020-10-11 04:42:18', 3767768159, 0, NULL),
(13, 'Kickstart My Heart', 'Mötley Crüe', 'spotify:track:7GonnnalI2s19OCQO1J7Tf', 'https://i.scdn.co/image/ab67616d00001e027bbaa91ad1135a89329f2960', '2020-10-11 04:42:48', 3767768159, 0, NULL),
(14, 'Don\'t Stand So Close To Me', 'The Police', 'spotify:track:5veJDT0MLsLbhYsx42GXUD', 'https://i.scdn.co/image/ab67616d00001e02fb1bc65edf4717e75fbc70ab', '2020-10-16 17:58:46', 3869454900, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `username_or_email_on_hold`
--

CREATE TABLE `username_or_email_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`, `uuid`) VALUES
(51054561, 'dbaguette', 'dbaguette@gmail.com', 1, '0', '$2y$11$xReY6fK3gOICR6haxoRqjuzGkbl/MnyDsZklQZroKTxMlnbi9Fx1u', NULL, NULL, NULL, '2020-09-30 11:22:55', '2020-09-30 11:22:17', '2020-09-30 16:22:55', '510545615f74b0b9587f5'),
(69967187, 'barillabear ', 'dahlia7lucky@gmail.com', 6, '0', '$2y$11$d6x/FgFL4sY6BZrf/OmwpOXa22GmPovQCuHsn3oIhDpI3Q2rf3/CO', NULL, NULL, NULL, '2020-09-30 22:34:10', '2020-09-30 22:34:10', '2020-10-01 03:34:10', '699671875f754e320b465'),
(175136989, 'Testuser', 'Test@test.com', 6, '0', '$2y$11$XT7Ami4hUwTTuT96H.o3ve0RqZuqTLeUG0Yaf6xUtcZAY5bDVrr9i', NULL, NULL, NULL, '2020-10-10 17:49:08', '2020-10-10 17:49:08', '2020-10-10 22:49:08', '1751369895f823a6408ca1'),
(176680476, 'TheShing', 'Shingadelic@gmail.com', 6, '0', '$2y$11$KQoFs0HACKzpVmJbRFQf2eKv5pPpZSyw0Tf8ph3Ssbjzlgnpma3gG', NULL, NULL, NULL, '2020-09-29 23:27:57', '2020-09-29 23:27:09', '2020-09-30 04:31:47', '1766804765f74091db004b'),
(192135969, 'JFlick', 'jpflick@gmail.com', 6, '0', '$2y$11$oS91ylO7KfiEcmNl44jhW.QxYEJE2qiqR76D6u/X8K1yPjMOlZb6u', '$2y$11$OOWcDGIXiBKH3w6Wqt3spOefLph9OEVU0ChHNcnPG7Y.mxwyJqi1q', '2020-10-10 21:51:08', NULL, '2020-10-01 13:06:21', '2020-10-01 13:06:21', '2020-10-11 02:51:08', '1921359695f761a9d23243'),
(1380704667, 'Aaron', 'aaronsimon@gmail.com', 6, '0', '$2y$11$IN7gDBVezRcunBQ1n6G8jezWaX1k/3T36tJMPqwfR62ZMvmBSxJ/y', NULL, NULL, NULL, '2020-10-10 17:47:35', '2020-09-29 22:59:28', '2020-10-11 02:13:07', '13807046675f7402a0496ff'),
(1436060941, 'The Groom', 'Oblackford@gmail.com', 9, '0', '$2y$11$qJRu1BoxpmXn9yaFRj8myuoXa20jcFS..D9f60o4x6Vbj2rbAp4D6', NULL, NULL, NULL, NULL, '2020-09-29 23:28:43', '2020-09-30 07:04:14', '14360609415f74097b50498'),
(2109896305, 'TimmyGMusic', 'timmygmusic@live.com', 9, '0', '$2y$11$M71.3ApCjj78zkceqRmt2u1MudobdRXbiqdgDPZD4Blb8fTiU9xj2', NULL, NULL, NULL, '2020-10-10 21:43:44', '2020-10-10 16:51:14', '2020-10-11 02:43:44', '21098963055f822cd21b726'),
(2227068613, 'Amyf', 'amyflick524@gmail.com', 6, '0', '$2y$11$jEuvo4rg7KiUhR84No8vnO5T/5grS0sK15UMsqWge.jxYc.1v/ULq', NULL, NULL, NULL, '2020-10-10 21:55:31', '2020-10-10 21:55:31', '2020-10-11 02:55:31', '22270686135f82742376201'),
(2822928412, 'Zachary', 'zachabee@gmail.com', 6, '0', '$2y$11$o7TDrNgvOclzoIw8dnSN1Ohwvsd.mbUz5.RXsZusPHvcPkK2pnrt.', NULL, NULL, NULL, '2020-09-30 21:50:21', '2020-09-30 21:50:21', '2020-10-01 02:50:21', '28229284125f7543edf30bf'),
(2844980724, 'SayYee2020', 'Cardellab@yahoo.com', 6, '0', '$2y$11$ISf9/VnXC2qy9WG6nWtHu.4e5B1aMKCcgs.ac/imrr6IHo1SaJ6d2', NULL, NULL, NULL, '2020-10-10 22:10:01', '2020-09-29 23:19:46', '2020-10-11 03:10:01', '28449807245f7407628fb9e'),
(2979005219, 'Papa Rich', 'Parichardson13@gmail.com ', 6, '0', '$2y$11$Cp49DtTGl2dHqFC5UlY1oOjuH7DksfWzPw81z30kzLhKP9nso.j8.', NULL, NULL, NULL, '2020-09-30 14:20:47', '2020-09-30 14:19:34', '2020-10-01 02:42:21', '29790052195f74da467828d'),
(3162486421, 'The Bride', 'lizbrandt24@gmail.com', 9, '0', '$2y$11$EdGxyQ.LRbAWmZREzpUIees9jfDTZYqM1dNPyxXNo5Ny007ZY/J3e', NULL, NULL, NULL, '2020-10-06 11:19:04', '2020-09-29 23:17:19', '2020-10-06 16:19:04', '31624864215f7406cf7cede'),
(3170032713, 'allicat6914', 'Wigtonfamily14@gmail.com', 6, '0', '$2y$11$ziphgcU8CZChKhZV6W2.au7XTCRKLmjV4l0XxUopKiaT.4XnutXGa', NULL, NULL, NULL, '2020-10-10 22:18:23', '2020-10-10 22:18:23', '2020-10-11 03:18:23', '31700327135f82797fbf267'),
(3338467175, 'Big', 'mukund.nair83@gmail.com', 6, '0', '$2y$11$153UAgh/KdNEQDfKdGAg2.YY5rqRD3t8Tf4cJxsEERPhvH69YzMLK', NULL, NULL, NULL, '2020-10-05 16:35:19', '2020-10-05 16:35:19', '2020-10-05 21:35:19', '33384671755f7b9197caa1d'),
(3586929750, 'Lekshmi', 'Lekshmigs@gmail.com', 6, '0', '$2y$11$czOylTtJjutA1zSfA2jGy.RBGFPkR5HSfKCMONGAoCawTQsZrUg2.', NULL, NULL, NULL, '2020-10-10 21:55:17', '2020-10-10 21:55:17', '2020-10-11 02:55:17', '35869297505f8274150b119'),
(3767768159, 'Sewarat', 'Sewarat@yahoo.com', 6, '0', '$2y$11$hG/.0e3yM/8ey6dFd43HE.G4cGn.8oOk4VLL8bYXeLntop5Yxrwym', NULL, NULL, NULL, '2020-10-10 23:39:21', '2020-10-10 23:39:21', '2020-10-11 04:39:21', '37677681595f828c799aaaa'),
(3869454900, 'foxycleo', 'foxyc08@gmail.com', 6, '0', '$2y$11$q.rp/0iCEd0cHq3iYMdoI.9pwJHPdAOIVwapnAyPSz8OeszhPTC5u', NULL, NULL, NULL, '2020-10-16 12:57:53', '2020-09-30 12:55:44', '2020-10-16 17:57:53', '38694549005f74c6a007d67');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `ca_passwd_trigger` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF ((NEW.passwd <=> OLD.passwd) = 0) THEN
        SET NEW.passwd_modified_at = NOW();
    END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`ai`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `acl_categories`
--
ALTER TABLE `acl_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD UNIQUE KEY `category_desc` (`category_desc`);

--
-- Indexes for table `auth_sessions`
--
ALTER TABLE `auth_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `denied_access`
--
ALTER TABLE `denied_access`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `login_errors`
--
ALTER TABLE `login_errors`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  ADD PRIMARY KEY (`ai`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_actions`
--
ALTER TABLE `acl_actions`
  MODIFY `action_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acl_categories`
--
ALTER TABLE `acl_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `denied_access`
--
ALTER TABLE `denied_access`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ips_on_hold`
--
ALTER TABLE `ips_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_errors`
--
ALTER TABLE `login_errors`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `username_or_email_on_hold`
--
ALTER TABLE `username_or_email_on_hold`
  MODIFY `ai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acl`
--
ALTER TABLE `acl`
  ADD CONSTRAINT `acl_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `acl_actions` (`action_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `acl_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD CONSTRAINT `acl_actions_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `acl_categories` (`category_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
