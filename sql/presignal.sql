-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 04 2023 г., 19:15
-- Версия сервера: 5.6.51
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `presignal`
--

CREATE TABLE `presignal` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dt_ins` varchar(19) NOT NULL,
  `ts_ins` int(11) NOT NULL,
  `text_in` text NOT NULL,
  `text_get` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `presignal`
--

INSERT INTO `presignal` (`id`, `provider_id`, `user_id`, `dt_ins`, `ts_ins`, `text_in`, `text_get`) VALUES
(1, 1, 1, '2023-10-03 15:16:01', 1696335361, 'LONG ', '{\"errorMessage\":\"execution timeout exceeded\",\"errorType\":\"JobExecutionTimeoutExceeded\",\"stackTrace\":null}'),
(2, 1, 1, '2023-10-03 15:16:11', 1696335371, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(3, 1, 1, '2023-10-03 17:16:19', 1696342579, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(4, 1, 1, '2023-10-03 18:30:11', 1696347011, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(5, 1, 1, '2023-10-03 19:20:36', 1696350036, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(6, 1, 1, '2023-10-03 19:22:30', 1696350150, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(7, 1, 1, '2023-10-03 19:23:59', 1696350239, 'LONG BLURUSDT from $0.18  stop loss $0.1778', '{\"pair\":\"blurusdt_usdt\",\"coin\":\"blurusdt\",\"ps\":\"long\",\"in\":\"0.18\",\"sl\":\"0.1778\"}'),
(8, 1, 1, '2023-10-04 14:25:43', 1696418743, 'LONG ', '{\"errorMessage\":\"execution timeout exceeded\",\"errorType\":\"JobExecutionTimeoutExceeded\",\"stackTrace\":null}'),
(9, 1, 1, '2023-10-04 14:37:07', 1696419427, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(10, 1, 1, '2023-10-04 14:37:47', 1696419467, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(11, 1, 1, '2023-10-04 14:40:36', 1696419636, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(12, 1, 1, '2023-10-04 14:42:42', 1696419762, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(13, 1, 1, '2023-10-04 14:43:56', 1696419836, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(14, 1, 1, '2023-10-04 14:44:46', 1696419886, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(15, 1, 1, '2023-10-04 14:46:26', 1696419986, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(16, 1, 1, '2023-10-04 15:07:21', 1696421241, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(17, 1, 1, '2023-10-04 15:07:40', 1696421260, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(18, 1, 1, '2023-10-04 15:08:36', 1696421316, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(19, 1, 1, '2023-10-04 15:08:40', 1696421320, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(20, 1, 1, '2023-10-04 15:10:09', 1696421409, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(21, 1, 1, '2023-10-04 15:14:27', 1696421667, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(22, 1, 1, '2023-10-04 15:15:36', 1696421736, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(23, 1, 1, '2023-10-04 15:17:21', 1696421841, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(24, 1, 1, '2023-10-04 15:38:26', 1696423106, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(25, 1, 1, '2023-10-04 16:00:26', 1696424426, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(26, 1, 1, '2023-10-04 16:00:39', 1696424439, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(27, 1, 1, '2023-10-04 16:00:56', 1696424456, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(28, 1, 1, '2023-10-04 16:01:45', 1696424505, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(29, 1, 1, '2023-10-04 16:08:22', 1696424902, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(30, 1, 1, '2023-10-04 16:08:59', 1696424939, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(31, 1, 1, '2023-10-04 16:09:37', 1696424977, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(32, 1, 1, '2023-10-04 16:10:06', 1696425006, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(33, 1, 1, '2023-10-04 16:13:20', 1696425200, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(34, 1, 1, '2023-10-04 16:13:49', 1696425229, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(35, 1, 1, '2023-10-04 16:14:06', 1696425246, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(36, 1, 1, '2023-10-04 16:14:59', 1696425299, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(37, 1, 1, '2023-10-04 16:15:10', 1696425310, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(38, 1, 1, '2023-10-04 17:12:50', 1696428770, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(39, 1, 1, '2023-10-04 17:16:13', 1696428973, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(40, 1, 1, '2023-10-04 17:18:33', 1696429113, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(41, 1, 1, '2023-10-04 17:32:58', 1696429978, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(42, 1, 1, '2023-10-04 17:33:08', 1696429988, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(43, 1, 1, '2023-10-04 17:33:19', 1696429999, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(44, 1, 1, '2023-10-04 19:02:57', 1696435377, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(45, 1, 1, '2023-10-04 19:03:29', 1696435409, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(46, 1, 1, '2023-10-04 19:03:52', 1696435432, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(47, 1, 1, '2023-10-04 19:04:42', 1696435482, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(48, 1, 1, '2023-10-04 19:05:17', 1696435517, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}'),
(49, 1, 1, '2023-10-04 19:10:00', 1696435800, 'LONG #SOLUSDT from $24.83 stop loss $24.73', '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\"}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `presignal`
--
ALTER TABLE `presignal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `presignal`
--
ALTER TABLE `presignal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
