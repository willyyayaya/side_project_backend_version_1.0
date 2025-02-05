-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-02-04 18:32:17
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
-- 資料庫： `test10`
--

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
  `getproject` bit(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `evaluate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `memberorder`
--

INSERT INTO `memberorder` (`memberid`, `orderid`, `owned`, `wanted`, `collected`, `getproject`, `detail`, `evaluate`, `name`, `picurl`) VALUES
(103, 3, 1, 0, 0, b'1', NULL, '', NULL, NULL),
(103, 2, 1, 0, 0, b'1', NULL, '2399999', NULL, NULL),
(111, 2, 0, 1, 1, NULL, NULL, '0', NULL, NULL),
(105, 111, 1, 1, 0, b'1', NULL, '0', NULL, NULL),
(103, 111, 1, 0, 0, b'1', NULL, '0', NULL, NULL),
(103, 105, 0, 1, 1, b'0', NULL, '0', NULL, NULL),
(103, 103, 0, 1, 1, b'1', NULL, '0', NULL, NULL),
(103, 102, 0, 1, 1, b'0', NULL, '0', NULL, NULL),
(104, 102, 0, 1, 1, b'0', NULL, '0', NULL, NULL),
(104, 103, 1, 0, 0, b'1', NULL, '0', NULL, NULL),
(103, 104, 0, 1, 1, b'1', NULL, '0', NULL, NULL),
(103, 106, 1, 0, 0, b'0', NULL, '0', NULL, NULL),
(103, 107, 0, 1, 0, b'1', NULL, '0', NULL, NULL);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `memberorder`
--
ALTER TABLE `memberorder`
  ADD KEY `memberid` (`memberid`),
  ADD KEY `orderid` (`orderid`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `memberorder`
--
ALTER TABLE `memberorder`
  ADD CONSTRAINT `memberorder_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberorder_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
