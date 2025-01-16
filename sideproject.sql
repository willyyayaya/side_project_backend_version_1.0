-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-01-14 04:29:51
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
-- 資料庫： `sideproject`
--

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `memberid` bigint(20) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `isblocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`memberid`, `account`, `password`, `email`, `picurl`, `name`, `birthday`, `tel`, `isblocked`) VALUES
(103, 'Carolyn', 'ZLG53PDP1VZ', 'nunc.sit@google.couk', 'http://netflix.com/fr?q=4', 'Magee Valencia', '2025-06-18', '0947324582', 1),
(104, 'Bianca', 'LNV82DER5SL', 'metus@outlook.ca', 'http://nytimes.com/one?page=1&offset=1', 'Jermaine Raymond', '2025-10-29', '0948164822', 1),
(105, 'Nero', 'MCK25UGL9BG', 'tempor.augue@outlook.org', 'http://pinterest.com/fr?g=1', 'Cora Quinn', '2025-09-02', '0955477435', 0),
(106, 'Allistair', 'YBT47NSN0EH', 'fames@yahoo.com', 'https://netflix.com/site?q=test', 'Desirae Whitney', '2025-10-26', '0978329281', 0),
(107, 'Carlos', 'DQK63HCC0TD', 'class.aptent@protonmail.ca', 'https://google.com/sub/cars?p=8', 'Forrest Evans', '2025-04-11', '0946242936', 1),
(108, 'Hashim', 'SUO93SCT4EH', 'mauris.magna@hotmail.ca', 'http://whatsapp.com/en-ca?page=1&offset=1', 'Oscar Roy', '2025-09-28', '05-29881774', 1),
(109, 'Gail', 'RHQ24MIQ1QV', 'justo.praesent@google.net', 'https://wikipedia.org/fr?q=0', 'Fletcher Hampton', '2025-10-27', '05-64477547', 1),
(110, 'Bruno', 'XMF70PQZ8FT', 'semper.auctor.mauris@icloud.edu', 'https://nytimes.com/site?page=1&offset=1', 'Dexter Paul', '2025-10-08', '0947676258', 0),
(111, 'Dora', 'JIV75XFC8LR', 'a.ultricies.adipiscing@yahoo.couk', 'https://wikipedia.org/fr?client=g', 'Finn Dillard', '2025-11-02', '0955831167', 1),
(112, 'Tanek', 'EHS62DDJ5NS', 'mauris.sapien@icloud.org', 'http://guardian.co.uk/settings?q=test', 'Perry Gentry', '2025-01-30', '0974683452', 1),
(124, 'Haswer', 'FEO93SCT4EH', 'mauris.magna@gmail.ca', 'http://whatsapp.com/en-ca?page=1&offset=1', 'Oscar Jay', '2025-09-28', '05-29881774', 0),
(142, 'updatedAccount', 'updatedPassword', 'john.doe@example.com', NULL, 'John Doe', NULL, NULL, 0),
(166, 'user135', 'pass123', 'user123@example.com', NULL, 'User124', NULL, NULL, 0),
(167, 'jakata', '$2a$10$iF7KvGC.PzPKPJL1dcr2seh7FMlfHCdKM2Nf1PtH69n5LHgbxDqCW', 'ssseee88@gmail.com', NULL, '捷克', '1888-05-05', '0789456123', 0),
(168, 'gigigi', '$2a$10$oGppEud7nQq4vC4IAY4jzueCfZHE12FM2.3fcM1pU.y6j8eJNku9m', 'gigigi556@gmail.com', NULL, '既矮', '1888-06-06', '0587412369', 0),
(169, 'emma', '$2a$10$85HBYrGpEKbGFs7nCYNPGOc3NafwlwVB1KRkRbuZELzS2C8KmSiIu', 'emma@gmail.com', NULL, '艾瑪', '1555-08-08', '0987456321', 0),
(170, 'LLUURR', '$2a$10$BRgzIn4CiHd1qjzvclQl8.ylNipCz4vQgpyDl3ZNwB91KmpfZj07S', 'dddddd@gmail.com', NULL, '路阿', '1555-05-05', '0896325471', 0),
(171, 'JJJJJ', '$2a$10$B5oci.94N1B3R71ZHDGd4eM2elBin1bhWaCPmcacpTZWPWEiFNMyu', 'ddd865@gmail.com', NULL, 'tony', '2000-02-02', '0955555666', 0),
(172, 'vavava', '$2a$10$UNnqZcFqlxv4LQfDpYauwuMnTSyMDrrv7j5EYTAGk1PaoRuMpUtLq', 'essee@gmail.com', NULL, '師傅', '2000-02-02', '0789456123', 0),
(173, 'dack', '$2a$10$cpmSuUqMdHaw.QhZxvK8BOSe5ZXpCUflyABwVilLUqPGKfyd03DSm', 'dack123@gmail.com', NULL, '鴨子', '2000-02-15', '0987456321', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `memberorder`
--

CREATE TABLE `memberorder` (
  `memberid` bigint(20) NOT NULL,
  `orderid` bigint(20) NOT NULL,
  `owned` tinyint(1) NOT NULL,
  `wanted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `memberorder`
--

INSERT INTO `memberorder` (`memberid`, `orderid`, `owned`, `wanted`) VALUES
(103, 3, 1, 0),
(103, 2, 1, 0),
(111, 2, 0, 1),
(105, 113, 0, 1),
(105, 111, 0, 1),
(103, 115, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `membertag`
--

CREATE TABLE `membertag` (
  `memberid` bigint(20) NOT NULL,
  `tagidm` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `membertag`
--

INSERT INTO `membertag` (`memberid`, `tagidm`) VALUES
(166, 1),
(166, 2),
(166, 3),
(166, 5),
(142, 3),
(142, 5),
(142, 6),
(167, 1),
(167, 2),
(167, 5),
(168, 1),
(168, 3),
(168, 5),
(169, 1),
(169, 3),
(169, 4),
(170, 2),
(170, 4),
(170, 9),
(170, 14),
(170, 17),
(170, 20),
(171, 1),
(171, 5),
(171, 10),
(171, 11),
(171, 18),
(172, 1),
(172, 2),
(172, 3),
(172, 8),
(172, 9),
(172, 10),
(172, 16),
(172, 17),
(172, 18),
(173, 1),
(173, 2),
(173, 3),
(173, 8),
(173, 9),
(173, 10),
(173, 16),
(173, 17);

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

--
-- 傾印資料表的資料 `message`
--

INSERT INTO `message` (`messageid`, `senderid`, `receiverid`, `title`, `content`, `createdat`, `isread`) VALUES
(1, 171, 172, '123test', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', '2025-01-13 14:52:42', 0),
(2, 167, 170, '121test', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestv', '2025-01-13 14:53:50', 0),
(3, 172, 170, '122test', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', '2025-01-13 14:54:22', 0),
(4, 170, 172, '102test', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', '2025-01-13 14:58:38', 1),
(5, 172, 170, '127test', 'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest', '2025-01-13 14:59:17', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `orderform`
--

CREATE TABLE `orderform` (
  `orderid` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `deadline` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `people` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `orderform`
--

INSERT INTO `orderform` (`orderid`, `name`, `intro`, `deadline`, `detail`, `picurl`, `location`, `rank`, `people`) VALUES
(2, 'Project F', NULL, '2024-12-31', 'Project F detail', 'Project F pic', 'Project F location', 2, 2),
(3, 'Project G', NULL, '2025-01-01', 'Project G detail', 'Project G pic', 'Project G location', 3, 5),
(102, 'Test Project', NULL, '2024-12-31', 'This is a test project', NULL, NULL, 0, 0),
(103, 'Test Project', NULL, '2024-12-31', 'This is a test project', NULL, NULL, 0, 0),
(104, 'Project A', NULL, '2024-12-31', 'This is a sample project', NULL, NULL, NULL, 1),
(105, 'Project A', NULL, '2024-12-31', 'This is a sample project', NULL, NULL, NULL, 1),
(106, 'Project C', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 3),
(107, 'Project C', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 3),
(108, 'Project D', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 4),
(109, 'New Project', NULL, '2025-01-01', 'Project Details', NULL, NULL, NULL, 5),
(110, 'New Project', NULL, '2025-01-01', 'Project Details', NULL, NULL, NULL, 5),
(111, '專案名稱123', NULL, '2024-12-01', '專案描述987654321', NULL, NULL, NULL, 1),
(112, '專案名稱456', NULL, '2024-12-01', NULL, NULL, NULL, NULL, 0),
(113, '專案名稱456', NULL, '2024-12-31', '專案描述', NULL, NULL, NULL, 5),
(115, 'Project H', NULL, '2025-01-0', 'Project H detail', 'Project H pic', 'Project H location', 4, 7);

-- --------------------------------------------------------

--
-- 資料表結構 `ordertag`
--

CREATE TABLE `ordertag` (
  `orderid` bigint(20) NOT NULL,
  `tagido` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `ordertag`
--

INSERT INTO `ordertag` (`orderid`, `tagido`) VALUES
(107, 1),
(107, 2),
(107, 3),
(108, 1),
(108, 2),
(108, 4),
(110, 1),
(110, 2),
(110, 3),
(111, 1),
(111, 2),
(111, 3),
(113, 1),
(113, 2),
(113, 3);

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `memberid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message`
--
ALTER TABLE `message`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderform`
--
ALTER TABLE `orderform`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tag`
--
ALTER TABLE `tag`
  MODIFY `tagid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `memberorder`
--
ALTER TABLE `memberorder`
  ADD CONSTRAINT `memberorder_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberorder_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `membertag`
--
ALTER TABLE `membertag`
  ADD CONSTRAINT `membertag_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membertag_ibfk_2` FOREIGN KEY (`tagidm`) REFERENCES `tag` (`tagidm`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `receivermember` FOREIGN KEY (`receiverid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sendmember` FOREIGN KEY (`senderid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `ordertag`
--
ALTER TABLE `ordertag`
  ADD CONSTRAINT `FK600rkdbi25qmppc1wgurkc3tw` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`),
  ADD CONSTRAINT `ordertag_ibfk_1` FOREIGN KEY (`tagido`) REFERENCES `tag` (`tagido`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
