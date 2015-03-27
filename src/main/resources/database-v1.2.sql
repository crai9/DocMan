-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2015 at 06:43 PM
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

DROP TABLE IF EXISTS `distributees`;
CREATE TABLE `distributees` (
`distributeeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `documentId` int(11) NOT NULL,
  `distributionDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributees`
--

INSERT INTO `distributees` (`distributeeId`, `userId`, `documentId`, `distributionDate`) VALUES
(2, 1, 7, '2015-03-25'),
(3, 208, 7, '0205-03-24'),
(6, 207, 7, '0205-03-24'),
(7, 204, 8, '2015-03-27'),
(8, 205, 8, '2015-03-27'),
(9, 1, 12, '2015-03-27');

-- --------------------------------------------------------

--
-- Table structure for table `document_records`
--

DROP TABLE IF EXISTS `document_records`;
CREATE TABLE `document_records` (
`documentId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_records`
--

INSERT INTO `document_records` (`documentId`, `title`, `description`, `author`) VALUES
(1, 'firstdocument.pdf', 'very cool', 'craig'),
(4, 'Doc', 'craigsdoc', 'craig'),
(7, 'New Doc', 'Testing again', 'craig'),
(8, 'Document 1', 'Test', 'craig'),
(9, 'New', 'test', 'craig'),
(10, 'gfdgds', 'dgfsdgfds', 'craig'),
(12, 'Craig''s Doc2', 'stuff', 'craig');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
`notificationId` int(11) unsigned NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `documentId` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `from` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notificationId`, `seen`, `documentId`, `to`, `from`) VALUES
(4, 0, 7, 204, 1),
(6, 0, 7, 205, 1);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
CREATE TABLE `revisions` (
`revisionId` int(11) NOT NULL,
  `revisionNo` int(11) NOT NULL,
  `documentAttachment` varchar(200) NOT NULL,
  `documentId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`revisionId`, `revisionNo`, `documentAttachment`, `documentId`, `createdDate`, `status`) VALUES
(1, 1, 'name', 1, '2015-02-27', 'Inactive'),
(4, 1, 'document.pdf', 7, '2015-03-26', 'Active'),
(5, 2, 'doc2.pdf', 7, '2015-03-26', 'Active'),
(6, 1, 'none', 8, '2015-03-18', 'Active'),
(7, 1, 'document', 9, '2015-03-26', 'Active'),
(8, 1, 'dfgsfgds', 10, '2015-03-18', 'Active'),
(10, 1, 'file', 12, '2015-03-11', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
`userId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `password`, `firstName`, `lastName`, `email`, `enabled`) VALUES
(1, 'craig', '49f68a5c8493ec2c0bf489821c21fc3b', 'Craig', 'Miller', 'real@email.com', 1),
(204, 'person1', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test1@testing.com', 1),
(205, 'person2', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test2@testing.com', 1),
(207, 'person4', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test4@testing.com', 1),
(208, 'person5', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test5@testing.com', 1),
(209, 'person6', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test6@testing.com', 1),
(210, 'person7', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test7@testing.com', 1),
(211, 'person8', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test8@testing.com', 1),
(212, 'person9', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test9@testing.com', 1),
(213, 'person10', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test10@testing.com', 1),
(214, 'person11', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test11@testing.com', 1),
(215, 'person12', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test12@testing.com', 1),
(216, 'person13', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test13@testing.com', 1),
(217, 'person14', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test14@testing.com', 1),
(218, 'person15', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test15@testing.com', 1),
(219, 'person16', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test16@testing.com', 1),
(220, 'person17', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test17@testing.com', 1),
(221, 'person18', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test18@testing.com', 1),
(222, 'person19', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test19@testing.com', 1),
(223, 'person20', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test20@testing.com', 1),
(224, 'person21', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test21@testing.com', 1),
(225, 'person22', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test22@testing.com', 1),
(226, 'person23', '49f68a5c8493ec2c0bf489821c21fc3b', 'bob', 'smith', 'test23@testing.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
`user_role_id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ROLE` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `userId`, `ROLE`) VALUES
(2, 1, 'ROLE_ADMIN'),
(1, 1, 'ROLE_USER'),
(64, 204, 'ROLE_USER'),
(65, 205, 'ROLE_USER'),
(67, 207, 'ROLE_USER'),
(68, 208, 'ROLE_USER'),
(69, 209, 'ROLE_USER'),
(70, 210, 'ROLE_USER'),
(71, 211, 'ROLE_USER'),
(72, 212, 'ROLE_USER'),
(73, 213, 'ROLE_USER'),
(74, 214, 'ROLE_USER'),
(75, 215, 'ROLE_USER'),
(76, 216, 'ROLE_USER'),
(77, 217, 'ROLE_USER'),
(78, 218, 'ROLE_USER'),
(79, 219, 'ROLE_USER'),
(80, 220, 'ROLE_USER'),
(81, 221, 'ROLE_USER'),
(82, 222, 'ROLE_USER'),
(83, 223, 'ROLE_USER'),
(84, 224, 'ROLE_USER'),
(85, 225, 'ROLE_USER'),
(86, 226, 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distributees`
--
ALTER TABLE `distributees`
 ADD PRIMARY KEY (`distributeeId`), ADD KEY `userId` (`userId`), ADD KEY `documentId` (`documentId`);

--
-- Indexes for table `document_records`
--
ALTER TABLE `document_records`
 ADD PRIMARY KEY (`documentId`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`notificationId`), ADD KEY `documentId` (`documentId`), ADD KEY `to` (`to`), ADD KEY `from` (`from`);

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
MODIFY `distributeeId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `document_records`
--
ALTER TABLE `document_records`
MODIFY `documentId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
MODIFY `notificationId` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
MODIFY `revisionId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=228;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `distributees`
--
ALTER TABLE `distributees`
ADD CONSTRAINT `distributees_ibfk_2` FOREIGN KEY (`documentId`) REFERENCES `document_records` (`documentId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `distributees_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`documentId`) REFERENCES `document_records` (`documentId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`to`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`from`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
ADD CONSTRAINT `revisions_ibfk_2` FOREIGN KEY (`documentId`) REFERENCES `document_records` (`documentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
