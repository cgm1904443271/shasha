-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: shasha
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add goods',7,'add_goods'),(20,'Can change goods',7,'change_goods'),(21,'Can delete goods',7,'delete_goods'),(22,'Can add img',8,'add_img'),(23,'Can change img',8,'change_img'),(24,'Can delete img',8,'delete_img'),(25,'Can add user',9,'add_user'),(26,'Can change user',9,'change_user'),(27,'Can delete user',9,'delete_user'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add order goods',11,'add_ordergoods'),(32,'Can change order goods',11,'change_ordergoods'),(33,'Can delete order goods',11,'delete_ordergoods'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'shasha','cart'),(7,'shasha','goods'),(8,'shasha','img'),(12,'shasha','order'),(11,'shasha','ordergoods'),(9,'shasha','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-15 03:21:42.482700'),(2,'auth','0001_initial','2019-03-15 03:21:54.040958'),(3,'admin','0001_initial','2019-03-15 03:21:56.371372'),(4,'admin','0002_logentry_remove_auto_add','2019-03-15 03:21:56.506270'),(5,'contenttypes','0002_remove_content_type_name','2019-03-15 03:21:57.974674'),(6,'auth','0002_alter_permission_name_max_length','2019-03-15 03:21:58.131612'),(7,'auth','0003_alter_user_email_max_length','2019-03-15 03:21:58.279593'),(8,'auth','0004_alter_user_username_opts','2019-03-15 03:21:58.335925'),(9,'auth','0005_alter_user_last_login_null','2019-03-15 03:21:59.030400'),(10,'auth','0006_require_contenttypes_0002','2019-03-15 03:21:59.086358'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-15 03:21:59.154423'),(12,'auth','0008_alter_user_username_max_length','2019-03-15 03:21:59.321245'),(13,'sessions','0001_initial','2019-03-15 03:21:59.994993'),(14,'shasha','0001_initial','2019-03-15 03:22:01.117328'),(15,'shasha','0002_auto_20190315_0352','2019-03-15 03:52:40.651482'),(16,'shasha','0003_cart','2019-03-16 02:32:51.635134'),(17,'shasha','0004_order_ordergoods','2019-03-17 08:00:29.356652'),(18,'shasha','0005_cart_selection','2019-03-18 11:03:53.756781'),(19,'shasha','0006_auto_20190318_1309','2019-03-18 13:09:12.153316'),(20,'shasha','0007_cart_selectionall','2019-03-19 03:02:18.507255');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6ksqq7ny3yppfr5dos60vmir0w7t7hks','NWIzYjllOTlkNDM2MGQ1YWMxMmIwZGRlNGNiOGRlN2RmOWFhYmM4Njp7InRva2VuIjoiOWY2YzgzY2M3ZjM3ZWJiZTUwYzdlN2YwMjRlZDZmMjMifQ==','2019-03-30 02:28:19.154571'),('826ezqeo86khcxk05uqrzlszt6rs3a8x','ZGQ2ZTcwMTg5MWVhMjhkNTg5YWMxYzNiODRiZTZlMWMzY2EyMmY5NTp7InRva2VuIjoiZWM1NmMzY2NiMjQ0ZDRhNzc0YTk3OTU3Mjg1NGI5NjIifQ==','2019-04-02 06:09:31.306807'),('wdngtmfilvq24e5ae8m11dm6x3cdsd7q','YmRkODE5NmZjMzQ0ZjYxNWI4YzQzMGRkMGU1YjdmNWJhNGJhYjkyMTp7InRva2VuIjoiMTlhNDM1MzM2NDk1YjgxYTAxMDAzZTFmNmM1MGRlZGIifQ==','2019-03-30 08:10:11.925880');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_cart`
--

DROP TABLE IF EXISTS `ss_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selection` int(11) NOT NULL,
  `selectionall` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ss_cart_goods_id_f963f862_fk_ss_goods_id` (`goods_id`),
  KEY `ss_cart_user_id_c4564175_fk_ss_user_id` (`user_id`),
  CONSTRAINT `ss_cart_goods_id_f963f862_fk_ss_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `ss_goods` (`id`),
  CONSTRAINT `ss_cart_user_id_c4564175_fk_ss_user_id` FOREIGN KEY (`user_id`) REFERENCES `ss_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_cart`
--

LOCK TABLES `ss_cart` WRITE;
/*!40000 ALTER TABLE `ss_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ss_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_goods`
--

DROP TABLE IF EXISTS `ss_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `gid` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `market` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `longname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_goods`
--

LOCK TABLES `ss_goods` WRITE;
/*!40000 ALTER TABLE `ss_goods` DISABLE KEYS */;
INSERT INTO `ss_goods` VALUES (1,'BRTC','http://cn02alicdn.sasa.com/public/images/fe/f4/3d/c6a401bc0ef57509b6c51403bff58952efae2b29.jpg?1488506008#h','1001',100,10000,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!'),(2,'PORT','http://cn03alicdn.sasa.com/public/images/a6/a5/0a/5389e632aa20e5c79343cb840a5250d3fa0d2b85.jpg?1551862721#h','1002',101,10001,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!'),(3,'BAAD','http://cn04alicdn.sasa.com/public/images/fb/ad/79/7e82ef1998c9dff8b02cb0236a403ad64b0240e0.jpg?1550630846#h','1003',102,10002,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!'),(4,'APPLE','http://cn03alicdn.sasa.com/public/images/06/37/5b/41a5202a699ef666ea4476ac8883eab937313249.jpg?1546225292#h','1004',103,10003,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!'),(5,'CAT','http://cn02alicdn.sasa.com/public/images/7b/c7/11/fa540b3ed07b7d826431cf58af6a3b6d62ab00e0.jpg?1551263184#h','1005',104,10004,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!'),(6,'FASA','http://cn02alicdn.sasa.com/public/images/81/39/88/c2530062005edd4208f915084071c44885066f7a.jpg?1475141529#h','1006',105,10005,'/static/img/newarrivals/E.M.png','Things are good, you deserve it!!! Come and buy ducks!!!');
/*!40000 ALTER TABLE `ss_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_img`
--

DROP TABLE IF EXISTS `ss_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_img`
--

LOCK TABLES `ss_img` WRITE;
/*!40000 ALTER TABLE `ss_img` DISABLE KEYS */;
INSERT INTO `ss_img` VALUES (1,'laji','http://cn02alicdn.sasa.com/public/images/11/6b/67/c760e045c14ad16e73ac47813e11bf90d9fe1ef0.jpg?1551438534#w'),(2,'goubi','http://cn04alicdn.sasa.com/public/images/c0/3e/91/f86b87859b28f91bdd8ae7afaa313fe62a782253.jpg?1552041845#w'),(3,'shabi','http://cn02alicdn.sasa.com/public/images/4a/ec/72/388d8899777b62e344d9c398bb023d82afe607e8.jpg?1552038878#w'),(4,'shabi','http://cn03alicdn.sasa.com/public/images/b5/37/bb/aa4256b9fb65b9b54fe8c8868ca5dd7a54a602a4.jpg?1552033496#w');
/*!40000 ALTER TABLE `ss_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_order`
--

DROP TABLE IF EXISTS `ss_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ss_order_user_id_9e00f371_fk_ss_user_id` (`user_id`),
  CONSTRAINT `ss_order_user_id_9e00f371_fk_ss_user_id` FOREIGN KEY (`user_id`) REFERENCES `ss_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_order`
--

LOCK TABLES `ss_order` WRITE;
/*!40000 ALTER TABLE `ss_order` DISABLE KEYS */;
INSERT INTO `ss_order` VALUES (17,'2019-03-19 06:13:14.606758','2019-03-19 06:13:14.606826',0,'81996130',1);
/*!40000 ALTER TABLE `ss_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_ordergood`
--

DROP TABLE IF EXISTS `ss_ordergood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_ordergood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ss_ordergood_goods_id_081126f2_fk_ss_goods_id` (`goods_id`),
  KEY `ss_ordergood_order_id_0bc1be9f_fk_ss_order_id` (`order_id`),
  CONSTRAINT `ss_ordergood_goods_id_081126f2_fk_ss_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `ss_goods` (`id`),
  CONSTRAINT `ss_ordergood_order_id_0bc1be9f_fk_ss_order_id` FOREIGN KEY (`order_id`) REFERENCES `ss_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_ordergood`
--

LOCK TABLES `ss_ordergood` WRITE;
/*!40000 ALTER TABLE `ss_ordergood` DISABLE KEYS */;
INSERT INTO `ss_ordergood` VALUES (9,3,3,17),(10,1,1,17),(11,1,2,17);
/*!40000 ALTER TABLE `ss_ordergood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ss_user`
--

DROP TABLE IF EXISTS `ss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ss_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ss_user`
--

LOCK TABLES `ss_user` WRITE;
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` VALUES (1,'15180281403','123456','ec56c3ccb244d4a774a979572854b962'),(2,'15758596875','123456','e48d09c0541aa4e53ee81d94bf4eb327'),(3,'15270789963','123456','62be6f485e7fa1e8ca1222ed42f49457'),(4,'13250613494','123456','a1e90848ca9a2d40a5e460f5756442db'),(5,'15788965656','123456','dd869ca4f4810cd92b14d5ac7bc67ce6'),(6,'13250613991','441621','a67ca426f790865bf8b0416db286d26e');
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-19 14:17:00
