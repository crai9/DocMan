-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2015 at 12:16 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `documentmanager`
--
CREATE DATABASE IF NOT EXISTS `documentmanager` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `documentmanager`;

-- --------------------------------------------------------

--
-- Table structure for table `distributees`
--

CREATE TABLE `distributees` (
`distributeeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `revisionId` int(11) NOT NULL,
  `distributionDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document_records`
--

CREATE TABLE `document_records` (
`documentId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
`revisionId` int(11) NOT NULL,
  `revisionNo` int(11) NOT NULL,
  `documentAttachment` varchar(200) NOT NULL,
  `documentId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
`userId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `password`, `firstName`, `lastName`, `email`, `enabled`) VALUES
(158, 'craig', '49f68a5c8493ec2c0bf489821c21fc3b', 'Craig', 'Miller', 'craig@1.com', 1),
(159, 'john', '49f68a5c8493ec2c0bf489821c21fc3b', 'John', 'Smith', 'john@1.com', 1),
(160, 'rob', '49f68a5c8493ec2c0bf489821c21fc3b', 'Rob', 'Smith', 'rob@1.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
`user_role_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ROLE` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `userId`, `ROLE`) VALUES
(23, 158, 'ROLE_ADMIN'),
(22, 158, 'ROLE_USER'),
(24, 159, 'ROLE_USER'),
(25, 160, 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributees`
--
ALTER TABLE `distributees`
 ADD PRIMARY KEY (`distributeeId`);

--
-- Indexes for table `document_records`
--
ALTER TABLE `document_records`
 ADD PRIMARY KEY (`documentId`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
 ADD PRIMARY KEY (`revisionId`), ADD KEY `documentId` (`documentId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
 ADD PRIMARY KEY (`user_role_id`), ADD UNIQUE KEY `uni_username_role` (`ROLE`,`userId`), ADD KEY `fk_username_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distributees`
--
ALTER TABLE `distributees`
MODIFY `distributeeId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `document_records`
--
ALTER TABLE `document_records`
MODIFY `documentId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
MODIFY `revisionId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
ADD CONSTRAINT `revisions_ibfk_1` FOREIGN KEY (`documentId`) REFERENCES `document_records` (`documentId`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Add user for database
--

-- CREATE USER 'java'@'localhost' IDENTIFIED BY 'java';--
GRANT ALL PRIVILEGES ON * . * TO 'java'@'localhost';