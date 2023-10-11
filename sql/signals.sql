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
-- Структура таблицы `signals`
--

CREATE TABLE `signals` (
  `id` int(11) NOT NULL,
  `presignal_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  `dt_ins` varchar(19) NOT NULL,
  `ts_ins` int(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `signals`
--

INSERT INTO `signals` (`id`, `presignal_id`, `rule_id`, `dt_ins`, `ts_ins`, `data`) VALUES
(1, 40, 1, '2023-10-04 17:18:34', 1696429114, '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\",\"takeprofit1\":\"25.0308\",\"takeprofit1_volume\":14,\"takeprofit2\":\"25.1312\",\"takeprofit2_volume\":6}'),
(2, 43, 1, '2023-10-04 17:33:19', 1696429999, '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\",\"stock\":\"binance_spot\",\"qty\":\"20\",\"takeprofit1\":\"25.0308\",\"takeprofit1_volume\":14,\"takeprofit2\":\"25.1312\",\"takeprofit2_volume\":6}'),
(3, 46, 1, '2023-10-04 19:03:52', 1696435432, 'null'),
(4, 47, 1, '2023-10-04 19:04:42', 1696435482, '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\",\"stock\":\"binance_spot\",\"qty\":\"20\",\"takeprofit1\":\"25.0308\",\"takeprofit1_volume\":14,\"takeprofit2\":\"25.1312\",\"takeprofit2_volume\":6}'),
(5, 48, 1, '2023-10-04 19:05:17', 1696435517, '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\",\"stock\":\"binance_spot\",\"qty\":\"20\",\"takeprofit1\":\"25.0308\",\"takeprofit1_volume\":14,\"takeprofit2\":\"25.1312\",\"takeprofit2_volume\":6}'),
(6, 49, 1, '2023-10-04 19:10:01', 1696435801, '{\"pair\":\"sol_usdt\",\"coin\":\"sol\",\"ps\":\"long\",\"in\":\"24.83\",\"sl\":\"24.73\",\"positionSide\":\"long\",\"price\":\"24.83\",\"stoploss\":\"24.73\",\"stock\":\"binance_spot\",\"qty\":\"20\",\"takeprofit1\":\"25.0308\",\"takeprofit1_volume\":14,\"takeprofit2\":\"25.1312\",\"takeprofit2_volume\":6}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `signals`
--
ALTER TABLE `signals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `signals`
--
ALTER TABLE `signals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
