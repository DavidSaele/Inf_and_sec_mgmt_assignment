-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `academic_staff`
--

DROP TABLE IF EXISTS `academic_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_staff` (
  `staff_ID` char(3) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `position` char(20) NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_staff`
--

LOCK TABLES `academic_staff` WRITE;
/*!40000 ALTER TABLE `academic_staff` DISABLE KEYS */;
INSERT INTO `academic_staff` VALUES ('a01','Seb','Binary','Professor','1986-09-12','M','0755527076'),('a02','Jazz','Wood','Asso. Professor','1976-10-10','M','0754427099'),('a03','Miguel','Franco','Lecturer','1990-05-12','M','0752270933');
/*!40000 ALTER TABLE `academic_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_staff`
--

DROP TABLE IF EXISTS `admin_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_staff` (
  `staff_ID` char(3) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `duty` char(20) NOT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_staff`
--

LOCK TABLES `admin_staff` WRITE;
/*!40000 ALTER TABLE `admin_staff` DISABLE KEYS */;
INSERT INTO `admin_staff` VALUES ('f01','Cristiano','Penaldo','Enrolment'),('f02','Lionel','Missy','Courses');
/*!40000 ALTER TABLE `admin_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_ID` char(6) NOT NULL,
  `course_name` char(40) NOT NULL,
  `convenor` char(20) NOT NULL,
  `staff_ID` char(3) NOT NULL,
  `trimester` char(5) NOT NULL,
  `campus` char(6) NOT NULL,
  PRIMARY KEY (`course_ID`),
  KEY `staff_ID` (`staff_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `academic_staff` (`staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('101CS','Data Analytics','Seb Binary','a01','1','GC'),('101ICT','Information Management','Seb Binary','a01','1,2','GC'),('101STA','Statistics','Jazz Wood','a02','2','GC, NA'),('102CS','Information Retrieval','Miguel Franco','a03','1,3','GC'),('102ICT','Object Oriented Programming','Jazz Wood','a02','2','NA');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolment`
--

DROP TABLE IF EXISTS `enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolment` (
  `enrolment_ID` char(3) NOT NULL,
  `course_ID` char(6) NOT NULL,
  `student_ID` char(3) NOT NULL,
  `student_name` char(40) NOT NULL,
  `year` year(4) NOT NULL,
  `trimester` decimal(1,0) NOT NULL,
  `campus` char(2) NOT NULL,
  PRIMARY KEY (`enrolment_ID`),
  KEY `student_ID` (`student_ID`),
  KEY `course_ID` (`course_ID`),
  CONSTRAINT `enrolment_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`),
  CONSTRAINT `enrolment_ibfk_2` FOREIGN KEY (`course_ID`) REFERENCES `course` (`course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolment`
--

LOCK TABLES `enrolment` WRITE;
/*!40000 ALTER TABLE `enrolment` DISABLE KEYS */;
INSERT INTO `enrolment` VALUES ('e01','101ICT','s01','Angela Merkal',2017,1,'GC'),('e02','101STA','s01','Angela Merkal',2017,1,'GC'),('e03','101CS','s01','Angela Merkal',2017,1,'GC'),('e04','102ICT','s02','Donaldo True',2018,2,'NA'),('e05','101CS','s02','Donaldo True',2017,1,'GC'),('e06','102CS','s03','Hillarious Blinton',2018,3,'GC'),('e07','102ICT','s04','Tarra Obana',2018,2,'NA'),('e08','101STA','s04','Tarra Obana',2017,1,'NA'),('e09','101CS','s04','Tarra Obana',2017,1,'GC'),('e10','102CS','s04','Tarra Obana',2018,1,'GC');
/*!40000 ALTER TABLE `enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `enrolment_ID` char(3) NOT NULL,
  `student_ID` char(3) NOT NULL,
  `score` decimal(3,0) NOT NULL,
  `grade_number` decimal(1,0) NOT NULL,
  PRIMARY KEY (`enrolment_ID`),
  KEY `student_ID` (`student_ID`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`enrolment_ID`) REFERENCES `enrolment` (`enrolment_ID`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`student_ID`) REFERENCES `enrolment` (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('e01','s01',75,6),('e02','s01',80,6),('e03','s01',92,7),('e04','s02',86,7),('e05','s02',71,5),('e06','s03',65,5),('e07','s04',55,4),('e08','s04',80,6),('e09','s04',80,6),('e10','s04',86,7);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_ID` char(3) NOT NULL,
  `first_name` char(20) NOT NULL,
  `last_name` char(20) NOT NULL,
  `dob` date NOT NULL,
  `sex` char(1) NOT NULL,
  `phone` decimal(6,0) NOT NULL,
  PRIMARY KEY (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('s01','Angela','Merkal','1991-01-01','F',543210),('s02','Donaldo','True','1992-02-02','M',123456),('s03','Hillarious','Blinton','1993-03-03','F',112233),('s04','Tarra','Obana','1994-04-04','M',221134);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-11  4:39:19
