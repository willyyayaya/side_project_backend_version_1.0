-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-02-07 08:57:42
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
(6, 24, 0, 1, 0, NULL, 0, NULL, NULL, NULL, NULL);

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
(30, 10, 9, '《來自〈個人化書籍推薦系統〉專案》測試9測試9測試9測試9測試9測試9測試9', '測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9測試9', '2025-02-07 04:56:04', 0, NULL);

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
(28, '省錢達人', '省錢達人是一個幫助用戶管理和提升儲蓄能力的應用程式。通過設計個性化的儲蓄計畫和目標，並提供智能分析和建議，讓用戶能夠更有效地管理財務，達成儲蓄目標。', '2025-10-24', '<p>省錢達人通過個性化的儲蓄計畫，幫助用戶設定儲蓄目標，並追踪儲蓄進度。應用內建智能分析功能，能夠根據用戶的收入和支出情況，給出儲蓄建議，並提供節省小技巧。用戶可以記錄日常開支，並生成財務報告，以視覺化的方式了解自己的財務狀況。應用還包括提醒功能，幫助用戶按時儲蓄，實現財務自由。</p>', NULL, 'miaoli', NULL, 4, '另議', '2025-02-06', '2025-02-06', 'game', NULL);

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
(28, 20);

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
  MODIFY `messageid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orderform`
--
ALTER TABLE `orderform`
  MODIFY `orderid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
