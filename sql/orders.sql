-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 06 2023 г., 12:15
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
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `signal_id` int(11) NOT NULL,
  `dt_ins` varchar(19) NOT NULL,
  `ts_ins` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `type` varchar(5) NOT NULL,
  `side` varchar(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `signal_id`, `dt_ins`, `ts_ins`, `state`, `stock`, `type`, `side`, `data`) VALUES
(1, 5, '2023-10-06 12:11:45', 1696583505, 0, 'binance_spot', 'limit', 'buy', '{\"qty\":\"20\",\"price\":\"24.83\"}'),
(2, 5, '2023-10-06 12:11:45', 1696583505, 0, 'binance_spot', 'oco', 'sell', '{\"qty\":14,\"price\":\"25.0308\",\"stoploss\":\"24.73\"}'),
(3, 5, '2023-10-06 12:11:45', 1696583505, 0, 'binance_spot', 'oco', 'sell', '{\"qty\":6,\"price\":\"25.1312\",\"stoploss\":\"24.73\"}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
