-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2016 at 02:09 PM
-- Server version: 5.5.25
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `work`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int(11) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `model` varchar(25) DEFAULT NULL,
  `year_created` date DEFAULT NULL,
  `width` decimal(9,2) DEFAULT NULL,
  `height` decimal(9,2) DEFAULT NULL,
  `year_bought` date DEFAULT NULL,
  `people_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `fk_2` (`people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `manufacturer`, `model`, `year_created`, `width`, `height`, `year_bought`, `people_id`) VALUES
(9, 'Doktor Ingenieur honoris causa Ferdinand Porsche Aktiengesellschaft', 'PORSCHE 918 SPYDER', '2016-07-26', '4344.00', '1500.00', '2020-05-07', 6),
(10, 'Automobili Lamborghini S.p.A.', 'LAMBORGHINI HURACAN', '2014-01-13', '4460.00', '1165.00', '2016-08-12', 7),
(11, 'Aston Martin Ltd.', 'ASTON MARTIN V12 ZAGATO', '2010-05-30', '4385.00', '1250.00', '2017-07-11', 5),
(12, 'Marussia Motors', 'MARUSSIA B2', '2016-02-07', '4635.00', '1100.00', '2020-05-07', 8);

-- --------------------------------------------------------

--
-- Table structure for table `flats`
--

CREATE TABLE IF NOT EXISTS `flats` (
  `flat_id` int(11) NOT NULL DEFAULT '0',
  `address` varchar(50) DEFAULT NULL,
  `rooms` int(20) DEFAULT NULL,
  `floor` int(100) DEFAULT NULL,
  PRIMARY KEY (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flats`
--

INSERT INTO `flats` (`flat_id`, `address`, `rooms`, `floor`) VALUES
(1, 'Money_Quarter', 15, 214),
(2, 'Center', 13, 2),
(3, 'Beggar', 2, 59),
(4, 'cars_Street', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `people_id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `surname` char(20) DEFAULT NULL,
  `age` date DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `flat_id` int(11) NOT NULL,
  PRIMARY KEY (`people_id`),
  KEY `fk_1` (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`people_id`, `name`, `surname`, `age`, `phone`, `flat_id`) VALUES
(5, 'Vasya', 'Petrov', '1987-07-07', 555, 3),
(6, 'Tatyana', 'Gromovay', '1997-10-17', 1424, 1),
(7, 'John', 'Jonson', '1990-08-25', 3644, 4),
(8, 'Anastasia', 'Panaeva', '1999-02-01', 894, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`people_id`);

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`flat_id`) REFERENCES `flats` (`flat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/* Queris*/
/*
SELECT DISTINCT * 
FROM people
WHERE age <  '1991,01,01';

SELECT DISTINCT * 
FROM people
WHERE age <  '1991,01,01'
AND age >  '1971,01,01';

SELECT DISTINCT *
 FROM flats
 WHERE floor >1;

SELECT DISTINCT *
 FROM flats
 WHERE rooms >2;

SELECT DISTINCT *
 FROM cars
 WHERE width >4;

SELECT DISTINCT * 
FROM cars
WHERE year_created >  '2008,01,01';

SELECT COUNT( * ) 
FROM people

SELECT MIN( age ) 
FROM people

SELECT COUNT( * ) 
FROM flats
WHERE rooms =3

SELECT AVG( age ) 
FROM people

SELECT SUM( width ) 
FROM cars

SELECT DISTINCT * 
FROM people
WHERE name LIKE  'A%'

SELECT DISTINCT * 
FROM people
WHERE surname LIKE  '%t%'

SELECT DISTINCT * 
FROM cars
WHERE people_id = ( 

SELECT people_id
FROM people
WHERE flat_id = ( 

SELECT flat_id
FROM flats
WHERE rooms =3 ) ) 

SELECT DISTINCT * 
FROM cars
LEFT JOIN people ON cars.people_id = people.people_id
WHERE (

SELECT COUNT( DISTINCT people.people_id ) >1
)

SELECT DISTINCT * 
FROM flats
WHERE flat_id = ( 
SELECT flat_id
FROM people
WHERE age >  '2000,01,01' ) 

SELECT DISTINCT * 
FROM flats
LEFT JOIN people ON flats.flat_id = people.flat_id
LEFT JOIN cars ON people.people_id = cars.people_id
WHERE year_created >  '2012,12,31'  */