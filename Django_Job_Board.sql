CREATE DATABASE  IF NOT EXISTS `django_job_board` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `django_job_board`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: django_job_board
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `location` varchar(63) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (25,'','+201155297177','Beni Suef','',26);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add job',7,'add_job'),(26,'Can change job',7,'change_job'),(27,'Can delete job',7,'delete_job'),(28,'Can view job',7,'view_job'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add apply',9,'add_apply'),(34,'Can change apply',9,'change_apply'),(35,'Can delete apply',9,'delete_apply'),(36,'Can view apply',9,'view_apply'),(37,'Can add profile',10,'add_profile'),(38,'Can change profile',10,'change_profile'),(39,'Can delete profile',10,'delete_profile'),(40,'Can view profile',10,'view_profile'),(41,'Can add info',11,'add_info'),(42,'Can change info',11,'change_info'),(43,'Can delete info',11,'delete_info'),(44,'Can view info',11,'view_info'),(45,'Can add Token',12,'add_token'),(46,'Can change Token',12,'change_token'),(47,'Can delete Token',12,'delete_token'),(48,'Can view Token',12,'view_token'),(49,'Can add token',13,'add_tokenproxy'),(50,'Can change token',13,'change_tokenproxy'),(51,'Can delete token',13,'delete_tokenproxy'),(52,'Can view token',13,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (26,'pbkdf2_sha256$260000$vweoFl9tx3h2IoAJqWnXoy$TYPfSTVYgkxON7rlqSweT88x9UAH2lMGu7rXX8GeZkg=','2021-10-23 00:45:14.884258',1,'m074med','Mohammed','Mamdouh','mhmedmhmed1234951@gmail.com',1,1,'2021-10-14 23:27:20.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('6d3ff42bb0654ea06e2b394bafc0e054a84c6111','2021-10-14 23:27:20.688036',26);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'Beni Suef, Egypt','+201176498236','jb6152702@gmail.com');
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (90,'2021-10-14 23:31:35.359605','26','m074med',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,26),(91,'2021-10-14 23:34:14.260158','25','m074med',2,'[{\"changed\": {\"fields\": [\"Phone number\", \"City\"]}}]',10,26),(92,'2021-10-14 23:45:41.310737','27','ahmed2',3,'',4,26),(93,'2021-10-15 00:14:39.438103','28','ahmed',3,'',4,26),(94,'2021-10-15 00:16:49.704969','29','ahmed',3,'',4,26),(95,'2021-10-15 00:24:47.625854','30','ahmed',3,'',4,26),(96,'2021-10-15 00:24:47.632847','31','ahmed3',3,'',4,26),(97,'2021-10-15 00:24:47.639878','32','ahmed5',3,'',4,26),(98,'2021-10-15 00:27:14.629040','33','ahmed',3,'',4,26),(99,'2021-10-15 00:48:35.533381','34','ahmed',3,'',4,26),(100,'2021-10-15 00:48:35.539389','35','ahmed2',3,'',4,26),(101,'2021-10-15 00:48:35.544377','36','ahmed3',3,'',4,26),(102,'2021-10-15 01:11:02.414413','37','ahmed7',3,'',4,26),(103,'2021-10-15 02:16:32.295413','31','Mohammed Mamdouh',3,'',9,26),(104,'2021-10-17 16:29:42.674181','26','m074med',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,26),(105,'2021-10-24 09:06:20.482903','1','category 1',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,26),(106,'2021-10-24 09:06:35.777659','2','category 2',1,'[{\"added\": {}}]',8,26),(107,'2021-10-24 09:06:46.774081','3','category 3',1,'[{\"added\": {}}]',8,26),(108,'2021-10-24 09:06:57.556037','4','category 4',1,'[{\"added\": {}}]',8,26),(109,'2021-10-24 09:07:20.566084','4','category 4',3,'',8,26),(110,'2021-10-24 09:25:18.223835','18','test job2',3,'',7,26),(111,'2021-10-24 09:25:18.232829','17','job 1',3,'',7,26),(112,'2021-10-24 09:26:56.058469','25','Software Engineer',1,'[{\"added\": {}}]',7,26),(113,'2021-10-24 09:28:01.449659','26','Digital Marketer',1,'[{\"added\": {}}]',7,26),(114,'2021-10-24 09:29:04.315438','27','Wordpress Developer',1,'[{\"added\": {}}]',7,26),(115,'2021-10-24 09:30:17.344536','28','Visual Designer',1,'[{\"added\": {}}]',7,26),(116,'2021-10-24 09:31:19.204326','29','Software Engineer',1,'[{\"added\": {}}]',7,26),(117,'2021-10-24 09:32:03.381728','30','Creative Designer',1,'[{\"added\": {}}]',7,26),(118,'2021-10-24 14:37:29.706431','32','Mohammed Mamdouh',1,'[{\"added\": {}}]',9,26);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(12,'authtoken','token'),(13,'authtoken','tokenproxy'),(11,'contact','info'),(5,'contenttypes','contenttype'),(9,'job','apply'),(8,'job','category'),(7,'job','job'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-24 12:25:06.645057'),(2,'auth','0001_initial','2021-09-24 12:25:08.597969'),(3,'admin','0001_initial','2021-09-24 12:25:09.073696'),(4,'admin','0002_logentry_remove_auto_add','2021-09-24 12:25:09.125639'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-24 12:25:09.178609'),(6,'contenttypes','0002_remove_content_type_name','2021-09-24 12:25:09.707333'),(7,'auth','0002_alter_permission_name_max_length','2021-09-24 12:25:09.916215'),(8,'auth','0003_alter_user_email_max_length','2021-09-24 12:25:10.016135'),(9,'auth','0004_alter_user_username_opts','2021-09-24 12:25:10.046115'),(10,'auth','0005_alter_user_last_login_null','2021-09-24 12:25:10.198023'),(11,'auth','0006_require_contenttypes_0002','2021-09-24 12:25:10.207018'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-24 12:25:10.227028'),(13,'auth','0008_alter_user_username_max_length','2021-09-24 12:25:10.416899'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-24 12:25:10.615785'),(15,'auth','0010_alter_group_name_max_length','2021-09-24 12:25:10.690742'),(16,'auth','0011_update_proxy_permissions','2021-09-24 12:25:10.728747'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-24 12:25:10.926634'),(18,'sessions','0001_initial','2021-09-24 12:25:11.048537'),(19,'job','0001_initial','2021-09-24 13:19:56.075198'),(20,'job','0002_alter_job_job_type','2021-09-24 13:23:10.494068'),(21,'job','0003_auto_20210925_1842','2021-09-25 16:43:08.071559'),(22,'job','0004_job_image','2021-09-25 23:39:31.090255'),(23,'job','0005_alter_job_salary','2021-09-26 01:16:29.335181'),(24,'job','0006_job_slug','2021-09-26 13:07:18.876441'),(25,'job','0007_apply','2021-09-26 14:05:14.200761'),(26,'job','0008_job_owner','2021-09-28 13:51:45.524514'),(27,'accounts','0001_initial','2021-09-28 21:52:07.128951'),(28,'accounts','0002_alter_profile_phone_number','2021-09-28 22:38:32.398203'),(29,'job','0009_apply_user','2021-09-29 18:05:54.700330'),(30,'job','0010_auto_20210930_1755','2021-09-30 15:55:41.723855'),(31,'contact','0001_initial','2021-10-01 14:31:55.307863'),(32,'job','0011_auto_20211013_1625','2021-10-13 14:25:32.132099'),(33,'job','0012_alter_apply_cv','2021-10-13 14:51:13.820902'),(34,'authtoken','0001_initial','2021-10-14 23:19:33.925231'),(35,'authtoken','0002_auto_20160226_1747','2021-10-14 23:19:33.981200'),(36,'authtoken','0003_tokenproxy','2021-10-14 23:19:33.996194');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fixzoqk5h381cdzy4e5pi4qek25fbckk','.eJxVjMGOwjAMRP8lZ6hSN41jjnvnGyIndimw26yaFg6If6dIXLiN5s2bh4n_XOu9zBJnrbrEpVx1MgfD603-7J4CBmIHQXrN5BRTQKficrLWk-_NzkRelzGuVed4ls0E_10mztvlm8iFp1NpcpmW-Zya96T50Noci-jvz2f7dTByHTcb_eABOIsfgDq1nnOHFrCFgVJPgiSUXIsuu7BFBcrBDh0Q9C1K583zBfUpS_k:1me59u:p6t3t4NTGDx2HhWmzNVh1eZ5MRN23mQF8m62gWL2xZo','2021-11-06 00:45:14.892256');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_apply`
--

DROP TABLE IF EXISTS `job_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `cv` varchar(100) NOT NULL,
  `cover_letter` longtext,
  `applied_at` datetime(6) NOT NULL,
  `job_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_apply_user_id_96691289_fk_auth_user_id` (`user_id`),
  KEY `job_apply_job_id_2756580a_fk_job_job_id` (`job_id`),
  CONSTRAINT `job_apply_job_id_2756580a_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`),
  CONSTRAINT `job_apply_user_id_96691289_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_apply`
--

LOCK TABLES `job_apply` WRITE;
/*!40000 ALTER TABLE `job_apply` DISABLE KEYS */;
INSERT INTO `job_apply` VALUES (32,'Mohammed','test2@gmail.com','https://docs.djangoproject.com','apply/cvs/Mohammed_Mamdouh.png','dww','2021-10-24 14:37:29.701908',21,26,'Mamdouh');
/*!40000 ALTER TABLE `job_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (1,'category 1'),(2,'category 2'),(3,'category 3');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_job`
--

DROP TABLE IF EXISTS `job_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext,
  `job_type` varchar(20) NOT NULL,
  `published_on` datetime(6) NOT NULL,
  `vacancy` int NOT NULL,
  `salary` int NOT NULL,
  `experience` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_job_category_id_555b6898_fk_job_category_id` (`category_id`),
  KEY `job_job_slug_1de62f0e` (`slug`),
  KEY `job_job_owner_id_d5c16855_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `job_job_category_id_555b6898_fk_job_category_id` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `job_job_owner_id_d5c16855_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_job`
--

LOCK TABLES `job_job` WRITE;
/*!40000 ALTER TABLE `job_job` DISABLE KEYS */;
INSERT INTO `job_job` VALUES (19,'Software Engineer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:03:37.489456',2,5000,2,1,'','software-engineer',26),(20,'Digital Marketer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Full-time','2021-10-24 09:17:21.068567',3,2500,1,2,'images/jobs/None.png','digital-marketer',26),(21,'Wordpress Developer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:18:32.881035',4,6000,3,3,'images/jobs/None_Tdsnn3e.jpg','wordpress-developer',26),(22,'Visual Designer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Full-time','2021-10-24 09:19:47.551546',5,3000,2,1,'images/jobs/None_NbgSVmS.jpg','visual-designer',26),(23,'Software Engineer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:21:30.931365',10,4000,2,2,'images/jobs/None_pQiMha0.jpg','software-engineer',26),(24,'Creative Designer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:22:42.411206',5,2000,1,3,'','creative-designer',26),(25,'Software Engineer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:26:56.056480',3,7000,4,1,'images/jobs/None_r3L1oF7.png','software-engineer',26),(26,'Digital Marketer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Full-time','2021-10-24 09:28:01.447662',11,2500,1,2,'images/jobs/None_8VYPoZt.jpg','digital-marketer',26),(27,'Wordpress Developer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:29:04.310438',8,3000,2,3,'images/jobs/None_jlqFkfY.jpg','wordpress-developer',26),(28,'Visual Designer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Full-time','2021-10-24 09:30:17.339540',5,4000,3,1,'images/jobs/None_MfTTwHo.jpg','visual-designer',26),(29,'Software Engineer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Part-time','2021-10-24 09:31:19.199346',4,5000,3,2,'','software-engineer',26),(30,'Creative Designer','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nVariations of passages of lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.\r\n\r\nResponsibility\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nQualifications\r\nThe applicants should have experience in the following areas.\r\nHave sound knowledge of commercial activities.\r\nLeadership, analytical, and problem-solving abilities.\r\nShould have vast knowledge in IAS/ IFRS, Company Act, Income Tax, VAT.\r\nBenefits\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing.','Full-time','2021-10-24 09:32:03.379725',6,3000,2,3,'images/jobs/None_LmKuv3b.png','creative-designer',26);
/*!40000 ALTER TABLE `job_job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-25  0:20:22
