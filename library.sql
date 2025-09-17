-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 03:21 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `bookID` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category` int NOT NULL,
  `publishedYear` date NOT NULL,
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookID`, `title`, `author`, `category`, `publishedYear`) VALUES
('B001', 'HTML & CSS', 'DonDon the 3rd', 11, '1990-08-09'),
('B002', 'OnlineGames O Ako?', 'Beboy', 129, '2025-09-17');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `borrowID` varchar(100) NOT NULL,
  `bookID` varchar(100) NOT NULL,
  `memberID` varchar(100) NOT NULL,
  `staffID` varchar(100) NOT NULL,
  `borrowDate` date NOT NULL,
  PRIMARY KEY (`borrowID`),
  UNIQUE KEY `bookID` (`bookID`,`memberID`,`staffID`),
  KEY `memberID` (`memberID`),
  KEY `staffID` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrowID`, `bookID`, `memberID`, `staffID`, `borrowDate`) VALUES
('BR001', 'B001', 'M001', 'S001', '2025-09-02'),
('BR002', 'B002', 'M002', 'S002', '2025-09-08');

-- --------------------------------------------------------

--
-- Table structure for table `login_requirement`
--

DROP TABLE IF EXISTS `login_requirement`;
CREATE TABLE IF NOT EXISTS `login_requirement` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`password`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login_requirement`
--

INSERT INTO `login_requirement` (`email`, `password`) VALUES
('Jashiee@gmail.com', 'Jashiee2006'),
('JoshTan@gmail.com', 'JoshTan2006'),
('YsaAlejo@gmail.com', 'YsaAlejo2006');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `memberID` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`memberID`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `name`, `email`, `mobile`, `address`) VALUES
('M001', 'Ysa', 'YsaAlejo@gmail.com', 123456789, 'Plaza Villa'),
('M002', 'Jashiee', 'Jashiee@gmail.com', 987654321, 'Plaza Libertad');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `name`, `position`, `email`, `password`) VALUES
('S001', 'JoshTan', 'Head', 'JoshTan@gamil.com', 'JoshTan2006'),
('S002', 'RonDol', 'CEO', 'RonDol@gmail.com', 'RonDol@2006');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`memberID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
