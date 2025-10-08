-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SmartUpDB
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Dicki, Stark and Waters Innovations','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(2,'O\'Hara-Grady Solutions','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(3,'Okuneva Inc Yazılım','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(4,'Dietrich, Bayer and Runte Services','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(5,'Bradtke-VonRueden Services','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(6,'Stracke-Brakus Corp','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(7,'Toy, Jerde and Kovacek Inc','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(8,'Cruickshank-Monahan Group','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(9,'Mayert, Satterfield and Keeling Systems','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(10,'Herman, Price and Bergstrom Services','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(11,'XYZ Yazılım','2025-10-08 07:54:25','2025-10-08 07:54:25',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0000_01_01_000000_create_companies_table',1),(2,'0001_01_01_000000_create_users_table',1),(3,'0001_01_01_000001_create_cache_table',1),(4,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `1` (`company_id`),
  KEY `users_email_index` (`email`),
  KEY `users_phone_index` (`phone`),
  CONSTRAINT `1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,11,'Mehmet','Demir','mehmet@example.com','05559876543','2025-10-08 07:26:54','2025-10-08 07:54:25',NULL),(2,1,'Sinem','Taşçı','noemie46@example.net','05555319740','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(3,1,'Ebru','Karaduman','hadley.herman@example.org','05557847402','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(4,1,'Onur','Karabulut','dibbert.heber@example.org','05554169935','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(5,1,'Esma','Koçoğlu','juliet04@example.net','05556880285','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(6,1,'Kağan','Gönültaş','mparker@example.com','05559659170','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(7,2,'Ümran','Kılıççı','lukas18@example.com','05558594545','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(8,2,'Aşkın','Erbulak','tadams@example.com','05556348165','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(9,2,'İrem','Biçer','obailey@example.org','05551260523','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(10,2,'Ege','Berberoğlu','chadd48@example.net','05554988255','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(11,3,'Ece','Çapanoğlu','peggie71@example.org','05554056238','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(12,3,'Bartu','Kaya','kspencer@example.com','05553094217','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(13,3,'Şahnur','Beşerler','hayes.ryleigh@example.com','05551108699','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(14,3,'Emirhan','Çetin','dernser@example.com','05552183337','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(15,3,'Efe','Berberoğlu','ezekiel15@example.com','05557041831','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(16,3,'Tuna','Saygıner','claudia.harris@example.net','05558201248','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(17,3,'Ada','Dizdar','paucek.jacquelyn@example.org','05553781357','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(18,4,'Güney','Erçetin','hoeger.alberta@example.net','05553134963','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(19,4,'Derin','Özberk','casey16@example.net','05556074138','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(20,4,'Burak','Saygıner','lehner.amina@example.net','05555725594','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(21,4,'Armağan','Atan','cecilia34@example.net','05555968219','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(22,4,'Burak','Özkara','tatyana.kozey@example.com','05555956448','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(23,5,'Emel','Atakol','watsica.alfreda@example.org','05550867063','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(24,5,'Ebru','Poyrazoğlu','verner64@example.net','05556998845','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(25,5,'Rüya','Çatalbaş','sigmund.jerde@example.net','05554144934','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(26,5,'Burcu','Tekand','myrtis.walter@example.net','05555333117','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(27,5,'Serhan','Demirbaş','wintheiser.nellie@example.com','05557844131','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(28,5,'Bora','Özbey','oshanahan@example.net','05556786322','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(29,6,'Şahnur','Topaloğlu','irwin.schoen@example.net','05554080722','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(30,6,'Bora','Adıvar','kianna.mills@example.com','05555844599','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(31,6,'Emel','Dalkıran','wilson.yundt@example.net','05551645601','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(32,6,'Yiğit','Körmükçü','rowe.amiya@example.com','05552049907','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(33,6,'Polat','Başoğlu','langosh.muriel@example.net','05559491576','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(34,7,'Dağhan','Koçoğlu','justice.morar@example.com','05558923137','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(35,7,'Çınar','Ertepınar','leann63@example.org','05555866428','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(36,7,'Ebru','Öztuna','rene50@example.net','05558839061','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(37,7,'Rüya','Akbulut','schmidt.solon@example.org','05551934161','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(38,7,'Ada','Akaydın','fisher.brady@example.org','05555462750','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(39,7,'Emel','Ayaydın','wunsch.rhoda@example.net','05553058176','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(40,8,'Ogün','Akşit','angelo12@example.net','05550599201','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(41,8,'Sinem','Tekand','marcellus36@example.com','05554537784','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(42,8,'Ogün','Yıldızoğlu','jerry.prohaska@example.org','05559444248','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(43,8,'Rüya','Pektemek','trantow.jayne@example.net','05558198544','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(44,9,'Emre','Atakol','iwindler@example.com','05551102376','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(45,9,'Kerem','Ayaydın','madelyn.rippin@example.net','05554883055','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(46,9,'Emirhan','Özbey','ylarkin@example.org','05553410746','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(47,9,'Canberk','Uca','scarter@example.com','05552246370','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(48,9,'Ebru','Erginsoy','domenica.barton@example.com','05556273057','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(49,9,'Ebru','Kutlay','estefania27@example.org','05554796858','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(50,9,'Berk','Tunaboylu','ybradtke@example.net','05559320442','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(51,10,'Bartu','Bakırcıoğlu','antwon.braun@example.com','05553889342','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(52,10,'Rüya','Doğan','adam.ward@example.org','05553214298','2025-10-08 07:26:54','2025-10-08 07:26:54',NULL),(53,10,'Kağan','Akyüz','emmet.heaney@example.com','05554912861','2025-10-08 07:26:54','2025-10-08 07:57:20','2025-10-08 07:57:20'),(54,10,'Mert','Kıraç','ratke.melvin@example.com','05559890003','2025-10-08 07:26:54','2025-10-08 07:57:06','2025-10-08 07:57:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-08 14:30:34
