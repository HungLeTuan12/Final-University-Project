-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: diepsinh
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `full_name` varchar(64) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id_hour` bigint DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `schedule_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdkador5s62nuvhdf672u65fs9` (`schedule_id`),
  KEY `FKkgseyy7t56x7lkjgu3wah5s3t` (`user_id`),
  KEY `idx_booking_token` (`token`),
  KEY `idx_booking_created_at` (`created_at`),
  CONSTRAINT `FKdkador5s62nuvhdf672u65fs9` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FKkgseyy7t56x7lkjgu3wah5s3t` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (26,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-04-26 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',2,'Tôi bị ho','0312456789','SUCCESS','MKH6789VNHNG17',NULL,89,18,'2025-04-24 22:07:48.135000'),(27,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-04-26 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',3,'Tôi bị ho','0312456789','SUCCESS','MKH6789VNHNG17',NULL,88,18,'2025-04-24 22:26:49.214000'),(30,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-04-26 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',1,'Tôi bị ho','0312456789','FAILURE','MKH6789VNHNG17',NULL,NULL,18,'2025-04-24 23:02:39.770000'),(31,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-04-26 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',1,'Tôi bị ho','0312456789','SUCCESS','MKH6789VNHNG17',NULL,90,18,'2025-04-24 23:09:04.010000'),(32,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-04-27 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',1,'Tôi bị ho','0312456789','FAILURE','MKH6789VNHNG17',NULL,NULL,23,'2025-04-27 00:03:29.716000'),(34,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-05-09 00:00:00.000000','2025-04-28 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùn','MALE',5,'d','0312456789','FAILURE','MKH6789VNHN',NULL,142,18,'2025-05-09 00:09:30.425000'),(35,'Như Nguyệt - Tam Giang - Yên Phong - Bắc Ninh','2025-05-11 00:00:00.000000','2003-08-12 07:00:00.000000','hungtypn812@gmail.com','Đỗ Văn Hùng','MALE',1,'Tôi bị ho','0312456789','PENDING','MKH6789VNHNG17',NULL,144,18,'2025-05-10 22:48:55.311000');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dob` varchar(100) DEFAULT NULL,
  `gmail` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hours`
--

DROP TABLE IF EXISTS `hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hours` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours`
--

LOCK TABLES `hours` WRITE;
/*!40000 ALTER TABLE `hours` DISABLE KEYS */;
INSERT INTO `hours` VALUES (1,'7h - 7h30'),(2,'7h30 - 8h'),(3,'8h - 8h30'),(4,'8h30 - 9h'),(5,'9h - 9h30'),(6,'9h30 - 10h'),(7,'10h - 10h30'),(8,'10h30 - 11h'),(9,'13h - 13h30'),(10,'13h30 - 14h'),(11,'14h - 14h30'),(12,'14h30 - 15h'),(13,'15h - 15h30'),(14,'15h30 - 16h'),(15,'16h - 16h30'),(16,'16h30 - 17h');
/*!40000 ALTER TABLE `hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id_image` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oi0ctjbjvktdcfxws9w2exiwb` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (2,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674667/jyhbqp78807eu1fqyeje.png','Triệu chứng: Đau các khớp tay - chân / Đau lưng / Trật khớp / Bong gân / Gãy xương / Chấn thương thể thao / Tiền sử có viêm khớp dạng thấp - viêm khớp cột sống - viêm cơ tự miễn...','jyhbqp78807eu1fqyeje','CK CƠ XƯƠNG KHỚP'),(6,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743699588/mxqmbtgvgxgsiqllfzy5.png','Tê hoặc yếu cơ, tay chân, thường ở một bên cơ thể / Chóng mặt hoặc mất thăng bằng / Rối loạn ngôn ngữ / Đau đầu dữ dội không có lý do / Tiền sử tai biến...','mxqmbtgvgxgsiqllfzy5','CK ĐỘT QUỴ'),(9,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674907/qhqekskpvuso81y3y7er.png','Triệu chứng: Ho kéo dài / Thở khò khè / Thở có tiếng rít / Đờm có máu / Tiền sử có bệnh lao phổi - hen - suyễn...','qhqekskpvuso81y3y7er','CK HÔ HẤP'),(18,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674863/q3p0lvnkkqhh7rce3p5s.png','Triệu chứng: Đau họng / Khó nuốt / Nuốt vướng / Đau ù tai / Nghe kém / Chảy mủ tai / Nghẹt - chảy mũi / Ngủ ngáy / Tiền sử có viêm tai giữa hoặc viêm xoang...','q3p0lvnkkqhh7rce3p5s','CK TAI MŨI HỌNG'),(19,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674976/oq33dhsikxupqbxpd5ru.png','Triệu chứng: Đau rát hoặc đau âm ỉ vùng bụng / Ợ hơi - ợ chua / Trào ngược thức ăn / Rối loạn đi cầu / Tiền sử có bệnh lý viêm - loét dạ dày hoặc viêm tuỵ...','oq33dhsikxupqbxpd5ru','CK TIÊU HÓA'),(20,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743691751/jjfnmposu20yhxowgudv.png','Triệu chứng: Ngứa ngoài da / Da tróc vảy / Da nứt nẻ / Nổi mẩn đỏ / Sạm da / Mụn / Chai sần / Nấm tóc...','jjfnmposu20yhxowgudv','CK DA LIỄU'),(21,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674648/ey7mg0mntfnwhkreeste.png','Triệu chứng: Mắt nhìn mờ / Đau / Cộm ngứa / Đỏ mắt / Lẹo...','ey7mg0mntfnwhkreeste','CK MẮT'),(22,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745674799/f3fguewck5o9jtwpbzqw.png','Khám & tầm soát tổng quát, nếu phát hiện bệnh lý các bác sĩ sẽ tư vấn và hướng dẫn điều trị đúng chuyên khoa.','f3fguewck5o9jtwpbzqw','KHÁM TỔNG QUÁT'),(23,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745675116/koijmmvpeuycxszo3oqd.png','Chỉ dành cho bệnh nhân dưới 16 tuổi. Bệnh nhân trên 16 tuổi vui lòng lựa chọn khám chuyên khoa theo triệu chứng điển hình.','koijmmvpeuycxszo3oqd','CK NHI'),(24,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745675192/be75qx1qot6tgaxhue1d.png','Triệu chứng: Sụt cân không rõ nguyên nhân / Khát nước nhiều / Vết thương lâu lành / Mắt lồi / Tiền sử có bệnh tiểu đường - bướu cổ hoặc Bệnh lý tuyến giáp...','be75qx1qot6tgaxhue1d','CK NỘI TIẾT'),(25,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745675293/bvfddv6maeyxfglsd8gu.png','Triệu chứng: Ngứa rát âm đạo / Đau vùng bụng chậu / Chảy máu bất thường âm đạo / Kinh nguyệt không đều / Đi tiểu không tự chủ / Tiền sử có bệnh lý u nang buồng trứng...','bvfddv6maeyxfglsd8gu','CK SẢN PHỤ KHOA'),(26,'http://res.cloudinary.com/dme1s0asq/image/upload/v1745676412/b0hpjsli4wzqm9exubvy.png','Triệu chứng: Mất ngủ / Chóng mặt / Đau đầu không rõ nguyên nhân / Đau cổ vai gáy có tê bì tay chân / Tiền sử có thoát vị đĩa đệm hoặc bệnh lý rối loạn tiền đình / Bệnh Parkinson...','b0hpjsli4wzqm9exubvy','CK THẦN KINH');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `name` enum('ROLE_ADMIN','ROLE_DOCTOR','ROLE_PATIENT') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Manage all system','ROLE_ADMIN'),(2,'Doctor','ROLE_DOCTOR'),(3,'Patient','ROLE_PATIENT');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `doctor_id` bigint NOT NULL,
  `is_booked` bit(1) DEFAULT b'0',
  `hour_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK9qrxqatn92q9eclqhx300jvii` (`doctor_id`,`date`,`hour_id`),
  KEY `idx_schedule_hour_id` (`hour_id`),
  CONSTRAINT `FK511qg1im0bwown49vejjybh3x` FOREIGN KEY (`hour_id`) REFERENCES `hours` (`id`),
  CONSTRAINT `FKe6q88oxn5ybnfvt5c0c1xf8ny` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (81,'2025-04-23 00:00:00.000000',19,_binary '\0',6),(82,'2025-04-24 00:00:00.000000',19,_binary '\0',6),(83,'2025-04-24 00:00:00.000000',19,_binary '',3),(84,'2025-04-26 00:00:00.000000',19,_binary '\0',6),(85,'2025-04-26 00:00:00.000000',19,_binary '',8),(86,'2025-04-24 00:00:00.000000',18,_binary '\0',1),(87,'2025-04-24 00:00:00.000000',18,_binary '\0',4),(88,'2025-04-26 00:00:00.000000',18,_binary '',3),(89,'2025-04-26 00:00:00.000000',18,_binary '',2),(90,'2025-04-26 00:00:00.000000',18,_binary '',1),(91,'2025-04-25 00:00:00.000000',18,_binary '\0',1),(92,'2025-04-25 00:00:00.000000',18,_binary '\0',5),(94,'2025-04-27 00:00:00.000000',19,_binary '',2),(95,'2025-04-27 00:00:00.000000',23,_binary '\0',8),(96,'2025-04-27 00:00:00.000000',23,_binary '\0',7),(98,'2025-04-28 00:00:00.000000',19,_binary '\0',3),(99,'2025-04-29 00:00:00.000000',19,_binary '\0',4),(100,'2025-04-29 00:00:00.000000',19,_binary '\0',6),(101,'2025-04-30 00:00:00.000000',19,_binary '\0',1),(102,'2025-04-30 00:00:00.000000',19,_binary '\0',2),(103,'2025-04-30 00:00:00.000000',19,_binary '\0',3),(104,'2025-04-30 00:00:00.000000',19,_binary '\0',6),(105,'2025-04-30 00:00:00.000000',19,_binary '\0',5),(106,'2025-04-30 00:00:00.000000',19,_binary '\0',4),(107,'2025-04-30 00:00:00.000000',19,_binary '\0',7),(108,'2025-04-30 00:00:00.000000',19,_binary '\0',8),(111,'2025-04-28 00:00:00.000000',18,_binary '\0',3),(112,'2025-04-28 00:00:00.000000',18,_binary '\0',4),(113,'2025-04-28 00:00:00.000000',18,_binary '\0',5),(114,'2025-04-28 00:00:00.000000',18,_binary '\0',6),(115,'2025-04-28 00:00:00.000000',18,_binary '\0',7),(116,'2025-04-28 00:00:00.000000',18,_binary '\0',8),(125,'2025-05-07 00:00:00.000000',17,_binary '\0',2),(126,'2025-05-07 00:00:00.000000',17,_binary '\0',3),(127,'2025-05-08 00:00:00.000000',17,_binary '\0',2),(128,'2025-05-08 00:00:00.000000',17,_binary '\0',7),(129,'2025-05-07 00:00:00.000000',24,_binary '\0',2),(130,'2025-05-07 00:00:00.000000',24,_binary '\0',8),(131,'2025-05-07 00:00:00.000000',24,_binary '\0',6),(132,'2025-05-08 00:00:00.000000',24,_binary '\0',1),(133,'2025-05-08 00:00:00.000000',24,_binary '\0',7),(134,'2025-05-07 00:00:00.000000',18,_binary '\0',1),(135,'2025-05-07 00:00:00.000000',18,_binary '\0',2),(136,'2025-05-07 00:00:00.000000',18,_binary '\0',3),(137,'2025-05-07 00:00:00.000000',18,_binary '\0',4),(138,'2025-05-07 00:00:00.000000',18,_binary '\0',5),(139,'2025-05-07 00:00:00.000000',18,_binary '\0',6),(140,'2025-05-07 00:00:00.000000',18,_binary '\0',7),(141,'2025-05-07 00:00:00.000000',18,_binary '\0',8),(142,'2025-05-09 00:00:00.000000',18,_binary '\0',5),(143,'2025-05-09 00:00:00.000000',18,_binary '\0',6),(144,'2025-05-11 00:00:00.000000',18,_binary '',1),(145,'2025-05-11 00:00:00.000000',18,_binary '\0',2),(162,'2025-05-12 00:00:00.000000',18,_binary '\0',1),(163,'2025-05-12 00:00:00.000000',18,_binary '\0',2),(164,'2025-05-12 00:00:00.000000',18,_binary '\0',3),(165,'2025-05-12 00:00:00.000000',18,_binary '\0',4),(166,'2025-05-12 00:00:00.000000',18,_binary '\0',5),(167,'2025-05-12 00:00:00.000000',18,_binary '\0',6),(168,'2025-05-12 00:00:00.000000',18,_binary '\0',7),(169,'2025-05-12 00:00:00.000000',18,_binary '\0',8),(170,'2025-05-12 00:00:00.000000',18,_binary '\0',9),(171,'2025-05-12 00:00:00.000000',18,_binary '\0',10),(172,'2025-05-12 00:00:00.000000',18,_binary '\0',11),(173,'2025-05-12 00:00:00.000000',18,_binary '\0',12),(174,'2025-05-12 00:00:00.000000',18,_binary '\0',13),(175,'2025-05-12 00:00:00.000000',18,_binary '\0',14),(176,'2025-05-12 00:00:00.000000',18,_binary '\0',15),(177,'2025-05-12 00:00:00.000000',18,_binary '\0',16);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` longtext,
  `enabled` bit(1) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `gmail` varchar(50) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `trangthai` varchar(20) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `url_id` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `major_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FKc1q9juawhjvqie7wi3p44me9y` (`major_id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKc1q9juawhjvqie7wi3p44me9y` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'2025-03-30 23:00:52.788312',NULL,_binary '',NULL,NULL,'$2a$10$DAn0bxIo/WDFNOd3XqbI1OAKHwsxlx2c7VylUcKjyA/j8AXnmQ/qW',NULL,NULL,'2025-03-30 23:00:52.788312',NULL,'admin',NULL,1,0.00),(14,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743781477/iet1az6eisqai6wr1bb8.png','2025-04-04 22:44:37.301482','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '\0','Nguyen Van A','hunghunghung@gmail.com','$2a$10$ZSQp7EHVxDfxaBjaw.sOoOeZzBeQ7Odl5UIROeTJUPE.WdRahIRRG','03599478969','dl','2025-04-27 15:48:35.243077','iet1az6eisqai6wr1bb8','nguyenvana1234578',2,2,150000.00),(15,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743844598/unw09vhoiv5zcpfleu2j.png','2025-04-05 16:16:38.144025','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '\0','Đỗ Văn Hưng','dovanhung147@gmail.com','$2a$10$xSBcHx1lgYunpDyqEhYB1Oid7YqiaiamBWzA6cKIAkBrzEzuT3U8O','0347896325','dl','2025-04-27 15:48:55.645674','unw09vhoiv5zcpfleu2j','dovanhung2510',2,2,150000.00),(16,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743844734/sgsay1cbqocydsm32xwd.png','2025-04-05 16:18:53.490437','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Nguyễn Hồng Ngọc','nguyen.hong.ngoc@gmail.com','$2a$10$GlaZ/CDHD.2ZlWVMr2ZPv.qOHRzezU0vO7lDkGgzaT6r3Bcw4jqLW','0359947891','dl','2025-04-27 16:05:35.648996','sgsay1cbqocydsm32xwd','nguyen.hong.ngoc',9,2,200000.00),(17,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743844815/f8m6zzcqxrxoh2v661na.png','2025-04-05 16:20:14.969401','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Ngô Tuệ Anh','ngo.tue.anh@gmail.com','$2a$10$TmVXdoNovSQ1NGWZlujhUOYP15WdBxhejW/u6GX6J.kPPFOXG03py','0359874789','dl','2025-04-27 16:05:52.026471','f8m6zzcqxrxoh2v661na','ngo.tue.anh',18,2,250000.00),(18,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743844884/sgi7jviwio1iiuotyoyt.png','2025-04-05 16:21:23.693361','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Lê Minh Đức','le.minh.duc@gmail.com','$2a$10$ZYlKIY3sryk4cWA6RL3aIuyJprQL6kU51Rw/wzfQ91X0L5oj6KeZ2','0359874789','dl','2025-04-27 16:06:04.577767','sgi7jviwio1iiuotyoyt','le.minh.duc',18,2,150000.00),(19,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743844981/bigdgfrljmm7gwo4tyjl.png','2025-04-05 16:23:00.897386','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Đặng Thị Hương Sen','hunglehung812@gmail.com','$2a$10$elO2tXylO5Xr67Q6Il/mT.z1XkEJbZOlBZVoiw.pdWsfAnQ6L6ui2','035987478','dl','2025-04-05 16:23:00.897386','bigdgfrljmm7gwo4tyjl','dang.thi.huong.sen',20,2,150000.00),(20,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743845038/urrj1ekdf1sfvyhyplzf.png','2025-04-05 16:23:57.113839','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Nguyễn Thành Quang','nguyen.thanh.quang@gmail.com','$2a$10$P7tC7tEWr3frz7ZrPN3f6eQAYqLRzcbPhDj61x2B8ccdOkvOr2XeW','035987478','dl','2025-04-05 16:23:57.113839','urrj1ekdf1sfvyhyplzf','nguyen.thanh.quang',19,2,150000.00),(21,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743845101/awbjsi9ceb6crabqrz3e.png','2025-04-05 16:25:00.651434','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Lê Tuấn Anh','le.tuan.anh@gmail.com','$2a$10$fJooK936GEcf4zr6cXK7weykGai5t2EVOm5wG5T7pm.vwzmkfzdVu','035987478','dl','2025-04-05 16:25:00.651434','awbjsi9ceb6crabqrz3e','le.tuan.anh',19,2,150000.00),(22,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743845170/c9h1wly24w8sfb0ov9nj.png','2025-04-05 16:26:09.595407','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Lê Hoài Thu','le.hoai.thu@gmail.com','$2a$10$UI7sPf9WkmpC6I8VVsEp0OKR2S8gzrxPYL6heGTD4n8Hwq0lqhfYK','035987478','dl','2025-04-05 16:26:09.595407','c9h1wly24w8sfb0ov9nj','le.hoai.thu',20,2,150000.00),(23,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743845256/mrnixretyhrslydd76tv.png','2025-04-05 16:27:35.257445','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Đặng Thị Hương','dang.thi.huong@gmail.com','$2a$10$sq/kW7qFCmFCGssuD8ROZOJAa6Bp.xvtQeoddp0yFH4E1SlWyLQ72','035987478','dl','2025-04-05 16:27:35.257445','mrnixretyhrslydd76tv','dang.thi.huong',20,2,150000.00),(24,'http://res.cloudinary.com/dme1s0asq/image/upload/v1743845385/a830jspfabs7bhy49abb.png','2025-04-05 16:29:44.987607','Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả. Bác sĩ cam kết mạnh mẽ trong việc cung cấp dịch vụ chăm sóc y tế toàn diện, tập trung vào y học dự phòng, chẩn đoán sớm và các chiến lược điều trị hiệu quả.',_binary '','Nguyễn Trung Hậu','nguyen.trung.hau@gmail.com','$2a$10$qjPSEv7MPJdlUBJdw03n/.6Ugf0MGVbTGqKLo8ks9tTmAIIH7v0/m','035987456','dl','2025-04-05 16:29:44.987607','a830jspfabs7bhy49abb','nguyen.trung.hau',18,2,150000.00);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 21:49:33
