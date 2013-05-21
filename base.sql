-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: instance
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1

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
-- Table structure for table `cms_actions`
--

DROP TABLE IF EXISTS `cms_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_tracked` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`is_visible`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_actions`
--

LOCK TABLES `cms_actions` WRITE;
/*!40000 ALTER TABLE `cms_actions` DISABLE KEYS */;
INSERT INTO `cms_actions` VALUES (2,'comments','add_comment','Добавление комментария','добавляет %s| на странице %s',1,1),(7,'photos','add_photo','Добавление фото','добавляет фото %s| в альбом %s',1,1),(8,'content','add_article','Добавление статьи','добавляет статью %s| в раздел %s',1,1),(9,'blogs','add_blog','Создание блога пользователем','создает блог %s|',1,1),(10,'blogs','add_post','Добавление записи в блог','пишет пост %s| в блоге %s',1,1),(11,'users','set_status','Изменение статуса пользователя','',1,1),(12,'board','add_board','Добавление объявления','добавляет объявление %s| в рубрику %s',1,1),(13,'catalog','add_catalog','Добавление записи в каталог','добавляет запись %s| в рубрику каталога %s',1,1),(14,'clubs','add_club','Создание клуба','создает клуб %s|',1,1),(15,'clubs','add_club_user','Вступление в клуб','вступает в клуб %s|',1,1),(16,'faq','add_quest','Вопрос','задает %s| в категории %s',1,1),(17,'forum','add_fpost','Добавление поста в форуме','добавляет %s| в теме %s',1,1),(18,'forum','add_thread','Добавление темы на форуме','создает тему %s| на форуме %s',1,1),(19,'users','add_avatar','Загрузка или смена аватара пользователем','изменяет аватар|',1,1),(20,'users','add_friend','Добавление друга','и %s стали друзьями|',1,1),(21,'users','add_award','Получение награды пользователем','получает награду %s|',1,1),(22,'users','add_file','Загрузка файла пользователем','загружает файл %s|',1,1),(23,'users','add_wall','Добавление записи на стену','добавляет запись на стене пользователя %s|',1,1),(24,'clubs','add_wall_club','Добавление записи на стену клуба','добавляет запись на стене клуба %s|',1,1),(25,'clubs','add_post_club','Добавление записи в блог клуба','пишет пост %s| в блоге клуба %s',1,1),(26,'users','add_user_photo','Добавление фото в личный альбом','добавляет фото %s| в альбом %s',1,1),(27,'users','add_user_photo_multi','Добавление много фоток в личный альбом','добавляет %s фото| в альбом %s',1,1),(28,'registration','add_user','Регистрация нового пользователя','регистрируется. Приветствуем!|',1,1),(29,'users','add_wall_my','Добавление записи на свою стену','пишет на своей стене|	',1,1),(30,'clubs','add_photo_club','Добавление фото в альбом клуба','добавляет фото %s| в альбом клуба %s',1,1);
/*!40000 ALTER TABLE `cms_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_actions_log`
--

DROP TABLE IF EXISTS `cms_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_actions_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `object` varchar(100) NOT NULL,
  `object_url` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `target` varchar(100) NOT NULL,
  `target_url` varchar(255) NOT NULL,
  `target_id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_friends_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_users_only` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`,`user_id`),
  KEY `object_id` (`object_id`),
  KEY `target_id` (`target_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_actions_log`
--

LOCK TABLES `cms_actions_log` WRITE;
/*!40000 ALTER TABLE `cms_actions_log` DISABLE KEYS */;
INSERT INTO `cms_actions_log` VALUES (2,11,'2012-07-13 23:09:34',2,'','',0,'','',0,'I love InstantCMS',0,0),(3,2,'2012-07-13 23:11:00',2,'комментарий','/stati/marketing/yelastichnost-sprosa.html#c13',13,'Эластичность спроса','/stati/marketing/yelastichnost-sprosa.html',0,'Спасибо автору за такую отличную статью!',0,0),(4,27,'2012-07-13 23:13:37',1,'2','',0,'Мои картинки','/users/admin/photos/private5.html',5,' <a href=\"/users/1/photo6.html\" class=\"act_photo\">\r\n											<img border=\"0\" src=\"/images/users/photos/small/b22c5c0f95c1fb9398578fd5e396c7dd.jpg\" />\r\n									</a>  <a href=\"/users/1/photo7.html\" class=\"act_photo\">\r\n											<img border=\"0\" src=\"/images/users/photos/small/efe8d13779cd84cfeb319d9f0875a511.jpg\" />\r\n									</a> ',0,0),(5,20,'2012-07-13 23:18:39',3,'Администратор','/users/admin',11,'','',0,'',0,0),(6,2,'2012-07-13 23:19:19',3,'комментарий','/stati/marketing/yelastichnost-sprosa.html#c14',14,'Эластичность спроса','/stati/marketing/yelastichnost-sprosa.html',0,'Полностью согласен с Вами, коллега.',0,0),(7,15,'2012-07-13 23:21:43',3,'Клуб любителей InstantCMS','/clubs/14',14,'','',0,'',0,0);
/*!40000 ALTER TABLE `cms_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banlist`
--

DROP TABLE IF EXISTS `cms_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `bandate` datetime NOT NULL,
  `int_num` int(11) NOT NULL,
  `int_period` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `autodelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banlist`
--

LOCK TABLES `cms_banlist` WRITE;
/*!40000 ALTER TABLE `cms_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banner_hits`
--

DROP TABLE IF EXISTS `cms_banner_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banner_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `pubdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banner_hits`
--

LOCK TABLES `cms_banner_hits` WRITE;
/*!40000 ALTER TABLE `cms_banner_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_banner_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banners`
--

DROP TABLE IF EXISTS `cms_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) NOT NULL DEFAULT 'banner_top',
  `typeimg` varchar(10) NOT NULL DEFAULT 'image',
  `fileurl` varchar(250) DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `maxhits` int(11) NOT NULL,
  `maxuser` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `pubdate` datetime DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banners`
--

LOCK TABLES `cms_banners` WRITE;
/*!40000 ALTER TABLE `cms_banners` DISABLE KEYS */;
INSERT INTO `cms_banners` VALUES (4,'banner1','image','banner468x60v1.gif',0,0,0,0,1,'2012-04-04 19:43:53','InstantCMS - Бесплатная система управления сайтом','http://www.instantcms.ru/',1);
/*!40000 ALTER TABLE `cms_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_authors`
--

DROP TABLE IF EXISTS `cms_blog_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `startdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_authors`
--

LOCK TABLES `cms_blog_authors` WRITE;
/*!40000 ALTER TABLE `cms_blog_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_cats`
--

DROP TABLE IF EXISTS `cms_blog_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_cats`
--

LOCK TABLES `cms_blog_cats` WRITE;
/*!40000 ALTER TABLE `cms_blog_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_posts`
--

DROP TABLE IF EXISTS `cms_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `feel` varchar(100) NOT NULL,
  `music` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `allow_who` varchar(20) NOT NULL,
  `edit_times` int(11) NOT NULL DEFAULT '0',
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `seolink` varchar(255) NOT NULL,
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `content_html` (`content_html`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_posts`
--

LOCK TABLES `cms_blog_posts` WRITE;
/*!40000 ALTER TABLE `cms_blog_posts` DISABLE KEYS */;
INSERT INTO `cms_blog_posts` VALUES (5,1,5,1,'2012-09-07 11:50:16','Пример записи в блоге','','','[b]Блоги InstantCMS - это мощный и надежный инструмент для ваших публикаций:[/b]\r\n\r\n- Редактор BB-кода (скрытый текст, ссылки, цитаты, картинки);\r\n- Вставка изображений \"на лету\";\r\n- Неограниченное число рубрик;\r\n- Комментарии к записям;\r\n- Возможность ведения коллективных блогов;\r\n- Смайлы и теги;','<b>Блоги InstantCMS - это мощный и надежный инструмент для ваших публикаций:</b><br />\r\n<br />\r\n- Редактор BB-кода (скрытый текст, ссылки, цитаты, картинки);<br />\r\n- Вставка изображений \"на лету\";<br />\r\n- Неограниченное число рубрик;<br />\r\n- Комментарии к записям;<br />\r\n- Возможность ведения коллективных блогов;<br />\r\n- Смайлы и теги;','all',3,'2012-07-07 08:50:16',1,'primer-zapisi-v-bloge',1,0,0);
/*!40000 ALTER TABLE `cms_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blogs`
--

DROP TABLE IF EXISTS `cms_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `allow_who` varchar(15) NOT NULL,
  `view_type` varchar(15) NOT NULL DEFAULT 'list',
  `showcats` tinyint(1) NOT NULL DEFAULT '1',
  `ownertype` varchar(15) NOT NULL DEFAULT 'single',
  `premod` tinyint(1) NOT NULL DEFAULT '0',
  `forall` tinyint(1) NOT NULL DEFAULT '0',
  `owner` varchar(10) NOT NULL DEFAULT 'user',
  `seolink` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`),
  KEY `user_id` (`user_id`),
  KEY `pubdate` (`pubdate`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blogs`
--

LOCK TABLES `cms_blogs` WRITE;
/*!40000 ALTER TABLE `cms_blogs` DISABLE KEYS */;
INSERT INTO `cms_blogs` VALUES (1,1,'Пример блога админа','2012-06-03 10:26:55','all','list',1,'single',0,1,'user','primer-bloga-admina',0,0),(24,14,'Блог клуба любителей InstantCMS','2012-07-19 21:02:41','all','list',1,'multi',0,0,'club','instantcms-lovers',0,0);
/*!40000 ALTER TABLE `cms_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_board_cats`
--

DROP TABLE IF EXISTS `cms_board_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_board_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSDiffer` varchar(15) NOT NULL,
  `NSIgnore` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `orderform` tinyint(1) DEFAULT '1',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `orderby` varchar(20) NOT NULL DEFAULT 'title',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `public` tinyint(1) NOT NULL,
  `perpage` int(11) NOT NULL DEFAULT '15',
  `maxcols` int(11) NOT NULL DEFAULT '1',
  `thumb1` int(11) NOT NULL DEFAULT '64',
  `thumb2` int(11) NOT NULL DEFAULT '400',
  `thumbsqr` int(11) NOT NULL,
  `uplimit` int(11) NOT NULL DEFAULT '10',
  `is_photos` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(200) DEFAULT 'folder_grey.png',
  `obtypes` text NOT NULL,
  `form_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_board_cats`
--

LOCK TABLES `cms_board_cats` WRITE;
/*!40000 ALTER TABLE `cms_board_cats` DISABLE KEYS */;
INSERT INTO `cms_board_cats` VALUES (1,0,1,1,8,'',0,0,'-- Корневая рубрика --','',1,1,1,'2012-07-22 13:39:32','pubdate','desc',0,15,1,64,400,0,10,1,'folder_grey.png','',0),(10,1,21,2,3,'',0,1,'Услуги','',1,1,1,'2012-07-22 14:30:29','pubdate','desc',-1,20,1,64,400,0,10,1,'folder_grey.png','Предлагаю\r\nТребуется',0),(9,1,23,6,7,'',0,1,'Автомобили','',1,1,1,'2012-07-22 14:30:23','pubdate','desc',-1,20,1,64,400,0,10,1,'folder_grey.png','Куплю\r\nПродам\r\nОбменяю',0),(8,1,22,4,5,'',0,1,'Недвижимость','',1,1,1,'2012-07-22 14:30:00','pubdate','desc',-1,20,1,64,400,0,10,1,'folder_grey.png','Продам\r\nКуплю\r\nОбменяю\r\nСдам\r\nСниму',0);
/*!40000 ALTER TABLE `cms_board_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_board_items`
--

DROP TABLE IF EXISTS `cms_board_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_board_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `obtype` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `formsdata` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `pubdate` datetime DEFAULT NULL,
  `pubdays` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `file` varchar(250) NOT NULL,
  `hits` int(11) NOT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `vipdate` datetime NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `obtype` (`obtype`),
  KEY `city` (`city`),
  KEY `ip` (`ip`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_board_items`
--

LOCK TABLES `cms_board_items` WRITE;
/*!40000 ALTER TABLE `cms_board_items` DISABLE KEYS */;
INSERT INTO `cms_board_items` VALUES (4,10,1,'Предлагаю','свои услуги','Могу выносить мусор и мыть пол.','','Москва','2012-07-11 14:11:18',10,1,'550de8a5de9b5301133a815de31be00d.jpg',7,0,'0000-00-00 00:00:00',2130706433),(5,9,1,'Обменяю','ВАЗ-2107 на Nissan Skyline GTR','Желательно новый и без доплаты.','','Москва','2012-07-12 14:14:24',10,1,'931f90c50adcea1ff18177bc22d4ceac.jpg',34,0,'0000-00-00 00:00:00',2130706433),(6,8,2,'Сдам','2-х комнатную квартиру','Семье из 2-3 человек','','Москва','2012-07-13 15:57:22',10,1,'80204e6bad519060bca9d456949158dc.jpg',2,0,'0000-00-00 00:00:00',2130706433);
/*!40000 ALTER TABLE `cms_board_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cache`
--

DROP TABLE IF EXISTS `cms_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(10) NOT NULL,
  `target_id` varchar(255) NOT NULL,
  `cachedate` datetime NOT NULL,
  `cachefile` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cache`
--

LOCK TABLES `cms_cache` WRITE;
/*!40000 ALTER TABLE `cms_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `showcomm` tinyint(1) NOT NULL DEFAULT '1',
  `orderby` varchar(30) NOT NULL DEFAULT 'date',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `modgrp_id` int(11) NOT NULL,
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `NSDiffer` varchar(11) NOT NULL,
  `NSIgnore` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `maxcols` int(11) NOT NULL DEFAULT '1',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `showrss` tinyint(1) NOT NULL DEFAULT '1',
  `showdesc` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `photoalbum` text NOT NULL,
  `seolink` varchar(200) NOT NULL,
  `url` varchar(100) NOT NULL,
  `tpl` varchar(50) NOT NULL DEFAULT 'com_content_view.tpl',
  `cost` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`),
  KEY `parent_id` (`parent_id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES (1,0,'--Корневой раздел--','Корневой раздел сайта',1,1,1,'pubdate','asc',0,1,14,0,'',0,1,1,1,1,0,0,'','--kornevoi-razdel--','','com_content_view.tpl',''),(2,1,'Новости','',1,1,1,'pubdate','ASC',0,12,13,1,'',0,2,1,1,0,0,0,'a:7:{s:2:\"id\";i:0;s:6:\"titles\";i:0;s:6:\"header\";s:0:\"\";s:7:\"orderby\";s:5:\"title\";s:7:\"orderto\";s:4:\"desc\";s:7:\"maxcols\";i:2;s:3:\"max\";i:8;}','novosti','','com_content_view.tpl',''),(6,1,'Статьи','<p>Тексты статей предоставлены службой <a href=\"http://referats.yandex.ru/\">Яндекс.Рефераты</a></p>',1,1,1,'pubdate','ASC',0,2,11,1,'',0,1,1,1,1,1,1,'a:7:{s:2:\"id\";i:0;s:6:\"titles\";s:1:\"0\";s:6:\"header\";s:18:\"Фотографии на тему\";s:7:\"orderby\";s:4:\"hits\";s:7:\"orderto\";s:3:\"asc\";s:7:\"maxcols\";i:2;s:3:\"max\";i:8;}','stati','','com_content_view.tpl',''),(13,6,'Маркетинг','<p>Статьи по маркетингу</p>',1,1,1,'pubdate','DESC',0,7,8,2,'',0,3,1,1,1,1,0,'a:7:{s:2:\"id\";i:0;s:6:\"titles\";s:1:\"0\";s:6:\"header\";s:18:\"Фотографии на тему\";s:7:\"orderby\";s:7:\"pubdate\";s:7:\"orderto\";s:4:\"desc\";s:7:\"maxcols\";i:2;s:3:\"max\";i:8;}','stati/marketing','','com_content_view.tpl',''),(12,6,'Геология','Статьи по геологии',1,1,1,'pubdate','DESC',0,3,4,2,'',0,1,1,1,1,1,0,'a:7:{s:2:\"id\";s:1:\"0\";s:6:\"titles\";s:1:\"0\";s:6:\"header\";s:18:\"Фотографии на тему\";s:7:\"orderby\";s:7:\"pubdate\";s:7:\"orderto\";s:4:\"desc\";s:7:\"maxcols\";s:1:\"2\";s:3:\"max\";s:1:\"8\";}','stati/geologija','','com_content_view.tpl',''),(11,6,'Астрономия','<p>Статьи по астрономии</p>',1,1,1,'pubdate','DESC',0,9,10,2,'',0,4,1,1,1,1,1,'a:7:{s:2:\"id\";i:0;s:6:\"titles\";i:0;s:6:\"header\";s:18:\"Фотографии на тему\";s:7:\"orderby\";s:7:\"pubdate\";s:7:\"orderto\";s:4:\"desc\";s:7:\"maxcols\";i:2;s:3:\"max\";i:8;}','stati/astronomija','','com_content_view.tpl',''),(14,6,'Психология','Статьи по психологии',1,1,1,'pubdate','DESC',0,5,6,2,'',0,2,1,1,1,1,0,'a:7:{s:2:\"id\";s:1:\"0\";s:6:\"titles\";s:1:\"0\";s:6:\"header\";s:18:\"Фотографии на тему\";s:7:\"orderby\";s:7:\"pubdate\";s:7:\"orderto\";s:4:\"desc\";s:7:\"maxcols\";s:1:\"2\";s:3:\"max\";s:1:\"8\";}','stati/psihologija','','com_content_view.tpl','');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_clubs`
--

DROP TABLE IF EXISTS `cms_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `imageurl` varchar(100) NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clubtype` varchar(15) NOT NULL DEFAULT 'public',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `maxsize` int(11) NOT NULL,
  `enabled_blogs` tinyint(1) DEFAULT '-1',
  `enabled_photos` tinyint(1) DEFAULT '-1',
  `rating` int(11) NOT NULL,
  `members_count` int(11) NOT NULL DEFAULT '1',
  `photo_premod` tinyint(1) NOT NULL,
  `blog_premod` tinyint(1) NOT NULL,
  `blog_min_karma` int(11) NOT NULL,
  `photo_min_karma` int(11) NOT NULL,
  `album_min_karma` int(11) NOT NULL DEFAULT '25',
  `join_min_karma` int(11) NOT NULL,
  `join_karma_limit` int(11) NOT NULL,
  `create_karma` int(11) NOT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `join_cost` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pubdate` (`pubdate`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_clubs`
--

LOCK TABLES `cms_clubs` WRITE;
/*!40000 ALTER TABLE `cms_clubs` DISABLE KEYS */;
INSERT INTO `cms_clubs` VALUES (14,1,'Клуб любителей InstantCMS','','','2012-07-12 11:41:45','public',1,0,-1,-1,0,2,0,0,0,0,25,0,0,0,0,0);
/*!40000 ALTER TABLE `cms_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment_targets`
--

DROP TABLE IF EXISTS `cms_comment_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL,
  `component` varchar(32) NOT NULL,
  `title` varchar(100) NOT NULL,
  `target_table` varchar(32) NOT NULL,
  `subj` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment_targets`
--

LOCK TABLES `cms_comment_targets` WRITE;
/*!40000 ALTER TABLE `cms_comment_targets` DISABLE KEYS */;
INSERT INTO `cms_comment_targets` VALUES (1,'article','content','Статьи','cms_content','вашей статьи'),(2,'blog','blogs','Посты блогов','cms_blog_posts','вашей записи в блоге'),(3,'palbum','photos','Фотоальбомы','cms_photo_albums','вашего фотоальбома'),(4,'photo','photos','Фотографии галереи','cms_photo_files','вашей фотографии'),(5,'userphoto','users','Фотографии пользователей','cms_user_photos','вашей фотографии'),(6,'catalog','catalog','Записи каталога','cms_uc_items','вашей записи'),(7,'boarditem','board','Объявления','cms_board_items','вашего объявления'),(8,'faq','faq','Вопросы FAQ','cms_faq_quests','вашего вопроса'),(9,'club_photo','clubs','Фото в клубах','cms_photo_files','вашей фотографии'),(10,'club_post','clubs','Пост блога клуба','cms_blog_posts','вашей записи в клубном блоге');
/*!40000 ALTER TABLE `cms_comment_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comments`
--

DROP TABLE IF EXISTS `cms_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target` varchar(20) NOT NULL,
  `target_id` int(11) NOT NULL,
  `guestname` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `content_bbcode` text NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `target_title` varchar(150) NOT NULL,
  `target_link` varchar(200) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `target_id` (`target_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comments`
--

LOCK TABLES `cms_comments` WRITE;
/*!40000 ALTER TABLE `cms_comments` DISABLE KEYS */;
INSERT INTO `cms_comments` VALUES (8,0,0,1,'article',32,'','Питание прогиба исходным материалом, несмотря на не менее значительную разницу в плотности теплового потока, составляет биотит, так как совершенно однозначно указывает на существование','','2012-07-13 20:45:56',1,1,'Почему нерезко плато?!!!','/content/stati/geologija/pochemu-nerezko-plato.html','',0,0),(13,0,0,2,'article',34,'','Спасибо автору за такую отличную статью!','','2012-07-13 20:11:00',1,1,'Эластичность спроса','/stati/marketing/yelastichnost-sprosa.html','127.0.0.1',0,0),(14,13,0,3,'article',34,'','Полностью согласен с Вами, коллега.','','2012-07-13 20:19:19',1,1,'Эластичность спроса','/stati/marketing/yelastichnost-sprosa.html','127.0.0.1',0,0);
/*!40000 ALTER TABLE `cms_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_components`
--

DROP TABLE IF EXISTS `cms_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `config` text NOT NULL,
  `internal` int(11) NOT NULL,
  `author` varchar(200) NOT NULL DEFAULT 'InstantCMS team',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `version` varchar(6) NOT NULL DEFAULT '1.10',
  `system` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_components`
--

LOCK TABLES `cms_components` WRITE;
/*!40000 ALTER TABLE `cms_components` DISABLE KEYS */;
INSERT INTO `cms_components` VALUES (1,'Каталог статей','content','---\nreaddesc: 0\nrating: 1\nperpage: 15\npt_show: 1\npt_disp: 1\npt_hide: 1\nautokeys: 1\nimg_small_w: 100\nimg_big_w: 200\nimg_sqr: 1\nimg_users: 1\nwatermark: 1\nwatermark_only_big: 1\naf_on: 0\naf_delete: 1\naf_showlink: 1\naf_forum_id: 1\naf_hidecat_id: 2\n',0,'InstantCMS team',1,'1.10',1),(2,'Регистрация','registration','---\nreg_type: open\ninv_count: 3\ninv_karma: 1\ninv_period: WEEK\nis_on: 1\nact: 0\nsend: false\noffmsg: >\n  Регистрация приостановлена по\n  техническим причинам.\nfirst_auth_redirect: profile\nauth_redirect: profile\nname_mode: nickname\nbadnickname: |\n  администратор\n  админ\n  qwert\n  qwerty\n  123\n  admin\n  вася пупкин\nask_icq: 1\nask_birthdate: 1\nsend_greetmsg: 1\ngreetmsg: |\n  <h2>Привет!</h2>\n  <p><span style=\"font-size: medium;\">Мы очень <span style=\"color: rgb(51, 153, 102);\">рады</span> что ты зарегистрировался!</span></p>\n',0,'InstantCMS team',1,'1.10',1),(3,'Фотогалерея','photos','---\nlink: 0\nsaveorig: 0\nmaxcols: 2\norderby: title\norderto: desc\nshowlat: 1\nwatermark: 1\ntumb_view: 2\ntumb_from: 1\ntumb_club: \nis_today: 1\n',0,'InstantCMS team',1,'1.10',1),(4,'Прайс-лист','price','---\n',0,'InstantCMS team',1,'1.10',1),(5,'Поиск','search','---\nperpage: 10\ncomp:\n  - content\n  - photos\n  - price\n  - catalog\n  - forum\n  - blogs\n  - faq\n  - board\n  - clubs\nsearch_engine:\n',0,'InstantCMS team',1,'1.10',1),(6,'Конструктор форм','forms','---\n',0,'InstantCMS team',1,'1.10',1),(7,'Комментарии пользователей','comments','---\nemail: \ncanguests: 1\nregcap: 0\npublish: 1\nsmiles: 1\nbbcode: 1\nselfdel: 0\nsubscribe: 1\nanchors: 0\nrecode: 0\nmin_karma: 0\nmin_karma_show: 0\nmin_karma_add: 0\nperpage: 20\nj_code: 1\ncmm_ajax: 0\ncmm_ip: 1\n',1,'InstantCMS team',1,'1.10',1),(8,'Архив материалов','arhive','---\n',0,'InstantCMS team',1,'1.10',1),(9,'Универсальный каталог','catalog','---\nemail: shop@site.ru\ndelivery: |\n  Сведения о доставке.\n  Этот текст можно изменить в настройках компонента &quot;Универсальный каталог&quot;.\nnotice: 1\npremod: 1\npremod_msg: 1\nis_comments: 1\nis_rss: 1\nwatermark: 1\n',0,'InstantCMS team',1,'1.10',1),(10,'Профили пользователей','users','---\nshowgroup: 1\nsw_stats: \nsw_comm: 1\nsw_search: 1\nsw_forum: 1\nsw_photo: 1\nsw_wall: 1\nsw_friends: 1\nsw_blogs: 1\nsw_clubs: 1\nsw_feed: 1\nsw_content: 1\nsw_awards: 1\nsw_board: 1\nsw_msg: 1\nsw_guest: 1\nkarmatime: 1\nkarmaint: DAY\nphotosize: 0\nwatermark: 1\nsmallw: 64\nmedw: 200\nmedh: 500\nsw_files: 1\nfilessize: 100\nfilestype: jpeg,gif,png,jpg,bmp,zip,rar,tar\nprivforms: \n  - 3\nj_code: 1\ndeltime: 6\n',0,'InstantCMS team',1,'1.10',1),(12,'Форум','forum','---\nis_on: 1\nkarma: 1\nis_rss: 1\npp_thread: 15\npp_forum: 15\nshowimg: 1\nimg_on: 1\nimg_max: 5\nfast_on: 1\nfast_bb: 1\nfa_on: 1\ngroup_access: \nfa_max: 25\nfa_ext: txt doc zip rar arj png gif jpg jpeg bmp\nfa_size: 1024\n',0,'InstantCMS team',1,'1.10',1),(13,'Статистика сайта','statistics','---\n',1,'InstantCMS team',1,'1.10',1),(15,'Блоги','blogs','---\nperpage: 10\nperpage_blog: 15\nupdate_date: 0\nupdate_seo_link: 0\nmin_karma_private: 0\nmin_karma_public: 5\nmin_karma: 1\nwatermark: 1\nimg_on: 1\nrss_all: 1\nrss_one: 1\nj_code: 1\n',0,'InstantCMS team',1,'1.10',1),(16,'Вопросы и ответы','faq','---\n',0,'InstantCMS team',1,'1.10',1),(17,'Баннеры','banners','---\n',1,'InstantCMS team',1,'1.10',1),(18,'Лента активности','actions','---\r\nshow_target: 1\r\nperpage: 10\r\nperpage_tab: 15\r\nis_all: 1\r\nact_type: \r\n  add_quest: 16\r\n  add_club_user: 15\r\n  vote_movie: 31\r\n  add_movie: 30\r\n  add_friend: 20\r\n  add_post: 10\r\n  add_post_club: 25\r\n  add_catalog: 13\r\n  add_wall_my: 29\r\n  add_wall: 23\r\n  add_wall_club: 24\r\n  add_comment: 2\r\n  add_user_photo_multi: 27\r\n  add_board: 12\r\n  add_fpost: 17\r\n  add_article: 8\r\n  add_thread: 18\r\n  add_photo: 7\r\n  add_user_photo: 26\r\n  add_avatar: 19\r\n  add_file: 22\r\n  set_status: 11\r\n  add_award: 21\r\n  add_user: 28\r\n  add_blog: 9\r\n  add_club: 14\r\n',0,'InstantCMS Team',1,'1.10',1),(19,'RSS генератор','rssfeed','---\n',1,'InstantCMS team',1,'1.10',1),(21,'Награждение пользователей','autoawards','---\n',1,'InstantCMS team',1,'1.10',1),(22,'Доска объявлений','board','---\nmaxcols: 3\nobtypes: |\n  Продам\n  Куплю\n  Обменяю\n  Подарю\nshowlat: \npublic: 2\nphotos: 1\nsrok: 1\npubdays: 10\nwatermark: 0\naftertime: \ncomments: 1\n',0,'InstantCMS team',1,'1.10',1),(23,'Клубы пользователей','clubs','---\nseo_club: title\nenabled_blogs: 1\nenabled_photos: 1\nthumb1: 48\nthumb2: 200\nthumbsqr: 1\ncancreate: 1\nperpage: 10\ncreate_min_karma: 0\ncreate_min_rating: 0\n',0,'InstantCMS team',1,'1.10',1);
/*!40000 ALTER TABLE `cms_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content`
--

DROP TABLE IF EXISTS `cms_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enddate` date NOT NULL,
  `is_end` tinyint(1) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `content` longtext,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `hits` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `meta_desc` text NOT NULL,
  `meta_keys` text NOT NULL,
  `showtitle` tinyint(1) NOT NULL DEFAULT '1',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `showlatest` tinyint(1) NOT NULL DEFAULT '1',
  `showpath` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `is_arhive` tinyint(1) NOT NULL,
  `seolink` varchar(200) NOT NULL,
  `canrate` tinyint(1) NOT NULL DEFAULT '1',
  `pagetitle` varchar(255) NOT NULL,
  `url` varchar(100) NOT NULL,
  `tpl` varchar(50) NOT NULL DEFAULT 'com_content_read.tpl',
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content`
--

LOCK TABLES `cms_content` WRITE;
/*!40000 ALTER TABLE `cms_content` DISABLE KEYS */;
INSERT INTO `cms_content` VALUES (20,2,1,'2012-03-01 15:56:00','2012-05-22',0,'Наш сайт открыт!','<p>Мы рады приветствовать вас на нашем сайте!</p>','<p>Наш сайт открыт и начинает активно фунционировать.</p>\r\n<p>У нас большие планы на будущее. На этом сайте мы постарались разместить интересную информацию.</p>\r\n<p>Мы очень рады что вы читаете эту новость.</p>\r\n<p>Наша компания занимается бизнесом в сфере продажи строительных материалов.</p>',1,397,0,'','',1,1,1,1,1,1,0,'novosti/nash-sait-otkryt',1,'','','com_content_read.tpl'),(26,2,1,'2012-03-01 15:56:00','2012-05-22',0,'Тестовая новость сайта','<p>Это тестовая новость. Пользователи могут ее комментировать.</p>','<p>Глубина очага землетрясения поднимает термокарст, что обусловлено не только первичными неровностями эрозионно-тектонического рельефа поверхности кристаллических пород, но и проявлениями долее поздней блоковой тектоники. Туффит, формируя аномальные геохимические ряды, разогревает плейстоцен, что, однако, не уничтожило доледниковую переуглубленную гидросеть древних долин. Излом благоприятно покрывает трог, в соответствии с изменениями в суммарной минерализации. Топаз занимает форшок, за счет чего увеличивается мощность коры под многими хребтами. Ледниковое озеро сдвигает сель, что в конце концов приведет к полному разрушению хребта под действием собственного веса. При описанных условиях алмаз первичен.</p>',1,279,0,'','',1,1,1,1,2,1,0,'novosti/testovaja-novost-saita',1,'','','com_content_read.tpl'),(30,11,1,'2012-07-01 15:56:00','2012-06-17',0,'Первоначальный нулевой меридиан','<p><strong>Все известные астероиды имеют прямое движение</strong>, при этом тропический год меняет сарос &ndash; у таких объектов рукава столь фрагментарны и обрывочны, что их уже нельзя назвать спиральными. Как было показано выше, межзвездная матеpия дает pадиотелескоп Максвелла, при этом плотность Вселенной в 3 * 10 в 18-й степени раз меньше, с учетом некоторой неизвестной добавки скрытой массы. Пpотопланетное облако притягивает непреложный часовой угол (датировка приведена по Петавиусу, Цеху, Хайсу).</p>','<p>Когда речь идет о галактиках, природа гамма-всплексов вызывает аргумент перигелия, хотя галактику в созвездии Дракона можно назвать карликовой. Хотя хpонологи не увеpены, им кажется, что тропический год точно вращает первоначальный астероид, день этот пришелся на двадцать шестое число месяца карнея, который у афинян называется метагитнионом.<br />\r\n<br />\r\nЛисичка на следующий год, когда было лунное затмение и сгорел древний храм Афины в Афинах (при эфоре Питии и афинском архонте Каллии), гасит случайный поперечник, хотя галактику в созвездии Дракона можно назвать карликовой. В отличие от пылевого и ионного хвостов, магнитное поле стабильно. Прямое восхождение на следующий год, когда было лунное затмение и сгорел древний храм Афины в Афинах (при эфоре Питии и афинском архонте Каллии), потенциально. Широта существенно притягивает непреложный надир, тем не менее, Дон Еманс включил в список всего 82-е Великие Кометы. Уравнение времени, следуя пионерской работе Эдвина Хаббла, вызывает далекий pадиотелескоп Максвелла, при этом плотность Вселенной в 3 * 10 в 18-й степени раз меньше, с учетом некоторой неизвестной добавки скрытой массы.<br />\r\n<br />\r\nСкоpость кометы в пеpигелии иллюстрирует астероид, а оценить проницательную способность вашего телескопа поможет следующая формула: Mпр.= 2,5lg Dмм + 2,5lg Гкрат + 4. Полнолуние пространственно неоднородно. Это можно записать следующим образом: V = 29.8 * sqrt(2/r &ndash; 1/a) км/сек, где ионный хвост однородно иллюстрирует радиант, при этом плотность Вселенной в 3 * 10 в 18-й степени раз меньше, с учетом некоторой неизвестной добавки скрытой массы. Азимут сложен. Магнитное поле непрерывно.</p>',1,68,0,'','',1,1,1,1,1,1,0,'stati/astronomija/pervonachalnyi-nulevoi-meridian',1,'Первоначальный нулевой меридиан','','com_content_read.tpl'),(31,12,1,'2012-05-20 16:24:00','2012-05-20',0,'Останцовый лакколит: основные моменты','<p>Двойное лучепреломление, с учетом региональных факторов, покрывает монтмориллонит, в то время как значения максимумов изменяются в широких пределах. Алмаз эффективно составляет эффузивный блеск, в соответствии с изменениями в суммарной минерализации. Инфлюация структурно ослабляет парагенезис, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов. Глубина очага землетрясения, разделенные узкими линейновытянутыми зонами выветрелых пород, причленяет к себе каустобиолит, что в общем свидетельствует о преобладании тектонических опусканий в это время.</p>','<p>Оттаивание пород обрывисто прекращает фирн, поскольку непосредственно мантийные струи не наблюдаются. Капиллярное поднятие интенсивно. Элювиальное образование определяет несовершенный трог, что свидетельствует о проникновении днепровских льдов в бассейн Дона. Сдвиг сингонально фоссилизирует денудационно-аккумулятивный апофиз, что в конце концов приведет к полному разрушению хребта под действием собственного веса. Апофиз дискретно переоткладывает ийолит-уртит, что, однако, не уничтожило доледниковую переуглубленную гидросеть древних долин.</p>\r\n<p>Рисчоррит разогревает цокольный туффит, что, однако, не уничтожило доледниковую переуглубленную гидросеть древних долин. Геосинклиналь обедняет анортит, основными элементами которого являются обширные плосковершинные и пологоволнистые возвышенности. Ложе, так же, как и в других регионах, индивидуально. Брекчия опускает пирокластический бентос, что, однако, не уничтожило доледниковую переуглубленную гидросеть древних долин. Ложе сингонально прекращает молого-шекснинский ортоклаз, основными элементами которого являются обширные плосковершинные и пологоволнистые возвышенности. В типологическом плане вся территория Нечерноземья выветривание поднимает сель, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов.</p>',1,66,0,'Останцовый лакколит: основные моменты','переуглубленную, гидросеть, долин, доледниковую, древних, уничтожило, однако, обширные, плосковершинные, пологоволнистые, возвышенности, являются, элементами, апофиз, прекращает, сингонально, основными, которого, уничтожило доледниковую, древних долин, гидросеть древних, переуглубленную гидросеть, доледниковую переуглубленную, обширные плосковершинные, пологоволнистые возвышенности, являются обширные, основными элементами, элементами которого, которого являются, уничтожило доледниковую переуглубленную, переуглубленную гидросеть древних, доледниковую переуглубленную гидросеть, являются обширные плосковершинные, которого являются обширные, основными элементами которого, элементами которого являются',1,1,1,1,2,1,0,'stati/geologija/ostancovyi-lakkolit-osnovnye-momenty',1,'','','com_content_read.tpl'),(32,12,1,'2012-05-20 16:24:00','2012-06-17',0,'Почему нерезко плато?!!!','<p>Трещинноватость пород опускает дрейф континентов, что, однако, не уничтожило доледниковую переуглубленную гидросеть древних долин. Магматическая дифференциация ортогонально смещает форшок, что в общем свидетельствует о преобладании тектонических опусканий в это время. Элювиальное образование, которая в настоящее время находится ниже уровня моря, ослабляет аморфный цвет, в то время как значения максимумов изменяются в широких пределах. Мергель слагает орогенез, делая этот типологический таксон районирования носителем важнейших инженерно-геологических характеристик природных условий.</p>','<p>Плейстоцен ослабляет плоскостной оз, что обусловлено не только первичными неровностями эрозионно-тектонического рельефа поверхности кристаллических пород, но и проявлениями долее поздней блоковой тектоники. Согласно изостатической концепции Эйри, делювий покрывает отрог, что в конце концов приведет к полному разрушению хребта под действием собственного веса. Вулканическое стекло занимает мощный коллювий, что обусловлено не только первичными неровностями эрозионно-тектонического рельефа поверхности кристаллических пород, но и проявлениями долее поздней блоковой тектоники. Грязевой вулкан подпитывает полого-холмистый базис эрозии, в то время как значения максимумов изменяются в широких пределах. Трещинноватость пород составляет первичный водоносный этаж, в соответствии с изменениями в суммарной минерализации. Бифуркация русла, но если принять для простоты некоторые докущения, разогревает кислый протерозой, включая и гряды Чернова, Чернышева и др.<br />\r\n<br />\r\nПо характеру рельефа количество пирокластического материала сменяет эпигенез, что увязывается со структурно-тектонической обстановкой, гидродинамическими условиями и литолого-минералогическим составом пород. Ледниковое озеро, но если принять для простоты некоторые докущения, продольно сбрасывает многолетнемерзлый алмаз, что обусловлено не только первичными неровностями эрозионно-тектонического рельефа поверхности кристаллических пород, но и проявлениями долее поздней блоковой тектоники. Питание прогиба исходным материалом, несмотря на не менее значительную разницу в плотности теплового потока, составляет биотит, так как совершенно однозначно указывает на существование и рост в период оформления палеогеновой поверхности выравнивания. Брекчия достаточно хорошо вызывает плейстоцен, и в то же время устанавливается достаточно приподнятый над уровнем моря коренной цоколь.</p>',1,21,0,'','',1,1,1,1,1,1,0,'stati/geologija/pochemu-nerezko-plato',1,'Почему нерезко плато?!!!','','com_content_read.tpl'),(33,13,1,'2012-05-20 15:50:00','2012-07-28',0,'Культурный медийный канал: методология и особенности','<p>Поведенческий таргетинг неестественно уравновешивает conversion rate, не считаясь с затратами. Системный анализ изменяет PR, не считаясь с затратами. VIP-мероприятие, анализируя результаты рекламной кампании, допускает побочный PR-эффект, не считаясь с затратами. Как отмечает Майкл Мескон, стимулирование коммьюнити многопланово трансформирует стратегический имидж, не считаясь с затратами. Итак, ясно, что жизненный цикл продукции основан на опыте.</p>','<p>Стоит отметить, что презентация стабилизирует комплексный анализ ситуации, полагаясь на инсайдерскую информацию. Рейт-карта, отбрасывая подробности, спонтанно трансформирует пак-шот, оптимизируя бюджеты. А вот по мнению аналитиков медиапланирование изменяет общественный рекламный макет, опираясь на опыт западных коллег. Рейт-карта, безусловно, все еще интересна для многих. Такое понимание ситуации восходит к Эл Райс, при этом метод изучения рынка ригиден.</p>\r\n<p>К тому же ретроконверсия национального наследия отталкивает потребительский нестандартный подход, невзирая на действия конкурентов. Анализ рыночных цен традиционно создает эмпирический департамент маркетинга и продаж, осознав маркетинг как часть производства. Лидерство в продажах,&nbsp;следовательно, специфицирует инструмент маркетинга, опираясь на опыт западных коллег. Узнавание бренда, пренебрегая деталями, продуцирует межличностный нишевый проект, используя опыт предыдущих кампаний. Рыночная информация тормозит потребительский рынок, оптимизируя бюджеты.</p>',1,10,0,'Культурный медийный канал: методология и особенности','западных, коллег, потребительский, маркетинга, опираясь, бюджеты, ситуации, карта, оптимизируя, анализ, западных коллег, оптимизируя бюджеты',1,1,1,1,2,1,0,'stati/marketing/kulturnyi-mediinyi-kanal-metodologija-i-osobenosti',1,'','','com_content_read.tpl'),(34,13,1,'2012-05-20 11:33:00','2012-07-22',0,'Эластичность спроса','<p>Дело в том, что потребление синхронизирует институциональный рекламный макет, полагаясь на инсайдерскую информацию. Целевая аудитория интегрирована. Тем не менее, каждая сфера рынка раскручивает эмпирический анализ зарубежного опыта, расширяя долю рынка.</p>','<p>Примерная структура маркетингового исследования,&nbsp;в&nbsp;рамках&nbsp;сегодняшних&nbsp;воззрений, тормозит тактический план размещения, оптимизируя бюджеты. Фирменный стиль парадоксально программирует коллективный маркетинг, оптимизируя бюджеты. Фокусировка позиционирует пак-шот, полагаясь на инсайдерскую информацию.</p>\r\n<p>Опросная анкета ускоряет диктат потребителя, используя опыт предыдущих кампаний. Стимулирование сбыта настроено позитивно. Стимулирование коммьюнити охватывает комплексный конкурент, используя опыт предыдущих кампаний. Рекламное сообщество стабилизирует выставочный стенд, опираясь на опыт западных коллег. Стратегический рыночный план программирует потребительский инструмент маркетинга, учитывая результат предыдущих медиа-кампаний. По сути, сервисная стратегия притягивает институциональный выставочный стенд, не считаясь с затратами.</p>\r\n<p>По мнению ведущих маркетологов, маркетинговая активность позитивно стабилизирует рекламный бриф, признавая определенные рыночные тенденции. Рекламная кампания неоднозначна. Правда, специалисты отмечают, что сущность и концепция маркетинговой программы откровенна. Нестандартный подход концентрирует экспериментальный стратегический рыночный план, не считаясь с затратами. Наряду с этим, узнавание бренда слабо упорядочивает креатив, опираясь на опыт западных коллег.</p>\r\n<p>&nbsp;</p>',1,9,0,'Почему очевидна не для всех эластичность спроса?','кампаний, предыдущих, коллег, западных, опираясь, стратегический, затратами, рыночный, стенд, считаясь, стабилизирует, программирует, бюджеты, используя, стимулирование, оптимизируя, позитивно, выставочный, стратегический рыночный, западных коллег, выставочный стенд, предыдущих кампаний, оптимизируя бюджеты',1,1,1,1,1,1,0,'stati/marketing/yelastichnost-sprosa',1,'','','com_content_read.tpl'),(29,11,1,'2012-05-20 13:41:00','2012-07-21',0,'Космический возмущающий фактор: гипотеза и теории','<p>Лисичка колеблет астероидный эксцентриситет, при этом плотность Вселенной в 3 * 10 в 18-й степени раз меньше, с учетом некоторой неизвестной добавки скрытой массы. Поперечник, после осторожного анализа, гасит случайный аргумент перигелия &ndash; это скорее индикатор, чем примета. Фаза ищет узел, однако большинство спутников движутся вокруг своих планет в ту же сторону, в какую вращаются планеты. Pадиотелескоп Максвелла недоступно колеблет маятник Фуко, таким образом, часовой пробег каждой точки поверхности на экваторе равен 1666км. Природа гамма-всплексов, оценивая блеск освещенного металического шарика, существенно вызывает лимб, как это случилось в 1994 году с кометой Шумейкеpов-Леви 9. Экватор, а там действительно могли быть видны звезды, о чем свидетельствует Фукидид неравномерен.</p>','<p>Декретное время, это удалось установить по характеру спектра, мгновенно. Зенитное часовое число случайно. Межзвездная матеpия вероятна. Магнитное поле ничтожно иллюстрирует Тукан, хотя это явно видно на фотогpафической пластинке, полученной с помощью 1.2-метpового телескопа. Аргумент перигелия меняет перигелий, но это не может быть причиной наблюдаемого эффекта. Земная группа формировалась ближе к Солнцу, однако апогей иллюстрирует ионный хвост, однако большинство спутников движутся вокруг своих планет в ту же сторону, в какую вращаются планеты.</p>\r\n<p>{pagebreak}</p>\r\n<p>Афелий перечеркивает популяционный индекс, таким образом, часовой пробег каждой точки поверхности на экваторе равен 1666км. Натуральный логарифм, как бы это ни казалось парадоксальным, оценивает натуральный логарифм - это солнечное затмение предсказал ионянам Фалес Милетский. Магнитное поле жизненно гасит маятник Фуко, хотя это явно видно на фотогpафической пластинке, полученной с помощью 1.2-метpового телескопа. Экскадрилья, как бы это ни казалось парадоксальным, отражает перигелий &ndash; это скорее индикатор, чем примета. Атомное время, в первом приближении, постоянно. Небесная сфера, сублимиpуя с повеpхности ядpа кометы, жизненно притягивает астероидный радиант, об этом в минувшую субботу сообщил заместитель администратора NASA.</p>',1,99,0,'Космический возмущающий фактор: гипотеза и теории','натуральный, однако, перигелий, логарифм, казалось, жизненно, парадоксальным, телескопа, метpового, видно, иллюстрирует, магнитное, фотогpафической, пластинке, помощью, полученной, время, казалось парадоксальным, натуральный логарифм, метpового телескопа, пластинке полученной, фотогpафической пластинке, фотогpафической пластинке полученной',1,1,1,1,2,1,0,'stati/astronomija/kosmicheskii-vozmushayushii-faktor-gipoteza-i-teori',1,'','','com_content_read.tpl'),(35,14,1,'2012-05-20 16:24:00','2012-05-20',0,'Эмпирический контраст: методология и особенности','','<p>Чувство аннигилирует кризис, следовательно тенденция к конформизму связана с менее низким интеллектом.</p>\r\n<p>Архетип изменяем. Сознание представляет собой объект, тем не менее как только ортодоксальность окончательно возобладает, даже эта маленькая лазейка будет закрыта. Сознание, в первом приближении, иллюстрирует бихевиоризм, здесь описывается централизующий процесс или создание нового центра личности. Реакция параллельна. Гомеостаз, конечно, дает филосовский аутизм, что отмечают такие крупнейшие ученые как Фрейд, Адлер, Юнг, Эриксон, Фромм. Толпа социально просветляет депрессивный стимул в силу которого смешивает субъективное и объективное, переносит свои внутренние побуждения на реальные связи вещей.</p>\r\n<p>Парадигма интегрирует онтогенез речи одинаково по всем направлениям. Роджерс определял терапию как, лидерство отражает контраст, хотя этот факт нуждается в дальнейшей проверке наблюдением. Ригидность, иcходя из того, что аннигилирует сублимированный ассоцианизм, так, например, Ричард Бендлер для построения эффективных состояний использовал изменение субмодальностей. Интеллект, например, неравномерен. Психосоматика, например, просветляет сублимированный гештальт, о чем и писал А. Маслоу в своей работе &quot;Мотивация и личность&quot;. Генезис, конечно, неумеренно дает понимающий инсайт, как и предсказывает теория о бесполезном знании.</p>',1,11,0,'Эмпирический контраст: методология и особенности','например, сублимированный, просветляет, конечно, менее, сознание, аннигилирует',1,1,1,1,1,1,0,'stati/psihologija/yempiricheskii-kontrast-metodologija-i-osobennosti',1,'','','com_content_read.tpl'),(36,14,1,'2012-05-20 18:29:00','2012-07-16',0,'Групповой аутотренинг глазами современников','<p>Ассоцианизм, как бы это ни казалось парадоксальным, аннигилирует аутизм, здесь описывается централизующий процесс или создание нового центра личности. Структурный голод столь же важен для жизни, как и закон жизненно отражает опасный код, что отмечают такие крупнейшие ученые как Фрейд, Адлер, Юнг, Эриксон, Фромм.</p>','<p><strong>Л.С. Выготский понимал тот факт, что сновидение последовательно отталкивает интеракционизм, это обозначено Ли Россом как фундаментальная ошибка атрибуции, которая прослеживается во многих экспериментах. Чувство абсурдно понимает понимающий эриксоновский гипноз одинаково по всем направлениям. Генезис, в представлении Морено, отталкивает социальный объект, хотя Уотсон это отрицал. Структурный голод столь же важен для жизни, как и сознание начинает опасный конформизм, следовательно тенденция к конформизму связана с менее низким интеллектом. Личность, по определению, доступна.</strong><br />\r\n<br />\r\nКоллективное бессознательное, например, начинает субъект, так, например, Ричард Бендлер для построения эффективных состояний использовал изменение субмодальностей. Психическая саморегуляция последовательно притягивает позитивистский стресс, что лишний раз подтверждает правоту З. Фрейда. Репрезентативная система выбирает эгоцентризм, это обозначено Ли Россом как фундаментальная ошибка атрибуции, которая прослеживается во многих экспериментах. Выготский разработал, ориентируясь на методологию марксизма, учение которое утверждает что, предсознательное непоследовательно начинает бихевиоризм, независимо от психического состояния пациента. Сновидение осознаёт инсайт, хотя этот факт нуждается в дальнейшей проверке наблюдением. Однако Э. Дюркгейм утверждал, что комплекс изящно дает гештальт, независимо от психического состояния пациента.</p>\r\n<p>{ФОРМА=Написать письмо}</p>',1,13,0,'Групповой аутотренинг глазами современников','начинает, экспериментах, многих, например, независимо, пациента, состояния, психического, прослеживается, которая, отталкивает, последовательно, сновидение, обозначено, россом, атрибуции, ошибка, фундаментальная, выготский, психического состояния, состояния пациента, многих экспериментах, которая прослеживается, ошибка атрибуции, атрибуции которая, фундаментальная ошибка, психического состояния пациента, атрибуции которая прослеживается, ошибка атрибуции которая, фундаментальная ошибка атрибуции',1,1,0,1,2,0,0,'stati/psihologija/gruppovoi-autotrening-glazami-sovremennikov',1,'Аутотренинг','','com_content_read.tpl');
/*!40000 ALTER TABLE `cms_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content_access`
--

DROP TABLE IF EXISTS `cms_content_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content_access`
--

LOCK TABLES `cms_content_access` WRITE;
/*!40000 ALTER TABLE `cms_content_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_content_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cron_jobs`
--

DROP TABLE IF EXISTS `cms_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cron_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `job_interval` smallint(6) NOT NULL DEFAULT '1',
  `job_run_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `component` varchar(20) NOT NULL,
  `model_method` varchar(100) NOT NULL,
  `custom_file` varchar(250) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` smallint(6) NOT NULL DEFAULT '1',
  `comment` varchar(200) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `class_method` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_name` (`job_name`,`is_enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cron_jobs`
--

LOCK TABLES `cms_cron_jobs` WRITE;
/*!40000 ALTER TABLE `cms_cron_jobs` DISABLE KEYS */;
INSERT INTO `cms_cron_jobs` VALUES (1,'photos_clear',24,'2012-04-07 09:10:08','users','clearUploadedPhotos','',1,1,'Удаление неиспользуемых личных фотографий','',''),(2,'optimize_tables',24,'2012-04-07 09:10:08','','','',1,1,'Оптимизация таблиц БД','db|cmsDatabase','optimizeTables'),(3,'drop_inactive_users',48,'2012-04-07 09:10:08','users','deleteInactiveUsers','',1,1,'Удаление неактивных пользователей (см. настройки компонента \"Профили пользователей\")','',''),(4,'remove_old_log',48,'2012-04-07 09:10:08','','','',1,1,'Удаляет старые записи ленты событий','actions|cmsActions','removeOldLog'),(5,'give_invites',24,'2012-04-07 09:10:08','users','giveInvitesCron','',1,1,'Выдача инвайтов пользователям','',''),(6,'clear_invites',24,'2012-04-07 09:10:08','users','clearInvites','',1,1,'Удаление использованных инвайтов','',''),(7,'deleteOldResults',24,'2012-04-07 09:10:08','search','deleteOldResults','',1,1,'Удаляет записи в кеше поиска старее 1 дня.','',''),(8,'deleteOldNotification',48,'2012-07-31 20:19:42','users','deleteOldNotification','',1,1,'Удаляет сообщения службы обновлений и рассылки старее 1 месяца','',''),(9,'moveArticlesToArchive',24,'2012-07-29 15:25:10','content','moveArticlesToArchive','',1,0,'Переносит просроченные статьи в архив','','');
/*!40000 ALTER TABLE `cms_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_downloads`
--

DROP TABLE IF EXISTS `cms_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileurl` varchar(250) NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_downloads`
--

LOCK TABLES `cms_downloads` WRITE;
/*!40000 ALTER TABLE `cms_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_event_hooks`
--

DROP TABLE IF EXISTS `cms_event_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_event_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(50) NOT NULL,
  `plugin_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event` (`event`,`plugin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_event_hooks`
--

LOCK TABLES `cms_event_hooks` WRITE;
/*!40000 ALTER TABLE `cms_event_hooks` DISABLE KEYS */;
INSERT INTO `cms_event_hooks` VALUES (6,'GET_ARTICLE','5'),(3,'INSERT_WYSIWYG','3'),(7,'USER_PROFILE','6'),(11,'ADD_ARTICLE_DONE','8'),(10,'ADD_POST_DONE','8'),(12,'ADD_BOARD_DONE','8'),(34,'GET_FORUM_POSTS','14'),(33,'GET_COMMENTS','14'),(32,'GET_COMMENT','14'),(30,'GET_POST','14'),(29,'GET_POSTS','14'),(35,'GET_WALL_POSTS','14'),(36,'GET_ARTICLE','15'),(37,'LOGINZA_BUTTON','16'),(38,'LOGINZA_AUTH','16'),(39,'DELETE_ARTICLE','17'),(40,'GET_ARTICLE','17'),(41,'ADD_ARTICLE_DONE','17'),(42,'UPDATE_ARTICLE','17');
/*!40000 ALTER TABLE `cms_event_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_faq_cats`
--

DROP TABLE IF EXISTS `cms_faq_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_faq_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_faq_cats`
--

LOCK TABLES `cms_faq_cats` WRITE;
/*!40000 ALTER TABLE `cms_faq_cats` DISABLE KEYS */;
INSERT INTO `cms_faq_cats` VALUES (3,0,'Технические вопросы','<p>Обсуждение неисправностей и поломок</p>',1),(4,0,'Юридические вопросы','<p>Связанные с законодательным правом</p>',1),(5,3,'Вопросы сервисному отделу','<p>По поводу гарантийного ремонта</p>',1);
/*!40000 ALTER TABLE `cms_faq_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_faq_quests`
--

DROP TABLE IF EXISTS `cms_faq_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_faq_quests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `quest` text NOT NULL,
  `answer` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `answeruser_id` int(11) NOT NULL,
  `answerdate` datetime NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  FULLTEXT KEY `quest` (`quest`,`answer`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_faq_quests`
--

LOCK TABLES `cms_faq_quests` WRITE;
/*!40000 ALTER TABLE `cms_faq_quests` DISABLE KEYS */;
INSERT INTO `cms_faq_quests` VALUES (3,3,'2012-04-14 20:09:54',1,'У меня не работает чайник. Когда я наливаю в него воду и ставлю кипятиться, он светится не естественным образом. Когда вода начинает кипеть, чайник перестает светиться и начинает подпрыгивать. Один раз он упрыгал в ванну.\r\n\r\nПодскажите, как мне его починить?','<p>Василий, ваша проблема встречается очень часто. И, к сожалению, вряд ли вам чем-то можно помочь. Единственное, что мы можем - это заявить на вас в милицию. Так что решайте, что вам дороже.</p>',2,1,'2012-04-14 20:09:54',32),(4,4,'2012-04-14 00:00:00',1,'Я продал свою собаку. Потом я передумал. И потребовал ее назад. Деньги конечно вернул. Но случилась небольшая беда. Я не помню кому продал собаку и кому вернул деньги. Как мне быть?','<p>Скорее всего вы сможете найти покупателя там, где он живет.</p>\r\n<p>Согласно исследованиям, проведенным британскими учеными в 1985 году, большинство людей можно найти по тому адресу, который они называют &quot;домом&quot;. Независимые эксперты также подтверждают эти выводы. Многие из них даже проверили данную теорию на себе.</p>\r\n<p>Успехов вам в поисках, пишите еще.</p>',2,1,'2012-04-14 00:00:00',36),(5,5,'2012-04-14 00:00:00',1,'Скажите пожалуйста когда мне вернут экскаватор который я сдал на ремонт в июне 1937 года?','<p>К сожалению, ответственному за это упущение сотруднику недавно исполнилось 94 года и мы не смогли добиться от него внятного ответа. Он утверждает что не помнит, мы конечно не верим и продолжим пытки, но на это потребуется время. Просим отнестись с пониманием.</p>',2,1,'2012-04-16 00:00:00',36);
/*!40000 ALTER TABLE `cms_faq_quests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_filter_rules`
--

DROP TABLE IF EXISTS `cms_filter_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_filter_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `find` varchar(200) NOT NULL,
  `replace` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_filter_rules`
--

LOCK TABLES `cms_filter_rules` WRITE;
/*!40000 ALTER TABLE `cms_filter_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_filter_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_filters`
--

DROP TABLE IF EXISTS `cms_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_filters`
--

LOCK TABLES `cms_filters` WRITE;
/*!40000 ALTER TABLE `cms_filters` DISABLE KEYS */;
INSERT INTO `cms_filters` VALUES (1,'Автозамена / Фильтр ссылок','Фильтр выполняет замену выражений по созданным вами правилам, а так же служит для создания ссылок в категории прайслиста, фотоальбомы и фотографии.<br/><br/>{ПРАЙС=Название категории}, <br/>{ФОТО=Название фотографии}, <br/>{АЛЬБОМ=Название фотоальбома}, <br/>{МАТЕРИАЛ=Название материала}<br/>{ФОРМА=Название формы} - форма с заголовком<br/>\r\n{БЛАНК=Название формы} - форма без заголовка','f_replace',1),(4,'Постраничный вывод','Фильтр разбивает текст материала на несколько страниц в тех местах где будет найден тэг {pagebreak}.','f_pages',1),(2,'Содержание статьи','Фильтр ищет тэги {СТРАНИЦА=Название страницы} в текстах статей, и заменяет их на главы в содержании статьи.','f_contents',1),(5,'Внешние скрипты','Фильтр находит в текстах статей и модулей выражения \"{ФАЙЛ=script.php}\" и заменяет их результатами выполнения соответствующих скриптов из папки \"/includes/myphp/\".','f_includes',1),(6,'Счетчик скачиваний','Фильтр находит в текстах статей и модулей выражения \"{СКАЧАТЬ=/path/file.zip}\" и заменяет их ссылкой для загрузки указанного файла, снабженной счетчиком скачиваний.','f_filelink',1),(7,'Вставка баннера','Фильтр заменяет выражения вида {БАННЕР=Имя_позиции} на баннеры, назначенные на указанную позицию. Работает в статьях и модулях.','f_banners',1);
/*!40000 ALTER TABLE `cms_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_form_fields`
--

DROP TABLE IF EXISTS `cms_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL,
  `kind` varchar(30) NOT NULL,
  `mustbe` int(11) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_form_fields`
--

LOCK TABLES `cms_form_fields` WRITE;
/*!40000 ALTER TABLE `cms_form_fields` DISABLE KEYS */;
INSERT INTO `cms_form_fields` VALUES (8,1,'Ваше имя:','',1,'text',1,'---\r\nmax: 200\r\nsize: 200\r\ndefault:\r\n'),(19,1,'Подписаться на новости?','',5,'checkbox',0,'---\nchecked: 0\n'),(10,1,'Текст сообщения:','Кратко опишите суть.',2,'textarea',1,'---\r\nmax: 200\r\nsize: 200\r\nrows: 5\r\ndefault:\r\n'),(11,1,'Откуда вы о нас узнали?','',4,'list',0,'---\r\nsize: 200\r\nitems: >\r\n  Из прессы/От\r\n  знакомых/По\r\n  телевизору/Из\r\n  интернета\r\n'),(15,1,'Компания:','',3,'text',0,'---\r\nmax: 200\r\nsize: 200\r\ndefault:\r\n'),(22,3,'Любимая музыка','',1,'text',0,'---\ntext_is_link: 1\ntext_link_prefix: /users/hobby/\nmax: 200\nsize: 300\n'),(24,3,'Образование','',2,'list',1,'---\r\nsize: 300\r\nitems: >\r\n  Высшее/Среднее/Начальное\r\n');
/*!40000 ALTER TABLE `cms_form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forms`
--

DROP TABLE IF EXISTS `cms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `sendto` varchar(4) NOT NULL DEFAULT 'mail',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `form_action` varchar(200) NOT NULL DEFAULT '/forms/process',
  `only_fields` tinyint(1) NOT NULL DEFAULT '0',
  `showtitle` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forms`
--

LOCK TABLES `cms_forms` WRITE;
/*!40000 ALTER TABLE `cms_forms` DISABLE KEYS */;
INSERT INTO `cms_forms` VALUES (1,'Написать письмо','<p>Используйте эту форму для обратной связи!</p>','forms@cms.ru','user',1,'/forms/process',0,1),(3,'Анкета пользователя','','','mail',1,'/forms/process',0,1);
/*!40000 ALTER TABLE `cms_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_cats`
--

DROP TABLE IF EXISTS `cms_forum_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  `seolink` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_cats`
--

LOCK TABLES `cms_forum_cats` WRITE;
/*!40000 ALTER TABLE `cms_forum_cats` DISABLE KEYS */;
INSERT INTO `cms_forum_cats` VALUES (1,'Общие вопросы',1,1,'obschie-voprosi');
/*!40000 ALTER TABLE `cms_forum_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_files`
--

DROP TABLE IF EXISTS `cms_forum_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filesize` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_files`
--

LOCK TABLES `cms_forum_files` WRITE;
/*!40000 ALTER TABLE `cms_forum_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_polls`
--

DROP TABLE IF EXISTS `cms_forum_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `answers` text NOT NULL,
  `options` varchar(250) NOT NULL,
  `enddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_polls`
--

LOCK TABLES `cms_forum_polls` WRITE;
/*!40000 ALTER TABLE `cms_forum_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_posts`
--

DROP TABLE IF EXISTS `cms_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  `editdate` datetime NOT NULL,
  `edittimes` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `attach_count` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`,`pubdate`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_posts`
--

LOCK TABLES `cms_forum_posts` WRITE;
/*!40000 ALTER TABLE `cms_forum_posts` DISABLE KEYS */;
INSERT INTO `cms_forum_posts` VALUES (29,12,1,0,'2012-04-04 18:54:53','2012-07-07 18:07:14',2,0,0,'Геосинклиналь [b]обогащает магматический монтмориллонит[/b], что в общем свидетельствует о преобладании тектонических опусканий в это время. Углефикация характерна. Порода существенна. Тектогенез, разделенные узкими линейновытянутыми зонами выветрелых пород, \r\n\r\nпереоткладывает морской авгит, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов. Ведущий экзогенный геологический процесс - субдукция ослабляет лакколит, так как совершенно однозначно указывает на существование и рост в период оформления палеогеновой поверхности выравнивания.','Геосинклиналь <strong>обогащает магматический монтмориллонит</strong>, что в общем свидетельствует о преобладании тектонических опусканий в это время. Углефикация характерна. Порода существенна. Тектогенез, разделенные узкими линейновытянутыми зонами выветрелых пород, <br />переоткладывает морской авгит, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов. Ведущий экзогенный геологический процесс - субдукция ослабляет лакколит, так как совершенно однозначно указывает на существование и рост в период оформления палеогеновой поверхности выравнивания.');
/*!40000 ALTER TABLE `cms_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_threads`
--

DROP TABLE IF EXISTS `cms_forum_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `pubdate` datetime NOT NULL,
  `hits` int(11) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `rel_to` varchar(15) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `post_count` int(11) NOT NULL DEFAULT '0',
  `last_msg` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `forum_id` (`forum_id`),
  KEY `rel_id` (`user_id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_threads`
--

LOCK TABLES `cms_forum_threads` WRITE;
/*!40000 ALTER TABLE `cms_forum_threads` DISABLE KEYS */;
INSERT INTO `cms_forum_threads` VALUES (12,1,1,'Пример темы','','','2012-07-16 12:31:36',71,0,0,0,'',0,1,'---\npubdate: 2012-04-04 18:54:53\nid: 29\ncontent_html: \'Геосинклиналь <strong>обогащает магматический монтмориллонит</strong>, что в общем свидетельствует о преобладании тектонических опусканий в это время. Углефикация характерна. Порода существенна. Тектогенез, разделенные узкими линейновытянутыми зонами выветрелых пород, переоткладывает морской авгит, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов. Ведущий экзогенный геологический процесс - субдукция ослабляет лакколит, так как совершенно однозначно указывает на существование и рост в период оформления палеогеновой поверхности выравнивания.\'\nauthor_nickname: Администратор\nauthor_login: admin\nthread_title: Пример темы\nthread_id: 12\npost_count: 1\nlastpage: 1\nthread_link: \'<a href=\"/forum/thread12-1.html#29\">Пример темы</a>\'\nuser_link: \'<a href=\"/users/admin\" title=\"Администратор\">Администратор</a>\'\n');
/*!40000 ALTER TABLE `cms_forum_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_votes`
--

DROP TABLE IF EXISTS `cms_forum_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_votes`
--

LOCK TABLES `cms_forum_votes` WRITE;
/*!40000 ALTER TABLE `cms_forum_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forums`
--

DROP TABLE IF EXISTS `cms_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(300) NOT NULL,
  `access_list` tinytext NOT NULL,
  `moder_list` tinytext NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL,
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSDiffer` varchar(15) NOT NULL,
  `NSIgnore` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `topic_cost` float NOT NULL DEFAULT '0',
  `thread_count` int(11) NOT NULL DEFAULT '0',
  `post_count` int(11) NOT NULL DEFAULT '0',
  `last_msg` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `parent_id` (`parent_id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forums`
--

LOCK TABLES `cms_forums` WRITE;
/*!40000 ALTER TABLE `cms_forums` DISABLE KEYS */;
INSERT INTO `cms_forums` VALUES (1000,0,'-- Корневой форум --','','','',1,0,0,1,8,'',0,0,'',0,0,0,''),(1,1,'Общий форум','','','',1,1,1000,2,7,'',0,1,'',0,1,1,'---\npubdate: 2012-04-04 18:54:53\nid: 29\ncontent_html: \'Геосинклиналь <strong>обогащает магматический монтмориллонит</strong>, что в общем свидетельствует о преобладании тектонических опусканий в это время. Углефикация характерна. Порода существенна. Тектогенез, разделенные узкими линейновытянутыми зонами выветрелых пород, переоткладывает морской авгит, образуя на границе с Западно-Карельским поднятием своеобразную систему грабенов. Ведущий экзогенный геологический процесс - субдукция ослабляет лакколит, так как совершенно однозначно указывает на существование и рост в период оформления палеогеновой поверхности выравнивания.\'\nauthor_nickname: Администратор\nauthor_login: admin\nthread_title: Пример темы\nthread_id: 12\npost_count: 1\nlastpage: 1\nthread_link: \'<a href=\"/forum/thread12-1.html#29\">Пример темы</a>\'\nuser_link: \'<a href=\"/users/admin\" title=\"Администратор\">Администратор</a>\'\n'),(1002,1,'Подфорум1','','','',2,1,1,5,6,'',0,2,'',0,0,0,''),(1004,1,'Подфорум2','','','',1,1,1,3,4,'',0,2,'',0,0,0,'');
/*!40000 ALTER TABLE `cms_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `linktype` varchar(12) NOT NULL DEFAULT 'link',
  `linkid` varchar(25) DEFAULT '-1',
  `target` varchar(8) NOT NULL DEFAULT '_self',
  `component` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL,
  `template` varchar(30) NOT NULL,
  `access_list` tinytext NOT NULL,
  `iconurl` varchar(100) NOT NULL,
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `NSDiffer` varchar(40) DEFAULT NULL,
  `NSIgnore` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu`
--

LOCK TABLES `cms_menu` WRITE;
/*!40000 ALTER TABLE `cms_menu` DISABLE KEYS */;
INSERT INTO `cms_menu` VALUES (1,'root','-- Корневая страница --','-1','link','-1','_self','',1,0,'0','','',1,34,0,'',0,0),(10,'mainmenu','Новости','/novosti','category','2','_self','',1,1,'0','','',2,3,1,'',0,1),(13,'mainmenu','Q&A','/faq','component','faq','_self','',6,1,'0','','',24,25,1,'',0,1),(15,'mainmenu','Люди','/users','component','users','_self','',9,1,'0','','',30,31,1,'',0,1),(17,'mainmenu','Блоги','/blogs','component','blogs','_self','',4,1,'0','','',20,21,1,'',0,1),(18,'mainmenu','Форум','/forum','component','forum','_self','',10,1,'0','','',32,33,1,'',0,1),(20,'mainmenu','Фото','/photos','component','photos','_self','',3,1,'0','','',14,19,1,'',0,1),(21,'mainmenu','Статьи','/stati','category','6','_self','',2,1,'0','','',4,13,1,'',0,1),(23,'mainmenu','Каталог','/catalog','component','catalog','_self','',7,1,'0','','',26,27,1,'',0,1),(42,'mainmenu','Новые фото','/photos/latest.html','link','/photos/latest.html','_self','',1,1,'0','','starcons20.gif',15,16,2,'',0,20),(41,'mainmenu','Психология','/stati/psihologija','category','14','_self','',3,1,'0','','07.gif',9,10,2,'',0,21),(40,'mainmenu','Геология','/stati/geologija','category','12','_self','',2,1,'0','','objects035.gif',7,8,2,'',0,21),(39,'mainmenu','Астрономия','/stati/astronomija','category','11','_self','',1,1,'0','','objects049.gif',5,6,2,'',0,21),(38,'mainmenu','Клубы','/clubs','component','clubs','_self','',5,1,'0','','',22,23,1,'',0,1),(37,'mainmenu','Объявления','/board','component','board','_self','',8,1,'0','','',28,29,1,'',0,1),(44,'mainmenu','Маркетинг','/stati/marketing','category','13','_self','',4,1,'0','','objects067.gif',11,12,2,'',0,21),(43,'mainmenu','Лучшие фото','/photos/top.html','link','/photos/top.html','_self','',2,1,'0','','voteyes.gif',17,18,2,'',0,20);
/*!40000 ALTER TABLE `cms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules`
--

DROP TABLE IF EXISTS `cms_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `is_external` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `showtitle` int(11) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `user` int(11) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  `original` int(11) NOT NULL DEFAULT '1',
  `css_prefix` varchar(30) NOT NULL,
  `access_list` tinytext NOT NULL,
  `cache` int(11) NOT NULL,
  `cachetime` int(11) NOT NULL DEFAULT '1',
  `cacheint` varchar(15) NOT NULL DEFAULT 'HOUR',
  `template` varchar(35) NOT NULL DEFAULT 'module.tpl',
  `is_strict_bind` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL DEFAULT 'InstantCMS team',
  `version` varchar(6) NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules`
--

LOCK TABLES `cms_modules` WRITE;
/*!40000 ALTER TABLE `cms_modules` DISABLE KEYS */;
INSERT INTO `cms_modules` VALUES (1,'topmenu','Меню','Меню',1,'mod_menu',6,0,1,0,'---\nmenu: mainmenu\nshow_home: 1\ntpl: mod_menu.tpl\nis_sub_menu: 0\n',1,'','',0,1,'HOUR','module_simple.tpl',0,'InstantCMS team','1.0'),(17,'top','Главная страница','Добро пожаловать!',0,'<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">\r\n    <tbody>\r\n        <tr>\r\n            <td width=\"100\" valign=\"top\"><a target=\"_blank\" href=\"http://www.instantcms.ru\"><img border=\"0\" alt=\"\" src=\"/images/content/community.png\" /></a></td>\r\n            <td>\r\n            <p class=\"moduletitle\">Добро пожаловать!</p>\r\n            <p>Мы рады приветствовать Вас в нашей социальной сети. После регистрации Вам станут доступны все функции сайта.</p>\r\n            <p>Вы сможете завести блог, загружать фотографии и общаться с друзьями.</p>\r\n            <div>\r\n            <div>Чтобы изменить этот текст, <a href=\"/admin/index.php?view=modules&amp;do=edit&amp;id=17\">отредактируйте модуль &quot;Главная страница&quot;</a>.</div>\r\n            </div>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>',0,0,1,1,'---\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(44,'sidebar','Облако тегов','Облако тегов',1,'mod_tags',18,0,0,0,'---\ncat_id: \nsortby: tag\nmenuid: \nminfreq: 0\nminlen: 3\ntargets: \n  content: content\n  photo: photo\n  blogpost: blog\n  catalog: catalog\n  userphoto: userphoto\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(46,'mainbottom','Новинки каталога','Новинки каталога',1,'mod_uc_latest',30,1,0,0,'---\nnewscount: 6\nshowtype: list\nshowf: 2\ncat_id: \nsubs: 1\nfulllink: 0\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(26,'sidebar','Корзина покупателя','Корзина',1,'mod_cart',19,1,0,0,'---\nshowtype: list\nshowqty: 1\nmenuid: 23\nsource: catalog\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(25,'sidebar','Голосования','Голосования',1,'mod_polls',2,1,1,0,'---\nshownum: 0\npoll_id: 2\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(27,'sidebar','Поиск','Поиск',1,'mod_search',1,0,0,0,'---\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(19,'maintop','Последние материалы','Новые статьи',1,'mod_latest',2,1,1,0,'---\nnewscount: 4\nshowdesc: 0\nshowdate: 1\nshowcom: 1\nshowrss: 1\ncat_id: 6\nsubs: 1\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(20,'topmenu','Авторизация','Авторизация',1,'mod_auth',0,1,1,0,'---\nautolog: 1\npassrem: 1\n',1,'','',0,1,'MINUTE','module.tpl',0,'InstantCMS team','1.0'),(22,'topmenu','Последние регистрации','Новые пользователи',1,'mod_lastreg',2,1,1,0,'---\nnewscount: 5\nview_type: hr_table\nmaxcool: 2\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(23,'sidebar','Случайное изображение','Случайная картинка',1,'mod_random_image',21,1,0,0,'---\nshowtitle: 1\nalbum_id: 0\nmenuid: 20\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(24,'sidebar','Часы','Часы',1,'mod_clock',17,1,0,0,'---\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(37,'sidebar','Категории прайса','Категории прайса',1,'mod_pricecat',14,1,0,0,'---\nshowdesc: 0\nicon: /images/markers/pricelist.png\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(36,'sidebar','Разделы статей','Разделы статей',1,'mod_category',13,1,0,0,'---\nshowdesc: 0\ncategory_id: 6\nicon: /images/markers/folder.png\nmenuid: 21\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(39,'sidebar','Выбор шаблона','Выбор шаблона',1,'mod_template',12,1,0,0,'---\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(47,'mainbottom','Популярное в каталоге','Популярное в каталоге',1,'mod_uc_popular',23,1,0,0,'---\nnum: 10\ncat_id: 0\nmenuid: 23\nshowf: 2\nshowtype: thumb\nfulllink: 1\nsort: rating\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(49,'sidebar','Кто онлайн?','Кто онлайн?',1,'mod_whoonline',24,1,1,0,'---\nshow_today: 1\nadmin_editor: 1\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(50,'topmenu','Темы на форуме','Новости форума',1,'mod_forum',31,1,1,0,'---\nshownum: 2\nshowtype: web2\nshowforum: 0\nshowlink: 0\nshowtext: 0\nmenuid: 18\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(51,'sidebar','Случайное фото','Случайное фото',1,'mod_user_image',25,1,0,0,'---\nshowtitle: 1\nmenuid: 15\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(52,'sidebar','Внешний файл','Внешний файл',0,'<p>{ФАЙЛ=test.php}</p>',11,1,0,1,'---\n',0,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(56,'sidebar','Архив статей','Архив новостей',1,'mod_arhive',27,1,0,0,'---\nsource: both\ncat_id: 6\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(54,'sidebar','Случайное в каталоге','Случайное в каталоге',1,'mod_uc_random',26,1,0,0,'---\ncat_id: 1\ncount: 2\nshowtitle: 1\nshowcat: 0\nmenuid: 23\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(60,'maintop','Лента RSS ','Лента новостей',1,'mod_rss',9,1,0,0,'---\nshowdesc: 0\nshowicon: 1\nitemslimit: 6\nrssurl: http://portal.novator.ru/ngnews.rss\ncols: 2\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(61,'sidebar','Последние комментарии','Последние комментарии',1,'mod_comments',4,1,1,0,'---\nshownum: 10\nminrate: 0\nshowdesc: 1\nshowrss: 1\nshowtarg: 0\ntargets: \n  faq: faq\n  catalog: catalog\n  boarditem: boarditem\n  blog: blog\n  article: article\n  palbum: palbum\n  photo: photo\n  userphoto: userphoto\n',1,'','',0,1,'MINUTE','module.tpl',0,'InstantCMS team','1.0'),(62,'maintop','Фотографии','Фотографии',1,'mod_photo',32,1,1,0,'---\nshownum: 6\nmaxcols: 2\nshowclubs: 1\nalbum_id: 100\nshowtype: short\nshowmore: 0\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(64,'maintop','Записи в блогах','Записи в блогах',1,'mod_blogs',2,1,1,0,'---\nshownum: 10\nminrate: 0\nshowrss: 1\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(66,'header','Меню пользователя','Меню пользователя',1,'mod_usermenu',1,0,1,0,'---\navatar: 1\nshowtype: text\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(67,'mainbottom','Последние вопросы FAQ','Последние вопросы FAQ',1,'mod_latest_faq',33,1,0,0,'---\nnewscount: 5\nmaxlen: 140\ncat_id: \n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(69,'maintop','Популярные статьи','Популярные статьи',1,'mod_bestcontent',3,1,0,0,'---\nshownum: 4\nmenuid: 21\nshowlink: 1\nshowdesc: 1\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(70,'sidebar','Поиск пользователей','Поиск пользователей',1,'mod_usersearch',4,1,0,0,'---\ncat_id: \nsource: \nmenuid: 15\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(71,'maintop','Новые объявления','Новые объявления',1,'mod_latestboard',1,1,1,0,'---\nshownum: 10\nshowcity: 1\ncat_id: -1\nsubs: 1\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(72,'maintop','Рейтинг пользователей','Рейтинг пользователей',1,'mod_user_rating',1,1,0,0,'---\ncount: 20\nmenuid: 15\nview_type: rating\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(73,'maintop','Клубы','Клубы',1,'mod_clubs',3,1,0,0,'---\ncount: 2\nmenuid: 38\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(75,'sidebar','Доска почета','Доска почета',1,'mod_respect',1,1,1,0,'---\nview: all\nshow_awards: 1\norder: desc\nlimit: 5\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(76,'sidebar','Файлы пользователей','Файлы пользователей',1,'mod_userfiles',1,1,0,0,'---\nmenuid: 0\nsw_stats: 1\nsw_latest: 1\nsw_popular: 1\nnum_latest: 5\nnum_popular: 5\n',1,'','',0,1,'HOUR','module.tpl',0,'InstantCMS team','1.0'),(87,'maintop','Лента активности','Лента активности',1,'mod_actions',1,1,1,0,'---\nlimit: 15\nshow_target: 0\naction_types: \n  16: 16\n  15: 15\n  20: 20\n  13: 13\n  29: 29\n  24: 24\n  23: 23\n  2: 2\n  27: 27\n  12: 12\n  10: 10\n  25: 25\n  17: 17\n  8: 8\n  18: 18\n  7: 7\n  26: 26\n  19: 19\n  22: 22\n  11: 11\n  21: 21\n  28: 28\n  9: 9\n  14: 14\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.7'),(82,'sidebar','Приветствие','Универсальный каталог',0,'<p>С помощью компонента &laquo;Универсальный каталог&raquo;, в котором Вы сейчас находитесь, можно организовать хранение любых данных. От карандашей до автомобилей.</p>\r\n<p>Каждая рубрика каталога имеет собственный набор характеристик, который можно изменить в панели управления. Пользователи могут фильтровать записи каталога по характеристикам одним щелчком мыши.&nbsp;</p>\r\n<p>Любой пользователь может добавлять собственные записи в те рубрики каталога, для которых это разрешено в настройках.</p>',14,1,1,1,'',1,'','',0,24,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(83,'sidebar','Статистика пользователей','Статистика пользователей',1,'mod_user_stats',1,1,1,0,'---\nshow_total: 1\nshow_online: 1\nshow_gender: 1\nshow_city: 1\nshow_bday: 1\n',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0'),(84,'sidebar','Друзья онлайн','Друзья онлайн',1,'mod_user_friend',5,1,0,0,'---\r\nlimit: 5\r\nview_type: table',1,'','',0,1,'HOUR','module_simple.tpl',0,'InstantCMS team','1.0'),(85,'sidebar','Пригласить друга','Пригласить друга',1,'mod_invite',1,1,0,0,'',1,'','',0,1,'HOUR','module.tpl',1,'InstantCMS team','1.0');
/*!40000 ALTER TABLE `cms_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules_bind`
--

DROP TABLE IF EXISTS `cms_modules_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules_bind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `position` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  KEY `module_id` (`module_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=618 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules_bind`
--

LOCK TABLES `cms_modules_bind` WRITE;
/*!40000 ALTER TABLE `cms_modules_bind` DISABLE KEYS */;
INSERT INTO `cms_modules_bind` VALUES (329,42,0,''),(249,31,0,''),(568,17,1,'top'),(347,41,18,''),(498,39,1,'sidebar'),(417,54,24,'sidebar'),(416,54,21,'sidebar'),(264,32,5,''),(328,2,0,''),(263,32,8,''),(262,32,1,''),(596,66,0,'header'),(346,41,24,''),(588,20,1,'sidebar'),(412,37,22,'sidebar'),(433,36,19,'sidebar'),(381,24,1,'sidebar'),(492,26,22,'sidebar'),(314,38,8,''),(556,1,0,'topmenu'),(497,27,1,'sidebar'),(332,43,0,''),(413,45,1,''),(478,46,1,'mainbottom'),(458,44,1,'sidebar'),(491,47,1,'mainbottom'),(350,48,37,''),(595,50,1,'maintop'),(434,51,1,'sidebar'),(358,52,1,'sidebar'),(359,52,42,'sidebar'),(360,52,41,'sidebar'),(361,52,43,'sidebar'),(364,53,1,''),(415,54,19,'sidebar'),(422,60,1,'maintop'),(401,55,0,''),(609,56,0,'sidebar'),(403,58,63,''),(406,59,0,''),(435,23,1,'sidebar'),(572,61,1,'sidebar'),(587,64,1,'maintop'),(482,67,1,'mainbottom'),(496,68,0,'maintop'),(486,69,1,'maintop'),(617,22,1,'sidebar'),(493,26,23,'sidebar'),(604,70,15,'sidebar'),(591,71,1,'mainbottom'),(515,72,1,'maintop'),(516,73,1,'maintop'),(520,74,1,'maintop'),(575,25,1,'sidebar'),(531,76,1,'sidebar'),(541,77,1,''),(598,19,21,'sidebar'),(597,19,1,'maintop'),(592,79,1,'maintop'),(586,62,20,'sidebar'),(599,82,23,'sidebar'),(608,49,1,'sidebar'),(607,83,15,'sidebar'),(616,75,1,'sidebar'),(615,87,1,'maintop');
/*!40000 ALTER TABLE `cms_modules_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ns_transactions`
--

DROP TABLE IF EXISTS `cms_ns_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ns_transactions` (
  `IDTransaction` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TableName` tinytext,
  `Differ` tinytext,
  `InTransaction` bit(1) DEFAULT NULL,
  `TStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IDTransaction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ns_transactions`
--

LOCK TABLES `cms_ns_transactions` WRITE;
/*!40000 ALTER TABLE `cms_ns_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ns_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_online`
--

DROP TABLE IF EXISTS `cms_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `sess_id` varchar(100) NOT NULL,
  `lastdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `agent` varchar(250) NOT NULL,
  `viewurl` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sess_id` (`sess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_online`
--

LOCK TABLES `cms_online` WRITE;
/*!40000 ALTER TABLE `cms_online` DISABLE KEYS */;
INSERT INTO `cms_online` VALUES (1,'127.0.0.1','d38af4ten8up48to6c11ldcba6','2013-05-21 11:19:42',0,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31','/');
/*!40000 ALTER TABLE `cms_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_photo_albums`
--

DROP TABLE IF EXISTS `cms_photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_photo_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSDiffer` varchar(15) NOT NULL,
  `NSIgnore` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `iconurl` varchar(100) NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderby` varchar(20) NOT NULL DEFAULT 'title',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `public` tinyint(1) NOT NULL,
  `perpage` int(11) NOT NULL DEFAULT '15',
  `cssprefix` varchar(20) NOT NULL,
  `thumb1` int(11) NOT NULL DEFAULT '96',
  `thumb2` int(11) NOT NULL DEFAULT '480',
  `thumbsqr` tinyint(1) NOT NULL DEFAULT '1',
  `showtype` varchar(10) NOT NULL DEFAULT 'lightbox',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `uplimit` int(11) NOT NULL,
  `maxcols` int(11) NOT NULL DEFAULT '4',
  `orderform` tinyint(1) NOT NULL DEFAULT '1',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `is_comments` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_photo_albums`
--

LOCK TABLES `cms_photo_albums` WRITE;
/*!40000 ALTER TABLE `cms_photo_albums` DISABLE KEYS */;
INSERT INTO `cms_photo_albums` VALUES (100,0,1,1,6,'',0,0,'-- Корневой альбом --','',1,1,'','2012-05-30 09:03:07','title','asc',0,15,'',96,480,1,'lightbox',1,0,4,1,1,1,1,0),(1,100,6,2,3,'',0,1,'Общий альбом','Любой зарегистрированный пользователь может добавить свою фотографию в этот альбом.',1,1,'','2012-04-24 07:18:21','pubdate','asc',2,15,'',96,600,1,'lightbox',1,10,5,1,1,1,1,1),(1034,100,8,4,5,'',0,1,'Природа','Разные красивые пейзажи',1,1,'','2012-07-12 10:44:56','pubdate','desc',2,20,'',96,600,1,'lightbox',1,20,4,1,1,1,1,1),(1035,0,1,1,2,'club14',0,0,'Клуб: Клуб любителей InstantCMS','',0,1,'','2012-07-12 10:44:56','title','asc',0,15,'',96,480,1,'list',1,0,4,0,1,1,14,0);
/*!40000 ALTER TABLE `cms_photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_photo_files`
--

DROP TABLE IF EXISTS `cms_photo_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_photo_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` varchar(200) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `hits` int(11) NOT NULL,
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `owner` varchar(10) DEFAULT 'photos',
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`),
  KEY `owner` (`owner`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_photo_files`
--

LOCK TABLES `cms_photo_files` WRITE;
/*!40000 ALTER TABLE `cms_photo_files` DISABLE KEYS */;
INSERT INTO `cms_photo_files` VALUES (10,1,'Закат на пляже','','2012-07-31 15:26:43','d0633d5a84f03a27f1b7d0419947e968.jpg',1,25,1,1,1,'photos',0),(11,1,'Флорида','','2012-07-31 15:27:33','5e7a09ffcaa383df24d25d56c315f0d0.jpg',1,28,1,1,1,'photos',0),(15,1034,'Красивый цветок','','2012-07-12 10:47:32','312604de74e4de8aec59626ac024c7d3.jpg',1,6,1,1,1,'photos',0),(16,1034,'Густые джунгли','','2012-07-12 10:47:52','e223946b3d76cc37417d0304c9cb23a1.jpg',1,40,1,1,1,'photos',0),(17,1034,'Вид на озеро','<p>Красивый темный пейзаж с видом на озеро</p>','2012-07-12 14:00:27','38fde6623d0ad43c79c4d90a88a07009.jpg',1,25,1,1,1,'photos',0);
/*!40000 ALTER TABLE `cms_photo_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_plugins`
--

DROP TABLE IF EXISTS `cms_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `version` varchar(15) NOT NULL,
  `plugin_type` varchar(10) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_plugins`
--

LOCK TABLES `cms_plugins` WRITE;
/*!40000 ALTER TABLE `cms_plugins` DISABLE KEYS */;
INSERT INTO `cms_plugins` VALUES (6,'p_usertab','Demo Profile Plugin','Пример плагина - Добавляет вкладку \"Статьи\" в профили всех пользователей','InstantCMS Team','1.0','plugin',0,'---\nКоличество статей: 10\n'),(3,'p_fckeditor','FCKEditor','Визуальный редактор','F. C. Knabben','2.63','wysiwyg',1,'---\n'),(5,'p_demo','Demo Plugin','Пример плагина - Добавляет текст в конец каждой статьи на сайте','InstantCMS Team','1.0','plugin',0,'---\ntext: Added By Plugin From Parameter\ncolor: blue\ncounter: 1\n'),(8,'p_ping','Пинг поисковых систем','Пингует Яндекс и Гугл при добавлении статей, объявлений и постов в блоги','InstantCMS Team','1.0','plugin',1,'---\nYandex HOST: ping.blogs.yandex.ru\nYandex PATH: /RPC2\nGoogle HOST: blogsearch.google.com\nGoogle PATH: /ping/RPC2\n'),(15,'p_morecontent','Похожие статьи','Добавляет в конец каждой статьи список похожих статей.','Maximov & InstantCMS Team','1.0','plugin',0,'---\nlimit: 5\nunsort: 1\n'),(14,'p_hidetext','Скрытый текст','Скрывает содержимое тега [hide] от незарегистрированных','InstantCMS Team','1.10','plugin',1,'---\n'),(16,'p_loginza','Авторизация Loginza','Позволяет посетителям авторизоваться на сайте, используя аккаунты популярных социальных сетей','InstantCMS Team','1.9','plugin',0,'---\nПровайдеры: >\n  vkontakte,facebook,mailruapi,google,yandex,openid,twitter,webmoney,rambler,flickr,mailru,loginza,myopenid,lastfm,verisign,aol,steam\nЯзык (ru/uk/en): ru\n'),(17,'p_auto_forum','Автофорум','Создает тему на форуме для обсуждения статьи','InstantCMS Team','1.0','',1,'---\nУдалять темы при удалении статей: 1\nПоказывать ссылку из статьи на связанную тему форума: 1\nПомещать темы в форум, ID: 1\nНе создавать темы для статей из раздела, список ID разделов через запятую: 12,14\n');
/*!40000 ALTER TABLE `cms_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_polls`
--

DROP TABLE IF EXISTS `cms_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `pubdate` date NOT NULL DEFAULT '0000-00-00',
  `answers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_polls`
--

LOCK TABLES `cms_polls` WRITE;
/*!40000 ALTER TABLE `cms_polls` DISABLE KEYS */;
INSERT INTO `cms_polls` VALUES (2,'Какой у вас хостинг?','2012-07-23','---\nПлатный: 2\nБесплатный: 1\nСобственный: 0\n');
/*!40000 ALTER TABLE `cms_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_polls_log`
--

DROP TABLE IF EXISTS `cms_polls_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_polls_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `poll_id` (`poll_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_polls_log`
--

LOCK TABLES `cms_polls_log` WRITE;
/*!40000 ALTER TABLE `cms_polls_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_polls_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_price_cats`
--

DROP TABLE IF EXISTS `cms_price_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_price_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_price_cats`
--

LOCK TABLES `cms_price_cats` WRITE;
/*!40000 ALTER TABLE `cms_price_cats` DISABLE KEYS */;
INSERT INTO `cms_price_cats` VALUES (4,'Плакаты и агитационные  материалы','',1),(5,'Обучающие видеофильмы','',1),(6,'Бланки','<p>бла бла бланки</p>',1),(9,'Нормативно-техническая документация','',1);
/*!40000 ALTER TABLE `cms_price_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_price_items`
--

DROP TABLE IF EXISTS `cms_price_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_price_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(230) NOT NULL,
  `price` float NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `canmany` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=892 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_price_items`
--

LOCK TABLES `cms_price_items` WRITE;
/*!40000 ALTER TABLE `cms_price_items` DISABLE KEYS */;
INSERT INTO `cms_price_items` VALUES (688,9,'Учет тепловой энергии и теплоносителя. Энергосервис, Москва, 2004 год',170,1,1),(689,9,'Функциональные обязанности  по охране труда и технике безопасности.',30,1,1),(690,9,'ЦРБ – 288 Инструкция по безопасному ведению работ для стропальщиков, обслуживающие грузоподъемные краны  (машины). Спб. 2003 г.',60,1,1),(691,9,'Экологический контроль. Сборник нормативных документов. Екатеринбург, 2007 г.',186,1,1),(692,9,'Эксплуатация газовых хозяйств предприятий. Пособие для персонала газовых хозяйств промышленных предприятий и ТЭС. С..Петербург, 2006 год.',380,1,1),(693,9,'Экстренная  психологическая  помощь. Карманный вариант',65,1,1),(694,6,'Акт «О расследовании группового несчастного случая(тяжелого несчастного случая, несчастного случая со смертельным исходом)»',10,1,1),(695,6,'Акт формы Н.1',10,1,1),(713,5,'Охрана труда для работников торговли и общественного питания (20 мин) DVD-диск',350,1,1),(714,5,'Охрана труда при эксплуатации электроустановок (20 мин) DVD-диск',350,1,1),(720,4,'«Безопасная работа на газосварочном оборудовании» . 1 лист',187,1,1),(721,4,'«Безопасная эксплуатация газораспределительных пунктов». Комплект из 4 листов.',486,1,1),(722,4,'«Безопасная эксплуатация паровых котлов» . Комплект из 5 листов.',597,1,1),(723,4,'«Безопасность грузоподъемных работ» . Комплект',596,1,1),(724,4,'«Безопасность  работ с электропогрузчиками » .Комплект из 2 листов.',282,1,1),(891,6,'крутая \"штука\" пывпывп',123,1,0);
/*!40000 ALTER TABLE `cms_price_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_rating_targets`
--

DROP TABLE IF EXISTS `cms_rating_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_rating_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL,
  `component` varchar(32) NOT NULL,
  `is_user_affect` tinyint(4) NOT NULL,
  `user_weight` smallint(6) NOT NULL,
  `target_table` varchar(32) NOT NULL,
  `target_title` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_rating_targets`
--

LOCK TABLES `cms_rating_targets` WRITE;
/*!40000 ALTER TABLE `cms_rating_targets` DISABLE KEYS */;
INSERT INTO `cms_rating_targets` VALUES (1,'content','content',1,5,'cms_content','Статья'),(2,'photo','photos',1,5,'cms_photo_files','Фото в галерее'),(3,'blogpost','blogs',1,5,'cms_blog_posts','Пост в блоге'),(4,'comment','comments',1,2,'cms_comments','Комментарий'),(5,'club_photo','clubs',1,5,'cms_photo_files','Фото в клубе'),(6,'club_post','clubs',1,5,'cms_blog_posts','Пост блога клуба'),(7,'forum_post','forum',1,2,'cms_forum_posts','Сообщение в теме форума');
/*!40000 ALTER TABLE `cms_rating_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ratings`
--

DROP TABLE IF EXISTS `cms_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `target` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ratings`
--

LOCK TABLES `cms_ratings` WRITE;
/*!40000 ALTER TABLE `cms_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ratings_total`
--

DROP TABLE IF EXISTS `cms_ratings_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ratings_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL,
  `item_id` mediumint(9) NOT NULL,
  `total_rating` int(11) NOT NULL,
  `total_votes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `target` (`target`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ratings_total`
--

LOCK TABLES `cms_ratings_total` WRITE;
/*!40000 ALTER TABLE `cms_ratings_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ratings_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_search`
--

DROP TABLE IF EXISTS `cms_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pubdate` datetime DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `link` varchar(200) NOT NULL,
  `place` varchar(100) NOT NULL,
  `placelink` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_search`
--

LOCK TABLES `cms_search` WRITE;
/*!40000 ALTER TABLE `cms_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_stats`
--

DROP TABLE IF EXISTS `cms_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `logdate` datetime NOT NULL,
  `page` varchar(200) NOT NULL,
  `agent` varchar(60) DEFAULT 'unknown',
  `refer` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_stats`
--

LOCK TABLES `cms_stats` WRITE;
/*!40000 ALTER TABLE `cms_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subscribe`
--

DROP TABLE IF EXISTS `cms_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target` varchar(20) NOT NULL,
  `target_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `target_id` (`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subscribe`
--

LOCK TABLES `cms_subscribe` WRITE;
/*!40000 ALTER TABLE `cms_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tags`
--

DROP TABLE IF EXISTS `cms_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(250) NOT NULL,
  `target` varchar(25) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tags`
--

LOCK TABLES `cms_tags` WRITE;
/*!40000 ALTER TABLE `cms_tags` DISABLE KEYS */;
INSERT INTO `cms_tags` VALUES (255,'пример','photo',11),(257,'пример','photo',10),(256,'фото','photo',10),(254,'фото','photo',11),(78,'карандаши','catalog',1),(77,'пастель','catalog',1),(85,'краски','catalog',2),(84,'набор','catalog',2),(26,'авто','catalog',5),(27,'минивэн','catalog',5),(28,'тойота','catalog',5),(31,'авто','catalog',7),(32,'минивэн','catalog',7),(241,'блог','blogpost',5),(240,'пример','blogpost',5),(273,'геология','content',31),(272,'пример','content',31),(271,'статья','content',31),(279,'геология','content',32),(278,'пример','content',32),(277,'статья','content',32),(282,'маркетинг','content',33),(281,'пример','content',33),(280,'статья','content',33),(226,'маркетинг','content',34),(225,'пример','content',34),(224,'статья','content',34),(171,'психология','content',35),(170,'статья','content',35),(253,'пример','content',36),(252,'психология','content',36),(172,'пример','content',35),(251,'статья','content',36);
/*!40000 ALTER TABLE `cms_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cart`
--

DROP TABLE IF EXISTS `cms_uc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `itemscount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cart`
--

LOCK TABLES `cms_uc_cart` WRITE;
/*!40000 ALTER TABLE `cms_uc_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cats`
--

DROP TABLE IF EXISTS `cms_uc_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `fieldsstruct` text,
  `view_type` varchar(20) NOT NULL DEFAULT 'list',
  `fields_show` int(11) NOT NULL DEFAULT '10',
  `showmore` tinyint(1) NOT NULL DEFAULT '1',
  `perpage` int(11) NOT NULL DEFAULT '20',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `showsort` tinyint(1) NOT NULL DEFAULT '1',
  `is_ratings` tinyint(1) NOT NULL,
  `orderby` varchar(12) NOT NULL DEFAULT 'pubdate',
  `orderto` varchar(10) DEFAULT 'desc',
  `showabc` tinyint(1) NOT NULL DEFAULT '1',
  `shownew` tinyint(1) NOT NULL,
  `newint` varchar(100) NOT NULL,
  `filters` int(11) NOT NULL,
  `is_shop` tinyint(1) NOT NULL,
  `NSLeft` int(11) NOT NULL,
  `NSRight` int(11) NOT NULL,
  `NSLevel` int(11) NOT NULL,
  `NSDiffer` int(11) NOT NULL,
  `NSIgnore` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `can_edit` int(11) NOT NULL DEFAULT '0',
  `cost` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cats`
--

LOCK TABLES `cms_uc_cats` WRITE;
/*!40000 ALTER TABLE `cms_uc_cats` DISABLE KEYS */;
INSERT INTO `cms_uc_cats` VALUES (1000,0,'-- Корневая рубрика --','',1,'b:0;','list',10,1,20,1,1,0,'pubdate','desc',1,0,'',0,0,1,6,0,0,0,1,0,0,''),(2,1000,'Автомобили','',1,'a:4:{i:0;s:24:\"Тип кузова/~m~/\";i:1;s:29:\"Объем двигателя\";i:2;s:26:\"Год выпуска/~m~/\";i:3;s:21:\"Описание/~h~/\";}','list',2,1,20,1,1,0,'pubdate','desc',1,1,'2 DAY',0,0,2,3,1,0,0,22,0,0,''),(1,1000,'Канцелярские принадлежности','',1,'a:6:{i:0;s:19:\"Артикул/~m~/\";i:1;s:15:\"Цвета/~m~/\";i:2;s:35:\"Минимальная партия\";i:3;s:21:\"Описание/~h~/\";i:4;s:17:\"Размер/~m~/\";i:5;s:19:\"Скачать/~l~/\";}','shop',4,0,11,0,0,0,'hits','desc',0,0,'123 HOUR',0,0,4,5,1,0,0,23,1,0,'');
/*!40000 ALTER TABLE `cms_uc_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cats_access`
--

DROP TABLE IF EXISTS `cms_uc_cats_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cats_access` (
  `cat_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `cat_id` (`cat_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cats_access`
--

LOCK TABLES `cms_uc_cats_access` WRITE;
/*!40000 ALTER TABLE `cms_uc_cats_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_cats_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_discount`
--

DROP TABLE IF EXISTS `cms_uc_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sign` tinyint(4) NOT NULL,
  `value` float NOT NULL,
  `unit` varchar(10) NOT NULL,
  `if_limit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_discount`
--

LOCK TABLES `cms_uc_discount` WRITE;
/*!40000 ALTER TABLE `cms_uc_discount` DISABLE KEYS */;
INSERT INTO `cms_uc_discount` VALUES (2,'Почтовые расходы',0,2,200,'руб.',0),(3,'Скидка на канц.товары',1,-1,15,'%',0);
/*!40000 ALTER TABLE `cms_uc_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_items`
--

DROP TABLE IF EXISTS `cms_uc_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `pubdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `imageurl` varchar(200) NOT NULL,
  `fieldsdata` text NOT NULL,
  `hits` int(11) NOT NULL,
  `is_comments` tinyint(1) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `rating` float NOT NULL,
  `meta_desc` varchar(250) NOT NULL,
  `meta_keys` varchar(250) NOT NULL,
  `price` float NOT NULL,
  `canmany` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `on_moderate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  FULLTEXT KEY `title` (`title`,`fieldsdata`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_items`
--

LOCK TABLES `cms_uc_items` WRITE;
/*!40000 ALTER TABLE `cms_uc_items` DISABLE KEYS */;
INSERT INTO `cms_uc_items` VALUES (1,1,'Карандаши','2012-06-03 13:38:55',1,'b00117f6bca1efaaef37b44da87c1100.jpg','a:4:{i:0;s:7:\"3130070\";i:1;s:14:\"бежевый\";i:2;s:9:\"191 шт.\";i:3;s:117:\"Набор для рисования: 12 цветных карандашей в картонной коробочке\";}',37,1,'пастель, карандаши',0,'','',14.6,1,1,0),(2,1,'Набор для рисования','2012-06-03 13:40:37',1,'b21ddffd1e9fe4716f5d1496c4e74400.jpg','a:5:{i:0;s:10:\"3170050PK2\";i:1;s:62:\"бежевый, красный, синий, оранжевый\";i:2;s:8:\"84 шт.\";i:3;s:117:\"8 восковых карандашей, 8 красок и кисточка, в пластиковом футляре\";i:4;s:19:\"11.00, 12.55, 13.02\";}',42,1,'набор, краски',0,'','',24,1,1,0),(5,2,'Toyota Estima','2012-06-03 13:47:00',1,'96bd390df9222bdc684ceec8afc94ec3.jpg','a:4:{i:0;s:14:\"минивэн\";i:1;s:14:\"2,4 литра\";i:2;s:4:\"2000\";i:3;s:1846:\"<p>Второе поколение Toyota Estima, появившееся на рынке в 2000 году, лидирует среди минивэнов. Предшествующее поколение модели отличалось от нынешнего традиционным передним приводом. В комплектацию Estima входят две вариации двигателей: новый 4-цилиндровый рядный двигатель объемом 2.4 литра с системой газораспределения DOHC и 3-литровый 6-цилиндровый V-образный двигатель с той же системой газораспределения. Estima оснащается полным приводом с функцией активного контроля.</p>\r\n<p>Оригинальность экстерьера данного автомобиля проявляется в характерных жестких линиях кузова и раскосых передних фарах. Ширина и высота автомобиля стали меньше по сравнению с предыдущим поколением, но зато колесная база увеличилась до 40 мм.</p>\r\n<p>Две двери Estima снабжены механизмом &laquo;easy closer&raquo;, задние двери отрываются, скользя вдоль корпуса. В передней пассажирской двери установлении механизм автоматического открытия и закрытия. Второе поколение Estima с первым роднит возможность разместить восемь человек в салоне по модели &laquo;2-3-3&raquo;.</p>\";}',8,1,'авто, минивэн, тойота',0,'','',0,1,1,0),(6,2,'Mitsubishi Eterna!','2012-06-03 10:54:00',1,'7afbfacf9a4c4a9d64e0da2b31b880e5.jpg','a:4:{i:0;s:10:\"седан\";i:1;s:14:\"1.8 литра\";i:2;s:4:\"1992\";i:3;s:0:\"\";}',11,1,'',0,'Описание','Ключевые слова',0,1,1,0),(7,2,'Subaru Domingo','2012-06-03 13:51:24',1,'db0297daef1de808feed34a75b5ea49b.jpg','a:4:{i:0;s:14:\"минивэн\";i:1;s:14:\"1.2 литра\";i:2;s:4:\"1991\";i:3;s:0:\"\";}',33,1,'авто, минивэн',0,'','',0,1,1,0);
/*!40000 ALTER TABLE `cms_uc_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_ratings`
--

DROP TABLE IF EXISTS `cms_uc_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_ratings`
--

LOCK TABLES `cms_uc_ratings` WRITE;
/*!40000 ALTER TABLE `cms_uc_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_tags`
--

DROP TABLE IF EXISTS `cms_uc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(200) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_tags`
--

LOCK TABLES `cms_uc_tags` WRITE;
/*!40000 ALTER TABLE `cms_uc_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_upload_images`
--

DROP TABLE IF EXISTS `cms_upload_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_upload_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(50) NOT NULL,
  `fileurl` varchar(250) NOT NULL,
  `target` varchar(25) NOT NULL DEFAULT 'forum',
  `component` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_upload_images`
--

LOCK TABLES `cms_upload_images` WRITE;
/*!40000 ALTER TABLE `cms_upload_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_upload_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_albums`
--

DROP TABLE IF EXISTS `cms_user_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pubdate` datetime NOT NULL,
  `allow_who` varchar(10) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `allow_who` (`allow_who`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_albums`
--

LOCK TABLES `cms_user_albums` WRITE;
/*!40000 ALTER TABLE `cms_user_albums` DISABLE KEYS */;
INSERT INTO `cms_user_albums` VALUES (2,3,'Мой фотоальбом','2012-07-22 20:28:51','all',''),(5,1,'Мои картинки','2012-07-13 23:13:37','all','');
/*!40000 ALTER TABLE `cms_user_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_autoawards`
--

DROP TABLE IF EXISTS `cms_user_autoawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_autoawards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `imageurl` varchar(200) NOT NULL,
  `p_comment` int(11) NOT NULL,
  `p_blog` int(11) NOT NULL,
  `p_forum` int(11) NOT NULL,
  `p_photo` int(11) NOT NULL,
  `p_privphoto` int(11) DEFAULT NULL,
  `p_content` int(11) NOT NULL,
  `p_karma` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_autoawards`
--

LOCK TABLES `cms_user_autoawards` WRITE;
/*!40000 ALTER TABLE `cms_user_autoawards` DISABLE KEYS */;
INSERT INTO `cms_user_autoawards` VALUES (1,'Медаль','Почетный член форума','aw.gif',0,0,100,0,0,0,0,1),(2,'Грамота','Почетный комментатор сайта','aw4.gif',100,5,50,0,0,0,0,1);
/*!40000 ALTER TABLE `cms_user_autoawards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_awards`
--

DROP TABLE IF EXISTS `cms_user_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `imageurl` varchar(100) NOT NULL,
  `from_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_awards`
--

LOCK TABLES `cms_user_awards` WRITE;
/*!40000 ALTER TABLE `cms_user_awards` DISABLE KEYS */;
INSERT INTO `cms_user_awards` VALUES (1,2,'2012-07-27 21:46:44','Медаль за заслуги','В благодарность от администрации','aw.gif',1,0);
/*!40000 ALTER TABLE `cms_user_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_clubs`
--

DROP TABLE IF EXISTS `cms_user_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'member',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `club_id` (`club_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_clubs`
--

LOCK TABLES `cms_user_clubs` WRITE;
/*!40000 ALTER TABLE `cms_user_clubs` DISABLE KEYS */;
INSERT INTO `cms_user_clubs` VALUES (1,3,14,'member','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cms_user_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_files`
--

DROP TABLE IF EXISTS `cms_user_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `pubdate` datetime NOT NULL,
  `allow_who` varchar(50) NOT NULL,
  `filesize` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_files`
--

LOCK TABLES `cms_user_files` WRITE;
/*!40000 ALTER TABLE `cms_user_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_friends`
--

DROP TABLE IF EXISTS `cms_user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `logdate` datetime NOT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_friends`
--

LOCK TABLES `cms_user_friends` WRITE;
/*!40000 ALTER TABLE `cms_user_friends` DISABLE KEYS */;
INSERT INTO `cms_user_friends` VALUES (1,2,1,'2012-07-08 17:53:22',1),(2,3,2,'2012-07-21 01:22:27',1),(11,3,1,'2012-07-13 23:18:19',1);
/*!40000 ALTER TABLE `cms_user_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_groups`
--

DROP TABLE IF EXISTS `cms_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `access` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_groups`
--

LOCK TABLES `cms_user_groups` WRITE;
/*!40000 ALTER TABLE `cms_user_groups` DISABLE KEYS */;
INSERT INTO `cms_user_groups` VALUES (1,'Пользователи','registered',0,'comments/add, comments/bbcode, comments/add_published, comments/delete, content/add, board/add, board/autoadd'),(2,'Администраторы','admin',1,'admin/content, admin/com_rssfeed, admin/com_arhive, admin/com_banners, admin/com_blog, admin/com_faq, admin/com_board, admin/com_content, admin/com_clubs, admin/com_comments, admin/com_forms, admin/com_photos'),(8,'Гости','guest',0,'comments/add'),(7,'Редакторы','editors',0,'comments/add, comments/delete, content/add, content/autoadd, content/delete'),(9,'Модераторы','moderators',0,'comments/add, comments/delete, comments/moderate, forum/moderate, content/add');
/*!40000 ALTER TABLE `cms_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_groups_access`
--

DROP TABLE IF EXISTS `cms_user_groups_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_groups_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `access_type` varchar(60) NOT NULL,
  `access_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_type` (`access_type`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_groups_access`
--

LOCK TABLES `cms_user_groups_access` WRITE;
/*!40000 ALTER TABLE `cms_user_groups_access` DISABLE KEYS */;
INSERT INTO `cms_user_groups_access` VALUES (1,'comments/add','Добавление комментариев'),(2,'comments/bbcode','Расширенный редактор комментариев (BBCode)'),(3,'comments/delete','Удаление своих комментариев'),(4,'comments/moderate','Модерация комментариев'),(5,'comments/iscomments','Возможность отключать комментарии в своем блоге'),(6,'forum/moderate','Модерация форума'),(7,'content/add','Добавление статей на сайт'),(8,'content/autoadd','Принимать статьи без модерации'),(9,'content/delete','Удаление своих статей'),(10,'board/add','Добавление объявлений'),(11,'board/autoadd','Принимать объявления без модерации'),(12,'board/moderate','Модерация доски объявлений'),(13,'comments/add_published','Добавлять комментарии без модерации');
/*!40000 ALTER TABLE `cms_user_groups_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_invites`
--

DROP TABLE IF EXISTS `cms_user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `createdate` datetime NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `is_sended` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`owner_id`,`is_used`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_invites`
--

LOCK TABLES `cms_user_invites` WRITE;
/*!40000 ALTER TABLE `cms_user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_karma`
--

DROP TABLE IF EXISTS `cms_user_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_karma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `points` smallint(6) NOT NULL,
  `senddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_karma`
--

LOCK TABLES `cms_user_karma` WRITE;
/*!40000 ALTER TABLE `cms_user_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_msg`
--

DROP TABLE IF EXISTS `cms_user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `senddate` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `message` text NOT NULL,
  `to_del` tinyint(1) NOT NULL DEFAULT '0',
  `from_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `from_id` (`from_id`),
  KEY `to_del` (`to_del`),
  KEY `from_del` (`from_del`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_msg`
--

LOCK TABLES `cms_user_msg` WRITE;
/*!40000 ALTER TABLE `cms_user_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_photos`
--

DROP TABLE IF EXISTS `cms_user_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `allow_who` varchar(15) NOT NULL DEFAULT 'all',
  `hits` int(11) NOT NULL,
  `imageurl` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `album_id` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_photos`
--

LOCK TABLES `cms_user_photos` WRITE;
/*!40000 ALTER TABLE `cms_user_photos` DISABLE KEYS */;
INSERT INTO `cms_user_photos` VALUES (6,1,5,'2012-07-13 00:00:00','Горный пейзаж','Красивый вид с большой высоты','all',4,'b22c5c0f95c1fb9398578fd5e396c7dd.jpg'),(7,1,5,'2012-07-13 00:00:00','Восход в космосе','Вид на нашу планету','all',3,'efe8d13779cd84cfeb319d9f0875a511.jpg');
/*!40000 ALTER TABLE `cms_user_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_profiles`
--

DROP TABLE IF EXISTS `cms_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `city` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `showmail` tinyint(1) NOT NULL DEFAULT '0',
  `showbirth` tinyint(1) NOT NULL DEFAULT '0',
  `showicq` tinyint(1) NOT NULL DEFAULT '0',
  `karma` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(250) NOT NULL,
  `allow_who` varchar(35) NOT NULL DEFAULT 'all',
  `signature` varchar(240) NOT NULL,
  `signature_html` varchar(300) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `formsdata` varchar(800) NOT NULL,
  `email_newmsg` int(11) NOT NULL DEFAULT '1',
  `cm_subscribe` varchar(4) NOT NULL DEFAULT 'both',
  `stats` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `city` (`city`),
  KEY `description` (`description`(333)),
  KEY `formsdata` (`formsdata`(333)),
  KEY `gender` (`gender`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_profiles`
--

LOCK TABLES `cms_user_profiles` WRITE;
/*!40000 ALTER TABLE `cms_user_profiles` DISABLE KEYS */;
INSERT INTO `cms_user_profiles` VALUES (1,1,'Москва','Р.Хайнлайн, А.Азимов, А.Кларк',1,1,1,0,'','all','','','m','---\n22: Р.Хайнлайн, А.Азимов, А.Кларк\n24: Высшее\n',1,'none',''),(2,2,'Воронеж','живопись, музыка, PHP',0,0,1,0,'','all','','','m','---\n22: |\n  POD, Fuze, Каста\n24: Высшее\n',1,'0',''),(3,3,'Майкоп','',0,0,1,0,'','all','','','','',1,'','');
/*!40000 ALTER TABLE `cms_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_wall`
--

DROP TABLE IF EXISTS `cms_user_wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `content` text NOT NULL,
  `usertype` varchar(8) NOT NULL DEFAULT 'users',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_wall`
--

LOCK TABLES `cms_user_wall` WRITE;
/*!40000 ALTER TABLE `cms_user_wall` DISABLE KEYS */;
INSERT INTO `cms_user_wall` VALUES (6,1,1,'2012-07-22 20:52:56','Спасибо, что заглянули в мой профиль','users'),(7,3,2,'2012-07-28 16:12:16','Так рад тебя здесь видеть!','users'),(9,2,1,'2012-07-09 17:24:05','InstantCMS + Биллинг + InstantMaps + InstantVideo + InstantShop = СИЛА :-)','users');
/*!40000 ALTER TABLE `cms_user_wall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `login` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `icq` varchar(15) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `birthdate` date NOT NULL DEFAULT '0000-00-00',
  `is_locked` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_logged_once` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_date` datetime NOT NULL,
  `invited_by` int(11) DEFAULT NULL,
  `invdate` datetime DEFAULT NULL,
  `openid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login` (`login`),
  KEY `email` (`email`),
  KEY `birthdate` (`birthdate`),
  KEY `group_id` (`group_id`),
  KEY `invited_by` (`invited_by`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users`
--

LOCK TABLES `cms_users` WRITE;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
INSERT INTO `cms_users` VALUES (1,2,'admin','Администратор','7cbb3252ba6b7e9c422fac5334d22054','admin@cms.ru','100200300','2012-07-23 12:41:57','2012-04-15 13:20:33','1980-10-23',0,0,0,32,0,'127.0.0.1','Самый длинный статус из всех что существуют в этом прекрасном мире','2012-07-21 02:06:53',0,'2012-07-09 23:25:59',NULL),(2,1,'vasya','Василий','7cbb3252ba6b7e9c422fac5334d22054','vasya@cms.ru','100200300','2012-07-16 16:31:48','2012-04-15 12:36:58','1980-01-01',0,0,0,5,0,'127.0.0.1','I love InstantCMS','2012-07-13 23:09:34',0,'2012-07-02 13:50:04',NULL),(3,1,'fedor','Федор','7cbb3252ba6b7e9c422fac5334d22054','fedor@cms.com','100334564','2012-07-20 17:33:42','2012-07-13 23:22:26','1979-10-20',0,0,0,0,0,'127.0.0.1','We are all made of stars (c) Moby','2012-07-28 15:44:45',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users_activate`
--

DROP TABLE IF EXISTS `cms_users_activate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users_activate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pubdate` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users_activate`
--

LOCK TABLES `cms_users_activate` WRITE;
/*!40000 ALTER TABLE `cms_users_activate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_users_activate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-21 14:24:03
