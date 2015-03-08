-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2015 at 04:00 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigncounter`
--

CREATE TABLE `assigncounter` (
  `userid` int(16) NOT NULL,
  `counterid` int(16) NOT NULL,
  `contact_info` int(11) NOT NULL,
  PRIMARY KEY  (`userid`,`counterid`),
  KEY `counterid` (`counterid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigncounter`
--

INSERT INTO `assigncounter` (`userid`, `counterid`, `contact_info`) VALUES
(1, 2, 0),
(1, 3, 1936789765),
(1, 4, 1936789765),
(1, 6, 1936789765),
(3, 3, 1936789765),
(3, 5, 1938151756),
(4, 3, 1936789765);

-- --------------------------------------------------------

--
-- Table structure for table `assignseats`
--

CREATE TABLE `assignseats` (
  `counterid` int(11) NOT NULL,
  `departure_configid` int(12) NOT NULL,
  `seatid` int(11) NOT NULL,
  PRIMARY KEY  (`counterid`,`departure_configid`,`seatid`),
  KEY `departure_configid` (`departure_configid`),
  KEY `seatid` (`seatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignseats`
--

INSERT INTO `assignseats` (`counterid`, `departure_configid`, `seatid`) VALUES
(3, 1, 1),
(4, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(14) NOT NULL,
  `bus_no` int(21) NOT NULL,
  `bus_type` varchar(7) NOT NULL,
  `brand` varchar(11) NOT NULL,
  `other_info` varchar(21) NOT NULL,
  `seat` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_no`, `bus_type`, `brand`, `other_info`, `seat`) VALUES
(1, 'Baghdadhs', 11, 'AC', 'Marcidise', 'luxaroius nice car', 60),
(3, 'Green Line', 4, 'AC', 'HTP-Hoter', 'luxaroius nice car', 56),
(4, 'Narail Express', 13, 'AC', 'Marcidise', 'luxaroius nice car', 56);

-- --------------------------------------------------------

--
-- Table structure for table `busseats`
--

CREATE TABLE `busseats` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `seatname` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `busseats`
--

INSERT INTO `busseats` (`id`, `name`) VALUES
(1, 'A1'),
(2, 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(111) NOT NULL auto_increment,
  `name` varchar(56) NOT NULL,
  `address` varchar(46) NOT NULL,
  `telephone_contact` varchar(11) NOT NULL,
  `status` varchar(43) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `name`, `address`, `telephone_contact`, `status`) VALUES
(1, 'Panthopath C', 'Dhaka,Dhanmondi Bangl', '01818234567', 'Bra'),
(2, 'Jatrabari', 'Jatrabari ,Demra Dhaka,Bangladesh', '0193567890', 'Bra'),
(3, 'Chittagong111', 'Chittagong,Bangladesh', '01819156489', 'Branch Counter'),
(4, 'Comilla Sada', 'Comilla Bangladesh', '0193567890', 'Branch Counter'),
(5, 'Khulna Sadar', 'Khulna Panir tank', '01818234567', 'Branch Counter'),
(6, 'Motijheel', 'Dhaka,Bangladesh', '01818234567', 'Branch Counter'),
(7, 'Daudkandi', 'Comilla Bangladesh', '01818234567', 'Branch Counter');

-- --------------------------------------------------------

--
-- Table structure for table `departure_config`
--

CREATE TABLE `departure_config` (
  `id` int(12) NOT NULL auto_increment,
  `busid` int(11) NOT NULL,
  `coachno` varchar(12) NOT NULL,
  `station_from` int(11) NOT NULL,
  `station_to` int(12) NOT NULL,
  `counter_id` int(11) NOT NULL,
  `vialocation` varchar(100) NOT NULL,
  `journey_type` varchar(10) NOT NULL,
  `start_time` varchar(11) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  `startdate` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `busid` (`busid`),
  KEY `station_from` (`station_from`),
  KEY `station_to` (`station_to`),
  KEY `counter_id` (`counter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `departure_config`
--

INSERT INTO `departure_config` (`id`, `busid`, `coachno`, `station_from`, `station_to`, `counter_id`, `vialocation`, `journey_type`, `start_time`, `end_time`, `startdate`) VALUES
(1, 1, '0', 2, 6, 2, 'Daudkandi', '', '10.24AM', '1.00AM', '0000-00-00'),
(2, 4, '4', 8, 5, 4, 'Daudkandi', 'S', '8:00AM', '4.00PM', '0000-00-00'),
(3, 3, '41', 5, 4, 7, 'Comilla', 'S', '10.24PM', '1.00AM', '0000-00-00'),
(4, 4, '33', 4, 7, 5, 'Daudkandi', 'S', '8:00AM', '1.00AM', '0000-00-00'),
(5, 3, '44', 11, 5, 7, 'Comilla', 'NS', '10.24AM', '4.00PM', '0000-00-00'),
(6, 4, '33', 6, 5, 5, 'Kustia', 'Special', '10.24AM', '4.00PM', '0000-00-00'),
(7, 1, '89', 4, 6, 5, 'Kustia', 'Regular', '10.24PM', '4.00PM', '0000-00-00'),
(8, 3, '36', 4, 5, 4, '', 'Special', '10.24AM', '4.00PM', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(12) NOT NULL,
  `email` varchar(43) NOT NULL,
  `gender` varchar(4) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `payment_type` varchar(19) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id`, `name`, `email`, `gender`, `mobile`, `payment_type`) VALUES
(1, 'Evans', 'farhadevan@gmail.com', 'm', '01938161058', 'bkash');

-- --------------------------------------------------------

--
-- Table structure for table `seatbooking`
--

CREATE TABLE `seatbooking` (
  `departure_configid` int(11) NOT NULL,
  `seatid` int(11) NOT NULL,
  `passengerid` int(11) NOT NULL,
  `confirmedstatus` varchar(13) NOT NULL,
  PRIMARY KEY  (`departure_configid`,`seatid`,`passengerid`),
  KEY `seatid` (`seatid`),
  KEY `passengerid` (`passengerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seatbooking`
--


-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(56) NOT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`id`, `name`, `description`) VALUES
(1, ' ,Jatra', ''),
(2, 'Jatrabari', 'Dhaka,Bangladesh'),
(3, 'MeghPara Chi', 'Chittagong'),
(4, 'Comilla Mounamuti', 'Comilla'),
(5, 'Motijheel,Dhaka', 'Dhaka,Bangladesh'),
(6, 'Jossore New Market Moor', 'Jossore'),
(7, 'Chandina', 'Comilla,Chandina'),
(8, 'Kotuoli Thana', 'Comilla,Kutooali'),
(9, 'Feni', 'Chittagong, Feni'),
(10, 'Noahkhali', 'Noahkhali ,Sadar'),
(11, 'Sadar Comilla', 'Near Mounamuti'),
(12, 'Eliatgong', 'Daudkandi ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(12) NOT NULL auto_increment,
  `FullName` varchar(16) NOT NULL,
  `Email` varchar(21) NOT NULL,
  `Password` varchar(80) NOT NULL,
  `Info` varchar(200) NOT NULL,
  `UserType` varchar(4) NOT NULL,
  `RegDate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Id`),
  UNIQUE KEY `email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `FullName`, `Email`, `Password`, `Info`, `UserType`, `RegDate`) VALUES
(1, 'Farhad Evan', 'farhad@gmail.com', '12345678', '', 'oper', '2015-03-03 11:05:51'),
(2, 'Joy Ahmed', 'admin@gmail.com', '12', 'Dhaka', 'co', '2015-01-16 22:26:01'),
(3, 'Sajib', 'sajib@gmail.com', '12', 'Chittagong', 'co', '2015-01-20 00:37:10'),
(4, 'Sabuj', 'sabuj@gmail.com', '12', 'Khulna', 'co', '2015-01-20 00:37:50'),
(5, 'Farhad Hossain', 'hossain@gmail.com', '1234', 'Nothing', 'co', '2015-01-20 13:53:19'),
(6, 'Sakib', 'sakib@gmail.com', '12', 'Dhaka, Bangladesh', 'co', '2015-01-20 14:25:46'),
(7, 'Kaushik Sarkar', 'kaushik@gmail.com', '12', 'Jessore', 'sa', '2015-01-20 14:57:25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigncounter`
--
ALTER TABLE `assigncounter`
  ADD CONSTRAINT `assigncounter_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `assigncounter_ibfk_2` FOREIGN KEY (`counterid`) REFERENCES `counter` (`id`);

--
-- Constraints for table `assignseats`
--
ALTER TABLE `assignseats`
  ADD CONSTRAINT `assignseats_ibfk_1` FOREIGN KEY (`counterid`) REFERENCES `counter` (`id`),
  ADD CONSTRAINT `assignseats_ibfk_2` FOREIGN KEY (`departure_configid`) REFERENCES `departure_config` (`id`),
  ADD CONSTRAINT `assignseats_ibfk_3` FOREIGN KEY (`seatid`) REFERENCES `busseats` (`id`);

--
-- Constraints for table `departure_config`
--
ALTER TABLE `departure_config`
  ADD CONSTRAINT `departure_config_ibfk_1` FOREIGN KEY (`busid`) REFERENCES `bus` (`id`),
  ADD CONSTRAINT `departure_config_ibfk_2` FOREIGN KEY (`station_from`) REFERENCES `station` (`id`),
  ADD CONSTRAINT `departure_config_ibfk_3` FOREIGN KEY (`station_to`) REFERENCES `station` (`id`),
  ADD CONSTRAINT `departure_config_ibfk_4` FOREIGN KEY (`counter_id`) REFERENCES `counter` (`id`);

--
-- Constraints for table `seatbooking`
--
ALTER TABLE `seatbooking`
  ADD CONSTRAINT `seatbooking_ibfk_1` FOREIGN KEY (`departure_configid`) REFERENCES `departure_config` (`id`),
  ADD CONSTRAINT `seatbooking_ibfk_2` FOREIGN KEY (`seatid`) REFERENCES `busseats` (`id`),
  ADD CONSTRAINT `seatbooking_ibfk_3` FOREIGN KEY (`passengerid`) REFERENCES `passenger` (`id`);
