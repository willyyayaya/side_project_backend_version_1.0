-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-02-10 09:27:45
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
-- 資料庫： `sideprojectfinal`
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
(10, '管理', 5),
(11, '用戶', 1),
(12, '健身', 3),
(13, '應用', 2),
(14, '美食', 4),
(15, '地理', 1),
(16, '食譜', 3),
(17, '心理', 1),
(18, '旅行', 4),
(19, '語言', 2),
(20, '寵物', 2),
(21, '園藝', 1),
(22, '植物', 2),
(23, '書', 1),
(24, '儲蓄', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `memberid` bigint(20) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `picurl` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `isblocked` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `member`
--

INSERT INTO `member` (`memberid`, `account`, `password`, `email`, `intro`, `github`, `picurl`, `name`, `birthday`, `tel`, `isblocked`) VALUES
(1, 'Admin', '123456', 'admin@gmail.com', NULL, NULL, NULL, '系統自動寄出', NULL, NULL, 0),
(2, 'Elijah', '$2a$10$YlGd.8FOUHDB5zR4L8I8TeuINMr7ZlN1NhYn0LMNFsAU3jNdJ45oK', 'elijah5941@yahoo.com', '大家好，我是一名系統工程師，負責系統架構設計和優化。喜歡學習新技術，提升自己的技能。閒暇時喜歡跑步和健身，保持健康生活方式。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/order', NULL, '姜健穎', '1964-08-13', '0971023118', 0),
(3, 'Jillian', '$2a$10$.D4B9wAHeKSqMuFxofSeIeiHibgOs437V2uFFRwMKSs9PAHl.Iedu', 'jillian3947@hotmail.com', '嗨，我是一名嵌入式系統工程師，專注於開發和測試嵌入式軟件。對科技充滿熱情，喜歡動手實現自己的想法。我的興趣包括烹飪和閱讀科幻小說。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/admin', NULL, '黃晴添', '1962-07-19', '0954163858', 0),
(4, 'Rupert', '$2a$10$C3OxjJmvOB9HdhshEj3QBe/D.MosaomC/FqSr.ACQpRs1zTJFTSzG', 'rupert8380@gmail.com', '嗨，我是一名資深軟體工程師，專注於金融應用的開發和維護。喜愛挑戰自我，提高技術水平。業餘愛好下棋和寫作。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/home', NULL, '張彬楠', '2013-05-25', '0910109126', 0),
(5, 'Aletta', '$2a$10$ChTzXSBO0XmnWE8ISvApve5KiqPi7HSEj9zqWzS8nYtkcr3Akm1ia', 'aletta7091@gmail.com', '大家好，我是一名網絡工程師，負責公司內部和外部網絡的設計和維護。\r\n對網絡安全有深入研究，喜歡保持網絡的穩定和安全。興趣包括園藝和手工藝品。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/member', NULL, '李毓璇', '1986-12-31', '0932008488', 0),
(6, 'Cruz', '$2a$10$KhBoEDzsILeK.pnPnUOLUuVidVdI18JMXPeMCXvNyvfw.xz9QJls6', 'cruz5347@gmail.com', '你好，我是一名雲計算工程師，專注於雲平台的搭建和維護。\r\n喜歡挑戰高難度的技術問題，不斷學習和進步。閒暇時喜歡釣魚和攝影。\r\n家裡養一隻大橘，歡迎貓奴交流。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/member', NULL, '曾利馳', '2017-07-13', '0930516728', 0),
(7, 'Cameron', '$2a$10$r6/cGBh52zTzv8Fuv.wvZ.DPK0zX83EtQIfOQZBx9CzeR4jaHG7Ue', 'cameron4355@gmail.com', '你好，我是一名人工智能工程師，專注於深度學習和自然語言處理。喜歡探索人工智能的前沿技術，並應用於實際場景。興趣包括瑜伽和烘焙，最近在學習法文跟西班牙文。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/order', NULL, '何子祟', '1980-04-06', '0972032018', 0),
(8, 'Anna', '$2a$10$mp0bqG0oR.ZQV.Scj/KrCOtoD7FY1MQBxAGdeTFrltbcPMv1W1bPm', 'anna8985@gmail.com', '大家好，我是一名資深軟體架構師，擁有多年的軟件開發經驗。熱愛技術，喜歡分享經驗和知識。興趣愛好書法和園藝。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/order', NULL, '戴喧政', '1986-06-11', '0912011335', 0),
(9, 'Velazquez', '$2a$10$B/D7ktzF7nWHT3YimRx/VuMrMjfqO4OgUIDyQeFcWm/Cxa6u0Bode', 'velazquez8798@gmail.com', '大家好，我是一名軟體工程師，專注於後端開發。熱愛編程和解決複雜的技術問題。工作之外，我喜歡打籃球和旅行，探索新的地方。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/order', NULL, '魏叡許', '1985-05-27', '0963943528', 0),
(10, 'Brianna', '$2a$10$7zzhb76qwuNSkwqUAq7PY.1wXLEiqQqh9m.EXRWbDjnRD2UQI/NFq', 'perez7462@outlook.com', '嗨，我是一名前端開發人員，在初創公司工作。對設計和用戶體驗充滿熱情，致力於打造美觀流暢的介面。我喜歡畫畫和參加設計比賽。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/order/final_side_Project/src', NULL, '游凝懿', '1973-02-22', '0954207833', 0),
(11, 'Jax', '$2a$10$yM/Hv7Gv4Pg5t4sU2A/ONOJNgmqwHNIAbGwnET5RNgVHYSgp1.Uy6', 'jax1906@hotmail.com', '你好，我是一名數據工程師，專注於大數據和機器學習。喜歡通過數據解決實際問題，幫助公司做出更好的決策。平時愛好看書和騎自行車。', 'https://github.com/willyyayaya/side_project_backend_version_1.0/tree/feature/register', NULL, '王宗毅', '1981-03-30', '0920316636', 0);

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
  `evaluate` varchar(255) DEFAULT NULL,
  `getproject` tinyint(1) NOT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `memberorder`
--

INSERT INTO `memberorder` (`memberid`, `orderid`, `owned`, `wanted`, `collected`, `evaluate`, `getproject`, `picurl`, `name`, `detail`, `rank`) VALUES
(2, 17, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 18, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 19, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(8, 20, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(8, 21, 1, 0, 0, '合作愉快，受益良多', 0, NULL, NULL, NULL, NULL),
(10, 22, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 23, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 24, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 25, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 26, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(3, 24, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL),
(3, 26, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 22, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL),
(4, 20, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(4, 22, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL),
(5, 21, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL),
(5, 22, 0, 1, 0, NULL, 1, NULL, NULL, NULL, NULL),
(6, 25, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(7, 20, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(7, 24, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL),
(7, 17, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(8, 22, 0, 0, 1, NULL, 0, NULL, NULL, NULL, NULL),
(9, 22, 0, 1, 1, NULL, 1, NULL, NULL, NULL, NULL),
(9, 18, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(10, 19, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(10, 23, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL),
(10, 26, 0, 1, 1, NULL, 1, NULL, NULL, NULL, NULL),
(10, 17, 0, 0, 1, NULL, 0, NULL, NULL, NULL, NULL),
(11, 21, 0, 1, 1, NULL, 1, NULL, NULL, NULL, NULL),
(11, 23, 0, 0, 1, NULL, 0, NULL, NULL, NULL, NULL),
(11, 25, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL),
(10, 27, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(7, 28, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(6, 18, 0, 0, 1, NULL, 0, NULL, NULL, NULL, NULL),
(6, 27, 0, 0, 1, NULL, 0, NULL, NULL, NULL, NULL),
(10, 21, 0, 1, 1, NULL, 1, NULL, NULL, NULL, NULL),
(6, 21, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(9, 27, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(7, 27, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(4, 24, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(6, 24, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 29, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 30, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(5, 31, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 32, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 33, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 34, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 35, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 36, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(2, 37, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `membertag`
--

CREATE TABLE `membertag` (
  `memberid` bigint(20) NOT NULL,
  `tagid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `membertag`
--

INSERT INTO `membertag` (`memberid`, `tagid`) VALUES
(2, 2),
(2, 3),
(2, 6),
(2, 11),
(2, 15),
(2, 17),
(2, 19),
(3, 1),
(3, 2),
(3, 3),
(3, 13),
(3, 14),
(3, 15),
(3, 17),
(3, 19),
(4, 2),
(4, 3),
(4, 5),
(4, 11),
(4, 13),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(5, 4),
(5, 6),
(5, 7),
(5, 8),
(5, 11),
(5, 19),
(6, 1),
(6, 6),
(6, 7),
(6, 8),
(6, 13),
(6, 16),
(7, 2),
(7, 4),
(7, 9),
(7, 13),
(7, 17),
(7, 18),
(7, 20),
(8, 1),
(8, 2),
(8, 4),
(8, 6),
(8, 11),
(8, 13),
(8, 16),
(9, 2),
(9, 5),
(9, 9),
(9, 13),
(9, 17),
(9, 18),
(9, 19),
(10, 1),
(10, 4),
(10, 8),
(10, 13),
(10, 17),
(10, 18),
(11, 2),
(11, 4),
(11, 5),
(11, 8),
(11, 9);

-- --------------------------------------------------------

--
-- 資料表結構 `message`
--

CREATE TABLE `message` (
  `messageid` bigint(20) NOT NULL,
  `senderid` bigint(20) NOT NULL,
  `receiverid` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createdat` datetime NOT NULL DEFAULT current_timestamp(),
  `isread` tinyint(1) NOT NULL,
  `receiver_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `message`
--

INSERT INTO `message` (`messageid`, `senderid`, `receiverid`, `title`, `content`, `createdat`, `isread`, `receiver_email`) VALUES
(23, 2, 7, '詢問相關經驗', '您好，感謝您的申請，這邊想了解一下您在過去參與的專案都是負責前端、後端或是資料庫呢?還是都有參與到?\n如果都有參與，想請教各項參與的占比為何?\n另外對於我的這個專案，您有甚麼想了解的嗎?', '2025-02-06 20:14:23', 1, NULL),
(24, 2, 9, '詢問相關經驗', '您好，感謝您的申請，這邊想了解一下您在過去參與的專案都是負責前端、後端或是資料庫呢?還是都有參與到?\n如果都有參與，想請教各項參與的占比為何?\n另外對於我的這個專案，您有甚麼想了解的嗎?', '2025-02-06 20:18:01', 0, NULL),
(25, 2, 10, '詢問相關經驗', '您好，感謝您的申請，這邊想了解一下您在過去參與的專案都是負責前端、後端或是資料庫呢?還是都有參與到?\r\n如果都有參與，想請教各項參與的占比為何?\r\n另外對於我的這個專案，您有甚麼想了解的嗎?', '2025-02-06 20:18:24', 0, NULL),
(26, 5, 10, '《來自〈求職跟蹤器〉專案》測試信件', '測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件測試信件', '2025-02-07 03:47:37', 0, NULL),
(27, 10, 9, '《來自〈個人化書籍推薦系統〉專案》測試3測試3測試3測試3', '測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2測試2', '2025-02-07 04:30:40', 0, NULL),
(28, 10, 9, '《來自〈個人化書籍推薦系統〉專案》測試5測試5測試5測試5', '測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5測試5', '2025-02-07 04:51:57', 0, NULL),
(29, 10, 7, '《來自〈個人化書籍推薦系統〉專案》測試6測試6測試6測試6', '測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6測試6', '2025-02-07 04:54:22', 0, NULL),
(30, 10, 9, '《來自〈個人化書籍推薦系統〉專案》測試9測試9測試9測試9測試9測試9測試9', '測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9', '2025-02-07 04:56:04', 0, NULL),
(31, 1, 3, '您已成功加入 食譜創作者 專案', '恭喜您成功加入 食譜創作者 專案', '2025-02-10 15:26:07', 0, NULL),
(32, 1, 2, '您已成功加入 旅行計畫師 專案', '恭喜您成功加入 旅行計畫師 專案', '2025-02-10 15:26:07', 0, NULL),
(33, 1, 4, '您已成功加入 旅行計畫師 專案', '恭喜您成功加入 旅行計畫師 專案', '2025-02-10 15:26:07', 0, NULL),
(34, 1, 5, '您已成功加入 綠手指 專案', '恭喜您成功加入 綠手指 專案', '2025-02-10 15:26:07', 0, NULL),
(35, 1, 5, '您已成功加入 旅行計畫師 專案', '恭喜您成功加入 旅行計畫師 專案', '2025-02-10 15:26:07', 0, NULL),
(36, 1, 9, '您已成功加入 旅行計畫師 專案', '恭喜您成功加入 旅行計畫師 專案', '2025-02-10 15:26:07', 0, NULL),
(37, 1, 10, '您已成功加入 心理健康日記 專案', '恭喜您成功加入 心理健康日記 專案', '2025-02-10 15:26:07', 0, NULL),
(38, 1, 11, '您已成功加入 綠手指 專案', '恭喜您成功加入 綠手指 專案', '2025-02-10 15:26:07', 0, NULL),
(39, 1, 10, '您已成功加入 綠手指 專案', '恭喜您成功加入 綠手指 專案', '2025-02-10 15:26:07', 0, NULL);

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
  `picurl` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `people` int(11) NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `upload` varchar(255) DEFAULT NULL,
  `newdate` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `collect_count` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `orderform`
--

INSERT INTO `orderform` (`orderid`, `name`, `intro`, `deadline`, `detail`, `picurl`, `location`, `rank`, `people`, `budget`, `upload`, `newdate`, `category`, `collect_count`) VALUES
(17, '本地美食發現者', '一個基於地理位置的應用，幫助用戶找到附近的餐廳和餐飲優惠。', '2025-08-06', '<p>創建一個基於<strong>GPS</strong>的應用，使用戶可以瀏覽和過濾附近餐廳的選項，並查看<strong>評價</strong>和<strong>優惠信息</strong>。應用還將允許餐廳業主提交他們的餐館信息和優惠。</p>', NULL, 'newTaipei', NULL, 3, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(18, '健身夥伴', '一個個性化健身計畫的應用，根據用戶的目標和時間表推薦鍛煉。', '2025-10-30', '<p>開發一個應用，允許用戶輸入他們的健身目標和可用時間，然後生成<strong style=\"color: rgb(230, 0, 0);\">個性化</strong>的鍛煉計畫。</p><p>同時，希望應用程式能提供<strong>鍛煉示範</strong>視頻和<strong>進度追踪</strong>功能。</p>', NULL, 'remote', NULL, 4, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(19, '智能家居控制', '一個能夠控制和監控智能家居設備的網頁應用。', '2025-11-06', '<p>建立一個手機應用程式，讓用戶可以通過<u>單一界面控制和監控多個智能家居設備</u>，如燈光、溫控器和安全攝像頭。應用還將支持<strong>語音命令功能</strong>。</p>', NULL, 'taichung', NULL, 3, '50000', '2025-02-06', '2025-02-06', 'app', NULL),
(20, '語言學習遊戲', '一款幫助用戶學習新語言的互動遊戲。', '2026-06-06', '<p>創建一款遊戲，通過有趣的任務和挑戰幫助用戶學習新語言。遊戲將包含詞彙練習、發音指導和即時反饋功能。</p>', NULL, 'tainan', NULL, 5, '另議', '2025-02-06', '2025-02-06', 'game', NULL),
(21, '綠手指', '一個幫助用戶管理和照顧他們植物的應用。', '2025-02-05', '<p>開發一個應用，允許用戶記錄和管理他們的植物，並提供澆水、施肥和光照等建議。應用還將包含植物識別功能，幫助用戶識別不同植物。</p>', NULL, 'hsinchuCity', 4, 3, '另議', '2024-02-24', '2024-06-06', 'app', NULL),
(22, '旅行計畫師', '一個幫助用戶計畫和組織旅行行程的網頁應用。', '2024-12-31', '<p>建立一個網頁應用，允許用戶創建和管理旅行行程，並添加景點、住宿和交通信息。應用還將提供行程分享和協作功能，讓朋友和家人可以一起計畫旅行。</p>', NULL, 'taoyuan', NULL, 4, '另議', '2023-09-13', '2024-07-19', 'web', NULL),
(23, '求職跟蹤器', '一個幫助求職者追踪和管理求職進度的應用。', '2025-04-30', '<p>開發一個應用，允許求職者記錄和追踪他們的申請、面試和回覆情況。應用還將提供求職建議和資料夾功能，幫助用戶管理他們的求職文檔。</p>', NULL, 'kaohsiung', NULL, 3, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(24, '食譜創作者', '一個讓用戶創建和分享他們自己的食譜集的應用。', '2026-06-30', '<p>建立一個網頁應用，允許用戶創建和分享他們的食譜，並瀏覽其他用戶的食譜集。應用還將提供食材清單生成和購物清單功能。</p>', NULL, 'remote', NULL, 4, '另議', '2025-02-06', '2025-02-06', 'web', NULL),
(25, '寵物照顧助理', '一個幫助寵物主人管理和照顧寵物的應用。', '2025-11-20', '<p>開發一個應用，允許寵物主人記錄和管理他們的寵物，並提供餵食、醫療和活動建議。應用還將包含寵物識別功能，幫助用戶識別不同的寵物品種。</p>', NULL, 'taichung', NULL, 4, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(26, '心理健康日記', '一個幫助用戶記錄和反思他們情緒和心情的應用。', '2025-06-21', '<p>創建一個應用，允許用戶記錄和追踪他們的情緒和心情，並提供反思和冥想建議。應用還將包含每日提示和提醒功能，幫助用戶建立健康的心態。</p>', NULL, 'remote', NULL, 6, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(27, '個人化書籍推薦系統', '設計一個針對使用者興趣及過往閱讀紀錄進行書籍推薦的應用程式。', '2025-03-07', '<p>閱讀伴侶是一個智能書籍推薦應用，利用使用者的閱讀興趣和過往閱讀紀錄來推薦個性化的書籍。通過分析用戶的閱讀習慣和評價，應用將提供精確的書籍推薦，幫助用戶發現新書，並豐富其閱讀體驗。</p>', NULL, 'remote', NULL, 3, '另議', '2025-02-06', '2025-02-06', 'app', NULL),
(28, '省錢達人', '省錢達人是一個幫助用戶管理和提升儲蓄能力的應用程式。通過設計個性化的儲蓄計畫和目標，並提供智能分析和建議，讓用戶能夠更有效地管理財務，達成儲蓄目標。', '2025-10-24', '<p>省錢達人通過個性化的儲蓄計畫，幫助用戶設定儲蓄目標，並追踪儲蓄進度。應用內建智能分析功能，能夠根據用戶的收入和支出情況，給出儲蓄建議，並提供節省小技巧。用戶可以記錄日常開支，並生成財務報告，以視覺化的方式了解自己的財務狀況。應用還包括提醒功能，幫助用戶按時儲蓄，實現財務自由。</p>', NULL, 'miaoli', NULL, 4, '另議', '2025-02-06', '2025-02-06', 'game', NULL),
(29, 'wer', 'wer', '2025-02-06', '<p>wer</p>', 'data:image/jpeg;base64,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', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'game', NULL),
(30, '5', '5', '2025-02-21', '<p>4</p>', NULL, 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'web', NULL),
(31, 'asd', 'sad', '2025-02-26', '<p>sadads</p>', NULL, 'remote', NULL, 3, '另議', '2025-02-10', '2025-02-10', 'game', NULL),
(32, 'sad', 'sda', '2025-02-19', '<p>sad</p>', NULL, 'remote', NULL, 1, '另議', '2025-02-10', '2025-02-10', 'web', NULL),
(33, 'gfds', 'df', '2025-02-19', '<p>dfsdf</p>', 'data:image/jpeg;base64,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', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'game', NULL),
(34, 'sadasd', 'sadasdsadas', '2025-02-13', '<p>dasdasd</p>', 'null', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'game', NULL),
(35, 'zX', 'xzc', '2025-02-27', '<p>zxczc</p>', 'null', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'game', NULL),
(36, 'fds', 'dfs', '2025-02-21', '<p>sdf</p>', 'data:image/jpeg;base64,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', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'web', NULL);
INSERT INTO `orderform` (`orderid`, `name`, `intro`, `deadline`, `detail`, `picurl`, `location`, `rank`, `people`, `budget`, `upload`, `newdate`, `category`, `collect_count`) VALUES
(37, 'asdsad', 'sadasdasd', '2025-02-13', '<p>dasdas</p>', 'data:image/jpeg;base64,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b25nAAAAAAAAAAtjcm9wUmVjdFRvcGxvbmcAAAAAADhCSU0D7QAAAAAAEABIAAAAAQACAEgAAAABAAI4QklNBCYAAAAAAA4AAAAAAAAAAAAAP4AAADhCSU0D8gAAAAAACgAA////////AAA4QklNBA0AAAAAAAQAAAB4OEJJTQQZAAAAAAAEAAAAHjhCSU0D8wAAAAAACQAAAAAAAAAAAQA4QklNJxAAAAAAAAoAAQAAAAAAAAACOEJJTQP1AAAAAABIAC9mZgABAGxmZgAGAAAAAAABAC9mZgABAKGZmgAGAAAAAAABADIAAAABAFoAAAAGAAAAAAABADUAAAABAC0AAAAGAAAAAAABOEJJTQP4AAAAAABwAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAADhCSU0EAAAAAAAAAgABOEJJTQQCAAAAAAAEAAAAADhCSU0EMAAAAAAAAgEBOEJJTQQtAAAAAAAGAAEAAAACOEJJTQQIAAAAAAAQAAAAAQAAAkAAAAJAAAAAADhCSU0EHgAAAAAABAAAAAA4QklNBBoAAAAAAz0AAAAGAAAAAAAAAAAAAAEsAAABLAAAAASe2IqNmC1QzwAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAABLAAAASwAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAQAAAAAAAG51bGwAAAACAAAABmJvdW5kc09iamMAAAABAAAAAAAAUmN0MQAAAAQAAAAAVG9wIGxvbmcAAAAAAAAAAExlZnRsb25nAAAAAAAAAABCdG9tbG9uZwAAASwAAAAAUmdodGxvbmcAAAEsAAAABnNsaWNlc1ZsTHMAAAABT2JqYwAAAAEAAAAAAAVzbGljZQAAABIAAAAHc2xpY2VJRGxvbmcAAAAAAAAAB2dyb3VwSURsb25nAAAAAAAAAAZvcmlnaW5lbnVtAAAADEVTbGljZU9yaWdpbgAAAA1hdXRvR2VuZXJhdGVkAAAAAFR5cGVlbnVtAAAACkVTbGljZVR5cGUAAAAASW1nIAAAAAZib3Vu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aHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjUtMDEtMjNUMDg6NTk6MTArMDg6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMjUtMDEtMjNUMDk6MTk6NTArMDg6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDI1LTAxLTIzVDA5OjE5OjUwKzA4OjAwIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0ic1JHQiBJRUM2MTk2Ni0yLjEiIGRjOmZvcm1hdD0iaW1hZ2UvanBlZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpCQzQ4QUUyNDI4RDlFRjExOTU3NEMzMjEwNjdCMEEzNSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFMTkyMUZGQzI0RDlFRjExODIwM0NDNkY5NEZBODE4MCIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOkUxOTIxRkZDMjREOUVGMTE4MjAzQ0M2Rjk0RkE4MTgwIj4gPHBob3Rvc2hvcDpEb2N1bWVudEFuY2VzdG9ycz4gPHJkZjpCYWc+IDxyZGY6bGk+eG1wLmRpZDpDRDNBOTREQkM1QzZFRjExQkQxREM4NTBEQzVBOTcwODwvcmRmOmxpPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOkUxOTIxRkZDMjREOUVGMTE4MjAzQ0M2Rjk0RkE4MTgwIiBzdEV2dDp3aGVuPSIyMDI1LTAxLTIzVDA4OjU5OjEwKzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6QkI0OEFFMjQyOEQ5RUYxMTk1NzRDMzIxMDY3QjBBMzUiIHN0RXZ0OndoZW49IjIwMjUtMDEtMjNUMDk6MTk6NTArMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9qcGVnIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJkZXJpdmVkIiBzdEV2dDpwYXJhbWV0ZXJzPSJjb252ZXJ0ZWQgZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL2pwZWciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOkJDNDhBRTI0MjhEOUVGMTE5NTc0QzMyMTA2N0IwQTM1IiBzdEV2dDp3aGVuPSIyMDI1LTAxLTIzVDA5OjE5OjUwKzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QkI0OEFFMjQyOEQ5RUYxMTk1NzRDMzIxMDY3QjBBMzUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RTE5MjFGRkMyNEQ5RUYxMTgyMDNDQzZGOTRGQTgxODAiIHN0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpFMTkyMUZGQzI0RDlFRjExODIwM0NDNkY5NEZBODE4MCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8P3hwYWNrZXQgZW5kPSJ3Ij8+/+IMWElDQ19QUk9GSUxFAAEBAAAMSExpbm8CEAAAbW50clJHQiBYWVogB84AAgAJAAYAMQAAYWNzcE1TRlQAAAAASUVDIHNSR0IAAAAAAAAAAAAAAAAAAPbWAAEAAAAA0y1IUCAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARY3BydAAAAVAAAAAzZGVzYwAAAYQAAABsd3RwdAAAAfAAAAAUYmtwdAAAAgQAAAAUclhZWgAAAhgAAAAUZ1hZWgAAAiwAAAAUYlhZWgAAAkAAAAAUZG1uZAAAAlQAAABwZG1kZAAAAsQAAACIdnVlZAAAA0wAAACGdmlldwAAA9QAAAAkbHVtaQAAA/gAAAAUbWVhcwAABAwAAAAkdGVjaAAABDAAAAAMclRSQwAABDwAAAgMZ1RSQwAABDwAAAgMYlRS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', 'remote', NULL, 2, '另議', '2025-02-10', '2025-02-10', 'app', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `ordertag`
--

CREATE TABLE `ordertag` (
  `orderid` bigint(20) NOT NULL,
  `tagid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `ordertag`
--

INSERT INTO `ordertag` (`orderid`, `tagid`) VALUES
(20, 2),
(20, 3),
(20, 8),
(20, 13),
(20, 17),
(21, 1),
(21, 4),
(21, 5),
(21, 7),
(21, 11),
(21, 19),
(22, 6),
(22, 10),
(22, 17),
(23, 7),
(23, 14),
(23, 15),
(23, 16),
(23, 20),
(24, 2),
(24, 6),
(24, 13),
(24, 15),
(24, 17),
(25, 5),
(25, 7),
(25, 17),
(25, 19),
(26, 2),
(26, 3),
(26, 12),
(26, 14),
(26, 16),
(26, 20),
(17, 1),
(17, 4),
(17, 5),
(17, 7),
(17, 16),
(17, 20),
(18, 1),
(18, 4),
(18, 5),
(18, 6),
(18, 10),
(18, 19),
(19, 8),
(19, 16),
(19, 20),
(27, 1),
(27, 3),
(27, 4),
(27, 5),
(27, 10),
(27, 18),
(28, 7),
(28, 10),
(28, 16),
(28, 20),
(29, 1),
(29, 3),
(30, 2),
(30, 10),
(31, 1),
(31, 9),
(31, 17),
(32, 1),
(33, 2),
(33, 9),
(33, 10),
(33, 18),
(34, 17),
(35, 1),
(35, 10),
(35, 18),
(36, 1),
(36, 10),
(36, 18),
(37, 1),
(37, 9);

-- --------------------------------------------------------

--
-- 資料表結構 `tag`
--

CREATE TABLE `tag` (
  `tagid` int(10) UNSIGNED NOT NULL,
  `tagname` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tag`
--

INSERT INTO `tag` (`tagid`, `tagname`, `category`) VALUES
(1, 'CSS', 'Front'),
(2, 'SCSS', 'Front'),
(3, 'Sass', 'Front'),
(4, 'JavaScript', 'Front'),
(5, 'jQuery', 'Front'),
(6, 'Vue', 'Front'),
(7, 'React', 'Front'),
(8, 'Angular', 'Front'),
(9, 'Java', 'Back'),
(10, 'Python', 'Back'),
(11, 'Ruby', 'Back'),
(12, 'PHP', 'Back'),
(13, 'C#', 'Back'),
(14, 'C++', 'Back'),
(15, 'Go', 'Back'),
(16, 'Node.js', 'Back'),
(17, 'MySQL', 'Database'),
(18, 'SQLSever', 'Database'),
(19, 'PostgreSQL', 'Database'),
(20, 'MongoDB', 'Database');

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
  ADD KEY `memberid` (`memberid`,`tagid`),
  ADD KEY `tagid` (`tagid`);

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
  ADD KEY `tagid` (`tagid`),
  ADD KEY `orderid` (`orderid`);

--
-- 資料表索引 `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `memberid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message`
--
ALTER TABLE `message`
  MODIFY `messageid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderform`
--
ALTER TABLE `orderform`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

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
  ADD CONSTRAINT `memberorder_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memberorder_ibfk_2` FOREIGN KEY (`memberid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `membertag`
--
ALTER TABLE `membertag`
  ADD CONSTRAINT `membertag_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membertag_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiverid`) REFERENCES `member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `ordertag`
--
ALTER TABLE `ordertag`
  ADD CONSTRAINT `ordertag_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ordertag_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orderform` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
