-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-01-16 08:34:34
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `final_siderproject`
--

-- --------------------------------------------------------

--
-- 資料表結構 `keywords`
--

CREATE TABLE `keywords` (
  `id` bigint(20) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `times` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `keywords`
--

INSERT INTO `keywords` (`id`, `keyword`, `times`) VALUES
(1, '小貓咪', 3),
(2, '數獨', 2),
(3, '貓貓觀察日記', 3),
(4, '2048', 1),
(5, '記帳', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `memberid` bigint(20) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `picurl` varbinary(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `isblocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `memberorder`
--

CREATE TABLE `memberorder` (
  `memberid` bigint(20) NOT NULL,
  `orderid` bigint(20) NOT NULL,
  `owned` tinyint(1) NOT NULL,
  `wanted` tinyint(1) NOT NULL,
  `collected` tinyint(1) NOT NULL,
  `evaluate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `membertag`
--

CREATE TABLE `membertag` (
  `memberid` bigint(20) NOT NULL,
  `tagidm` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `message`
--

CREATE TABLE `message` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `senderid` bigint(20) NOT NULL,
  `receiverid` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `createdat` datetime NOT NULL DEFAULT current_timestamp(),
  `isread` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orderform`
--

CREATE TABLE `orderform` (
  `orderid` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `detail` longtext DEFAULT NULL,
  `picurl` longtext DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `people` int(11) NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `upload` date DEFAULT NULL,
  `newdate` date DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `ordertag`
--

CREATE TABLE `ordertag` (
  `orderid` bigint(20) NOT NULL,
  `tagido` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `tag`
--

CREATE TABLE `tag` (
  `tagid` int(10) UNSIGNED NOT NULL,
  `tagidm` int(10) UNSIGNED NOT NULL,
  `tagname` varchar(255) DEFAULT NULL,
  `tagido` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tag`
--

INSERT INTO `tag` (`tagid`, `tagidm`, `tagname`, `tagido`, `category`) VALUES
(1, 1, 'CSS', 1, 'Front'),
(2, 2, 'SCSS', 2, 'Front'),
(3, 3, 'Sass', 3, 'Front'),
(4, 4, 'JavaScript', 4, 'Front'),
(5, 5, 'jQuery', 5, 'Front'),
(6, 6, 'Vue', 6, 'Front'),
(7, 7, 'React', 7, 'Front'),
(8, 8, 'Java', 8, 'Back'),
(9, 9, 'Python', 9, 'Back'),
(10, 10, 'Ruby', 10, 'Back'),
(11, 11, 'PHP', 11, 'Back'),
(12, 12, 'C#', 12, 'Back'),
(13, 13, 'C++', 13, 'Back'),
(14, 14, 'Go', 14, 'Back'),
(15, 15, 'Node.js', 15, 'Back'),
(16, 16, 'MySQL', 16, 'Database'),
(17, 17, 'SQL', 17, 'Database'),
(18, 18, 'Server', 18, 'Database'),
(19, 19, 'PostgreSQL', 19, 'Database'),
(20, 20, 'MongoDB', 20, 'Database');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyword` (`keyword`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `memberorder`
--
ALTER TABLE `memberorder`
  ADD KEY `memberid` (`memberid`),
  ADD KEY `orderid` (`orderid`);

--
-- 資料表索引 `membertag`
--
ALTER TABLE `membertag`
  ADD KEY `tagidm` (`tagidm`),
  ADD KEY `memberid` (`memberid`);

--
-- 資料表索引 `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageid`),
  ADD KEY `sendmember` (`senderid`),
  ADD KEY `receivermember` (`receiverid`);

--
-- 資料表索引 `orderform`
--
ALTER TABLE `orderform`
  ADD PRIMARY KEY (`orderid`);

--
-- 資料表索引 `ordertag`
--
ALTER TABLE `ordertag`
  ADD KEY `tagido` (`tagido`),
  ADD KEY `orderid` (`orderid`);

--
-- 資料表索引 `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `tagidm` (`tagidm`),
  ADD KEY `tagido` (`tagido`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `memberid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message`
--
ALTER TABLE `message`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderform`
--
ALTER TABLE `orderform`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag`
--
ALTER TABLE `tag`
  MODIFY `tagid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
