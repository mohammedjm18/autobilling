CREATE DATABASE  IF NOT EXISTS `objdet` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `objdet`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: objdet
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL DEFAULT '0.00',
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,0.75,3.00),(1,2,1.25,10.00),(2,1,0.75,8.00),(2,2,1.25,3.00),(3,1,0.75,8.00),(3,3,1.25,5.00),(4,1,0.75,8.00),(4,3,1.25,5.00),(5,2,1.25,8.00),(5,3,1.25,5.00),(6,1,0.75,1.00),(6,2,1.25,1.00),(7,1,0.75,1.00),(7,2,1.25,1.00),(8,1,0.75,3.00),(8,2,1.25,3.00),(9,1,0.75,1.00),(9,2,1.25,1.00),(10,2,1.25,1.00),(10,3,1.25,1.00),(11,3,1.25,1.00),(12,3,1.25,1.00),(13,3,1.25,1.00),(14,3,1.25,10.00),(14,2,1.25,10.00),(15,2,1.00,100.00),(15,1,0.75,100.00),(15,3,1.25,100.00),(16,2,1.00,5.00),(17,3,1.25,5.00),(17,2,1.00,3.00),(18,2,1.00,1.00),(19,3,1.25,5.00),(19,1,0.75,1.00),(20,2,1.00,1.00),(21,2,1.00,3.00),(21,3,1.25,2.00),(22,3,1.25,2.00),(23,3,1.25,2.00),(23,2,1.00,2.00),(24,2,1.00,3.00),(24,3,1.25,2.00),(25,3,1.25,2.00),(25,2,1.00,3.00),(26,2,1.00,3.00),(26,3,1.25,4.50),(27,3,1.25,1.00),(28,3,1.25,4.00),(28,1,0.75,3.50),(29,2,1.00,1.00),(29,3,1.25,1.00),(30,3,1.25,1.00),(31,3,1.25,2.00),(31,2,1.00,3.00),(32,2,1.00,2.00),(32,3,1.25,2.00),(33,1,0.75,8.56),(33,3,1.25,0.52),(33,2,1.00,9.94),(34,2,1.00,1.92),(34,3,1.25,3.67),(34,1,0.75,3.65),(35,3,1.25,3.01),(35,2,1.00,8.32),(35,1,0.75,9.98),(36,1,0.75,2.66),(36,3,1.25,9.64),(36,2,1.00,8.55),(37,2,1.00,9.99),(37,1,0.75,7.06),(37,3,1.25,2.27),(38,3,1.25,7.43),(38,2,1.00,3.96),(38,1,0.75,7.24),(39,2,1.00,6.43),(39,3,1.25,8.44),(39,1,0.75,8.52),(40,2,1.00,6.96),(40,3,1.25,3.28),(40,1,0.75,4.15),(41,1,0.75,2.00),(41,2,1.00,8.47),(41,3,1.25,7.81),(42,2,1.00,9.61),(42,1,0.75,3.80),(42,3,1.25,2.11),(43,3,1.25,1.68),(43,1,0.75,2.96),(43,2,1.00,6.78),(44,3,1.25,0.50),(44,2,1.00,2.71),(44,1,0.75,6.74),(45,3,1.25,8.75),(45,1,0.75,2.21),(45,2,1.00,3.52),(46,1,0.75,1.41),(46,2,1.00,0.11),(46,3,1.25,8.14),(47,3,1.25,0.46),(47,2,1.00,3.57),(47,1,0.75,5.00),(48,1,0.75,8.45),(48,3,1.25,7.72),(48,2,1.00,5.78),(49,1,0.75,4.18),(49,2,1.00,1.55),(49,3,1.25,9.52),(50,3,1.25,3.27),(50,2,1.00,1.17),(50,1,0.75,7.21),(51,2,1.00,3.08),(51,1,0.75,6.11),(51,3,1.25,9.34),(52,3,1.25,2.70),(52,1,0.75,5.65),(52,2,1.00,4.48),(53,1,0.75,3.64),(53,2,1.00,9.85),(53,3,1.25,8.79),(54,2,1.00,5.76),(54,1,0.75,7.09),(54,3,1.25,5.94),(55,2,1.00,1.56),(55,3,1.25,8.00),(55,1,0.75,1.13),(56,2,1.00,8.45),(56,1,0.75,5.66),(56,3,1.25,7.23),(57,3,1.25,7.64),(57,1,0.75,7.34),(57,2,1.00,8.62),(58,3,1.25,4.48),(58,2,1.00,1.02),(58,1,0.75,4.67),(59,3,1.25,0.24),(59,1,0.75,3.62),(59,2,1.00,3.83),(60,1,0.75,6.59),(60,3,1.25,3.63),(60,2,1.00,0.60),(61,2,1.00,8.13),(61,1,0.75,8.59),(61,3,1.25,2.55),(62,1,0.75,9.94),(62,3,1.25,2.31),(62,2,1.00,6.36),(63,3,1.25,4.48),(63,1,0.75,8.38),(63,2,1.00,2.07),(64,3,1.25,2.80),(64,2,1.00,2.95),(64,1,0.75,4.20),(65,2,1.00,2.64),(65,3,1.25,0.96),(65,1,0.75,3.12),(66,1,0.75,8.01),(66,2,1.00,7.76),(66,3,1.25,1.68),(67,1,0.75,0.82),(67,2,1.00,7.87),(67,3,1.25,9.15),(68,3,1.25,5.64),(68,2,1.00,7.70),(68,1,0.75,0.67),(69,2,1.00,5.64),(69,3,1.25,6.71),(69,1,0.75,3.16),(70,3,1.25,3.35),(70,2,1.00,0.45),(70,1,0.75,5.73),(71,3,1.25,9.56),(71,2,1.00,8.17),(71,1,0.75,5.65),(72,1,0.75,2.89),(72,3,1.25,0.88),(72,2,1.00,4.65),(73,2,1.00,4.69),(73,3,1.25,9.36),(73,1,0.75,5.51),(74,2,1.00,2.97),(74,3,1.25,8.65),(74,1,0.75,3.62),(75,2,1.00,1.95),(75,1,0.75,5.35),(75,3,1.25,1.44),(76,1,0.75,6.22),(76,3,1.25,2.64),(76,2,1.00,6.64),(77,2,1.00,3.25),(77,3,1.25,4.15),(77,1,0.75,3.67),(78,3,1.25,1.23),(78,2,1.00,3.68),(78,1,0.75,3.60),(79,3,1.25,5.18),(79,1,0.75,6.56),(79,2,1.00,3.47),(80,1,0.75,2.49),(80,3,1.25,8.00),(80,2,1.00,3.88),(81,2,1.00,6.75),(81,3,1.25,6.78),(81,1,0.75,7.33),(82,2,1.00,7.83),(82,3,1.25,5.61),(82,1,0.75,3.71),(83,1,0.75,8.84),(83,2,1.00,0.17),(83,3,1.25,8.69),(84,2,1.00,9.17),(84,3,1.25,8.23),(84,1,0.75,1.76),(85,2,1.00,0.68),(85,3,1.25,9.75),(85,1,0.75,3.63),(86,3,1.25,9.33),(86,2,1.00,5.39),(86,1,0.75,6.09),(87,1,0.75,0.97),(87,3,1.25,7.32),(87,2,1.00,7.35),(88,1,0.75,4.78),(88,2,1.00,9.68),(88,3,1.25,7.45),(89,3,1.25,0.55),(89,1,0.75,6.58),(89,2,1.00,7.48),(90,2,1.00,1.69),(90,1,0.75,3.27),(90,3,1.25,3.49),(91,3,1.25,7.67),(91,2,1.00,5.56),(91,1,0.75,2.59),(92,3,1.25,0.78),(92,1,0.75,6.72),(92,2,1.00,4.73),(93,2,1.00,2.44),(93,1,0.75,8.19),(93,3,1.25,4.72),(94,3,1.25,1.86),(94,2,1.00,4.93),(94,1,0.75,2.67),(95,2,1.00,9.47),(95,3,1.25,9.71),(95,1,0.75,3.10),(96,1,0.75,5.89),(96,3,1.25,8.79),(96,2,1.00,7.55),(97,1,0.75,0.22),(97,3,1.25,1.29),(97,2,1.00,9.79),(98,1,0.75,8.68),(98,3,1.25,3.89),(98,2,1.00,0.87),(99,2,1.00,2.84),(99,3,1.25,4.35),(99,1,0.75,7.96),(100,1,0.75,4.47),(100,2,1.00,4.51),(100,3,1.25,5.05),(101,1,0.75,8.58),(101,3,1.25,1.46),(101,2,1.00,7.73),(102,1,0.75,4.35),(102,3,1.25,4.08),(102,2,1.00,7.14),(103,1,0.75,9.11),(103,3,1.25,4.65),(103,2,1.00,2.34),(104,1,0.75,2.48),(104,3,1.25,5.90),(104,2,1.00,7.40),(105,3,1.25,8.29),(105,2,1.00,7.22),(105,1,0.75,9.05),(106,2,1.00,5.18),(106,3,1.25,9.52),(106,1,0.75,8.02),(107,3,1.25,9.71),(107,1,0.75,3.30),(107,2,1.00,4.64),(108,3,1.25,5.12),(108,1,0.75,6.84),(108,2,1.00,2.72),(109,2,1.00,0.54),(109,3,1.25,4.22),(109,1,0.75,7.01),(110,1,0.75,6.11),(110,3,1.25,3.65),(110,2,1.00,6.92),(111,2,1.00,1.03),(111,3,1.25,8.03),(111,1,0.75,1.32),(112,2,1.00,8.84),(112,3,1.25,7.78),(112,1,0.75,2.01),(113,2,1.00,2.33),(113,3,1.25,6.98),(113,1,0.75,9.68),(114,3,1.25,5.72),(114,2,1.00,9.79),(114,1,0.75,1.73),(115,3,1.25,2.72),(115,1,0.75,4.38),(115,2,1.00,5.31),(116,3,1.25,4.07),(116,1,0.75,1.05),(116,2,1.00,1.13),(117,3,1.25,2.46),(117,1,0.75,4.81),(117,2,1.00,2.86),(118,3,1.25,1.31),(118,1,0.75,5.55),(118,2,1.00,4.94),(119,3,1.25,4.30),(119,2,1.00,3.44),(119,1,0.75,2.07),(120,2,1.00,7.64),(120,1,0.75,1.67),(120,3,1.25,1.05),(121,1,0.75,0.49),(121,3,1.25,3.12),(121,2,1.00,1.69),(122,3,1.25,2.13),(122,1,0.75,2.88),(122,2,1.00,9.48),(123,2,1.00,3.13),(123,1,0.75,0.53),(123,3,1.25,5.06),(124,2,1.00,0.24),(124,1,0.75,9.90),(124,3,1.25,0.86),(125,1,0.75,6.66),(125,2,1.00,1.07),(125,3,1.25,2.48),(126,1,0.75,8.60),(126,3,1.25,1.32),(126,2,1.00,9.87),(127,3,1.25,0.66),(127,1,0.75,4.83),(127,2,1.00,8.46),(128,3,1.25,0.86),(128,1,0.75,3.02),(128,2,1.00,7.68),(129,3,1.25,0.07),(129,1,0.75,7.35),(129,2,1.00,7.08),(130,1,0.75,0.47),(130,2,1.00,4.46),(130,3,1.25,2.76),(131,1,0.75,0.94),(131,2,1.00,1.11),(131,3,1.25,3.73),(132,1,0.75,0.88),(132,3,1.25,6.80),(132,2,1.00,5.43),(133,1,0.75,8.59),(133,2,1.00,2.80),(133,3,1.25,5.20),(134,1,0.75,1.15),(134,3,1.25,8.38),(134,2,1.00,0.71),(135,3,1.25,6.37),(135,1,0.75,7.90),(135,2,1.00,3.93),(136,1,0.75,8.24),(136,3,1.25,6.95),(136,2,1.00,7.93),(137,1,0.75,3.03),(137,3,1.25,1.76),(137,2,1.00,3.07),(138,3,1.25,0.66),(138,2,1.00,0.99),(138,1,0.75,2.00),(139,1,0.75,9.31),(139,3,1.25,5.54),(139,2,1.00,2.00),(140,2,1.00,8.39),(140,3,1.25,9.06),(140,1,0.75,1.54),(141,2,1.00,1.69),(141,1,0.75,7.56),(141,3,1.25,7.06),(142,3,1.25,6.02),(142,2,1.00,4.92),(142,1,0.75,5.10),(143,2,1.00,8.47),(143,1,0.75,4.49),(143,3,1.25,2.55),(144,1,0.75,8.94),(144,3,1.25,6.44),(144,2,1.00,3.49),(145,3,1.25,8.04),(145,2,1.00,3.78),(145,1,0.75,1.44),(146,2,1.00,3.57),(146,1,0.75,1.55),(146,3,1.25,3.94),(147,3,1.25,4.53),(147,1,0.75,6.23),(147,2,1.00,0.38),(148,3,1.25,0.52),(148,1,0.75,1.98),(148,2,1.00,8.89),(149,3,1.25,6.38),(149,1,0.75,0.26),(149,2,1.00,4.53),(150,2,1.00,3.72),(150,1,0.75,6.15),(150,3,1.25,6.68),(151,1,0.75,2.12),(151,3,1.25,6.20),(151,2,1.00,5.54),(152,2,1.00,2.12),(152,1,0.75,9.52),(152,3,1.25,3.26),(153,1,0.75,3.34),(153,2,1.00,0.82),(153,3,1.25,4.38),(154,1,0.75,2.58),(154,2,1.00,9.02),(154,3,1.25,4.88),(155,2,1.00,3.13),(155,1,0.75,6.76),(155,3,1.25,7.09),(156,3,1.25,6.73),(156,1,0.75,1.91),(156,2,1.00,1.88),(157,2,1.00,6.73),(157,1,0.75,9.91),(157,3,1.25,4.27),(158,2,1.00,9.83),(158,3,1.25,4.17),(158,1,0.75,8.65),(159,3,1.25,9.54),(159,1,0.75,3.79),(159,2,1.00,3.37),(160,3,1.25,3.07),(160,2,1.00,6.78),(160,1,0.75,8.11),(161,2,1.00,5.03),(161,1,0.75,0.26),(161,3,1.25,5.43),(162,3,1.25,9.03),(162,2,1.00,0.92),(162,1,0.75,2.75),(163,3,1.25,2.84),(163,2,1.00,7.08),(163,1,0.75,3.55),(164,2,1.00,4.11),(164,3,1.25,3.35),(164,1,0.75,1.77),(165,3,1.25,6.28),(165,2,1.00,9.20),(165,1,0.75,7.61),(166,2,1.00,4.69),(166,1,0.75,7.04),(166,3,1.25,7.31),(167,2,1.00,4.50),(167,1,0.75,2.56),(167,3,1.25,1.35),(168,3,1.25,0.61),(168,2,1.00,0.61),(168,1,0.75,0.13),(169,2,1.00,8.06),(169,1,0.75,7.63),(169,3,1.25,8.79),(170,2,1.00,4.87),(170,1,0.75,3.35),(170,3,1.25,9.47),(171,3,1.25,8.25),(171,1,0.75,9.72),(171,2,1.00,1.22),(172,3,1.25,9.94),(172,2,1.00,8.82),(172,1,0.75,7.10),(173,3,1.25,3.41),(173,2,1.00,4.96),(173,1,0.75,0.77),(174,2,1.00,4.51),(174,1,0.75,3.88),(174,3,1.25,5.17),(175,3,1.25,9.35),(175,2,1.00,0.17),(175,1,0.75,3.52),(176,3,1.25,6.60),(176,1,0.75,7.95),(176,2,1.00,9.01),(177,1,0.75,6.10),(177,2,1.00,1.82),(177,3,1.25,0.75),(178,3,1.25,4.47),(178,2,1.00,2.73),(178,1,0.75,7.70),(179,1,0.75,9.70),(179,3,1.25,7.87),(179,2,1.00,6.93),(180,3,1.25,4.22),(180,1,0.75,3.06),(180,2,1.00,1.48),(181,2,1.00,3.55),(181,1,0.75,8.37),(181,3,1.25,1.72),(182,2,1.00,9.88),(182,1,0.75,2.36),(182,3,1.25,4.24),(183,1,0.75,6.93),(183,2,1.00,4.26),(183,3,1.25,1.08),(184,1,0.75,1.06),(184,3,1.25,1.42),(184,2,1.00,7.41),(185,3,1.25,0.01),(185,1,0.75,8.72),(185,2,1.00,7.65),(186,3,1.25,1.55),(186,2,1.00,5.53),(186,1,0.75,8.48),(187,2,1.00,2.67),(187,3,1.25,4.14),(187,1,0.75,4.78),(188,3,1.25,5.34),(188,1,0.75,8.89),(188,2,1.00,0.96),(189,1,0.75,7.50),(189,3,1.25,9.33),(189,2,1.00,5.16),(190,3,1.25,9.88),(190,1,0.75,1.71),(190,2,1.00,6.38),(191,3,1.25,8.55),(191,1,0.75,0.37),(191,2,1.00,1.47),(192,1,0.75,1.78),(192,3,1.25,4.76),(192,2,1.00,7.71),(193,2,1.00,2.05),(193,1,0.75,1.37),(193,3,1.25,0.12),(194,3,1.25,3.77),(194,2,1.00,3.12),(194,1,0.75,5.51),(195,1,0.75,1.01),(195,2,1.00,1.75),(195,3,1.25,4.28),(196,2,1.00,2.85),(196,3,1.25,9.93),(196,1,0.75,8.92),(197,2,1.00,3.99),(197,1,0.75,1.61),(197,3,1.25,7.98),(198,3,1.25,1.19),(198,1,0.75,1.68),(198,2,1.00,5.74),(199,1,0.75,6.71),(199,3,1.25,5.49),(199,2,1.00,4.33),(200,3,1.25,6.30),(200,2,1.00,3.87),(200,1,0.75,5.75),(201,1,0.75,8.43),(201,3,1.25,0.45),(201,2,1.00,9.66),(202,1,0.75,9.81),(202,2,1.00,6.01),(202,3,1.25,1.31),(203,2,1.00,2.07),(203,1,0.75,7.05),(203,3,1.25,6.75),(204,2,1.00,4.52),(204,3,1.25,9.24),(204,1,0.75,3.88),(205,2,1.00,2.42),(205,3,1.25,7.96),(205,1,0.75,2.31),(206,2,1.00,0.83),(206,1,0.75,0.69),(206,3,1.25,6.30),(207,1,0.75,5.92),(207,3,1.25,0.01),(207,2,1.00,6.28),(208,3,1.25,6.25),(208,1,0.75,5.26),(208,2,1.00,9.66),(209,2,1.00,4.21),(209,1,0.75,2.95),(209,3,1.25,4.71),(210,3,1.25,6.24),(210,2,1.00,8.86),(210,1,0.75,5.14),(211,3,1.25,0.11),(211,1,0.75,2.05),(211,2,1.00,7.12),(212,1,0.75,1.12),(212,2,1.00,2.16),(212,3,1.25,2.18),(213,1,0.75,5.79),(213,3,1.25,9.89),(213,2,1.00,9.49),(214,1,0.75,3.24),(214,2,1.00,0.79),(214,3,1.25,2.21),(215,1,0.75,2.59),(215,3,1.25,0.49),(215,2,1.00,2.95),(216,1,0.75,7.42),(216,2,1.00,1.31),(216,3,1.25,0.40),(217,2,1.00,5.15),(217,3,1.25,5.48),(217,1,0.75,3.87),(218,3,1.25,1.18),(218,2,1.00,1.13),(218,1,0.75,3.60),(219,3,1.25,9.90),(219,1,0.75,4.32),(219,2,1.00,2.43),(220,2,1.00,1.95),(220,3,1.25,1.76),(220,1,0.75,1.84),(221,2,1.00,8.05),(221,1,0.75,5.13),(221,3,1.25,0.16),(222,3,1.25,9.11),(222,1,0.75,2.96),(222,2,1.00,3.83),(223,3,1.25,2.58),(223,2,1.00,5.54),(223,1,0.75,8.71),(224,3,1.25,0.64),(224,2,1.00,6.22),(224,1,0.75,2.52),(225,3,1.25,5.07),(225,1,0.75,9.92),(225,2,1.00,3.18),(226,1,0.75,4.58),(226,2,1.00,0.35),(226,3,1.25,1.92),(227,1,0.75,6.29),(227,2,1.00,7.24),(227,3,1.25,0.17),(228,3,1.25,8.82),(228,1,0.75,7.90),(228,2,1.00,7.44),(229,2,1.00,3.46),(229,1,0.75,8.67),(229,3,1.25,0.19),(230,2,1.00,8.90),(230,3,1.25,7.39),(230,1,0.75,4.11),(231,1,0.75,4.44),(231,2,1.00,5.82),(231,3,1.25,0.76),(232,1,0.75,1.64),(232,2,1.00,5.39),(232,3,1.25,5.75),(233,1,0.75,1.83),(233,3,1.25,8.69),(233,2,1.00,2.01),(234,2,1.00,3.10),(234,1,0.75,5.35),(234,3,1.25,8.89),(235,3,1.25,9.57),(235,2,1.00,9.26),(235,1,0.75,9.94),(236,2,1.00,2.17),(236,1,0.75,1.54),(236,3,1.25,9.35),(237,1,0.75,0.39),(237,3,1.25,7.89),(237,2,1.00,2.57),(238,3,1.25,2.09),(238,2,1.00,4.91),(238,1,0.75,6.53),(239,2,1.00,9.24),(239,3,1.25,6.92),(239,1,0.75,6.87),(240,2,1.00,3.35),(240,1,0.75,1.02),(240,3,1.25,3.45),(241,3,1.25,5.15),(241,2,1.00,0.81),(241,1,0.75,9.97),(242,2,1.00,7.71),(242,1,0.75,4.63),(242,3,1.25,1.72),(243,3,1.25,6.44),(243,2,1.00,3.10),(243,1,0.75,7.01),(244,3,1.25,9.65),(244,2,1.00,3.38),(244,1,0.75,5.44),(245,2,1.00,6.80),(245,3,1.25,9.82),(245,1,0.75,7.29),(246,2,1.00,2.37),(246,1,0.75,1.32),(246,3,1.25,2.54),(247,2,1.00,7.51),(247,1,0.75,7.24),(247,3,1.25,2.89),(248,2,1.00,3.19),(248,1,0.75,0.85),(248,3,1.25,8.18),(249,3,1.25,1.53),(249,2,1.00,6.06),(249,1,0.75,8.48),(250,2,1.00,9.50),(250,1,0.75,9.49),(250,3,1.25,2.63),(251,1,0.75,6.85),(251,2,1.00,4.52),(251,3,1.25,9.39),(252,1,0.75,0.82),(252,2,1.00,9.13),(252,3,1.25,5.69),(253,3,1.25,6.06),(253,2,1.00,4.01),(253,1,0.75,0.67),(254,1,0.75,9.90),(254,2,1.00,6.99),(254,3,1.25,8.55),(255,2,1.00,3.62),(255,3,1.25,6.01),(255,1,0.75,7.77),(256,2,1.00,4.75),(256,3,1.25,7.97),(256,1,0.75,5.19),(257,2,1.00,6.70),(257,3,1.25,7.57),(257,1,0.75,7.63),(258,2,1.00,4.32),(258,1,0.75,2.15),(258,3,1.25,1.16),(259,1,0.75,2.93),(259,3,1.25,7.14),(259,2,1.00,3.21),(260,1,0.75,5.20),(260,3,1.25,6.98),(260,2,1.00,8.77),(261,1,0.75,2.06),(261,2,1.00,6.02),(261,3,1.25,7.24),(262,1,0.75,0.39),(262,2,1.00,2.30),(262,3,1.25,6.02),(263,1,0.75,4.88),(263,3,1.25,1.71),(263,2,1.00,5.61),(264,1,0.75,7.88),(264,3,1.25,3.46),(264,2,1.00,7.72),(265,3,1.25,6.85),(265,1,0.75,7.31),(265,2,1.00,9.73),(266,2,1.00,2.29),(266,1,0.75,4.65),(266,3,1.25,8.85),(267,1,0.75,2.77),(267,3,1.25,0.90),(267,2,1.00,0.10),(268,3,1.25,9.65),(268,1,0.75,4.48),(268,2,1.00,5.16),(269,2,1.00,7.93),(269,3,1.25,7.53),(269,1,0.75,7.54),(270,3,1.25,7.50),(270,2,1.00,5.00),(270,1,0.75,6.41),(271,2,1.00,6.05),(271,1,0.75,7.21),(271,3,1.25,6.07),(272,1,0.75,0.70),(272,2,1.00,9.39),(272,3,1.25,5.18),(273,1,0.75,8.67),(273,3,1.25,3.82),(273,2,1.00,9.79),(274,1,0.75,2.17),(274,3,1.25,5.35),(274,2,1.00,3.66),(275,3,1.25,6.76),(275,2,1.00,8.31),(275,1,0.75,9.53),(276,3,1.25,7.98),(276,1,0.75,4.52),(276,2,1.00,0.95),(277,1,0.75,7.24),(277,3,1.25,1.64),(277,2,1.00,5.25),(278,1,0.75,9.35),(278,2,1.00,1.95),(278,3,1.25,4.45),(279,3,1.25,5.05),(279,2,1.00,8.45),(279,1,0.75,0.52),(280,3,1.25,1.69),(280,2,1.00,1.53),(280,1,0.75,7.92),(281,2,1.00,9.93),(281,1,0.75,9.74),(281,3,1.25,0.64),(282,2,1.00,7.86),(282,3,1.25,0.25),(282,1,0.75,9.10),(283,2,1.00,8.22),(283,3,1.25,3.32),(283,1,0.75,1.99),(284,3,1.25,1.00),(285,3,1.25,1.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-05-11 19:40:45'),(2,'2024-05-11 19:40:52'),(3,'2024-05-11 19:41:00'),(4,'2024-05-11 19:41:02'),(5,'2024-05-11 19:41:05'),(6,'2024-05-12 01:25:20'),(7,'2024-05-12 01:25:36'),(8,'2024-05-12 01:25:56'),(9,'2024-05-12 01:26:42'),(10,'2024-05-12 01:28:31'),(11,'2024-05-12 01:34:55'),(12,'2024-05-12 01:35:47'),(13,'2024-05-12 01:36:30'),(14,'2024-05-12 01:37:12'),(15,'2024-05-12 01:40:14'),(16,'2024-05-12 20:37:39'),(17,'2024-05-13 21:58:25'),(18,'2024-05-13 21:58:38'),(19,'2024-05-13 22:02:50'),(20,'2024-05-13 22:29:15'),(21,'2024-05-14 00:52:13'),(22,'2024-05-14 00:54:11'),(23,'2024-05-14 00:58:18'),(24,'2024-05-14 01:09:01'),(25,'2024-05-14 01:10:48'),(26,'2024-05-14 01:20:27'),(27,'2024-05-14 01:21:09'),(28,'2024-05-14 01:22:47'),(29,'2024-05-14 01:37:27'),(30,'2024-05-14 01:40:42'),(31,'2024-05-14 21:48:36'),(32,'2024-05-14 21:49:21'),(33,'2024-02-11 18:00:00'),(34,'2024-02-22 17:00:00'),(35,'2024-02-18 19:00:00'),(36,'2024-01-31 22:00:00'),(37,'2024-02-23 06:00:00'),(38,'2024-02-27 09:00:00'),(39,'2024-02-15 21:00:00'),(40,'2024-02-17 01:00:00'),(41,'2024-02-20 12:00:00'),(42,'2024-02-25 01:00:00'),(43,'2024-02-10 15:00:00'),(44,'2024-02-18 13:00:00'),(45,'2024-02-14 21:00:00'),(46,'2024-02-03 12:00:00'),(47,'2024-02-01 06:00:00'),(48,'2024-02-02 20:00:00'),(49,'2024-02-12 07:00:00'),(50,'2024-02-06 07:00:00'),(51,'2024-02-21 02:00:00'),(52,'2024-02-20 04:00:00'),(53,'2024-02-24 09:00:00'),(54,'2024-02-08 05:00:00'),(55,'2024-02-23 23:00:00'),(56,'2024-02-18 11:00:00'),(57,'2024-02-13 01:00:00'),(58,'2024-02-04 18:00:00'),(59,'2024-02-02 19:00:00'),(60,'2024-02-29 00:00:00'),(61,'2024-02-21 09:00:00'),(62,'2024-02-08 06:00:00'),(63,'2024-04-14 06:00:00'),(64,'2024-04-07 05:00:00'),(65,'2024-04-15 05:00:00'),(66,'2024-04-08 01:00:00'),(67,'2024-04-13 17:00:00'),(68,'2024-04-04 10:00:00'),(69,'2024-04-08 06:00:00'),(70,'2024-04-25 03:00:00'),(71,'2024-04-03 23:00:00'),(72,'2024-04-18 10:00:00'),(73,'2024-04-24 09:00:00'),(74,'2024-04-18 03:00:00'),(75,'2024-04-23 13:00:00'),(76,'2024-04-20 03:00:00'),(77,'2024-04-03 03:00:00'),(78,'2024-04-13 22:00:00'),(79,'2024-04-02 04:00:00'),(80,'2024-04-25 07:00:00'),(81,'2024-04-02 23:00:00'),(82,'2024-04-07 02:00:00'),(83,'2024-04-14 07:00:00'),(84,'2024-04-11 09:00:00'),(85,'2024-04-28 22:00:00'),(86,'2024-04-02 11:00:00'),(87,'2024-04-18 05:00:00'),(88,'2024-04-26 02:00:00'),(89,'2024-04-14 21:00:00'),(90,'2024-04-25 19:00:00'),(91,'2024-04-06 23:00:00'),(92,'2024-04-24 06:00:00'),(93,'2024-03-13 22:00:00'),(94,'2024-03-20 02:00:00'),(95,'2024-03-04 21:00:00'),(96,'2024-03-01 21:00:00'),(97,'2024-03-30 12:00:00'),(98,'2024-03-19 06:00:00'),(99,'2024-03-24 21:00:00'),(100,'2024-03-07 02:00:00'),(101,'2024-03-15 21:00:00'),(102,'2024-03-26 01:00:00'),(103,'2024-03-24 06:00:00'),(104,'2024-03-28 03:00:00'),(105,'2024-03-29 18:00:00'),(106,'2024-03-10 07:00:00'),(107,'2024-03-20 08:00:00'),(108,'2024-03-22 05:00:00'),(109,'2024-03-04 13:00:00'),(110,'2024-03-23 06:00:00'),(111,'2024-03-27 13:00:00'),(112,'2024-03-22 14:00:00'),(113,'2024-03-02 07:00:00'),(114,'2024-03-10 08:00:00'),(115,'2024-03-14 21:00:00'),(116,'2024-03-22 19:00:00'),(117,'2024-03-17 10:00:00'),(118,'2024-03-10 16:00:00'),(119,'2024-03-23 17:00:00'),(120,'2024-03-15 08:00:00'),(121,'2024-03-02 17:00:00'),(122,'2024-03-13 04:00:00'),(123,'2024-02-23 11:00:00'),(124,'2024-02-22 19:00:00'),(125,'2024-02-28 14:00:00'),(126,'2024-02-05 22:00:00'),(127,'2024-02-20 15:00:00'),(128,'2024-02-10 14:00:00'),(129,'2024-02-23 21:00:00'),(130,'2024-02-04 06:00:00'),(131,'2024-02-02 20:00:00'),(132,'2024-02-04 18:00:00'),(133,'2024-02-19 03:00:00'),(134,'2024-02-09 09:00:00'),(135,'2024-02-25 14:00:00'),(136,'2024-02-01 21:00:00'),(137,'2024-02-06 02:00:00'),(138,'2024-02-20 02:00:00'),(139,'2024-02-21 00:00:00'),(140,'2024-02-01 23:00:00'),(141,'2024-02-17 23:00:00'),(142,'2024-02-04 13:00:00'),(143,'2024-02-19 08:00:00'),(144,'2024-02-10 06:00:00'),(145,'2024-02-15 20:00:00'),(146,'2024-02-24 07:00:00'),(147,'2024-02-29 01:00:00'),(148,'2024-02-21 18:00:00'),(149,'2024-02-29 14:00:00'),(150,'2024-02-11 13:00:00'),(151,'2024-05-02 09:00:00'),(152,'2024-05-14 08:00:00'),(153,'2024-05-06 09:00:00'),(154,'2024-05-08 02:00:00'),(155,'2024-05-09 20:00:00'),(156,'2024-05-03 15:00:00'),(157,'2024-05-08 00:00:00'),(158,'2024-05-04 05:00:00'),(159,'2024-05-12 00:00:00'),(160,'2024-05-08 19:00:00'),(161,'2024-05-13 05:00:00'),(162,'2024-05-11 08:00:00'),(163,'2024-05-14 16:00:00'),(164,'2024-05-08 20:00:00'),(165,'2024-05-10 16:00:00'),(166,'2024-05-03 07:00:00'),(167,'2024-05-12 01:00:00'),(168,'2024-05-01 22:00:00'),(169,'2024-05-02 21:00:00'),(170,'2024-05-08 11:00:00'),(171,'2024-05-03 17:00:00'),(172,'2024-05-01 10:00:00'),(173,'2024-05-03 07:00:00'),(174,'2024-05-01 18:00:00'),(175,'2024-05-07 15:00:00'),(176,'2024-05-12 13:00:00'),(177,'2024-05-03 04:00:00'),(178,'2024-05-06 23:00:00'),(179,'2024-05-05 09:00:00'),(180,'2024-05-04 09:00:00'),(181,'2024-04-04 18:00:00'),(182,'2024-04-06 01:00:00'),(183,'2024-04-01 00:00:00'),(184,'2024-04-14 00:00:00'),(185,'2024-04-01 12:00:00'),(186,'2024-04-03 11:00:00'),(187,'2024-04-09 18:00:00'),(188,'2024-04-06 18:00:00'),(189,'2024-04-07 05:00:00'),(190,'2024-04-09 08:00:00'),(191,'2024-04-09 22:00:00'),(192,'2024-04-14 15:00:00'),(193,'2024-04-11 11:00:00'),(194,'2024-04-07 09:00:00'),(195,'2024-04-08 17:00:00'),(196,'2024-04-06 21:00:00'),(197,'2024-04-09 20:00:00'),(198,'2024-04-07 21:00:00'),(199,'2024-04-09 16:00:00'),(200,'2024-04-06 04:00:00'),(201,'2024-04-09 23:00:00'),(202,'2024-04-08 20:00:00'),(203,'2024-04-13 12:00:00'),(204,'2024-04-06 04:00:00'),(205,'2024-04-05 15:00:00'),(206,'2024-04-04 15:00:00'),(207,'2024-04-05 18:00:00'),(208,'2024-04-14 15:00:00'),(209,'2024-04-10 11:00:00'),(210,'2024-04-11 11:00:00'),(211,'2024-04-01 16:00:00'),(212,'2024-04-12 17:00:00'),(213,'2024-04-05 20:00:00'),(214,'2024-04-09 13:00:00'),(215,'2024-04-03 16:00:00'),(216,'2024-04-04 17:00:00'),(217,'2024-04-09 22:00:00'),(218,'2024-04-04 02:00:00'),(219,'2024-04-03 18:00:00'),(220,'2024-04-09 01:00:00'),(221,'2024-04-09 02:00:00'),(222,'2024-04-14 17:00:00'),(223,'2024-04-14 14:00:00'),(224,'2024-04-24 19:00:00'),(225,'2024-04-21 09:00:00'),(226,'2024-04-06 23:00:00'),(227,'2024-04-29 17:00:00'),(228,'2024-04-18 09:00:00'),(229,'2024-04-29 12:00:00'),(230,'2024-04-20 15:00:00'),(231,'2024-04-18 08:00:00'),(232,'2024-04-25 01:00:00'),(233,'2024-04-25 03:00:00'),(234,'2024-04-07 03:00:00'),(235,'2024-04-10 03:00:00'),(236,'2024-04-10 10:00:00'),(237,'2024-04-09 16:00:00'),(238,'2024-04-05 17:00:00'),(239,'2024-04-14 16:00:00'),(240,'2024-04-25 06:00:00'),(241,'2024-04-24 21:00:00'),(242,'2024-04-22 12:00:00'),(243,'2024-04-14 06:00:00'),(244,'2024-04-17 08:00:00'),(245,'2024-04-21 01:00:00'),(246,'2024-04-28 04:00:00'),(247,'2024-04-16 21:00:00'),(248,'2024-04-18 03:00:00'),(249,'2024-04-14 00:00:00'),(250,'2024-04-17 13:00:00'),(251,'2024-04-28 23:00:00'),(252,'2024-04-29 01:00:00'),(253,'2024-04-15 13:00:00'),(254,'2024-03-08 21:00:00'),(255,'2024-03-17 01:00:00'),(256,'2024-03-23 13:00:00'),(257,'2024-03-03 04:00:00'),(258,'2024-03-17 13:00:00'),(259,'2024-03-08 09:00:00'),(260,'2024-03-25 04:00:00'),(261,'2024-03-02 09:00:00'),(262,'2024-03-12 17:00:00'),(263,'2024-03-22 19:00:00'),(264,'2024-03-28 05:00:00'),(265,'2024-03-06 15:00:00'),(266,'2024-03-22 00:00:00'),(267,'2024-03-13 04:00:00'),(268,'2024-03-01 19:00:00'),(269,'2024-03-08 15:00:00'),(270,'2024-03-18 01:00:00'),(271,'2024-03-14 00:00:00'),(272,'2024-03-26 19:00:00'),(273,'2024-03-14 11:00:00'),(274,'2024-03-27 05:00:00'),(275,'2024-03-01 23:00:00'),(276,'2024-03-30 00:00:00'),(277,'2024-03-05 12:00:00'),(278,'2024-03-05 21:00:00'),(279,'2024-03-17 05:00:00'),(280,'2024-03-18 22:00:00'),(281,'2024-03-07 00:00:00'),(282,'2024-03-24 11:00:00'),(283,'2024-03-22 07:00:00'),(284,'2024-05-14 21:59:42'),(285,'2024-06-02 00:10:05');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price_kg` decimal(5,2) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'apple',0.75,'1.png'),(2,'orange',1.00,'2.png'),(3,'banana',1.25,'3.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02  3:11:33