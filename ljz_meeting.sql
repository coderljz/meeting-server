/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ljz_meeting

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 04/12/2020 16:13:52
*/

DROP DATABASE IF EXISTS `ljz_meeting`;
CREATE DATABASE `ljz_meeting`;
USE `ljz_meeting`;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ljz_meeting_clerk
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_clerk`;
CREATE TABLE `ljz_meeting_clerk`  (
  `clerk_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL COMMENT '员工对应部门',
  `name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '员工名',
  PRIMARY KEY (`clerk_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `ljz_meeting_clerk_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `ljz_meeting_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_clerk
-- ----------------------------
INSERT INTO `ljz_meeting_clerk` VALUES (1, 2, '李浚哲');
INSERT INTO `ljz_meeting_clerk` VALUES (2, 2, '吴子鹏');

-- ----------------------------
-- Table structure for ljz_meeting_department
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_department`;
CREATE TABLE `ljz_meeting_department`  (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '部门名',
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_department
-- ----------------------------
INSERT INTO `ljz_meeting_department` VALUES (1, '规划设计中心');
INSERT INTO `ljz_meeting_department` VALUES (2, '软件研发中心');
INSERT INTO `ljz_meeting_department` VALUES (3, '数据分析中心');
INSERT INTO `ljz_meeting_department` VALUES (4, '网络安全中心');
INSERT INTO `ljz_meeting_department` VALUES (5, '云计算中心');
INSERT INTO `ljz_meeting_department` VALUES (6, '物联网中心');
INSERT INTO `ljz_meeting_department` VALUES (7, '集团项目中心');
INSERT INTO `ljz_meeting_department` VALUES (8, '技术服务中心');

-- ----------------------------
-- Table structure for ljz_meeting_join
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_join`;
CREATE TABLE `ljz_meeting_join`  (
  `join_id` int NOT NULL AUTO_INCREMENT,
  `meeting_message_id` int NOT NULL COMMENT '参会会议号',
  `clerk_join_id` int NOT NULL COMMENT '参会员工号',
  PRIMARY KEY (`join_id`) USING BTREE,
  INDEX `meeting_message_id`(`meeting_message_id`) USING BTREE,
  INDEX `clerk_join_id`(`clerk_join_id`) USING BTREE,
  CONSTRAINT `ljz_meeting_join_ibfk_1` FOREIGN KEY (`meeting_message_id`) REFERENCES `ljz_meeting_meeting_message` (`meeting_message_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ljz_meeting_join_ibfk_2` FOREIGN KEY (`clerk_join_id`) REFERENCES `ljz_meeting_clerk` (`clerk_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_join
-- ----------------------------

-- ----------------------------
-- Table structure for ljz_meeting_meeting_message
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_meeting_message`;
CREATE TABLE `ljz_meeting_meeting_message`  (
  `meeting_message_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL COMMENT '会议对应会议室',
  `host_clerk_id` int NOT NULL COMMENT '会议对应主办员工',
  `title` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '会议标题',
  `content` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '无' COMMENT '会议概述',
  `date` date NOT NULL COMMENT '会议日期',
  `time_slot` enum('9:00-10:00','10:00-11:00','11:00-12:00','12:00-13:00','15:00-16:00','16:00-17:00','17:00-18:00','18:00-19:00') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '9:00-10:00' COMMENT '会议时间，只能从8个时间段中选择',
  `record` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '无' COMMENT '会议记录',
  `check_state` enum('已审核通过','已审核未通过','未审核') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '未审核' COMMENT '审核情况',
  `time_state` enum('未开始','进行中','已完成') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '未开始' COMMENT '时间状态：未开始，进行中，已完成',
  PRIMARY KEY (`meeting_message_id`) USING BTREE,
  INDEX `room_id`(`room_id`) USING BTREE,
  INDEX `host_clerk_id`(`host_clerk_id`) USING BTREE,
  CONSTRAINT `ljz_meeting_meeting_message_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `ljz_meeting_room` (`room_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ljz_meeting_meeting_message_ibfk_2` FOREIGN KEY (`host_clerk_id`) REFERENCES `ljz_meeting_clerk` (`clerk_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_meeting_message
-- ----------------------------

-- ----------------------------
-- Table structure for ljz_meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_room`;
CREATE TABLE `ljz_meeting_room`  (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_address` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '会议室门牌号',
  `is_available` enum('enable','disable') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT 'enable' COMMENT '可用信息',
  `appoint_num` int NOT NULL DEFAULT 0 COMMENT '预定人数',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_room
-- ----------------------------

-- ----------------------------
-- Table structure for ljz_meeting_user
-- ----------------------------
DROP TABLE IF EXISTS `ljz_meeting_user`;
CREATE TABLE `ljz_meeting_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `clerk_id` int NOT NULL COMMENT '该用户对应的员工',
  `username` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '123456' COMMENT '密码',
  `power` enum('admin','ord') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT 'ord' COMMENT '权限',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `clerk_id`(`clerk_id`) USING BTREE,
  CONSTRAINT `ljz_meeting_user_ibfk_1` FOREIGN KEY (`clerk_id`) REFERENCES `ljz_meeting_clerk` (`clerk_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ljz_meeting_user
-- ----------------------------
INSERT INTO `ljz_meeting_user` (`user_id`,`clerk_id`,`username`,`password`,`power`) VALUE ('1','1','admin','666666','admin'),('2','2','coderwu','123456','ord');
UPDATE `ljz_meeting_user` SET `password` = MD5(`password`);

SET FOREIGN_KEY_CHECKS = 1;
