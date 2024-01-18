-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 04:04 AM
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
-- Database: `forum_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment_list`
--

CREATE TABLE `comment_list` (
  `comment_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `date_created` char(19) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `comment_list`
--

INSERT INTO `comment_list` (`comment_id`, `topic_id`, `user_id`, `comment`, `date_created`) VALUES
(7, 5, 9, 'I\'ve had a similar problem with my tomatoes in the past. It could be a few things. Have you checked for pests like aphids or signs of diseases on the leaves?', '2023-11-05 07:25:06'),
(8, 5, 11, 'I agree with Ms. Calderon. It\'s essential to rule out pests and diseases first. Also, check your watering practices. Overwatering or underwatering can lead to leaf curling.', '2023-11-05 07:44:08'),
(9, 5, 12, 'In my experience, temperature extremes can also cause leaf curling. Make sure your tomatoes are not exposed to excessive heat or cold.', '2023-11-05 07:48:53'),
(10, 5, 12, 'Don\'t forget to consider your soil nutrients. Tomato plants need adequate levels of calcium and magnesium to thrive. Nutrient deficiencies can manifest as leaf issues.', '2023-11-05 07:49:32'),
(12, 5, 11, 'I\'d like to add that improper pruning can stress the plants and cause curling leaves. Make sure you\'re using the right techniques. Also, has there been any exposure to herbicides or chemicals in your garden? That can damage tomato plants as well.', '2023-11-05 07:52:42'),
(13, 5, 8, 'Thank you all for the advice. I\'ll start by checking for pests and diseases and then examine my watering and nutrient levels. I appreciate your help, and I\'ll keep you updated on how it goes!', '2023-11-05 07:53:48'),
(15, 7, 8, 'Neem oil has been effective for me in controlling stem and fruit borers in eggplants. It\'s a natural pesticide that can help deter these pests.', '2023-11-05 08:22:33'),
(16, 7, 11, 'Consider using a garlic and chili pepper spray. Blend garlic and chili peppers with water, strain the mixture, and then spray it on your eggplants. This mixture can serve as a natural repellent for many pests.', '2023-11-05 08:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `sqlite_sequence`
--

CREATE TABLE `sqlite_sequence` (
  `name` longtext DEFAULT NULL,
  `seq` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sqlite_sequence`
--

INSERT INTO `sqlite_sequence` (`name`, `seq`) VALUES
('user_list', '18'),
('topic_list', '15'),
('comment_list', '19');

-- --------------------------------------------------------

--
-- Table structure for table `topic_list`
--

CREATE TABLE `topic_list` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(2) NOT NULL,
  `date_created` char(19) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `topic_list`
--

INSERT INTO `topic_list` (`topic_id`, `user_id`, `title`, `description`, `status`, `date_created`) VALUES
(5, 8, 'Can anyone help me determine what is causing my tomato plants to curl up and become unhealthy?', 'Hey fellow farmers, I\'m facing a problem with my tomato plants, and I could use some advice. The leaves on my tomato plants are curling up, and they look unhealthy. Does anyone have any idea what might be causing this issue?', '1', '2023-11-05 06:52:56'),
(7, 9, 'What are effective organic pesticides for stem and fruit borer of Eggplant??', 'I lose 25 to 40 percent of my eggplant crop to fruit borers. Even a minor blemish on the fruit results in it being discarded at the market. Any tips on effective organic pesticides for this issue?', '1', '2023-11-05 08:18:47'),
(10, 9, 'dfghjkl;', 'aszdxfcgvhbjnkml,;.\'/', '0', '2023-12-03 12:47:37'),
(13, 9, 'ertyuio', 'wertyuio', '0', '2024-01-10 04:52:06'),
(14, 9, 'sdfgh', 'dfghj', '0', '2024-01-12 12:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_list`
--

CREATE TABLE `user_list` (
  `user_id` int(11) NOT NULL,
  `fullname` int(11) NOT NULL,
  `username` longtext NOT NULL,
  `password` longtext NOT NULL,
  `type` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date_created` char(19) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment_list`
--
ALTER TABLE `comment_list`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `topic_list`
--
ALTER TABLE `topic_list`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
