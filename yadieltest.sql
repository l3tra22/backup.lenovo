-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema yadieltest
--

CREATE DATABASE IF NOT EXISTS yadieltest;
USE yadieltest;

--
-- Definition of table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Customerid` int(11) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Customerid` (`Customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`,`Customerid`,`pwd`,`firstname`,`lastname`,`email`) VALUES 
 (1,365,'ponce','Yadiel','Quinones',NULL),
 (2,358,'badbunnyelmejor','Ryan','Rivera',NULL),
 (3,946,'mebotaron','Yanitza','Colon',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


--
-- Definition of table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(45) DEFAULT NULL,
  `dept_name` varchar(45) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `sal` decimal(10,2) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`emp_id`,`emp_name`,`dept_name`,`salary`,`sal`,`country`,`dept_id`) VALUES 
 (1,'Yadiel','IT Tech',4500,'5.00','Haiti',2),
 (2,'Ryan','IT Tech',4500,'5.00','nigeria',2),
 (3,'David','Developer',8500,'8.99','Canada',1),
 (4,'Ernie','Salesman',9000,'9.00','UK',4),
 (5,'Karileen','Front Desk',5000,'5.00','Honduras',3),
 (6,'Chris','Supervisor',6300,'6.33','USA',5),
 (7,'Gaby','IT Tech',4500,'5.00','Tortola',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;


--
-- Definition of table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` varchar(10) NOT NULL,
  `transactionumber` varchar(12) DEFAULT NULL,
  `Transactionstype` varchar(30) DEFAULT NULL,
  `Subtotal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`,`transactionumber`,`Transactionstype`,`Subtotal`) VALUES 
 ('1','1','Regular(1)','100.00'),
 ('2','2','Premium(2)','85.00'),
 ('3','3','Diesel(3)','180.00');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
