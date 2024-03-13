-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2024 at 10:41 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'เรื่องทั่วไป'),
(2, 'เรื่องเรียน'),
(3, 'เรื่องกีฬา');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(20148) NOT NULL,
  `post_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `post_date`, `user_id`, `post_id`) VALUES
(2, 'เราก็พิมพ์ตามไม่ทันอาจารย์เหมือนกันเลย อาจารย์น่าจะสอนเร็วแหละเราว่านะ', '2024-03-06 16:39:25', 12, 4),
(3, 'F แน่นอน', '2024-03-06 16:40:52', 12, 2),
(4, 'ไม่ทันเหมือนกันครับ', '2024-03-06 16:42:04', 10, 4),
(5, 'เราพิมพ์ตามอาจารย์ทันนะ', '2024-03-06 16:48:26', 13, 4);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` varchar(2048) NOT NULL,
  `post_date` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `post_date`, `cat_id`, `user_id`) VALUES
(2, 'จะFมั้ยคับ', 'กลัวจะFแน่นอน', '2024-02-28 16:43:32', 2, 9),
(4, 'พิมพ์โปรแกรมตามอาจารย์ไม่ทันเลยครับ', 'ทำยังไงให้พิมพ์ตามอาจารย์ทันครับ', '2024-03-06 15:24:44', 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(32) NOT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `name`, `gender`, `email`, `role`) VALUES
(1, '555', '5555', 'สุภรินทร์ ศรีคล้อย', 'f', 'suparin@kmutnb.ac.th', 'm'),
(2, 'SPR', '111', 'nat spr', 'f', 'spr@gmail.com', 'm'),
(3, 'hamgee', '1314', 'jm js', 'o', 'js1314@email.com', 'm'),
(4, 'ham', '1314', 'jm js', 'o', 'js131405@email.com', 'm'),
(8, 'suparin', '3010', 'suparin srikhloi', 'o', 'suparin3010@email.com', 'm'),
(9, 'admin', '8dc9fa69ec51046b4472bb512e292d959edd2aef', 'admin', 'o', 'admin@email.com', 'a'),
(10, 'fff', 'f6949a8c7d5b90b4a698660bbfb9431503fbb995', 'fff', 'o', 'fff@gmail.com', 'm'),
(11, 'member', 'b54df48c4c77522382a5a3c2f0358573ad43746e', 'member', 'o', 'member@gmail.com', 'm'),
(12, 'suparin02', '7c222fb2927d828af22f592134e8932480637c0d', 'suparin srikhloi', 'f', 'suparin02@kmutnb.ac.th', 'm'),
(13, 'jisung', '3a85d2178d036673a374a5acab7da4de0361b6e8', 'jisung park', 'm', 'jisung@gmail.com', 'm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
