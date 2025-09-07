-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: chat_13aq_com
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.1

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
-- Table structure for table `eb_app_version`
--

DROP TABLE IF EXISTS `eb_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_app_version` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '更新摘要',
  `verisons_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '下载地址',
  `info` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '更新详细内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_time` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='app在线升级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_app_version`
--

LOCK TABLES `eb_app_version` WRITE;
/*!40000 ALTER TABLE `eb_app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_application`
--

DROP TABLE IF EXISTS `eb_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '应用名称',
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT '应用ID',
  `app_secret` varchar(255) NOT NULL DEFAULT '' COMMENT '应用KEY',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '应用图标',
  `introduce` varchar(255) NOT NULL DEFAULT '' COMMENT '应用介绍',
  `timestamp` int NOT NULL DEFAULT '0' COMMENT 'TOKEN生成时间戳',
  `rand` int NOT NULL DEFAULT '0' COMMENT 'TOKEN携带随机数',
  `token` varchar(500) NOT NULL DEFAULT '' COMMENT 'TOKEN',
  `token_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '短TOKEN',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_application`
--

LOCK TABLES `eb_application` WRITE;
/*!40000 ALTER TABLE `eb_application` DISABLE KEYS */;
INSERT INTO `eb_application` VALUES (3,'客服','202116257358989495','e2b57776e42ffbb506ba2301f1fe4ac6','https://qiniu.crmeb.net/attach/2021/07/069e7202107011810578311.png','',1757144676,3798,'eyJpdiI6IjFGN3BwVHRXaWhZK3VmTDBoNDZBeWc9PSIsInZhbHVlIjoiV1d3WGVPa1AwUUZ4bnNPRmdxMmRISWlaU2d0UDg0ZkFUYllXK05rVGtSWithOEZ1andIaGtMUlNEbEl3NzJYaHVja0Mwem5BenZ0VDdPcmUwYnJzRUdxVlFGdW5mc01DcVhtOVpPdEdJZ1VZSUZRRHk3ajBRSkYzREFQemFVYmtRbzdLRE10VHlEWmMrYnczYmhkQkR5NWVzVlgxWmhoTmViYUF6RGp4Sk04PSIsIm1hYyI6IjJlNTk2NzhmZWI5YjFlZWNmZmI3ZmQ5MDliMTQ0MmVkYzg4OTliYTc1ZmNjY2IxZDllMWMwNTk1YmFlZjZmMTYifQ==','389160764418925e13f7d8b650e4e922',0,'2021-07-08 01:18:18','2025-09-06 07:44:37');
/*!40000 ALTER TABLE `eb_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_auxiliary`
--

DROP TABLE IF EXISTS `eb_auxiliary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_auxiliary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `binding_id` int NOT NULL DEFAULT '0' COMMENT '绑定id',
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'APPid',
  `relation_id` int NOT NULL DEFAULT '0' COMMENT '关联id',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型0=客服转接辅助，1=商品和分类辅助，2=优惠券和商品辅助',
  `other` varchar(2048) NOT NULL DEFAULT '' COMMENT '其他数据为json',
  `status` int unsigned NOT NULL DEFAULT '0' COMMENT '数据状态 0：未执行，1：成功， 2：失败， 3:删除',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='辅助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_auxiliary`
--

LOCK TABLES `eb_auxiliary` WRITE;
/*!40000 ALTER TABLE `eb_auxiliary` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_auxiliary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_cache`
--

DROP TABLE IF EXISTS `eb_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_cache` (
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '身份管理名称',
  `result` text NOT NULL COMMENT '缓存数据',
  `expire_time` int NOT NULL DEFAULT '0' COMMENT '失效时间0=永久',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '缓存时间',
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='数据缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_cache`
--

LOCK TABLES `eb_cache` WRITE;
/*!40000 ALTER TABLE `eb_cache` DISABLE KEYS */;
INSERT INTO `eb_cache` VALUES ('kf_adv','\"\"',0,1757150183),('user_agreement','\"\"',0,1757150193);
/*!40000 ALTER TABLE `eb_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_category`
--

DROP TABLE IF EXISTS `eb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0' COMMENT '上级id',
  `owner_id` int NOT NULL DEFAULT '0' COMMENT '所属人，0为全部',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类类型0=标签分类，1=快捷短语分类',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '其他参数',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_category`
--

LOCK TABLES `eb_category` WRITE;
/*!40000 ALTER TABLE `eb_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_auto_reply`
--

DROP TABLE IF EXISTS `eb_chat_auto_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_auto_reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '内容',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '所属用户',
  `appid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '所属appid',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序,越靠前,越是能被自会回复到',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='自动回复';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_auto_reply`
--

LOCK TABLES `eb_chat_auto_reply` WRITE;
/*!40000 ALTER TABLE `eb_chat_auto_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_auto_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_complain`
--

DROP TABLE IF EXISTS `eb_chat_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_complain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL DEFAULT '' COMMENT '投诉内容',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户表ID',
  `cate_id` int NOT NULL DEFAULT '0' COMMENT '分类',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户投诉';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_complain`
--

LOCK TABLES `eb_chat_complain` WRITE;
/*!40000 ALTER TABLE `eb_chat_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service`
--

DROP TABLE IF EXISTS `eb_chat_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'APPID',
  `mer_id` int NOT NULL DEFAULT '0' COMMENT '商户id',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '客服uid',
  `group_id` int NOT NULL DEFAULT '0' COMMENT '客服分组id',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线',
  `account` varchar(50) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '客服头像',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '代理名称',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '客服电话',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '客服状态，0隐藏1显示',
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单通知1开启0关闭',
  `customer` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否展示统计管理',
  `uniqid` varchar(35) NOT NULL DEFAULT '' COMMENT '扫码登录唯一值',
  `is_app` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为APP登陆',
  `is_backstage` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=前台运行;0=后台运行',
  `auto_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动回复',
  `welcome_words` varchar(255) NOT NULL DEFAULT '' COMMENT '欢迎语',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '访问IP',
  `client_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'client_id',
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客服表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service`
--

LOCK TABLES `eb_chat_service` WRITE;
/*!40000 ALTER TABLE `eb_chat_service` DISABLE KEYS */;
INSERT INTO `eb_chat_service` VALUES (1,'202116257358989495',0,2,0,0,'ziyuan','$2y$10$QmOMq2qUsOwFaFQcXgb6.ekmNCWKLPy/hs0QNJ2kb/4csjv4d1N6G','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/5fde9886bd278249a2da5e46c045375b.jpg','子源','13081491041',1757144111,1,1,1,'',0,1,1,'',1757159055,'127.0.0.1','');
/*!40000 ALTER TABLE `eb_chat_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service_dialogue_record`
--

DROP TABLE IF EXISTS `eb_chat_service_dialogue_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service_dialogue_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'APPID',
  `mer_id` int NOT NULL DEFAULT '0' COMMENT '商户id',
  `msn` text NOT NULL COMMENT '消息内容',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '发送人uid',
  `to_user_id` int NOT NULL DEFAULT '0' COMMENT '接收人uid',
  `is_tourist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=游客模式，0=非游客',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒过',
  `msn_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型 1=文字 2=表情 3=图片 4=语音',
  `is_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发送',
  `other` varchar(2000) NOT NULL DEFAULT '' COMMENT '其他参数',
  `guid` varchar(100) NOT NULL DEFAULT '' COMMENT 'guid相当于唯一值',
  PRIMARY KEY (`id`),
  KEY `to_uid` (`to_user_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和客服对话记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service_dialogue_record`
--

LOCK TABLES `eb_chat_service_dialogue_record` WRITE;
/*!40000 ALTER TABLE `eb_chat_service_dialogue_record` DISABLE KEYS */;
INSERT INTO `eb_chat_service_dialogue_record` VALUES (1,'202116257358989495',0,'22',7,2,0,1757144715,1,0,1,1,'','8a891bf9-85f2-4ece-94f9-568eadc4e565'),(2,'202116257358989495',0,'你好',6,2,0,1757150052,1,0,1,1,'','f1e278ef-5767-430b-b055-8c0c54f5187a'),(3,'202116257358989495',0,'nh',10,2,0,1757159174,1,0,1,1,'','04bd3b08-98e7-4dab-a78d-9d8590f3d304'),(4,'202116257358989495',0,'http://chat.local.13aq.com/uploads/store/comment/20250906/1b7e2278acf436df8643698b1d9a0906.png',10,2,0,1757159220,1,0,3,1,'','b749ce8c-80cc-4173-8dd2-c56f80df9438');
/*!40000 ALTER TABLE `eb_chat_service_dialogue_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service_feedback`
--

DROP TABLE IF EXISTS `eb_chat_service_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户uid',
  `rela_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '姓名',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话',
  `content` varchar(500) NOT NULL DEFAULT '0' COMMENT '反馈内容',
  `make` varchar(500) NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0=未查看，1=已查看',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'APPID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客服反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service_feedback`
--

LOCK TABLES `eb_chat_service_feedback` WRITE;
/*!40000 ALTER TABLE `eb_chat_service_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_service_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service_group`
--

DROP TABLE IF EXISTS `eb_chat_service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '组名',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='客服分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service_group`
--

LOCK TABLES `eb_chat_service_group` WRITE;
/*!40000 ALTER TABLE `eb_chat_service_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_service_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service_record`
--

DROP TABLE IF EXISTS `eb_chat_service_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'APPID',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '发送人的uid',
  `to_user_id` int NOT NULL DEFAULT '0' COMMENT '送达人的uid',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_tourist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是游客',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = pc,1=微信，2=小程序，3=H5',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除字段',
  `mssage_num` int NOT NULL DEFAULT '0' COMMENT '消息条数',
  `message` text NOT NULL COMMENT '消息内容',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型',
  PRIMARY KEY (`id`),
  KEY `to_uid` (`to_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service_record`
--

LOCK TABLES `eb_chat_service_record` WRITE;
/*!40000 ALTER TABLE `eb_chat_service_record` DISABLE KEYS */;
INSERT INTO `eb_chat_service_record` VALUES (1,'202116257358989495',2,7,'游客2025404304','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/d4398c5d36757c1b1ed1f21202bea1c0.png',1,0,0,1757144715,1757144715,NULL,0,'22',1),(2,'202116257358989495',2,6,'游客2025482490','https://chat.crmeb.net/uploads/attach/2021/08/20210811/6ba99e3765d19fb35c23792b4143bb49.png',1,0,0,1757150052,1757150052,NULL,0,'你好',1),(3,'202116257358989495',2,10,'游客2025436936','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/0522b361da72bc27bb899fd7392c9d69.png',1,0,0,1757159174,1757159220,NULL,0,'[图片]',3);
/*!40000 ALTER TABLE `eb_chat_service_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_service_speechcraft`
--

DROP TABLE IF EXISTS `eb_chat_service_speechcraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_service_speechcraft` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kefu_id` int NOT NULL DEFAULT '0' COMMENT '0为全局话术',
  `cate_id` int NOT NULL DEFAULT '0' COMMENT '0为不分类全局话术',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '话术标题',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '话术内容',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `kefu_id` (`kefu_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客服话术';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_service_speechcraft`
--

LOCK TABLES `eb_chat_service_speechcraft` WRITE;
/*!40000 ALTER TABLE `eb_chat_service_speechcraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_service_speechcraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_user`
--

DROP TABLE IF EXISTS `eb_chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL DEFAULT '0' COMMENT '用户UID',
  `group_id` int NOT NULL DEFAULT '0' COMMENT '分组',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `remark_nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '备注昵称',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT 'openid',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `last_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '访问ip',
  `appid` varchar(32) NOT NULL DEFAULT '' COMMENT 'appid',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_kefu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否客服',
  `is_tourist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否游客',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户类型 0 = pc , 1 = 微信 ，2 = 小程序 ，3 = H5, 4 = APP',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=在线,0=离线',
  `version` varchar(50) NOT NULL DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`id`,`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客服用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_user`
--

LOCK TABLES `eb_chat_user` WRITE;
/*!40000 ALTER TABLE `eb_chat_user` DISABLE KEYS */;
INSERT INTO `eb_chat_user` VALUES (1,2025996752,0,'游客2025996752','','','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/d4398c5d36757c1b1ed1f21202bea1c0.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:33:41','2025-09-06 07:33:41'),(2,2025996753,0,'子源','','','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/5fde9886bd278249a2da5e46c045375b.jpg','13081491041','','202116257358989495','',0,0,0,0,0,0,'0','2025-09-06 07:35:12','2025-09-07 12:02:52'),(3,2025576411,0,'游客2025576411','','','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/d4398c5d36757c1b1ed1f21202bea1c0.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:36:40','2025-09-06 07:36:40'),(4,2025949988,0,'游客2025949988','','','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/1b244797f8b86b4cc0665d75d160aa30.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:37:16','2025-09-06 07:37:16'),(5,2025766077,0,'游客2025766077','','','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/1b244797f8b86b4cc0665d75d160aa30.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:37:44','2025-09-06 07:37:44'),(6,2025482490,0,'游客2025482490','','','https://chat.crmeb.net/uploads/attach/2021/08/20210811/6ba99e3765d19fb35c23792b4143bb49.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:45:11','2025-09-06 09:16:43'),(7,2025404304,0,'游客2025404304','','','https://demo40.crmeb.net/uploads/attach/2020/11/20201110/d4398c5d36757c1b1ed1f21202bea1c0.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 07:45:11','2025-09-06 07:46:00'),(8,2025443902,0,'游客2025443902','','','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/0522b361da72bc27bb899fd7392c9d69.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 11:45:44','2025-09-06 11:45:44'),(9,2025576708,0,'游客2025576708','','','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/0522b361da72bc27bb899fd7392c9d69.png','','','202116257358989495','',0,0,1,0,0,0,'0','2025-09-06 11:46:11','2025-09-07 11:45:24'),(10,2025436936,0,'游客2025436936','','','http://chat.local.13aq.com/uploads/attach/2025/09/20250906/0522b361da72bc27bb899fd7392c9d69.png','','','202116257358989495','55',0,0,1,0,0,0,'0','2025-09-06 11:46:11','2025-09-06 11:51:06');
/*!40000 ALTER TABLE `eb_chat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_user_group`
--

DROP TABLE IF EXISTS `eb_chat_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_user_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL DEFAULT '' COMMENT '分组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_user_group`
--

LOCK TABLES `eb_chat_user_group` WRITE;
/*!40000 ALTER TABLE `eb_chat_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_user_label`
--

DROP TABLE IF EXISTS `eb_chat_user_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_user_label` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL DEFAULT '' COMMENT '标签名称',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户表自增ID',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `cate_id` int NOT NULL DEFAULT '0' COMMENT '标签分类',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_user_label`
--

LOCK TABLES `eb_chat_user_label` WRITE;
/*!40000 ALTER TABLE `eb_chat_user_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_user_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_chat_user_label_assist`
--

DROP TABLE IF EXISTS `eb_chat_user_label_assist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_chat_user_label_assist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label_id` int NOT NULL DEFAULT '0' COMMENT '标签ID',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户表自增ID',
  PRIMARY KEY (`id`),
  KEY `uid_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户标签辅助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_chat_user_label_assist`
--

LOCK TABLES `eb_chat_user_label_assist` WRITE;
/*!40000 ALTER TABLE `eb_chat_user_label_assist` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_chat_user_label_assist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_migrations`
--

DROP TABLE IF EXISTS `eb_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_migrations` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_migrations`
--

LOCK TABLES `eb_migrations` WRITE;
/*!40000 ALTER TABLE `eb_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_qrcode`
--

DROP TABLE IF EXISTS `eb_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_qrcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `user_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '用户ids',
  `appid` varchar(35) NOT NULL DEFAULT '' COMMENT 'APPID',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='二维码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_qrcode`
--

LOCK TABLES `eb_qrcode` WRITE;
/*!40000 ALTER TABLE `eb_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_site_statistics`
--

DROP TABLE IF EXISTS `eb_site_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_site_statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT '网站来源',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '来源网址',
  `ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip地址',
  `region` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '地区',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '省份',
  `browser` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='站点统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_site_statistics`
--

LOCK TABLES `eb_site_statistics` WRITE;
/*!40000 ALTER TABLE `eb_site_statistics` DISABLE KEYS */;
INSERT INTO `eb_site_statistics` VALUES (1,'http://chat.local.13aq.com/chat/pc?token=8c3c6e2161fc2e01f134f10fadbf5139&noCanClose=1','http://chat.local.13aq.com/chat/pc?token=8c3c6e2161fc2e01f134f10fadbf5139&noCanClose=1','127.0.0.1','','','Chrome','2025-09-06 07:33:41','2025-09-06 07:33:42'),(2,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/mobile?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-06 07:45:11','2025-09-06 07:45:11'),(3,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/pc?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-06 07:45:11','2025-09-06 07:45:11'),(4,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/mobile?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-06 09:14:07','2025-09-06 09:14:07'),(5,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/pc?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-06 09:14:07','2025-09-06 09:14:07'),(6,'http://chat.local.13aq.com/chat/pc?token=389160764418925e13f7d8b650e4e922&noCanClose=1','http://chat.local.13aq.com/chat/pc?token=389160764418925e13f7d8b650e4e922&noCanClose=1','127.0.0.1','','','Chrome','2025-09-06 11:45:44','2025-09-06 11:45:45'),(7,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/pc?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-07 11:43:02','2025-09-07 11:43:03'),(8,'http://chat.local.13aq.com/demo/kefu2.html','http://chat.local.13aq.com/chat/mobile?token=389160764418925e13f7d8b650e4e922&deviceType=pc&windowStyle=&isShowTip=true&kefuid=0&version=','127.0.0.1','','','Chrome','2025-09-07 11:43:03','2025-09-07 11:43:03');
/*!40000 ALTER TABLE `eb_site_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_admin`
--

DROP TABLE IF EXISTS `eb_system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '后台管理员账号',
  `head_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '后台管理员头像',
  `pwd` varchar(100) NOT NULL DEFAULT '' COMMENT '后台管理员密码',
  `real_name` varchar(16) NOT NULL DEFAULT '' COMMENT '后台管理员姓名',
  `roles` varchar(128) NOT NULL DEFAULT '' COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '后台管理员最后一次登录ip',
  `last_time` int NOT NULL DEFAULT '0' COMMENT '后台管理员最后一次登录时间',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '后台管理员添加时间',
  `login_count` int NOT NULL DEFAULT '0' COMMENT '登录次数',
  `level` int NOT NULL DEFAULT '0' COMMENT '后台管理员级别',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1有效0无效',
  PRIMARY KEY (`id`),
  KEY `account` (`account`,`status`),
  KEY `account_2` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_admin`
--

LOCK TABLES `eb_system_admin` WRITE;
/*!40000 ALTER TABLE `eb_system_admin` DISABLE KEYS */;
INSERT INTO `eb_system_admin` VALUES (1,'sunbingchen','','$2y$10$x8pBiPdqqPMN8jG6WT9C5uirw6VDJOJRC0s0hKpfT4LxeR9xNZf3W','admin','1','127.0.0.1',1757252025,1757142890,8,0,1,0);
/*!40000 ALTER TABLE `eb_system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_attachment`
--

DROP TABLE IF EXISTS `eb_system_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_attachment` (
  `att_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) NOT NULL DEFAULT '' COMMENT '压缩图片路径',
  `att_size` varchar(30) NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` varchar(30) NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int NOT NULL DEFAULT '0' COMMENT '分类ID',
  `time` int NOT NULL DEFAULT '0' COMMENT '上传时间',
  `image_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  `real_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_attachment`
--

LOCK TABLES `eb_system_attachment` WRITE;
/*!40000 ALTER TABLE `eb_system_attachment` DISABLE KEYS */;
INSERT INTO `eb_system_attachment` VALUES (5,'1b7e2278acf436df8643698b1d9a0906.png','/uploads/store/comment/20250906/1b7e2278acf436df8643698b1d9a0906.png','/uploads/store/comment/20250906/1b7e2278acf436df8643698b1d9a0906.png','0','image/jpeg',1,1757159220,1,2,''),(6,'6f15656fda52da6bbdae97e1caeae279.png','/uploads/attach/2025/09/20250907/6f15656fda52da6bbdae97e1caeae279.png','/uploads/attach/2025/09/20250907/6f15656fda52da6bbdae97e1caeae279.png','0','image/jpeg',0,1757251563,1,1,'logo.png'),(7,'8c1835a81d0e30f55f8a1e78c9bde79f.png','/uploads/attach/2025/09/20250907/8c1835a81d0e30f55f8a1e78c9bde79f.png','/uploads/attach/2025/09/20250907/8c1835a81d0e30f55f8a1e78c9bde79f.png','0','image/jpeg',0,1757251574,1,1,'logo-max.png'),(8,'4c116bedffbda3a056bb79ffe034d066.png','/uploads/attach/2025/09/20250907/4c116bedffbda3a056bb79ffe034d066.png','/uploads/attach/2025/09/20250907/4c116bedffbda3a056bb79ffe034d066.png','0','image/jpeg',0,1757251588,1,1,'logo-min.png'),(9,'c44425025851ba26c76eb73a5076b55f.png','/uploads/attach/2025/09/20250907/c44425025851ba26c76eb73a5076b55f.png','/uploads/attach/2025/09/20250907/c44425025851ba26c76eb73a5076b55f.png','0','image/jpeg',0,1757251612,1,1,'游客.png');
/*!40000 ALTER TABLE `eb_system_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_attachment_category`
--

DROP TABLE IF EXISTS `eb_system_attachment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_attachment_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) NOT NULL DEFAULT '' COMMENT '分类目录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_attachment_category`
--

LOCK TABLES `eb_system_attachment_category` WRITE;
/*!40000 ALTER TABLE `eb_system_attachment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_attachment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_config`
--

DROP TABLE IF EXISTS `eb_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型(文本框,单选按钮...)',
  `input_type` varchar(20) NOT NULL DEFAULT 'input' COMMENT '表单类型',
  `config_tab_id` int NOT NULL DEFAULT '0' COMMENT '配置分类id',
  `parameter` varchar(255) NOT NULL DEFAULT '' COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `width` int NOT NULL DEFAULT '0' COMMENT '多行文本框的宽度',
  `high` int NOT NULL DEFAULT '0' COMMENT '多行文框的高度',
  `value` text NOT NULL COMMENT '默认值',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '配置名称',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '配置简介',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`),
  KEY `key_status` (`menu_name`(191),`status`),
  KEY `menu_name` (`menu_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_config`
--

LOCK TABLES `eb_system_config` WRITE;
/*!40000 ALTER TABLE `eb_system_config` DISABLE KEYS */;
INSERT INTO `eb_system_config` VALUES (1,'site_name','text','input',1,'',0,'required:true',100,0,'\"\\u5b50\\u6e90\\u5ba2\\u670d\\u7cfb\\u7edf\"','网站名称','网站名称很多地方会显示的，建议认真填写',10,1),(2,'site_url','text','input',1,'',0,'required:true,url:true',100,0,'\"http:\\/\\/chat.local.13aq.com\"','网站地址','安装自动配置，不要轻易修改，更换会影响网站访问、接口请求、本地文件储存、支付回调、微信授权、支付、小程序图片访问、部分二维码、官方授权等',5,1),(3,'site_logo','upload','',1,'',1,'',0,0,'\"http:\\/\\/chat.local.13aq.com\\/uploads\\/attach\\/2025\\/09\\/20250907\\/8c1835a81d0e30f55f8a1e78c9bde79f.png\"','后台大LOGO','菜单展开左上角logo,建议尺寸[170*50]',3,1),(5,'seo_title','text','input',1,'',0,'required:true',100,0,'\"CRMEB\"','SEO标题','SEO标题',0,0),(108,'upload_type','radio','',31,'1=>本地存储\n2=>七牛云存储\n3=>阿里云OSS\n4=>腾讯COS',1,'',0,0,'1','上传类型','文件储存配置，注意：一旦配置就不要轻易修改，会导致文件不能使用',40,1),(109,'uploadUrl','text','input',32,'',0,'url:true',100,0,'\"\"','空间域名 Domain','空间域名 Domain',0,1),(110,'accessKey','text','input',32,'',0,'',100,0,'\"\"','AccessKey ID','AccessKey ID',0,1),(111,'secretKey','text','input',32,'',0,'',100,0,'\"\"','AccessKey Secret','AccessKey Secret',0,1),(112,'storage_name','text','input',32,'',0,'',100,0,'\"\"','Bucket','存储空间名称',0,1),(118,'storage_region','text','input',32,'',0,'',100,0,'\"\"','Endpoint','所属地域',0,1),(142,'tengxun_map_key','text','input',68,'',0,'',100,0,'','腾讯地图KEY','腾讯地图KEY，申请地址：https://lbs.qq.com',0,1),(144,'cache_config','text','input',1,'',0,'',100,0,'\"86400\"','网站缓存时间','配置全局缓存时间（秒），默认留空为永久缓存',0,1),(168,'site_logo_square','upload','',1,'',1,'',0,0,'\"http:\\/\\/chat.local.13aq.com\\/uploads\\/attach\\/2025\\/09\\/20250907\\/4c116bedffbda3a056bb79ffe034d066.png\"','后台小LOGO','后台菜单缩进小LOGO，尺寸180*180',1,1),(171,'login_logo','upload','',1,'',1,'',0,0,'\"http:\\/\\/chat.local.13aq.com\\/uploads\\/attach\\/2025\\/09\\/20250907\\/6f15656fda52da6bbdae97e1caeae279.png\"','后台登录页LOGO','后台登录页LOGO，建议尺寸270x75',4,1),(172,'qiniu_uploadUrl','text','input',33,'',0,'',100,0,'\"\"','空间域名 Domain','空间域名 Domain',0,1),(173,'qiniu_accessKey','text','input',33,'',0,'',100,0,'\"\"','accessKey','accessKey',0,1),(174,'qiniu_secretKey','text','input',33,'',0,'',100,0,'\"\"','secretKey','secretKey',0,1),(175,'qiniu_storage_name','text','input',33,'',0,'',100,0,'\"\"','空间名称','存储空间名称',0,1),(176,'qiniu_storage_region','text','input',33,'',0,'',100,0,'\"\"','存储区域','所属地域',0,1),(177,'tengxun_uploadUrl','text','input',34,'',0,'',100,0,'\"\"','空间域名 Domain','空间域名 Domain',0,1),(178,'tengxun_accessKey','text','input',34,'',0,'',100,0,'\"\"','SecretId','SecretId',0,1),(179,'tengxun_secretKey','text','',34,'',0,'',100,0,'\"\"','SecretKey','SecretKey',0,1),(180,'tengxun_storage_name','text','input',34,'',0,'',100,0,'\"\"','存储桶名称','存储桶名称',0,1),(181,'tengxun_storage_region','text','input',34,'',0,'',100,0,'\"\"','所属地域','所属地域',0,1),(305,'service_feedback','textarea','',69,'',0,'',100,7,'\"\\u5c0a\\u656c\\u7684\\u7528\\u6237\\uff0c\\u5ba2\\u670d\\u5f53\\u524d\\u4e0d\\u5728\\u7ebf\\uff0c\\u6709\\u95ee\\u9898\\u8bf7\\u7559\\u8a00\\uff0c\\u6211\\u4eec\\u4f1a\\u7b2c\\u4e00\\u65f6\\u95f4\\u8fdb\\u884c\\u5904\\u7406\\uff01\\uff01\\uff01\"','客服反馈','客服反馈头部文字',0,1),(306,'tourist_avatar','upload','',69,'',2,'',0,0,'[\"http:\\/\\/chat.local.13aq.com\\/uploads\\/attach\\/2025\\/09\\/20250907\\/c44425025851ba26c76eb73a5076b55f.png\"]','客服游客头像','客服游客头像',0,1),(307,'qq_map_key','text','input',1,'',0,'',100,0,'\"ST2BZ-SIUK7-QXBXD-POA75-5CSHH-OYB52\"','腾讯地图开放平台KEY','腾讯地图开放平台KEY,申请地址:https://lbs.qq.com/dev/console/application/mine',0,1),(308,'kefu_icon_url3','upload','',69,'',1,'',0,0,'\"\"','客服图标地址自定义','客服图标地址自定义',0,2),(309,'kefu_icon_url1','upload','',69,'',1,'',0,0,'\"data:image/png;base64,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\"','客服图标地址长方形','客服图标地址长方形',0,0),(310,'kefu_icon_url2','upload','',69,'',1,'',0,0,'\"data:image/png;base64,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\"','客服图标地址','客服图标地址',0,0),(311,'kefu_icon_type','radio','',69,'0=>默认图标\n1=>悬浮球\n2=>自定义',0,'',0,0,'\"1\"','客服图标','客服图标',0,2),(312,'uni_push_app_secret','text','input',70,'',0,'',100,0,'','appSecret','uniPush应用appSecret',0,1),(313,'uni_push_masterSecret','text','input',70,'',0,'',100,0,'','masterSecret','uniPush应用masterSecret',0,1),(314,'uni_push_appkey','text','input',70,'',0,'',100,0,'','appKey','uniPush应用key',0,1),(315,'uni_push_appid','text','input',70,'',0,'',100,0,'','appId','unipush应用ID',0,1);
/*!40000 ALTER TABLE `eb_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_config_tab`
--

DROP TABLE IF EXISTS `eb_system_config_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_config_tab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类名称',
  `eng_title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类英文名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配置分类状态',
  `info` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配置分类是否显示',
  `icon` varchar(30) NOT NULL DEFAULT '' COMMENT '图标',
  `type` int NOT NULL DEFAULT '0' COMMENT '配置类型',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_config_tab`
--

LOCK TABLES `eb_system_config_tab` WRITE;
/*!40000 ALTER TABLE `eb_system_config_tab` DISABLE KEYS */;
INSERT INTO `eb_system_config_tab` VALUES (1,0,'基础配置','basics',1,0,'ios-settings',0,100),(17,0,'文件上传配置','upload_set',1,0,'md-cloud-upload',0,0),(31,17,'基础配置','base_config',1,0,'',0,0),(32,17,'阿里云配置','aliyun_uploads',1,0,'',0,0),(33,17,'七牛云配置','qiniu_uplaods',1,0,'',0,0),(34,17,'腾讯云配置','tengxun_uploads',1,0,'',0,0),(69,22,'客服端配置','kefu_config',1,0,'',0,0),(70,0,'uniPush配置','uni_push_config',1,0,'',0,0);
/*!40000 ALTER TABLE `eb_system_config_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_group`
--

DROP TABLE IF EXISTS `eb_system_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cate_id` int NOT NULL DEFAULT '0' COMMENT '分类id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据组名称',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '数据提示',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据字段',
  `fields` text NOT NULL COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_group`
--

LOCK TABLES `eb_system_group` WRITE;
/*!40000 ALTER TABLE `eb_system_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_group_data`
--

DROP TABLE IF EXISTS `eb_system_group_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_group_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gid` int NOT NULL DEFAULT '0' COMMENT '对应的数据组id',
  `value` text NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '添加数据时间',
  `sort` int NOT NULL DEFAULT '0' COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组合数据详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_group_data`
--

LOCK TABLES `eb_system_group_data` WRITE;
/*!40000 ALTER TABLE `eb_system_group_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_group_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_log`
--

DROP TABLE IF EXISTS `eb_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '链接',
  `page` varchar(64) NOT NULL DEFAULT '' COMMENT '行为',
  `method` varchar(12) NOT NULL DEFAULT '' COMMENT '访问类型',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录IP',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `add_time` int NOT NULL DEFAULT '0' COMMENT '操作时间',
  `merchant_id` int NOT NULL DEFAULT '0' COMMENT '商户id',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `add_time` (`add_time`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理员操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_log`
--

LOCK TABLES `eb_system_log` WRITE;
/*!40000 ALTER TABLE `eb_system_log` DISABLE KEYS */;
INSERT INTO `eb_system_log` VALUES (1,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757142914,0),(2,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757142914,0),(3,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757142915,0),(4,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757142915,0),(5,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757142915,0),(6,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144012,0),(7,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144012,0),(8,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757144012,0),(9,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757144012,0),(10,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144012,0),(11,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144019,0),(12,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144024,0),(13,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144024,0),(14,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144025,0),(15,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144025,0),(16,1,'sunbingchen','api/admin/chat/kefu/add','添加客服表单','','127.0.0.1','system',1757144027,0),(17,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757144031,0),(18,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757144031,0),(19,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757144088,0),(20,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757144089,0),(21,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144111,0),(22,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144111,0),(23,1,'sunbingchen','api/admin/chat/kefu/set_status/<id>/<status>','修改客服状态','','127.0.0.1','system',1757144114,0),(24,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144114,0),(25,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757144115,0),(26,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757144183,0),(27,1,'sunbingchen','api/admin/chat/statistics','站点统计','','127.0.0.1','system',1757144189,0),(28,1,'sunbingchen','api/admin/chat/record/list','未知','','127.0.0.1','system',1757144190,0),(29,1,'sunbingchen','api/admin/chat/qrcode','获取随机客服二维码','','127.0.0.1','system',1757144190,0),(30,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144190,0),(31,1,'sunbingchen','api/admin/chat/feedback','获取用户反馈列表接口','','127.0.0.1','system',1757144191,0),(32,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144192,0),(33,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144198,0),(34,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144198,0),(35,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144198,0),(36,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144198,0),(37,1,'sunbingchen','api/admin/app/reset/<id>','重置token','','127.0.0.1','system',1757144218,0),(38,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144221,0),(39,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144221,0),(40,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144221,0),(41,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144221,0),(42,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144245,0),(43,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144245,0),(44,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144245,0),(45,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144245,0),(46,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144250,0),(47,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144359,0),(48,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144359,0),(49,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757144359,0),(50,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144359,0),(51,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757144359,0),(52,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144361,0),(53,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144361,0),(54,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144361,0),(55,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144361,0),(56,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757144363,0),(57,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144378,0),(58,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144419,0),(59,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144419,0),(60,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144419,0),(61,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144419,0),(62,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144424,0),(63,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144424,0),(64,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144424,0),(65,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144424,0),(66,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144424,0),(67,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144424,0),(68,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144424,0),(69,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144433,0),(70,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144433,0),(71,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757144433,0),(72,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144433,0),(73,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144433,0),(74,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757144433,0),(75,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144433,0),(76,1,'sunbingchen','api/admin/chat/kefu/<id>/edit','修改客服表单','','127.0.0.1','system',1757144444,0),(77,1,'sunbingchen','api/admin/chat/kefu/<id>','修改客服','','127.0.0.1','system',1757144449,0),(78,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757144449,0),(79,1,'sunbingchen','api/admin/chat/kefu/<id>','修改客服','','127.0.0.1','system',1757144449,0),(80,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144562,0),(81,1,'sunbingchen','api/admin/app/reset/<id>','重置token','','127.0.0.1','system',1757144676,0),(82,1,'sunbingchen','api/admin/app/reset/<id>','重置token','','127.0.0.1','system',1757144676,0),(83,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757144682,0),(84,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757144682,0),(85,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757144682,0),(86,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757144682,0),(87,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757150057,0),(88,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757150057,0),(89,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757150058,0),(90,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757150058,0),(91,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757150062,0),(92,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757150072,0),(93,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757150072,0),(94,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757150074,0),(95,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150074,0),(96,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757150097,0),(97,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150097,0),(98,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757150104,0),(99,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150104,0),(100,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757150108,0),(101,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150108,0),(102,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757150117,0),(103,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150117,0),(104,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757150121,0),(105,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757150127,0),(106,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757150127,0),(107,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757150127,0),(108,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757150127,0),(109,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757150127,0),(110,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757150129,0),(111,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757150131,0),(112,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150134,0),(113,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757150134,0),(114,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757150145,0),(115,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757150145,0),(116,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757150148,0),(117,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757150168,0),(118,1,'sunbingchen','api/admin/setting/get_kf_adv','获取客服广告','','127.0.0.1','system',1757150170,0),(119,1,'sunbingchen','api/admin/setting/set_kf_adv','设置客服广告','','127.0.0.1','system',1757150183,0),(120,1,'sunbingchen','api/admin/setting/config/kefu','保存客服图标上传配置','','127.0.0.1','system',1757150191,0),(121,1,'sunbingchen','api/admin/setting/get_user_agreement','获取隐私协议','','127.0.0.1','system',1757150193,0),(122,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757150197,0),(123,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757150217,0),(124,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757150217,0),(125,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757150217,0),(126,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757150217,0),(127,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757150219,0),(128,1,'sunbingchen','api/admin/setting/admin/logout','退出登陆','','127.0.0.1','system',1757150859,0),(129,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757150920,0),(130,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757150920,0),(131,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757150920,0),(132,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757150920,0),(133,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757150920,0),(134,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757150923,0),(135,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757150923,0),(136,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757150923,0),(137,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757150923,0),(138,1,'sunbingchen','api/admin/chat/kefu/login/<id>','客服登录','','127.0.0.1','system',1757150925,0),(139,1,'sunbingchen','api/admin/setting/admin/logout','退出登陆','','127.0.0.1','system',1757157147,0),(140,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757159134,0),(141,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757159134,0),(142,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757159134,0),(143,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757159134,0),(144,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757159134,0),(145,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757159142,0),(146,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757159206,0),(147,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757159206,0),(148,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757245714,0),(149,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757245718,0),(150,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757245718,0),(151,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757245718,0),(152,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757245718,0),(153,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757245718,0),(154,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757246449,0),(155,1,'sunbingchen','api/admin/setting/menus/create','添加权限表单','','127.0.0.1','system',1757246523,0),(156,1,'sunbingchen','api/admin/setting/menus','添加权限','','127.0.0.1','system',1757246523,0),(157,1,'sunbingchen','api/admin/setting/menus/show/<id>','修改权限状态','','127.0.0.1','system',1757246528,0),(158,1,'sunbingchen','api/admin/setting/menus/show/<id>','修改权限状态','','127.0.0.1','system',1757246529,0),(159,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757246538,0),(160,1,'sunbingchen','api/admin/setting/menus/create','添加权限表单','','127.0.0.1','system',1757246538,0),(161,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757246538,0),(162,1,'sunbingchen','api/admin/setting/menus','添加权限','','127.0.0.1','system',1757246538,0),(163,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757246538,0),(164,1,'sunbingchen','api/admin/chat/statistics','站点统计','','127.0.0.1','system',1757246545,0),(165,1,'sunbingchen','api/admin/chat/speechcraftcate','获取话术分类列表接口','','127.0.0.1','system',1757246546,0),(166,1,'sunbingchen','api/admin/chat/speechcraft','获取话术列表接口','','127.0.0.1','system',1757246546,0),(167,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757246547,0),(168,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757246547,0),(169,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757246547,0),(170,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757246547,0),(171,1,'sunbingchen','api/admin/setting/config/kefu','保存客服图标上传配置','','127.0.0.1','system',1757246551,0),(172,1,'sunbingchen','api/admin/setting/get_user_agreement','获取隐私协议','','127.0.0.1','system',1757246553,0),(173,1,'sunbingchen','api/admin/setting/menus','添加权限','','127.0.0.1','system',1757246554,0),(174,1,'sunbingchen','api/admin/setting/menus/create','添加权限表单','','127.0.0.1','system',1757246554,0),(175,1,'sunbingchen','api/admin/setting/admin','添加管理员','','127.0.0.1','system',1757246557,0),(176,1,'sunbingchen','api/admin/setting/role','管理员身份列表','','127.0.0.1','system',1757246559,0),(177,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757246560,0),(178,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757246564,0),(179,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757246564,0),(180,1,'sunbingchen','api/admin/user/label','保存标签接口','','127.0.0.1','system',1757246575,0),(181,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757246575,0),(182,1,'sunbingchen','api/admin/user/index','用户列表','','127.0.0.1','system',1757246575,0),(183,1,'sunbingchen','api/admin/user/user_label','用户标签搜索列表','','127.0.0.1','system',1757246575,0),(184,1,'sunbingchen','api/admin/user/index','用户列表','','127.0.0.1','system',1757246583,0),(185,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757246658,0),(186,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757246668,0),(187,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757246668,0),(188,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757247601,0),(189,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757247601,0),(190,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757247601,0),(191,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757247601,0),(192,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757247601,0),(193,1,'sunbingchen','api/admin/setting/admin/logout','退出登陆','','127.0.0.1','system',1757247605,0),(194,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757247627,0),(195,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757247627,0),(196,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757247627,0),(197,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757247627,0),(198,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757247627,0),(199,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757247811,0),(200,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757247811,0),(201,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757247811,0),(202,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757247811,0),(203,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757247811,0),(204,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757247910,0),(205,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757247910,0),(206,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757247910,0),(207,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757247910,0),(208,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757247910,0),(209,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757248002,0),(210,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757248002,0),(211,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757248002,0),(212,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757248002,0),(213,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757248002,0),(214,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757248980,0),(215,1,'sunbingchen','api/admin/user/index','用户列表','','127.0.0.1','system',1757248981,0),(216,1,'sunbingchen','api/admin/user/label','保存标签接口','','127.0.0.1','system',1757248981,0),(217,1,'sunbingchen','api/admin/user/user_label','用户标签搜索列表','','127.0.0.1','system',1757248981,0),(218,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757248981,0),(219,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757249069,0),(220,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757249069,0),(221,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757250291,0),(222,1,'sunbingchen','api/admin/user/index','用户列表','','127.0.0.1','system',1757250291,0),(223,1,'sunbingchen','api/admin/user/user_label','用户标签搜索列表','','127.0.0.1','system',1757250291,0),(224,1,'sunbingchen','api/admin/user/label','保存标签接口','','127.0.0.1','system',1757250291,0),(225,1,'sunbingchen','api/admin/user/group','获取分组列表接口','','127.0.0.1','system',1757250292,0),(226,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757250296,0),(227,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757250296,0),(228,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757250301,0),(229,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757250301,0),(230,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757250301,0),(231,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757250301,0),(232,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757250301,0),(233,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757250318,0),(234,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757250318,0),(235,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757250323,0),(236,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757250323,0),(237,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757250323,0),(238,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757250323,0),(239,1,'sunbingchen','api/admin/chat/speechcraftcate','获取话术分类列表接口','','127.0.0.1','system',1757250323,0),(240,1,'sunbingchen','api/admin/chat/speechcraft','获取话术列表接口','','127.0.0.1','system',1757250324,0),(241,1,'sunbingchen','api/admin/chat/feedback','获取用户反馈列表接口','','127.0.0.1','system',1757250325,0),(242,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757251044,0),(243,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757251044,0),(244,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757251044,0),(245,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757251044,0),(246,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757251044,0),(247,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757251047,0),(248,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757251047,0),(249,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757251047,0),(250,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757251047,0),(251,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757251047,0),(252,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757251429,0),(253,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757251429,0),(254,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757251429,0),(255,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757251429,0),(256,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757251429,0),(257,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757251509,0),(258,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251509,0),(259,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757251515,0),(260,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251515,0),(261,1,'sunbingchen','api/admin/file/file/delete','删除图片','','127.0.0.1','system',1757251545,0),(262,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251545,0),(263,1,'sunbingchen','api/admin/file/file/delete','删除图片','','127.0.0.1','system',1757251548,0),(264,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251548,0),(265,1,'sunbingchen','api/admin/file/file/delete','删除图片','','127.0.0.1','system',1757251551,0),(266,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251551,0),(267,1,'sunbingchen','api/admin/file/file/delete','删除图片','','127.0.0.1','system',1757251554,0),(268,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251554,0),(269,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757251557,0),(270,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251558,0),(271,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757251563,0),(272,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251563,0),(273,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757251569,0),(274,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251569,0),(275,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757251574,0),(276,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251574,0),(277,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757251581,0),(278,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251581,0),(279,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757251588,0),(280,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251588,0),(281,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757251592,0),(282,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251600,0),(283,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251602,0),(284,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251603,0),(285,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251604,0),(286,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251605,0),(287,1,'sunbingchen','api/admin/file/category','获取附件分类列表接口','','127.0.0.1','system',1757251608,0),(288,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251608,0),(289,1,'sunbingchen','api/admin/file/upload/<upload_type?>','上传图片','','127.0.0.1','system',1757251612,0),(290,1,'sunbingchen','api/admin/file/file','图片附件列表','','127.0.0.1','system',1757251612,0),(291,1,'sunbingchen','api/admin/setting/config/save_basics','基本配置保存数据','','127.0.0.1','system',1757251616,0),(292,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757251620,0),(293,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757251620,0),(294,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757251620,0),(295,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757251620,0),(296,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757251620,0),(297,1,'sunbingchen','api/admin/setting/admin/logout','退出登陆','','127.0.0.1','system',1757252006,0),(298,1,'sunbingchen','api/admin/menuslist','获取菜单','','127.0.0.1','system',1757252025,0),(299,1,'sunbingchen','api/admin/jnotice','消息通知','','127.0.0.1','system',1757252025,0),(300,1,'sunbingchen','api/admin/logo','获取logo','','127.0.0.1','system',1757252025,0),(301,1,'sunbingchen','api/admin/chart','客户首页统计','','127.0.0.1','system',1757252025,0),(302,1,'sunbingchen','api/admin/chart/sum','客户统计','','127.0.0.1','system',1757252025,0),(303,1,'sunbingchen','api/admin/chat/reply','自动回复列表','','127.0.0.1','system',1757253567,0),(304,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757253567,0),(305,1,'sunbingchen','api/admin/chat/speechcraftcate','获取话术分类列表接口','','127.0.0.1','system',1757253568,0),(306,1,'sunbingchen','api/admin/chat/group','未知','','127.0.0.1','system',1757253568,0),(307,1,'sunbingchen','api/admin/chat/kefu','客服列表','','127.0.0.1','system',1757253568,0),(308,1,'sunbingchen','api/admin/chat/speechcraft','获取话术列表接口','','127.0.0.1','system',1757253568,0),(309,1,'sunbingchen','api/admin/chat/feedback','获取用户反馈列表接口','','127.0.0.1','system',1757253569,0),(310,1,'sunbingchen','api/admin/chat/statistics','站点统计','','127.0.0.1','system',1757253570,0),(311,1,'sunbingchen','api/admin/app','获取应用列表接口','','127.0.0.1','system',1757253571,0),(312,1,'sunbingchen','api/admin/chat/qrcode','获取随机客服二维码','','127.0.0.1','system',1757253572,0),(313,1,'sunbingchen','api/admin/chat/record/list','未知','','127.0.0.1','system',1757253573,0),(314,1,'sunbingchen','api/admin/setting/config/header_basics','基本配置编辑头部数据','','127.0.0.1','system',1757253574,0),(315,1,'sunbingchen','api/admin/setting/config/edit_basics','基本配置编辑表单','','127.0.0.1','system',1757253575,0);
/*!40000 ALTER TABLE `eb_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_menus`
--

DROP TABLE IF EXISTS `eb_system_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0' COMMENT '父级id',
  `icon` varchar(16) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(32) NOT NULL DEFAULT '' COMMENT '方法名',
  `api_url` varchar(100) NOT NULL DEFAULT '' COMMENT 'api接口地址',
  `methods` varchar(255) NOT NULL DEFAULT '' COMMENT '提交方式POST GET PUT DELETE',
  `params` varchar(128) NOT NULL DEFAULT '' COMMENT '参数',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为隐藏菜单0=隐藏菜单,1=显示菜单',
  `is_show_path` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为隐藏菜单供前台使用',
  `access` tinyint(1) NOT NULL DEFAULT '0' COMMENT '子管理员是否可用',
  `menu_path` varchar(255) NOT NULL DEFAULT '' COMMENT '路由名称 前端使用',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `auth_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为菜单 1菜单 2功能',
  `header` varchar(10) NOT NULL DEFAULT '' COMMENT '顶部菜单标示',
  `is_header` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否顶部菜单1是0否',
  `unique_auth` varchar(255) NOT NULL DEFAULT '' COMMENT '前台唯一标识',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `is_show` (`is_show`),
  KEY `access` (`access`)
) ENGINE=InnoDB AUTO_INCREMENT=1134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_menus`
--

LOCK TABLES `eb_system_menus` WRITE;
/*!40000 ALTER TABLE `eb_system_menus` DISABLE KEYS */;
INSERT INTO `eb_system_menus` VALUES (7,0,'md-home','统计','admin','index','','','','[]',127,1,0,1,'/admin/home/','',1,'home',1,'admin-index-index',0),(9,0,'md-person','用户管理','admin','user.user','','','','[]',100,1,0,1,'/admin/user','',1,'user',1,'admin-user',0),(10,9,'','用户列表','admin','user.user','index','','','[]',10,1,0,1,'/admin/user/list','9',1,'user',1,'admin-user-user-index',0),(12,0,'md-settings','设置管理','admin','setting.system_config','index','','','[]',0,1,0,1,'/admin/setting','',1,'setting',1,'admin-setting',0),(14,12,'','管理权限','admin','setting.system_admin','','','','[]',0,1,0,1,'/admin/setting/auth/list','',1,'setting',1,'setting-system-admin',0),(19,14,'','角色管理','admin','setting.system_role','index','','','[]',1,1,0,1,'/admin/setting/system_role/index','',1,'setting',1,'setting-system-role',0),(20,14,'','管理员列表','admin','setting.system_admin','index','','','[]',1,1,0,1,'/admin/setting/system_admin/index','',1,'setting',0,'setting-system-list',0),(21,14,'','权限规则','admin','setting.system_menus','index','','','[]',1,1,0,1,'/admin/setting/system_menus/index','',1,'setting',0,'setting-system-menus',0),(23,12,'','系统设置','admin','setting.system_config','index','','','[]',10,1,0,1,'/admin/setting/system_config','',1,'setting',1,'setting-system-config',0),(25,0,'md-hammer','维护管理','admin','system','','','','[]',-1,1,0,1,'/admin/system','',1,'setting',1,'admin-system',0),(47,65,'','系统日志','admin','system.system_log','index','','','[]',0,1,0,1,'/admin/system/maintain/system_log/index','',1,'system',0,'system-maintain-system-log',0),(48,7,'','控制台','admin','index','index','','','[]',127,1,0,1,'/admin/home/index','',1,'home',0,'',1),(56,25,'','开发配置','admin','system','','','','[]',10,1,0,1,'/admin/system/config','',1,'system',1,'system-config-index',0),(65,25,'','安全维护','admin','system','','','','[]',7,1,0,1,'/admin/system/maintain','',1,'system',1,'system-maintain-index',0),(111,56,'','配置分类','admin','setting.system_config_tab','index','','','[]',0,1,0,1,'/admin/system/config/system_config_tab/index','',1,'system',0,'system-config-system_config-tab',0),(112,56,'','组合数据','admin','setting.system_group','index','','','[]',0,1,0,1,'/admin/system/config/system_group/index','',1,'system',0,'system-config-system_config-group',0),(125,56,'','配置列表','admin','system.config','index','','','[]',0,1,1,1,'/admin/system/config/system_config_tab/list','',1,'system',1,'system-config-system_config_tab-list',0),(126,56,'','组合数据列表','admin','system.system_group','list','','','[]',0,1,1,1,'/admin/system/config/system_group/list','',1,'system',1,'system-config-system_config-list',0),(165,0,'md-chatboxes','客服管理','admin','setting.storeService','index','','','[]',2,1,0,1,'/admin/kefu','',1,'',0,'setting-store-service',0),(227,9,'','用户分组','admin','user.user_group','index','','','[]',9,1,0,1,'/admin/user/group','9',1,'user',1,'user-user-group',0),(313,23,'','基本配置编辑头部数据','admin','','','api/admin/setting/config/header_basics','GET','[]',0,0,0,1,'','12/23',2,'',0,'',0),(314,23,'','基本配置编辑表单','admin','','','api/admin/setting/config/edit_basics','GET','[]',0,0,0,1,'','12/23',2,'',0,'',0),(315,23,'','基本配置保存数据','admin','','','api/admin/setting/config/save_basics','POST','[]',0,0,0,1,'','12/23',2,'',0,'',0),(325,19,'','添加身份','admin','','','','','[]',0,0,0,1,'/admin/setting/system_role/add','',1,'',0,'setting-system_role-add',0),(326,325,'','管理员身份权限列表','admin','','','api/admin/setting/role/create','GET','[]',0,0,0,1,'','12/14/19/325',2,'',0,'',0),(327,325,'','新建或编辑管理员','admin','','','api/admin/setting/role/<id>','POST','[]',0,0,0,1,'','12/14/19/325',2,'',0,'',0),(328,325,'','编辑管理员详情','admin','','','api/admin/setting/role/<id>/edit','GET','[]',0,0,0,1,'','12/14/19/325',2,'',0,'',0),(329,19,'','修改管理员身份状态','admin','','','api/admin/setting/role/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','12/14/19',2,'',0,'',0),(330,19,'','删除管理员身份','admin','','','api/admin/setting/role/<id>','DELETE','[]',0,0,0,1,'','12/14/19',2,'',0,'',0),(331,20,'','添加管理员','admin','','','','','[]',0,0,0,1,'/admin/setting/system_admin/add','',1,'',0,'setting-system_admin-add',0),(332,331,'','添加管理员表单','admin','','','api/admin/setting/admin/create','GET','[]',0,0,0,1,'','12/14/20/331',2,'',0,'',0),(333,331,'','添加管理员','admin','','','api/admin/setting/admin','POST','[]',0,0,0,1,'','12/14/20/331',2,'',0,'',0),(334,20,'','编辑管理员','admin','','','','','[]',0,0,0,1,'/admin /setting/system_admin/edit','',1,'',0,' setting-system_admin-edit',0),(335,334,'','编辑管理员表单','admin','','','api/admin/setting/admin/<id>/edit','GET','[]',0,0,0,1,'','12/14/20/334',2,'',0,'',0),(336,334,'','修改管理员','admin','','','api/admin/setting/admin/<id>','PUT','[]',0,0,0,1,'','12/14/20/334',2,'',0,'',0),(337,20,'','修改管理员接口','admin','','','api/admin/setting/admin/<id>','PUT','[]',0,0,0,1,'','12/14/20',2,'',0,'',0),(338,21,'','添加规则','admin','','','','','[]',0,0,0,1,'/admin/setting/system_menus/add','',1,'',0,'setting-system_menus-add',0),(339,338,'','添加权限表单','admin','','','api/admin/setting/menus/create','GET','[]',0,0,0,1,'','',2,'',0,'',0),(340,338,'','添加权限','admin','','','api/admin/setting/menus','POST','[]',0,0,0,1,'','12/14/21/338',2,'',0,'',0),(341,21,'','修改权限','admin','setting.system_menus','edit','','','[]',0,0,0,1,'/admin/setting/system_menus/edit','',1,'',0,'/setting-system_menus-edit',0),(342,341,'','编辑权限表单','admin','','','api/admin/setting/menus/<id>','GET','[]',0,0,0,1,'','12/14/21/341',2,'',0,'',0),(343,341,'','修改权限','admin','','','api/admin/setting/menus/<id>','PUT','[]',0,0,0,1,'','12/14/21/341',2,'',0,'',0),(344,21,'','修改权限状态','admin','','','api/admin/setting/menus/show/<id>','PUT','[]',0,0,0,1,'','12/14/21',2,'',0,'',0),(345,21,'','删除权限菜单','admin','','','api/admin/setting/menus/<id>','DELETE','[]',0,0,0,1,'','12/14/21',2,'',0,'',0),(346,338,'','添加子菜单','admin','setting.system_menus','add','','','[]',0,0,0,1,'/admin/setting/system_menus/add_sub','',1,'',0,'setting-system_menus-add_sub',0),(423,678,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(461,111,'','配置分类列表','admin','','','api/admin/setting/config_class','GET','[]',0,0,0,1,'','25/56/111',2,'',0,'',0),(462,111,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(463,462,'','配置分类添加表单','admin','','','api/admin/setting/config_class/create','GET','[]',0,0,0,1,'','25/56/111/462',2,'',0,'',0),(464,462,'','保存配置分类','admin','','','api/admin/setting/config_class','POST','[]',0,0,0,1,'','',2,'',0,'',0),(465,641,'','编辑配置分类','admin','','','api/admin/setting/config_class/<id>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(466,462,'','删除配置分类','admin','','','api/admin/setting/config_class/<id>','DELETE','[]',0,0,0,1,'','',2,'',0,'',0),(467,125,'','配置列表展示','admin','','','api/admin/setting/config','GET','[]',0,0,0,1,'','',2,'',0,'',0),(468,125,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(469,468,'','添加配置字段表单','admin','','','api/admin/setting/config/create','GET','[]',0,0,0,1,'','',2,'',0,'',0),(470,468,'','保存配置字段','admin','','','api/admin/setting/config','POST','[]',0,0,0,1,'','',2,'',0,'',0),(471,468,'','编辑配置字段表单','admin','','','api/admin/setting/config/<id>/edit','','[]',0,0,0,1,'','',2,'',0,'',0),(472,468,'','编辑配置分类','admin','','','api/admin/setting/config/<id>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(473,468,'','删除配置','admin','','','api/admin/setting/config/<id>','DELETE','[]',0,0,0,1,'','',2,'',0,'',0),(474,468,'','修改配置状态','admin','','','api/admin/setting/config/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(475,112,'','组合数据列表','admin','','','api/admin/setting/group','GET','[]',0,1,0,1,'','',2,'',0,'',0),(476,112,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(477,476,'','新增组合数据','admin','','','api/admin/setting/group','POST','[]',0,0,0,1,'','',2,'',0,'',0),(478,476,'','获取组合数据','admin','','','api/admin/setting/group/<id>','GET','[]',0,0,0,1,'','',2,'',0,'',0),(479,476,'','修改组合数据','admin','','','api/admin/setting/group/<id>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(480,476,'','删除组合数据','admin','','','api/admin/setting/group/<id>','DELETE','[]',0,0,0,1,'','',2,'',0,'',0),(481,126,'','组合数据列表表头','admin','','','api/admin/setting/group_data/header','GET','[]',0,0,0,1,'','',2,'',0,'',0),(482,126,'','组合数据列表','admin','','','api/admin/setting/group_data','GET','[]',0,0,0,1,'','',2,'',0,'',0),(483,126,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(484,483,'','获取组合数据添加表单','admin','','','api/admin/setting/group_data/create','GET','[]',0,0,0,1,'','',2,'',0,'',0),(485,483,'','保存组合数据','admin','','','api/admin/setting/group_data','POST','[]',0,0,0,1,'','',2,'',0,'',0),(486,483,'','获取组合数据信息','admin','','','api/admin/setting/group_data/<id>/edit','GET','[]',0,0,0,1,'','',2,'',0,'',0),(487,483,'','修改组合数据信息','admin','','','api/admin/setting/group_data/<id>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(488,483,'','删除组合数据','admin','','','api/admin/setting/group_data/<id>','DELETE','[]',0,0,0,1,'','',2,'',0,'',0),(489,483,'','修改组合数据状态','admin','','','api/admin/setting/group_data/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','',2,'',0,'',0),(492,47,'','系统日志管理员搜索条件','admin','','','api/admin/system/log/search_admin','GET','[]',0,0,0,1,'','25/65/47',2,'',0,'',0),(493,47,'','系统日志','admin','','','api/admin/system/log','GET','[]',0,0,0,1,'','25/65/47',2,'',0,'',0),(585,10,'','附加权限','admin','','','','','[]',0,0,0,1,'/admin*','',1,'',0,'',0),(610,20,'','管理员列表','admin','','','api/admin/setting/admin','GET','[]',0,0,0,1,'','12/14/20',2,'',0,'',0),(611,19,'','管理员身份列表','admin','','','api/admin/setting/role','GET','[]',0,0,0,1,'','12/14/19',2,'',0,'',0),(619,21,'','权限列表','admin','','','api/admin/setting/menus','GET','[]',0,0,0,1,'','12/14/21',2,'',0,'',0),(635,20,'','修改管理员状态','admin','','','api/admin/setting/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','12/14/20',2,'',0,'',0),(641,462,'','编辑配置分类','admin','','','','','[]',0,0,0,1,'system/config/system_config_tab/edit','',1,'',0,'',0),(642,641,'','获取修改配置分类接口','admin','','','api/admin/setting/config_class/<id>/edit','GET','[]',0,0,0,1,'','25/56/111/462/641',2,'',0,'',0),(656,12,'','页面管理','admin','','','','','[]',1,1,0,1,'/admin/setting/pages','',1,'',0,'admin-setting-pages',0),(678,165,'','客服列表','admin','','','','','[]',0,1,0,1,'/admin/setting/store_service/index','',1,'',0,'admin-setting-store_service-index',0),(679,165,'','客服话术','admin','','','','','[]',0,1,0,1,'/admin/setting/store_service/speechcraft','',1,'',0,'admin-setting-store_service-speechcraft',0),(738,165,'','用户留言','admin','','','','','[]',0,1,0,1,'/admin/setting/store_service/feedback','',1,'',0,'admin-setting-store_service-feedback',0),(739,738,'','获取用户反馈列表接口','admin','','','api/admin/chat/feedback','GET','[]',0,0,0,1,'','165/738',2,'',0,'',0),(740,738,'','附件权限','admin','','','','','[]',0,0,0,1,'*','',1,'',0,'',0),(741,740,'','删除用户反馈接口','admin','','','api/admin/chat/feedback/<id>','DELETE','[]',0,0,0,1,'','165/738/740',2,'',0,'',0),(742,679,'','获取话术列表接口','admin','','','api/admin/chat/speechcraft','GET','[]',0,0,0,1,'','165/679',2,'',0,'',0),(743,679,'','附件权限','admin','','','','','[]',0,0,0,1,'*','',1,'',0,'',0),(745,743,'','编辑话术','admin','','','','','[]',0,0,0,1,'/admin/setting/store_service/speechcraft/edit','',1,'',0,'admin-setting-store_service-speechcraft-edit',0),(748,745,'','获取话术创建接口','admin','','','api/admin/chat/speechcraft/create','GET','[]',0,0,0,1,'','165/679/743/745',2,'',0,'',0),(749,745,'','修改话术接口','admin','','','api/admin/chat/speechcraft/<id>','PUT','[]',0,0,0,1,'','165/679/743/745',2,'',0,'',0),(750,743,'','删除话术接口','admin','','','api/admin/chat/speechcraft/<id>','DELETE','[]',0,0,0,1,'','165/679/743',2,'',0,'',0),(778,740,'','修改用户反馈接口','admin','','','api/admin/chat/feedback/<id>','PUT','[]',0,0,0,1,'','165/738/740',2,'',0,'',0),(779,740,'','获取修改用户反馈接口','admin','','','api/admin/chat/feedback/<id>/edit','GET','[]',0,0,0,1,'','165/738/740',2,'',0,'',0),(789,743,'','话术分类','admin','','','','','[]',0,0,0,1,'/admin/setting/store_service/speechcraft/cate','',1,'',0,'admin-setting-store_service-speechcraft-cate',0),(790,789,'','获取话术分类列表接口','admin','','','api/admin/chat/speechcraftcate','GET','[]',0,0,0,1,'','165/679/743/789',2,'',0,'',0),(791,789,'','添加话术分类','admin','','','','','[]',0,0,0,1,'/admin/setting/store_service/speechcraft/cate/create','',1,'',0,'',0),(792,791,'','获取话术分类创建接口','admin','','','api/admin/chat/speechcraftcate/create','GET','[]',0,0,0,1,'','165/679/743/789/791',2,'',0,'',0),(793,791,'','保存话术分类接口','admin','','','api/admin/chat/speechcraftcate','POST','[]',0,0,0,1,'','165/679/743/789/791',2,'',0,'',0),(794,795,'','获取修改话术分类接口','admin','','','api/admin/chat/speechcraftcate/<id>/edit','GET','[]',0,0,0,1,'app/wechat/speechcraftcate/<id>/edit','165/679/743/789/795',2,'',0,'',0),(795,789,'','修改话术分类','admin','','','','','[]',0,0,0,1,'/admin/setting/store_service/speechcraft/cate/edit','',1,'',0,'',0),(796,795,'','修改话术分类接口','admin','','','api/admin/chat/speechcraftcate/<id>','PUT','[]',0,0,0,1,'','165/679/743/789/795',2,'',0,'',0),(797,789,'','删除话术分类接口','admin','','','api/admin/chat/speechcraftcate/<id>','DELETE','[]',0,0,0,1,'','165/679/743/789',2,'',0,'',0),(913,656,'','客服页面广告','admin','','','','','[]',0,1,0,1,'/admin/setting/system_group_data/kf_adv','',1,'',0,'setting-system-group_data-kf_adv',0),(915,913,'','设置客服广告','admin','','','api/admin/setting/set_kf_adv','POST','[]',0,0,0,1,'','12/656/913',2,'',0,'adminapi-setting-set_kf_adv',0),(916,913,'','获取客服广告','admin','','','api/admin/setting/get_kf_adv','GET','[]',0,0,0,1,'','12/656/913',2,'',0,'adminapi-setting-get_kf_adv',0),(1008,9,'','用户标签','admin','','','','','[]',0,1,0,1,'/admin/user/label','9',1,'',0,'user-user-label',0),(1009,1008,'','获取添加标签分类表单','admin','','','/api/admin/user/label/cate/create','GET','[]',0,0,0,1,'','9/1008',2,'',0,'admin-user-label_add',0),(1011,12,'','代码获取','admin','','','','','[]',0,1,0,1,'/admin/system/code','12',1,'',0,'admin-system-code',0),(1012,7,'','客户统计','admin','','','api/admin/chart/sum','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1013,7,'','客户首页统计','admin','','','api/admin/chart','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1014,585,'','获取修改用户表单','admin','','','api/admin/user/edit/<id>','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1015,585,'','修改用户','admin','','','api/admin/user/update/<id>','PUT','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1016,585,'','用户列表','admin','','','api/admin/user/index','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1018,585,'','批量修改用户分组','admin','','','api/admin/user/batch/group','PUT','[]',0,0,0,1,'','9/10/585',2,'',0,'admin-user-group_set',0),(1019,585,'','获取全部分组','admin','','','api/admin/user/group/all','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1020,227,'','获取分组列表接口','admin','','','api/admin/user/group','GET','[]',0,0,0,1,'','9/227',2,'',0,'admin-user-group',0),(1021,227,'','保存分组接口','admin','','','api/admin/user/group','POST','[]',0,0,0,1,'','9/227',2,'',0,'',0),(1022,227,'','获取分组创建接口','admin','','','api/admin/user/group/create','GET','[]',0,0,0,1,'','9/227',2,'',0,'',0),(1023,227,'','获取修分组签接口','admin','','','api/admin/user/group/<id>/edit','GET','[]',0,0,0,1,'','9/227',2,'',0,'',0),(1024,227,'','修改分组接口','admin','','','api/admin/user/group/<id>','PUT','[]',0,0,0,1,'','9/227',2,'',0,'',0),(1025,227,'','删除分组接口','admin','','','api/admin/user/group/<id>','DELETE','[]',0,0,0,1,'','9/227',2,'',0,'',0),(1026,1008,'','删除标签分类接口','admin','','','api/admin/user/label/cate/<id>','DELETE','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1027,1008,'','获取标签分类列表接口','admin','','','api/admin/user/label/cate','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1028,1008,'','获取修改标签分类接口','admin','','','api/admin/user/label/cate/<id>/edit','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1029,1008,'','保存标签分类接口','admin','','','api/admin/user/label/cate','POST','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1030,1008,'','获取标签创建接口','admin','','','api/admin/user/label/create','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1031,1008,'','获取标签分类创建接口','admin','','','api/admin/user/label/cate/create','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1032,1008,'','删除标签接口','admin','','','api/admin/user/label/<id>','DELETE','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1033,1008,'','获取修改标签接口','admin','','','api/admin/user/label/<id>/edit','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1034,1008,'','修改标签分类接口','admin','','','api/admin/user/label/cate/<id>','PUT','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1035,1008,'','修改标签接口','admin','','','api/admin/user/label/<id>','PUT','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1036,1008,'','保存标签接口','admin','','','api/admin/user/label','POST','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1037,1008,'','获取标签列表接口','admin','','','api/admin/user/label','GET','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1038,585,'','获取全部标签','admin','','','api/admin/user/label/all','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'admin-user-set_label',0),(1039,585,'','批量修改用户标签','admin','','','api/admin/user/batch/label','PUT','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1040,7,'','获取logo','admin','','','api/admin/logo','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1041,7,'','消息通知','admin','','','api/admin/jnotice','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1042,7,'','获取菜单','admin','','','api/admin/menusList','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1043,1011,'','获取应用列表接口','admin','','','api/admin/app','GET','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1044,1011,'','保存应用接口','admin','','','api/admin/app','POST','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1045,1011,'','获取应用创建接口','admin','','','api/admin/app/create','GET','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1046,1011,'','获取修改应用接口','admin','','','api/admin/app/<id>/edit','GET','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1047,1011,'','修改应用接口','admin','','','api/admin/app/<id>','PUT','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1048,1011,'','删除应用接口','admin','','','api/admin/app/<id>','DELETE','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1049,678,'','客服列表','admin','','','api/admin/chat/kefu','GET','[]',0,0,0,1,'','165/678',2,'',0,'admin-user-group',0),(1050,423,'','添加客服','admin','','','api/admin/chat/kefu','POST','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1051,423,'','客服登录','admin','','','api/admin/chat/kefu/login/<id>','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1052,423,'','添加客服表单','admin','','','api/admin/chat/kefu/add','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'setting-store_service-add',0),(1053,423,'','修改客服表单','admin','','','api/admin/chat/kefu/<id>/edit','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1054,423,'','修改客服','admin','','','api/admin/chat/kefu/<id>','PUT','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1055,423,'','删除客服','admin','','','api/admin/chat/kefu/<id>','DELETE','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1056,423,'','修改客服状态','admin','','','api/admin/chat/kefu/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1057,423,'','聊天记录','admin','','','api/admin/chat/kefu/record/<id>','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1058,423,'','查看对话','admin','','','api/admin/chat/kefu/chat_list','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1059,743,'','保存话术接口','admin','','','api/admin/chat/speechcraft','POST','[]',0,0,0,1,'','165/679/743',2,'',0,'setting-store_service-add',0),(1060,743,'','获取修改话术接口','admin','','','api/admin/chat/speechcraft/<id>/edit','GET','[]',0,0,0,1,'','165/679/743',2,'',0,'',0),(1061,743,'','获取话术详情接口','admin','','','api/admin/chat/speechcraft/<id>','GET','[]',0,0,0,1,'','165/679/743',2,'',0,'',0),(1062,789,'','获取话术分类详情接口','admin','','','api/admin/chat/speechcraftcate/<id>','GET','[]',0,0,0,1,'','165/679/743/789',2,'',0,'',0),(1063,25,'','附件管理','admin','','','','','[]',0,1,1,1,'/admin/system/attachment','25',1,'',0,'',0),(1064,1063,'','图片附件列表','admin','','','api/admin/file/file','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1065,1063,'','删除图片','admin','','','api/admin/file/file/delete','POST','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1066,1063,'','移动图片分类表单','admin','','','api/admin/file/file/move','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1067,1063,'','移动图片分类','admin','','','api/admin/file/file/do_move','PUT','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1068,1063,'','修改图片名称','admin','','','api/admin/file/file//<id>','PUT','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1069,1063,'','修改图片名称','admin','','','api/admin/file/file/update/<id>','PUT','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1070,1063,'','上传图片','admin','','','api/admin/file/upload/<upload_type?>','POST','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1071,1063,'','获取附件分类列表接口','admin','','','api/admin/file/category','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1072,1063,'','保存附件分类接口','admin','','','api/admin/file/category','POST','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1073,1063,'','获取附件分类创建接口','admin','','','api/admin/file/category/create','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1074,1063,'','获取修改附件分类接口','admin','','','api/admin/file/category/<id>/edit','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1075,1063,'','获取附件分类详情接口','admin','','','api/admin/file/category/<id>','GET','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1076,1063,'','修改附件分类接口','admin','','','api/admin/file/category/<id>','PUT','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1077,1063,'','删除附件分类接口','admin','','','api/admin/file/category/<id>','DELETE','[]',0,0,0,1,'','25/1063',2,'',0,'',0),(1078,20,'','删除管理员接口','admin','','','api/admin/setting/admin/<id>','DELETE','[]',0,0,0,1,'','12/14/20',2,'',0,'',0),(1079,21,'','获取修改权限菜单接口','admin','','','api/admin/setting/menus/<id>/edit','GET','[]',0,0,0,1,'','12/14/21',2,'',0,'',0),(1080,7,'','退出登陆','admin','','','api/admin/setting/admin/logout','GET','[]',0,1,0,1,'','7',2,'',0,'',0),(1082,25,'','管理员中心','admin','','','','','[]',0,1,1,1,'/admin/system/user','25',1,'',0,'',0),(1083,1082,'','修改当前管理员信息','admin','','','api/admin/setting/update_admin','PUT','[]',0,0,0,1,'','25/1082',2,'',0,'',0),(1084,1082,'','获取当前管理员信息','admin','','','api/admin/setting/info','GET','[]',0,0,0,1,'','25/1082',2,'',0,'',0),(1085,476,'','组合数据全部','admin','','','api/admin/setting/group_all','GET','[]',0,0,0,1,'','25/56/112/476',2,'',0,'',0),(1086,476,'','获取组合数据创建接口','admin','','','api/admin/setting/group/create','GET','[]',0,0,0,1,'','25/56/112/476',2,'',0,'',0),(1087,476,'','获取修改组合数据接口','admin','','','api/admin/setting/group/<id>/edit','GET','[]',0,0,0,1,'','25/56/112/476',2,'',0,'',0),(1088,21,'','未添加的权限规则列表','admin','','','api/admin/setting/ruleList','GET','[]',0,0,0,1,'','12/14/21',2,'',0,'',0),(1089,23,'','基本配置上传文件','admin','','','api/admin/setting/config/upload','POST','[]',0,0,0,1,'','12/23',2,'',0,'',0),(1090,23,'','获取修改系统配置接口','admin','','','api/admin/setting/config/<id>/edit','GET','[]',0,0,0,1,'','12/23',2,'',0,'',0),(1091,462,'','修改配置分类状态','admin','','','api/admin/setting/config_class/set_status/<id>/<status>','PUT','[]',0,0,0,1,'','25/56/111/462',2,'',0,'',0),(1092,462,'','获取配置分类详情接口','admin','','','api/admin/setting/config_class/<id>','GET','[]',0,0,0,1,'','25/56/111/462',2,'',0,'',0),(1093,476,'','获取组合数据资源详情接口','admin','','','api/admin/setting/group_data/<id>','GET','[]',0,0,0,1,'','25/56/112/476',2,'',0,'',0),(1097,423,'','自动回复列表','admin','','','api/admin/chat/reply','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1098,423,'','删除自动回复','admin','','','api/admin/chat/reply/<id>','DELETE','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1099,423,'','保存自动回复','admin','','','api/admin/chat/reply/<id>','POST','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1100,423,'','获取自动回复表单','admin','','','api/admin/chat/reply/<id>','GET','[]',0,0,0,1,'','165/678/423',2,'',0,'',0),(1101,585,'','用户标签搜索列表','admin','','','api/admin/user/user_label','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1102,1011,'','重置token','admin','','','api/admin/app/reset/<id>','PUT','[]',0,0,0,1,'','12/1011',2,'',0,'',0),(1103,12,'','APP在线升级','admin','','','','','[]',0,1,0,1,'/admin/setting/app/version','12',1,'',0,'setting-app-version',0),(1104,165,'','站点统计','admin','','','','','[]',0,1,0,1,'/admin/kefu/statistics','165',1,'',0,'admin-kefu-statistics',0),(1105,165,'','客服二维码','admin','','','','','[]',0,1,0,1,'/admin/kefu/qrcode','165',1,'',0,'admin-kefu-qrcode',0),(1106,165,'','聊天记录','admin','','','','','[]',0,1,0,1,'/admin/kefu/record','165',1,'',0,'admin-kefu-record',0),(1107,1096,'','设置客服图标','admin','','','/api/admin/setting/config/kefu','GET','[]',0,1,1,1,'','12/656/1096',2,'',0,'adminapi-setting-set_kf_icon',0),(1108,656,'','客服图标','admin','','','','','[]',0,1,0,1,'/admin/setting/system_group_data/kf_icon','12/656',1,'',0,'setting-system-group_data-kf_icon',0),(1110,47,'','系统日志管理员搜索条件','admin','','','api/admin/system/log/search_admin','GET','[]',0,0,0,1,'','25/65/47',2,'',0,'',0),(1111,585,'','用户标签搜索列表','admin','','','api/admin/user/user_label','GET','[]',0,0,0,1,'','9/10/585',2,'',0,'',0),(1112,47,'','系统日志','admin','','','api/admin/system/log','GET','[]',0,0,0,1,'','25/65/47',2,'',0,'',0),(1113,1103,'','保存APP升级','admin','','','api/admin/setting/verison/save/<id>','POST','[]',0,0,0,1,'','12/1103',2,'',0,'',0),(1114,1103,'','获取创建APP升级包表单','admin','','','api/admin/setting/verison/<id>','GET','[]',0,0,0,1,'','12/1103',2,'',0,'',0),(1115,1103,'','删除APP升级包','admin','','','api/admin/setting/verison/<id>','DELETE','[]',0,0,0,1,'','12/1103',2,'',0,'',0),(1116,1103,'','获取APP升级包列表','admin','','','api/admin/setting/verison','GET','[]',0,0,0,1,'','12/1103',2,'',0,'',0),(1117,1104,'','站点统计','admin','','','api/admin/chat/statistics','GET','[]',0,0,0,1,'','165/1102',2,'',0,'',0),(1118,678,'','删除自动回复','admin','','','api/admin/chat/reply/<id>','DELETE','[]',0,0,0,1,'','165/678',2,'',0,'',0),(1119,678,'','保存自动回复','admin','','','api/admin/chat/reply/<id>','POST','[]',0,0,0,1,'','165/678',2,'',0,'',0),(1120,678,'','获取自动回复表单','admin','','','api/admin/chat/reply/<id>','GET','[]',0,0,0,1,'','165/678',2,'',0,'',0),(1121,678,'','自动回复列表','admin','','','api/admin/chat/reply','GET','[]',0,0,0,1,'','165/678',2,'',0,'',0),(1122,1101,'','删除随机客服二维码','admin','','','api/admin/chat/qrcode/<id>','DELETE','[]',0,0,0,1,'','165/1101',2,'',0,'',0),(1123,1101,'','保存随机客服二维码','admin','','','api/admin/chat/qrcode/<id>','POST','[]',0,0,0,1,'','165/1101',2,'',0,'',0),(1124,1101,'','获取随机客服二维码表单','admin','','','api/admin/chat/qrcode/<id>','GET','[]',0,0,0,1,'','165/1101',2,'',0,'',0),(1125,1101,'','获取随机客服二维码','admin','','','api/admin/chat/qrcode','GET','[]',0,0,0,1,'','165/1101',2,'',0,'',0),(1126,1100,'','获取所有客服','admin','','','api/admin/chat/record_kefu','GET','[]',0,0,0,1,'','165/1100',2,'',0,'',0),(1127,1100,'','查看所有聊天记录','admin','','','api/admin/chat/record','GET','[]',0,0,0,1,'','165/1100',2,'',0,'',0),(1128,1096,'','保存客服图标上传配置','admin','','','api/admin/setting/config/kefu','POST','[]',0,1,0,1,'','12/656/1096',2,'',0,'',0),(1129,1008,'','标签分类移动排序','admin','','','api/admin/user/label/move_cate','POST','[]',0,0,0,1,'','9/1008',2,'',0,'',0),(1130,1008,'','标签移动排序','admin','','','api/admin/user/label/move','POST','[]',0,1,0,1,'','9/1008',2,'',0,'',0),(1131,656,'','隐私协议','admin','','','','','[]',0,1,0,1,'/admin/setting/system_group_data/privacy','12/656',1,'',0,'setting-system-group_data-privacy',0),(1132,1131,'','获取隐私协议','admin','','','api/admin/setting/get_user_agreement','GET','[]',0,0,0,1,'','12/656/1094',2,'',0,'',0),(1133,1131,'','设置隐私协议','admin','','','api/admin/setting/set_user_agreement','POST','[]',0,0,0,1,'','12/656/1094',2,'',0,'',0);
/*!40000 ALTER TABLE `eb_system_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eb_system_role`
--

DROP TABLE IF EXISTS `eb_system_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eb_system_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL DEFAULT '' COMMENT '身份管理名称',
  `rules` text NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` int NOT NULL DEFAULT '0' COMMENT '身份等级',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='身份管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eb_system_role`
--

LOCK TABLES `eb_system_role` WRITE;
/*!40000 ALTER TABLE `eb_system_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `eb_system_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-07 22:11:04
