-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2019 at 03:37 PM
-- Server version: 5.6.41-84.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mazenu54_railways`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblserveripdivisionwise`
--

CREATE TABLE `tblserveripdivisionwise` (
  `ID` int(11) NOT NULL,
  `RailwayID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL,
  `ModifiedBy` int(11) NOT NULL,
  `ModifiedOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ConnectionStatus` tinyint(1) NOT NULL DEFAULT '0',
  `ServerIP` varchar(200) NOT NULL,
  `LastConnectionCheck` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblserveripdivisionwise`
--

INSERT INTO `tblserveripdivisionwise` (`ID`, `RailwayID`, `DivisionID`, `ModifiedBy`, `ModifiedOn`, `ConnectionStatus`, `ServerIP`, `LastConnectionCheck`) VALUES
(1, 1, 1, 1, '2019-02-19 14:55:28', 1, '216.10.253.103', '2019-02-19 20:25:28'),
(2, 1, 2, 1, '2019-02-19 14:33:12', 1, '216.10.253.103', '2019-02-19 14:33:12'),
(3, 1, 3, 1, '2019-02-19 14:31:08', 1, '216.10.253.103', '2019-02-19 14:31:08'),
(4, 1, 4, 1, '2019-02-19 14:31:09', 1, '216.10.253.103', '2019-02-19 14:31:09'),
(5, 1, 5, 1, '2019-02-19 14:42:12', 1, '216.10.253.103', '2019-02-19 14:42:12'),
(6, 1, 6, 1, '2019-02-19 14:42:14', 1, '216.10.253.103', '2019-02-19 14:42:14'),
(12, 2, 1, 1, '2019-02-19 15:04:34', 0, '10.21.5.5', '2019-02-19 20:34:34'),
(13, 3, 1, 1, '2019-02-19 20:37:36', 0, '101.5.20.6', NULL),
(14, 3, 2, 1, '2019-02-19 20:37:57', 0, '10.1.01.1', NULL),
(15, 14, 1, 1, '2019-02-19 20:38:20', 0, '101.22.55.1', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblserveripdivisionwise`
--
ALTER TABLE `tblserveripdivisionwise`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblserveripdivisionwise`
--
ALTER TABLE `tblserveripdivisionwise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
