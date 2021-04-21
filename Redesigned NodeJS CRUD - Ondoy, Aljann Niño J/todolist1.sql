-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2021 at 04:41 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_tasks` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `uuid`, `username`, `password`, `no_tasks`, `type`) VALUES
(1, 'asdasd123asd', 'aljann', '123', 2, 'admin'),
(4, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'sanji', '$2b$10$5.sh4.JTlNckMSHQ5DAnbOyPaDT0mHhWu9cRQvmt9/kHRFI9MNUTO', 8, 'client'),
(5, 'j1U1qZyxe0084L7MFLTo05MMShXjQ3zc', 'zoro', '$2b$10$p1wEPufrcpRUAqHy7aBd7.DwpYP6XyXMIK1b5Gvx2/gURW758a39u', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20210413070007-create_accounts_table.js'),
('20210413072311-create_tasks_table.js');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) NOT NULL,
  `accountUuid` varchar(255) NOT NULL,
  `task` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `accountUuid`, `task`, `status`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(3, 'asdasd123asd', 'watching tv', 'pending', '2021-04-14 00:00:00', NULL, NULL),
(4, 'asdasd123asd', 'drinking', 'complete', '2021-04-14 00:00:00', '2021-04-15 00:00:00', NULL),
(5, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'leg training', 'pending', '2021-04-14 00:00:00', NULL, '2021-04-14 16:01:23'),
(8, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'jambe23345', 'complete', '2021-04-14 00:00:00', '2021-04-14 15:41:06', '2021-04-14 16:01:16'),
(9, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'concasse', 'complete', '2021-04-14 00:00:00', '2021-04-15 00:00:00', '2021-04-14 16:01:42'),
(19, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'air walk', 'pending', '2021-04-14 15:17:06', '2021-04-14 15:17:06', '2021-04-14 16:01:44'),
(20, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'air walk2', 'complete', '2021-04-14 15:44:21', '2021-04-14 15:44:27', '2021-04-14 16:01:46'),
(21, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'jambe2', 'pending', '2021-04-16 06:41:55', '2021-04-16 06:41:55', '2021-04-16 06:42:00'),
(22, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'Computer21', 'complete', '2021-04-16 06:42:05', '2021-04-16 06:42:16', '2021-04-16 06:42:21'),
(23, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'Watch Movies1', 'pending', '2021-04-21 02:39:24', '2021-04-21 02:39:41', '2021-04-21 02:39:55'),
(24, 'c9EQqur7ujdwgXpXpQUWTqWzc6EwZlXv', 'Drinking', 'complete', '2021-04-21 02:39:34', '2021-04-21 02:39:51', '2021-04-21 02:39:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
