-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: severance
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `dseq` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `doctorsection` int DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `savefilename` varchar(255) DEFAULT NULL,
  `daylimit` varchar(7) DEFAULT NULL,
  `bachd` varchar(100) DEFAULT NULL,
  `mastd` varchar(100) DEFAULT NULL,
  `doctd` varchar(100) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `univlogo` varchar(255) DEFAULT NULL,
  `univlogofilename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dseq`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'박지성',1,'정형외과는 근골격계의 질환과 손상을 치료하고 예방하는 의학 분야입니다. 근골격계에는 뼈, 관절, 인대, 힘줄, 근육 등이 포함됩니다. 이 분야의 의료진은 골절, 관절염, 척추 문제, 스포츠 부상, 선천적 기형 등의 치료를 전문으로 합니다. 주요 치료 방법으로는 수술(관절 치환술, 척추 수술 등), 물리치료, 재활치료가 포함됩니다.','1_profile.jpg','1_profile.jpg','1000001','가톨릭대학교 의과대학 학사 (2008)','가톨릭대학교 의학과 석사 (2011)','가톨릭대학교 의학과 박사 (2016)','2022~현재: 신촌 세브란스병원 정형외과 조교수','catholic.png','catholic.png'),(2,'최민아',2,'이비인후과는 귀(Ear), 코(Nose), 목(Throat)의 질환을 진단하고 치료하는 분야입니다. 이 분야에서는 난청, 이명, 코 막힘, 축농증, 편도선염, 성대 질환, 후두암 등의 다양한 상태를 다룹니다. 또한 균형 장애, 수면 무호흡증, 알레르기 치료 등도 포함됩니다. 이비인후과 의사는 미세수술 및 내시경을 활용한 고난도의 수술을 전문으로 합니다. ','4_profile.jpg','4_profile.jpg','1000001','서울대학교 의과대학 학사 (2011)','서울대학교 의학과 석사 (2014)','서울대학교 의학과 박사 (2019)','2023~현재: 신촌 세브란스병원 조교수','seoul.png','seoul.png'),(3,'이서준',3,'외과는 다양한 신체 부위의 외과적 치료를 다루는 의학 분야로, 내과적 치료로 해결되지 않는 질환을 수술적으로 치료합니다. 주요 영역에는 일반 외과(복부 수술, 장기 제거), 암 수술, 혈관 수술, 소화기 수술 등이 포함됩니다. 외과 의사는 세부적으로 간, 담도, 췌장, 위장관 등 특정 기관을 전문으로 다루는 경우가 많습니다. ','7_profile.jpg','7_profile.jpg','1000001','연세대학교 의과대학 학사 (2010)','연세대학교 의학과 석사 (2013)','연세대학교 의학과 박사 (2017)','2023~현재: 신촌 세브란스병원 외과 조교수','yonsei.png','yonsei.png'),(4,'장태영',4,'산부인과는 여성의 생식기 건강과 출산, 임신을 다루는 분야입니다. 산과(Obstetrics)는 임신, 출산, 산후 관리를 전문으로 하며, 부인과(Gynecology)는 자궁, 난소, 질 등 여성 생식기의 질환(자궁근종, 난소암, 자궁내막증)을 진단하고 치료합니다. 이 외에도 불임 치료, 호르몬 관리, 생리 관련 문제를 다룹니다. ','10_profile.jpg','10_profile.jpg','1000001','경희대학교 의과대학 학사 (2009)','경희대학교 의학과 석사 (2012)','경희대학교 의학과 박사 (2017)','2023~현재: 신촌 세브란스병원 산부인과 교수','kyunghee.png','kyunghee.png'),(5,'정민재',5,'비뇨기과는 남성과 여성의 비뇨기계(신장, 요관, 방광, 요도) 및 남성 생식기의 질환을 다루는 의학 분야입니다. 주요 질환에는 전립선 비대증, 방광염, 신장 결석, 요로감염, 불임, 성기능 장애 등이 있습니다. 비뇨기과 의사는 복강경 수술, 로봇 수술 등 최신 기술을 활용하여 수술을 진행하며, 남성 건강 및 성 기능 관련 치료도 전문적으로 수행합니다. ','11_profile.jpg','11_profile.jpg','1000001','고려대학교 의과대학 학사 (2007)','고려대학교 의학과 석사 (2010)','고려대학교 의학과 박사 (2015)','2022~현재: 신촌 세브란스병원 임상조교수','consideration.png','consideration.png'),(6,'김다은',1,'정형외과는 근골격계의 질환과 손상을 치료하고 예방하는 의학 분야입니다. 근골격계에는 뼈, 관절, 인대, 힘줄, 근육 등이 포함됩니다. 이 분야의 의료진은 골절, 관절염, 척추 문제, 스포츠 부상, 선천적 기형 등의 치료를 전문으로 합니다. 주요 치료 방법으로는 수술(관절 치환술, 척추 수술 등), 물리치료, 재활치료가 포함됩니다.','2_profile.jpg','2_profile.jpg','1000001','연세대학교 의과대학 학사 (2008)','연세대학교 의학과 석사 (2011)','연세대학교 의학과 박사 (2015)','2019~현재: 신촌 세브란스병원 교수','yonsei.png','yonsei.png'),(7,'김현우',2,'이비인후과는 귀(Ear), 코(Nose), 목(Throat)의 질환을 진단하고 치료하는 분야입니다. 이 분야에서는 난청, 이명, 코 막힘, 축농증, 편도선염, 성대 질환, 후두암 등의 다양한 상태를 다룹니다. 또한 균형 장애, 수면 무호흡증, 알레르기 치료 등도 포함됩니다. 이비인후과 의사는 미세수술 및 내시경을 활용한 고난도의 수술을 전문으로 합니다. ','5_profile.jpg','5_profile.jpg','1000001','서울대학교 의과대학 학사 (2005)','서울대학교 의학과 석사 (2008)','서울대학교 의학과 박사 (2012)','2022~현재: 신촌 세브란스병원 교수','seoul.png','seoul.png'),(8,'강유진',3,'외과는 다양한 신체 부위의 외과적 치료를 다루는 의학 분야로, 내과적 치료로 해결되지 않는 질환을 수술적으로 치료합니다. 주요 영역에는 일반 외과(복부 수술, 장기 제거), 암 수술, 혈관 수술, 소화기 수술 등이 포함됩니다. 외과 의사는 세부적으로 간, 담도, 췌장, 위장관 등 특정 기관을 전문으로 다루는 경우가 많습니다. ','14_profile.jpg','14_profile.jpg','1000001','서울대학교 의과대학 학사 (2006)','서울대학교 의학과 석사 (2009)','서울대학교 의학과 박사 (2013)','2017~현재: 신촌 세브란스병원 교수','seoul.png','seoul.png'),(9,'홍지훈',4,'산부인과는 여성의 생식기 건강과 출산, 임신을 다루는 분야입니다. 산과(Obstetrics)는 임신, 출산, 산후 관리를 전문으로 하며, 부인과(Gynecology)는 자궁, 난소, 질 등 여성 생식기의 질환(자궁근종, 난소암, 자궁내막증)을 진단하고 치료합니다. 이 외에도 불임 치료, 호르몬 관리, 생리 관련 문제를 다룹니다. ','12_profile.jpg','12_profile.jpg','1000001','전남대학교 의과대학 학사 (2007)','전남대학교 의학과 석사 (2010)','전남대학교 의학과 박사 (2015)','2019~현재: 신촌 세브란스병원 교수','jeonnam.png','jeonnam.png'),(10,'최은석',5,'비뇨기과는 남성과 여성의 비뇨기계(신장, 요관, 방광, 요도) 및 남성 생식기의 질환을 다루는 의학 분야입니다. 주요 질환에는 전립선 비대증, 방광염, 신장 결석, 요로감염, 불임, 성기능 장애 등이 있습니다. 비뇨기과 의사는 복강경 수술, 로봇 수술 등 최신 기술을 활용하여 수술을 진행하며, 남성 건강 및 성 기능 관련 치료도 전문적으로 수행합니다. ','8_profile.jpg','8_profile.jpg','1000001','부산대학교 의과대학 학사 (2011)','부산대학교 의학과 석사 (2014)','부산대학교 의학과 박사 (2019)','2023~현재: 신촌 세브란스병원 조교수','busan.png','busan.png'),(11,'임수현',1,'정형외과는 근골격계의 질환과 손상을 치료하고 예방하는 의학 분야입니다. 근골격계에는 뼈, 관절, 인대, 힘줄, 근육 등이 포함됩니다. 이 분야의 의료진은 골절, 관절염, 척추 문제, 스포츠 부상, 선천적 기형 등의 치료를 전문으로 합니다. 주요 치료 방법으로는 수술(관절 치환술, 척추 수술 등), 물리치료, 재활치료가 포함됩니다. ','9_profile.jpg','9_profile.jpg','1000001','인하대학교 의과대학 학사 (2009)','인하대학교 의학과 석사 (2012)','인하대학교 의학과 박사 (2017)','2019~현재: 신촌 세브란스병원 교수','inha.png','inha.png'),(12,'조민지',2,'이비인후과는 귀(Ear), 코(Nose), 목(Throat)의 질환을 진단하고 치료하는 분야입니다. 이 분야에서는 난청, 이명, 코 막힘, 축농증, 편도선염, 성대 질환, 후두암 등의 다양한 상태를 다룹니다. 또한 균형 장애, 수면 무호흡증, 알레르기 치료 등도 포함됩니다. 이비인후과 의사는 미세수술 및 내시경을 활용한 고난도의 수술을 전문으로 합니다. ','15_profile.jpg','15_profile.jpg','1000001','울산대학교 의과대학 학사 (2012)','울산대학교 의학과 석사 (2015)','울산대학교 의학과 박사 (2020)','2023~현재: 신촌 세브란스병원 조교수','ulsan.png','ulsan.png'),(13,'장유진',3,'외과는 다양한 신체 부위의 외과적 치료를 다루는 의학 분야로, 내과적 치료로 해결되지 않는 질환을 수술적으로 치료합니다. 주요 영역에는 일반 외과(복부 수술, 장기 제거), 암 수술, 혈관 수술, 소화기 수술 등이 포함됩니다. 외과 의사는 세부적으로 간, 담도, 췌장, 위장관 등 특정 기관을 전문으로 다루는 경우가 많습니다. ','6_profile.jpg','6_profile.jpg','1000001','경희대학교 의과대학 학사 (2010)','경희대학교 의학과 석사 (2013)','경희대학교 의학과 박사 (2018)','2022~현재: 신촌 세브란스병원 교수','kyunghee.png','kyunghee.png'),(14,'이준혁',3,'외과는 다양한 신체 부위의 외과적 치료를 다루는 의학 분야로, 내과적 치료로 해결되지 않는 질환을 수술적으로 치료합니다. 주요 영역에는 일반 외과(복부 수술, 장기 제거), 암 수술, 혈관 수술, 소화기 수술 등이 포함됩니다. 외과 의사는 세부적으로 간, 담도, 췌장, 위장관 등 특정 기관을 전문으로 다루는 경우가 많습니다. ','3_profile.jpg','3_profile.jpg','1000001','고려대학교 의과대학 학사 (2010)','고려대학교 의학과 석사 (2013)','고려대학교 의학과 박사 (2018)','2022~현재: 신촌 세브란스병원 교수','consideration.png','consideration.png'),(15,'박수현',4,'산부인과는 여성의 생식기 건강과 출산, 임신을 다루는 분야입니다. 산과(Obstetrics)는 임신, 출산, 산후 관리를 전문으로 하며, 부인과(Gynecology)는 자궁, 난소, 질 등 여성 생식기의 질환(자궁근종, 난소암, 자궁내막증)을 진단하고 치료합니다. 이 외에도 불임 치료, 호르몬 관리, 생리 관련 문제를 다룹니다. ','13_profile.jpg','13_profile.jpg','1000001','부산대학교 의과대학 학사 (2009)','부산대학교 의학과 석사 (2012)','부산대학교 의학과 박사 (2017)','2022~현재: 신촌 세브란스병원 교수','busan.png','busan.png');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_time`
--

DROP TABLE IF EXISTS `doctor_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_time` (
  `tseq` int NOT NULL AUTO_INCREMENT,
  `dseq` int NOT NULL,
  `bookabledate` date DEFAULT NULL,
  `time` int DEFAULT NULL,
  `bookable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tseq`),
  KEY `dseq` (`dseq`),
  CONSTRAINT `doctor_time_ibfk_1` FOREIGN KEY (`dseq`) REFERENCES `doctor` (`dseq`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `doctor_time_ibfk_2` FOREIGN KEY (`dseq`) REFERENCES `doctor` (`dseq`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `doctor_time_ibfk_3` FOREIGN KEY (`dseq`) REFERENCES `doctor` (`dseq`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_time`
--

LOCK TABLES `doctor_time` WRITE;
/*!40000 ALTER TABLE `doctor_time` DISABLE KEYS */;
INSERT INTO `doctor_time` VALUES (245,1,'2024-11-01',1,1),(246,1,'2024-11-02',1,1),(247,1,'2024-11-03',1,1),(248,1,'2024-11-04',1,1),(249,1,'2024-11-05',1,1),(250,1,'2024-11-06',1,1),(251,1,'2024-11-07',1,1),(252,1,'2024-11-08',1,1),(253,1,'2024-11-09',1,1),(254,1,'2024-11-10',1,1),(255,1,'2024-11-11',1,1),(256,1,'2024-11-12',1,1),(257,1,'2024-11-13',1,1),(258,1,'2024-11-14',1,1),(259,1,'2024-11-15',1,1),(260,1,'2024-11-16',1,1),(261,1,'2024-11-17',1,1),(262,1,'2024-11-18',1,1),(263,1,'2024-11-19',1,1),(264,1,'2024-11-20',1,1),(265,1,'2024-11-21',1,1),(266,1,'2024-11-22',1,1),(267,1,'2024-11-23',1,1),(268,1,'2024-11-24',1,1),(269,1,'2024-11-25',1,1),(270,1,'2024-11-26',1,1),(271,1,'2024-11-27',1,1),(272,1,'2024-11-28',1,1),(273,1,'2024-11-29',1,1),(274,1,'2024-11-30',1,1),(275,1,'2024-12-01',1,1),(276,1,'2024-12-02',1,1),(277,1,'2024-12-03',1,1),(278,1,'2024-12-04',1,1),(279,1,'2024-12-05',1,1),(280,1,'2024-12-06',1,1),(281,1,'2024-12-07',1,1),(282,1,'2024-12-08',1,1),(283,1,'2024-12-09',1,1),(284,1,'2024-12-10',1,1),(285,1,'2024-12-11',1,1),(286,1,'2024-12-12',1,1),(287,1,'2024-12-13',1,1),(288,1,'2024-12-14',1,1),(289,1,'2024-12-15',1,1),(290,1,'2024-12-16',1,1),(291,1,'2024-12-17',1,1),(292,1,'2024-12-18',1,1),(293,1,'2024-12-19',1,1),(294,1,'2024-12-20',1,1),(295,1,'2024-12-21',1,1),(296,1,'2024-12-22',1,1),(297,1,'2024-12-23',1,1),(298,1,'2024-12-24',1,1),(299,1,'2024-12-25',1,1),(300,1,'2024-12-26',1,1),(301,1,'2024-12-27',1,1),(302,1,'2024-12-28',1,1),(303,1,'2024-12-29',1,1),(304,1,'2024-12-30',1,1),(305,1,'2024-12-31',1,1);
/*!40000 ALTER TABLE `doctor_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `zip_num` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mseq`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'a','a','홍길동','honggildong@email.com','11111','서울시 강남구 역삼동','010-1111-1111','2024-11-30 16:17:07'),(2,'two','1111','김철수','kimchulsoo@email.com','11111','서울시 강동구 천호동','010-1111-1111','2024-11-30 16:17:07'),(3,'three','1111','이영희','leeyounghee@email.com','11111','서울시 송파구 방이동','010-1111-1111','2024-11-30 16:17:07'),(4,'four','1111','박지훈','parkjihoon@email.com','11111','서울시 강서구 등촌동','010-1111-1111','2024-11-30 16:17:07'),(5,'five','1111','최민수','choeminsu@email.com','11111','서울시 마포구 상암동','010-1111-1111','2024-11-30 16:17:07'),(6,'six','1111','정다은','jeongdaeun@email.com','11111','서울시 용산구 한남동','010-1111-1111','2024-11-30 16:17:07'),(7,'seven','1111','김수진','kimsujin@email.com','11111','서울시 서대문구 연희동','010-1111-1111','2024-11-30 16:17:07'),(8,'eight','1111','이상민','leeseangmin@email.com','11111','서울시 강북구 미아동','010-1111-1111','2024-11-30 16:17:07'),(9,'nine','1111','조아라','joara@email.com','11111','서울시 중랑구 묵동','010-1111-1111','2024-11-30 16:17:07'),(10,'ten','1111','배준호','baejunho@email.com','11111','서울시 동대문구 휘경동','010-1111-1111','2024-11-30 16:17:07');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `memberreservationhistory`
--

DROP TABLE IF EXISTS `memberreservationhistory`;
/*!50001 DROP VIEW IF EXISTS `memberreservationhistory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memberreservationhistory` AS SELECT 
 1 AS `mseq`,
 1 AS `userid`,
 1 AS `membername`,
 1 AS `phone`,
 1 AS `rseq`,
 1 AS `dseq`,
 1 AS `doctorname`,
 1 AS `doctorsection`,
 1 AS `bookdate`,
 1 AS `time`,
 1 AS `indate`,
 1 AS `result`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna` (
  `qseq` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `reply` varchar(5000) DEFAULT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qseq`),
  KEY `qna_ibfk_2_idx` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-02 14:51:09'),(2,'two','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-02 14:51:41'),(3,'three','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-02 14:51:46'),(4,'four','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-02 14:51:50'),(5,'five','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-02 14:54:58'),(6,'six','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-03 11:35:06'),(7,'seven','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-03 11:35:09'),(8,'eight','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-03 11:35:12'),(9,'nine','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-03 11:35:15'),(10,'ten','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-03 11:35:18'),(11,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-03 11:35:29'),(12,'two','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-03 11:35:31'),(13,'three','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-03 11:35:31'),(14,'four','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-03 11:35:32'),(15,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-03 11:35:33'),(16,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-03 11:36:38'),(17,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-03 11:36:40'),(18,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-03 11:36:42'),(19,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-03 11:36:46'),(20,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-03 11:36:48'),(21,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-03 11:36:51'),(22,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-03 11:36:54'),(23,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-03 11:37:35'),(24,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-03 11:37:37'),(25,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-03 11:37:40'),(26,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-03 11:37:43'),(27,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-03 11:37:47'),(31,'one','몇시까지 진료 가능한가요','몇시까지 접수해야 진료 가능한가요?',NULL,'2024-12-03 13:10:24'),(32,'one','주말에도 진료 가능한가요','진료 시간 및 주말 진료 여부 문의드립니다.',NULL,'2024-12-03 13:12:09'),(33,'one','주말에도 진료 가능한가요','주말에도 진료 가능한가요주말에도 진료 가능한가요',NULL,'2024-12-03 15:10:25'),(34,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-04 09:42:09'),(35,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-04 09:42:13'),(36,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-04 09:42:15'),(37,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-04 09:42:19'),(38,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-04 09:42:22'),(39,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-04 09:42:25'),(40,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-04 09:42:28'),(41,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-04 09:42:31'),(42,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-04 09:42:34'),(43,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-04 09:42:38'),(44,'one','주말 진료 가능한가요','주말에도 진료 가능한가요? 평일은 진료 가능 시간이 언제까지인가요',NULL,'2024-12-04 09:43:36'),(45,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-04 09:43:39'),(46,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-04 09:43:41'),(47,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-04 09:43:44'),(48,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-04 09:43:46'),(49,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-04 09:43:49'),(50,'one','주말 진료 가능한가요','주말에도 진료 가능한가요? 평일은 진료 가능 시간이 언제까지인가요',NULL,'2024-12-04 09:43:52'),(51,'one','진단서 발급 관련','진단서 발급에 대해 자세하게 안내 부탁드립니다.',NULL,'2024-12-04 09:46:52'),(52,'one','의무기록 사본 발급은 어떻게 하나요?','필요한 서류나 비용이 어떻게 되는지 문의드립니다.',NULL,'2024-12-04 09:46:55'),(53,'one','진단서에도 유효기간이 있나요?','유효기간이 있는지 궁금합니다.',NULL,'2024-12-04 09:46:58'),(54,'one','온라인 예약 외에 다른 예약 방법','진료 예약이 온라인으로만 가능한지 이외 다른 예약 방법은 없는지 문의드립니다.',NULL,'2024-12-04 09:47:00'),(55,'one','셔틀버스 운행 관련 문의드립니다.','대중교통 이용 예정인데 혹시 병원 셔틀버스가 있나요?',NULL,'2024-12-04 09:47:03'),(56,'one','주말 진료 가능한가요','주말에도 진료 가능한가요? 평일은 진료 가능 시간이 언제까지인가요',NULL,'2024-12-04 09:47:06'),(57,'one','하이미디어 병원 가는 방법','하이미디어 병원 가는 방법 질문합니다.\r\n하이미디어 병원 가는 방법 질문합니다.\r\n하이미디어 병원 가는 방법 질문합니다.',NULL,'2024-12-04 10:54:32'),(59,'one','진료비 수납 관련 문의','QnA test',NULL,'2024-12-04 12:04:03'),(60,'one','진료비 수납 관련 문의','진료비 수납문의',NULL,'2024-12-04 12:41:04'),(62,'asd','asd','asd','asd','2024-12-12 10:04:13');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve` (
  `rseq` int NOT NULL AUTO_INCREMENT,
  `dseq` int NOT NULL,
  `mseq` int NOT NULL,
  `indate` datetime DEFAULT CURRENT_TIMESTAMP,
  `result` int DEFAULT '1',
  `bookdate` date DEFAULT NULL,
  `time` int DEFAULT NULL,
  `bookable` int DEFAULT '0',
  PRIMARY KEY (`rseq`),
  KEY `dseq` (`dseq`),
  KEY `mseq` (`mseq`),
  CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`dseq`) REFERENCES `doctor` (`dseq`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reserve_ibfk_5` FOREIGN KEY (`mseq`) REFERENCES `member` (`mseq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
INSERT INTO `reserve` VALUES (1,1,1,'2024-11-30 16:37:20',1,'2024-11-15',1,1),(2,1,1,'2024-11-30 16:37:55',1,'2024-12-30',1,1),(3,1,1,'2024-11-30 16:39:49',1,'2024-12-30',0,2),(4,1,2,'2024-11-30 16:39:49',1,'2024-12-16',1,1),(5,1,3,'2024-11-30 16:39:49',1,'2025-01-15',1,1),(6,1,4,'2024-11-30 16:39:49',1,'2025-01-01',1,1),(7,1,5,'2024-11-30 16:39:49',1,'2025-01-30',1,1),(38,1,1,'2024-12-04 11:47:20',1,'2024-12-05',0,0),(49,1,1,'2024-12-04 13:27:39',1,'2024-12-06',0,0),(50,6,1,'2024-12-10 10:39:19',1,'2024-12-20',0,0),(51,11,1,'2024-12-10 10:44:15',1,'2024-12-25',1,0),(52,2,1,'2024-12-10 10:45:23',1,'2024-12-18',0,0),(53,13,1,'2024-12-10 10:45:34',1,'2024-12-11',0,0),(54,15,1,'2024-12-10 10:45:45',1,'2024-12-16',0,0),(55,5,1,'2024-12-10 10:46:01',1,'2024-12-23',0,0),(56,8,1,'2024-12-10 10:46:18',1,'2024-12-23',0,0),(57,1,1,'2024-12-10 14:08:42',1,'2024-12-13',0,0),(58,1,1,'2024-12-11 16:16:04',1,'2024-12-19',0,0),(59,1,1,'2024-12-11 17:42:09',1,'2024-12-12',1,0),(60,1,1,'2024-12-11 17:42:27',1,'2024-12-12',0,0),(61,1,1,'2024-12-11 17:50:09',1,'2024-12-27',1,0),(62,1,1,'2024-12-11 17:50:15',1,'2024-12-27',0,0),(63,1,1,'2024-12-11 17:53:40',1,'2024-12-17',1,0),(64,1,1,'2024-12-11 17:59:32',1,'2024-12-17',1,0),(65,1,1,'2024-12-11 18:04:17',1,'2024-12-16',0,0),(66,1,1,'2024-12-11 18:05:13',1,'2024-12-18',0,0),(67,1,1,'2024-12-11 18:07:21',1,'2024-12-18',1,0),(68,1,1,'2024-12-11 18:08:21',1,'2024-12-19',1,0),(69,9,1,'2024-12-11 18:09:13',1,'2024-12-25',0,0),(70,9,1,'2024-12-11 18:09:25',1,'2024-12-25',1,0),(71,1,1,'2024-12-11 18:17:06',1,'2024-12-13',1,0),(72,1,1,'2024-12-12 12:13:35',1,'2024-12-20',1,0),(73,1,1,'2024-12-12 14:29:58',1,'2024-12-25',1,0),(74,6,1,'2024-12-12 15:07:55',1,'2024-12-13',0,0),(75,6,1,'2024-12-12 15:20:09',1,'2024-12-13',0,0),(76,6,1,'2024-12-12 15:33:34',1,'2024-12-13',0,0),(77,6,1,'2024-12-12 15:38:04',1,'2024-12-13',0,0),(78,6,1,'2024-12-12 15:40:34',1,'2024-12-13',0,0),(79,6,1,'2024-12-12 15:41:08',1,'2024-12-13',0,0),(80,6,1,'2024-12-12 15:42:04',1,'2024-12-13',0,0),(81,6,1,'2024-12-12 15:42:24',1,'2024-12-13',0,0),(82,6,1,'2024-12-12 15:42:45',1,'2024-12-13',0,0),(83,6,1,'2024-12-12 15:43:00',1,'2024-12-13',0,0),(84,6,1,'2024-12-12 15:43:12',1,'2024-12-13',0,0),(85,6,1,'2024-12-12 15:43:52',1,'2024-12-13',0,0),(86,6,1,'2024-12-12 16:06:13',1,'2024-12-13',0,0),(87,6,1,'2024-12-12 16:06:54',1,'2024-12-13',0,0),(88,6,1,'2024-12-12 16:09:42',1,'2024-12-13',0,0),(89,6,1,'2024-12-12 16:10:02',1,'2024-12-13',0,0),(90,6,1,'2024-12-12 16:10:48',1,'2024-12-13',0,0),(91,6,1,'2024-12-12 16:17:41',1,'2024-12-13',0,0),(92,6,1,'2024-12-12 16:17:47',1,'2024-12-13',0,0),(93,6,1,'2024-12-12 16:18:48',1,'2024-12-13',0,0),(94,6,1,'2024-12-12 16:19:52',1,'2024-12-13',0,0),(95,6,1,'2024-12-12 16:20:57',1,'2024-12-13',0,0),(96,6,1,'2024-12-12 16:21:16',1,'2024-12-13',0,0),(97,6,1,'2024-12-12 16:23:41',1,'2024-12-13',0,0),(98,6,1,'2024-12-12 16:24:40',1,'2024-12-13',0,0),(99,6,1,'2024-12-12 16:24:51',1,'2024-12-13',0,0),(100,6,1,'2024-12-12 16:25:04',1,'2024-12-13',0,0),(101,6,1,'2024-12-12 16:25:15',1,'2024-12-13',0,0),(102,6,1,'2024-12-12 16:25:25',1,'2024-12-13',0,0),(103,6,1,'2024-12-12 16:25:43',1,'2024-12-13',0,0),(104,6,1,'2024-12-12 16:26:49',1,'2024-12-13',0,0),(105,6,1,'2024-12-12 16:27:03',1,'2024-12-13',0,0),(106,6,1,'2024-12-12 16:28:36',1,'2024-12-13',0,0),(107,6,1,'2024-12-12 16:29:05',1,'2024-12-13',0,0),(108,6,1,'2024-12-12 16:29:20',1,'2024-12-13',0,0),(109,6,1,'2024-12-12 16:29:34',1,'2024-12-13',0,0),(110,6,1,'2024-12-12 16:35:33',1,'2024-12-26',1,0),(111,1,1,'2024-12-13 15:53:41',1,'2024-12-24',1,0);
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `memberreservationhistory`
--

/*!50001 DROP VIEW IF EXISTS `memberreservationhistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `memberreservationhistory` AS select `m`.`mseq` AS `mseq`,`m`.`userid` AS `userid`,`m`.`name` AS `membername`,`m`.`phone` AS `phone`,`r`.`rseq` AS `rseq`,`d`.`dseq` AS `dseq`,`d`.`name` AS `doctorname`,`d`.`doctorsection` AS `doctorsection`,`r`.`bookdate` AS `bookdate`,`r`.`time` AS `time`,`r`.`indate` AS `indate`,`r`.`result` AS `result` from ((`member` `m` join `reserve` `r` on((`m`.`mseq` = `r`.`mseq`))) join `doctor` `d` on((`r`.`dseq` = `d`.`dseq`))) */;
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

-- Dump completed on 2025-02-04 16:17:16
