-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.31


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema fsplocal
--

CREATE DATABASE IF NOT EXISTS fsplocal;
USE fsplocal;

--
-- Definition of table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alerts`
--

/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;


--
-- Definition of table `alias`
--

DROP TABLE IF EXISTS `alias`;
CREATE TABLE `alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alias`
--

/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;


--
-- Definition of table `batchdrops`
--

DROP TABLE IF EXISTS `batchdrops`;
CREATE TABLE `batchdrops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `cashier` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `insert` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchdrops`
--

/*!40000 ALTER TABLE `batchdrops` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchdrops` ENABLE KEYS */;


--
-- Definition of table `batches`
--

DROP TABLE IF EXISTS `batches`;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `nosales` int(11) NOT NULL,
  `drops` decimal(10,2) NOT NULL,
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `insert` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches`
--

/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;


--
-- Definition of table `batchfinals`
--

DROP TABLE IF EXISTS `batchfinals`;
CREATE TABLE `batchfinals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` int(11) NOT NULL,
  `tendertype` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `insert` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchfinals`
--

/*!40000 ALTER TABLE `batchfinals` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchfinals` ENABLE KEYS */;


--
-- Definition of table `batchnosales`
--

DROP TABLE IF EXISTS `batchnosales`;
CREATE TABLE `batchnosales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `reason` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `cashier` int(11) NOT NULL,
  `insert` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchnosales`
--

/*!40000 ALTER TABLE `batchnosales` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchnosales` ENABLE KEYS */;


--
-- Definition of table `batchpayouts`
--

DROP TABLE IF EXISTS `batchpayouts`;
CREATE TABLE `batchpayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `invoice` varchar(45) NOT NULL,
  `batch` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `cashier` int(11) NOT NULL,
  `insert` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchpayouts`
--

/*!40000 ALTER TABLE `batchpayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `batchpayouts` ENABLE KEYS */;


--
-- Definition of table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;


--
-- Definition of table `dispenserinprocess`
--

DROP TABLE IF EXISTS `dispenserinprocess`;
CREATE TABLE `dispenserinprocess` (
  `fuelingposition` int(10) NOT NULL DEFAULT '0',
  `hose` int(10) NOT NULL DEFAULT '0',
  `mop` int(10) NOT NULL DEFAULT '0',
  `authorizedvolume` decimal(10,3) NOT NULL DEFAULT '0.000',
  `authorizeddollars` decimal(10,3) NOT NULL DEFAULT '0.000',
  `transactionid` int(11) NOT NULL,
  `timestarted` datetime DEFAULT NULL,
  PRIMARY KEY (`fuelingposition`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispenserinprocess`
--

/*!40000 ALTER TABLE `dispenserinprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispenserinprocess` ENABLE KEYS */;


--
-- Definition of table `dispensers`
--

DROP TABLE IF EXISTS `dispensers`;
CREATE TABLE `dispensers` (
  `positionid` int(11) NOT NULL,
  `dollardecimal` int(11) NOT NULL,
  `volumedecimal` int(11) NOT NULL,
  `pricedecimal` int(11) NOT NULL,
  `slowdownpoint` int(11) NOT NULL,
  `credit` tinyint(1) NOT NULL,
  `fullservice` tinyint(1) NOT NULL,
  PRIMARY KEY (`positionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispensers`
--

/*!40000 ALTER TABLE `dispensers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispensers` ENABLE KEYS */;


--
-- Definition of table `dispenserstatus`
--

DROP TABLE IF EXISTS `dispenserstatus`;
CREATE TABLE `dispenserstatus` (
  `fuelingposition` int(11) NOT NULL DEFAULT '0',
  `offhook` int(11) NOT NULL DEFAULT '0',
  `loggedon` int(11) NOT NULL DEFAULT '0',
  `armed` int(11) NOT NULL DEFAULT '0',
  `authorized` int(11) NOT NULL DEFAULT '0',
  `saleready` int(11) NOT NULL DEFAULT '0',
  `fuelflowing` int(11) NOT NULL DEFAULT '0',
  `driveaway` int(11) NOT NULL DEFAULT '0',
  `stopped` int(11) NOT NULL DEFAULT '0',
  `salehose` int(11) NOT NULL DEFAULT '0',
  `salemop` int(11) NOT NULL DEFAULT '0',
  `saledollar` decimal(10,3) NOT NULL DEFAULT '0.000',
  `salevolume` decimal(10,3) NOT NULL DEFAULT '0.000',
  `invoice` int(11) NOT NULL,
  PRIMARY KEY (`fuelingposition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispenserstatus`
--

/*!40000 ALTER TABLE `dispenserstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispenserstatus` ENABLE KEYS */;


--
-- Definition of table `dispensingrecord`
--

DROP TABLE IF EXISTS `dispensingrecord`;
CREATE TABLE `dispensingrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `positionid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `transactionid` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `product` int(11) NOT NULL,
  `dirty` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`positionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispensingrecord`
--

/*!40000 ALTER TABLE `dispensingrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispensingrecord` ENABLE KEYS */;


--
-- Definition of table `hoses`
--

DROP TABLE IF EXISTS `hoses`;
CREATE TABLE `hoses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fuelingposition` int(10) NOT NULL,
  `product` int(10) NOT NULL,
  `blend` int(10) NOT NULL,
  `hoseid` int(10) NOT NULL,
  PRIMARY KEY (`id`,`fuelingposition`,`product`) USING BTREE,
  KEY `fk_hoses_dispensers1` (`fuelingposition`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hoses`
--

/*!40000 ALTER TABLE `hoses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoses` ENABLE KEYS */;


--
-- Definition of table `inventoryitemdetails`
--

DROP TABLE IF EXISTS `inventoryitemdetails`;
CREATE TABLE `inventoryitemdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `location` int(11) NOT NULL,
  `specialprice` decimal(10,2) NOT NULL,
  `qoh` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `salestart` datetime DEFAULT NULL,
  `saleend` datetime DEFAULT NULL,
  `salestartactive` tinyint(1) NOT NULL DEFAULT '0',
  `saleendactive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventoryitemdetails`
--

/*!40000 ALTER TABLE `inventoryitemdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventoryitemdetails` ENABLE KEYS */;


--
-- Definition of table `inventoryitems`
--

DROP TABLE IF EXISTS `inventoryitems`;
CREATE TABLE `inventoryitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upc` varchar(45) NOT NULL,
  `mainsupplier` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `acceptfoodstamps` tinyint(1) NOT NULL DEFAULT '0',
  `inactive` tinyint(1) NOT NULL,
  `parentitem` int(11) NOT NULL,
  `inventoryitemtype` int(11) NOT NULL,
  `parentquantity` int(11) NOT NULL,
  `alternatesupplier` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventoryitems`
--

/*!40000 ALTER TABLE `inventoryitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventoryitems` ENABLE KEYS */;


--
-- Definition of table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `IVULotoMerchantID` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


--
-- Definition of table `logtype`
--

DROP TABLE IF EXISTS `logtype`;
CREATE TABLE `logtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logtype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logtype`
--

/*!40000 ALTER TABLE `logtype` DISABLE KEYS */;
INSERT INTO `logtype` (`id`,`logtype`) VALUES 
 (1,'Notification'),
 (2,'Warning'),
 (3,'Error');
/*!40000 ALTER TABLE `logtype` ENABLE KEYS */;


--
-- Definition of table `nosalereasons`
--

DROP TABLE IF EXISTS `nosalereasons`;
CREATE TABLE `nosalereasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nosalereasons`
--

/*!40000 ALTER TABLE `nosalereasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `nosalereasons` ENABLE KEYS */;


--
-- Definition of table `openticketdetails`
--

DROP TABLE IF EXISTS `openticketdetails`;
CREATE TABLE `openticketdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openticket` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  `extension` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax1` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `tax3` decimal(10,2) NOT NULL,
  `originalprice` decimal(10,2) NOT NULL,
  `itemid` int(11) NOT NULL,
  `upc` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `openticketdetails`
--

/*!40000 ALTER TABLE `openticketdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `openticketdetails` ENABLE KEYS */;


--
-- Definition of table `opentickets`
--

DROP TABLE IF EXISTS `opentickets`;
CREATE TABLE `opentickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openedby` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `opentime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opentickets`
--

/*!40000 ALTER TABLE `opentickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `opentickets` ENABLE KEYS */;


--
-- Definition of table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellunit` varchar(1) NOT NULL,
  `buyunit` varchar(1) NOT NULL,
  `receiptdisclaimer` text NOT NULL,
  `lastchanged` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` (`id`,`sellunit`,`buyunit`,`receiptdisclaimer`,`lastchanged`) VALUES 
 (1,'L','G','Gracias por comprar con nosotros','0001-01-01 00:00:00');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;


--
-- Definition of table `pendingservicerequests`
--

DROP TABLE IF EXISTS `pendingservicerequests`;
CREATE TABLE `pendingservicerequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `type` int(10) NOT NULL,
  `fuelingpositionid` int(11) NOT NULL DEFAULT '0',
  `invoice` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tier` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendingservicerequests`
--

/*!40000 ALTER TABLE `pendingservicerequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingservicerequests` ENABLE KEYS */;


--
-- Definition of table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


--
-- Definition of table `productsprices`
--

DROP TABLE IF EXISTS `productsprices`;
CREATE TABLE `productsprices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `costgallon` decimal(10,3) DEFAULT NULL,
  `costliter` decimal(10,3) DEFAULT NULL,
  `priceselfcashgallon` decimal(10,3) DEFAULT NULL,
  `priceselfcashliter` decimal(10,3) DEFAULT NULL,
  `pricefullcashgallon` decimal(10,3) DEFAULT NULL,
  `pricefullcashliter` decimal(10,3) DEFAULT NULL,
  `priceselfcreditliter` decimal(10,3) DEFAULT NULL,
  `pricefullcreditgallon` decimal(10,3) DEFAULT NULL,
  `pricefullcreditliter` decimal(10,3) DEFAULT NULL,
  `priceselfcreditgallon` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productsprices`
--

/*!40000 ALTER TABLE `productsprices` DISABLE KEYS */;
/*!40000 ALTER TABLE `productsprices` ENABLE KEYS */;


--
-- Definition of table `quickitemlist`
--

DROP TABLE IF EXISTS `quickitemlist`;
CREATE TABLE `quickitemlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `buttondescription` varchar(45) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quickitemlist`
--

/*!40000 ALTER TABLE `quickitemlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `quickitemlist` ENABLE KEYS */;


--
-- Definition of table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `given` tinyint(1) NOT NULL DEFAULT '0',
  `dispenser` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refunds`
--

/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;


--
-- Definition of table `registers`
--

DROP TABLE IF EXISTS `registers`;
CREATE TABLE `registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `printer1` varchar(45) NOT NULL,
  `printer2` varchar(45) NOT NULL,
  `printer1mode` int(11) NOT NULL,
  `printer2mode` int(11) NOT NULL,
  `poledisplaycomport` int(11) NOT NULL,
  `signaturecapture` tinyint(1) NOT NULL,
  `cashdrawerport` int(11) NOT NULL,
  `cashdrawer` tinyint(1) NOT NULL,
  `ivulototerminalid` varchar(50) DEFAULT NULL,
  `ivulototerminalpassword` varchar(45) DEFAULT NULL,
  `ivulototxportaddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registers`
--

/*!40000 ALTER TABLE `registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `registers` ENABLE KEYS */;


--
-- Definition of table `returnreasons`
--

DROP TABLE IF EXISTS `returnreasons`;
CREATE TABLE `returnreasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnreasons`
--

/*!40000 ALTER TABLE `returnreasons` DISABLE KEYS */;
INSERT INTO `returnreasons` (`id`,`reason`) VALUES 
 (1,'Return Reason 1'),
 (2,'Return Reason 2');
/*!40000 ALTER TABLE `returnreasons` ENABLE KEYS */;


--
-- Definition of table `servicelog`
--

DROP TABLE IF EXISTS `servicelog`;
CREATE TABLE `servicelog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `type` int(10) NOT NULL,
  `dirty` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicelog`
--

/*!40000 ALTER TABLE `servicelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicelog` ENABLE KEYS */;


--
-- Definition of table `servicerequesttypes`
--

DROP TABLE IF EXISTS `servicerequesttypes`;
CREATE TABLE `servicerequesttypes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicerequesttypes`
--

/*!40000 ALTER TABLE `servicerequesttypes` DISABLE KEYS */;
INSERT INTO `servicerequesttypes` (`id`,`type`) VALUES 
 (1,'Authorize'),
 (2,'Stop Dispenser'),
 (3,'Resume Dispenser'),
 (4,'Deauthorize'),
 (5,'PayOut');
/*!40000 ALTER TABLE `servicerequesttypes` ENABLE KEYS */;


--
-- Definition of table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `internetstatus` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`,`internetstatus`) VALUES 
 (1,1);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;


--
-- Definition of table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;


--
-- Definition of table `tanks`
--

DROP TABLE IF EXISTS `tanks`;
CREATE TABLE `tanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `capacity` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tanks`
--

/*!40000 ALTER TABLE `tanks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tanks` ENABLE KEYS */;


--
-- Definition of table `taxchangereasons`
--

DROP TABLE IF EXISTS `taxchangereasons`;
CREATE TABLE `taxchangereasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxchangereasons`
--

/*!40000 ALTER TABLE `taxchangereasons` DISABLE KEYS */;
INSERT INTO `taxchangereasons` (`id`,`reason`) VALUES 
 (1,'ABC'),
 (2,'AASSSD');
/*!40000 ALTER TABLE `taxchangereasons` ENABLE KEYS */;


--
-- Definition of table `taxtable`
--

DROP TABLE IF EXISTS `taxtable`;
CREATE TABLE `taxtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `tax1` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `tax3` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxtable`
--

/*!40000 ALTER TABLE `taxtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxtable` ENABLE KEYS */;


--
-- Definition of table `tendertypes`
--

DROP TABLE IF EXISTS `tendertypes`;
CREATE TABLE `tendertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tendertype` varchar(45) NOT NULL,
  `displayorder` int(11) NOT NULL DEFAULT '0',
  `popdrawer` tinyint(1) NOT NULL DEFAULT '1',
  `preventovertendering` tinyint(1) NOT NULL DEFAULT '0',
  `storecredit` tinyint(1) NOT NULL DEFAULT '0',
  `onlyforofficepayment` tinyint(1) NOT NULL DEFAULT '0',
  `ivulototendertype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tendertypes`
--

/*!40000 ALTER TABLE `tendertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tendertypes` ENABLE KEYS */;


--
-- Definition of table `transactiondetails`
--

DROP TABLE IF EXISTS `transactiondetails`;
CREATE TABLE `transactiondetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` int(11) NOT NULL,
  `qty` decimal(10,3) NOT NULL,
  `itemid` int(11) NOT NULL,
  `originalprice` decimal(10,3) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `description` varchar(100) NOT NULL,
  `unitcost` decimal(10,3) NOT NULL,
  `tax1` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `tax3` decimal(10,2) NOT NULL,
  `returnreason` int(11) NOT NULL,
  `taxchangereason` int(11) NOT NULL,
  `discountreason` int(11) NOT NULL,
  `dirty` tinyint(1) NOT NULL DEFAULT '1',
  `extension` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactiondetails`
--

/*!40000 ALTER TABLE `transactiondetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactiondetails` ENABLE KEYS */;


--
-- Definition of table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `customer` int(11) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cashier` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `comments` text NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `tendered` decimal(10,2) NOT NULL,
  `change` decimal(10,2) NOT NULL,
  `authorizedperson` int(11) NOT NULL,
  `insertkey` int(11) NOT NULL,
  `dirty` tinyint(1) NOT NULL DEFAULT '1',
  `tax` decimal(10,2) NOT NULL,
  `ivulotonumber` varchar(100) NOT NULL,
  `ivulotocontrolnumber` varchar(100) NOT NULL,
  `ivulotodrawdate` datetime NOT NULL,
  `ivulotostatus` varchar(45) NOT NULL,
  `ivulotoerrordetail` text NOT NULL,
  `ivulotodrawnumber` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;


--
-- Definition of table `transactiontenders`
--

DROP TABLE IF EXISTS `transactiontenders`;
CREATE TABLE `transactiontenders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tendertype` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction` int(11) NOT NULL,
  `dirty` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactiontenders`
--

/*!40000 ALTER TABLE `transactiontenders` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactiontenders` ENABLE KEYS */;


--
-- Definition of table `transactiontypes`
--

DROP TABLE IF EXISTS `transactiontypes`;
CREATE TABLE `transactiontypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactiontype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactiontypes`
--

/*!40000 ALTER TABLE `transactiontypes` DISABLE KEYS */;
INSERT INTO `transactiontypes` (`id`,`transactiontype`) VALUES 
 (1,'Fuel Only'),
 (2,'Mixed'),
 (3,'Products Only'),
 (4,'Account Payment'),
 (5,'No Sale'),
 (6,'Previous Balance'),
 (7,'Refund Given');
/*!40000 ALTER TABLE `transactiontypes` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `management` tinyint(1) NOT NULL DEFAULT '0',
  `usermanagement` tinyint(1) NOT NULL DEFAULT '0',
  `payroll` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
