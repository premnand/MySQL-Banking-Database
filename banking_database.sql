-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbbankgm
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `CurrentBalance` int NOT NULL,
  `AccountTypeID` tinyint NOT NULL,
  `AccountStatusTypeID` tinyint NOT NULL,
  `InterestSavingRatesID` tinyint NOT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `AccountTypeID` (`AccountTypeID`),
  KEY `AccountStatusTypeID` (`AccountStatusTypeID`),
  KEY `InterestSavingRatesID` (`InterestSavingRatesID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`AccountTypeID`) REFERENCES `accounttype` (`AccountTypeID`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`AccountStatusTypeID`) REFERENCES `accountstatustype` (`AccountStatusTypeID`),
  CONSTRAINT `account_ibfk_3` FOREIGN KEY (`InterestSavingRatesID`) REFERENCES `savingsinterestrates` (`InterestSavingRatesID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,5000,1,1,1),(2,25000,2,1,2),(3,100000,3,1,3);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountstatustype`
--

DROP TABLE IF EXISTS `accountstatustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountstatustype` (
  `AccountStatusTypeID` tinyint NOT NULL AUTO_INCREMENT,
  `AccountStatusTypeDescription` varchar(30) NOT NULL,
  PRIMARY KEY (`AccountStatusTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountstatustype`
--

LOCK TABLES `accountstatustype` WRITE;
/*!40000 ALTER TABLE `accountstatustype` DISABLE KEYS */;
INSERT INTO `accountstatustype` VALUES (1,'Active'),(2,'Dormant'),(3,'Closed'),(4,'Frozen');
/*!40000 ALTER TABLE `accountstatustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounttype` (
  `AccountTypeID` tinyint NOT NULL AUTO_INCREMENT,
  `AccountTypeDescription` varchar(30) NOT NULL,
  PRIMARY KEY (`AccountTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'Savings'),(2,'Current'),(3,'Fixed Deposit'),(4,'Recurring Deposit');
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `CustomerAddress1` varchar(30) NOT NULL,
  `CustomerAddress2` varchar(30) DEFAULT NULL,
  `CustomerFirstName` varchar(30) NOT NULL,
  `CustomerMiddleInitial` char(1) DEFAULT NULL,
  `CustomerLastName` varchar(30) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` char(2) NOT NULL,
  `ZipCode` char(10) NOT NULL,
  `EmailAddress` varchar(40) NOT NULL,
  `HomePhone` varchar(10) NOT NULL,
  `CellPhone` varchar(10) NOT NULL,
  `WorkPhone` varchar(10) NOT NULL,
  `SSN` varchar(9) DEFAULT NULL,
  `UserLoginID` smallint NOT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `AccountID` (`AccountID`),
  KEY `UserLoginID` (`UserLoginID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`UserLoginID`) REFERENCES `userlogins` (`UserLoginID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'123 Elm Street',NULL,'John','A','Doe','New York','NY','10001','john.doe@example.com','1234567890','0987654321','1112223333','123456789',1),(2,2,'456 Oak Avenue',NULL,'Jane',NULL,'Smith','Los Angeles','CA','90001','jane.smith@example.com','2345678901','1987654321','2223334444','987654321',2),(3,3,'789 Maple Road',NULL,'Alice','B','Wonder','Chicago','IL','60601','alice.wonder@example.com','3456789012','2987654321','3334445555','567890123',3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeraccount`
--

DROP TABLE IF EXISTS `customeraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customeraccount` (
  `AccountID` int NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`AccountID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `customeraccount_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `customeraccount_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeraccount`
--

LOCK TABLES `customeraccount` WRITE;
/*!40000 ALTER TABLE `customeraccount` DISABLE KEYS */;
INSERT INTO `customeraccount` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `customeraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `EmployeeFirstName` varchar(25) NOT NULL,
  `EmployeeMiddleInitial` char(1) DEFAULT NULL,
  `EmployeeLastName` varchar(25) DEFAULT NULL,
  `EmployeeisManager` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','A','Doe',1),(2,'Jane',NULL,'Smith',0),(3,'Alice','B','Wonder',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failedtransactionerrortype`
--

DROP TABLE IF EXISTS `failedtransactionerrortype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failedtransactionerrortype` (
  `FailedTransactionErrorTypeID` tinyint NOT NULL AUTO_INCREMENT,
  `FailedTransactionErrorTypeDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`FailedTransactionErrorTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failedtransactionerrortype`
--

LOCK TABLES `failedtransactionerrortype` WRITE;
/*!40000 ALTER TABLE `failedtransactionerrortype` DISABLE KEYS */;
INSERT INTO `failedtransactionerrortype` VALUES (1,'Insufficient Funds'),(2,'Account Not Found'),(3,'Technical Error'),(4,'Invalid Account Details');
/*!40000 ALTER TABLE `failedtransactionerrortype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failedtransactionlog`
--

DROP TABLE IF EXISTS `failedtransactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failedtransactionlog` (
  `FailedTransactionID` int NOT NULL AUTO_INCREMENT,
  `FailedTransactionErrorTypeID` tinyint NOT NULL,
  `FailedTransactionErrorTime` datetime DEFAULT NULL,
  `FailedTransactionErrorXML` text,
  PRIMARY KEY (`FailedTransactionID`),
  KEY `FailedTransactionErrorTypeID` (`FailedTransactionErrorTypeID`),
  CONSTRAINT `failedtransactionlog_ibfk_1` FOREIGN KEY (`FailedTransactionErrorTypeID`) REFERENCES `failedtransactionerrortype` (`FailedTransactionErrorTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failedtransactionlog`
--

LOCK TABLES `failedtransactionlog` WRITE;
/*!40000 ALTER TABLE `failedtransactionlog` DISABLE KEYS */;
INSERT INTO `failedtransactionlog` VALUES (1,1,'2025-02-07 14:29:18','<error>Insufficient Funds</error>'),(2,2,'2025-02-07 14:29:18','<error>Account Not Found</error>');
/*!40000 ALTER TABLE `failedtransactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginaccount`
--

DROP TABLE IF EXISTS `loginaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginaccount` (
  `UserLoginID` smallint NOT NULL,
  `AccountID` int NOT NULL,
  PRIMARY KEY (`UserLoginID`,`AccountID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `loginaccount_ibfk_1` FOREIGN KEY (`UserLoginID`) REFERENCES `userlogins` (`UserLoginID`),
  CONSTRAINT `loginaccount_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginaccount`
--

LOCK TABLES `loginaccount` WRITE;
/*!40000 ALTER TABLE `loginaccount` DISABLE KEYS */;
INSERT INTO `loginaccount` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `loginaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginerrorlog`
--

DROP TABLE IF EXISTS `loginerrorlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginerrorlog` (
  `ErrorLogID` int NOT NULL AUTO_INCREMENT,
  `ErrorTime` datetime NOT NULL,
  `FailedTransactionXML` text,
  PRIMARY KEY (`ErrorLogID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginerrorlog`
--

LOCK TABLES `loginerrorlog` WRITE;
/*!40000 ALTER TABLE `loginerrorlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginerrorlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overdraftlog`
--

DROP TABLE IF EXISTS `overdraftlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overdraftlog` (
  `AccountID` int NOT NULL,
  `OverDraftDate` datetime NOT NULL,
  `OverDraftAmount` decimal(10,2) NOT NULL,
  `OverDraftTransactionXML` text NOT NULL,
  PRIMARY KEY (`AccountID`),
  CONSTRAINT `overdraftlog_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overdraftlog`
--

LOCK TABLES `overdraftlog` WRITE;
/*!40000 ALTER TABLE `overdraftlog` DISABLE KEYS */;
INSERT INTO `overdraftlog` VALUES (1,'2025-02-07 14:29:18',100.00,'<transaction>Overdrafted</transaction>'),(2,'2025-02-07 14:29:18',200.00,'<transaction>Overdrafted</transaction>');
/*!40000 ALTER TABLE `overdraftlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingsinterestrates`
--

DROP TABLE IF EXISTS `savingsinterestrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savingsinterestrates` (
  `InterestSavingRatesID` tinyint NOT NULL AUTO_INCREMENT,
  `InterestRatesValue` decimal(9,2) NOT NULL,
  `InterestRatesDescription` varchar(20) NOT NULL,
  PRIMARY KEY (`InterestSavingRatesID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingsinterestrates`
--

LOCK TABLES `savingsinterestrates` WRITE;
/*!40000 ALTER TABLE `savingsinterestrates` DISABLE KEYS */;
INSERT INTO `savingsinterestrates` VALUES (1,3.50,'Low'),(2,6.75,'Medium'),(3,5.00,'Medium');
/*!40000 ALTER TABLE `savingsinterestrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionlog`
--

DROP TABLE IF EXISTS `transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionlog` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `TransactionDate` datetime NOT NULL,
  `TransactionTypeID` tinyint NOT NULL,
  `TransactionAmount` decimal(10,2) NOT NULL,
  `NewBalance` decimal(10,2) NOT NULL,
  `AccountID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `UserLoginID` smallint NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `TransactionTypeID` (`TransactionTypeID`),
  KEY `AccountID` (`AccountID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `UserLoginID` (`UserLoginID`),
  CONSTRAINT `transactionlog_ibfk_1` FOREIGN KEY (`TransactionTypeID`) REFERENCES `transactiontype` (`TransactionTypeID`),
  CONSTRAINT `transactionlog_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`),
  CONSTRAINT `transactionlog_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `transactionlog_ibfk_4` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `transactionlog_ibfk_5` FOREIGN KEY (`UserLoginID`) REFERENCES `userlogins` (`UserLoginID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionlog`
--

LOCK TABLES `transactionlog` WRITE;
/*!40000 ALTER TABLE `transactionlog` DISABLE KEYS */;
INSERT INTO `transactionlog` VALUES (1,'2025-02-07 14:29:18',1,500.00,5500.00,1,1,1,1),(2,'2025-02-07 14:29:18',2,1000.00,24000.00,2,2,2,2),(3,'2025-02-07 14:29:18',3,2000.00,98000.00,3,3,3,3);
/*!40000 ALTER TABLE `transactionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontype` (
  `TransactionTypeID` tinyint NOT NULL AUTO_INCREMENT,
  `TransactionTypeName` char(10) NOT NULL,
  `TransactionTypeDescription` varchar(50) DEFAULT NULL,
  `TransactionFeeAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`TransactionTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'Deposit','Deposit Money',0.00),(2,'Withdraw','Withdraw Money',2.50),(3,'Transfer','Transfer Money to Another Account',1.00);
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogins`
--

DROP TABLE IF EXISTS `userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogins` (
  `UserLoginID` smallint NOT NULL AUTO_INCREMENT,
  `UserLogin` varchar(50) NOT NULL,
  `UserPassword` varchar(20) NOT NULL,
  PRIMARY KEY (`UserLoginID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogins`
--

LOCK TABLES `userlogins` WRITE;
/*!40000 ALTER TABLE `userlogins` DISABLE KEYS */;
INSERT INTO `userlogins` VALUES (1,'User_john_doe','password123'),(2,'User_jane_smith','pass456'),(3,'User_alice_wonder','wonder789');
/*!40000 ALTER TABLE `userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersecurityanswers`
--

DROP TABLE IF EXISTS `usersecurityanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersecurityanswers` (
  `UserLoginID` smallint NOT NULL,
  `UserSecurityAnswers` varchar(25) NOT NULL,
  `UserSecurityQuestionID` tinyint NOT NULL,
  PRIMARY KEY (`UserLoginID`,`UserSecurityQuestionID`),
  KEY `UserSecurityQuestionID` (`UserSecurityQuestionID`),
  CONSTRAINT `usersecurityanswers_ibfk_1` FOREIGN KEY (`UserLoginID`) REFERENCES `userlogins` (`UserLoginID`),
  CONSTRAINT `usersecurityanswers_ibfk_2` FOREIGN KEY (`UserSecurityQuestionID`) REFERENCES `usersecurityquestions` (`UserSecurityQuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersecurityanswers`
--

LOCK TABLES `usersecurityanswers` WRITE;
/*!40000 ALTER TABLE `usersecurityanswers` DISABLE KEYS */;
INSERT INTO `usersecurityanswers` VALUES (1,'Johnson',1),(2,'Fluffy',2),(3,'Alice in Wonderland',3);
/*!40000 ALTER TABLE `usersecurityanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersecurityquestions`
--

DROP TABLE IF EXISTS `usersecurityquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersecurityquestions` (
  `UserSecurityQuestionID` tinyint NOT NULL AUTO_INCREMENT,
  `UserSecurityQuestion` varchar(50) NOT NULL,
  PRIMARY KEY (`UserSecurityQuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersecurityquestions`
--

LOCK TABLES `usersecurityquestions` WRITE;
/*!40000 ALTER TABLE `usersecurityquestions` DISABLE KEYS */;
INSERT INTO `usersecurityquestions` VALUES (1,'What is your mother’s maiden name?'),(2,'What is the name of your first pet?'),(3,'What is your favorite book?');
/*!40000 ALTER TABLE `usersecurityquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_account_ul`
--

DROP TABLE IF EXISTS `vw_account_ul`;
/*!50001 DROP VIEW IF EXISTS `vw_account_ul`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_account_ul` AS SELECT 
 1 AS `UserLogin`,
 1 AS `UserPassword`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_acc`
--

DROP TABLE IF EXISTS `vw_customer_acc`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_acc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_acc` AS SELECT 
 1 AS `CustomerFirstName`,
 1 AS `AccountTypeDescription`,
 1 AS `Total_AC_Types`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_amt`
--

DROP TABLE IF EXISTS `vw_customer_amt`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_amt`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_amt` AS SELECT 
 1 AS `CustomerFirstName`,
 1 AS `Ac_Balance`,
 1 AS `Total_Ac_Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_od`
--

DROP TABLE IF EXISTS `vw_customer_od`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_od`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_od` AS SELECT 
 1 AS `CustomerFirstName`,
 1 AS `OverDraftAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_on`
--

DROP TABLE IF EXISTS `vw_customer_on`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_on`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_on` AS SELECT 
 1 AS `CustomerID`,
 1 AS `AccountID`,
 1 AS `CustomerAddress1`,
 1 AS `CustomerAddress2`,
 1 AS `CustomerFirstName`,
 1 AS `CustomerMiddleInitial`,
 1 AS `CustomerLastName`,
 1 AS `City`,
 1 AS `State`,
 1 AS `ZipCode`,
 1 AS `EmailAddress`,
 1 AS `HomePhone`,
 1 AS `CellPhone`,
 1 AS `WorkPhone`,
 1 AS `SSN`,
 1 AS `UserLoginID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_account_ul`
--

/*!50001 DROP VIEW IF EXISTS `vw_account_ul`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_account_ul` AS select distinct `ul`.`UserLogin` AS `UserLogin`,`ul`.`UserPassword` AS `UserPassword` from (`userlogins` `ul` join `loginaccount` `la` on((`ul`.`UserLoginID` = `la`.`UserLoginID`))) where (`la`.`AccountID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_acc`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_acc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_acc` AS select `c`.`CustomerFirstName` AS `CustomerFirstName`,`at`.`AccountTypeDescription` AS `AccountTypeDescription`,count(0) AS `Total_AC_Types` from ((`customer` `c` join `account` `a` on((`c`.`AccountID` = `a`.`AccountID`))) join `accounttype` `at` on((`a`.`AccountTypeID` = `at`.`AccountTypeID`))) group by `c`.`CustomerFirstName`,`at`.`AccountTypeDescription` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_amt`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_amt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_amt` AS select `c`.`CustomerFirstName` AS `CustomerFirstName`,sum(`a`.`CurrentBalance`) AS `Ac_Balance`,sum((`a`.`CurrentBalance` + ((`a`.`CurrentBalance` * `s`.`InterestRatesValue`) / 100))) AS `Total_Ac_Balance` from ((`customer` `c` join `account` `a` on((`c`.`AccountID` = `a`.`AccountID`))) join `savingsinterestrates` `s` on((`a`.`InterestSavingRatesID` = `s`.`InterestSavingRatesID`))) group by `c`.`CustomerFirstName` having (sum((`a`.`CurrentBalance` + ((`a`.`CurrentBalance` * `s`.`InterestRatesValue`) / 100))) > 5000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_od`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_od`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_od` AS select distinct `c`.`CustomerFirstName` AS `CustomerFirstName`,`o`.`OverDraftAmount` AS `OverDraftAmount` from (`overdraftlog` `o` join `customer` `c` on((`o`.`AccountID` = `c`.`AccountID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_on`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_on`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_on` AS select distinct `c`.`CustomerID` AS `CustomerID`,`c`.`AccountID` AS `AccountID`,`c`.`CustomerAddress1` AS `CustomerAddress1`,`c`.`CustomerAddress2` AS `CustomerAddress2`,`c`.`CustomerFirstName` AS `CustomerFirstName`,`c`.`CustomerMiddleInitial` AS `CustomerMiddleInitial`,`c`.`CustomerLastName` AS `CustomerLastName`,`c`.`City` AS `City`,`c`.`State` AS `State`,`c`.`ZipCode` AS `ZipCode`,`c`.`EmailAddress` AS `EmailAddress`,`c`.`HomePhone` AS `HomePhone`,`c`.`CellPhone` AS `CellPhone`,`c`.`WorkPhone` AS `WorkPhone`,`c`.`SSN` AS `SSN`,`c`.`UserLoginID` AS `UserLoginID` from ((`customer` `c` join `account` `a` on((`c`.`AccountID` = `a`.`AccountID`))) join `accounttype` `at` on((`a`.`AccountTypeID` = `at`.`AccountTypeID`))) where ((`at`.`AccountTypeDescription` = 'Checking') and (`c`.`State` = 'ON')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 14:34:41
