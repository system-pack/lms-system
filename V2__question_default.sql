-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018 年 8 朁E09 日 13:09
-- サーバのバージョン： 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `question_default`
--

CREATE TABLE `question_default` (
  `question_id` int(11) NOT NULL,
  `no` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `init` varchar(1024) COLLATE utf8mb4_bin NOT NULL,
  `memo` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  `insert_user_id` int(11) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user_id` int(11) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- テーブルのデータのダンプ `question_default`
--

INSERT INTO `question_default` (`question_id`, `no`, `type`, `init`, `memo`, `insert_user_id`, `insert_time`, `update_user_id`, `update_time`) VALUES
(1, 1, 2, 'select * from books where id=272096;', NULL, 999, '2018-08-09 01:29:43', 999, '2018-08-09 01:29:43'),
(1, 2, 2, 'select * from books where 272096;', NULL, 999, '2018-08-09 01:30:34', 999, '2018-08-09 01:30:34'),
(1, 3, 2, 'select * from books where book_id=272096;', NULL, 0, '2018-08-09 01:30:57', 999, '2018-08-09 01:30:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question_default`
--
ALTER TABLE `question_default`
  ADD PRIMARY KEY (`question_id`,`no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
