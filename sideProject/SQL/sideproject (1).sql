-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-01-16 06:42:11
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
  `picurl` varbinary(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `isblocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`memberid`, `account`, `password`, `email`, `picurl`, `name`, `birthday`, `tel`, `isblocked`) VALUES
(103, 'Carolyn', 'ZLG53PDP1VZ', 'nunc.sit@google.couk', 0x3c73766720786d6c6e733d22687474703a2f2f7777772e77332e6f72672f323030302f737667222077696474683d2231303022206865696768743d22313030223e3c726563742077696474683d223130302522206865696768743d2231303025222066696c6c3d2223303030222f3e3c2f7376673e, 'Magee Valencia', '2025-06-18', '0947324582', 0),
(104, 'Bianca', 'LNV82DER5SL', 'metus@outlook.ca', '', 'Jermaine Raymond', '2025-10-29', '0948164822', 1),
(105, 'Nero', 'MCK25UGL9BG', 'tempor.augue@outlook.org', 0x687474703a2f2f70696e7465726573742e636f6d2f66723f673d31, 'Cora Quinn', '2025-09-02', '0955477435', 0),
(106, 'Allistair', 'YBT47NSN0EH', 'fames@yahoo.com', 0x68747470733a2f2f6e6574666c69782e636f6d2f736974653f713d74657374, 'Desirae Whitney', '2025-10-26', '0978329281', 0),
(107, 'Carlos', 'DQK63HCC0TD', 'class.aptent@protonmail.ca', 0x3c73766720786d6c6e733d22687474703a2f2f7777772e77332e6f72672f323030302f737667222077696474683d2231303022206865696768743d22313030223e0a3c726563742077696474683d2231303022206865696768743d22313030222066696c6c3d22233063636363633e, 'Forrest Evans', '2025-04-11', '0946242936', 0),
(108, 'Hashim', 'SUO93SCT4EH', 'mauris.magna@hotmail.ca', '', 'Oscar Roy', '2025-09-28', '05-29881773', 0),
(109, 'Gail', 'RHQ24MIQ1QV', 'justo.praesent@google.net', 0x68747470733a2f2f77696b6970656469612e6f72672f66723f713d30, 'Fletcher Hampton', '2025-10-27', '05-64477547', 1),
(110, 'Bruno', 'XMF70PQZ8FT', 'semper.auctor.mauris@icloud.edu', 0x68747470733a2f2f6e7974696d65732e636f6d2f736974653f706167653d31266f66667365743d31, 'Dexter Paul', '2025-10-08', '0947676258', 0),
(111, 'Dora', 'JIV75XFC8LR', 'a.ultricies.adipiscing@yahoo.couk', 0x68747470733a2f2f77696b6970656469612e6f72672f66723f636c69656e743d67, 'Finn Dillard', '2025-11-02', '0955831167', 1),
(112, 'Tanek', 'EHS62DDJ5NS', 'mauris.sapien@icloud.org', 0x687474703a2f2f677561726469616e2e636f2e756b2f73657474696e67733f713d74657374, 'Perry Gentry', '2025-01-30', '0974683452', 1),
(124, 'Haswer', 'FEO93SCT4EH', 'mauris.magna@gmail.ca', 0x687474703a2f2f77686174736170702e636f6d2f656e2d63613f706167653d31266f66667365743d31, 'Oscar Jay', '2025-09-28', '05-29881774', 0),
(142, 'updatedAccount', 'updatedPassword', 'john.doe@example.com', NULL, 'John Doe321', NULL, NULL, 0),
(167, 'Hasrewrrwr', 'FEO93SCT4EH', 'mauris.ma123na@gmail.ca', 0x687474703a2f2f77686174736170702e636f6d2f656e2d63613f706167653d31266f66667365743d31, 'Oscar Jay', '2025-09-28', '05-29881774', 0);

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

--
-- 傾印資料表的資料 `memberorder`
--

INSERT INTO `memberorder` (`memberid`, `orderid`, `owned`, `wanted`, `collected`, `evaluate`) VALUES
(103, 3, 1, 0, 0, NULL),
(103, 2, 1, 0, 0, NULL),
(111, 2, 0, 1, 0, NULL),
(105, 111, 0, 1, 0, NULL),
(103, 111, 1, 0, 0, NULL),
(103, 105, 0, 1, 0, NULL),
(103, 103, 0, 1, 0, NULL),
(103, 102, 0, 1, 0, NULL),
(104, 102, 0, 1, 0, NULL),
(104, 103, 0, 1, 0, NULL),
(103, 104, 0, 1, 0, NULL),
(103, 106, 0, 1, 0, NULL),
(103, 107, 0, 1, 0, NULL);

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
(142, 3),
(142, 5),
(142, 6);

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
  `picurl` varbinary(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `people` int(11) NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `newdate` varchar(255) DEFAULT NULL,
  `upload` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `orderform`
--

INSERT INTO `orderform` (`orderid`, `name`, `intro`, `deadline`, `detail`, `picurl`, `location`, `rank`, `people`, `budget`, `category`, `newdate`, `upload`) VALUES
(2, 'Project F', 'F intro 123', '2024-12-31', 'Project F detail', 0x50726f6a656374204620706963, 'Project F location', 2, 2, NULL, NULL, NULL, NULL),
(3, 'Project G', 'G intro', '2025-02-20', 'Project G detail', 0x50726f6a656374204720706963, 'Project G location', 3, 5, NULL, NULL, NULL, NULL),
(102, 'Test Project', 'null', '2025-02-13', 'This is a test project', NULL, 'null', 3, 2, NULL, NULL, NULL, NULL),
(103, 'Test Project', 'test intro', '2024-12-31', 'This is a test project', NULL, 'test location', 0, 1, NULL, NULL, NULL, NULL),
(104, 'Project A', 'null', '2025-01-29', 'This is a sample project', NULL, 'null', NULL, 1, NULL, NULL, NULL, NULL),
(105, 'Project A32', 'null', '2025-04-23', 'This is a sample project', NULL, 'null', 2, 1, NULL, NULL, NULL, NULL),
(106, 'Project C', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(107, 'Project C', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(108, 'Project D', NULL, '2024-12-31', 'This is another sample project', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(109, 'New Project', NULL, '2025-01-01', 'Project Details', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(110, 'New Project', NULL, '2025-01-01', 'Project Details', NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(111, 'Project X', '123qwe', '2024-12-01', '專案描述987654321', NULL, '123', 5, 2, NULL, NULL, NULL, NULL),
(115, 'Project H', 'null', '2025-01-07', 'Project H detail', 0x50726f6a656374204820706963, 'Project H location', 4, 7, NULL, NULL, NULL, NULL);

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
(111, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `tag`
--

CREATE TABLE `tag` (
  `tagidm` int(10) UNSIGNED NOT NULL,
  `tagname` varchar(255) DEFAULT NULL,
  `tagido` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tag`
--

INSERT INTO `tag` (`tagidm`, `tagname`, `tagido`) VALUES
(1, 'Java', 1),
(2, 'Spring', 2),
(3, 'Html', 3),
(4, 'Css', 4),
(5, 'JavaScript', 5),
(6, 'Python', 6);

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
  ADD KEY `tagidm` (`tagidm`),
  ADD KEY `tagido` (`tagido`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `memberid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderform`
--
ALTER TABLE `orderform`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

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
-- 資料表的限制式 `ordertag`
--
ALTER TABLE `ordertag`
  ADD CONSTRAINT `FK600rkdbi25qmppc1wgurkc3tw` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`),
  ADD CONSTRAINT `ordertag_ibfk_1` FOREIGN KEY (`tagido`) REFERENCES `tag` (`tagido`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
