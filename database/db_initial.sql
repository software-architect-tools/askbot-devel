-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: ****
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_type` smallint(6) NOT NULL,
  `active_at` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `is_auditted` tinyint(1) NOT NULL,
  `summary` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_user_id_259f8609bea7c640_fk_auth_user_id` (`user_id`),
  KEY `activ_content_type_id_4ada8dafec9f4e63_fk_django_content_type_id` (`content_type_id`),
  KEY `activity_question_id_5026241bf8814c05_fk_askbot_post_id` (`question_id`),
  KEY `activity_13a1bb6e` (`activity_type`),
  KEY `activity_af31437c` (`object_id`),
  CONSTRAINT `activ_content_type_id_4ada8dafec9f4e63_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `activity_question_id_5026241bf8814c05_fk_askbot_post_id` FOREIGN KEY (`question_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `activity_user_id_259f8609bea7c640_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_activityauditstatus`
--

DROP TABLE IF EXISTS `askbot_activityauditstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_activityauditstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`activity_id`),
  KEY `askbot_activityaudit_activity_id_158b343d5d305eba_fk_activity_id` (`activity_id`),
  CONSTRAINT `askbot_activityaudit_activity_id_158b343d5d305eba_fk_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  CONSTRAINT `askbot_activityauditsta_user_id_56f1a161a53d63d4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_activityauditstatus`
--

LOCK TABLES `askbot_activityauditstatus` WRITE;
/*!40000 ALTER TABLE `askbot_activityauditstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_activityauditstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_anonymousanswer`
--

DROP TABLE IF EXISTS `askbot_anonymousanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_anonymousanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(40) NOT NULL,
  `wiki` tinyint(1) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `ip_addr` char(39) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_anonymousanswe_author_id_22b84b2717c50f73_fk_auth_user_id` (`author_id`),
  KEY `askbot_anonymousa_question_id_4dc0f83ed6ace562_fk_askbot_post_id` (`question_id`),
  CONSTRAINT `askbot_anonymousa_question_id_4dc0f83ed6ace562_fk_askbot_post_id` FOREIGN KEY (`question_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_anonymousanswe_author_id_22b84b2717c50f73_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_anonymousanswer`
--

LOCK TABLES `askbot_anonymousanswer` WRITE;
/*!40000 ALTER TABLE `askbot_anonymousanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_anonymousanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_anonymousquestion`
--

DROP TABLE IF EXISTS `askbot_anonymousquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_anonymousquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(40) NOT NULL,
  `wiki` tinyint(1) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `ip_addr` char(39) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext NOT NULL,
  `title` varchar(300) NOT NULL,
  `tagnames` varchar(125) NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_anonymousquest_author_id_38e403f77edf8917_fk_auth_user_id` (`author_id`),
  CONSTRAINT `askbot_anonymousquest_author_id_38e403f77edf8917_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_anonymousquestion`
--

LOCK TABLES `askbot_anonymousquestion` WRITE;
/*!40000 ALTER TABLE `askbot_anonymousquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_anonymousquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_askwidget`
--

DROP TABLE IF EXISTS `askbot_askwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_askwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `include_text_field` tinyint(1) NOT NULL,
  `inner_style` longtext NOT NULL,
  `outer_style` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_as_group_id_709f6ba53f6ed756_fk_askbot_group_group_ptr_id` (`group_id`),
  KEY `askbot_askwidget_tag_id_6c385c614ccff46b_fk_tag_id` (`tag_id`),
  CONSTRAINT `askbot_as_group_id_709f6ba53f6ed756_fk_askbot_group_group_ptr_id` FOREIGN KEY (`group_id`) REFERENCES `askbot_group` (`group_ptr_id`),
  CONSTRAINT `askbot_askwidget_tag_id_6c385c614ccff46b_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_askwidget`
--

LOCK TABLES `askbot_askwidget` WRITE;
/*!40000 ALTER TABLE `askbot_askwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_askwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_badgedata`
--

DROP TABLE IF EXISTS `askbot_badgedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_badgedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `awarded_count` int(10) unsigned NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_badgedata`
--

LOCK TABLES `askbot_badgedata` WRITE;
/*!40000 ALTER TABLE `askbot_badgedata` DISABLE KEYS */;
INSERT INTO `askbot_badgedata` VALUES (1,'necromancer',0,0),(2,'stellar-question',0,0),(3,'peer-pressure',0,0),(4,'disciplined',0,0),(5,'critic',0,0),(6,'famous-question',0,0),(7,'nice-answer',0,0),(8,'organizer',0,0),(9,'civic-duty',0,0),(10,'enthusiast',0,0),(11,'good-question',0,0),(12,'nice-question',0,0),(13,'guru',0,0),(14,'associate-editor',0,0),(15,'supporter',0,0),(16,'citizen-patrol',0,0),(17,'editor',0,0),(18,'commentator',0,0),(19,'self-learner',0,0),(20,'great-question',0,0),(21,'notable-question',0,0),(22,'rapid-responder',0,0),(23,'good-answer',0,0),(24,'student',0,0),(25,'enlightened',0,0),(26,'teacher',0,0),(27,'popular-question',0,0),(28,'scholar',0,0),(29,'great-answer',0,0),(30,'autobiographer',0,0),(31,'favorite-question',0,0),(32,'taxonomist',0,0);
/*!40000 ALTER TABLE `askbot_badgedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_bulktagsubscription`
--

DROP TABLE IF EXISTS `askbot_bulktagsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_bulktagsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_bulktagsubscription`
--

LOCK TABLES `askbot_bulktagsubscription` WRITE;
/*!40000 ALTER TABLE `askbot_bulktagsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_bulktagsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_bulktagsubscription_groups`
--

DROP TABLE IF EXISTS `askbot_bulktagsubscription_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_bulktagsubscription_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulktagsubscription_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulktagsubscription_id` (`bulktagsubscription_id`,`group_id`),
  KEY `askbot_bu_group_id_60d3cb95cedf9da4_fk_askbot_group_group_ptr_id` (`group_id`),
  CONSTRAINT `a872f9b34129e42f906374dbec5d91bc` FOREIGN KEY (`bulktagsubscription_id`) REFERENCES `askbot_bulktagsubscription` (`id`),
  CONSTRAINT `askbot_bu_group_id_60d3cb95cedf9da4_fk_askbot_group_group_ptr_id` FOREIGN KEY (`group_id`) REFERENCES `askbot_group` (`group_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_bulktagsubscription_groups`
--

LOCK TABLES `askbot_bulktagsubscription_groups` WRITE;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_bulktagsubscription_tags`
--

DROP TABLE IF EXISTS `askbot_bulktagsubscription_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_bulktagsubscription_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulktagsubscription_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulktagsubscription_id` (`bulktagsubscription_id`,`tag_id`),
  KEY `askbot_bulktagsubscription_tags_tag_id_680dae2805f5502_fk_tag_id` (`tag_id`),
  CONSTRAINT `askbot_bulktagsubscription_tags_tag_id_680dae2805f5502_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `f0b78c26a5ae574b559c997b2e7554ef` FOREIGN KEY (`bulktagsubscription_id`) REFERENCES `askbot_bulktagsubscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_bulktagsubscription_tags`
--

LOCK TABLES `askbot_bulktagsubscription_tags` WRITE;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_bulktagsubscription_users`
--

DROP TABLE IF EXISTS `askbot_bulktagsubscription_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_bulktagsubscription_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulktagsubscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bulktagsubscription_id` (`bulktagsubscription_id`,`user_id`),
  KEY `askbot_bulktagsubscripti_user_id_83af2d6a321be32_fk_auth_user_id` (`user_id`),
  CONSTRAINT `D1c69d71fda5a3c826cfd98dc14d1198` FOREIGN KEY (`bulktagsubscription_id`) REFERENCES `askbot_bulktagsubscription` (`id`),
  CONSTRAINT `askbot_bulktagsubscripti_user_id_83af2d6a321be32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_bulktagsubscription_users`
--

LOCK TABLES `askbot_bulktagsubscription_users` WRITE;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_bulktagsubscription_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_draftanswer`
--

DROP TABLE IF EXISTS `askbot_draftanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_draftanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `thread_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_draftanswe_thread_id_5fda0073e846969e_fk_askbot_thread_id` (`thread_id`),
  KEY `askbot_draftanswer_author_id_1e9c9f9c0f350f53_fk_auth_user_id` (`author_id`),
  CONSTRAINT `askbot_draftanswe_thread_id_5fda0073e846969e_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`),
  CONSTRAINT `askbot_draftanswer_author_id_1e9c9f9c0f350f53_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_draftanswer`
--

LOCK TABLES `askbot_draftanswer` WRITE;
/*!40000 ALTER TABLE `askbot_draftanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_draftanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_draftquestion`
--

DROP TABLE IF EXISTS `askbot_draftquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_draftquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `author_id` int(11) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `tagnames` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_draftquestion_author_id_6165d6ea6d42569_fk_auth_user_id` (`author_id`),
  CONSTRAINT `askbot_draftquestion_author_id_6165d6ea6d42569_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_draftquestion`
--

LOCK TABLES `askbot_draftquestion` WRITE;
/*!40000 ALTER TABLE `askbot_draftquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_draftquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_emailfeedsetting`
--

DROP TABLE IF EXISTS `askbot_emailfeedsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_emailfeedsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscriber_id` int(11) NOT NULL,
  `feed_type` varchar(16) NOT NULL,
  `frequency` varchar(8) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `reported_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_id` (`subscriber_id`,`feed_type`),
  CONSTRAINT `askbot_emailfeeds_subscriber_id_61ac550b7977254c_fk_auth_user_id` FOREIGN KEY (`subscriber_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_emailfeedsetting`
--

LOCK TABLES `askbot_emailfeedsetting` WRITE;
/*!40000 ALTER TABLE `askbot_emailfeedsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_emailfeedsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_group`
--

DROP TABLE IF EXISTS `askbot_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_group` (
  `group_ptr_id` int(11) NOT NULL,
  `logo_url` varchar(200) DEFAULT NULL,
  `description_id` int(11) DEFAULT NULL,
  `moderate_email` tinyint(1) NOT NULL,
  `moderate_answers_to_enquirers` tinyint(1) NOT NULL,
  `openness` smallint(6) NOT NULL,
  `preapproved_emails` longtext,
  `preapproved_email_domains` longtext,
  `is_vip` tinyint(1) NOT NULL,
  `read_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`group_ptr_id`),
  UNIQUE KEY `description_id` (`description_id`),
  CONSTRAINT `askbot_group_description_id_611d7ee574a7ccd5_fk_askbot_post_id` FOREIGN KEY (`description_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_group_group_ptr_id_34c473bc5e23d117_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_group`
--

LOCK TABLES `askbot_group` WRITE;
/*!40000 ALTER TABLE `askbot_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_groupmembership`
--

DROP TABLE IF EXISTS `askbot_groupmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_groupmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_id`),
  KEY `askbot_groupmembership_user_id_369172e88e8a6b89_fk_auth_user_id` (`user_id`),
  CONSTRAINT `askbot_groupmembershi_group_id_1d16413b688800fe_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `askbot_groupmembership_user_id_369172e88e8a6b89_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_groupmembership`
--

LOCK TABLES `askbot_groupmembership` WRITE;
/*!40000 ALTER TABLE `askbot_groupmembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_groupmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_importedobjectinfo`
--

DROP TABLE IF EXISTS `askbot_importedobjectinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_importedobjectinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `run_id` int(11) NOT NULL,
  `extra_info` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_importedob_run_id_389bebfbc98691e9_fk_askbot_importrun_id` (`run_id`),
  CONSTRAINT `askbot_importedob_run_id_389bebfbc98691e9_fk_askbot_importrun_id` FOREIGN KEY (`run_id`) REFERENCES `askbot_importrun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_importedobjectinfo`
--

LOCK TABLES `askbot_importedobjectinfo` WRITE;
/*!40000 ALTER TABLE `askbot_importedobjectinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_importedobjectinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_importrun`
--

DROP TABLE IF EXISTS `askbot_importrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_importrun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_importrun`
--

LOCK TABLES `askbot_importrun` WRITE;
/*!40000 ALTER TABLE `askbot_importrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_importrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_localizeduserprofile`
--

DROP TABLE IF EXISTS `askbot_localizeduserprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_localizeduserprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL,
  `about` longtext NOT NULL,
  `language_code` varchar(16) NOT NULL,
  `reputation` int(10) unsigned NOT NULL,
  `is_claimed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_localizedus_auth_user_id_48f62a8a63622acc_fk_auth_user_id` (`auth_user_id`),
  KEY `askbot_localizeduserprofile_60716c2f` (`language_code`),
  KEY `askbot_localizeduserprofile_6fed0ce6` (`reputation`),
  KEY `askbot_localizeduserprofile_da778334` (`is_claimed`),
  CONSTRAINT `askbot_localizedus_auth_user_id_48f62a8a63622acc_fk_auth_user_id` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_localizeduserprofile`
--

LOCK TABLES `askbot_localizeduserprofile` WRITE;
/*!40000 ALTER TABLE `askbot_localizeduserprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_localizeduserprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_markedtag`
--

DROP TABLE IF EXISTS `askbot_markedtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_markedtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_markedtag_tag_id_4d07ff0705f2f196_fk_tag_id` (`tag_id`),
  KEY `askbot_markedtag_user_id_3cf28eb45d535c5c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `askbot_markedtag_tag_id_4d07ff0705f2f196_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `askbot_markedtag_user_id_3cf28eb45d535c5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_markedtag`
--

LOCK TABLES `askbot_markedtag` WRITE;
/*!40000 ALTER TABLE `askbot_markedtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_markedtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_message`
--

DROP TABLE IF EXISTS `askbot_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_message_user_id_8196ea4e7d9e0cd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `askbot_message_user_id_8196ea4e7d9e0cd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_message`
--

LOCK TABLES `askbot_message` WRITE;
/*!40000 ALTER TABLE `askbot_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_post`
--

DROP TABLE IF EXISTS `askbot_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` varchar(255) NOT NULL,
  `old_question_id` int(10) unsigned DEFAULT NULL,
  `old_answer_id` int(10) unsigned DEFAULT NULL,
  `old_comment_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `current_revision_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `endorsed` tinyint(1) NOT NULL,
  `endorsed_by_id` int(11) DEFAULT NULL,
  `endorsed_at` datetime(6) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by_id` int(11) DEFAULT NULL,
  `wiki` tinyint(1) NOT NULL,
  `wikified_at` datetime(6) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `locked_by_id` int(11) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `vote_up_count` int(11) NOT NULL,
  `vote_down_count` int(11) NOT NULL,
  `comment_count` int(10) unsigned NOT NULL,
  `offensive_flag_count` smallint(6) NOT NULL,
  `last_edited_at` datetime(6) DEFAULT NULL,
  `last_edited_by_id` int(11) DEFAULT NULL,
  `html` longtext,
  `text` longtext,
  `language_code` varchar(16) NOT NULL,
  `summary` longtext,
  `is_anonymous` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `old_question_id` (`old_question_id`),
  UNIQUE KEY `old_answer_id` (`old_answer_id`),
  UNIQUE KEY `old_comment_id` (`old_comment_id`),
  KEY `askbot_post_parent_id_4092be646c5735c8_fk_askbot_post_id` (`parent_id`),
  KEY `askbot_post_thread_id_f48ec9d916e9668_fk_askbot_thread_id` (`thread_id`),
  KEY `as_current_revision_id_a65a89fc9d8c581_fk_askbot_postrevision_id` (`current_revision_id`),
  KEY `askbot_post_author_id_2b3512bde8bbfb7d_fk_auth_user_id` (`author_id`),
  KEY `askbot_post_endorsed_by_id_1c8edb9eb1e2d51f_fk_auth_user_id` (`endorsed_by_id`),
  KEY `askbot_post_deleted_by_id_7c2fc62c0426ecbb_fk_auth_user_id` (`deleted_by_id`),
  KEY `askbot_post_locked_by_id_585ce1bfca50d2ff_fk_auth_user_id` (`locked_by_id`),
  KEY `askbot_post_last_edited_by_id_1139652f670facb4_fk_auth_user_id` (`last_edited_by_id`),
  KEY `askbot_post_01b0357b` (`post_type`),
  KEY `askbot_post_a604e731` (`endorsed`),
  KEY `askbot_post_787d5f05` (`approved`),
  KEY `askbot_post_da602f0b` (`deleted`),
  CONSTRAINT `as_current_revision_id_a65a89fc9d8c581_fk_askbot_postrevision_id` FOREIGN KEY (`current_revision_id`) REFERENCES `askbot_postrevision` (`id`),
  CONSTRAINT `askbot_post_author_id_2b3512bde8bbfb7d_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_post_deleted_by_id_7c2fc62c0426ecbb_fk_auth_user_id` FOREIGN KEY (`deleted_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_post_endorsed_by_id_1c8edb9eb1e2d51f_fk_auth_user_id` FOREIGN KEY (`endorsed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_post_last_edited_by_id_1139652f670facb4_fk_auth_user_id` FOREIGN KEY (`last_edited_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_post_locked_by_id_585ce1bfca50d2ff_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_post_parent_id_4092be646c5735c8_fk_askbot_post_id` FOREIGN KEY (`parent_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_post_thread_id_f48ec9d916e9668_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_post`
--

LOCK TABLES `askbot_post` WRITE;
/*!40000 ALTER TABLE `askbot_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_post_groups`
--

DROP TABLE IF EXISTS `askbot_post_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_post_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`group_id`),
  KEY `askbot_po_group_id_37dab98ba6ca579e_fk_askbot_group_group_ptr_id` (`group_id`),
  CONSTRAINT `askbot_po_group_id_37dab98ba6ca579e_fk_askbot_group_group_ptr_id` FOREIGN KEY (`group_id`) REFERENCES `askbot_group` (`group_ptr_id`),
  CONSTRAINT `askbot_post_groups_post_id_26b099c479f7885c_fk_askbot_post_id` FOREIGN KEY (`post_id`) REFERENCES `askbot_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_post_groups`
--

LOCK TABLES `askbot_post_groups` WRITE;
/*!40000 ALTER TABLE `askbot_post_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_post_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_postflagreason`
--

DROP TABLE IF EXISTS `askbot_postflagreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_postflagreason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `details_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_postflagreason_author_id_5056eda87a97cbd3_fk_auth_user_id` (`author_id`),
  KEY `askbot_postflagrea_details_id_44d3f120d2172a33_fk_askbot_post_id` (`details_id`),
  CONSTRAINT `askbot_postflagrea_details_id_44d3f120d2172a33_fk_askbot_post_id` FOREIGN KEY (`details_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_postflagreason_author_id_5056eda87a97cbd3_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_postflagreason`
--

LOCK TABLES `askbot_postflagreason` WRITE;
/*!40000 ALTER TABLE `askbot_postflagreason` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_postflagreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_postrevision`
--

DROP TABLE IF EXISTS `askbot_postrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_postrevision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  `author_id` int(11) NOT NULL,
  `revised_at` datetime(6) NOT NULL,
  `summary` varchar(300) NOT NULL,
  `text` longtext NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `approved_at` datetime(6) DEFAULT NULL,
  `by_email` tinyint(1) NOT NULL,
  `email_address` varchar(254) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `tagnames` varchar(125) NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL,
  `ip_addr` char(39) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`revision`),
  KEY `askbot_postrevision_author_id_3b364cc439ca0556_fk_auth_user_id` (`author_id`),
  KEY `askbot_postrevis_approved_by_id_62d2c82aaab54dbd_fk_auth_user_id` (`approved_by_id`),
  KEY `askbot_postrevision_787d5f05` (`approved`),
  KEY `askbot_postrevision_21e54346` (`ip_addr`),
  CONSTRAINT `askbot_postrevis_approved_by_id_62d2c82aaab54dbd_fk_auth_user_id` FOREIGN KEY (`approved_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_postrevision_author_id_3b364cc439ca0556_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_postrevision_post_id_4157fe9cbb8fe5f9_fk_askbot_post_id` FOREIGN KEY (`post_id`) REFERENCES `askbot_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_postrevision`
--

LOCK TABLES `askbot_postrevision` WRITE;
/*!40000 ALTER TABLE `askbot_postrevision` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_postrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_questionview`
--

DROP TABLE IF EXISTS `askbot_questionview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_questionview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `who_id` int(11) NOT NULL,
  `when` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_questionvi_question_id_6d758a9dcb69d01f_fk_askbot_post_id` (`question_id`),
  KEY `askbot_questionview_who_id_7c362353d2521c84_fk_auth_user_id` (`who_id`),
  CONSTRAINT `askbot_questionvi_question_id_6d758a9dcb69d01f_fk_askbot_post_id` FOREIGN KEY (`question_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_questionview_who_id_7c362353d2521c84_fk_auth_user_id` FOREIGN KEY (`who_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_questionview`
--

LOCK TABLES `askbot_questionview` WRITE;
/*!40000 ALTER TABLE `askbot_questionview` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_questionview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_questionwidget`
--

DROP TABLE IF EXISTS `askbot_questionwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_questionwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `question_number` int(10) unsigned NOT NULL,
  `tagnames` varchar(50) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `search_query` varchar(50) DEFAULT NULL,
  `order_by` varchar(18) NOT NULL,
  `style` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_qu_group_id_335b568c8facb46e_fk_askbot_group_group_ptr_id` (`group_id`),
  CONSTRAINT `askbot_qu_group_id_335b568c8facb46e_fk_askbot_group_group_ptr_id` FOREIGN KEY (`group_id`) REFERENCES `askbot_group` (`group_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_questionwidget`
--

LOCK TABLES `askbot_questionwidget` WRITE;
/*!40000 ALTER TABLE `askbot_questionwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_questionwidget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_replyaddress`
--

DROP TABLE IF EXISTS `askbot_replyaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_replyaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(25) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `reply_action` varchar(32) NOT NULL,
  `response_post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `allowed_from_email` varchar(150) NOT NULL,
  `used_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `askbot_replyaddress_post_id_bed8a178e23d85a_fk_askbot_post_id` (`post_id`),
  KEY `askbot_reply_response_post_id_20482cc85552c959_fk_askbot_post_id` (`response_post_id`),
  KEY `askbot_replyaddress_user_id_71127c2aabb66cdf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `askbot_reply_response_post_id_20482cc85552c959_fk_askbot_post_id` FOREIGN KEY (`response_post_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_replyaddress_post_id_bed8a178e23d85a_fk_askbot_post_id` FOREIGN KEY (`post_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_replyaddress_user_id_71127c2aabb66cdf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_replyaddress`
--

LOCK TABLES `askbot_replyaddress` WRITE;
/*!40000 ALTER TABLE `askbot_replyaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_replyaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_role`
--

DROP TABLE IF EXISTS `askbot_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role`),
  CONSTRAINT `askbot_role_user_id_362cf7ae0f5fed7b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_role`
--

LOCK TABLES `askbot_role` WRITE;
/*!40000 ALTER TABLE `askbot_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_tagsynonym`
--

DROP TABLE IF EXISTS `askbot_tagsynonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_tagsynonym` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_tag_name` varchar(255) NOT NULL,
  `target_tag_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `owned_by_id` int(11) NOT NULL,
  `auto_rename_count` int(11) NOT NULL,
  `last_auto_rename_at` datetime(6) NOT NULL,
  `language_code` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_tag_name` (`source_tag_name`),
  KEY `askbot_tagsynonym_owned_by_id_78abbee72fd957a4_fk_auth_user_id` (`owned_by_id`),
  KEY `askbot_tagsynonym_ede4a134` (`target_tag_name`),
  CONSTRAINT `askbot_tagsynonym_owned_by_id_78abbee72fd957a4_fk_auth_user_id` FOREIGN KEY (`owned_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_tagsynonym`
--

LOCK TABLES `askbot_tagsynonym` WRITE;
/*!40000 ALTER TABLE `askbot_tagsynonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_tagsynonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_thread`
--

DROP TABLE IF EXISTS `askbot_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `tagnames` varchar(125) NOT NULL,
  `view_count` int(10) unsigned NOT NULL,
  `favourite_count` int(10) unsigned NOT NULL,
  `answer_count` int(10) unsigned NOT NULL,
  `last_activity_at` datetime(6) NOT NULL,
  `last_activity_by_id` int(11) NOT NULL,
  `language_code` varchar(16) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `closed_by_id` int(11) DEFAULT NULL,
  `closed_at` datetime(6) DEFAULT NULL,
  `close_reason` smallint(6) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `accepted_answer_id` int(11) DEFAULT NULL,
  `added_at` datetime(6) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `askbot_thre_last_activity_by_id_3316bd02bf08313e_fk_auth_user_id` (`last_activity_by_id`),
  KEY `askbot_thread_closed_by_id_6c5314d736dbc9b_fk_auth_user_id` (`closed_by_id`),
  KEY `askbot_thr_accepted_answer_id_6a34240d329e4f29_fk_askbot_post_id` (`accepted_answer_id`),
  KEY `askbot_thread_da602f0b` (`deleted`),
  KEY `askbot_thread_787d5f05` (`approved`),
  CONSTRAINT `askbot_thr_accepted_answer_id_6a34240d329e4f29_fk_askbot_post_id` FOREIGN KEY (`accepted_answer_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `askbot_thre_last_activity_by_id_3316bd02bf08313e_fk_auth_user_id` FOREIGN KEY (`last_activity_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `askbot_thread_closed_by_id_6c5314d736dbc9b_fk_auth_user_id` FOREIGN KEY (`closed_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_thread`
--

LOCK TABLES `askbot_thread` WRITE;
/*!40000 ALTER TABLE `askbot_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_thread_followed_by`
--

DROP TABLE IF EXISTS `askbot_thread_followed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_thread_followed_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thread_id` (`thread_id`,`user_id`),
  KEY `askbot_thread_followed_b_user_id_5b84b43394c0582_fk_auth_user_id` (`user_id`),
  CONSTRAINT `askbot_thread_fol_thread_id_7f8b1a266f86df3d_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`),
  CONSTRAINT `askbot_thread_followed_b_user_id_5b84b43394c0582_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_thread_followed_by`
--

LOCK TABLES `askbot_thread_followed_by` WRITE;
/*!40000 ALTER TABLE `askbot_thread_followed_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_thread_followed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_thread_groups`
--

DROP TABLE IF EXISTS `askbot_thread_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_thread_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `visibility` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thread_id` (`thread_id`,`group_id`),
  KEY `askbot_thr_group_id_7f6e8f5b1c1725a_fk_askbot_group_group_ptr_id` (`group_id`),
  CONSTRAINT `askbot_thr_group_id_7f6e8f5b1c1725a_fk_askbot_group_group_ptr_id` FOREIGN KEY (`group_id`) REFERENCES `askbot_group` (`group_ptr_id`),
  CONSTRAINT `askbot_thread_gro_thread_id_2759b182beed6974_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_thread_groups`
--

LOCK TABLES `askbot_thread_groups` WRITE;
/*!40000 ALTER TABLE `askbot_thread_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_thread_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_thread_tags`
--

DROP TABLE IF EXISTS `askbot_thread_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_thread_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `thread_id` (`thread_id`,`tag_id`),
  KEY `askbot_thread_tags_tag_id_1ddaa1152a86841c_fk_tag_id` (`tag_id`),
  CONSTRAINT `askbot_thread_tag_thread_id_2cd0dd3dae53e015_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`),
  CONSTRAINT `askbot_thread_tags_tag_id_1ddaa1152a86841c_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_thread_tags`
--

LOCK TABLES `askbot_thread_tags` WRITE;
/*!40000 ALTER TABLE `askbot_thread_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_thread_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `askbot_userprofile`
--

DROP TABLE IF EXISTS `askbot_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `askbot_userprofile` (
  `auth_user_ptr_id` int(11) NOT NULL,
  `avatar_urls` longtext NOT NULL,
  `status` varchar(2) NOT NULL,
  `is_fake` tinyint(1) NOT NULL,
  `email_isvalid` tinyint(1) NOT NULL,
  `email_key` varchar(32) DEFAULT NULL,
  `reputation` int(10) unsigned NOT NULL,
  `gravatar` varchar(32) NOT NULL,
  `avatar_type` varchar(1) NOT NULL,
  `gold` smallint(6) NOT NULL,
  `silver` smallint(6) NOT NULL,
  `bronze` smallint(6) NOT NULL,
  `last_seen` datetime(6) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `website` varchar(200) NOT NULL,
  `location` varchar(100) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `show_country` tinyint(1) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `interesting_tags` longtext NOT NULL,
  `ignored_tags` longtext NOT NULL,
  `subscribed_tags` longtext NOT NULL,
  `email_signature` longtext NOT NULL,
  `show_marked_tags` tinyint(1) NOT NULL,
  `email_tag_filter_strategy` smallint(6) NOT NULL,
  `display_tag_filter_strategy` smallint(6) NOT NULL,
  `new_response_count` int(11) NOT NULL,
  `seen_response_count` int(11) NOT NULL,
  `consecutive_days_visit_count` int(11) NOT NULL,
  `languages` varchar(128) NOT NULL,
  `primary_language` varchar(16) NOT NULL,
  `twitter_access_token` varchar(256) NOT NULL,
  `twitter_handle` varchar(32) NOT NULL,
  `social_sharing_mode` int(11) NOT NULL,
  PRIMARY KEY (`auth_user_ptr_id`),
  KEY `askbot_userprofile_9acb4454` (`status`),
  KEY `askbot_userprofile_6fed0ce6` (`reputation`),
  CONSTRAINT `askbot_userprof_auth_user_ptr_id_7c53ababcd6ca2f_fk_auth_user_id` FOREIGN KEY (`auth_user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `askbot_userprofile`
--

LOCK TABLES `askbot_userprofile` WRITE;
/*!40000 ALTER TABLE `askbot_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `askbot_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add tag',8,'add_tag'),(23,'Can change tag',8,'change_tag'),(24,'Can delete tag',8,'delete_tag'),(25,'Can add marked tag',9,'add_markedtag'),(26,'Can change marked tag',9,'change_markedtag'),(27,'Can delete marked tag',9,'delete_markedtag'),(28,'Can add tag synonym',10,'add_tagsynonym'),(29,'Can change tag synonym',10,'change_tagsynonym'),(30,'Can delete tag synonym',10,'delete_tagsynonym'),(31,'Can add activity audit status',11,'add_activityauditstatus'),(32,'Can change activity audit status',11,'change_activityauditstatus'),(33,'Can delete activity audit status',11,'delete_activityauditstatus'),(34,'Can add activity',12,'add_activity'),(35,'Can change activity',12,'change_activity'),(36,'Can delete activity',12,'delete_activity'),(37,'Can add email feed setting',13,'add_emailfeedsetting'),(38,'Can change email feed setting',13,'change_emailfeedsetting'),(39,'Can delete email feed setting',13,'delete_emailfeedsetting'),(40,'Can add group membership',14,'add_groupmembership'),(41,'Can change group membership',14,'change_groupmembership'),(42,'Can delete group membership',14,'delete_groupmembership'),(43,'Can add group',15,'add_group'),(44,'Can change group',15,'change_group'),(45,'Can delete group',15,'delete_group'),(46,'Can add bulk tag subscription',16,'add_bulktagsubscription'),(47,'Can change bulk tag subscription',16,'change_bulktagsubscription'),(48,'Can delete bulk tag subscription',16,'delete_bulktagsubscription'),(49,'Can add thread to group',17,'add_threadtogroup'),(50,'Can change thread to group',17,'change_threadtogroup'),(51,'Can delete thread to group',17,'delete_threadtogroup'),(52,'Can add thread',18,'add_thread'),(53,'Can change thread',18,'change_thread'),(54,'Can delete thread',18,'delete_thread'),(55,'Can add question view',19,'add_questionview'),(56,'Can change question view',19,'change_questionview'),(57,'Can delete question view',19,'delete_questionview'),(58,'Can add favorite question',20,'add_favoritequestion'),(59,'Can change favorite question',20,'change_favoritequestion'),(60,'Can delete favorite question',20,'delete_favoritequestion'),(61,'Can add draft question',21,'add_draftquestion'),(62,'Can change draft question',21,'change_draftquestion'),(63,'Can delete draft question',21,'delete_draftquestion'),(64,'Can add anonymous question',22,'add_anonymousquestion'),(65,'Can change anonymous question',22,'change_anonymousquestion'),(66,'Can delete anonymous question',22,'delete_anonymousquestion'),(67,'Can add message',23,'add_message'),(68,'Can change message',23,'change_message'),(69,'Can delete message',23,'delete_message'),(70,'Can add post to group',24,'add_posttogroup'),(71,'Can change post to group',24,'change_posttogroup'),(72,'Can delete post to group',24,'delete_posttogroup'),(73,'Can add post',25,'add_post'),(74,'Can change post',25,'change_post'),(75,'Can delete post',25,'delete_post'),(76,'Can add post revision',26,'add_postrevision'),(77,'Can change post revision',26,'change_postrevision'),(78,'Can delete post revision',26,'delete_postrevision'),(79,'Can add post flag reason',27,'add_postflagreason'),(80,'Can change post flag reason',27,'change_postflagreason'),(81,'Can delete post flag reason',27,'delete_postflagreason'),(82,'Can add draft answer',28,'add_draftanswer'),(83,'Can change draft answer',28,'change_draftanswer'),(84,'Can delete draft answer',28,'delete_draftanswer'),(85,'Can add anonymous answer',29,'add_anonymousanswer'),(86,'Can change anonymous answer',29,'change_anonymousanswer'),(87,'Can delete anonymous answer',29,'delete_anonymousanswer'),(88,'Can add user profile',30,'add_userprofile'),(89,'Can change user profile',30,'change_userprofile'),(90,'Can delete user profile',30,'delete_userprofile'),(91,'Can add localized user profile',31,'add_localizeduserprofile'),(92,'Can change localized user profile',31,'change_localizeduserprofile'),(93,'Can delete localized user profile',31,'delete_localizeduserprofile'),(94,'Can add reply address',32,'add_replyaddress'),(95,'Can change reply address',32,'change_replyaddress'),(96,'Can delete reply address',32,'delete_replyaddress'),(97,'Can add vote',33,'add_vote'),(98,'Can change vote',33,'change_vote'),(99,'Can delete vote',33,'delete_vote'),(100,'Can add badge data',34,'add_badgedata'),(101,'Can change badge data',34,'change_badgedata'),(102,'Can delete badge data',34,'delete_badgedata'),(103,'Can add award',35,'add_award'),(104,'Can change award',35,'change_award'),(105,'Can delete award',35,'delete_award'),(106,'Can add repute',36,'add_repute'),(107,'Can change repute',36,'change_repute'),(108,'Can delete repute',36,'delete_repute'),(109,'Can add ask widget',37,'add_askwidget'),(110,'Can change ask widget',37,'change_askwidget'),(111,'Can delete ask widget',37,'delete_askwidget'),(112,'Can add question widget',38,'add_questionwidget'),(113,'Can change question widget',38,'change_questionwidget'),(114,'Can delete question widget',38,'delete_questionwidget'),(115,'Can add import run',39,'add_importrun'),(116,'Can change import run',39,'change_importrun'),(117,'Can delete import run',39,'delete_importrun'),(118,'Can add imported object info',40,'add_importedobjectinfo'),(119,'Can change imported object info',40,'change_importedobjectinfo'),(120,'Can delete imported object info',40,'delete_importedobjectinfo'),(121,'Can add role',41,'add_role'),(122,'Can change role',41,'change_role'),(123,'Can delete role',41,'delete_role'),(124,'Can add nonce',42,'add_nonce'),(125,'Can change nonce',42,'change_nonce'),(126,'Can delete nonce',42,'delete_nonce'),(127,'Can add association',43,'add_association'),(128,'Can change association',43,'change_association'),(129,'Can delete association',43,'delete_association'),(130,'Can add user association',44,'add_userassociation'),(131,'Can change user association',44,'change_userassociation'),(132,'Can delete user association',44,'delete_userassociation'),(133,'Can add user password queue',45,'add_userpasswordqueue'),(134,'Can change user password queue',45,'change_userpasswordqueue'),(135,'Can delete user password queue',45,'delete_userpasswordqueue'),(136,'Can add user email verifier',46,'add_useremailverifier'),(137,'Can change user email verifier',46,'change_useremailverifier'),(138,'Can delete user email verifier',46,'delete_useremailverifier'),(139,'Can add setting',47,'add_setting'),(140,'Can change setting',47,'change_setting'),(141,'Can delete setting',47,'delete_setting'),(142,'Can add long setting',48,'add_longsetting'),(143,'Can change long setting',48,'change_longsetting'),(144,'Can delete long setting',48,'delete_longsetting'),(145,'Can add url',49,'add_url'),(146,'Can change url',49,'change_url'),(147,'Can delete url',49,'delete_url'),(148,'Can add rule',50,'add_rule'),(149,'Can change rule',50,'change_rule'),(150,'Can delete rule',50,'delete_rule'),(151,'Can add task state',51,'add_taskmeta'),(152,'Can change task state',51,'change_taskmeta'),(153,'Can delete task state',51,'delete_taskmeta'),(154,'Can add saved group result',52,'add_tasksetmeta'),(155,'Can change saved group result',52,'change_tasksetmeta'),(156,'Can delete saved group result',52,'delete_tasksetmeta'),(157,'Can add interval',53,'add_intervalschedule'),(158,'Can change interval',53,'change_intervalschedule'),(159,'Can delete interval',53,'delete_intervalschedule'),(160,'Can add crontab',54,'add_crontabschedule'),(161,'Can change crontab',54,'change_crontabschedule'),(162,'Can delete crontab',54,'delete_crontabschedule'),(163,'Can add periodic tasks',55,'add_periodictasks'),(164,'Can change periodic tasks',55,'change_periodictasks'),(165,'Can delete periodic tasks',55,'delete_periodictasks'),(166,'Can add periodic task',56,'add_periodictask'),(167,'Can change periodic task',56,'change_periodictask'),(168,'Can delete periodic task',56,'delete_periodictask'),(169,'Can add worker',57,'add_workerstate'),(170,'Can change worker',57,'change_workerstate'),(171,'Can delete worker',57,'delete_workerstate'),(172,'Can add task',58,'add_taskstate'),(173,'Can change task',58,'change_taskstate'),(174,'Can delete task',58,'delete_taskstate'),(175,'Can add queue',59,'add_queue'),(176,'Can change queue',59,'change_queue'),(177,'Can delete queue',59,'delete_queue'),(178,'Can add message',60,'add_message'),(179,'Can change message',60,'change_message'),(180,'Can delete message',60,'delete_message'),(181,'Can add follow record',61,'add_followrecord'),(182,'Can change follow record',61,'change_followrecord'),(183,'Can delete follow record',61,'delete_followrecord'),(184,'Can add last visit time',62,'add_lastvisittime'),(185,'Can change last visit time',62,'change_lastvisittime'),(186,'Can delete last visit time',62,'delete_lastvisittime'),(187,'Can add sender list',63,'add_senderlist'),(188,'Can change sender list',63,'change_senderlist'),(189,'Can delete sender list',63,'delete_senderlist'),(190,'Can add message memo',64,'add_messagememo'),(191,'Can change message memo',64,'change_messagememo'),(192,'Can delete message memo',64,'delete_messagememo'),(193,'Can add message',65,'add_message'),(194,'Can change message',65,'change_message'),(195,'Can delete message',65,'delete_message'),(196,'Can add unread inbox counter',66,'add_unreadinboxcounter'),(197,'Can change unread inbox counter',66,'change_unreadinboxcounter'),(198,'Can delete unread inbox counter',66,'delete_unreadinboxcounter'),(199,'Can add avatar',67,'add_avatar'),(200,'Can change avatar',67,'change_avatar'),(201,'Can delete avatar',67,'delete_avatar');
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
  `username` varchar(30) NOT NULL,
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `avatar_avatar`
--

DROP TABLE IF EXISTS `avatar_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `avatar_avatar_user_id_341d933ad2f6973_fk_auth_user_id` (`user_id`),
  CONSTRAINT `avatar_avatar_user_id_341d933ad2f6973_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_avatar`
--

LOCK TABLES `avatar_avatar` WRITE;
/*!40000 ALTER TABLE `avatar_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `avatar_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `awarded_at` datetime(6) NOT NULL,
  `notified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `award_user_id_e28cab9f6aa1aa9_fk_auth_user_id` (`user_id`),
  KEY `award_badge_id_3d3a9dcdd50e0ea8_fk_askbot_badgedata_id` (`badge_id`),
  KEY `award_content_type_id_3c60187ff9ad857a_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `award_badge_id_3d3a9dcdd50e0ea8_fk_askbot_badgedata_id` FOREIGN KEY (`badge_id`) REFERENCES `askbot_badgedata` (`id`),
  CONSTRAINT `award_content_type_id_3c60187ff9ad857a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `award_user_id_e28cab9f6aa1aa9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `django_authopenid_association`
--

DROP TABLE IF EXISTS `django_authopenid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_association`
--

LOCK TABLES `django_authopenid_association` WRITE;
/*!40000 ALTER TABLE `django_authopenid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_nonce`
--

DROP TABLE IF EXISTS `django_authopenid_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_nonce`
--

LOCK TABLES `django_authopenid_nonce` WRITE;
/*!40000 ALTER TABLE `django_authopenid_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_userassociation`
--

DROP TABLE IF EXISTS `django_authopenid_userassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_userassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid_url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_name` varchar(64) NOT NULL,
  `last_used_timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`provider_name`),
  UNIQUE KEY `openid_url` (`openid_url`,`provider_name`),
  CONSTRAINT `django_authopenid_usera_user_id_2766269e7fd5270c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_userassociation`
--

LOCK TABLES `django_authopenid_userassociation` WRITE;
/*!40000 ALTER TABLE `django_authopenid_userassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_userassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_useremailverifier`
--

DROP TABLE IF EXISTS `django_authopenid_useremailverifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_useremailverifier` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `expires_on` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_useremailverifier`
--

LOCK TABLES `django_authopenid_useremailverifier` WRITE;
/*!40000 ALTER TABLE `django_authopenid_useremailverifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_useremailverifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_authopenid_userpasswordqueue`
--

DROP TABLE IF EXISTS `django_authopenid_userpasswordqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_authopenid_userpasswordqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `new_password` varchar(30) NOT NULL,
  `confirm_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `django_authopenid_userp_user_id_1fe5f55052dad8e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_authopenid_userpasswordqueue`
--

LOCK TABLES `django_authopenid_userpasswordqueue` WRITE;
/*!40000 ALTER TABLE `django_authopenid_userpasswordqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_authopenid_userpasswordqueue` ENABLE KEYS */;
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
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(12,'askbot','activity'),(11,'askbot','activityauditstatus'),(29,'askbot','anonymousanswer'),(22,'askbot','anonymousquestion'),(37,'askbot','askwidget'),(35,'askbot','award'),(34,'askbot','badgedata'),(16,'askbot','bulktagsubscription'),(28,'askbot','draftanswer'),(21,'askbot','draftquestion'),(13,'askbot','emailfeedsetting'),(20,'askbot','favoritequestion'),(15,'askbot','group'),(14,'askbot','groupmembership'),(40,'askbot','importedobjectinfo'),(39,'askbot','importrun'),(31,'askbot','localizeduserprofile'),(9,'askbot','markedtag'),(23,'askbot','message'),(25,'askbot','post'),(27,'askbot','postflagreason'),(26,'askbot','postrevision'),(24,'askbot','posttogroup'),(19,'askbot','questionview'),(38,'askbot','questionwidget'),(32,'askbot','replyaddress'),(36,'askbot','repute'),(41,'askbot','role'),(8,'askbot','tag'),(10,'askbot','tagsynonym'),(18,'askbot','thread'),(17,'askbot','threadtogroup'),(30,'askbot','userprofile'),(33,'askbot','vote'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(67,'avatar','avatar'),(4,'contenttypes','contenttype'),(43,'django_authopenid','association'),(42,'django_authopenid','nonce'),(44,'django_authopenid','userassociation'),(46,'django_authopenid','useremailverifier'),(45,'django_authopenid','userpasswordqueue'),(54,'djcelery','crontabschedule'),(53,'djcelery','intervalschedule'),(56,'djcelery','periodictask'),(55,'djcelery','periodictasks'),(51,'djcelery','taskmeta'),(52,'djcelery','tasksetmeta'),(58,'djcelery','taskstate'),(57,'djcelery','workerstate'),(60,'djkombu','message'),(59,'djkombu','queue'),(61,'followit','followrecord'),(62,'group_messaging','lastvisittime'),(65,'group_messaging','message'),(64,'group_messaging','messagememo'),(63,'group_messaging','senderlist'),(66,'group_messaging','unreadinboxcounter'),(48,'livesettings','longsetting'),(47,'livesettings','setting'),(50,'robots','rule'),(49,'robots','url'),(5,'sessions','session'),(6,'sites','site');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a9bs84n6lrfo5d88bxwiks8p2ngltrv2','ZDMxZWNjMWU3OWNmZDdkMzAwOTgxM2M3NmNiMjNkMGQyM2FmYjQzNjqAAn1xAShVE2Fza2JvdF93cml0ZV9pbnRlbnRxAohVDGdyZWV0aW5nX3NldIh1Lg==','2020-06-19 22:42:45.741470'),('fp2t308dkpkhcsr664kc1smgjzu2ahxe','ZmY4OWJkYzJiZTVkMWUwNjA5MzQ4YWI4ZWJjZDEzNjJjMWFlNjM5YjqAAn1xAVUMZ3JlZXRpbmdfc2V0cQKIcy4=','2020-06-19 22:43:15.504065'),('unqzyxbqo1qgmdhbag4vr7egms58lf6r','MzRjNjBjMjQ0MjJjODZjMGFiNDQ2ZmYyMDJhMGQ5Y2RlZmFjYjFjNDqAAn1xAVUMZ3JlZXRpbmdfc2V0iHMu','2020-06-22 09:46:27.084550');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djc_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id` (`interval_id`),
  KEY `djcel_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id` (`crontab_id`),
  CONSTRAINT `djc_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`),
  CONSTRAINT `djcel_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime(6) NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime(6) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_t_worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id` (`worker_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  CONSTRAINT `djcelery_t_worker_id_30050731b1c3d3d9_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_message`
--

DROP TABLE IF EXISTS `djkombu_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(1) NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `payload` longtext NOT NULL,
  `queue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djkombu_message_queue_id_12778caea7843dd_fk_djkombu_queue_id` (`queue_id`),
  KEY `djkombu_message_46cf0e59` (`visible`),
  KEY `djkombu_message_df2f2974` (`sent_at`),
  CONSTRAINT `djkombu_message_queue_id_12778caea7843dd_fk_djkombu_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `djkombu_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_message`
--

LOCK TABLES `djkombu_message` WRITE;
/*!40000 ALTER TABLE `djkombu_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djkombu_queue`
--

DROP TABLE IF EXISTS `djkombu_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djkombu_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djkombu_queue`
--

LOCK TABLES `djkombu_queue` WRITE;
/*!40000 ALTER TABLE `djkombu_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `djkombu_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_question`
--

DROP TABLE IF EXISTS `favorite_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_question_thread_id_e68e2e682113396_fk_askbot_thread_id` (`thread_id`),
  KEY `favorite_question_user_id_4b77ba54f2bdfbab_fk_auth_user_id` (`user_id`),
  CONSTRAINT `favorite_question_thread_id_e68e2e682113396_fk_askbot_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `askbot_thread` (`id`),
  CONSTRAINT `favorite_question_user_id_4b77ba54f2bdfbab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_question`
--

LOCK TABLES `favorite_question` WRITE;
/*!40000 ALTER TABLE `favorite_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followit_followrecord`
--

DROP TABLE IF EXISTS `followit_followrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followit_followrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `followit_followrecord_user_id_4d023ac3bcd9431d_fk_auth_user_id` (`user_id`),
  KEY `follo_content_type_id_3883ddfb3bfd5d06_fk_django_content_type_id` (`content_type_id`),
  KEY `followit_followrecord_af31437c` (`object_id`),
  CONSTRAINT `follo_content_type_id_3883ddfb3bfd5d06_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `followit_followrecord_user_id_4d023ac3bcd9431d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followit_followrecord`
--

LOCK TABLES `followit_followrecord` WRITE;
/*!40000 ALTER TABLE `followit_followrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `followit_followrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_lastvisittime`
--

DROP TABLE IF EXISTS `group_messaging_lastvisittime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_lastvisittime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`message_id`),
  KEY `group__message_id_5360910c25c9a68e_fk_group_messaging_message_id` (`message_id`),
  CONSTRAINT `group__message_id_5360910c25c9a68e_fk_group_messaging_message_id` FOREIGN KEY (`message_id`) REFERENCES `group_messaging_message` (`id`),
  CONSTRAINT `group_messaging_lastvis_user_id_10670bca00366d0d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_lastvisittime`
--

LOCK TABLES `group_messaging_lastvisittime` WRITE;
/*!40000 ALTER TABLE `group_messaging_lastvisittime` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_lastvisittime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_message`
--

DROP TABLE IF EXISTS `group_messaging_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` smallint(6) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `senders_info` longtext NOT NULL,
  `root_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `headline` varchar(80) NOT NULL,
  `text` longtext,
  `html` longtext,
  `sent_at` datetime(6) NOT NULL,
  `last_active_at` datetime(6) NOT NULL,
  `active_until` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_messaging_messa_sender_id_31ba4a0474820d50_fk_auth_user_id` (`sender_id`),
  KEY `group_mes_root_id_53c5e1b245cf06e5_fk_group_messaging_message_id` (`root_id`),
  KEY `group_me_parent_id_82b21297a4c1991_fk_group_messaging_message_id` (`parent_id`),
  CONSTRAINT `group_me_parent_id_82b21297a4c1991_fk_group_messaging_message_id` FOREIGN KEY (`parent_id`) REFERENCES `group_messaging_message` (`id`),
  CONSTRAINT `group_mes_root_id_53c5e1b245cf06e5_fk_group_messaging_message_id` FOREIGN KEY (`root_id`) REFERENCES `group_messaging_message` (`id`),
  CONSTRAINT `group_messaging_messa_sender_id_31ba4a0474820d50_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_message`
--

LOCK TABLES `group_messaging_message` WRITE;
/*!40000 ALTER TABLE `group_messaging_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_message_recipients`
--

DROP TABLE IF EXISTS `group_messaging_message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_message_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`,`group_id`),
  KEY `group_messaging_messa_group_id_3d417a1846e709a3_fk_auth_group_id` (`group_id`),
  CONSTRAINT `group__message_id_67ba3e95a73a626f_fk_group_messaging_message_id` FOREIGN KEY (`message_id`) REFERENCES `group_messaging_message` (`id`),
  CONSTRAINT `group_messaging_messa_group_id_3d417a1846e709a3_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_message_recipients`
--

LOCK TABLES `group_messaging_message_recipients` WRITE;
/*!40000 ALTER TABLE `group_messaging_message_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_message_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_messagememo`
--

DROP TABLE IF EXISTS `group_messaging_messagememo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_messagememo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`message_id`),
  KEY `group_m_message_id_7237e3af1f5331b_fk_group_messaging_message_id` (`message_id`),
  CONSTRAINT `group_m_message_id_7237e3af1f5331b_fk_group_messaging_message_id` FOREIGN KEY (`message_id`) REFERENCES `group_messaging_message` (`id`),
  CONSTRAINT `group_messaging_message_user_id_5fa17f1f6990601a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_messagememo`
--

LOCK TABLES `group_messaging_messagememo` WRITE;
/*!40000 ALTER TABLE `group_messaging_messagememo` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_messagememo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_senderlist`
--

DROP TABLE IF EXISTS `group_messaging_senderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_senderlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient_id` (`recipient_id`),
  CONSTRAINT `group_messaging_s_recipient_id_55289d156fc65fbc_fk_auth_group_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_senderlist`
--

LOCK TABLES `group_messaging_senderlist` WRITE;
/*!40000 ALTER TABLE `group_messaging_senderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_senderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_senderlist_senders`
--

DROP TABLE IF EXISTS `group_messaging_senderlist_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_senderlist_senders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `senderlist_id` (`senderlist_id`,`user_id`),
  KEY `group_messaging_senderl_user_id_7f22bdfc5658753e_fk_auth_user_id` (`user_id`),
  CONSTRAINT `group_messaging_senderl_user_id_7f22bdfc5658753e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `senderlist_id_64bd9b5455963ce6_fk_group_messaging_senderlist_id` FOREIGN KEY (`senderlist_id`) REFERENCES `group_messaging_senderlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_senderlist_senders`
--

LOCK TABLES `group_messaging_senderlist_senders` WRITE;
/*!40000 ALTER TABLE `group_messaging_senderlist_senders` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_senderlist_senders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messaging_unreadinboxcounter`
--

DROP TABLE IF EXISTS `group_messaging_unreadinboxcounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_messaging_unreadinboxcounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_messaging_unreadi_user_id_6df42bcdfd2f27e1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `group_messaging_unreadi_user_id_6df42bcdfd2f27e1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messaging_unreadinboxcounter`
--

LOCK TABLES `group_messaging_unreadinboxcounter` WRITE;
/*!40000 ALTER TABLE `group_messaging_unreadinboxcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messaging_unreadinboxcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livesettings_longsetting`
--

DROP TABLE IF EXISTS `livesettings_longsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livesettings_longsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  CONSTRAINT `livesettings_longsett_site_id_660ab2e2164a4fbf_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livesettings_longsetting`
--

LOCK TABLES `livesettings_longsetting` WRITE;
/*!40000 ALTER TABLE `livesettings_longsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `livesettings_longsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livesettings_setting`
--

DROP TABLE IF EXISTS `livesettings_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livesettings_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `group` varchar(100) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`group`,`key`),
  CONSTRAINT `livesettings_setting_site_id_63ace60c1a7adf07_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livesettings_setting`
--

LOCK TABLES `livesettings_setting` WRITE;
/*!40000 ALTER TABLE `livesettings_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `livesettings_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repute`
--

DROP TABLE IF EXISTS `repute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `positive` smallint(6) NOT NULL,
  `negative` smallint(6) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `language_code` varchar(16) NOT NULL,
  `reputed_at` datetime(6) NOT NULL,
  `reputation_type` smallint(6) NOT NULL,
  `reputation` int(11) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repute_user_id_224c155a7e1e3166_fk_auth_user_id` (`user_id`),
  KEY `repute_question_id_49ab7c44f8d192f9_fk_askbot_post_id` (`question_id`),
  CONSTRAINT `repute_question_id_49ab7c44f8d192f9_fk_askbot_post_id` FOREIGN KEY (`question_id`) REFERENCES `askbot_post` (`id`),
  CONSTRAINT `repute_user_id_224c155a7e1e3166_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repute`
--

LOCK TABLES `repute` WRITE;
/*!40000 ALTER TABLE `repute` DISABLE KEYS */;
/*!40000 ALTER TABLE `repute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule`
--

DROP TABLE IF EXISTS `robots_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `robot` varchar(255) NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule`
--

LOCK TABLES `robots_rule` WRITE;
/*!40000 ALTER TABLE `robots_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_allowed`
--

DROP TABLE IF EXISTS `robots_rule_allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`url_id`),
  KEY `robots_rule_allowed_url_id_24e75e80d27a928_fk_robots_url_id` (`url_id`),
  CONSTRAINT `robots_rule_allowed_rule_id_b79a8840929e6aa_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  CONSTRAINT `robots_rule_allowed_url_id_24e75e80d27a928_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_allowed`
--

LOCK TABLES `robots_rule_allowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_allowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_disallowed`
--

DROP TABLE IF EXISTS `robots_rule_disallowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_disallowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`url_id`),
  KEY `robots_rule_disallowed_url_id_2f1c369bbebea01d_fk_robots_url_id` (`url_id`),
  CONSTRAINT `robots_rule_disallowe_rule_id_50048ff97fa79eef_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  CONSTRAINT `robots_rule_disallowed_url_id_2f1c369bbebea01d_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_disallowed`
--

LOCK TABLES `robots_rule_disallowed` WRITE;
/*!40000 ALTER TABLE `robots_rule_disallowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_disallowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_rule_sites`
--

DROP TABLE IF EXISTS `robots_rule_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_rule_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`site_id`),
  KEY `robots_rule_sites_site_id_3274a4d8ebfc398f_fk_django_site_id` (`site_id`),
  CONSTRAINT `robots_rule_sites_rule_id_55fc54e5f62b7264_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  CONSTRAINT `robots_rule_sites_site_id_3274a4d8ebfc398f_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_rule_sites`
--

LOCK TABLES `robots_rule_sites` WRITE;
/*!40000 ALTER TABLE `robots_rule_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_rule_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_url`
--

DROP TABLE IF EXISTS `robots_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robots_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_url`
--

LOCK TABLES `robots_url` WRITE;
/*!40000 ALTER TABLE `robots_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `language_code` varchar(16) NOT NULL,
  `status` smallint(6) NOT NULL,
  `used_count` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by_id` int(11) DEFAULT NULL,
  `tag_wiki_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`language_code`),
  UNIQUE KEY `tag_wiki_id` (`tag_wiki_id`),
  KEY `tag_created_by_id_3ca9f308246b2b6d_fk_auth_user_id` (`created_by_id`),
  KEY `tag_deleted_by_id_62bd76a077b1806e_fk_auth_user_id` (`deleted_by_id`),
  CONSTRAINT `tag_created_by_id_3ca9f308246b2b6d_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `tag_deleted_by_id_62bd76a077b1806e_fk_auth_user_id` FOREIGN KEY (`deleted_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `tag_tag_wiki_id_24b2e78fd9168ee2_fk_askbot_post_id` FOREIGN KEY (`tag_wiki_id`) REFERENCES `askbot_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_suggested_by`
--

DROP TABLE IF EXISTS `tag_suggested_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_suggested_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_id` (`tag_id`,`user_id`),
  KEY `tag_suggested_by_user_id_10209ba709263739_fk_auth_user_id` (`user_id`),
  CONSTRAINT `tag_suggested_by_tag_id_4afd9044707fbac7_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `tag_suggested_by_user_id_10209ba709263739_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_suggested_by`
--

LOCK TABLES `tag_suggested_by` WRITE;
/*!40000 ALTER TABLE `tag_suggested_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_suggested_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `voted_post_id` int(11) NOT NULL,
  `vote` smallint(6) NOT NULL,
  `voted_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`voted_post_id`),
  KEY `vote_voted_post_id_43ce4eda228931d5_fk_askbot_post_id` (`voted_post_id`),
  CONSTRAINT `vote_user_id_764ab9ef88841f91_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `vote_voted_post_id_43ce4eda228931d5_fk_askbot_post_id` FOREIGN KEY (`voted_post_id`) REFERENCES `askbot_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08 14:49:08
