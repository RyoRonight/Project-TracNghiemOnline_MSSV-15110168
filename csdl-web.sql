-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: web-tracnghiem
-- ------------------------------------------------------
-- Server version	5.0.82-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `bailam`
--

DROP TABLE IF EXISTS `bailam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bailam` (
  `MaDeThi` varchar(8) collate utf8_unicode_ci NOT NULL,
  `MSND` char(8) collate utf8_unicode_ci NOT NULL,
  `SoCauDung` int(10) unsigned default NULL,
  `Diem` float unsigned default NULL,
  PRIMARY KEY  (`MaDeThi`,`MSND`),
  KEY `FK_bailam1_idx` (`MSND`),
  KEY `FK_bailam2_idx` (`MaDeThi`),
  CONSTRAINT `FK_bailam1` FOREIGN KEY (`MSND`) REFERENCES `nguoidung` (`MSND`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bailam2` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`MaDeThi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bailam`
--

LOCK TABLES `bailam` WRITE;
/*!40000 ALTER TABLE `bailam` DISABLE KEYS */;
INSERT INTO `bailam` VALUES ('1414','15110227',NULL,NULL);
/*!40000 ALTER TABLE `bailam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cauhoi`
--

DROP TABLE IF EXISTS `cauhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cauhoi` (
  `MaCauHoi` varchar(10) collate utf8_unicode_ci NOT NULL,
  `MonHoc` varchar(70) collate utf8_unicode_ci NOT NULL,
  `ChuDe` varchar(70) collate utf8_unicode_ci NOT NULL,
  `MucDo` enum('Dễ','Trung bình','Khó') collate utf8_unicode_ci NOT NULL,
  `NdungCauhoi` varchar(255) collate utf8_unicode_ci NOT NULL,
  `HinhAnh` mediumblob,
  `NgayTaoCauHoi` date default NULL,
  PRIMARY KEY  (`MaCauHoi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cauhoi`
--

LOCK TABLES `cauhoi` WRITE;
/*!40000 ALTER TABLE `cauhoi` DISABLE KEYS */;
INSERT INTO `cauhoi` VALUES ('15','15','15','Dễ','',NULL,'2017-12-24'),('17','Toán','Giải tích','Dễ','trời đất',NULL,'2017-12-24'),('18','Hóa','Hóa keo','Dễ','ố zè',NULL,'2017-12-24'),('CHEM2','Hóa','Hóa keo','Trung bình','argeag',NULL,'2017-12-31'),('CHEM3','Hóa','Hóa điện','Dễ','sfhnrydyf',NULL,'2017-12-31'),('dsvfdv','fdgbfng','fbfbf','Khó','rdfbddf',NULL,'2017-12-26'),('ergrf','Toán','Ahihi','Trung bình','srgsthssts',NULL,NULL),('fdngxn','fngfhn','hgngh','Khó','ở đâu',NULL,'2017-12-26'),('fdzbfdbf','Toán','rnrn','Trung bình','ehbsrhtrht',NULL,NULL),('MATH1','Toán','Giải tích','Dễ','Đặc điểm của tam giác cân là:',NULL,'2017-12-26'),('Math3','Toán','Hình học','Dễ','Như thế nào là hình vuông?',NULL,'2017-12-31'),('zfdbfb','Toán','Ahoho','Trung bình','zrthrh',NULL,NULL);
/*!40000 ALTER TABLE `cauhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dethi`
--

DROP TABLE IF EXISTS `dethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dethi` (
  `MaDeThi` varchar(8) collate utf8_unicode_ci NOT NULL,
  `TenDeThi` varchar(255) collate utf8_unicode_ci default NULL,
  `MonHoc` varchar(70) collate utf8_unicode_ci default NULL,
  `SoCauHoi` int(10) unsigned default NULL,
  `NgayThi` date default NULL,
  `ThoiGianLamBai` time default NULL,
  PRIMARY KEY  (`MaDeThi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dethi`
--

LOCK TABLES `dethi` WRITE;
/*!40000 ALTER TABLE `dethi` DISABLE KEYS */;
INSERT INTO `dethi` VALUES ('1414','Kiểm tra giải tích','Toán',3,'2018-01-01','00:07:00'),('2222','dfnfmgghm','Toán',1,'2018-03-03','00:08:00'),('2323','Thi Anh văn đầu vào','Anh văn',3,'2018-05-01','00:07:00');
/*!40000 ALTER TABLE `dethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoa` (
  `MaKhoa` char(3) collate utf8_unicode_ci NOT NULL,
  `TenKhoa` varchar(70) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES ('104','Kỹ thuật công nghiệp'),('109','Công nghệ may'),('110','Công nghệ thông tin'),('111','Công nghệ may'),('116','Thực Phẩm'),('123','Thiết kế thời trang'),('124','Quản lý công nghiệp'),('125','Kế toán'),('141','Điện tử truyền thống'),('143','Chế tạo máy'),('144','Kỹ thuật cơ khí'),('145','Cơ khí ô tô'),('146','Cơ điện tử'),('147','Nhiệt'),('149','Xây dựng dân dụng'),('150','Môi trường'),('152','Kinh tế gia đình'),('No',NULL);
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoathi`
--

DROP TABLE IF EXISTS `khoathi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoathi` (
  `MaDeThi` varchar(8) collate utf8_unicode_ci NOT NULL,
  `MaKhoa` char(3) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`MaDeThi`,`MaKhoa`),
  KEY `FK_khoathi1_idx` (`MaKhoa`),
  CONSTRAINT `FK` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`MaDeThi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoathi`
--

LOCK TABLES `khoathi` WRITE;
/*!40000 ALTER TABLE `khoathi` DISABLE KEYS */;
INSERT INTO `khoathi` VALUES ('1414','104'),('1414','110'),('2222','110'),('2323','110'),('2222','111'),('1414','123');
/*!40000 ALTER TABLE `khoathi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lopthi`
--

DROP TABLE IF EXISTS `lopthi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lopthi` (
  `MaDeThi` varchar(8) collate utf8_unicode_ci NOT NULL,
  `MaLopThi` varchar(7) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`MaDeThi`,`MaLopThi`),
  CONSTRAINT `FK_lopthi` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`MaDeThi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lopthi`
--

LOCK TABLES `lopthi` WRITE;
/*!40000 ALTER TABLE `lopthi` DISABLE KEYS */;
/*!40000 ALTER TABLE `lopthi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndungdethi`
--

DROP TABLE IF EXISTS `ndungdethi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndungdethi` (
  `MaDeThi` varchar(8) collate utf8_unicode_ci NOT NULL,
  `MaCauHoi` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`MaDeThi`,`MaCauHoi`),
  KEY `FK_nddt2_idx` (`MaCauHoi`),
  CONSTRAINT `FK_nddt1` FOREIGN KEY (`MaDeThi`) REFERENCES `dethi` (`MaDeThi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_nddt2` FOREIGN KEY (`MaCauHoi`) REFERENCES `cauhoi` (`MaCauHoi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndungdethi`
--

LOCK TABLES `ndungdethi` WRITE;
/*!40000 ALTER TABLE `ndungdethi` DISABLE KEYS */;
INSERT INTO `ndungdethi` VALUES ('2222','17'),('1414','MATH1');
/*!40000 ALTER TABLE `ndungdethi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ngon`
--

DROP TABLE IF EXISTS `ngon`;
/*!50001 DROP VIEW IF EXISTS `ngon`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ngon` AS SELECT 
 1 AS `MSND`,
 1 AS `MaQuyen`,
 1 AS `HoTen`,
 1 AS `MaKhoa`,
 1 AS `MaLop`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoidung` (
  `MSND` char(8) collate utf8_unicode_ci NOT NULL,
  `MaKhoa` char(3) collate utf8_unicode_ci default NULL,
  `MaLop` char(7) collate utf8_unicode_ci default NULL,
  `HoTen` varchar(50) collate utf8_unicode_ci NOT NULL,
  `NgaySinh` date default NULL,
  `GioiTinh` enum('Nam','Nữ','Khác') collate utf8_unicode_ci default NULL,
  `QueQuan` varchar(50) collate utf8_unicode_ci default NULL,
  `Sdt` varchar(11) collate utf8_unicode_ci default NULL,
  `Email` varchar(100) collate utf8_unicode_ci default NULL,
  `MatKhau` varchar(50) collate utf8_unicode_ci default NULL,
  `Avatar` mediumblob,
  PRIMARY KEY  (`MSND`),
  KEY `FK_nguoidung_idx` (`MaKhoa`),
  CONSTRAINT `FK_nguoidung` FOREIGN KEY (`MaKhoa`) REFERENCES `khoa` (`MaKhoa`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES ('1102','110',NULL,'Ronight Ryo','1997-11-03','Nam','TPHCM','01659409220','ryo@gmail.com','123',NULL),('14109421','109',NULL,'Đoàn Văn Giàu',NULL,NULL,NULL,NULL,NULL,'999','no-images.jpg'),('14116115','116',NULL,'Bùi Ngọc Hiếu',NULL,NULL,NULL,NULL,NULL,'113','no-images.jpg'),('15104953','104',NULL,'Huỳnh Ngọc Ngạn',NULL,NULL,NULL,NULL,NULL,'159357','no-images.jpg'),('15110166','110',NULL,'Huỳnh Minh Chiến',NULL,NULL,NULL,NULL,NULL,'123',NULL),('15110168','110',NULL,'Nguyễn Tô Doanh Chuẩn',NULL,'Nam','bthrt',NULL,'bhw','123',NULL),('15110227','110',NULL,'Hoàng Kha',NULL,'Nam','vehe',NULL,'vfd','123',NULL),('15110268','110',NULL,'Lê Thị Thảo Nhi',NULL,NULL,NULL,NULL,NULL,'123','no-images.jpg'),('15110350','110',NULL,'Phạm Thị Quà',NULL,NULL,NULL,NULL,NULL,'123456','no-images.jpg'),('15144652','144',NULL,'Bùi Nguyễn Hiền',NULL,NULL,NULL,NULL,NULL,'12345','no-images.jpg'),('15152152','152',NULL,'Võ Tòng',NULL,NULL,NULL,NULL,NULL,'152','no-images.jpg'),('17',NULL,NULL,'Riot',NULL,NULL,NULL,NULL,NULL,'1234',NULL),('20',NULL,NULL,'Jason',NULL,NULL,NULL,NULL,NULL,'1234',NULL),('258','No',NULL,'Ahehe',NULL,NULL,NULL,NULL,NULL,'123','no-images.jpg');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phuongan`
--

DROP TABLE IF EXISTS `phuongan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phuongan` (
  `MaCauHoi` varchar(10) collate utf8_unicode_ci NOT NULL,
  `Pa` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Pb` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Pc` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Pd` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Va` enum('true') collate utf8_unicode_ci default NULL,
  `Vb` enum('true') collate utf8_unicode_ci default NULL,
  `Vc` enum('true') collate utf8_unicode_ci default NULL,
  `Vd` enum('true') collate utf8_unicode_ci default NULL,
  `HinhAnh1` mediumblob,
  `HinhAnh2` mediumblob,
  `HinhAnh3` mediumblob,
  `HinhAnh4` mediumblob,
  PRIMARY KEY  (`MaCauHoi`),
  CONSTRAINT `FK_phuongan` FOREIGN KEY (`MaCauHoi`) REFERENCES `cauhoi` (`MaCauHoi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phuongan`
--

LOCK TABLES `phuongan` WRITE;
/*!40000 ALTER TABLE `phuongan` DISABLE KEYS */;
INSERT INTO `phuongan` VALUES ('15','ffff','b','c','d','true',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('CHEM2','adas','dth','sefs','asgg',NULL,NULL,'true',NULL,NULL,NULL,NULL,NULL),('CHEM3','dbdfbgb','dfvdfd','vdfvdfv','asd',NULL,'true',NULL,NULL,NULL,NULL,NULL,NULL),('dsvfdv','dfdd','dfvdfvd','dfvfdv','dfvdfv',NULL,'true',NULL,NULL,NULL,NULL,NULL,NULL),('fdngxn','ở đây','ở kia','ợ','ngã','true',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Math3','Có 2 góc 90 độ','Có 4 cạnh bằng nhau','Có diện tích được tính bằng S = axb','Tất cả đều đúng',NULL,'true',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `phuongan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `MaQuyen` int(10) unsigned NOT NULL,
  `TenQuyen` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`MaQuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Quản trị câu hỏi'),(3,'Quản trị đề thi'),(4,'Sinh viên');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `MSND` char(8) collate utf8_unicode_ci NOT NULL,
  `MaQuyen` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`MSND`,`MaQuyen`),
  KEY `FK_userrole2_idx` (`MaQuyen`),
  CONSTRAINT `FK_userrole1` FOREIGN KEY (`MSND`) REFERENCES `nguoidung` (`MSND`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userrole2` FOREIGN KEY (`MaQuyen`) REFERENCES `roles` (`MaQuyen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES ('1102',1),('15110168',1),('15110350',1),('258',1),('15104953',2),('15110268',2),('17',2),('20',2),('15110166',3),('15144652',3),('14109421',4),('14116115',4),('15110227',4),('15152152',4);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vinfoperson`
--

DROP TABLE IF EXISTS `vinfoperson`;
/*!50001 DROP VIEW IF EXISTS `vinfoperson`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vinfoperson` AS SELECT 
 1 AS `MSND`,
 1 AS `MaKhoa`,
 1 AS `MaLop`,
 1 AS `HoTen`,
 1 AS `NgaySinh`,
 1 AS `GioiTinh`,
 1 AS `QueQuan`,
 1 AS `Sdt`,
 1 AS `Email`,
 1 AS `MatKhau`,
 1 AS `Avatar`,
 1 AS `TenKhoa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vinfouser`
--

DROP TABLE IF EXISTS `vinfouser`;
/*!50001 DROP VIEW IF EXISTS `vinfouser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vinfouser` AS SELECT 
 1 AS `MSND`,
 1 AS `MaQuyen`,
 1 AS `HoTen`,
 1 AS `MaKhoa`,
 1 AS `MaLop`,
 1 AS `MatKhau`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vques`
--

DROP TABLE IF EXISTS `vques`;
/*!50001 DROP VIEW IF EXISTS `vques`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vques` AS SELECT 
 1 AS `MaCauHoi`,
 1 AS `MonHoc`,
 1 AS `ChuDe`,
 1 AS `MucDo`,
 1 AS `NdungCauhoi`,
 1 AS `NgayTaoCauHoi`,
 1 AS `Pa`,
 1 AS `Pb`,
 1 AS `Pc`,
 1 AS `Pd`,
 1 AS `Va`,
 1 AS `Vb`,
 1 AS `Vc`,
 1 AS `Vd`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ngon`
--

/*!50001 DROP VIEW IF EXISTS `ngon`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ngon` AS select `nguoidung`.`MSND` AS `MSND`,`userrole`.`MaQuyen` AS `MaQuyen`,`nguoidung`.`HoTen` AS `HoTen`,`nguoidung`.`MaKhoa` AS `MaKhoa`,`nguoidung`.`MaLop` AS `MaLop`,`nguoidung`.`Email` AS `Email` from (`nguoidung` join `userrole` on((`nguoidung`.`MSND` = `userrole`.`MSND`))) */;

--
-- Final view structure for view `vinfoperson`
--

/*!50001 DROP VIEW IF EXISTS `vinfoperson`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vinfoperson` AS select `nguoidung`.`MSND` AS `MSND`,`nguoidung`.`MaKhoa` AS `MaKhoa`,`nguoidung`.`MaLop` AS `MaLop`,`nguoidung`.`HoTen` AS `HoTen`,`nguoidung`.`NgaySinh` AS `NgaySinh`,`nguoidung`.`GioiTinh` AS `GioiTinh`,`nguoidung`.`QueQuan` AS `QueQuan`,`nguoidung`.`Sdt` AS `Sdt`,`nguoidung`.`Email` AS `Email`,`nguoidung`.`MatKhau` AS `MatKhau`,`nguoidung`.`Avatar` AS `Avatar`,`khoa`.`TenKhoa` AS `TenKhoa` from (`nguoidung` join `khoa` on((`nguoidung`.`MaKhoa` = `khoa`.`MaKhoa`))) */;

--
-- Final view structure for view `vinfouser`
--

/*!50001 DROP VIEW IF EXISTS `vinfouser`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vinfouser` AS select `nguoidung`.`MSND` AS `MSND`,`userrole`.`MaQuyen` AS `MaQuyen`,`nguoidung`.`HoTen` AS `HoTen`,`nguoidung`.`MaKhoa` AS `MaKhoa`,`nguoidung`.`MaLop` AS `MaLop`,`nguoidung`.`MatKhau` AS `MatKhau` from (`nguoidung` join `userrole` on((`nguoidung`.`MSND` = `userrole`.`MSND`))) */;

--
-- Final view structure for view `vques`
--

/*!50001 DROP VIEW IF EXISTS `vques`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vques` AS select `cauhoi`.`MaCauHoi` AS `MaCauHoi`,`cauhoi`.`MonHoc` AS `MonHoc`,`cauhoi`.`ChuDe` AS `ChuDe`,`cauhoi`.`MucDo` AS `MucDo`,`cauhoi`.`NdungCauhoi` AS `NdungCauhoi`,`cauhoi`.`NgayTaoCauHoi` AS `NgayTaoCauHoi`,`phuongan`.`Pa` AS `Pa`,`phuongan`.`Pb` AS `Pb`,`phuongan`.`Pc` AS `Pc`,`phuongan`.`Pd` AS `Pd`,`phuongan`.`Va` AS `Va`,`phuongan`.`Vb` AS `Vb`,`phuongan`.`Vc` AS `Vc`,`phuongan`.`Vd` AS `Vd` from (`cauhoi` join `phuongan` on((`cauhoi`.`MaCauHoi` = `phuongan`.`MaCauHoi`))) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-31 21:18:17
