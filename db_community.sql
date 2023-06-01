/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云数据库
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 106.14.246.27:3306
 Source Schema         : db_community

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 01/06/2023 21:04:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sms_phone
-- ----------------------------
DROP TABLE IF EXISTS `sms_phone`;
CREATE TABLE `sms_phone`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '错误信息',
  `platform` tinyint NULL DEFAULT NULL COMMENT '平台类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_phone
-- ----------------------------
INSERT INTO `sms_phone` VALUES (1, '2023-05-25 15:14:42', '2023-05-25 15:14:42', 1, NULL, '15729611641', '694223', 0, NULL, NULL, 1);
INSERT INTO `sms_phone` VALUES (2, '2023-05-25 15:17:03', '2023-05-25 15:17:03', 1, NULL, '15729611641', '102433', 0, NULL, NULL, 1);
INSERT INTO `sms_phone` VALUES (3, '2023-05-25 15:22:36', '2023-05-25 15:22:36', 1, NULL, '15729611641', '798950', 0, NULL, NULL, 1);
INSERT INTO `sms_phone` VALUES (4, '2023-05-25 15:26:09', '2023-05-25 15:26:09', NULL, NULL, '15729611642', NULL, 0, 1, '用户不存在', 1);
INSERT INTO `sms_phone` VALUES (5, '2023-05-25 15:40:13', '2023-05-25 15:40:13', 1, NULL, '17384438260', '968268', 0, 0, NULL, 1);
INSERT INTO `sms_phone` VALUES (6, '2023-05-29 10:26:10', '2023-05-29 10:26:10', 1, NULL, '17384438260', '277889', 0, 0, NULL, 1);

-- ----------------------------
-- Table structure for sms_phone_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_phone_log`;
CREATE TABLE `sms_phone_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `userid` bigint NULL DEFAULT NULL COMMENT '用户id',
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备token',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板',
  `platform` tinyint NULL DEFAULT NULL COMMENT '平台',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_phone_log
-- ----------------------------
INSERT INTO `sms_phone_log` VALUES (1, '2023-05-25 15:40:12', '2023-05-25 15:40:12', NULL, NULL, '127.0.0.1', '内网IP', 0, '17384438260', NULL, NULL, 0, 'SMS_460700333', 0);
INSERT INTO `sms_phone_log` VALUES (2, '2023-05-29 10:26:09', '2023-05-29 10:26:09', 1, NULL, '127.0.0.1', '内网IP', 0, '17384438260', 1, NULL, 0, 'SMS_460700333', 0);

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键;主键',
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录账号;登录账号',
  `PASSWORD` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录密码;登录密码',
  `PHONE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号;手机号',
  `ACCOUNT_STATUS` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '账号状态(1:正常,2:停用,3:冻结,4:删除);账号状态',
  `ONLINE_STATUS` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否在线(0:离线 1:在线);是否在线',
  `SUPER_ADMIN` tinyint NULL DEFAULT 0 COMMENT '是否是超级管理员（0:不是  1:是）',
  `TOKEN` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户认证的token',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0:正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人;创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新人;更新人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10019 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES (10000, 'admin', '{bcrypt}$2a$10$LDTNfpPt/xABqtxksFide.YkBwm4GPwhMm8yzNQCROCRbUqmsbQAW', '17384438260', '1', '1', 1, 'd8e24644e6d84874a947b629155dd903', 0, 10000, '2023-05-23 13:19:07', NULL, '2023-06-01 20:30:18');
INSERT INTO `sys_admin` VALUES (10001, 'ls', '{bcrypt}$2a$10$CgCmsYWZDcIj.SbtyJq6AuatQKRhSai2hhGI6Ni87T.qrecjGIwAa', NULL, '1', '0', 0, NULL, 1, 10000, '2023-05-24 07:42:19', 10000, '2023-05-24 07:42:19');
INSERT INTO `sys_admin` VALUES (10003, 'otter', '{bcrypt}$2a$10$KFD3jQ4UX7FSOsmYVq.agO5hVvSo/wVZt/80KyVGPGDpZkq/gZA2O', '15729611641', '1', '1', 0, NULL, 0, 10000, '2023-05-24 15:48:21', 10000, '2023-05-24 15:48:24');
INSERT INTO `sys_admin` VALUES (10004, 'lisi', '{bcrypt}$2a$10$LDTNfpPt/xABqtxksFide.YkBwm4GPwhMm8yzNQCROCRbUqmsbQAW', '17751111829', '1', '0', 0, NULL, 0, 10000, '2023-05-27 13:03:26', 10000, '2023-05-27 13:03:26');
INSERT INTO `sys_admin` VALUES (10005, 'lisi2', '{bcrypt}$2a$10$CBN5m/bTcIZ8FHZr00fa..TgEUMfCC9nVY714ha0C4BvNz2UEEjpq', '17751111824', '1', '0', 0, NULL, 0, 10000, '2023-05-27 13:12:26', 10000, '2023-05-27 13:12:26');
INSERT INTO `sys_admin` VALUES (10006, 'admin3', '{bcrypt}$2a$10$wNLqyfTxAIg.iGfrJqpi4OMliRyy61IhqC3mnMq8Ar1KsLlSaygcy', '', '1', '0', 0, '', 1, 10000, '2023-05-30 09:35:06', 10000, '2023-05-31 09:17:25');
INSERT INTO `sys_admin` VALUES (10007, 'admin4', '{bcrypt}$2a$10$KPe0nvznga2qbgH/7CQYOuMMPxgzSMY66PCTg.3PolSKvjR2Y77Aq', '15996883948', '1', '0', 0, '', 0, 10000, '2023-05-30 10:07:02', 10000, '2023-06-01 15:09:41');
INSERT INTO `sys_admin` VALUES (10008, 'admin5', '{bcrypt}$2a$10$OY4.gLWYctHPa6pWGbIRoO30ilDiDE4CNPaGe3v7d6Q/wh6zGGSnu', '852147963', '1', '0', 0, NULL, 1, 10000, '2023-05-30 10:16:36', 10000, '2023-05-30 10:16:36');
INSERT INTO `sys_admin` VALUES (10009, 'om1ga', '{bcrypt}$2a$10$5.ZEyZ1J.aXh7lyNTVUlIuHqZzkm5tkNDHnvUCnaQn89ew7/NJegi', NULL, NULL, '0', 0, NULL, 1, 10000, '2023-05-30 11:01:56', 10000, '2023-05-30 11:01:56');
INSERT INTO `sys_admin` VALUES (10010, 'admin7', '{bcrypt}$2a$10$w2F7g1ZUDP0RGjlgV7DmnuwrsBuZZJb0wL4x/Cx1TcTqDhqBCDMQu', '123456789654', '1', '0', 0, NULL, 1, 10000, '2023-05-30 15:35:08', 10000, '2023-05-30 15:35:08');
INSERT INTO `sys_admin` VALUES (10011, 'admin8', '{bcrypt}$2a$10$D4n7XLekewmDNB2wclV2g.0RL9EQ3XmNp9GlbYstGQDkz.UyKT2/a', '123123', '1', '0', 0, '', 1, 10000, '2023-05-31 09:31:01', 10011, '2023-05-31 10:09:02');
INSERT INTO `sys_admin` VALUES (10012, 'admin5', '{bcrypt}$2a$10$jDOXo/59uvz4VIq5NXL2K.WSJYRpsQRv0oGDzUxSNNNZdhrDhcmgW', '789546213', '1', '0', 0, NULL, 1, 10000, '2023-05-31 10:16:19', 10000, '2023-05-31 10:16:19');
INSERT INTO `sys_admin` VALUES (10013, 'admin6', '{bcrypt}$2a$10$ljhWE8Sxl8OWexLs65Gc/usEyfG5knw90Xyap8XDIqGkATJq7dmKC', '123123', '1', '0', 0, NULL, 1, 10000, '2023-05-31 11:02:25', 10000, '2023-05-31 11:02:25');
INSERT INTO `sys_admin` VALUES (10014, 'admin7', '{bcrypt}$2a$10$bI51uU1W6WuFjqUAaxoC7evtbosD0ALgqopjfDCcPZ0UkBlcpoFyu', '123124', '1', '0', 0, '', 1, 10000, '2023-05-31 11:02:57', 10014, '2023-06-01 10:12:08');
INSERT INTO `sys_admin` VALUES (10015, 'admin5', '{bcrypt}$2a$10$ERuqVtwGt7rSKH.eDSJMWe/Yo/bJp/WF7ficTSQJD54cX0AOdG7mG', '15996883947', '1', '0', 0, NULL, 0, 10000, '2023-06-01 13:41:27', 10000, '2023-06-01 15:09:22');
INSERT INTO `sys_admin` VALUES (10016, 'admin6', '{bcrypt}$2a$10$g9/vlVILVzAg7bTJtbPhF.TOrAn9LsNfah7IckmF3MMbpDb2AqvFu', '15996883942', '1', '0', 0, NULL, 0, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 16:32:02');
INSERT INTO `sys_admin` VALUES (10017, 'test1', '{bcrypt}$2a$10$y7pPJXKcX3cDmQWXu3oB/O9ECl.QiqLOK.Ct4NHUGcyYcalc.x5z6', '15996883456', '1', '0', 0, NULL, 0, 10000, '2023-06-01 16:35:14', 10000, '2023-06-01 16:35:14');
INSERT INTO `sys_admin` VALUES (10018, 'test2', '{bcrypt}$2a$10$vnKW7yKYXx8zNRZFZczE4u5IHvovYFEx27W8ym2TWuKGA.tp6/cdK', '15996883654', '1', '0', 0, NULL, 0, 10000, '2023-06-01 16:47:51', 10000, '2023-06-01 16:47:51');
INSERT INTO `sys_admin` VALUES (10019, 'test3', '{bcrypt}$2a$10$o0dVME/PLIZm4p.JIPTukO1fP4HxlYG3wVRNz0jbIf2..cgI4SJkS', '15996231478', '1', '0', 0, '', 0, 10000, '2023-06-01 16:50:06', 10019, '2023-06-01 20:30:16');

-- ----------------------------
-- Table structure for sys_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_department`;
CREATE TABLE `sys_admin_department`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADMIN_ID` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  `DEPARTMENT_ID` bigint NULL DEFAULT NULL COMMENT '管理员所属部门ID',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin_department
-- ----------------------------
INSERT INTO `sys_admin_department` VALUES (2, 10006, 2, 1, 10000, '2023-05-30 09:26:05', 10000, '2023-05-31 09:17:25');
INSERT INTO `sys_admin_department` VALUES (4, 10007, 1, 0, 10000, '2023-05-30 10:07:02', 10000, '2023-06-01 15:09:41');
INSERT INTO `sys_admin_department` VALUES (5, 10008, 2, 1, 10000, '2023-05-30 10:16:36', 10000, '2023-05-30 10:16:36');
INSERT INTO `sys_admin_department` VALUES (6, 10009, 1, 0, 10000, '2023-05-30 11:01:56', 10000, '2023-05-30 11:01:56');
INSERT INTO `sys_admin_department` VALUES (7, 10010, 1, 1, 10000, '2023-05-30 15:35:08', 10000, '2023-05-30 15:35:08');
INSERT INTO `sys_admin_department` VALUES (9, 10011, 2, 1, 10000, '2023-05-31 09:31:01', 10000, '2023-05-31 09:31:01');
INSERT INTO `sys_admin_department` VALUES (10, 10012, 1, 1, 10000, '2023-05-31 10:16:19', 10000, '2023-05-31 10:16:19');
INSERT INTO `sys_admin_department` VALUES (11, 10013, 2, 1, 10000, '2023-05-31 11:02:25', 10000, '2023-05-31 11:02:25');
INSERT INTO `sys_admin_department` VALUES (12, 10014, 2, 1, 10000, '2023-05-31 11:02:57', 10000, '2023-05-31 11:02:57');
INSERT INTO `sys_admin_department` VALUES (13, 10015, 1, 1, 10000, '2023-05-31 11:18:20', 10000, '2023-05-31 11:18:20');
INSERT INTO `sys_admin_department` VALUES (14, 10015, 1, 0, 10000, '2023-06-01 13:41:27', 10000, '2023-06-01 15:09:23');
INSERT INTO `sys_admin_department` VALUES (15, 10016, 1, 0, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 16:32:02');
INSERT INTO `sys_admin_department` VALUES (16, 10017, 1, 0, 10000, '2023-06-01 16:35:14', 10000, '2023-06-01 16:35:14');
INSERT INTO `sys_admin_department` VALUES (17, 10018, 1, 0, 10000, '2023-06-01 16:47:51', 10000, '2023-06-01 16:47:51');
INSERT INTO `sys_admin_department` VALUES (18, 10019, 1, 0, 10000, '2023-06-01 16:50:06', 10000, '2023-06-01 17:01:54');

-- ----------------------------
-- Table structure for sys_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_info`;
CREATE TABLE `sys_admin_info`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADMIN_ID` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  `REAL_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `AVATAR` varchar(10240) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `POST_ID` bigint NULL DEFAULT NULL COMMENT '职务ID',
  `GENDER` int NULL DEFAULT NULL COMMENT '鎬у埆',
  `EMAIL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `VX_ACCOUNT` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `JOB_NUMBER` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '工号',
  `NATIVE_PLACE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `GRADUATE_SCHOOL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `GRADUATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '毕业时间',
  `EDUCATION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '学历',
  `MAJOR` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '专业',
  `REMARK` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `SORT` int NULL DEFAULT NULL COMMENT '排序字段',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin_info
-- ----------------------------
INSERT INTO `sys_admin_info` VALUES (1, 10000, '张三', 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/avatar/me.jpg', 1, 1, 'admin@gmail.com', NULL, '10000', '江苏南京', '南京大学', '2023-05-23 14:11:17', '博士', '金融管理', '超管', 0, 0, 10000, '2023-05-23 14:12:25', 10000, '2023-05-23 14:12:32', '2023-06-01 20:30:17');
INSERT INTO `sys_admin_info` VALUES (2, 10001, '陶然然', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-24 07:42:19', 10000, '2023-05-24 07:42:19', NULL);
INSERT INTO `sys_admin_info` VALUES (4, 10004, '李四', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-27 13:03:26', 10000, '2023-05-27 13:03:26', NULL);
INSERT INTO `sys_admin_info` VALUES (5, 10005, '李四2', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-27 13:12:26', 10000, '2023-05-27 13:12:26', NULL);
INSERT INTO `sys_admin_info` VALUES (7, 10006, '默认用户名2', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '123456789@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-30 09:35:06', 10000, '2023-05-31 09:17:25', NULL);
INSERT INTO `sys_admin_info` VALUES (8, 10007, 'ADMIN4', 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/avatar/me.jpg', NULL, 0, '987654321@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-30 10:07:02', 10000, '2023-06-01 15:09:41', '2023-06-01 12:59:30');
INSERT INTO `sys_admin_info` VALUES (9, 10008, 'ADMIN5', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '84566223@qq,com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-30 10:16:36', 10000, '2023-05-30 10:16:36', NULL);
INSERT INTO `sys_admin_info` VALUES (10, 10009, 'om1ga', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '123@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-30 11:01:56', 10000, '2023-05-30 11:01:56', NULL);
INSERT INTO `sys_admin_info` VALUES (11, 10010, 'ADMIN7', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 2, '1235486212@qq,com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-30 15:35:08', 10000, '2023-05-30 15:35:08', NULL);
INSERT INTO `sys_admin_info` VALUES (13, 10011, 'admin8', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-31 09:31:01', 10000, '2023-05-31 09:31:01', '2023-05-31 09:29:21');
INSERT INTO `sys_admin_info` VALUES (14, 10012, 'ADMIN5', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 1, '789546213@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-31 10:16:19', 10000, '2023-05-31 10:16:19', NULL);
INSERT INTO `sys_admin_info` VALUES (15, 10013, 'admin6', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-31 11:02:25', 10000, '2023-05-31 11:02:25', NULL);
INSERT INTO `sys_admin_info` VALUES (16, 10014, 'admin7', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 1, '123124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-31 11:02:57', 10000, '2023-05-31 11:02:57', '2023-05-31 10:12:52');
INSERT INTO `sys_admin_info` VALUES (17, 10015, 'ADMIN10', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 0, '1952122@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-31 11:18:20', 10000, '2023-05-31 11:18:20', NULL);
INSERT INTO `sys_admin_info` VALUES (18, 10003, 'otter', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 0, '1952122@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 12:54:52', 10000, '2023-06-01 12:54:57', NULL);
INSERT INTO `sys_admin_info` VALUES (19, 10015, 'ADMIN5', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 1, '123456789@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 13:41:27', 10000, '2023-06-01 15:09:23', NULL);
INSERT INTO `sys_admin_info` VALUES (20, 10016, 'ADMIN6', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 1, '1952932108@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 16:32:02', NULL);
INSERT INTO `sys_admin_info` VALUES (21, 10017, 'test1', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 1, '1952932144@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 16:35:14', 10000, '2023-06-01 16:35:14', NULL);
INSERT INTO `sys_admin_info` VALUES (22, 10018, 'test2', 'https://flobby.oss-cn-shenzhen.aliyuncs.com/avatar1/bg_yidenglu.png', NULL, 1, '1952932104@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 16:47:51', 10000, '2023-06-01 16:47:51', NULL);
INSERT INTO `sys_admin_info` VALUES (23, 10019, 'test3', 'http://47.115.224.170:9000/samrtcommunity/35e4cfcf-f9e5-4cc8-a596-7d3e671dc95c.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=om1ga%2F20230601%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20230601T122119Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=0ea7da6f834976cefa822a7fff27fd068f3a4fddb503a62b23f4f3cfc6d704f4', NULL, 1, '1952932106@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-06-01 16:50:06', 10000, '2023-06-01 17:01:54', '2023-06-01 20:23:05');

-- ----------------------------
-- Table structure for sys_admin_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_post`;
CREATE TABLE `sys_admin_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `deleted` tinyint NOT NULL,
  `creator` bigint NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `updater` bigint NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_admin_post
-- ----------------------------
INSERT INTO `sys_admin_post` VALUES (1, 1, 10006, 1, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05');
INSERT INTO `sys_admin_post` VALUES (2, 2, 10006, 1, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05');
INSERT INTO `sys_admin_post` VALUES (5, 2, 10007, 1, 10000, '2023-05-30 10:07:02', 10000, '2023-05-30 10:07:02');
INSERT INTO `sys_admin_post` VALUES (6, 1, 10008, 1, 10000, '2023-05-30 10:16:36', 10000, '2023-05-30 10:16:36');
INSERT INTO `sys_admin_post` VALUES (7, 2, 10008, 1, 10000, '2023-05-30 10:16:36', 10000, '2023-05-30 10:16:36');
INSERT INTO `sys_admin_post` VALUES (8, 1, 10010, 1, 10000, '2023-05-30 15:35:08', 10000, '2023-05-30 15:35:08');
INSERT INTO `sys_admin_post` VALUES (9, 2, 10010, 1, 10000, '2023-05-30 15:35:08', 10000, '2023-05-30 15:35:08');
INSERT INTO `sys_admin_post` VALUES (10, 1, 10006, 1, 10000, '2023-05-31 09:09:31', 10000, '2023-05-31 09:09:31');
INSERT INTO `sys_admin_post` VALUES (11, 2, 10006, 1, 10000, '2023-05-31 09:09:31', 10000, '2023-05-31 09:09:31');
INSERT INTO `sys_admin_post` VALUES (12, 1, 10006, 1, 10000, '2023-05-31 09:10:34', 10000, '2023-05-31 09:10:34');
INSERT INTO `sys_admin_post` VALUES (13, 1, 10006, 1, 10000, '2023-05-31 09:10:49', 10000, '2023-05-31 09:10:49');
INSERT INTO `sys_admin_post` VALUES (14, 1, 10006, 1, 10000, '2023-05-31 09:11:18', 10000, '2023-05-31 09:11:18');
INSERT INTO `sys_admin_post` VALUES (15, 1, 10006, 1, 10000, '2023-05-31 09:11:48', 10000, '2023-05-31 09:11:48');
INSERT INTO `sys_admin_post` VALUES (16, 1, 10006, 1, 10000, '2023-05-31 09:12:00', 10000, '2023-05-31 09:12:00');
INSERT INTO `sys_admin_post` VALUES (17, 1, 10006, 1, 10000, '2023-05-31 09:12:28', 10000, '2023-05-31 09:12:28');
INSERT INTO `sys_admin_post` VALUES (18, 1, 10006, 1, 10000, '2023-05-31 09:15:06', 10000, '2023-05-31 09:15:06');
INSERT INTO `sys_admin_post` VALUES (19, 1, 10006, 1, 10000, '2023-05-31 09:16:47', 10000, '2023-05-31 09:16:47');
INSERT INTO `sys_admin_post` VALUES (20, 1, 10006, 1, 10000, '2023-05-31 09:16:52', 10000, '2023-05-31 09:16:52');
INSERT INTO `sys_admin_post` VALUES (21, 1, 10006, 1, 10000, '2023-05-31 09:17:25', 10000, '2023-05-31 09:17:25');
INSERT INTO `sys_admin_post` VALUES (22, 2, 10006, 1, 10000, '2023-05-31 09:17:25', 10000, '2023-05-31 09:17:25');
INSERT INTO `sys_admin_post` VALUES (23, 2, 10011, 1, 10000, '2023-05-31 09:18:49', 10000, '2023-05-31 09:18:49');
INSERT INTO `sys_admin_post` VALUES (24, 1, 10011, 1, 10000, '2023-05-31 09:18:49', 10000, '2023-05-31 09:18:49');
INSERT INTO `sys_admin_post` VALUES (25, 1, 10012, 1, 10000, '2023-05-31 10:16:19', 10000, '2023-05-31 10:16:19');
INSERT INTO `sys_admin_post` VALUES (26, 2, 10012, 1, 10000, '2023-05-31 10:16:19', 10000, '2023-05-31 10:16:19');
INSERT INTO `sys_admin_post` VALUES (27, 1, 10015, 1, 10000, '2023-05-31 11:18:20', 10000, '2023-05-31 11:18:20');
INSERT INTO `sys_admin_post` VALUES (28, 9, 10007, 1, 10000, '2023-06-01 10:35:36', 10000, '2023-06-01 10:35:36');
INSERT INTO `sys_admin_post` VALUES (29, 10, 10007, 1, 10000, '2023-06-01 10:35:36', 10000, '2023-06-01 10:35:36');
INSERT INTO `sys_admin_post` VALUES (30, 9, 10007, 1, 10000, '2023-06-01 13:03:53', 10000, '2023-06-01 13:03:53');
INSERT INTO `sys_admin_post` VALUES (31, 10, 10007, 1, 10000, '2023-06-01 13:03:53', 10000, '2023-06-01 13:03:53');
INSERT INTO `sys_admin_post` VALUES (32, 9, 10007, 1, 10000, '2023-06-01 13:37:30', 10000, '2023-06-01 13:37:30');
INSERT INTO `sys_admin_post` VALUES (33, 10, 10007, 1, 10000, '2023-06-01 13:37:30', 10000, '2023-06-01 13:37:30');
INSERT INTO `sys_admin_post` VALUES (34, 4, 10015, 1, 10000, '2023-06-01 13:41:27', 10000, '2023-06-01 13:41:27');
INSERT INTO `sys_admin_post` VALUES (35, 5, 10015, 1, 10000, '2023-06-01 13:41:27', 10000, '2023-06-01 13:41:27');
INSERT INTO `sys_admin_post` VALUES (36, 4, 10015, 1, 10000, '2023-06-01 14:19:44', 10000, '2023-06-01 14:19:44');
INSERT INTO `sys_admin_post` VALUES (37, 5, 10015, 1, 10000, '2023-06-01 14:19:44', 10000, '2023-06-01 14:19:44');
INSERT INTO `sys_admin_post` VALUES (38, 9, 10007, 1, 10000, '2023-06-01 14:30:42', 10000, '2023-06-01 14:30:42');
INSERT INTO `sys_admin_post` VALUES (39, 10, 10007, 1, 10000, '2023-06-01 14:30:42', 10000, '2023-06-01 14:30:42');
INSERT INTO `sys_admin_post` VALUES (40, 8, 10016, 1, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 14:31:26');
INSERT INTO `sys_admin_post` VALUES (41, 7, 10016, 1, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 14:31:26');
INSERT INTO `sys_admin_post` VALUES (42, 4, 10015, 0, 10000, '2023-06-01 15:09:23', 10000, '2023-06-01 15:09:23');
INSERT INTO `sys_admin_post` VALUES (43, 5, 10015, 0, 10000, '2023-06-01 15:09:23', 10000, '2023-06-01 15:09:23');
INSERT INTO `sys_admin_post` VALUES (44, 8, 10016, 1, 10000, '2023-06-01 15:09:29', 10000, '2023-06-01 15:09:29');
INSERT INTO `sys_admin_post` VALUES (45, 7, 10016, 1, 10000, '2023-06-01 15:09:29', 10000, '2023-06-01 15:09:29');
INSERT INTO `sys_admin_post` VALUES (46, 8, 10016, 1, 10000, '2023-06-01 15:09:35', 10000, '2023-06-01 15:09:35');
INSERT INTO `sys_admin_post` VALUES (47, 7, 10016, 1, 10000, '2023-06-01 15:09:35', 10000, '2023-06-01 15:09:35');
INSERT INTO `sys_admin_post` VALUES (48, 9, 10007, 0, 10000, '2023-06-01 15:09:41', 10000, '2023-06-01 15:09:41');
INSERT INTO `sys_admin_post` VALUES (49, 10, 10007, 0, 10000, '2023-06-01 15:09:41', 10000, '2023-06-01 15:09:41');
INSERT INTO `sys_admin_post` VALUES (50, 8, 10016, 0, 10000, '2023-06-01 16:32:02', 10000, '2023-06-01 16:32:02');
INSERT INTO `sys_admin_post` VALUES (51, 7, 10016, 0, 10000, '2023-06-01 16:32:02', 10000, '2023-06-01 16:32:02');
INSERT INTO `sys_admin_post` VALUES (52, 3, 10017, 0, 10000, '2023-06-01 16:35:14', 10000, '2023-06-01 16:35:14');
INSERT INTO `sys_admin_post` VALUES (53, 9, 10018, 0, 10000, '2023-06-01 16:47:51', 10000, '2023-06-01 16:47:51');
INSERT INTO `sys_admin_post` VALUES (54, 7, 10019, 1, 10000, '2023-06-01 16:50:06', 10000, '2023-06-01 16:50:06');
INSERT INTO `sys_admin_post` VALUES (55, 7, 10019, 1, 10000, '2023-06-01 16:53:59', 10000, '2023-06-01 16:53:59');
INSERT INTO `sys_admin_post` VALUES (56, 7, 10019, 0, 10000, '2023-06-01 17:01:54', 10000, '2023-06-01 17:01:54');

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint NULL DEFAULT NULL COMMENT '父级部门ID',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `sort` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '排序',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES (1, 0, '财务部', '财务部', '0', 0, 10000, '2023-05-23 17:08:53', 10000, '2023-05-23 17:09:00');
INSERT INTO `sys_department` VALUES (2, 0, '安保部', '安保部', '0', 0, 10000, '2023-05-23 17:16:51', 10000, '2023-05-23 17:16:58');
INSERT INTO `sys_department` VALUES (3, 0, '测试部门', '测试部门', '2', 1, 10000, '2023-05-25 15:25:48', 10000, '2023-05-25 15:55:43');
INSERT INTO `sys_department` VALUES (4, 3, '测试子部门', '测试子部门', '0', 1, 10000, '2023-05-25 15:52:19', 10000, '2023-05-25 15:55:47');
INSERT INTO `sys_department` VALUES (5, 0, '测试', '测试', '1', 1, 10000, '2023-05-25 16:10:04', 10000, '2023-05-31 08:17:39');
INSERT INTO `sys_department` VALUES (6, 5, '测试子', '测试子', '0', 1, 10000, '2023-05-25 16:10:16', 10000, '2023-05-25 16:10:20');
INSERT INTO `sys_department` VALUES (7, 5, '测试子', '测试子', '0', 1, 10000, '2023-05-25 16:10:34', 10000, '2023-05-31 08:17:37');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_type_id` bigint NOT NULL COMMENT '字典类型ID',
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `label_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签样式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识  0：正常   1：已删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '停用', '0', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (2, 1, '正常', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (3, 2, '男', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (4, 2, '女', '2', 'success', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (5, 2, '未知', '0', 'warning', '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (6, 3, '正常', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (7, 3, '停用', '0', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (8, 4, '全部数据', '0', '', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (9, 4, '本机构及子机构数据', '1', '', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (10, 4, '本机构数据', '2', '', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (11, 4, '本人数据', '3', '', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (12, 4, '自定义数据', '4', '', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (13, 5, '禁用', '0', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (14, 5, '启用', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (15, 6, '失败', '0', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (16, 6, '成功', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (17, 7, '登录成功', '0', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (18, 7, '退出成功', '1', 'primary', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (19, 7, '验证码错误', '2', 'warning', '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (20, 7, '账号密码错误', '3', 'danger', '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (21, 8, '否', '0', 'primary', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (22, 8, '是', '1', 'danger', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (23, 9, '是', '1', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (24, 9, '否', '0', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (25, 10, '阿里云', '0', '', '', 0, 0, 10000, '2023-05-13 19:46:21', 10000, '2023-05-13 19:46:21');
INSERT INTO `sys_dict_data` VALUES (26, 10, '腾讯云', '1', '', '', 1, 0, 10000, '2023-05-13 19:46:21', 10000, '2023-05-13 19:46:21');
INSERT INTO `sys_dict_data` VALUES (27, 10, '七牛云', '2', '', '', 2, 0, 10000, '2023-05-13 19:46:21', 10000, '2023-05-13 19:46:21');
INSERT INTO `sys_dict_data` VALUES (29, 11, '默认', 'default', '', '', 0, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_data` VALUES (30, 11, '系统', 'system', '', '', 1, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_data` VALUES (31, 12, '暂停', '0', 'danger', '', 0, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_data` VALUES (32, 12, '正常', '1', 'primary', '', 1, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_data` VALUES (33, 13, '离线', '0', 'danger', NULL, 0, 0, 10000, '2023-05-26 09:36:17', 10000, '2023-05-26 09:36:20');
INSERT INTO `sys_dict_data` VALUES (34, 13, '在线', '1', 'primary', NULL, 1, 0, 10000, '2023-05-26 09:36:45', NULL, '2023-05-26 09:36:47');
INSERT INTO `sys_dict_data` VALUES (35, 14, '消杀通知', '0', 'primary', '消杀通知', 0, 0, 10000, '2023-05-26 11:30:51', 10000, '2023-05-26 11:30:51');
INSERT INTO `sys_dict_data` VALUES (36, 14, '物业通知', '1', 'primary', '物业通知', 0, 0, 10000, '2023-05-26 11:31:11', 10000, '2023-05-26 11:31:11');
INSERT INTO `sys_dict_data` VALUES (37, 14, '缴费通知', '2', 'danger', '缴费通知', 0, 0, 10000, '2023-05-26 11:31:28', 10000, '2023-05-26 11:31:28');
INSERT INTO `sys_dict_data` VALUES (38, 15, '未审核', '0', 'info', '未审核', 0, 0, 10000, '2023-05-26 11:35:59', 10000, '2023-05-26 11:35:59');
INSERT INTO `sys_dict_data` VALUES (39, 15, '已审核', '1', 'success', '已审核', 0, 0, 10000, '2023-05-26 11:36:15', 10000, '2023-05-26 11:36:15');
INSERT INTO `sys_dict_data` VALUES (40, 15, '不通过', '2', 'danger', '不通过', 0, 0, 10000, '2023-05-26 11:36:49', 10000, '2023-05-26 11:36:49');
INSERT INTO `sys_dict_data` VALUES (41, 16, '未处理', '0', 'danger', '', 0, 0, 10000, '2023-05-27 15:41:55', 10000, '2023-05-27 15:41:55');
INSERT INTO `sys_dict_data` VALUES (42, 16, '处理中', '1', 'info', '处理中', 0, 0, 10000, '2023-05-27 15:42:17', 10000, '2023-05-27 15:42:17');
INSERT INTO `sys_dict_data` VALUES (43, 16, '已处理', '1', 'success', '已处理', 0, 0, 10000, '2023-05-27 15:42:33', 10000, '2023-05-27 15:42:33');
INSERT INTO `sys_dict_data` VALUES (44, 16, '已评价', '3', 'primary', '已评价', 0, 0, 10000, '2023-05-27 15:42:57', 10000, '2023-05-27 15:42:57');
INSERT INTO `sys_dict_data` VALUES (45, 17, '公共报修', '0', '', '公共报修', 0, 0, 10000, '2023-05-27 15:47:32', 10000, '2023-05-27 15:47:32');
INSERT INTO `sys_dict_data` VALUES (46, 17, '个人报修', '1', '', '个人报修', 0, 0, 10000, '2023-05-27 15:47:50', 10000, '2023-05-27 15:47:50');
INSERT INTO `sys_dict_data` VALUES (47, 18, '存在', '0', 'success', '没被删除', 0, 0, 10000, '2023-05-29 09:12:24', 10000, '2023-05-29 09:12:24');
INSERT INTO `sys_dict_data` VALUES (48, 18, '已删除', '1', 'danger', '被删除', 0, 0, 10000, '2023-05-29 09:12:51', 10000, '2023-05-29 09:12:51');
INSERT INTO `sys_dict_data` VALUES (49, 19, '扰民投诉', '0', '', '扰民投诉', 0, 0, 10000, '2023-05-29 10:26:44', 10000, '2023-05-29 10:26:44');
INSERT INTO `sys_dict_data` VALUES (50, 19, '物业投诉', '1', '', '物业投诉', 0, 0, 10000, '2023-05-29 10:27:07', 10000, '2023-05-29 10:27:07');
INSERT INTO `sys_dict_data` VALUES (51, 19, '卫生投诉', '2', '', '卫生投诉', 0, 0, 10000, '2023-05-29 10:27:23', 10000, '2023-05-29 10:27:23');
INSERT INTO `sys_dict_data` VALUES (52, 19, '安全投诉', '3', '', '安全投诉', 0, 0, 10000, '2023-05-29 10:27:34', 10000, '2023-05-29 10:27:34');
INSERT INTO `sys_dict_data` VALUES (53, 20, '未支付', '0', 'warning', '未支付', 0, 0, 10000, '2023-05-29 10:47:33', 10000, '2023-05-29 10:47:33');
INSERT INTO `sys_dict_data` VALUES (54, 20, '已支付', '1', 'success', '已支付', 0, 0, 10000, '2023-05-29 10:47:46', 10000, '2023-05-29 10:47:46');
INSERT INTO `sys_dict_data` VALUES (55, 21, '购买车位订单', '0', 'primary', '购买车位订单', 0, 0, 10000, '2023-05-29 10:49:01', 10000, '2023-05-29 10:49:01');
INSERT INTO `sys_dict_data` VALUES (56, 21, '租赁车位订单', '1', 'primary', '租赁车位订单', 0, 0, 10000, '2023-05-29 10:49:12', 10000, '2023-05-29 10:49:12');
INSERT INTO `sys_dict_data` VALUES (57, 21, '停车订单', '2', 'primary', '停车订单', 0, 0, 10000, '2023-05-29 10:49:24', 10000, '2023-05-29 10:49:24');
INSERT INTO `sys_dict_data` VALUES (58, 21, '水费', '3', 'primary', '水费', 0, 0, 10000, '2023-05-29 10:49:37', 10000, '2023-05-29 10:49:37');
INSERT INTO `sys_dict_data` VALUES (59, 21, '电费', '4', 'primary', '电费', 0, 0, 10000, '2023-05-29 10:49:47', 10000, '2023-05-29 10:49:47');
INSERT INTO `sys_dict_data` VALUES (60, 21, '物业费', '5', 'primary', '物业费', 0, 0, 10000, '2023-05-29 10:49:57', 10000, '2023-05-29 10:49:57');
INSERT INTO `sys_dict_data` VALUES (61, 22, '未开始', '0', 'primary', '未开始', 0, 0, 10000, '2023-05-29 12:32:35', 10000, '2023-05-29 12:32:35');
INSERT INTO `sys_dict_data` VALUES (62, 22, '已开始', '1', 'success', '已开始', 0, 0, 10000, '2023-05-29 12:32:54', 10000, '2023-05-29 12:32:54');
INSERT INTO `sys_dict_data` VALUES (63, 23, '业主', '0', 'primary', '', 0, 0, 10000, '2023-05-29 22:18:59', 10000, '2023-05-29 22:18:59');
INSERT INTO `sys_dict_data` VALUES (64, 23, '家属', '1', 'primary', '', 0, 0, 10000, '2023-05-29 22:19:12', 10000, '2023-05-29 22:19:12');
INSERT INTO `sys_dict_data` VALUES (65, 23, '租户', '2', 'primary', '', 0, 0, 10000, '2023-05-29 22:19:19', 10000, '2023-05-29 22:19:19');
INSERT INTO `sys_dict_data` VALUES (66, 24, '未审核', '0', 'info', '', 0, 0, 10000, '2023-05-29 22:33:17', 10000, '2023-05-29 22:33:17');
INSERT INTO `sys_dict_data` VALUES (67, 24, '已通过', '1', 'success', '', 0, 0, 10000, '2023-05-29 22:33:26', 10000, '2023-05-29 22:33:26');
INSERT INTO `sys_dict_data` VALUES (68, 24, '未通过', '2', 'danger', '', 0, 0, 10000, '2023-05-29 22:33:36', 10000, '2023-05-29 22:33:36');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `dict_source` tinyint NULL DEFAULT 0 COMMENT '来源  0：字典数据  1：动态SQL',
  `dict_sql` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动态SQL',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识  0：正常   1：已删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, 'post_status', '状态', 0, NULL, '岗位管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (2, 'user_gender', '性别', 0, NULL, '用户管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (3, 'user_status', '状态', 0, NULL, '用户管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (4, 'role_data_scope', '数据范围', 0, NULL, '角色管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (5, 'enable_disable', '状态', 0, NULL, '功能状态：启用 | 禁用 ', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (6, 'success_fail', '状态', 0, NULL, '操作状态：成功 | 失败', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (7, 'login_operation', '操作信息', 0, NULL, '登录管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (8, 'params_type', '系统参数', 0, NULL, '参数管理', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (9, 'user_super_admin', '用户是否是超管', 0, NULL, '用户是否是超管', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (10, 'sms_platform', '平台类型', 0, NULL, '短信管理', 0, 0, 10000, '2023-05-13 19:46:21', 10000, '2023-05-13 19:46:21');
INSERT INTO `sys_dict_type` VALUES (11, 'schedule_group', '任务组名', 0, NULL, '定时任务', 0, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_type` VALUES (12, 'schedule_status', '状态', 0, NULL, '定时任务', 0, 0, 10000, '2023-05-13 19:46:37', 10000, '2023-05-13 19:46:37');
INSERT INTO `sys_dict_type` VALUES (13, 'online_status', '在线状态', 0, NULL, '在线状态', 0, 0, 10000, '2023-05-26 09:34:32', 10000, '2023-05-26 09:34:40');
INSERT INTO `sys_dict_type` VALUES (14, 'notice_type', '通知类型', 0, '', '通知类型', 0, 0, 10000, '2023-05-26 11:29:40', 10000, '2023-05-26 11:29:40');
INSERT INTO `sys_dict_type` VALUES (15, 'review_status', '审核状态', 0, '', '审核状态', 0, 0, 10000, '2023-05-26 11:35:31', 10000, '2023-05-26 11:35:31');
INSERT INTO `sys_dict_type` VALUES (16, 'hand_status', '处理状态', 0, '', '处理状态', 0, 0, 10000, '2023-05-27 15:41:12', 10000, '2023-05-27 15:41:12');
INSERT INTO `sys_dict_type` VALUES (17, 'repair_type', '报修类别', 0, '', '报修类别', 0, 0, 10000, '2023-05-27 15:46:52', 10000, '2023-05-27 15:46:52');
INSERT INTO `sys_dict_type` VALUES (18, 'activity_delete', '活动是否删除', 0, '', '活动是否删除', 0, 0, 10000, '2023-05-29 09:11:42', 10000, '2023-05-29 09:11:42');
INSERT INTO `sys_dict_type` VALUES (19, 'complaint_type', '投诉类型', 0, '', '投诉类型', 0, 0, 10000, '2023-05-29 10:26:14', 10000, '2023-05-29 10:26:14');
INSERT INTO `sys_dict_type` VALUES (20, 'payment_status', '订单缴费状态', 0, '', '订单缴费状态', 0, 0, 10000, '2023-05-29 10:46:51', 10000, '2023-05-29 10:46:51');
INSERT INTO `sys_dict_type` VALUES (21, 'order_type', '订单类型', 0, '', '订单类型', 0, 0, 10000, '2023-05-29 10:46:51', 10000, '2023-05-29 10:46:51');
INSERT INTO `sys_dict_type` VALUES (22, 'activity_status', '活动状态', 0, '', '活动状态', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_type` VALUES (23, 'owner_identity', '类型', 0, '', '业主管理', 0, 0, 10000, '2023-05-29 22:18:08', 10000, '2023-05-29 22:18:08');
INSERT INTO `sys_dict_type` VALUES (24, 'owner_state', '状态', 0, '', '业主管理', 0, 0, 10000, '2023-05-29 22:31:29', 10000, '2023-05-29 22:31:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` bigint NULL DEFAULT NULL COMMENT '上级ID',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限URL',
  `authority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '授权标识',
  `type` tinyint NULL DEFAULT NULL COMMENT '权限类型（0:菜单   1:按钮   2:接口）;类型   0：菜单   1：按钮   2：接口',
  `open_style` tinyint NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '图标',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT 10000 COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 10000 COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统设置', '', '', 0, 0, 'icon-setting', 1, 0, 10000, '2023-05-23 14:19:50', 10000, '2023-05-23 14:19:56');
INSERT INTO `sys_menu` VALUES (2, 1, '菜单管理', 'sys/menu/index', '', 0, 0, 'icon-menu', 0, 0, 10000, '2023-05-23 14:26:08', 10000, '2023-05-23 14:26:13');
INSERT INTO `sys_menu` VALUES (3, 2, '查看', '', 'sys:menu:list', 1, 0, '', 0, 0, 10000, '2023-05-23 14:30:14', 10000, '2023-05-23 14:30:18');
INSERT INTO `sys_menu` VALUES (4, 2, '新增', '', 'sys:menu:save', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (5, 2, '修改', '', 'sys:menu:update,sys:menu:info', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (6, 2, '删除', '', 'sys:menu:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (7, 1, '数据字典', 'sys/dict/type', '', 0, 0, 'icon-insertrowabove', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (8, 7, '查询', '', 'sys:dict:page', 1, 0, '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (9, 7, '新增', '', 'sys:dict:save', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (10, 7, '修改', '', 'sys:dict:update,sys:dict:info', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (11, 7, '删除', '', 'sys:dict:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (12, 0, '权限管理', '', '', 0, 0, 'icon-safetycertificate', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (13, 12, '岗位管理', 'sys/post/index', '', 0, 0, 'icon-solution', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (14, 13, '查询', '', 'sys:post:page,sys:post:list', 1, 0, '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-29 15:40:40');
INSERT INTO `sys_menu` VALUES (15, 13, '新增', '', 'sys:post:save', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (16, 13, '修改', '', 'sys:post:update,sys:post:info', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (17, 13, '删除', '', 'sys:post:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (18, 12, '部门管理', 'sys/org/index', '', 0, 0, 'icon-cluster', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (19, 18, '查询', '', 'sys:org:list', 1, 0, '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (20, 18, '新增', '', 'sys:org:save', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (21, 18, '修改', '', 'sys:org:update,sys:org:info', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (22, 18, '删除', '', 'sys:org:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (23, 12, '角色管理', 'sys/role/index', '', 0, 0, 'icon-team', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (24, 23, '查询', '', 'sys:role:page', 1, 0, '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (25, 23, '新增', '', 'sys:role:save,sys:role:menu,sys:org:list', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (26, 23, '修改', '', 'sys:role:update,sys:role:info,sys:role:menu,sys:org:list,sys:user:page', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (27, 23, '删除', '', 'sys:role:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (28, 12, '用户管理', 'sys/user/index', '', 0, 0, 'icon-user', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (29, 28, '查询', '', 'sys:user:page', 1, 0, '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (30, 28, '新增', '', 'sys:user:save,sys:role:list', 1, 0, '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (31, 28, '修改', '', 'sys:user:update,sys:user:info,sys:role:list', 1, 0, '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (32, 28, '删除', '', 'sys:user:delete', 1, 0, '', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (34, 0, '日志管理', '', '', 0, 0, 'icon-filedone', 3, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (35, 34, '登录日志', 'sys/log/login/index', 'sys:log:login', 0, 0, 'icon-solution', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-30 08:56:54');
INSERT INTO `sys_menu` VALUES (36, 35, '导入', '', 'sys:user:import', 1, 0, '', 5, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (37, 35, '导出', '', 'sys:user:export', 1, 0, '', 6, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (38, 1, '接口文档', '{{apiUrl}}/doc.html', '', 0, 1, 'icon-file-text-fill', 10, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_menu` VALUES (67, 34, '角色操作日志', 'sys/role/log/index', 'sys:role:log', 0, 0, '', 1, 0, 10000, '2023-05-23 14:45:54', 10000, '2023-05-29 14:05:14');
INSERT INTO `sys_menu` VALUES (68, 67, '导入', '', 'sys:log:import', 1, 0, '', 2, 0, 10000, '2023-05-23 14:47:27', 10000, '2023-05-29 14:59:42');
INSERT INTO `sys_menu` VALUES (69, 67, '导出', '', 'sys:log:export', 1, 0, '', 1, 0, 10000, '2023-05-23 14:48:10', 10000, '2023-05-29 14:59:47');
INSERT INTO `sys_menu` VALUES (70, 0, '测试', 'test/test', '', 0, 0, 'ComeraFilled', 10, 1, 10000, '2023-05-24 08:52:20', 10000, '2023-05-24 09:06:54');
INSERT INTO `sys_menu` VALUES (71, 70, 'test', 'images/test', '', 0, 0, 'ComeraFilled', 9, 1, 10000, '2023-05-24 08:52:48', 10000, '2023-05-24 09:02:36');
INSERT INTO `sys_menu` VALUES (74, 0, '社区管理', '', '', 0, 0, 'icon-home', 4, 0, 10000, '2023-05-24 12:41:49', 10000, '2023-05-25 17:00:57');
INSERT INTO `sys_menu` VALUES (75, 74, '测试子菜单', 'test/test1', '', 0, 0, 'icon-solution', 0, 1, 10000, '2023-05-24 12:53:07', 10000, '2023-05-25 05:31:44');
INSERT INTO `sys_menu` VALUES (76, 75, '新增', '', 'sys:test:save', 1, 0, '', 0, 1, 10000, '2023-05-24 12:57:13', 10000, '2023-05-25 05:31:43');
INSERT INTO `sys_menu` VALUES (77, 0, '安防管理', '', '', 0, 0, 'icon-insurance', 12, 0, 10000, '2023-05-25 13:12:44', 10000, '2023-05-25 06:30:31');
INSERT INTO `sys_menu` VALUES (78, 77, '巡检项目', 'safe/inspection/index', '', 0, 0, 'ComeraFilled', 2, 0, 10000, '2023-05-25 13:15:08', 10000, '2023-05-25 13:15:12');
INSERT INTO `sys_menu` VALUES (79, 78, '查询', '', 'sys:safe:inspectionitem:page', 1, 0, '', 1, 0, 10000, '2023-05-25 13:17:45', 10000, '2023-05-25 13:17:49');
INSERT INTO `sys_menu` VALUES (80, 74, '小区管理', 'community/community/index', '', 0, 0, 'icon-home', 0, 0, 10000, '2023-05-25 13:17:27', 10000, '2023-05-25 13:17:35');
INSERT INTO `sys_menu` VALUES (81, 74, '楼宇管理', 'community/building/index', '', 0, 0, 'icon-home', 1, 0, 10000, '2023-05-25 13:20:27', 10000, '2023-05-25 13:20:32');
INSERT INTO `sys_menu` VALUES (82, 74, '房屋管理', 'community/house/index', '', 0, 0, 'icon-home', 2, 0, 10000, '2023-05-25 13:22:04', 10000, '2023-05-25 13:22:06');
INSERT INTO `sys_menu` VALUES (83, 0, '智慧物联', '', '', 0, 0, 'icon-cloud-server', 5, 0, 10000, '2023-05-25 05:26:42', 10000, '2023-05-25 05:45:01');
INSERT INTO `sys_menu` VALUES (84, 83, '硬件分类管理', 'smart/device/type', '', 0, 0, 'icon-database', 0, 0, 10000, '2023-05-25 05:30:29', 10000, '2023-05-25 05:31:00');
INSERT INTO `sys_menu` VALUES (85, 84, '新增', '', 'sys:deviceType:save', 1, 0, '', 0, 0, 10000, '2023-05-25 13:17:27', 10000, '2023-05-25 05:32:10');
INSERT INTO `sys_menu` VALUES (86, 74, '商铺管理', 'community/mall/index', '', 0, 0, 'icon-home', 3, 0, 10000, '2023-05-25 13:37:22', 10000, '2023-05-25 13:37:27');
INSERT INTO `sys_menu` VALUES (87, 80, '查看', NULL, 'sys:community:page', 1, 0, '', 0, 0, 10000, '2023-05-25 13:44:58', 10000, '2023-05-25 13:45:03');
INSERT INTO `sys_menu` VALUES (88, 84, '查询', '', 'sys:deviceType:page', 1, 0, '', 0, 0, 10000, '2023-05-25 05:44:53', 10000, '2023-05-25 05:44:53');
INSERT INTO `sys_menu` VALUES (89, 80, '新增', NULL, 'sys:community:save', 1, 0, '', 1, 0, 10000, '2023-05-25 13:45:52', 10000, '2023-05-25 13:45:57');
INSERT INTO `sys_menu` VALUES (90, 80, '修改', NULL, 'sys:community:update', 1, 0, '', 2, 0, 10000, '2023-05-25 13:46:47', 10000, '2023-05-25 13:46:52');
INSERT INTO `sys_menu` VALUES (91, 80, '删除', NULL, 'sys:community:delete', 1, 0, '', 3, 0, 10000, '2023-05-25 13:47:36', 10000, '2023-05-25 13:47:40');
INSERT INTO `sys_menu` VALUES (92, 12, '操作日志管理', 'sys/role/log', '', 0, 0, '', 0, 1, 10000, '2023-05-25 14:27:31', 10000, '2023-05-25 16:58:27');
INSERT INTO `sys_menu` VALUES (93, 92, '查询', '', 'system:log:page', 1, 0, '', 0, 1, 10000, '2023-05-25 14:28:19', 10000, '2023-05-25 16:58:25');
INSERT INTO `sys_menu` VALUES (94, 84, '修改', '', 'sys:deviceType:update', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:31:03');
INSERT INTO `sys_menu` VALUES (95, 84, '删除', '', 'sys:deviceType:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:19', 10000, '2023-05-25 06:31:19');
INSERT INTO `sys_menu` VALUES (96, 84, '详情', '', 'sys:deviceType:info', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (97, 77, '巡更点管理', 'safe/point/index', '', 0, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (99, 97, '查看', '', 'safe:point:page', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 16:51:59');
INSERT INTO `sys_menu` VALUES (100, 97, '详情', '', 'safe:point:info', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (101, 97, '新增', '', 'safe:point:save', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (102, 97, '修改', NULL, 'safe:point:update', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (103, 97, '删除', '', 'safe:point:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 06:32:11');
INSERT INTO `sys_menu` VALUES (105, 83, '设备管理', 'smart/device/index', '', 0, 0, 'icon-deploymentunit', 1, 0, 10000, '2023-05-25 07:10:13', 10000, '2023-05-25 07:10:38');
INSERT INTO `sys_menu` VALUES (106, 105, '新增', '', 'smart:device:save', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 07:11:44');
INSERT INTO `sys_menu` VALUES (107, 105, '查询', '', 'smart:device:page', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 07:12:04');
INSERT INTO `sys_menu` VALUES (108, 105, '修改', '', 'smart:device:update', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 07:12:24');
INSERT INTO `sys_menu` VALUES (109, 105, '删除', '', 'smart:device:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 07:12:41');
INSERT INTO `sys_menu` VALUES (110, 105, '详情', '', 'smart:device:info', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 07:12:57');
INSERT INTO `sys_menu` VALUES (111, 78, '修改', NULL, 'sys:safe:inspectionitem:update', 1, 0, '', 0, 0, 10000, '2023-05-25 16:35:49', 10000, '2023-05-25 16:35:52');
INSERT INTO `sys_menu` VALUES (112, 78, '添加', NULL, 'sys:safe:inspectionitem:add', 1, 0, '', 0, 0, 10000, '2023-05-25 16:36:37', 10000, '2023-05-25 16:36:40');
INSERT INTO `sys_menu` VALUES (113, 78, '删除', NULL, 'sys:safe:inspectionitem:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 16:37:19', 10000, '2023-05-25 16:37:23');
INSERT INTO `sys_menu` VALUES (114, 77, '巡更计划', 'safe/plan/index', '', 0, 0, 'icon-solution', 5, 0, 10000, '2023-05-25 16:40:24', 10000, '2023-05-25 16:40:27');
INSERT INTO `sys_menu` VALUES (115, 114, '查询', '', 'sys:safe:plan:page', 1, 0, '', 0, 0, 10000, '2023-05-25 16:42:14', 10000, '2023-05-25 16:42:22');
INSERT INTO `sys_menu` VALUES (116, 114, '添加', NULL, 'sys:safe:plan:add', 1, 0, '', 0, 0, 10000, '2023-05-25 16:43:26', 10000, '2023-05-25 16:43:30');
INSERT INTO `sys_menu` VALUES (117, 114, '修改', NULL, 'sys:safe:plan:update', 1, 0, '', 0, 0, 10000, '2023-05-25 16:44:04', 10000, '2023-05-25 16:44:08');
INSERT INTO `sys_menu` VALUES (118, 114, '删除', NULL, 'sys:safe:plan:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 16:45:08', 10000, '2023-05-25 16:45:13');
INSERT INTO `sys_menu` VALUES (119, 67, '查询', '', 'system:log:page', 0, 0, '', 0, 1, 10000, '2023-05-25 14:28:19', 10000, '2023-05-25 16:59:35');
INSERT INTO `sys_menu` VALUES (120, 0, '查询', '', 'system:log:page', 1, 0, '', 0, 1, 10000, '2023-05-23 14:47:27', 10000, '2023-05-25 16:59:56');
INSERT INTO `sys_menu` VALUES (121, 67, '查询', '', 'sys:log:page,sys:log:info', 1, 0, '', 0, 0, 10000, '2023-05-23 14:47:27', 10000, '2023-05-29 14:59:36');
INSERT INTO `sys_menu` VALUES (122, 0, '物业管理', '', '', 0, 0, 'icon-solution', 4, 0, 10000, '2023-05-25 17:44:49', NULL, '2023-05-25 17:44:53');
INSERT INTO `sys_menu` VALUES (123, 122, '公告管理', 'property/notice/index', '', 0, 0, 'icon-solution', 1, 0, 10000, '2023-05-25 17:44:49', NULL, '2023-05-25 17:44:53');
INSERT INTO `sys_menu` VALUES (124, 122, '报修管理', 'property/repair/index', '', 0, 0, 'icon-solution', 2, 0, 10000, '2023-05-25 17:44:49', NULL, '2023-05-25 17:44:53');
INSERT INTO `sys_menu` VALUES (125, 122, '投诉管理', 'property/complaint/index', '', 0, 0, 'icon-solution', 3, 0, 10000, '2023-05-25 17:44:49', NULL, '2023-05-25 17:44:53');
INSERT INTO `sys_menu` VALUES (127, 0, '社区圈子', '', '', 0, 0, 'icon-smile-fill', 0, 0, 10000, '2023-05-25 18:39:23', 10000, '2023-05-25 18:39:32');
INSERT INTO `sys_menu` VALUES (128, 80, '详情', NULL, 'sys:community:info', 1, 0, '', 0, 0, 10000, '2023-05-25 19:37:12', 10000, '2023-05-25 19:37:21');
INSERT INTO `sys_menu` VALUES (129, 0, '业主管理', NULL, '', 0, 0, 'icon-user', 2, 0, 10000, '2023-05-25 20:49:11', 10000, '2023-05-25 20:49:17');
INSERT INTO `sys_menu` VALUES (130, 129, '业主管理', 'owner/index', '', 0, 0, 'icon-user', 0, 0, 10000, '2023-05-25 20:53:39', 10000, '2023-05-25 20:53:43');
INSERT INTO `sys_menu` VALUES (131, 123, '查询', NULL, 'property:notice:page', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (132, 123, '修改', NULL, 'property:notice:update', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (133, 123, '删除', NULL, 'property:notice:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (134, 123, '详情', '', 'property:notice:info', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (135, 123, '添加', NULL, 'property:notice:save', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (136, 124, '查询', NULL, 'property:repair:page', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (137, 124, '详情', '', 'property:repair:info', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (138, 124, '添加', NULL, 'property:repair:save', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (139, 124, '修改', NULL, 'property:repair:update', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (140, 124, '删除', NULL, 'property:repair:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (141, 125, '查询', NULL, 'property:complaint:page', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (142, 125, '详情', NULL, 'property:complaint:info', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (143, 125, '添加', NULL, 'property:complaint:save', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (144, 125, '修改', NULL, 'property:complaint:update', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (145, 125, '删除', NULL, 'property:complaint:delete', 1, 0, '', 0, 0, 10000, '2023-05-25 21:18:38', 10000, '2023-05-25 21:18:38');
INSERT INTO `sys_menu` VALUES (147, 81, '查看', NULL, 'sys:building:page', 1, 0, '', 0, 0, 10000, '2023-05-26 09:03:16', 10000, '2023-05-26 09:03:21');
INSERT INTO `sys_menu` VALUES (148, 81, '新增', NULL, 'sys:building:save', 1, 0, '', 0, 0, 10000, '2023-05-26 09:04:19', 10000, '2023-05-26 09:04:24');
INSERT INTO `sys_menu` VALUES (149, 81, '修改', NULL, 'sys:building:update', 1, 0, '', 0, 0, 10000, '2023-05-26 09:05:05', 10000, '2023-05-26 09:05:12');
INSERT INTO `sys_menu` VALUES (150, 81, '删除', NULL, 'sys:building:delete', 1, 0, '', 0, 0, 10000, '2023-05-26 09:05:44', 10000, '2023-05-26 09:05:49');
INSERT INTO `sys_menu` VALUES (151, 81, '详情', NULL, 'sys:building:info', 1, 0, '', 0, 0, 10000, '2023-05-26 09:06:29', 10000, '2023-05-26 09:06:34');
INSERT INTO `sys_menu` VALUES (152, 83, '仪表管理', 'smart/meter/index', '', 0, 0, 'icon-dashboard', 3, 0, 10000, '2023-05-25 18:39:23', 10000, '2023-05-26 09:55:10');
INSERT INTO `sys_menu` VALUES (153, 152, '查询', '', 'sys:meter:page', 1, 0, '', 0, 0, 10000, '2023-05-26 09:57:25', 10000, '2023-05-26 09:58:18');
INSERT INTO `sys_menu` VALUES (154, 152, '详情', '', 'sys:meter:info', 1, 0, '', 0, 0, 10000, '2023-05-26 09:57:48', 10000, '2023-05-26 09:57:48');
INSERT INTO `sys_menu` VALUES (155, 152, '修改', '', 'sys:meter:update', 1, 0, '', 0, 0, 10000, '2023-05-26 09:58:10', 10000, '2023-05-26 09:58:10');
INSERT INTO `sys_menu` VALUES (156, 152, '保存', '', 'sys:meter:save', 1, 0, '', 0, 0, 10000, '2023-05-26 09:57:25', 10000, '2023-05-26 09:58:34');
INSERT INTO `sys_menu` VALUES (157, 152, '删除', '', 'sys:meter:delete', 1, 0, '', 0, 0, 10000, '2023-05-26 09:57:25', 10000, '2023-05-26 09:58:56');
INSERT INTO `sys_menu` VALUES (158, 83, '监控管理', 'smart/monitor/index', '', 0, 0, 'icon-video', 5, 0, 10000, '2023-05-26 11:11:42', 10000, '2023-05-26 11:23:59');
INSERT INTO `sys_menu` VALUES (159, 158, '查询', '', 'sys:monitor:page', 1, 0, '', 0, 0, 10000, '2023-05-26 11:14:27', 10000, '2023-05-26 11:14:27');
INSERT INTO `sys_menu` VALUES (160, 158, '详情', '', 'sys:monitor:info', 1, 0, '', 0, 0, 10000, '2023-05-26 11:14:40', 10000, '2023-05-26 11:14:40');
INSERT INTO `sys_menu` VALUES (161, 158, '新增', '', 'sys:monitor:save', 1, 0, '', 0, 0, 10000, '2023-05-26 11:14:52', 10000, '2023-05-26 11:14:52');
INSERT INTO `sys_menu` VALUES (162, 158, '修改', '', 'sys:monitor:update', 1, 0, '', 0, 0, 10000, '2023-05-26 11:15:07', 10000, '2023-05-26 11:15:07');
INSERT INTO `sys_menu` VALUES (163, 158, '删除', '', 'sys:monitor:delete', 1, 0, '', 0, 0, 10000, '2023-05-26 11:15:21', 10000, '2023-05-26 11:15:21');
INSERT INTO `sys_menu` VALUES (164, 83, '监控分组管理', 'smart/monitor/type', '', 0, 0, 'icon-insertrowleft', 4, 0, 10000, '2023-05-26 11:11:42', 10000, '2023-05-26 11:24:34');
INSERT INTO `sys_menu` VALUES (165, 164, '查询', '', 'sys:monitorType:page', 1, 0, '', 0, 0, 10000, '2023-05-26 11:42:01', 10000, '2023-05-26 11:42:01');
INSERT INTO `sys_menu` VALUES (166, 164, '详情', '', 'sys:monitorType:info', 1, 0, '', 0, 0, 10000, '2023-05-26 11:42:19', 10000, '2023-05-26 11:42:19');
INSERT INTO `sys_menu` VALUES (167, 164, '新增', '', 'sys:monitorType:save', 1, 0, '', 0, 0, 10000, '2023-05-26 11:44:07', 10000, '2023-05-26 11:44:07');
INSERT INTO `sys_menu` VALUES (168, 164, '修改', '', 'sys:monitorType:update', 1, 0, '', 0, 0, 10000, '2023-05-26 11:44:30', 10000, '2023-05-26 16:04:21');
INSERT INTO `sys_menu` VALUES (169, 164, '删除', '', 'sys:monitorType:delete', 1, 0, '', 0, 0, 10000, '2023-05-26 11:45:05', 10000, '2023-05-26 11:45:05');
INSERT INTO `sys_menu` VALUES (171, 127, '活动管理', 'society/activity/index', '', 0, 0, 'icon-team', 0, 0, 10000, '2023-05-26 11:11:42', 10000, '2023-05-26 11:11:42');
INSERT INTO `sys_menu` VALUES (173, 0, '收费管理', NULL, '', 0, 0, 'icon-moneycollect', 0, 0, 10000, '2023-05-26 11:11:42', 10000, '2023-05-26 11:11:42');
INSERT INTO `sys_menu` VALUES (174, 173, '账单管理', 'payment/create/index', '', 0, 0, '', 0, 0, 10000, '2023-05-26 12:19:55', 10000, '2023-05-26 12:20:08');
INSERT INTO `sys_menu` VALUES (175, 173, '费用统计', 'payment/count/index', '', 0, 0, '', 0, 0, 10000, '2023-05-26 12:19:58', 10000, '2023-05-26 12:20:11');
INSERT INTO `sys_menu` VALUES (176, 173, '抄表账单', 'payment/record/index', '', 0, 0, '', 0, 0, 10000, '2023-05-26 12:20:01', 10000, '2023-05-26 12:20:18');
INSERT INTO `sys_menu` VALUES (178, 122, '公告详情', 'property/notice/info', 'x', 0, 0, '', 99, 0, 10000, '2023-05-26 09:06:29', 10000, '2023-05-26 09:06:34');
INSERT INTO `sys_menu` VALUES (179, 127, '添加活动分类', 'society/type/index', '', 0, 0, '', 0, 0, 10000, '2023-06-01 17:59:07', 10000, '2023-05-26 17:59:14');
INSERT INTO `sys_menu` VALUES (181, 77, '巡更路线', 'safe/path/index', '', 0, 0, 'icon-car-fill', 0, 0, 10000, '2023-05-26 18:36:42', 10000, '2023-05-26 18:36:42');
INSERT INTO `sys_menu` VALUES (182, 181, '查看', '', 'safe:path:page', 1, 0, 'icon-read', 0, 0, 10000, '2023-05-26 18:37:54', 10000, '2023-05-26 18:38:28');
INSERT INTO `sys_menu` VALUES (183, 181, '详情信息', '', 'safe:path:info', 1, 0, 'icon-golden-fill', 0, 0, 10000, '2023-05-26 18:37:54', 10000, '2023-05-26 18:41:55');
INSERT INTO `sys_menu` VALUES (184, 181, '新增', NULL, 'safe:path:save', 1, 0, '', 0, 0, 10000, '2023-05-26 18:37:54', 10000, '2023-05-26 18:41:55');
INSERT INTO `sys_menu` VALUES (185, 181, '修改', NULL, 'safe:path:update', 1, 0, '', 0, 0, 10000, '2023-05-26 18:37:54', 10000, '2023-05-26 18:41:55');
INSERT INTO `sys_menu` VALUES (186, 181, '删除', NULL, 'safe:path:delete', 1, 0, '', 0, 0, 10000, '2023-05-26 18:37:54', 10000, '2023-05-26 18:41:55');
INSERT INTO `sys_menu` VALUES (187, 127, '访客邀请', 'society/invitation/index', '', 0, 0, '', 0, 0, 10000, '2023-05-26 23:52:09', 10000, '2023-05-26 23:52:15');
INSERT INTO `sys_menu` VALUES (189, 82, '查看', NULL, 'sys:house:page', 1, 0, '', 0, 0, 10000, '2023-05-27 16:16:29', 10000, '2023-05-27 16:16:33');
INSERT INTO `sys_menu` VALUES (190, 82, '新增', NULL, 'sys:house:save', 1, 0, '', 0, 0, 10000, '2023-05-27 16:17:43', 10000, '2023-05-27 16:17:49');
INSERT INTO `sys_menu` VALUES (191, 82, '修改', NULL, 'sys:house:update', 1, 0, '', 0, 0, 10000, '2023-05-27 16:18:27', 10000, '2023-05-27 16:18:34');
INSERT INTO `sys_menu` VALUES (192, 82, '删除', NULL, 'sys:house:delete', 1, 0, '', 0, 0, 10000, '2023-05-27 16:19:35', 10000, '2023-05-27 16:19:42');
INSERT INTO `sys_menu` VALUES (193, 82, '详情', NULL, 'sys:house:info', 1, 0, '', 0, 0, 10000, '2023-05-27 16:22:08', 10000, '2023-05-27 16:22:15');
INSERT INTO `sys_menu` VALUES (194, 122, '保修详情', 'property/repair/info', '', 0, 0, '', 99, 0, 10000, '2023-05-26 09:06:29', 10000, '2023-05-26 09:06:34');
INSERT INTO `sys_menu` VALUES (195, 82, '导入', NULL, 'sys:house:import', 1, 0, '', 0, 0, 10000, '2023-05-28 14:26:59', 10000, '2023-05-28 14:27:03');
INSERT INTO `sys_menu` VALUES (196, 82, '导出', NULL, 'sys:house:export', 1, 0, '', 0, 0, 10000, '2023-05-28 14:28:25', 10000, '2023-05-28 14:28:29');
INSERT INTO `sys_menu` VALUES (197, 81, '导入', NULL, 'sys:building:import', 1, 0, '', 0, 0, 10000, '2023-05-28 14:30:26', 10000, '2023-05-28 14:30:30');
INSERT INTO `sys_menu` VALUES (198, 81, '导出', NULL, 'sys:building:export', 1, 0, '', 0, 0, 10000, '2023-05-28 14:31:11', 10000, '2023-05-28 14:31:15');
INSERT INTO `sys_menu` VALUES (199, 80, '导入', NULL, 'sys:community:import', 1, 0, '', 0, 0, 10000, '2023-05-28 15:04:38', 10000, '2023-05-28 15:04:43');
INSERT INTO `sys_menu` VALUES (200, 80, '导出', NULL, 'sys:community:export', 1, 0, '', 0, 0, 10000, '2023-05-28 15:05:31', 10000, '2023-05-28 15:05:36');
INSERT INTO `sys_menu` VALUES (201, 86, '导入', NULL, 'sys:mall:import', 1, 0, '', 0, 0, 10000, '2023-05-28 15:06:24', 10000, '2023-05-28 15:06:28');
INSERT INTO `sys_menu` VALUES (202, 86, '导出', NULL, 'sys:mall:export', 1, 0, '', 0, 0, 10000, '2023-05-28 15:07:06', 10000, '2023-05-28 15:07:10');
INSERT INTO `sys_menu` VALUES (203, 86, '查看', NULL, 'sys:mall:page', 1, 0, '', 0, 0, 10000, '2023-05-28 15:08:31', 10000, '2023-05-28 15:08:35');
INSERT INTO `sys_menu` VALUES (204, 86, '新增', NULL, 'sys:mall:save', 1, 0, '', 0, 0, 10000, '2023-05-28 15:09:16', 10000, '2023-05-28 15:09:20');
INSERT INTO `sys_menu` VALUES (205, 86, '修改', NULL, 'sys:mall:update', 1, 0, '', 0, 0, 10000, '2023-05-28 15:09:55', 10000, '2023-05-28 15:09:59');
INSERT INTO `sys_menu` VALUES (206, 86, '删除', NULL, 'sys:mall:delete', 1, 0, '', 0, 0, 10000, '2023-05-28 15:10:40', 10000, '2023-05-28 15:10:44');
INSERT INTO `sys_menu` VALUES (207, 86, '详情', NULL, 'sys:mall:info', 1, 0, '', 0, 0, 10000, '2023-05-28 15:11:22', 10000, '2023-05-28 15:11:26');
INSERT INTO `sys_menu` VALUES (208, 0, '智慧停车', NULL, '', 0, 0, 'icon-location', 5, 0, 10000, '2023-05-28 15:18:43', 10000, '2023-05-28 15:18:49');
INSERT INTO `sys_menu` VALUES (209, 208, '停车场管理', 'park/park/index', '', 0, 0, 'icon-location', 1, 0, 10000, '2023-05-28 15:20:40', 10000, '2023-05-28 15:20:46');
INSERT INTO `sys_menu` VALUES (210, 208, '车位管理', 'park/carport/index', '', 0, 0, 'icon-location', 2, 0, 10000, '2023-05-28 15:22:20', 10000, '2023-05-28 15:22:25');
INSERT INTO `sys_menu` VALUES (211, 208, '车辆管理', 'park/car/index', '', 0, 0, 'icon-location', 3, 0, 10000, '2023-05-28 15:22:57', 10000, '2023-05-28 15:23:03');
INSERT INTO `sys_menu` VALUES (212, 208, '停车记录', 'park/record/index', '', 0, 0, 'icon-location', 4, 0, 10000, '2023-05-28 15:25:18', 10000, '2023-05-28 15:25:21');
INSERT INTO `sys_menu` VALUES (213, 83, '门禁管理', 'smart/door/index', '', 0, 0, 'icon-merge-cells', 6, 0, 10000, '2023-05-29 13:41:25', 10000, '2023-05-29 13:41:25');
INSERT INTO `sys_menu` VALUES (214, 209, '查看', NULL, 'sys:park:page', 1, 0, '', 0, 0, 10000, '2023-05-29 13:52:23', 10000, '2023-05-29 13:52:24');
INSERT INTO `sys_menu` VALUES (215, 209, '查看', NULL, 'sys:park:page', 1, 0, '', 0, 0, 10000, '2023-05-29 13:52:23', 10000, '2023-05-29 13:52:24');
INSERT INTO `sys_menu` VALUES (216, 209, '新增', NULL, 'sys:park:save', 1, 0, '', 0, 0, 10000, '2023-05-29 13:53:01', 10000, '2023-05-29 13:53:02');
INSERT INTO `sys_menu` VALUES (217, 209, '新增', NULL, 'sys:park:save', 1, 0, '', 0, 0, 10000, '2023-05-29 13:53:01', 10000, '2023-05-29 13:53:02');
INSERT INTO `sys_menu` VALUES (218, 209, '修改', NULL, 'sys:park:update', 1, 0, '', 0, 0, 10000, '2023-05-29 13:53:28', 10000, '2023-05-29 13:53:30');
INSERT INTO `sys_menu` VALUES (219, 209, '删除', NULL, 'sys:park:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 13:54:00', 10000, '2023-05-29 13:54:02');
INSERT INTO `sys_menu` VALUES (220, 209, '详情', NULL, 'sys:park:info', 1, 0, '', 0, 0, 10000, '2023-05-29 13:54:28', 10000, '2023-05-29 13:54:30');
INSERT INTO `sys_menu` VALUES (221, 210, '查看', NULL, 'sys:carport:page', 1, 0, '', 0, 0, 10000, '2023-05-29 13:55:03', 10000, '2023-05-29 13:55:04');
INSERT INTO `sys_menu` VALUES (222, 210, '新增', NULL, 'sys:carport:save', 1, 0, '', 0, 0, 10000, '2023-05-29 13:55:31', 10000, '2023-05-29 13:55:33');
INSERT INTO `sys_menu` VALUES (223, 213, '查询', '', 'sys:door:page', 1, 0, '', 0, 0, 10000, '2023-05-29 13:56:04', 10000, '2023-05-29 13:56:04');
INSERT INTO `sys_menu` VALUES (224, 213, '详情', '', 'sys:door:info', 1, 0, '', 0, 0, 10000, '2023-05-29 13:56:28', 10000, '2023-05-29 13:56:28');
INSERT INTO `sys_menu` VALUES (225, 213, '修改', '', 'sys:door:update', 1, 0, '', 0, 0, 10000, '2023-05-29 13:56:48', 10000, '2023-05-29 13:56:48');
INSERT INTO `sys_menu` VALUES (226, 210, '修改', NULL, 'sys:carport:update', 1, 0, '', 0, 0, 10000, '2023-05-29 13:57:14', 10000, '2023-05-29 13:57:16');
INSERT INTO `sys_menu` VALUES (227, 210, '删除', NULL, 'sys:carport:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 13:58:04', 10000, '2023-05-29 13:58:06');
INSERT INTO `sys_menu` VALUES (228, 210, '删除', NULL, 'sys:carport:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 13:58:04', 10000, '2023-05-29 13:58:06');
INSERT INTO `sys_menu` VALUES (229, 210, '详情', NULL, 'sys:carport:info', 1, 0, '', 0, 0, 10000, '2023-05-29 13:58:35', 10000, '2023-05-29 13:58:36');
INSERT INTO `sys_menu` VALUES (230, 212, '查看', NULL, 'sys:record:page', 1, 0, '', 0, 0, 10000, '2023-05-29 13:59:08', 10000, '2023-05-29 13:59:10');
INSERT INTO `sys_menu` VALUES (231, 212, '新增', NULL, 'sys:record:save', 1, 0, '', 0, 0, 10000, '2023-05-29 13:59:43', 10000, '2023-05-29 13:59:45');
INSERT INTO `sys_menu` VALUES (232, 212, '修改', NULL, 'sys:record:update', 1, 0, '', 0, 0, 10000, '2023-05-29 14:00:28', 10000, '2023-05-29 14:00:29');
INSERT INTO `sys_menu` VALUES (233, 213, '新增', '', 'sys:door:save', 1, 0, '', 0, 0, 10000, '2023-05-29 14:01:00', 10000, '2023-05-29 14:01:00');
INSERT INTO `sys_menu` VALUES (234, 212, '删除', NULL, 'sys:record:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 14:00:59', 10000, '2023-05-29 14:01:00');
INSERT INTO `sys_menu` VALUES (235, 213, '删除', '', 'sys:door:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 14:01:25', 10000, '2023-05-29 14:01:25');
INSERT INTO `sys_menu` VALUES (236, 212, '详情', NULL, 'sys:record:info', 1, 0, '', 0, 0, 10000, '2023-05-29 14:01:29', 10000, '2023-05-29 14:01:31');
INSERT INTO `sys_menu` VALUES (237, 122, '投诉详情', 'property/complaint/info', 'x', 0, 0, '', 99, 0, 10000, '2023-05-26 09:06:29', 10000, '2023-05-26 09:06:34');
INSERT INTO `sys_menu` VALUES (238, 67, '修改', '', 'sys:log:save,sys:log:update', 1, 0, '', 3, 0, 10000, '2023-05-29 14:56:31', 10000, '2023-05-29 14:56:31');
INSERT INTO `sys_menu` VALUES (239, 83, '门禁配置', 'smart/door/setting', '', 0, 0, 'icon-file-exception', 7, 0, 10000, '2023-05-29 16:13:05', 10000, '2023-05-29 16:50:12');
INSERT INTO `sys_menu` VALUES (240, 239, '查询', '', 'sys:doorReview:page', 1, 0, '', 0, 1, 10000, '2023-05-29 16:13:29', 10000, '2023-05-29 16:36:21');
INSERT INTO `sys_menu` VALUES (241, 83, '通行记录', 'smart/door/pass-record', '', 0, 0, 'icon-fileprotect', 8, 0, 10000, '2023-05-29 17:14:28', 10000, '2023-05-29 17:14:28');
INSERT INTO `sys_menu` VALUES (242, 83, '业主审核', 'smart/door/review', '', 0, 0, 'icon-solution', 7, 0, 10000, '2023-05-29 17:15:10', 10000, '2023-05-29 17:15:17');
INSERT INTO `sys_menu` VALUES (243, 242, '查询', '', 'smart:review:page', 1, 0, '', 0, 0, 10000, '2023-05-29 19:04:16', 10000, '2023-05-29 19:04:16');
INSERT INTO `sys_menu` VALUES (244, 242, '修改', '', 'smart:review:update', 1, 0, '', 0, 0, 10000, '2023-05-29 19:04:50', 10000, '2023-05-29 19:04:50');
INSERT INTO `sys_menu` VALUES (245, 242, '详情', '', 'smart:review:info', 1, 0, '', 0, 0, 10000, '2023-05-29 19:05:51', 10000, '2023-05-29 19:05:51');
INSERT INTO `sys_menu` VALUES (246, 211, '查看', NULL, 'sys:car:page', 1, 0, '', 0, 0, 10000, '2023-05-29 20:08:09', 10000, '2023-05-29 20:08:11');
INSERT INTO `sys_menu` VALUES (247, 211, '新增', NULL, 'sys:car:save', 1, 0, '', 0, 0, 10000, '2023-05-29 20:08:43', 10000, '2023-05-29 20:08:45');
INSERT INTO `sys_menu` VALUES (248, 211, '修改', NULL, 'sys:car:update', 1, 0, '', 0, 0, 10000, '2023-05-29 20:09:21', 10000, '2023-05-29 20:09:23');
INSERT INTO `sys_menu` VALUES (249, 211, '删除', NULL, 'sys:car:delete', 1, 0, '', 0, 0, 10000, '2023-05-29 20:09:47', 10000, '2023-05-29 20:09:49');
INSERT INTO `sys_menu` VALUES (250, 211, '详情', NULL, 'sys:car:info', 1, 0, '', 0, 0, 10000, '2023-05-29 20:10:18', 10000, '2023-05-29 20:10:20');
INSERT INTO `sys_menu` VALUES (251, 241, '查询', '', 'smart:pass:page', 1, 0, '', 0, 0, 10000, '2023-05-29 20:51:37', 10000, '2023-05-29 20:51:37');
INSERT INTO `sys_menu` VALUES (252, 241, '详情', '', 'smart:pass:info', 1, 0, '', 0, 0, 10000, '2023-05-29 20:51:54', 10000, '2023-05-29 20:51:54');
INSERT INTO `sys_menu` VALUES (253, 129, '业主详情', 'owner/info', '', 0, 0, '', 1, 0, 10000, '2023-05-30 10:55:26', 10000, '2023-05-30 10:55:28');
INSERT INTO `sys_menu` VALUES (254, 97, '巡更记录', 'safe/record/index', '', 1, 0, 'icon-gitee-fill-round', 1, 0, 10000, '2023-05-30 14:09:40', 10000, '2023-05-30 14:09:40');
INSERT INTO `sys_menu` VALUES (256, 254, '查询', NULL, 'safe:point:record:page', 1, 0, '', 0, 0, 10000, '2023-05-25 06:31:03', 10000, '2023-05-25 16:51:59');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `POST_CODE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `POST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `SORT` int NULL DEFAULT NULL COMMENT '排序字段',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '10012', '产品经理2', 1, 1, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:12:18');
INSERT INTO `sys_post` VALUES (2, '1002', '软件测试', 0, 1, 10000, '2023-05-29 15:43:47', 10000, '2023-05-29 15:43:47');
INSERT INTO `sys_post` VALUES (3, '1001', '运维经理', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:33:23');
INSERT INTO `sys_post` VALUES (4, '1002', '产品经理', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:29:48');
INSERT INTO `sys_post` VALUES (5, '1003', '后端开发工程师', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:31:48');
INSERT INTO `sys_post` VALUES (6, '1004', '前端开发工程师', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:31:54');
INSERT INTO `sys_post` VALUES (7, '1005', '数据分析师', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:31:10');
INSERT INTO `sys_post` VALUES (8, '1006', '架构师', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:31:17');
INSERT INTO `sys_post` VALUES (9, '1007', '数据库管理员', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:32:05');
INSERT INTO `sys_post` VALUES (10, '1008', 'UI设计师', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:32:50');
INSERT INTO `sys_post` VALUES (11, '1009', '市场营销经理', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-06-01 10:33:45');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `org_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, 10000, '2023-05-23 14:50:38', 10000, '2023-05-29 20:52:20', '超级管理员', '超级管理员', 0, NULL);
INSERT INTO `sys_role` VALUES (2, 1, 10000, '2023-05-24 08:28:06', 10000, '2023-05-24 09:08:33', '测试角色', '测试角色', NULL, 1);
INSERT INTO `sys_role` VALUES (3, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-29 15:29:00', 'test', 'test', NULL, 3);
INSERT INTO `sys_role` VALUES (4, 1, 10000, '2023-05-26 10:41:44', 10000, '2023-05-26 10:46:53', 'test', 'test', NULL, 3);
INSERT INTO `sys_role` VALUES (5, 0, 10000, '2023-05-26 10:41:44', 10000, '2023-05-31 08:30:54', '保安', '保安', NULL, 1);
INSERT INTO `sys_role` VALUES (6, 0, 10000, '2023-06-01 16:31:43', 10000, '2023-06-01 18:31:43', '业主管理角色', '只可以管业主管理的角色', NULL, 3);

-- ----------------------------
-- Table structure for sys_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_admin`;
CREATE TABLE `sys_role_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `admin_id` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色管理员关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_admin
-- ----------------------------
INSERT INTO `sys_role_admin` VALUES (1, 0, 10000, '2023-05-23 14:50:02', 10000, '2023-05-23 14:50:07', 1, 10000);
INSERT INTO `sys_role_admin` VALUES (4, 0, 10000, '2023-05-24 08:45:50', 10000, '2023-05-24 08:45:50', 5, 10004);
INSERT INTO `sys_role_admin` VALUES (5, 0, 10000, '2023-05-24 08:45:50', 10000, '2023-05-24 08:45:50', 5, 10005);
INSERT INTO `sys_role_admin` VALUES (44, 1, 10000, '2023-06-01 14:30:42', 10000, '2023-06-01 14:30:42', 5, 10007);
INSERT INTO `sys_role_admin` VALUES (45, 1, 10000, '2023-06-01 14:31:26', 10000, '2023-06-01 14:31:26', 5, 10016);
INSERT INTO `sys_role_admin` VALUES (48, 1, 10000, '2023-06-01 15:05:18', 10000, '2023-06-01 15:05:18', 1, 10007);
INSERT INTO `sys_role_admin` VALUES (49, 0, 10000, '2023-06-01 15:09:23', 10000, '2023-06-01 15:09:23', 5, 10015);
INSERT INTO `sys_role_admin` VALUES (50, 1, 10000, '2023-06-01 15:09:29', 10000, '2023-06-01 15:09:29', 1, 10016);
INSERT INTO `sys_role_admin` VALUES (51, 1, 10000, '2023-06-01 15:09:35', 10000, '2023-06-01 15:09:35', 5, 10016);
INSERT INTO `sys_role_admin` VALUES (52, 0, 10000, '2023-06-01 15:09:41', 10000, '2023-06-01 15:09:41', 5, 10007);
INSERT INTO `sys_role_admin` VALUES (53, 0, 10000, '2023-06-01 15:11:22', 10000, '2023-06-01 15:11:22', 1, 10007);
INSERT INTO `sys_role_admin` VALUES (55, 1, 10000, '2023-06-01 15:23:06', 10000, '2023-06-01 15:23:06', 1, 10016);
INSERT INTO `sys_role_admin` VALUES (57, 0, 10000, '2023-06-01 16:32:02', 10000, '2023-06-01 16:32:02', 6, 10016);
INSERT INTO `sys_role_admin` VALUES (58, 0, 10000, '2023-06-01 16:35:14', 10000, '2023-06-01 16:35:14', 6, 10017);
INSERT INTO `sys_role_admin` VALUES (59, 0, 10000, '2023-06-01 16:47:51', 10000, '2023-06-01 16:47:51', 6, 10018);
INSERT INTO `sys_role_admin` VALUES (60, 1, 10000, '2023-06-01 16:50:06', 10000, '2023-06-01 16:50:06', 5, 10019);
INSERT INTO `sys_role_admin` VALUES (61, 1, 10000, '2023-06-01 16:53:59', 10000, '2023-06-01 16:53:59', 6, 10019);
INSERT INTO `sys_role_admin` VALUES (62, 0, 10000, '2023-06-01 17:01:54', 10000, '2023-06-01 17:01:54', 6, 10019);
INSERT INTO `sys_role_admin` VALUES (63, 0, 10000, '2023-06-01 18:50:37', 10000, '2023-06-01 18:50:37', 1, 10004);

-- ----------------------------
-- Table structure for sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_data_scope`;
CREATE TABLE `sys_role_data_scope`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `department_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色数据权限关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '权限ID',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 12, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (2, 1, 28, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (3, 1, 29, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (4, 1, 30, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (5, 1, 31, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (6, 1, 32, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (7, 1, 18, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (8, 1, 19, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (9, 1, 20, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (10, 1, 21, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (11, 1, 22, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (12, 1, 13, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (13, 1, 14, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (14, 1, 15, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (15, 1, 16, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (16, 1, 17, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (17, 1, 23, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (18, 1, 24, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (19, 1, 25, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (20, 1, 26, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (21, 1, 27, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (22, 1, 1, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (23, 1, 2, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (24, 1, 3, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (25, 1, 4, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (26, 1, 5, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (27, 1, 6, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (33, 1, 67, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (35, 1, 68, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (41, 1, 69, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (42, 1, 34, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (43, 1, 35, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (44, 1, 36, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (45, 1, 37, 0, 10000, '2023-05-22 17:33:45', 10000, '2023-05-22 17:33:45');
INSERT INTO `sys_role_menu` VALUES (49, 1, 77, 0, 10000, '2023-05-25 13:20:59', 10000, '2023-05-25 13:21:02');
INSERT INTO `sys_role_menu` VALUES (50, 1, 78, 0, 10000, '2023-05-25 13:21:15', 10000, '2023-05-25 13:21:19');
INSERT INTO `sys_role_menu` VALUES (51, 1, 79, 0, 10000, '2023-05-25 13:21:43', 10000, '2023-05-25 13:21:50');
INSERT INTO `sys_role_menu` VALUES (52, 3, 34, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (53, 3, 35, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (54, 3, 36, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (55, 3, 37, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (56, 3, 67, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (57, 3, 68, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (58, 3, 69, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-25 05:33:28');
INSERT INTO `sys_role_menu` VALUES (59, 1, 74, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (60, 1, 80, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (61, 1, 87, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (62, 1, 89, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (63, 1, 90, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (64, 1, 91, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (65, 1, 81, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (66, 1, 82, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (67, 1, 86, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (68, 1, 83, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (69, 1, 84, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (70, 1, 88, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (71, 1, 85, 0, 10000, '2023-05-25 06:08:19', 10000, '2023-05-25 06:08:19');
INSERT INTO `sys_role_menu` VALUES (72, 1, 94, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (73, 1, 95, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (74, 1, 96, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (75, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_menu` VALUES (76, 1, 99, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (77, 1, 100, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (78, 1, 101, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (79, 1, 102, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (80, 1, 103, 0, 10000, '2023-05-25 06:32:36', 10000, '2023-05-25 06:32:36');
INSERT INTO `sys_role_menu` VALUES (81, 1, 77, 0, 10000, '2023-05-25 16:47:08', 10000, '2023-05-25 16:47:11');
INSERT INTO `sys_role_menu` VALUES (82, 1, 78, 0, 10000, '2023-05-25 16:47:32', 10000, '2023-05-25 16:47:36');
INSERT INTO `sys_role_menu` VALUES (83, 1, 79, 0, 10000, '2023-05-25 16:47:57', 10000, '2023-05-25 16:48:02');
INSERT INTO `sys_role_menu` VALUES (84, 1, 111, 0, 10000, '2023-05-25 16:48:27', 10000, '2023-05-25 16:48:33');
INSERT INTO `sys_role_menu` VALUES (85, 1, 112, 0, 10000, '2023-05-25 16:48:52', 10000, '2023-05-25 16:48:58');
INSERT INTO `sys_role_menu` VALUES (86, 1, 113, 0, 10000, '2023-05-25 16:49:10', 10000, '2023-05-25 16:49:15');
INSERT INTO `sys_role_menu` VALUES (87, 1, 114, 0, 10000, '2023-05-25 16:49:33', 10000, '2023-05-25 16:49:38');
INSERT INTO `sys_role_menu` VALUES (88, 1, 115, 0, 10000, '2023-05-25 16:49:52', 10000, '2023-05-25 16:49:57');
INSERT INTO `sys_role_menu` VALUES (89, 1, 116, 0, 10000, '2023-05-25 16:50:13', 10000, '2023-05-25 16:50:19');
INSERT INTO `sys_role_menu` VALUES (90, 1, 117, 0, 10000, '2023-05-25 16:50:34', 10000, '2023-05-25 16:50:39');
INSERT INTO `sys_role_menu` VALUES (91, 1, 118, 0, 10000, '2023-05-25 16:50:53', 10000, '2023-05-25 16:50:58');
INSERT INTO `sys_role_menu` VALUES (92, 1, 122, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (93, 1, 123, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (94, 1, 131, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (95, 1, 132, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (96, 1, 133, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (97, 1, 134, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (98, 1, 135, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (99, 1, 124, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (100, 1, 136, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (101, 1, 137, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (102, 1, 138, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (103, 1, 139, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (104, 1, 140, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (105, 1, 125, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (106, 1, 141, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (107, 1, 142, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (108, 1, 143, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (109, 1, 144, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (110, 1, 145, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (111, 1, 127, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (112, 1, 7, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (113, 1, 8, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (114, 1, 10, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (115, 1, 9, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (116, 1, 11, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (117, 1, 38, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (118, 1, 129, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (119, 1, 130, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (120, 1, 121, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (121, 1, 128, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (122, 1, 147, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (123, 1, 148, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (124, 1, 149, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (125, 1, 150, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (126, 1, 151, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (127, 1, 105, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (128, 1, 106, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (129, 1, 107, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (130, 1, 108, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (131, 1, 109, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (132, 1, 110, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (133, 1, 152, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (134, 1, 153, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (135, 1, 154, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (136, 1, 155, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (137, 1, 156, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (138, 1, 157, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (139, 1, 97, 0, 10000, '2023-05-26 10:03:51', 10000, '2023-05-26 10:03:51');
INSERT INTO `sys_role_menu` VALUES (140, 1, 158, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (141, 1, 159, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (142, 1, 160, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (143, 1, 161, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (144, 1, 162, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (145, 1, 163, 0, 10000, '2023-05-26 11:15:34', 10000, '2023-05-26 11:15:34');
INSERT INTO `sys_role_menu` VALUES (146, 1, 164, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (147, 1, 165, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (148, 1, 166, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (149, 1, 167, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (150, 1, 168, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (151, 1, 169, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (152, 1, 181, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (153, 1, 182, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (154, 1, 183, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (155, 1, 184, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (156, 1, 185, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (157, 1, 186, 0, 10000, '2023-05-26 11:45:18', 10000, '2023-05-26 11:45:18');
INSERT INTO `sys_role_menu` VALUES (158, 1, 173, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (159, 1, 174, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (160, 1, 175, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (161, 1, 176, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (162, 1, 238, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (163, 1, 199, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (164, 1, 200, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (165, 1, 197, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (166, 1, 198, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (167, 1, 189, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (168, 1, 190, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (169, 1, 191, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (170, 1, 192, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (171, 1, 193, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (172, 1, 195, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (173, 1, 196, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (174, 1, 201, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (175, 1, 202, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (176, 1, 203, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (177, 1, 204, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (178, 1, 205, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (179, 1, 206, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (180, 1, 207, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (181, 1, 178, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (182, 1, 194, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (183, 1, 237, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (184, 1, 213, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (185, 1, 223, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (186, 1, 224, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (187, 1, 225, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (188, 1, 233, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (189, 1, 235, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (190, 1, 239, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (191, 1, 240, 1, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (192, 1, 208, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (193, 1, 209, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (194, 1, 214, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (195, 1, 215, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (196, 1, 216, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (197, 1, 217, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (198, 1, 218, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (199, 1, 219, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (200, 1, 220, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (201, 1, 210, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (202, 1, 221, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (203, 1, 222, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (204, 1, 226, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (205, 1, 227, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (206, 1, 228, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (207, 1, 229, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (208, 1, 211, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (209, 1, 212, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (210, 1, 230, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (211, 1, 231, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (212, 1, 232, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (213, 1, 234, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (214, 1, 236, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49');
INSERT INTO `sys_role_menu` VALUES (215, 1, 242, 0, 10000, '2023-05-29 19:06:17', 10000, '2023-05-29 19:06:17');
INSERT INTO `sys_role_menu` VALUES (216, 1, 243, 0, 10000, '2023-05-29 19:06:17', 10000, '2023-05-29 19:06:17');
INSERT INTO `sys_role_menu` VALUES (217, 1, 244, 0, 10000, '2023-05-29 19:06:17', 10000, '2023-05-29 19:06:17');
INSERT INTO `sys_role_menu` VALUES (218, 1, 245, 0, 10000, '2023-05-29 19:06:17', 10000, '2023-05-29 19:06:17');
INSERT INTO `sys_role_menu` VALUES (219, 1, 241, 0, 10000, '2023-05-29 19:06:17', 10000, '2023-05-29 19:06:17');
INSERT INTO `sys_role_menu` VALUES (220, 1, 251, 0, 10000, '2023-05-29 20:52:20', 10000, '2023-05-29 20:52:20');
INSERT INTO `sys_role_menu` VALUES (221, 1, 252, 0, 10000, '2023-05-29 20:52:20', 10000, '2023-05-29 20:52:20');
INSERT INTO `sys_role_menu` VALUES (222, 1, 254, 0, 10000, '2023-05-29 20:52:20', 10000, '2023-05-29 20:52:20');
INSERT INTO `sys_role_menu` VALUES (223, 1, 256, 0, 10000, '2023-05-29 20:52:20', 10000, '2023-05-29 20:52:20');
INSERT INTO `sys_role_menu` VALUES (224, 5, 129, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (225, 5, 130, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (226, 5, 253, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (227, 5, 34, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (228, 5, 35, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (229, 5, 36, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (230, 5, 37, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (231, 5, 67, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (232, 5, 121, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (233, 5, 69, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (234, 5, 68, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (235, 5, 238, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (236, 5, 74, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (237, 5, 80, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (238, 5, 87, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (239, 5, 128, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (240, 5, 199, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (241, 5, 200, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (242, 5, 89, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (243, 5, 90, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (244, 5, 91, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (245, 5, 81, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (246, 5, 147, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (247, 5, 148, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (248, 5, 149, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (249, 5, 150, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (250, 5, 151, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (251, 5, 197, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (252, 5, 198, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (253, 5, 82, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (254, 5, 189, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (255, 5, 190, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (256, 5, 191, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (257, 5, 192, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (258, 5, 193, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (259, 5, 195, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (260, 5, 196, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (261, 5, 86, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (262, 5, 201, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (263, 5, 202, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (264, 5, 203, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (265, 5, 204, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (266, 5, 205, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (267, 5, 206, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (268, 5, 207, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (269, 5, 77, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (270, 5, 97, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (271, 5, 99, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (272, 5, 100, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (273, 5, 101, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (274, 5, 102, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (275, 5, 103, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (276, 5, 254, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (277, 5, 256, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (278, 5, 181, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (279, 5, 182, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (280, 5, 183, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (281, 5, 184, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (282, 5, 185, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (283, 5, 186, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (284, 5, 78, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (285, 5, 111, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (286, 5, 112, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (287, 5, 113, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (288, 5, 79, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (289, 5, 114, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (290, 5, 115, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (291, 5, 116, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (292, 5, 117, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (293, 5, 118, 0, 10000, '2023-05-31 08:24:44', 10000, '2023-05-31 08:24:44');
INSERT INTO `sys_role_menu` VALUES (294, 5, 12, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (295, 5, 28, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (296, 5, 29, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (297, 5, 30, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (298, 5, 31, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (299, 5, 32, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54');
INSERT INTO `sys_role_menu` VALUES (300, 6, 129, 0, 10000, '2023-06-01 16:31:43', 10000, '2023-06-01 16:31:43');
INSERT INTO `sys_role_menu` VALUES (301, 6, 130, 0, 10000, '2023-06-01 16:31:43', 10000, '2023-06-01 16:31:43');
INSERT INTO `sys_role_menu` VALUES (302, 6, 253, 0, 10000, '2023-06-01 16:31:43', 10000, '2023-06-01 16:31:43');
INSERT INTO `sys_role_menu` VALUES (303, 6, 34, 0, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (304, 6, 67, 1, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (305, 6, 35, 0, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (306, 6, 36, 0, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (307, 6, 37, 0, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (308, 6, 121, 1, 10000, '2023-06-01 18:30:21', 10000, '2023-06-01 18:30:21');
INSERT INTO `sys_role_menu` VALUES (309, 6, 69, 1, 10000, '2023-06-01 18:31:08', 10000, '2023-06-01 18:31:08');
INSERT INTO `sys_role_menu` VALUES (310, 6, 68, 1, 10000, '2023-06-01 18:31:08', 10000, '2023-06-01 18:31:08');
INSERT INTO `sys_role_menu` VALUES (311, 6, 238, 1, 10000, '2023-06-01 18:31:08', 10000, '2023-06-01 18:31:08');

-- ----------------------------
-- Table structure for sys_role_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_operation_log`;
CREATE TABLE `sys_role_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `operate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作（新增、修改 、删除、修改数据权限）',
  `operation_object` bigint NULL DEFAULT NULL COMMENT '操作对象ID',
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_operation_log
-- ----------------------------
INSERT INTO `sys_role_operation_log` VALUES (3, 0, 10000, '2023-05-26 10:41:44', 10000, '2023-05-26 10:41:44', '新增', 4, '测试');
INSERT INTO `sys_role_operation_log` VALUES (4, 0, 10000, '2023-05-26 10:43:01', 10000, '2023-05-26 10:43:01', '修改', 4, NULL);
INSERT INTO `sys_role_operation_log` VALUES (5, 0, 10000, '2023-05-26 10:46:53', 10000, '2023-05-26 10:46:53', '删除', 4, NULL);
INSERT INTO `sys_role_operation_log` VALUES (6, 0, 10000, '2023-05-26 11:02:05', 10000, '2023-05-26 11:02:05', '修改', 3, '');
INSERT INTO `sys_role_operation_log` VALUES (7, 0, 10000, '2023-05-29 15:29:00', 10000, '2023-05-29 15:29:00', '新增', 3, '');
INSERT INTO `sys_role_operation_log` VALUES (8, 0, 10000, '2023-05-29 16:13:49', 10000, '2023-05-29 16:13:49', '修改', 1, '');
INSERT INTO `sys_role_operation_log` VALUES (9, 0, 10000, '2023-05-29 19:06:18', 10000, '2023-05-29 19:06:18', '修改', 1, '');
INSERT INTO `sys_role_operation_log` VALUES (10, 0, 10000, '2023-05-29 20:52:20', 10000, '2023-05-29 20:52:20', '修改', 1, '');
INSERT INTO `sys_role_operation_log` VALUES (11, 0, 10000, '2023-05-31 08:09:22', 10000, '2023-05-31 08:09:22', '更新角色数据权限', 5, '');
INSERT INTO `sys_role_operation_log` VALUES (12, 0, 10000, '2023-05-31 08:24:45', 10000, '2023-05-31 08:24:45', '修改', 5, '');
INSERT INTO `sys_role_operation_log` VALUES (13, 0, 10000, '2023-05-31 08:30:54', 10000, '2023-05-31 08:30:54', '修改', 5, '');
INSERT INTO `sys_role_operation_log` VALUES (14, 0, 10000, '2023-06-01 16:31:43', 10000, '2023-06-01 16:31:43', '新增', 6, '');
INSERT INTO `sys_role_operation_log` VALUES (15, 0, 10000, '2023-06-01 18:30:22', 10000, '2023-06-01 18:30:22', '修改', 6, '');
INSERT INTO `sys_role_operation_log` VALUES (16, 0, 10000, '2023-06-01 18:31:08', 10000, '2023-06-01 18:31:08', '修改', 6, '');
INSERT INTO `sys_role_operation_log` VALUES (17, 0, 10000, '2023-06-01 18:31:43', 10000, '2023-06-01 18:31:43', '修改', 6, '');

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户唯一标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `pay_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付密码',
  `wechat_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态(0:启用 1:禁用)',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识(0:未删除 1:已删除)',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES (1, 1, '17384438260', '{bcrypt}$2a$10$FKr3uO5tPwqhrfTmqMlfLeuEdlB7sGmSVEWBGFIFpxXpHqesZq0CC', '123123', '8087832', 0, 0, 1, '2023-05-24 15:54:20', 1, '2023-05-24 15:54:23');
INSERT INTO `t_account` VALUES (2, 2, '18888888888', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', '', 0, 0, 1, '2023-05-25 21:09:50', 1, '2023-05-25 21:09:53');
INSERT INTO `t_account` VALUES (3, 4, '13838489572', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', NULL, 0, 0, 1, '2023-05-29 20:44:27', 1, '2023-05-29 20:44:30');
INSERT INTO `t_account` VALUES (4, 5, '16666666666', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', NULL, 0, 0, 1, '2023-05-30 09:02:42', 1, '2023-05-30 09:02:45');
INSERT INTO `t_account` VALUES (5, 6, '18962521753', '{bcrypt}$2a$10$Of9x2kIA4FNuLQ0xilMz.uLI2F.kXMf8HL4a5NHl/JCWl8i8YwQFu', '123123', NULL, 0, 0, 6, '2023-05-30 16:53:48', 6, '2023-05-30 16:53:52');

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_id` bigint NOT NULL DEFAULT 1 COMMENT '社区id',
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '物业表的，关联物业公司',
  `sort` int NULL DEFAULT 1 COMMENT '排序',
  `activity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '活动名称',
  `type_id` bigint NOT NULL DEFAULT 0 COMMENT '活动类别',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '活动标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动内容（可为空）',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `viewer_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查看人数',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态  0：正常 1：失效',
  `publish_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `end_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '活动截至时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://picsum.photos/800/600' COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1013 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES (1, 1, '1', 5, '心理健康讲座系列', 1, '“心语花溪”呵护学生心理健康 ', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p3.itc.cn/q_70/images03/20230601/ce871d7ff3d942f9a37ff72d9393dea9.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的沙盘游戏室，学生在玩沙盘游戏。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p8.itc.cn/q_70/images03/20230601/fa20dc48c22c4df58c7c95bcf0ed7b11.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的情绪宣泄室，学生通过涂鸦放松心情。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p5.itc.cn/q_70/images03/20230601/18a6114e3d284aa283ea3c579fdf5bfd.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的情绪宣泄室，学生通过打拳击放松心情。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p4.itc.cn/q_70/images03/20230601/c5eda17fcf8c4f9eb9b5abe595606603.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的音乐放松室，学生在听音乐放松身心。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p4.itc.cn/q_70/images03/20230601/cab148f0e92f4c92a2c341567e38b35e.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心，学生在心理健康辅导老师的带领下通过心理剧场的方式表达内心的想法。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p0.itc.cn/q_70/images03/20230601/fa91fb94e3494a089e122dd5f3dcdb03.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的绘画活动室，心理健康辅导老师给学生上“心理故事绘”课程。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p1.itc.cn/q_70/images03/20230601/ae0f52e2788645c684ae9a21440785a8.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的团体活动室，学生在心理健康辅导老师的带领下做游戏。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		新华社记者 陈泽国 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p7.itc.cn/q_70/images03/20230601/971f0fc4eaa146a691ca2a17df9df36d.jpeg\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月31日，在长沙市岳麓区实验小学“心语花溪”心理成长中心的羊驼园，心理健康辅导老师带着学生和羊驼互动。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		湖南省长沙市岳麓区实验小学是湖南省中小学心理健康教育特色学校，自2013年起，学校“心语花溪”心理成长中心投入使用。该中心共有400余平方米的专业场地，包括情绪宣泄室、个体辅导室、团体活动室、音乐放松室、绘画活动室、羊驼园等。中心还配备专业心理健康辅导老师，通过开展形式多样的心理健康教育活动，开发易传播、可操作性强的教学课程，呵护学生心理健康。\r\n	</p>\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span> \r\n</p>', '雍和门', '312312', '312321', 0, '2023-05-24 22:37:45', '2023-05-24 22:37:45', 1, '2023-05-24 22:37:45', 12313, 213, '2023-05-24 22:37:45', 'https://s1.ax1x.com/2023/05/31/p9xuart.png');
INSERT INTO `t_activity` VALUES (2, 2, '2', 2, '书本推荐', 2, '一本温暖的书——童年里一束温柔的光', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171213.png\" title=\"1.png\" alt=\"1.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	零壹# 再 相 逢\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n假期在家收拾书桌，偶然间看到藏在书堆里的粉色书页，轻抽出这一本《窗边的小豆豆》，打开已经泛黄的书页，那些藏在内心深处的记忆似乎被唤醒，在小豆豆的童年故事中我好像又一次回到童年，看到那个曾无比羡慕小豆豆的自己，  &nbsp;<strong><span style=\"font-family:宋体;color:#BAA995;\">追回童年的那一份</span><span></span></strong>&nbsp; &nbsp;<span>久违的温暖与感动</span>&nbsp; &nbsp;<strong>。</strong>&nbsp;\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171214.png\" title=\"2.png\" alt=\"2.png\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零贰&nbsp;</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">童 年 印 象</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">《窗边的小豆豆》讲述了作者黑柳彻子上小学时的一段真实的故事。作者因淘气被原学校退学后，来到巴学园。在小林校长的爱护和引导下，<strong><span style=\"color:#BAA995;\">让一般人眼里“怪怪”的小豆豆逐渐成了一个大家都能接受的孩子</span></strong>，并奠定了她一生的基础。这是我童年记忆中很重要的一本书，那所名为“巴学园”的学校是我童年时期无比盼望的“伊甸园”。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171215.png\" title=\"3.png\" alt=\"3.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">小豆豆是那样与众不同的一个小孩，她对世界真诚又好奇，可能不会表达，甚至不受人喜欢，所以在一年级就被原学校退学。但她幸运地走进了巴学园，电车改成的教室，可以根据个人喜好随意安排的座位和科目学习顺序，午后的散步郊游，别具特色的韵律操，<strong><span style=\"color:#BAA995;\">这所学校给了小豆豆最自由的教育和最温暖的鼓励。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">校长小林宗作先生是“小豆豆第一个真正喜欢的人”，他愿意倾听一个孩子长达4个小时的倾诉，而<strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">无论是之前，还是这以后，再也没有一个大人这么认真地听小豆豆说话了。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">生命中有这样一位慈爱关怀又深谙教育方式方法的校长，让小豆豆的成长更加顺利和欢乐，也给我的童年留下数不尽的幻想和期待：<span style=\"color:#3E3E3E;\">我也无比希望自己能进入这样一所自由的学校，拥有像父亲一样爱我的校长，在每一次相遇后都有人严肃而认真地告诉我：</span><strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">你真是一个好孩子。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零叁</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">被 唤 醒 的 记 忆</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在和朋友谈起与小豆豆的“再相逢”后，更多尘封的记忆被唤醒。小豆豆是我们童年共同的朋友，这份友谊来自于当时小学创立的图书角。为了让不甚熟悉的小朋友们尽快融入班级，老师建立图书角，每个人都可以分享自己最喜欢的一本书到“图书角”，而“小豆豆”就是由我分享的、图书角里最为“风靡”的一本书。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171216.jpg\" title=\"4.jpg\" alt=\"4.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在早早放学的午后，总会有一群孩子聚集在教室，有模有样地讨论着小豆豆的故事，话题广泛，从由两棵树构成的校门，到“山的味道，海的味道”的盒饭，从专为残疾的小伙伴举行的运动会到挚友泰明的离去和死亡；从欢乐的野炊到令人感动的士兵慰问……</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">孩子们的友谊建立得总是如此之快，对小豆豆</span><span style=\"font-family:宋体;\">共同的喜爱和好奇足以让一群陌生的孩子成为亲密的朋友。</span><strong><span style=\"color:#BAA995;\">小豆豆成为我们之间的情感媒介，情感的共鸣在不知不觉中促成了许多份友谊的生成。</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171217.png\" title=\"5.png\" alt=\"5.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"></span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在我的记忆里，小豆豆不仅是一本温暖的书，更像是一位陪伴我童年的朋友，每每回忆起和朋友们一起在图书角讨论小豆豆的日子，我总会无比感慨，“小豆豆”的存在，<strong><span style=\"color:#BAA995;\">不仅温暖了我的童年，还链接了许多份来之不易的友情。</span></strong>现在想来，这或许就是这本书真正温暖的力量所在。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零肆</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">做 一 个 摘 星 星 的 人</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">曾听过这样一段话：<strong><span style=\"color:#BAA995;\">随着时间流逝，记忆会逐渐模糊，你可能会逐渐淡忘和一个人相处的细节，忘记他说过的话，忘记他做过的事情，但却不会忘记和他相处的感觉。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">初读《小豆豆》的印象已经在我脑海中渐渐模糊，小豆豆曾经的生活环境，宠物等等生活的细节我已经很难回忆，但是那一份希冀和期望却一直留在我的内心。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171218.jpg\" title=\"6.jpg\" alt=\"6.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">小豆豆给同处幼年的我的内心种下一颗希望的种子，它告诉我<strong><span style=\"color:#BAA995;\">无论谁都有自己的优点和价值，每一种努力和热爱都值得被肯定，每一份真诚和热情都值得被接纳。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在很多次受挫或者不被肯定的时候，我总希望我的身边也能有一位小林先生，他会轻拍着我的肩膀，严肃又郑重地告诉我：<strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">你真的是一个好孩子。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171219.jpg\" title=\"7.jpg\" alt=\"7.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">推荐《窗边的小豆豆》给大家，不仅因为它是我童年的记忆和美好的寄托，也<strong><span style=\"color:#BAA995;\">希望和祝愿大家能永远对自己保持信心，坚定地相信“我真的是一个好孩子啊”。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">希望我们都能像小豆豆一样，做一个独特的自己。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">生活总是会有无数的悲伤，但也有独属于我们的感动。在无限的时间和空间里，我们都是无比渺小的一份子，我们可能常常失望迷茫，在或许哪一个感觉自己好像被全世界抛弃的夜晚，<strong><span style=\"color:#BAA995;\">也许童年的这一份小小的温暖能化作荧光点点，照亮我们前行的路途。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">希望我们都能珍藏内心的那份感动，像小豆豆一样充满信心和勇气，<strong><span style=\"color:#BAA995;\">永远奔走在自己的热爱里，成为自己想要成为的人，在属于我们的“巴学园”恣意成长，收获美好。</span></strong></span>\r\n</p>', '秋名山', '312', '123123', 0, '2023-05-24 22:38:05', '2023-05-24 22:38:05', 1, '2023-05-24 22:38:05', 3123, 3213, '2023-05-24 22:38:05', 'https://s1.ax1x.com/2023/05/31/p9xu0Vf.png');
INSERT INTO `t_activity` VALUES (3, 3, '1', 3, '就业指导', 3, '不出校，找到“好婆家”！', '<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:center;font-family:Calibri;text-indent:40px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:30px;font-size:20px;\">高校就业创业类社团建设与大学生就业研究</span></strong>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:center;font-family:Calibri;text-indent:32px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:24px;color:#333333;font-size:16px;\">沈妍</span></strong>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">摘要：</span></strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">现阶段，伴随着我国社会经济和教育水准的持续提升，高校大学毕业生总数一直增长，但现阶段市场就业比较有限，造成高校大学毕业生就业压力越来越大，就业创业类社团在大学生就业中起着关键功效。本文从高校就业创业类社团建设的现况考虑，讨论了高校就业创业类社团建设与大学生就业关系，以得出相应参考建议。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">关键词：高校；就业创业类社团；大学生就业</span></strong>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">引言：</span></strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">随着高等教育的不断发展，大学入学人数正在逐步扩大，毕业生总数也逐渐增加，导致大学毕业生的就业压力是巨大的，即使社会对高级人才的需求量增多，但大学毕业生的综合素质往往无法满足如今的就业需求，进一步加剧了就业压力，为了更好地使大学生合理地处理就业压力，高等学院建立了就业创业类社团来承担这项关键任务。</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"><span>［</span>1］</span></span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"https://univs-news-1256833609.cos.ap-beijing.myqcloud.com/123/upload/resources/image/7541738.jpeg\" style=\"height:auto !important;\" />\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"https://univs-news-1256833609.cos.ap-beijing.myqcloud.com/123/upload/resources/image/7541737.jpeg\" style=\"height:auto !important;\" />\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"></span></span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;font-size:16px;\">一．</span><strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">高校就业创业类社团建设现状</span></strong>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">（一）</span><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">社团管理制度不健全</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">现阶段，高校社区设定丰富，但社区管理体系不完善，规章制度不完善，一部分学校在就业创业类社团建设层面缺乏实践经验，使就业和自主创业社团不能真真正正为学生服务。因为社团没有整合好人才培养方案的计划，导致自主创业就业社团的管理制度存在一些疏忽，缺乏高度的组织性和纪律性，再加上社团的活动通常流于形式，这些问题不利于高校就业创业类社团为大学生进行就业就业指导工作，也不能真真正正为减轻学生就业压力作出应该有的奉献。</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"><span>［</span></span></span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\">2</span></span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"><span>］</span></span></span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">&nbsp;<span>（二）老师专业水准有待提高</span></span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">高校中很多自主创业社团没有配置专业的老师，大部分由其他课程内容的老师或行政部门老师担任。就业自主创业老师自身缺乏科学理论的培养和培训，社团日常活动的具体指导缺乏专业性，这在一定水平上阻拦了就业创业类社团能够更好地为学生服务。因为老师不仅有教学任务又有行政部门的工作，老师的时长和活力无法充分投入到社区活动中。当学生碰到问题时，他们常常遭遇没有人能问、没有人能问的局势。此外，因为没有观察员监管和评定社团的工作，高校辅导员忽略了学生就业工作的重要性。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">（三）社团活动经费不足</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\"><span>因为学校自身缺乏资产支持，有关部门对大学生就业自主创业缺乏重视，高校就业创业类社团无法得到充足的资产支持，一些就业自主创业活动无法进行，组员只逗留在理论学习方面，无法通过实践活动真真正正提升自己的就业能力。假如要长期性进行就业和自主创业实践活动，有关部门需要为就业创业类社团给予资产支持，为实践活动的进行给予物质保障，提升对大学生自主创业就业的正确引导和培训，减轻大学生就业压力，很多就业创业类社团的资产主要来源于</span>v会员捐助、社团联合会赠费和第三方企业冠名赞助。资产的数目和来源于都十分比较有限，无法满足当前的就业自主创业活动的资产需求，无法支持社区的日常运转。</span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"><span>［</span></span></span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\">3</span></span><span style=\"font-size:12px;line-height:0;vertical-align:baseline;\"><span style=\"font-family:宋体;line-height:24px;font-size:16px;vertical-align:super;\"><span>］</span></span></span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-weight:bold;font-size:16px;\">二、</span><strong><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">高校社团应对大学生就业的有效策略</span></strong>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">（一）</span><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">健全管理制度，开展就业工作</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">高等院校要提升就业指导中心建设方案，整理好大学生就业自主创业管理制度、战略方针，保证就业自主创业发展规律正常，并依照规章制度发展更多的就业和自主创业社团，保护有关社团的权益，推动有关活动的进行。通过健全管理体系，为大学生给予就业自主创业层面的帮助，如话题讨论、仿真模拟训练、就业就业指导等，并给予关键的就业自主创业状况的全新信息。通过进行就业自主创业仿真模拟实践活动，为学生给予真实的就业自主创业演习，使学生能够在相对安全的仿真模拟环境中累积就业经验，并为将来可能发生的风险性问题做好防护措施，高等院校可依据不同系院的具体情况进行就业创业活动，通过多种多样形式的就业自主实践活动，帮助大学生明确恰当的岗位理念，得到就业整体规划的具体指导，激起学生的自主创业精神，进而满足当今社会的就业需求，缓解大学就业压力。高等院校要严苛把握就业创业类社团的关键影响力，推动高等院校就业工作能在未来顺利开展。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\"><span>例如大学生只有深层次感受社会实践的重要性，才可以能够更好地消化吸收法律制度、社会道德规范和价值观，只有通过实践训练，才可以高效地提升学生的实践能力、组织管理能力、社交能力、表达能力、分析问题和处理问题的能力。学校应组织创建大量的就业实践服务社团，进行就业、勤工俭学、志愿填报服务、社区扶持、暑假社会实践等社区活动，以此提升大学生的综合性素质，提高大学生的就业能力。通过提早了解岗位信息，可以提升社区组员的就业竞争力。社团要坚持激励创新的指导方针</span>,采用科学正确引导,规范管理。在社团社会化的过程中，社团组员应了解行为规则、价值趋向和运营模式的目的，在逐渐具有实现以上的条件的同时，应主动用社会行为规则、价值观和运营模式正确引导和管束自己的就业行为。将高新活动与信息工作更为密切地融合起来，为学生创新自主创业构建有效的沟通方式。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">（二）</span><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">加强指导教师队伍建设，提供就业指导</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">高等院校应充分重视高校辅导员的专业培训，提升其专业知识和具体指导能力，培养对学生就业自主创业的关心和责任感。此外，高等院校还应不断完善高校辅导员的监管点评体制，最大限度地充分发挥高校辅导员的工作效率，激起高校辅导员的工作积极性，能够更好地为大学生就业自主创业给予具体指导。通过参与就业创业类社团的各类活动，大学生可以得到专业就业指导，这不但可以提升大学生应对就业局势的竞争力，还能够获得高校辅导员对学生职业规划的具体指导教育。通过老师的具体指导，学生可以清晰地了解到自身在就业自主创业活动中的优点和缺点，更确切地了解自身的综合性能力，进而创建恰当有效的个人总结和定位，随后依据自身特点开展就业整体规划。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">例如充分发挥教师在学生中的示范助推功效，其次，在理论学习和培训中，要采用实地考察、专业观查和社会实践的方式，使社会组员对岗位和工作场地有更形象化、理性的了解；三是要组织社区组员参与就业自主创业研究，提升社区组员分析和思索就业自主创业问题的能力；最后，高等院校要重视就业创业类社团在大学毕业生健康教育中的功效，用积极事情教育身边的学生，帮助学生以乐观的心态面对就业压力，尤其重视学生的心理疏导，组织心理状态危机调研，做好心理评估，保证大学毕业生成功渡过大学毕业就业的心理状态关键时期。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">（三）</span><span style=\"font-family:宋体;line-height:24px;font-size:16px;\">加强教育支持，培养高品质人才</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">培养人才需要时间和活力，也需要经济支持，高校相关领导和单位要更为重视大学生就业，了解高校就业社团在大学生就业中的关键功效，增加资金支持幅度，与第三方企业协作，使企业能够为高校就业创业类社团给予资金支持，或进行高校就业创业类社团协同沟通交流，一同举行就业专题讲座或实践活动，最大限度地运用社区活动资金。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">如高校就业创业类社团要采取相应对策实现自身发展，通过多种多样形式的就业自主创业活动和合理的就业具体指导，提高影响力，吸引住高校和社会企业资产注入，能够邀请心理状态健康人员到高校帮助学生减轻过多就业压力产生的心理状态问题，帮助学生提升调节情绪能力。在充裕资金支持下进行的一系列活动，提升了大学生应对极端工作环境的能力，使大学生在工作中碰到紧急状况时能够有目的、理智地作出问题反映，将就业创业类社团累积的知识教育和经验应用到工作中，提升学生的综合性素质和竞争力，融入经济迅速发展背景下对高层次人才的需求，推动学生的将来发展。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-family:&quot;font-size:14px;background-color:#FFFFFF;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;font-size:16px;\">（四）</span><span style=\"font-family:宋体;line-height:24px;font-size:16px;\"><span>加大指导扶持力度</span>,提供基本经费保障</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">专业人员需要为社团的发展给予具体指导、明确目标、制定目标和组织培训。现阶段，绝大部分高校就业创业类社团从学校就业单位聘用老师开展具体指导，为社团迅速健康发展给予了强有力保障。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">例如为推动就业创业类社团又好又快发展，需要聘用生涯规划师、置业顾问等专业人员出任咨询顾问，可以邀请著名企业的人力资源主管出任社团咨询顾问，有益于拓宽视野，提升社会活动的针对性、实效性和科学性。同时，就业创业类社团进行的一些活动通常需要一些资金支持，由于学生社团活动发展的多样性，必须增加财政局投入，确保学生社团活动的正常发展。积极支持、具体指导和监管大学生自主创业社团通过消化吸收社会冠名赞助、给予有偿服务服务等方式筹资活动资金，在活动场地和条件上给与自主创业社团特惠和支持。有条件的学校可以建设大学生创业园区或自主创业试验室，为大学生自主创业实践给予强大的物质保障。</span>\r\n</p>\r\n<p style=\"color:#4C4C4C;font-size:14px;background-color:#FFFFFF;text-align:justify;font-family:Calibri;text-indent:32px;\">\r\n	<span style=\"font-family:宋体;line-height:24px;font-size:16px;\">结论：总的来说，高校就业创业类社团的建设与大学生就业情况息息相关，二者之间的有机关系对大学生就业起着关键功效，提升对社团工作的制度健全和有关具体指导，培养合乎经济社会人才需求的高素质就业人才，以减轻就业压力，提升大学生就业水准，才能为将来大学生就业自主创业给予合理的经验累积。</span>\r\n</p>', '小区西大门', '122', '17367678910', 1, '2023-05-28 20:32:07', '2023-05-28 22:32:07', 1, '2023-05-28 22:32:07', 1, 1, '2023-05-28 22:32:07', 'https://s1.ax1x.com/2023/05/31/p9xudqP.png');
INSERT INTO `t_activity` VALUES (4, 4, '4', 4, '心理沟通', 3, '乐享生活', '<p>\r\n	<div class=\"text-title\" style=\"border:0px;margin:0px;padding:0px;color:#999999;font-family:&quot;background-color:#FFFFFF;\">\r\n		<h1 style=\"font-size:28px;color:#191919;\">\r\n			关注心理健康日丨点亮心灯，呵护学生心理健康&nbsp;<span class=\"article-tag\" style=\"font-weight:400;\"></span>\r\n		</h1>\r\n		<div class=\"article-info\" style=\"border:0px;font-size:14px;margin:0px;padding:15px 0px 0px;\">\r\n			<span class=\"time\" id=\"news-time\">2023-05-25 08:34</span>\r\n		</div>\r\n	</div>\r\n	<p>\r\n		关注心理健康日丨点亮心灯，呵护学生心理健康\r\n	</p>\r\n	<p>\r\n		河南日报社全媒体记者 曹萍 冯军福\r\n	</p>\r\n	<p>\r\n		近年来，青少年心理健康问题频发，受到社会各界广泛关注。党的二十大报告提出，要重视心理健康和精神卫生。日前，教育部等十七部门关于印发《全面加强和改进新时代学生心理健康工作专项行动计划（2023—2025年）》，要求将学生心理健康教育融入教育教学、管理服务和学生成长各环节。\r\n	</p>\r\n	<p>\r\n		5月25日是心理健康日，在这个谐音“我爱我”的日子到来之际，本报记者深入医院、学校、社会团体，关注如何通过家校社联动，为青少年共筑心理健康防护的屏障。\r\n	</p>\r\n	<p>\r\n		<img src=\"https://p2.itc.cn/q_70/images03/20230525/0acbc5c7d9df4e5f851bb2adf866af4a.png\" style=\"height:auto;\" />\r\n	</p>\r\n	<p>\r\n		5月11日，河南省实验中学组织高三学生参加考前团体心理辅导活动，积极为学生减压赋能。冯德源 摄\r\n	</p>\r\n	<p>\r\n		<span style=\"font-weight:700;\">成长中可能遭遇哪些“拦路虎”</span>\r\n	</p>\r\n	<p>\r\n		不同于普通诊室，河南省儿童医院心理门诊的墙壁上，粉刷着粉蓝相间的格子图案。5月23日8时许，诊室外已有不少家长和孩子在等候，等候区相当安静。\r\n	</p>\r\n	<p>\r\n		五年级学生小雨（化名）由爸爸妈妈陪着，走进诊室。坐在该院儿童保健科心理医生叶蓓对面，她始终低着头，说话声音很小。\r\n	</p>\r\n	<p>\r\n		“晚上睡不着觉，白天不想出门，一想到去学校、写作业我的头就疼，像针扎一样。”讲述过程中，女孩不时叹气，“作业好多”“怎么有那么多作业”。\r\n	</p>\r\n	<p>\r\n		经过专业检查和谈话测评发现，小雨已经有比较严重的抑郁倾向，需要进行药物和心理咨询治疗。\r\n	</p>\r\n	<p>\r\n		一个上午，诊室陆陆续续迎来将近20名患者，年龄多集中在12-18岁。\r\n	</p>\r\n	<p>\r\n		“本学期是新冠疫情过后的第一个学期，一些孩子返校后出现了不适应的状况，特别是厌学导致焦虑、抑郁比较突出，最近两个月平均每天接诊量比之前要多出30%左右。”叶蓓说。\r\n	</p>\r\n	<p>\r\n		新学期开始，共青团郑州市委12355青少年服务中心的心理咨询师张利利也感受到了这种变化，青少年心理热线咨询量比以前有所增加。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:700;\">怎样建立青少年心理健康的防护网</span>\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		“老师我可以抱抱你吗？”5月22日，在河南省实验中学的心理咨询室里，一名初二的女生一进来就有些委屈地跟心理老师隋飞霞说。隋飞霞一把把她抱在怀里，任她哭了一会，才让她慢慢地坐下。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		女孩哭完了，坐下来跟老师说了很多，隋飞霞大部分时间都是在倾听，必要时给出一些专业的建议。离开咨询室时，孩子看起来轻松很多。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		“我常常跟同学们说，心理问题、情绪问题就像感冒一样，人人都会遇到，重要的是你要学会自我调节，或者向家长、老师求助，就像感冒就要吃药一样。”隋飞霞希望同学们都能正确看待成长过程中的心理问题。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		<img src=\"https://p0.itc.cn/q_70/images03/20230525/e8569ba1a26b4420a4d06a3e581e5f84.png\" style=\"height:auto;\" />\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		5月11日，河南省实验中学组织高三学生参加考前团体心理辅导活动，积极为学生减压赋能。赵晓鹏 摄\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		心理健康意识和知识、调节技能以及如何求助等，学校的心理健康课是学生获取这些能力的重要渠道。如今，中小学已普遍开设心理健康课程，建立心理筛查制度、重点学生群体一人一档、三级预警制度等。“目前学校专业心理老师缺乏，心理健康相关课程开设不足仍是学校心理健康教育的主要短板，必须要加强学校、社区等的专业队伍建设。”陈欣说。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		近年来，心理治疗师、医务社工、心理咨询师数量逐年增加，但相较于巨大的人口基数，这一数字并不乐观。特别是在一些农村中小学，心理老师严重缺乏。\r\n	</p>\r\n	<p style=\"font-size:16px;color:#191919;font-family:&quot;background-color:#FFFFFF;\">\r\n		业内专家表示，部分教育系统内负责学校心理教育工作的人员专业性不强，这可能会导致基层学校开展心理健康测评等心理健康工作时产生偏差，学校心理教育工作岗位人员的专业性尚有较大提升空间。\r\n	</p>\r\n</p>', '小区东大门', '23', '17367678910', 0, '2023-05-28 22:36:20', '2023-05-28 22:36:20', 0, '2023-05-28 22:36:20', NULL, NULL, '2023-05-28 22:36:20', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (5, 4, '1', 6, '心灵需要加油', 4, '体验多彩人生', '<p>心理健康就是没心理病么？听听指导师怎么说 2023-05-29 22:16<br>	心理健康是什么状态？<br>	或许很多朋友一句两句说不清楚，如果不用抽象的科学定义，具象的说心理健康就是一个人在精神、情感、行为等方面的良好适应性。有的人说心理健康就是心理没毛病、没精神障碍，这种观点或许不够严谨客观。因为心理良好的状态不代表没有问题、没有障碍，而是能够有效处理生活中各种压力和困难，具有积极正向的情感体验，同时能够建立稳定的人际关系，在不同的环境中有稳定的心理行为表现。<br></p><p style=\"text-align: center;\"><img src=\"https://p3.itc.cn/images01/20230529/b8077fdeddb44cf196068d708d73c12f.jpeg\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p><br>	本文所指的适应水平，包括了个体心理诸多要素的构成和运作机制，这句话听起来较为抽象。具体是指自我认知、环境认知、情感认知等方面的发展过程与外界的交互作用。这些作用合起来共同组成了一个人心理状态的整体。<br>	因此，心理健康不能单一的理解为没有精神疾病或某种障碍，而是个体在生命时间历程中走向自我认同、实现目标、获得和谐的一系列发展过程。</p>', '2单元楼下', '543', '17367678910', 0, '2023-05-28 22:39:06', '2023-05-28 22:39:06', 0, '2023-05-28 22:39:06', 10000, 10000, '2023-05-28 22:39:06', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (6, 5, '1', 7, '人物', 5, '技能，使生活更美好|阳华：以热爱赋能，点亮青春', '<div class=\"text-title\" style=\"border:0px;margin:0px;padding:0px;color:#999999;font-family:&quot;background-color:#FFFFFF;\">\r\n	<h1 style=\"font-size:28px;color:#191919;\">\r\n		技能成才·强国有我｜东莞纺校学子：技能点亮青春梦想&nbsp;<span class=\"article-tag\" style=\"font-weight:400;\"></span>\r\n	</h1>\r\n	<div class=\"article-info\" style=\"border:0px;font-size:14px;margin:0px;padding:15px 0px 0px;\">\r\n		<span class=\"time\" id=\"news-time\">2023-05-29 22:10</span>\r\n	</div>\r\n</div>\r\n<p>\r\n	近期，2022—2023年度广东省职业院校学生技能大赛（中职组）落幕，东莞市纺织服装学校（下称“东莞纺校”）不负众望、满载而归，学校24支队伍在服装设计与工艺、模特表演、电子商务技能、广告设计与制作等16个赛项中展开激烈角逐，最终捧回23项大奖！\r\n</p>\r\n<p>\r\n	其中，学校电子商务专业学生岑静凤所在团队在移动应用开发与服务赛事中获得一等奖，这也是东莞纺校继2022年首次参赛勇夺一等奖之后，再次夺得该奖项。随后，广告设计与制作赛场上同样传来好消息，学校美术设计与制作专业学生杨晓琳与来自全省各校的118名参赛队手同场竞技，最终脱颖而出，以全省第三名的好成绩成功斩获省一等奖，使东莞纺校在该项赛事中连续三年获省一等奖。\r\n</p>\r\n<p>\r\n	<img src=\"https://p0.itc.cn/q_70/images03/20230530/d7a0de4cb0e64826ab1ebf1e3c50a3b9.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	岑静凤（左三）参加2023年广东省职业院校技能大赛\r\n</p>\r\n<p>\r\n	荣耀的背后，到底蕴含着多少汗水与努力？下面，跟随南方+一起走进岑静凤、杨晓琳的技能成才之路。\r\n</p>\r\n<p>\r\n	<span style=\"font-weight:700;\">岑静凤：选择中职赛道，开启出彩人生</span>\r\n</p>\r\n<p>\r\n	2020年9月，岑静凤考入东莞市纺织服装学校电子商务专业。高一时，她便立志要在中职这条赛道实现自我价值。在老师们的帮助下，岑静凤了解到电子商务行业所需的各项技能，努力学习专业知识，积极锤炼专业技能，学习成绩名列全班第一名。\r\n</p>\r\n<p>\r\n	<img src=\"https://p4.itc.cn/q_70/images03/20230530/d4d9ffc79a53438aaae33acec4d10823.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	岑静凤获得国家奖学金\r\n</p>\r\n<p>\r\n	高一学习生活结束之际，一次学校竞赛队的选拔点燃了她心中的火苗。暑假期间，在老师的线上指导下，岑静凤每天自律学习、积极钻研，在众多学生中突围而出，成功入选了学校移动应用开发与服务竞赛队。\r\n</p>\r\n<p>\r\n	高一时期刻苦学习打下的扎实专业基础和过硬专业技能，让她在移动应用前端设计、推广方案撰写以及推广海报设计上游刃有余。但她并未因此松懈，反而不断提升对自己的要求，在速度上和完成质量上持续提高标准，每天的进步让老师和同学看在眼里。\r\n</p>\r\n<p>\r\n	对于没有接触过的内容，她始终抱着打破砂锅问到底的心态，不是老师布置了任务“要我学”，而是主动出击“我要学”，一边不断追着指导老师解决技术问题，一边通过互联网了解各项知识。日常的训练看似枯燥乏味，但她却很好地转化成为不断汲取知识的动力。2021年10月，岑静凤第一次踏上赛场，夺得东莞市职业院校技能大赛第3名，成功入围省赛。\r\n</p>\r\n<p>\r\n	<img src=\"https://p3.itc.cn/q_70/images03/20230530/c589120d0b6d4268b1b439cf4df88b87.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	岑静凤（中间）在向学弟学妹传授竞赛经验\r\n</p>\r\n<p>\r\n	省赛的备赛节奏更加紧张，无论是在学校还是在家里，她都每天坚持训练，保质保量完成指导老师设定的训练目标，每天进行总结反思。这段时间的坚持，也让她逐步建立了信心，技能水平有了质的飞跃。终于，在2022年5月省职业技能大赛中，岑静凤所在团队斩获全省第2名，如愿夺得省赛一等奖。\r\n</p>\r\n<p>\r\n	技能先锋的成长从来不是一蹴而就的，岑静凤脚踏实地、勤学苦练，在中职这条赛道上开启了她的出彩人生。\r\n</p>\r\n<p>\r\n	<span style=\"font-weight:700;\">杨晓琳：努力克服困难，朝着目标前进</span>\r\n</p>\r\n<p>\r\n	初中时，杨晓琳的成绩并不突出，她曾经一度怀疑自己，甚至迷茫找不到前进的方向。一次偶然的机会，她看到了东莞纺校的招生简介，没有任何美术基础的她被艺术毕业设计作品惊艳了，毅然决然报考美术设计与制作专业。\r\n</p>\r\n<p>\r\n	刚到学校时，杨晓琳深知自己艺术水平基础较差，为此，她上课时认真聆听老师授课，刻苦钻研专业理论知识，经常利用休息时间进行训练。不出半年时间，她在描素、水彩、美术设计等技能上都有了质的提升。\r\n</p>\r\n<p>\r\n	<img src=\"https://p8.itc.cn/q_70/images03/20230530/6e7c22a2eb8842038fa4894fa4ecaf33.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	杨晓琳获得国家奖学金\r\n</p>\r\n<p>\r\n	“我听了班主任的专业介绍，了解到参加广东省职业技能大赛获奖就可以免试入学读深职院，我的目标就是拿到省技能大赛一等奖！”杨晓琳兴奋地说道。高二下学期，学校广告竞赛队开始招新。杨晓琳凭借勤奋刻苦的学习态度、认真负责的工作态度、专心致志的做事风格、过硬的专业技术，成为众多老师极力推荐的种子选手。\r\n</p>\r\n<p>\r\n	进入竞赛队后，为了获得参加省赛的机会，杨晓琳每天最早到教室、最晚离开。为了挤出训练时间，她甚至中午都不回宿舍休息，周末经常主动留在学校进行训练。在竞赛队，每天最重要的任务就是训练制作海报、设计标志等比赛内容，这些内容都要需要精益求精、心无旁骛、刻苦钻研的精神才能完成。这期间，杨晓琳不厌其烦地反复训练，努力克服自身的困难，朝着自己的目标大步前进。\r\n</p>\r\n<p>\r\n	<img src=\"https://p2.itc.cn/q_70/images03/20230530/67473e39fb9d437bba1c9cdc83af03e1.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	2023年4月，广东省职业院校学生专业技能大赛中职组广告设计与制作赛项准备开启。杨晓琳从1月份就开始备赛，主动放弃寒假休息时间，认真聆听指导老师的线上辅导课。开学后，她更是全身心投入训练当中，生怕浪费一分一秒。最终，在省职业技能大赛中，她凭着过硬的专业技能，从118名参赛队手中脱颖而出，荣获一等奖第三名的佳绩。“杨晓琳真的非常努力，临近比赛时中午还留在教室训练，晚上也是最后一个回宿舍的。不经过刻苦训练，怎能取得成功呢？”杨晓琳的指导老师感慨道。\r\n</p>\r\n<p>\r\n	<img src=\"https://p4.itc.cn/q_70/images03/20230530/15177347551341068628823fee28c04f.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	杨晓琳（中）与指导老师一起\r\n</p>', '棋牌中心', '645', '17367678910', 1, '2023-05-28 22:39:12', '2023-05-28 22:39:12', 0, '2023-05-28 22:39:12', NULL, NULL, '2023-05-28 22:39:12', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (7, 6, '1', 8, '毕业季', 7, '毕业季，我们与网通同行', '<div class=\"text-title\" style=\"border:0px;margin:0px;padding:0px;color:#999999;font-family:&quot;background-color:#FFFFFF;\">\r\n	<h1 style=\"font-size:28px;color:#191919;\">\r\n		<span class=\"title-info-title\">大学生国风毕业照惊艳全场，云肩搭配学士服，这波毕业照赢麻了</span>&nbsp;<span class=\"article-tag\" style=\"font-weight:400;\"></span>\r\n	</h1>\r\n	<div class=\"article-info\" style=\"border:0px;font-size:14px;margin:0px;padding:15px 0px 0px;\">\r\n		<span class=\"time\" id=\"news-time\">2023-05-30 13:27</span>\r\n	</div>\r\n</div>\r\n<blockquote>\r\n	转眼间时光飞逝，一晃就又到毕业季了，每年的毕业季都是一个伤心的季节，但同时也是一个更加充满希望的季节，\r\n</blockquote>\r\n<p>\r\n	因为毕业了就代表着同学们又将要迈入人生的新篇章，走进新的生活中去，虽然有离别的不舍和难过，但现在网络那么发达，<span style=\"font-weight:700;\">同学彼此联系的也更容易</span>，也就没有那么多悲伤的情绪了。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p0.itc.cn/images01/20230530/fa5c0fcd3872458aaa261744f378ecd8.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	而且毕业可以拍美美的毕业照片，这也是很开心快乐的时刻，毕业照也能给同学们留念，让大家记住身边的同学，<span style=\"font-weight:700;\">也记住这快乐的学习时光。</span>\r\n</p>\r\n<p>\r\n	大学生拍毕业照一般都是穿学士服拍的，每个同学都穿上端庄大气的学士服，虽然很好看，但大家的都一样也就略显平淡了些。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p8.itc.cn/images01/20230530/5737372d92c24f22a7928f2f6583cc67.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<h1 style=\"font-size:1.25em;\">\r\n	女大学生国风毕业照惊艳全场，云肩搭配学士服，妥妥占据c位\r\n</h1>\r\n<p>\r\n	同样是拍毕业照，同样是穿学士服，有的同学拍出来的就是千篇一律，可有的同学却拍出了大片的感觉。\r\n</p>\r\n<p>\r\n	四川某高校里的一位女同学，就把自己的大学毕业照拍的惊艳无比，<span style=\"font-weight:700;\">让不少网友都纷纷羡慕，直呼也想来这么一套。</span>\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p0.itc.cn/images01/20230530/3f8bbba93e6d40b098b2faefb9de4e45.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	这位女生并没有对学士服进行太大的改动，<span style=\"font-weight:700;\">而只是在学士服外面搭配了一个云肩</span>，就瞬间把气质拉高了很多个档次，一下子也成了全场同学的焦点，让人直呼国风太美了。\r\n</p>\r\n<p>\r\n	云肩是我国隋朝以后发展的一种衣饰，跟现在的披肩是差不多的，是古人们用来作为装饰用的，在很多隋朝后期逐渐流行起来。\r\n</p>\r\n<p>\r\n	而学士服算是一个“外来客”，是英国发明的一种大学毕业穿的服饰，近些年才在我们国家比较流行穿起来。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p6.itc.cn/images01/20230530/a542ba25614f440aa6bedd0c10d95230.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	虽然大学生毕业穿学士服拍照是一种很常规的操作，但这毕竟是外国的东西，<span style=\"font-weight:700;\">加上云肩之后就更有东方魅力了</span>，这或许才是独属于东方人的美。\r\n</p>\r\n<p>\r\n	而这位女同学的做法也确实惊艳了众人，甜妹的外表加上这满满国风的服饰，简直不要太好看了，不少网友都调侃说道：<span style=\"font-weight:700;\">“这波毕业照简直是赢麻了！”</span>\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p5.itc.cn/images01/20230530/8a75b3d0693c48469a21635023ee5e61.png\" style=\"height:auto;\" />\r\n</p>\r\n<h1 style=\"font-size:1.25em;\">\r\n	网友们对此羡慕不已，但也有不一样的声音出现\r\n</h1>\r\n<p>\r\n	网友都很喜欢这位女生的装扮，也都在评论区纷纷留言“美爆了”，更有网友留言说：“这是独属于中国人的服装浪漫。”\r\n</p>\r\n<p>\r\n	确实，作为中国的传统服饰来讲，云肩既好看又有着特殊的意义，学生身披云肩也是能够很好地为传扬中国文化做出一定贡献。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p6.itc.cn/images01/20230530/341871bf012946cbb6a48dc72b04a996.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	这不仅能够吸引到同为大学生的学生，<span style=\"font-weight:700;\">同时也能让外国人看到我们国家特有文化的魅力，</span>自然是再好不过的了。\r\n</p>\r\n<p>\r\n	可就在大家都纷纷羡慕的同时，评论区里也有不一样的声音出现，有觉得女大学生拍个毕业照而已，没必要弄这么大的阵仗吧，又是云肩又是浓妆艳抹的。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p9.itc.cn/images01/20230530/af052cea6f6645c590608953ac76994a.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-weight:700;\">作为一个大学生就应该有青春活力的样子</span>，而不是像这样，觉得这样简直有损大学生形象，虽然好看但却不合时宜，没必要在这种场合里这么做。\r\n</p>\r\n<p>\r\n	还有的人觉得这位同学可能就是为了出名，为了火而引起的热度，这样好能在大学毕业之后有一个比较不错的发展，所以才如此包装自己。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p6.itc.cn/images01/20230530/15f048a1fe9a430a8155c5104ac75303.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	但不管大家的看法如何，<span style=\"font-weight:700;\">也不管这些不一样的声音说的到底是对是错</span>，每个人都有自己的喜好和习惯，不会因为别人的只言片语就随意改变。\r\n</p>\r\n<p>\r\n	而且任何东西都会有好的声音和不好的声音出现，学生越是在意这些就越容易激起键盘侠们的兴奋神经，所以不去过多关注这些反而更好。\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p0.itc.cn/images01/20230530/427c6441713c4ef39640001784af3d77.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<h1 style=\"font-size:1.25em;\">\r\n	大学生也有自己的生活，兴趣爱好，对别人的话不必太在意，自己过得舒心就好\r\n</h1>\r\n<p>\r\n	都说现在的00后大学生们越来越自我了，可这不也是时代造成的吗？总有那么多人说着对错，对别人指指点点，各种评判，如果都听了这些人可能就该分裂了。\r\n</p>\r\n<p>\r\n	与其到处听别人的意见，倒不如舒心的做自己，<span style=\"font-weight:700;\">过自己想过的生活，何必受别人的影响呢？</span>\r\n</p>\r\n<p class=\"ql-align-center\" style=\"text-align:center;\">\r\n	<img src=\"https://p3.itc.cn/images01/20230530/a00ffccd37434dbf8fd65a8a2117c477.png\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	况且大学生已经成年了，有自己的想法和主见，也都知道什么该做什么不该做，知道是非对错，这就足够了，为什么要去听别人不好的评判呢？\r\n</p>\r\n<p>\r\n	<span style=\"font-weight:700;\">每一个人都有自己的自由</span>，穿衣打扮也可以按照自己的想法去做，学生真的不用太在意外界的评价和看法，做好自己就够了。\r\n</p>\r\n<p>\r\n	同时也希望网上的有些人，可以嘴下留情，不要老是去否定、批判别人，当个键盘侠有什么好的呢？网络也不是法外之地，说话之前也要考虑考虑会不会给自己带来不良的后果。\r\n</p>\r\n<p>\r\n	今日话题互动：<span style=\"font-weight:700;\">你们觉得这位同学的毕业装扮如何？欢迎来一起交流讨论。</span>\r\n</p>', '公共厕所旁', '1223', '17367678910', 0, '2023-05-28 22:39:22', '2023-05-28 22:39:22', 0, '2023-05-28 22:39:22', NULL, NULL, '2023-05-28 22:39:22', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (8, 7, '1', 9, '关注艾滋病患者', 8, '校园行丨隔艾不隔爱', '<div class=\"text-title\" style=\"border:0px;margin:0px;padding:0px;color:#999999;font-family:&quot;background-color:#FFFFFF;\">\r\n	<h1 style=\"font-size:28px;color:#191919;\">\r\n		艾滋病房里的“00后”护士&nbsp;<span class=\"article-tag\" style=\"font-weight:400;\"></span>\r\n	</h1>\r\n	<div class=\"article-info\" style=\"border:0px;font-size:14px;margin:0px;padding:15px 0px 0px;\">\r\n		<span class=\"time\" id=\"news-time\">2023-05-11 20:12</span>\r\n	</div>\r\n</div>\r\n<p>\r\n	<img src=\"https://p4.itc.cn/q_70/images03/20230511/040ee80e31c04ce8b8839eee1f46b821.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤在病房里准备给病人抽血。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p9.itc.cn/q_70/images03/20230511/884495aaf9de4e95a6897cbf10dd2e50.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤在病房里给病人治疗。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p5.itc.cn/q_70/images03/20230511/64fd4236d5c745d081b81e64e1f38249.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，黄小贤走在广西南宁市第四人民医院里。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p2.itc.cn/q_70/images03/20230511/b0ee16aa249649e4b9f10e0b0b53e4d8.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤（左）在医院庆祝护士节活动中和同事表演中国风服装秀。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p4.itc.cn/q_70/images03/20230511/09b1821a0bda4f25970767f50851a0fc.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤（前）和同事在医院庆祝国际护士节活动中进行新入职护士宣誓。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p1.itc.cn/q_70/images03/20230511/80b1a9b9dcbc4d18806b465b751ecf98.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤在病房区走廊和病人谈心。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p5.itc.cn/q_70/images03/20230511/2ebab0ea90ac418490c1fa85521f2973.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤在给病人备药。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>\r\n<p>\r\n	新华社记者 陆波岸 摄\r\n</p>\r\n<p>\r\n	<img src=\"https://p1.itc.cn/q_70/images03/20230511/041056e717614c8db35cd6e71219cf07.jpeg\" style=\"height:auto;\" />\r\n</p>\r\n<p>\r\n	5月10日，在广西南宁市第四人民医院，黄小贤（前右）在和同事核对有关病人信息。\r\n</p>\r\n<p>\r\n	出生于2001年6月的黄小贤，2022年6月从广西科技大学护理专业毕业后来到南宁市第四人民医院工作，现在是医院感染科三病区护士，这个病区的病人都是艾滋病患者。\r\n</p>\r\n<p>\r\n	“刚开始时，说不害怕是不可能的。”黄小贤说。她没来到这个岗位之前心里也有担忧，“也害怕别人知道我在艾滋病科工作，会被人看不起。”但工作后发现，护理艾滋病病人并没有想象中那么可怕，看到病人病痛不断减轻、甚至可以出院回家，她感到自己的付出很值得、这份工作有价值。\r\n</p>', '社区办公室', '54', '17367678910', 0, '2023-05-28 22:39:25', '2023-05-28 22:39:25', 1, '2023-05-28 22:39:25', NULL, NULL, '2023-05-28 22:39:25', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (10, 9, '1', 1, '小区跑车赛事', 9, '泰裤辣！小区超级跑车锦标赛在', '<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	5月26日，凤凰网河南从2023郑州国际赛车嘉年华组委会新闻发布会上获悉，2023年中国超级跑车锦标赛郑州站将于6月9日至11日在郑州国际赛车场劲爆举行。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	届时，200余名国内外车队成员、专业裁判等将汇聚郑州，为广大赛车爱好者奉献上一场陆上版“速度与激情”的顶级汽车赛事盛宴。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/685D34B94BB4C141ADB84662CCAD4839CE1BBF16_size262_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">中原地区唯一标准化国际赛道 首迎汽车顶级赛事</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车嘉年华·2023年中国超级跑车锦标赛郑州站比赛，由中国汽车摩托车运动联合会、河南省体育局、郑州市人民政府主办，郑州市体育局、郑州经济技术开发区管委会承办，将于6月9日至6月11日在郑州国际赛车场举行。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	本次比赛是郑州国际赛车嘉年华的主赛事，是我市继成功举办2023国际摩联F1摩托艇世界锦标赛中国郑州大奖赛后，又将主办的一项国内A类赛事，也是汽车顶级赛事首次落户河南。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/39F9E3821398B146A4125C722A7EF930FBD7DBF2_size150_w777_h516.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	除了将要举办的本次比赛和已经举办过的CDB飘移亚洲杯外，郑州国际赛车嘉年华还将举行雷诺方程式中国锦标赛、Radical统规赛(KTM)等十余项赛事和活动，整个活动将一直持续到7月1日。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	这个夏天，郑州市民将充分享受到一场陆上版“速度与激情”的盛宴。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	据了解，作为本次郑州站比赛举办地的郑州国际赛车场，位于郑州经济技术开发区国际物流园区内，总投资6.8亿元，是目前中原地区唯一一条标准化国际赛道，赛道总长4.6公里，其中场地赛道长2.6公里，赛道线型设计有五种不同组合，可以根据赛事需求灵活调整。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/EE008A861AE0A6DD348C018EDC89D3805E0E92B1_size139_w777_h516.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车场配建的还有赛事控制中心、万人看台、29间车队维修P房、多功能大楼等附属设施，功能设施齐全。该赛车场刚建成，就首次迎来了2023年中国超级跑车锦标赛郑州站比赛这项汽车顶级赛事。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/95393A3023A8D54FB3F8BBD8F9C439457D39C1C8_size208_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">打造城市“新IP” 助力郑州国内外“朋友圈”再扩大</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车嘉年华·2023年中国超级跑车锦标赛郑州站的比赛，是郑州市整合全市汽车生产、研发、销售及汽车娱乐、汽车文化等汽车后市场资源，推动汽车产业全链条提升和汽车文旅文创融合发展的一次重大文体活动。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/DFD690367E1FE68A6EB087B08FFA33CCD556A428_size213_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	这将进一步浓厚我市体育氛围、激活体育产业，有力促进河南省、郑州市国际文化、体育、旅游及经贸交流合作，叫响郑州汽车文化品牌，为郑州打造新的城市IP。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	国标车队齐聚，顶级赛车手云集，本次赛事不但是一场激情澎湃的赛车盛会，而且是一个展示城市形象的重要平台。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/9FB442C0C1206A6F4BBF78AFB246702844739B11_size167_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">讲好郑州汽车城故事 助推郑州汽车产业高质量发展</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	中国超级跑车锦标赛这项汽车顶级赛事，缘何能落户郑州，落户郑州经开区？\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	据郑州经开区管委会相关负责人介绍：“汽车产业是郑州经开区的主导产业之一，产业规模已超千亿级。辖区拥有上汽、东风日产、宇通、海马4家整车厂、7家专用车厂、260余家汽车零部件企业，汽车整车年产能达到130万辆，占全省70%以上，在经开区，每个工作日就有超1500辆整车下线，已发展成为具有国内重要影响力的汽车之城。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州经开区承办的本次赛事，不仅是一场赛车爱好者的盛会，而且更是展示郑州城市形象、讲好郑州汽车城故事的一个重大契机。”\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州经开区将以本次赛事为引擎，进一步完善汽车全产业链条，助推全市汽车产业高质量发展。\r\n</p>', '朝阳大街', '7523', '17367678910', 0, '2023-05-28 22:39:34', '2023-05-28 22:39:34', 0, '2023-05-28 22:39:34', NULL, NULL, '2023-05-28 22:39:34', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (11, 8, '1', 10, '社区--美好家园', 3, '社区活动丰富多彩 满足居民多样需求', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;line-height:24px;\">为深入学习贯彻习近平新时代中国特色社会主义思想</span><span style=\"font-family:宋体;line-height:24px;\">，</span><span style=\"font-family:宋体;line-height:24px;\">宣传贯彻</span><span style=\"font-family:宋体;line-height:24px;\">两会</span><span style=\"font-family:宋体;line-height:24px;\">精神</span><span style=\"font-family:宋体;line-height:24px;\"><span>，</span><span>4月12日下午</span></span><span style=\"font-family:宋体;line-height:24px;\">，学校党校组织</span><span style=\"font-family:宋体;line-height:24px;\">第</span><span style=\"font-family:宋体;line-height:24px;\">九</span><span style=\"font-family:宋体;line-height:24px;\"><span>期党训班学员前往金山花园社区进行了</span><span>“两会精神进社区 传递党的好声音”系列宣讲活动</span></span><span style=\"font-family:宋体;line-height:24px;\">，</span><span style=\"font-family:宋体;line-height:24px;\">旨在培育广大学生服务社会助力基层文明创建的志愿服务精神，鼓励青年学子扎根基层，砥砺青春，以青年之力量，筑牢新时代的有力根基。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2023/05/18/8263148.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;line-height:24px;\">马克思主义学院石磊老师以民生热点为例，对两会精神进行了解读。第九期发展对象党训培训班教师、学生围绕两会精神通过知识问答等方式与金山花园社区居民进行宣传互动。学员们结合自己的学习和专业内容，用通俗易懂的语言为大家阐述了全国两会精神的主要内容和重大意义，让居民能够看得见听得懂，将全国两会精神送到群众的心坎上。学员们</span><span style=\"font-family:宋体;line-height:24px;\">创新宣讲方式，以灵活多样喜闻乐见的形式整合多方力量，积极开展全国两会精神宣讲活动，让党的创新理论在基层落地生根，开花结果。</span>\r\n</p>', '华谊街道', '123', '17367678910', 0, '2023-05-28 22:39:33', '2023-05-28 22:39:33', 0, '2023-05-28 22:39:33', NULL, NULL, '2023-05-28 22:39:33', 'https://picsum.photos/800/600');
INSERT INTO `t_activity` VALUES (1012, 6, '1', NULL, 'test', 3, 'test', '特色他', 'test', '23', '15365047273', 0, '2023-05-29 14:55:02', '2023-05-25 19:25:55', 0, '2023-05-25 19:25:55', 10000, 10000, '2023-05-25 19:25:55', 'https://picsum.photos/800/600');

-- ----------------------------
-- Table structure for t_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_type`;
CREATE TABLE `t_activity_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id（绑定所属社区）',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态  0：正常 1：失效',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity_type
-- ----------------------------
INSERT INTO `t_activity_type` VALUES (1, '学习强国', 1, 1, 1, '2023-05-25 13:34:53', 0, 0, '2023-05-25 13:34:53');
INSERT INTO `t_activity_type` VALUES (2, '运动', 2, 1, 1, '2023-05-25 16:05:40', 0, 0, '2023-05-25 16:05:40');
INSERT INTO `t_activity_type` VALUES (3, '宠物日活动', 3, 1, 1, '2023-05-28 22:22:10', NULL, NULL, '2023-05-28 22:22:10');
INSERT INTO `t_activity_type` VALUES (4, '心理健康', 4, 0, 0, '2023-05-28 22:22:41', NULL, NULL, '2023-05-28 22:22:41');
INSERT INTO `t_activity_type` VALUES (5, '自然', 5, 0, 1, '2023-05-28 22:22:45', NULL, NULL, '2023-05-28 22:22:45');
INSERT INTO `t_activity_type` VALUES (6, '手工', 6, 1, 0, '2023-05-28 22:23:27', NULL, NULL, '2023-05-28 22:23:27');
INSERT INTO `t_activity_type` VALUES (7, '人物', 7, 0, 0, '2023-05-28 22:23:30', NULL, NULL, '2023-05-28 22:23:30');
INSERT INTO `t_activity_type` VALUES (8, '就业', 8, 1, 0, '2023-05-28 22:23:33', NULL, NULL, '2023-05-28 22:23:33');
INSERT INTO `t_activity_type` VALUES (9, '社区环境', 9, 1, 0, '2023-05-28 22:23:36', NULL, NULL, '2023-05-28 22:23:36');
INSERT INTO `t_activity_type` VALUES (10, '毕业季', 10, 1, 0, '2023-05-28 22:23:41', NULL, NULL, '2023-05-28 22:23:41');
INSERT INTO `t_activity_type` VALUES (11, '家庭', 12, 1, 0, '2023-05-28 22:25:10', NULL, NULL, '2023-05-28 22:25:10');
INSERT INTO `t_activity_type` VALUES (1008, 'test', 3, 0, 0, '2023-05-25 19:25:55', 10000, 10000, '2023-05-25 19:25:55');

-- ----------------------------
-- Table structure for t_agreement
-- ----------------------------
DROP TABLE IF EXISTS `t_agreement`;
CREATE TABLE `t_agreement`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `TYPE` tinyint(1) NOT NULL COMMENT '类型（0用户协议 1隐私政策）',
  `DELETED` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建者',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户隐私' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `money` double(11, 2) NULL DEFAULT 0.00 COMMENT '收费金额',
  `status` tinyint NULL DEFAULT 0 COMMENT '缴费状态（0：缴费 1：未缴费）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES (1, 1, 1322.00, 0, 0, '2023-05-25 14:26:11', 1, 1, '2023-05-25 14:26:11');
INSERT INTO `t_bill` VALUES (2, 1, 32.00, 0, 0, '2023-05-25 14:26:28', 1, 1, '2023-05-25 14:26:28');
INSERT INTO `t_bill` VALUES (3, 0, 110.00, 0, 1, '2023-05-25 16:25:10', 0, 0, '2023-05-25 16:25:10');

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id',
  `building_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '楼宇名称',
  `units` int NULL DEFAULT NULL COMMENT '层数',
  `used_area` int NULL DEFAULT NULL COMMENT '使用面积',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '楼宇表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES (1, 1, '博闻居', 33, 432, '地大物博', 0, 1, '2023-05-28 13:03:42', 1, '2023-05-28 13:03:42');
INSERT INTO `t_building` VALUES (2, 1, '文博楼', 33, 326, '地大物博', 0, 1, '2023-05-28 13:03:44', 1, '2023-05-28 13:03:44');
INSERT INTO `t_building` VALUES (3, 1, '思齐楼', 33, 346, '地大物博', 0, 1, '2023-05-28 13:03:45', 1, '2023-05-28 13:03:45');
INSERT INTO `t_building` VALUES (4, 1, '致远楼', 25, 436, '地大物博', 0, 1, '2023-05-28 13:03:50', 1, '2023-05-28 13:03:50');
INSERT INTO `t_building` VALUES (5, 1, '九思楼', 25, 532, '地大物博', 0, 1, '2023-05-28 13:03:52', 1, '2023-05-28 13:03:52');
INSERT INTO `t_building` VALUES (6, 1, '七录斋', 25, 463, '地大物博', 0, 1, '2023-05-28 13:03:53', 1, '2023-05-28 13:03:53');
INSERT INTO `t_building` VALUES (7, 1, '积微楼', 25, 256, '地大物博', 0, 1, '2023-05-28 13:03:54', 1, '2023-05-28 13:03:54');
INSERT INTO `t_building` VALUES (8, 1, '格正楼', 16, 547, '地大物博', 0, 1, '2023-05-28 13:03:57', 1, '2023-05-28 13:03:57');
INSERT INTO `t_building` VALUES (9, 2, '一号楼', 28, 256, '学富五车', 0, 1, '2023-05-28 13:04:05', 1, '2023-05-28 13:04:05');
INSERT INTO `t_building` VALUES (10, 2, '二号楼', 28, 342, '学富五车', 0, 1, '2023-05-28 13:04:08', 1, '2023-05-28 13:04:08');
INSERT INTO `t_building` VALUES (11, 2, '三号楼', 32, 124, '学富五车', 0, 1, '2023-05-28 13:04:10', 1, '2023-05-28 13:04:10');
INSERT INTO `t_building` VALUES (13, 2, '四号楼', 28, 333, '学富五车', 0, 1, '2023-05-28 13:04:14', 1, '2023-05-28 13:04:14');
INSERT INTO `t_building` VALUES (15, 2, '五号楼', 32, 421, '学富五车', 0, 1, '2023-05-28 13:04:16', 1, '2023-05-28 13:04:16');
INSERT INTO `t_building` VALUES (16, 2, '六号楼', 32, 423, '最高学府', 0, 1, '2023-05-28 16:17:30', 1, '2023-05-28 16:17:30');

-- ----------------------------
-- Table structure for t_car
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `licence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车牌号',
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆品牌',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆型号',
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆颜色',
  `deadline` datetime(0) NULL DEFAULT NULL COMMENT '保险截止日期',
  `annual_time` datetime(0) NULL DEFAULT NULL COMMENT '年审日期',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES (1, 1, '鲁A·888888', '宾利', 'X6', '银色', '2030-12-28 21:50:48', '2023-02-24 21:51:00', 0, 1, '2023-05-24 21:51:08', 1, '2023-05-24 21:51:12');
INSERT INTO `t_car` VALUES (2, 2, '苏B·123456', '宝马', 'X5', '黑色', '2023-05-29 16:01:17', '2023-05-29 16:01:19', 0, 1, '2023-05-29 16:01:23', 1, '2023-05-29 16:01:25');
INSERT INTO `t_car` VALUES (3, 3, '浙A·321123', '小鹏', 'P7', '绿色', '2023-05-29 16:02:43', '2023-05-29 16:02:45', 0, 1, '2023-05-29 16:02:49', 1, '2023-05-29 16:02:51');
INSERT INTO `t_car` VALUES (4, 4, '苏A·865632', '奔驰', 'H8', '荧光粉', '2023-05-29 16:03:44', '2023-05-29 16:03:46', 0, 1, '2023-05-29 16:03:51', 1, '2023-05-29 16:03:53');
INSERT INTO `t_car` VALUES (5, 5, '鲁C·666666', '丰田', 'K8', '白色', '2023-05-29 16:05:31', '2023-05-29 16:05:33', 0, 1, '2023-05-29 16:05:37', 1, '2023-05-29 16:05:40');

-- ----------------------------
-- Table structure for t_carport
-- ----------------------------
DROP TABLE IF EXISTS `t_carport`;
CREATE TABLE `t_carport`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `car_id` bigint NULL DEFAULT NULL COMMENT '车辆id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `park_id` bigint NULL DEFAULT NULL COMMENT '停车场id',
  `carport_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车位名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '车位状态(0：闲置 1：已租 2：已售)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '租赁(购买)开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '租赁(购买)结束时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carport
-- ----------------------------
INSERT INTO `t_carport` VALUES (1, 1, 1, 1, 'A-1', 1, '2023-01-23 00:00:00', '2024-01-24 00:00:00', 0, 1, '2023-05-24 21:52:14', 1, '2023-05-31 15:08:15');
INSERT INTO `t_carport` VALUES (2, 2, 2, 2, 'A-1', 1, '2023-05-29 15:58:29', '2023-05-29 15:58:34', 0, 1, '2023-05-29 15:58:36', 1, '2023-05-29 15:58:42');
INSERT INTO `t_carport` VALUES (3, 3, 3, 1, 'A-2', 2, '2023-05-29 15:59:44', '2023-05-29 15:59:47', 0, 1, '2023-05-29 15:59:50', 1, '2023-05-29 15:59:52');
INSERT INTO `t_carport` VALUES (4, 4, 4, 1, 'A-3', 1, '2023-05-29 16:00:23', '2023-05-29 16:00:26', 0, 1, '2023-05-29 16:00:29', 1, '2023-05-29 16:00:32');
INSERT INTO `t_carport` VALUES (5, NULL, NULL, 3, 'B-404', 0, '2023-05-29 16:58:00', '2023-05-29 16:58:03', 0, 1, '2023-05-29 16:58:05', 1, '2023-06-01 20:04:11');
INSERT INTO `t_carport` VALUES (6, NULL, NULL, 1, 'A-2', 0, '2023-01-23 00:00:00', '2024-01-24 00:00:00', 0, 0, '2023-05-24 21:52:14', 0, '2023-06-01 20:01:54');
INSERT INTO `t_carport` VALUES (7, NULL, NULL, 1, 'A-3', 0, '2023-01-23 00:00:00', '2024-01-24 00:00:00', 0, 1, '2023-05-24 21:52:14', 1, '2023-06-01 20:07:22');
INSERT INTO `t_carport` VALUES (8, NULL, NULL, 2, 'B-1', 0, '2023-01-23 00:00:00', '2024-01-24 00:00:00', 0, 1, '2023-05-24 21:52:14', 1, '2023-05-31 15:08:15');
INSERT INTO `t_carport` VALUES (10, NULL, NULL, NULL, '', 0, NULL, NULL, 0, 1, '2023-06-01 17:56:21', 1, '2023-06-01 17:56:21');

-- ----------------------------
-- Table structure for t_community
-- ----------------------------
DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '社区名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在地区',
  `cover_area` int NULL DEFAULT NULL COMMENT '占地面积',
  `community_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社区图片（英文逗号分割）',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_community
-- ----------------------------
INSERT INTO `t_community` VALUES (1, '万象城', '江苏省南京市六合区溧阳街道', 3580, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city02.jpg', '繁华都市', 0, 1, '2023-05-24 21:26:15', 1, '2023-05-24 21:26:18');
INSERT INTO `t_community` VALUES (2, '汤臣一品', '中国上海经合区', 5820, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city04.jpg', '繁华都市', 0, 1, '2023-05-24 21:29:47', 1, '2023-05-24 21:29:53');
INSERT INTO `t_community` VALUES (3, '左岸汀芷', '中国北京', 468, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华都市', 0, 1, '2023-05-25 18:55:53', 1, '2023-05-26 18:05:20');
INSERT INTO `t_community` VALUES (4, '璀璨天城', '中国南京', 2321, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华都市', 0, 1, '2023-05-27 14:10:53', 1, '2023-05-27 14:10:56');
INSERT INTO `t_community` VALUES (5, '欧鼎华庭', '中国南京', 4357, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华都市', 0, 1, '2023-05-27 14:13:12', 1, '2023-05-27 14:13:14');
INSERT INTO `t_community` VALUES (6, '四季云顶', '中国南京', 3490, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华都市', 0, 1, '2023-05-27 14:13:51', 1, '2023-05-27 14:13:53');
INSERT INTO `t_community` VALUES (7, '御水湾', '中国南京', 876, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华都市', 0, 1, '2023-05-27 14:14:26', 1, '2023-05-27 14:14:29');
INSERT INTO `t_community` VALUES (8, '风生水邸', '中国南京', 690, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华社区', 0, 1, '2023-05-27 14:14:56', 1, '2023-05-27 14:14:58');
INSERT INTO `t_community` VALUES (9, '紫光阁', '中国无锡', 768, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华社区', 0, 1, '2023-05-27 14:15:30', 1, '2023-05-27 14:15:33');
INSERT INTO `t_community` VALUES (10, '中南海', '中国无锡', 2589, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华社区', 0, 1, '2023-05-27 14:16:05', 1, '2023-05-27 14:16:08');
INSERT INTO `t_community` VALUES (11, '永恒国度', '中国无锡', 3469, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city03.jpg', '繁华社区', 0, 1, '2023-05-27 14:16:43', 1, '2023-05-27 14:16:45');
INSERT INTO `t_community` VALUES (12, '守望之海', '江苏省南京市六合区溧阳街道', 3580, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/city02.jpg', 'test', 0, 1, '2023-05-28 16:46:42', 1, '2023-05-28 16:46:42');

-- ----------------------------
-- Table structure for t_complaint
-- ----------------------------
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE `t_complaint`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `user_id` bigint NOT NULL COMMENT '投诉人id',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '投诉类型(0:物业服务，1:社区服务)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投诉标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '投诉内容',
  `imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '处理状态（0：未处理，1：处理中，2：已处理，3：已评价）',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `employee_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人id，逗号分隔',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `evaluate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `evaluate_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_complaint
-- ----------------------------
INSERT INTO `t_complaint` VALUES (1, 1, 1, 0, '1', '1', '', 0, '', '10000,10004,10003', NULL, '', NULL, 0, '2023-05-26 10:52:59', '2023-05-29 14:10:46', 0, 10000);
INSERT INTO `t_complaint` VALUES (2, 1, 1, 1, '111', '111222', '', 0, '', '10004,10005', NULL, '', NULL, 0, '2023-05-26 11:00:44', '2023-05-26 11:01:00', 10000, 10000);

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门状态',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATOR` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------

-- ----------------------------
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常 1：故障）',
  `device_type` bigint NOT NULL COMMENT '设备类别id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备位置',
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备二维码url',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES (1, '西门门禁', 0, 1, '西门', '#', 0, '2023-05-25 07:27:01', 10000, '2023-05-25 07:27:01', 10000);
INSERT INTO `t_device` VALUES (2, '西门保安亭监控', 0, 2, '西门保安亭', '#', 0, '2023-05-25 09:24:53', 10000, '2023-05-25 09:24:53', 10000);
INSERT INTO `t_device` VALUES (3, '公摊电表', 0, 3, '', '', 0, '2023-05-26 10:27:51', 10000, '2023-05-26 10:27:51', 10000);
INSERT INTO `t_device` VALUES (4, '房间电表', 0, 3, '', '', 0, '2023-05-26 10:46:39', 10000, '2023-05-26 10:46:39', 10000);
INSERT INTO `t_device` VALUES (5, '海康威视监控', 0, 4, '', '', 0, '2023-05-26 11:20:13', 10000, '2023-05-26 11:20:13', 10000);
INSERT INTO `t_device` VALUES (6, '北门门禁', 0, 1, '北门', '#', 0, '2023-05-31 11:23:13', 10000, '2023-05-31 11:23:13', 10000);
INSERT INTO `t_device` VALUES (7, '南门门禁', 0, 1, '南门', '#', 0, '2023-05-31 11:23:35', 10000, '2023-05-31 11:23:35', 10000);
INSERT INTO `t_device` VALUES (8, '东门门禁', 0, 1, '东门', '#', 0, '2023-05-31 11:23:50', 10000, '2023-05-31 11:23:50', 10000);

-- ----------------------------
-- Table structure for t_device_type
-- ----------------------------
DROP TABLE IF EXISTS `t_device_type`;
CREATE TABLE `t_device_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型描述',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT '是否启用 0-启用 1-禁用',
  `orderd` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device_type
-- ----------------------------
INSERT INTO `t_device_type` VALUES (1, '门禁', '门禁', 0, 3, 0, '2023-05-25 06:29:16', 10000, '2023-05-25 06:34:00', 10000);
INSERT INTO `t_device_type` VALUES (2, '监控', '监控', 0, 2, 0, '2023-05-25 06:34:26', 10000, '2023-05-25 06:34:26', 10000);
INSERT INTO `t_device_type` VALUES (3, '仪表', '仪表', 0, 0, 0, '2023-05-26 10:12:57', 10000, '2023-05-26 10:12:57', 10000);
INSERT INTO `t_device_type` VALUES (4, '监控', '监控', 0, 0, 0, '2023-05-26 11:19:43', 10000, '2023-05-26 11:19:43', 10000);

-- ----------------------------
-- Table structure for t_door
-- ----------------------------
DROP TABLE IF EXISTS `t_door`;
CREATE TABLE `t_door`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `community_id` bigint NOT NULL COMMENT '所属小区',
  `door_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁图片',
  `door_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁名称',
  `sys_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置码',
  `online_status` tinyint NOT NULL DEFAULT 0 COMMENT '门禁在线状态（0-在线，1-离线）',
  `allow_owed` tinyint NOT NULL DEFAULT 0 COMMENT '允许欠费通行 0-允许 1-不允许',
  `allow_visit` tinyint NOT NULL DEFAULT 0 COMMENT '允许访客通行  0-允许 1-不允许',
  `need_tel` tinyint NOT NULL DEFAULT 1 COMMENT '需要访客手机号 0-需要 1-不需要',
  `need_id_card` tinyint NOT NULL DEFAULT 1 COMMENT '需要访客身份证 0-需要 1-不需要',
  `allow_face` tinyint NOT NULL DEFAULT 0 COMMENT '允许人脸识别 0-允许 1-不允许',
  `allow_finger` tinyint NOT NULL DEFAULT 0 COMMENT '允许指纹识别  0-允许 1-不允许',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_door
-- ----------------------------
INSERT INTO `t_door` VALUES (1, 1, 2, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '汤臣一品西门', 'dsafdasd', 0, 1, 0, 0, 0, 1, 0, 0, '2023-05-29 14:54:15', 10000, '2023-06-01 10:54:15', 10000);
INSERT INTO `t_door` VALUES (2, 1, 1, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '万象城西门', 'asfsjkfjalsdf', 0, 0, 0, 1, 0, 0, 0, 0, '2023-05-29 16:58:23', 10000, '2023-06-01 10:55:36', 10000);
INSERT INTO `t_door` VALUES (3, 6, 1, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '万象城北门', '3213413', 1, 0, 0, 1, 1, 0, 0, 0, '2023-05-31 11:24:11', 10000, '2023-06-01 10:56:58', 10000);
INSERT INTO `t_door` VALUES (4, 7, 1, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '万象城南门', '87678', 0, 0, 0, 1, 1, 0, 0, 0, '2023-05-31 11:24:27', 10000, '2023-06-01 10:54:15', 10000);
INSERT INTO `t_door` VALUES (5, 8, 1, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '万象城东门', '67865453434342', 0, 0, 0, 1, 1, 0, 0, 0, '2023-05-31 11:24:41', 10000, '2023-06-01 10:55:25', 10000);
INSERT INTO `t_door` VALUES (6, 7, 2, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/image/door.png', '汤臣一品南门', '513165', 0, 0, 0, 1, 1, 0, 0, 0, '2023-05-31 11:25:32', 10000, '2023-06-01 10:54:15', 10000);

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `property_id` int NOT NULL COMMENT '物业id',
  `username` int NOT NULL COMMENT '登录账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `salt` int NOT NULL COMMENT '盐值',
  `account_status` int NULL DEFAULT NULL COMMENT '账号状态(1:正常,2:停用,3:冻结,4:删除)',
  `online_status` tinyint(1) NOT NULL COMMENT '是否在线(0:离线 1:在线)',
  `delete_flag` tinyint(1) NOT NULL COMMENT '(0-未删除，1-已删除)',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `community_id` int NOT NULL COMMENT '小区ID',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物业账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee_info
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_info`;
CREATE TABLE `t_employee_info`  (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `employee_id` int NOT NULL COMMENT '员工id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职务',
  `gender` int NOT NULL COMMENT '(0:保密,1:男,2:女)',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `vx_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信账号',
  `job_number` int NULL DEFAULT NULL COMMENT '工号',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '籍贯',
  `graduate_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `graduation_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业时间',
  `education` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所学专业',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order` int NOT NULL COMMENT '排序字段',
  `last_login_time` timestamp(0) NOT NULL COMMENT '最后登录时间',
  `delete_flag` tinyint(1) NOT NULL COMMENT '(0-未删除，1-已删除)',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_employee_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id',
  `building_id` bigint NULL DEFAULT NULL COMMENT '楼宇id',
  `house_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房间号',
  `house_area` int NULL DEFAULT NULL COMMENT '建筑面积',
  `house_status` tinyint NULL DEFAULT 0 COMMENT '房屋状态（0：未使用 1：使用中）',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `community_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小区名称',
  `building_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '楼宇名称',
  `units` int NULL DEFAULT NULL COMMENT '所在单元',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (1, 1, 1, 'A-101', 123, 1, '四面通透', 0, 1, '2023-05-24 18:33:46', 1, '2023-05-24 18:33:49', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (2, 1, 1, 'A-102', 124, 1, 'ok', 0, 1, '2023-05-24 00:00:00', 1, '2023-05-28 13:29:22', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (3, 1, 1, 'A-103', 124, 0, '四面通透', 0, 1, '2023-05-24 21:13:33', 1, '2023-05-24 21:14:44', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (4, 1, 1, 'A-104', 124, 0, 'ok', 0, 1, '2023-05-24 21:13:36', 1, '2023-05-24 21:14:47', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (5, 1, 1, 'A-105', 124, 0, '四面通透', 0, 1, '2023-05-24 21:13:38', 1, '2023-05-24 21:14:49', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (6, 1, 1, 'B-106', 124, 0, 'ok', 0, 1, '2023-05-24 21:13:41', 1, '2023-05-24 21:14:52', '万象城', '博闻居', 2);
INSERT INTO `t_house` VALUES (7, 1, 1, 'B-107', 124, 0, NULL, 0, 1, '2023-05-24 21:13:43', 1, '2023-05-24 21:14:55', '万象城', '博闻居', 2);
INSERT INTO `t_house` VALUES (8, 1, 1, 'B-108', 124, 0, NULL, 0, 1, '2023-05-24 21:13:47', 1, '2023-05-24 21:14:57', '万象城', '博闻居', 2);
INSERT INTO `t_house` VALUES (9, 1, 1, 'B-109', 124, 0, NULL, 0, 1, '2023-05-24 21:13:49', 1, '2023-05-24 21:14:59', '万象城', '博闻居', 2);
INSERT INTO `t_house` VALUES (10, 1, 1, 'B-110', 124, 0, NULL, 0, 1, '2023-05-24 21:13:52', 1, '2023-05-24 21:15:02', '万象城', '博闻居', 2);
INSERT INTO `t_house` VALUES (11, 2, 2, 'A-101', 124, 0, NULL, 0, 1, '2023-05-24 21:13:55', 1, '2023-05-24 21:15:04', '汤臣一品', '二号楼', 1);
INSERT INTO `t_house` VALUES (12, 2, 2, 'A-102', 124, 0, NULL, 0, 1, '2023-05-24 21:13:58', 1, '2023-05-24 21:15:07', '汤臣一品', '二号楼', 1);
INSERT INTO `t_house` VALUES (13, 2, 2, 'A-103', 124, 0, NULL, 0, 1, '2023-05-24 21:14:00', 1, '2023-05-24 21:15:09', '汤臣一品', '二号楼', 1);
INSERT INTO `t_house` VALUES (14, 2, 2, 'A-104', 124, 0, NULL, 0, 1, '2023-05-24 21:14:17', 1, '2023-05-24 21:15:11', '汤臣一品', '二号楼', 1);
INSERT INTO `t_house` VALUES (15, 2, 2, 'A-105', 124, 0, NULL, 0, 1, '2023-05-24 21:14:24', 1, '2023-05-24 21:15:14', '汤臣一品', '二号楼', 1);
INSERT INTO `t_house` VALUES (16, 2, 2, 'B-106', 124, 0, NULL, 0, 1, '2023-05-24 21:14:27', 1, '2023-05-24 21:15:17', '汤臣一品', '二号楼', 2);
INSERT INTO `t_house` VALUES (17, 2, 2, 'B-107', 124, 0, NULL, 0, 1, '2023-05-24 21:14:29', 1, '2023-05-24 21:15:20', '汤臣一品', '二号楼', 2);
INSERT INTO `t_house` VALUES (18, 2, 2, 'B-108', 124, 0, NULL, 0, 1, '2023-05-24 21:14:31', 1, '2023-05-24 21:15:22', '汤臣一品', '二号楼', 2);
INSERT INTO `t_house` VALUES (19, 2, 2, 'B-109', 124, 0, NULL, 0, 1, '2023-05-24 21:14:34', 1, '2023-05-24 21:15:24', '汤臣一品', '二号楼', 2);
INSERT INTO `t_house` VALUES (20, 2, 2, 'B-110', 124, 0, NULL, 0, 1, '2023-05-24 21:14:36', 1, '2023-05-24 21:15:27', '汤臣一品', '二号楼', 2);
INSERT INTO `t_house` VALUES (24, 1, 3, 'H-109', 222, 0, '1212', 0, NULL, '2023-05-28 00:00:00', NULL, '2023-05-28 14:18:40', '万象城', '思齐楼', 2);

-- ----------------------------
-- Table structure for t_inspection_item
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection_item`;
CREATE TABLE `t_inspection_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '巡检项目id',
  `community_id` bigint NULL DEFAULT NULL COMMENT '所属小区',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡检项目名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格型号',
  `factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌厂商',
  `insurance_factory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '维保厂商',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目图片',
  `coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '坐标',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：启用，1：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡检项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection_item
-- ----------------------------
INSERT INTO `t_inspection_item` VALUES (1, 1, '电梯', 'tx132123', 'asds', 'asdsa', 'https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800', '231,622.542', '仔细检查', 1, 0, 10000, '2023-05-25 13:23:31', 10000, '2023-05-25 13:23:47');
INSERT INTO `t_inspection_item` VALUES (2, 1, '27栋1单元电梯', 'tx13132', 'asds', 'sadas', 'https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800', '13.16,354,321', '仔细检查', 1, 0, 10000, '2023-05-25 05:38:43', 10000, '2023-05-25 05:46:21');
INSERT INTO `t_inspection_item` VALUES (3, 1, '27栋1单元电梯3aaaaa', 'ta13132', 'asds', 'sadas', 'https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800', '13.16,354,321', '仔细检查', 1, 0, 10000, '2023-05-25 06:03:12', 10000, '2023-05-25 16:08:35');
INSERT INTO `t_inspection_item` VALUES (4, 2, '第一栋电梯啊啊啊', '大声', '阿斯顿', '阿斯顿撒', 'http://10.22.242.105:9000/litao-bucket/20230526/backiee-129378_66871.jpg', '5432，53132', '仔细检查', 1, 0, 10000, '2023-05-25 17:10:06', 10000, '2023-05-29 20:21:22');
INSERT INTO `t_inspection_item` VALUES (23, 1, '啊啊啊', '啊实打实', '阿斯顿', '阿斯顿撒', '', '118.94244,32.118454', '阿斯顿', 1, 0, 10000, '2023-05-28 19:48:57', 10000, '2023-05-29 20:21:22');
INSERT INTO `t_inspection_item` VALUES (24, 1, '测试0529', 'AC321', '无', '万象城', '', '120.914727,31.40681', '无', 1, 0, 10000, '2023-05-29 11:26:10', 10000, '2023-05-29 14:10:38');
INSERT INTO `t_inspection_item` VALUES (25, 1, '最终测试', 'AC_asdsaf', 'asdsad', 'asdsa', '', '118.835347,32.124867', '认真工作', 1, 0, 10000, '2023-05-29 14:16:11', 10000, '2023-05-29 14:16:11');

-- ----------------------------
-- Table structure for t_light
-- ----------------------------
DROP TABLE IF EXISTS `t_light`;
CREATE TABLE `t_light`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `light_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `open_status` tinyint NOT NULL DEFAULT 0 COMMENT '开关（0：开启1：关闭）',
  `community_id` bigint NOT NULL COMMENT '设备所属小区id',
  `sn_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sn码',
  `port_num` int NOT NULL COMMENT '端口数量',
  `online_status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：在线 1：离线）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灯控表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_light
-- ----------------------------

-- ----------------------------
-- Table structure for t_mall
-- ----------------------------
DROP TABLE IF EXISTS `t_mall`;
CREATE TABLE `t_mall`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `mall_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商铺编号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `mall_area` int NULL DEFAULT NULL COMMENT '建筑面积',
  `mall_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商铺类型',
  `mall_status` tinyint NOT NULL DEFAULT 0 COMMENT '商铺状态(0：未售出 1：已售出)',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mall
-- ----------------------------
INSERT INTO `t_mall` VALUES (1, 1, 1, 'A101', '江苏南京', 46, '商业街商铺', 1, 0, 1, '2023-05-24 00:00:00', 1, '2023-05-29 11:22:43');
INSERT INTO `t_mall` VALUES (2, 1, 2, 'B202', '江苏南京', 62, '住宅底层商铺', 1, 0, 1, '2023-05-24 21:48:23', 1, '2023-05-24 21:48:26');
INSERT INTO `t_mall` VALUES (3, 2, 1, 'C-303', '江苏无锡', 85, '商业街商铺', 1, 0, 1, '2023-05-28 20:11:40', 1, '2023-05-28 20:11:42');
INSERT INTO `t_mall` VALUES (5, 2, 6, 'A-102', '江苏南京', 65, '商业街店铺', 0, 0, 1, '2023-05-30 14:12:41', 1, '2023-05-30 14:12:43');
INSERT INTO `t_mall` VALUES (9, 0, 0, '', '', 0, '', 0, 0, 0, NULL, 0, NULL);

-- ----------------------------
-- Table structure for t_meter
-- ----------------------------
DROP TABLE IF EXISTS `t_meter`;
CREATE TABLE `t_meter`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `meter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仪表名称',
  `community_id` bigint NOT NULL COMMENT '所属小区id',
  `meter_type` tinyint NOT NULL COMMENT '仪表位置 0-房间表 1-公摊表',
  `price` double(11, 2) NOT NULL COMMENT '价格',
  `start_num` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '开始数值',
  `now_num` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '当前数值',
  `max` double(11, 2) NOT NULL COMMENT '最大数值',
  `total_use` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '总用量',
  `online_status` tinyint NOT NULL DEFAULT 0 COMMENT '在线状态 0-在线 1-离线',
  `gate_status` tinyint NOT NULL DEFAULT 0 COMMENT '通电状态 0-合闸 1-关闸',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仪表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_meter
-- ----------------------------
INSERT INTO `t_meter` VALUES (1, 3, '公摊电表', 1, 1, 5.20, 0.00, 0.00, 100.50, 0.00, 0, 0, 0, '2023-05-26 10:37:20', 10000, '2023-05-26 10:37:20', 10000);
INSERT INTO `t_meter` VALUES (2, 4, '卧室电表', 2, 0, 1.00, 0.00, 0.00, 110.00, 0.00, 0, 1, 0, '2023-05-26 10:45:57', 10000, '2023-05-26 10:45:57', 10000);

-- ----------------------------
-- Table structure for t_monitor
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor`;
CREATE TABLE `t_monitor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `monitor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '监控名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常 1：故障）',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT '0-启用 1-禁用',
  `monitor_type` bigint NOT NULL COMMENT '监控分组id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '监控直播url',
  `orderd` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_monitor
-- ----------------------------
INSERT INTO `t_monitor` VALUES (1, 5, 2, '西门监控', 0, 0, 1, '', 0, 0, '2023-05-26 11:21:46', 10000, '2023-05-26 11:53:45', 10000);

-- ----------------------------
-- Table structure for t_monitor_type
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor_type`;
CREATE TABLE `t_monitor_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型描述',
  `orderd` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_monitor_type
-- ----------------------------
INSERT INTO `t_monitor_type` VALUES (1, '红外监控', '红外监控', 0, 0, '2023-05-26 11:46:57', 10000, '2023-05-26 11:46:57', 10000);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `admin_id` bigint NOT NULL COMMENT '发布人id',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '通知类型(0:消杀通知 1：物业通知 2：缴费通知)',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告内容',
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '附件',
  `read_number` int NOT NULL DEFAULT 0 COMMENT '阅读数',
  `notice_way` tinyint NOT NULL DEFAULT 0 COMMENT '提醒方式（0：系统消息 1：短信通知）',
  `notice_range` tinyint NOT NULL DEFAULT 0 COMMENT '接受范围(0:全部楼宇，1：指定楼宇)',
  `publish_time` datetime(0) NOT NULL COMMENT '发布时间',
  `review` tinyint NULL DEFAULT 0 COMMENT '审核(0:未审核，1：已审核，2:审核不通过)',
  `review_user_id` bigint NULL DEFAULT NULL COMMENT '审核人id',
  `review_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, 2, 10000, 0, '消杀通知1', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-29 12:57:08', 10000, 10000);
INSERT INTO `t_notice` VALUES (2, 2, 10000, 0, '消杀通知2', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 1, NULL, NULL, 0, '2023-05-24 19:26:57', '2023-05-30 13:45:43', 10000, 10000);
INSERT INTO `t_notice` VALUES (3, 2, 10000, 0, '消杀通知3', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:05', '2023-05-24 22:21:05', 10000, 10000);
INSERT INTO `t_notice` VALUES (4, 2, 10000, 0, '消杀通知4', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:07', '2023-05-24 22:21:07', 10000, 10000);
INSERT INTO `t_notice` VALUES (5, 2, 10000, 0, '消杀通知5', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:09', '2023-05-24 22:21:09', 10000, 10000);
INSERT INTO `t_notice` VALUES (6, 2, 10000, 0, '消杀通知6', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:25:37', '2023-05-24 22:25:37', 10000, 10000);
INSERT INTO `t_notice` VALUES (7, 2, 10000, 0, '消杀通知7', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 1, '2023-05-24 22:26:43', '2023-05-25 22:53:54', 10000, 10000);
INSERT INTO `t_notice` VALUES (8, 2, 10000, 0, '消杀通知8', '1', '', 0, 0, 1, '2023-05-31 16:00:00', 0, NULL, NULL, 1, '2023-05-25 23:30:45', '2023-05-25 23:31:03', 10000, 10000);
INSERT INTO `t_notice` VALUES (9, 1, 10000, 0, '消杀通知9', '1', '', 0, 0, 1, '2023-05-31 08:00:00', 0, NULL, NULL, 1, '2023-05-25 23:30:46', '2023-05-25 23:31:01', 10000, 10000);
INSERT INTO `t_notice` VALUES (10, 1, 10000, 0, '消杀通知10', 'test', '', 0, 0, 1, '2023-05-25 16:00:00', 0, NULL, NULL, 0, '2023-05-26 09:16:04', '2023-05-26 09:16:04', 10000, 10000);
INSERT INTO `t_notice` VALUES (11, 1, 10000, 2, '消杀通知11', '缴费通知测试', '', 0, 0, 0, '2023-05-26 16:00:00', 1, NULL, NULL, 0, '2023-05-26 21:08:47', '2023-05-29 22:57:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (12, 1, 10000, 2, '消杀通知12', '万象城缴费', '', 0, 0, 0, '2023-05-26 18:12:01', 1, NULL, NULL, 1, '2023-05-27 11:29:48', '2023-05-27 11:31:32', 10000, 10000);
INSERT INTO `t_notice` VALUES (13, 2, 10000, 0, '消杀通知13', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (14, 2, 10000, 0, '消杀通知14', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (15, 2, 10000, 0, '消杀通知15', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (16, 2, 10000, 0, '消杀通知16', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (17, 2, 10000, 0, '消杀通知17', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (18, 2, 10000, 0, '消杀通知18', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 3, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (19, 2, 10000, 0, '消杀通知19', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 3, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (20, 2, 10000, 0, '消杀通知20', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 3, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (21, 2, 10000, 0, '消杀通知21', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 3, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (22, 2, 10000, 0, '消杀通知22', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 3, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (23, 2, 10000, 0, '消杀通知23', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 7, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);

-- ----------------------------
-- Table structure for t_notice_reader
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_reader`;
CREATE TABLE `t_notice_reader`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notice_id` bigint NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '阅读人id',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告阅读记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice_reader
-- ----------------------------
INSERT INTO `t_notice_reader` VALUES (1, 1, 1, 0, '2023-05-24 22:38:44', '2023-05-24 22:38:44');
INSERT INTO `t_notice_reader` VALUES (2, 2, 1, 0, '2023-05-24 22:39:02', '2023-05-24 22:39:02');
INSERT INTO `t_notice_reader` VALUES (4, 3, 2, 0, '2023-05-25 07:59:23', '2023-05-25 07:59:23');
INSERT INTO `t_notice_reader` VALUES (5, 4, 2, 0, '2023-05-25 08:08:47', '2023-05-25 08:08:47');
INSERT INTO `t_notice_reader` VALUES (6, 5, 2, 0, '2023-05-25 09:16:17', '2023-05-25 09:16:17');
INSERT INTO `t_notice_reader` VALUES (7, 6, 2, 0, '2023-05-28 21:33:27', '2023-05-28 21:33:27');
INSERT INTO `t_notice_reader` VALUES (8, 22, 1, 0, '2023-05-31 20:13:14', '2023-05-31 20:13:14');
INSERT INTO `t_notice_reader` VALUES (9, 21, 1, 0, '2023-05-31 20:14:19', '2023-05-31 20:14:19');
INSERT INTO `t_notice_reader` VALUES (10, 20, 1, 0, '2023-06-01 10:01:57', '2023-06-01 10:01:57');
INSERT INTO `t_notice_reader` VALUES (11, 23, 1, 0, '2023-06-01 10:03:33', '2023-06-01 10:03:33');
INSERT INTO `t_notice_reader` VALUES (12, 19, 1, 0, '2023-06-01 11:28:04', '2023-06-01 11:28:04');
INSERT INTO `t_notice_reader` VALUES (13, 18, 1, 0, '2023-06-01 14:19:03', '2023-06-01 14:19:03');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户表主键',
  `comminity_id` bigint NULL DEFAULT NULL COMMENT '社区表',
  `bill_id` bigint NULL DEFAULT NULL COMMENT '账单表主键',
  `park_record_id` bigint NULL DEFAULT NULL COMMENT '停车记录表id',
  `order_type` tinyint NULL DEFAULT NULL COMMENT '订单类型 0：购买车位订单1：租赁车位订单2：停车订单3：水费4：电费5：物业费',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单单价',
  `amount` double NULL DEFAULT 0 COMMENT '订单消费量，税费电费，物业费',
  `money` double NULL DEFAULT 0 COMMENT '收费金额',
  `status` tinyint NULL DEFAULT 0 COMMENT '订单状态（0：未完成 1：已完成）',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主表主键',
  `house_id` bigint NULL DEFAULT 12 COMMENT '房屋表主键',
  `end_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (2, 2, NULL, 2, 2, 4, '1232', 12, 32.2, 0, NULL, 1, '2023-05-25 19:26:25', 10000, 10000, '2023-05-25 19:26:25', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (3, 6, NULL, 0, 3, 5, '1', 43, 12.53, 0, NULL, 0, '2023-05-25 19:27:27', 0, 0, '2023-05-25 19:27:27', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (4, 3, NULL, 1, 1, 3, '1', 132, 572, 0, NULL, 1, '2023-05-26 20:54:24', 10000, 10000, '2023-05-26 20:54:24', 13, 15, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (5, 4, NULL, 3, 2, 4, '23', 12, 903.3, 0, NULL, 0, '2023-05-26 20:54:24', 10000, 10000, '2023-05-26 20:54:24', 14, 15, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (6, 4, NULL, 4, 2, 4, '85', 22, 903.3, 0, NULL, 0, '2023-05-26 20:54:24', 10000, 10000, '2023-05-26 20:54:24', 14, 15, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (7, 1, NULL, 3, 2, 4, '775', 43, 32.2, 0, NULL, 1, '2023-05-25 19:26:25', 10000, 10000, '2023-05-25 19:26:25', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (8, 1, NULL, 4, 2, 3, '54', 12, 32.2, 1, NULL, 1, '2023-05-25 19:26:25', 10000, 10000, '2023-05-25 19:26:25', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (9, 1, NULL, 5, 2, 5, '23', 44, 32.2, 0, NULL, 1, '2023-05-25 19:26:25', 10000, 10000, '2023-05-25 19:26:25', 12, 1, '2023-05-27 15:55:05');

-- ----------------------------
-- Table structure for t_owner
-- ----------------------------
DROP TABLE IF EXISTS `t_owner`;
CREATE TABLE `t_owner`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户唯一标识',
  `house_id` bigint NOT NULL COMMENT '房屋id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '绑定业主id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别(0:保密 1:男 2:女)',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `identity_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `e_contacts` json NULL COMMENT '紧急联系人信息(json)',
  `identity` tinyint NOT NULL COMMENT '身份标识(0:业主 1:家属 2:租户)',
  `default_address` tinyint NOT NULL DEFAULT 0 COMMENT '默认地址(0：否 1：是)',
  `state` tinyint NOT NULL COMMENT '状态(0:未审核1:已通过2:未通过)',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识(0:未删除 1:已删除)',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_owner
-- ----------------------------
INSERT INTO `t_owner` VALUES (1, 2, 1, 1, '王晓刚', 1, '188888888', '321302198006232359', '{\"phone\": \"18936950345\", \"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 1, 1, 0, 1, '2023-05-25 22:06:53', 1, '2023-05-25 22:06:55');
INSERT INTO `t_owner` VALUES (2, 2, 2, 1, '王晓刚', 1, '18888888888', '321302198006232359', '{\"phone\": \"18936950345\", \"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 0, 1, 0, 1, '2023-05-27 14:34:44', 1, '2023-05-27 14:34:47');
INSERT INTO `t_owner` VALUES (3, NULL, 1, 1, '张三', 1, '13838489572', '1', NULL, 1, 1, 1, 0, 1, '2023-05-27 14:44:53', 1, '2023-05-27 14:44:55');
INSERT INTO `t_owner` VALUES (4, NULL, 1, 1, '王五', 1, '18888523489', '', NULL, 1, 0, 1, 0, 2, '2023-05-27 22:30:04', 2, '2023-05-27 22:30:04');
INSERT INTO `t_owner` VALUES (5, NULL, 2, 2, 'test', 1, '15935765429', '', NULL, 2, 0, 1, 1, 2, '2023-05-28 11:05:53', 2, '2023-05-28 11:34:14');
INSERT INTO `t_owner` VALUES (7, 5, 11, NULL, '蔡徐坤', 0, '16666666666', '320301198803172347', '{\"phone\": \"18936950345\", \"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 0, 2, 0, 1, '2023-05-30 09:11:22', 10000, '2023-05-30 10:45:35');
INSERT INTO `t_owner` VALUES (8, 6, 16, NULL, 'flobby', 0, '18962521753', '1', '[]', 0, 0, 1, 0, 6, '2023-05-30 17:00:05', 6, '2023-05-30 17:00:08');
INSERT INTO `t_owner` VALUES (9, 1, 1, 1, '123', 0, '123', '123', NULL, 1, 0, 1, 1, 1, '2023-05-31 11:32:00', 1, '2023-05-31 11:32:00');
INSERT INTO `t_owner` VALUES (10, 1, 2, 1, 'kunkun', 0, '110', '110', NULL, 1, 0, 1, 1, 1, '2023-05-31 11:32:38', 1, '2023-05-31 11:32:38');
INSERT INTO `t_owner` VALUES (11, 1, 13, 1, 'aikun', 1, '123', '123', NULL, 1, 0, 1, 1, 1, '2023-05-31 11:35:40', 1, '2023-05-31 11:35:40');
INSERT INTO `t_owner` VALUES (12, 1, 4, 1, '123坤坤', 0, '111', '111', NULL, 1, 0, 1, 1, 1, '2023-05-31 11:36:02', 1, '2023-05-31 11:36:02');
INSERT INTO `t_owner` VALUES (13, 1, 1, 1, '123ddd', 1, '123', '123', NULL, 1, 0, 1, 0, 1, '2023-05-31 11:43:18', 1, '2023-05-31 11:43:18');
INSERT INTO `t_owner` VALUES (14, 1, 11, 1, 'aikun123', 0, '123', '123', NULL, 1, 0, 1, 1, 1, '2023-05-31 11:44:32', 1, '2023-05-31 11:44:32');
INSERT INTO `t_owner` VALUES (15, 6, 10, NULL, 'jjjcx', 0, '18962521753', '123', '[]', 1, 0, 1, 0, 1, '2023-06-01 13:50:28', 1, '2023-06-01 13:50:31');

-- ----------------------------
-- Table structure for t_park
-- ----------------------------
DROP TABLE IF EXISTS `t_park`;
CREATE TABLE `t_park`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `park_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停车场名称',
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `carport_number` int NULL DEFAULT NULL COMMENT '车位数量',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：开启 1：关闭）',
  `park_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停车场图',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `price` double NULL DEFAULT NULL COMMENT '单价（按小时收费）;10.00',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车场表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_park
-- ----------------------------
INSERT INTO `t_park` VALUES (1, 1, '万象城地下停车场', '1599537658', '江苏南京', 450, 1, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/wallhaven-y8mlp7.jpg', '不足一小时按一小时收费', 10, 0, 1, '2023-05-24 00:00:00', 1, '2023-05-24 21:57:10');
INSERT INTO `t_park` VALUES (2, 1, '万象城室外停车场', '1599537658', '江苏南京', 320, 0, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/wallhaven-vmx17m.jpg', '不足一小时按一小时收费', 10, 0, 1, '2023-05-24 21:58:33', 1, '2023-05-24 21:58:36');
INSERT INTO `t_park` VALUES (3, 2, '汤臣一品室外停车场', '1988765422222', '上海外滩', 689, 0, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/wallhaven-vmx17m.jpg', '不足一小时按一小时收费', 25, 0, 0, '2023-05-29 00:00:00', 0, '2023-05-29 12:26:34');
INSERT INTO `t_park` VALUES (4, 2, '汤臣一品地下停车场', '1988762232', '上海外滩', 989, 1, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/city/wallhaven-vmx17m.jpg', '不足一小时按一小时收费', 25, 0, 0, '2023-05-29 00:00:00', 0, '2023-05-29 12:30:28');

-- ----------------------------
-- Table structure for t_park_record
-- ----------------------------
DROP TABLE IF EXISTS `t_park_record`;
CREATE TABLE `t_park_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `car_id` bigint NULL DEFAULT NULL COMMENT '车辆id',
  `park_id` bigint NULL DEFAULT NULL COMMENT '停车场id',
  `door_id` bigint NULL DEFAULT NULL COMMENT '设备id',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '进入时间',
  `leave_time` datetime(0) NULL DEFAULT NULL COMMENT '离开时间',
  `price` double NULL DEFAULT NULL COMMENT '收费金额',
  `type` tinyint NULL DEFAULT 0 COMMENT '车辆类型（0：临时车辆 1：固定车辆）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT 1 COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT 1 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_park_record
-- ----------------------------
INSERT INTO `t_park_record` VALUES (1, 1, 1, 1, '2023-05-10 21:59:41', '2023-05-11 21:59:51', 250, 0, 0, 1, '2023-05-24 22:00:14', 1, '2023-05-24 22:00:16');
INSERT INTO `t_park_record` VALUES (2, 2, 3, 2, '2023-05-16 09:24:33', '2023-05-30 09:24:37', 3370, 0, 0, 1, '2023-05-30 09:24:48', 1, '2023-05-30 09:24:50');
INSERT INTO `t_park_record` VALUES (3, 3, 1, 2, '2023-05-30 09:26:08', '2023-05-30 09:26:11', 10, 0, 0, 1, '2023-05-30 09:26:18', 1, '2023-05-30 09:26:20');
INSERT INTO `t_park_record` VALUES (4, 4, 2, 1, '2023-05-29 09:26:38', '2023-05-30 09:26:43', 250, 1, 0, 1, '2023-05-30 09:26:51', 1, '2023-05-30 09:26:53');

-- ----------------------------
-- Table structure for t_pass_record
-- ----------------------------
DROP TABLE IF EXISTS `t_pass_record`;
CREATE TABLE `t_pass_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '业主id / 管理员id',
  `door_id` bigint NOT NULL COMMENT '闸机id',
  `pass_way` tinyint NOT NULL COMMENT '出入方式 0-刷卡 1-人脸 2-指纹 3-物业开门',
  `community_id` bigint NOT NULL COMMENT '小区id',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通行记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pass_record
-- ----------------------------
INSERT INTO `t_pass_record` VALUES (1, 1, 1, 1, 1, 0, '2023-05-29 21:03:21', 1, '2023-05-29 21:03:21', 1);
INSERT INTO `t_pass_record` VALUES (2, 1, 2, 0, 2, 0, '2023-05-29 21:03:37', 1, '2023-05-29 21:03:37', 1);
INSERT INTO `t_pass_record` VALUES (3, 2, 1, 2, 1, 0, '2023-05-29 21:03:55', 2, '2023-05-29 21:03:55', 2);
INSERT INTO `t_pass_record` VALUES (4, 6, 1, 1, 2, 0, '2023-05-30 17:14:50', 6, '2023-05-30 17:14:50', 6);
INSERT INTO `t_pass_record` VALUES (5, 6, 1, 1, 2, 0, '2023-05-31 11:35:37', 6, '2023-05-31 11:35:37', 6);
INSERT INTO `t_pass_record` VALUES (6, 6, 6, 1, 2, 0, '2023-05-31 11:35:51', 6, '2023-05-31 11:35:51', 6);
INSERT INTO `t_pass_record` VALUES (7, 6, 6, 0, 2, 0, '2023-05-31 19:08:33', 6, '2023-05-31 19:08:33', 6);
INSERT INTO `t_pass_record` VALUES (8, 10003, 2, 3, 1, 0, '2023-06-01 12:03:18', 10003, '2023-06-01 12:03:18', 10003);
INSERT INTO `t_pass_record` VALUES (9, 10003, 2, 3, 1, 0, '2023-06-01 12:19:49', 10003, '2023-06-01 12:19:49', 10003);
INSERT INTO `t_pass_record` VALUES (10, 10003, 4, 3, 1, 0, '2023-06-01 12:19:51', 10003, '2023-06-01 12:19:51', 10003);
INSERT INTO `t_pass_record` VALUES (11, 6, 1, 0, 2, 0, '2023-06-01 12:43:13', 6, '2023-06-01 12:43:13', 6);
INSERT INTO `t_pass_record` VALUES (12, 6, 5, 0, 1, 0, '2023-06-01 15:08:46', 6, '2023-06-01 15:08:46', 6);
INSERT INTO `t_pass_record` VALUES (13, 6, 1, 0, 2, 0, '2023-06-01 16:52:33', 6, '2023-06-01 16:52:33', 6);
INSERT INTO `t_pass_record` VALUES (14, 6, 6, 0, 2, 0, '2023-06-01 16:52:36', 6, '2023-06-01 16:52:36', 6);
INSERT INTO `t_pass_record` VALUES (15, 6, 1, 0, 2, 0, '2023-06-01 16:52:43', 6, '2023-06-01 16:52:43', 6);
INSERT INTO `t_pass_record` VALUES (16, 6, 5, 0, 1, 0, '2023-06-01 17:08:30', 6, '2023-06-01 17:08:30', 6);
INSERT INTO `t_pass_record` VALUES (17, 6, 5, 0, 1, 0, '2023-06-01 17:09:03', 6, '2023-06-01 17:09:03', 6);
INSERT INTO `t_pass_record` VALUES (18, 6, 4, 0, 1, 0, '2023-06-01 18:47:17', 6, '2023-06-01 18:47:17', 6);
INSERT INTO `t_pass_record` VALUES (19, 6, 5, 0, 1, 0, '2023-06-01 18:47:21', 6, '2023-06-01 18:47:21', 6);
INSERT INTO `t_pass_record` VALUES (20, 6, 5, 0, 1, 0, '2023-06-01 18:59:29', 6, '2023-06-01 18:59:29', 6);
INSERT INTO `t_pass_record` VALUES (21, 6, 3, 0, 1, 0, '2023-06-01 18:59:33', 6, '2023-06-01 18:59:33', 6);

-- ----------------------------
-- Table structure for t_pass_review
-- ----------------------------
DROP TABLE IF EXISTS `t_pass_review`;
CREATE TABLE `t_pass_review`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `owner_id` bigint NOT NULL COMMENT '业主id',
  `house_id` bigint NOT NULL COMMENT '房屋id',
  `face` tinyint NOT NULL DEFAULT 0 COMMENT '是否有人脸（0-无，1-有）',
  `finger` tinyint NOT NULL DEFAULT 0 COMMENT '是否有指纹（0-无，1-有）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '审核状态（0-待审核，1-通过，2-驳回',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pass_review
-- ----------------------------
INSERT INTO `t_pass_review` VALUES (1, 8, 16, 1, 1, 1, 0, '2023-05-29 20:11:12', 1, '2023-05-29 19:56:04', 10000);
INSERT INTO `t_pass_review` VALUES (2, 8, 16, 0, 0, 2, 0, '2023-05-29 19:59:02', 1, '2023-05-29 20:24:00', 10000);
INSERT INTO `t_pass_review` VALUES (3, 2, 2, 0, 1, 0, 0, '2023-05-29 19:59:40', 1, '2023-05-29 19:59:40', 1);
INSERT INTO `t_pass_review` VALUES (4, 15, 10, 1, 1, 2, 0, '2023-06-01 14:03:14', 6, '2023-06-01 14:03:14', 6);
INSERT INTO `t_pass_review` VALUES (6, 15, 10, 0, 0, 0, 0, '2023-06-01 20:20:10', 6, '2023-06-01 20:20:10', 6);

-- ----------------------------
-- Table structure for t_patrol_path
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_path`;
CREATE TABLE `t_patrol_path`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '所属小区',
  `way_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更路线名',
  `location_length` decimal(24, 6) NULL DEFAULT NULL COMMENT '定位距离(不能离开指定位置多少米)',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `type` tinyint NULL DEFAULT NULL COMMENT '线路类型(0：巡更点类型，1：巡检项目类型)',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更路线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_path
-- ----------------------------
INSERT INTO `t_patrol_path` VALUES (1, 1, '巡线路一', 12.000000, 1, 0, 1, 10000, '2023-05-26 21:02:14', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (2, 1, '巡线路二', 12.000000, 1, 0, 1, 10000, '2023-05-26 21:02:14', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (3, 2, '巡线路san', 12.000000, 1, 0, 1, 10000, '2023-05-26 21:02:14', 10000, '2023-05-29 14:31:11');
INSERT INTO `t_patrol_path` VALUES (4, 1, 'test', NULL, 1, NULL, 1, 10000, '2023-05-29 10:24:07', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (5, 0, '', 0.000000, 0, 0, 0, 0, '2023-05-29 10:38:37', 0, '2023-05-29 10:38:37');
INSERT INTO `t_patrol_path` VALUES (6, 0, '', 0.000000, 0, 0, 0, 0, '2023-05-29 10:39:14', 0, '2023-05-29 10:39:14');
INSERT INTO `t_patrol_path` VALUES (7, 1, '', NULL, 1, NULL, 1, 10000, '2023-05-29 13:46:11', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (8, 1, 'test2', NULL, 1, NULL, 1, 10000, '2023-05-29 13:47:01', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (9, 1, '111', NULL, 1, NULL, 1, 10000, '2023-05-29 13:47:17', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (10, 1, '', NULL, 1, NULL, 1, 10000, '2023-05-29 13:47:35', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (11, 1, '222', NULL, 0, NULL, 1, 10000, '2023-05-29 13:49:50', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (12, 1, '22', NULL, 1, NULL, 1, 10000, '2023-05-29 13:50:30', 10000, '2023-05-29 14:31:05');
INSERT INTO `t_patrol_path` VALUES (13, 1, '111', NULL, 1, NULL, 1, 10000, '2023-05-29 14:18:43', 10000, '2023-05-29 14:31:11');
INSERT INTO `t_patrol_path` VALUES (14, 1, '1', NULL, 1, NULL, 1, 10000, '2023-05-29 14:29:44', 10000, '2023-05-29 14:31:11');
INSERT INTO `t_patrol_path` VALUES (15, 1, '法庭法官官方', NULL, 1, NULL, 1, 10000, '2023-05-29 14:30:10', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (16, 2, 'jjk', NULL, 1, NULL, 1, 10000, '2023-05-29 14:30:50', 10000, '2023-05-29 14:31:11');
INSERT INTO `t_patrol_path` VALUES (17, 1, 'TTT', NULL, 1, NULL, 1, 10000, '2023-05-29 14:31:40', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (18, 1, 'DDDD', NULL, 1, NULL, 1, 10000, '2023-05-29 14:32:03', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (19, 2, '看看', NULL, 1, NULL, 1, 10000, '2023-05-29 14:34:28', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (20, 2, '222', NULL, 1, NULL, 1, 10000, '2023-05-29 14:35:39', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (21, 2, '222', NULL, 1, NULL, 1, 10000, '2023-05-29 14:35:54', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (22, 1, '1', NULL, 1, NULL, 1, 10000, '2023-05-29 14:38:08', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (23, 1, '事实上', NULL, 1, NULL, 1, 10000, '2023-05-29 14:42:26', 10000, '2023-05-29 15:41:21');
INSERT INTO `t_patrol_path` VALUES (24, 1, '退回给各个', NULL, 1, NULL, 1, 10000, '2023-05-29 14:43:49', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (25, 1, '烦烦烦', NULL, 1, NULL, 1, 10000, '2023-05-29 14:44:07', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (26, 11, '', NULL, 1, NULL, 1, 10000, '2023-05-29 14:45:28', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (27, 2, '时代的', NULL, 1, NULL, 1, 10000, '2023-05-29 14:55:55', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (28, 1, '事实上', NULL, 1, NULL, 1, 10000, '2023-05-29 14:59:00', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (29, 1, '按顺序输出是的', NULL, 1, NULL, 1, 10000, '2023-05-29 15:04:20', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (30, 2, '单独', NULL, 0, NULL, 1, 10000, '2023-05-29 15:04:33', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (31, 1, '3呃呃呃', NULL, 1, NULL, 1, 10000, '2023-05-29 15:09:20', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (32, 1, '111', NULL, 1, NULL, 1, 10000, '2023-05-29 15:10:53', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (33, 2, '很好', NULL, 1, NULL, 1, 10000, '2023-05-29 15:20:30', 10000, '2023-05-29 15:41:25');
INSERT INTO `t_patrol_path` VALUES (34, 1, 'sad', NULL, 1, NULL, 1, 10000, '2023-05-29 15:28:24', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (35, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:32:23', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (36, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:34:40', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (37, 1, 'aasd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:35:30', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (38, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:37:55', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (39, 1, 'gg', NULL, 1, NULL, 1, 10000, '2023-05-29 15:41:16', 10000, '2023-05-29 15:41:28');
INSERT INTO `t_patrol_path` VALUES (40, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:43:59', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (41, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:45:11', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (42, 1, 'asd', NULL, 1, NULL, 1, 10000, '2023-05-29 15:45:24', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (43, 1, 'asdas', NULL, 1, NULL, 1, 10000, '2023-05-29 15:45:42', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (44, 1, '测试一', NULL, 1, NULL, 1, 10000, '2023-05-29 15:47:43', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (45, 1, '测试二', NULL, 1, NULL, 1, 10000, '2023-05-29 15:52:26', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (46, 1, '测试三', NULL, 1, NULL, 1, 10000, '2023-05-29 15:54:05', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (47, 1, '测试四', NULL, 1, NULL, 1, 10000, '2023-05-29 15:57:09', 10000, '2023-05-29 16:05:07');
INSERT INTO `t_patrol_path` VALUES (48, 1, 'test1', NULL, 1, 1, 1, 10000, '2023-05-29 16:05:19', 10000, '2023-05-29 16:11:28');
INSERT INTO `t_patrol_path` VALUES (49, 1, 'test1', NULL, 1, 1, 1, 10000, '2023-05-29 16:11:20', 10000, '2023-05-29 16:11:28');
INSERT INTO `t_patrol_path` VALUES (50, 1, 'test1', 111.000000, 0, 0, 1, 10000, '2023-05-29 16:11:42', 10000, '2023-05-29 19:11:20');
INSERT INTO `t_patrol_path` VALUES (51, 2, 'test2', NULL, 1, 1, 1, 10000, '2023-05-29 16:11:55', 10000, '2023-05-29 19:11:20');
INSERT INTO `t_patrol_path` VALUES (52, 1, '大大大', NULL, 1, 1, 1, 10000, '2023-05-29 16:12:41', 10000, '2023-05-29 19:11:20');
INSERT INTO `t_patrol_path` VALUES (53, 1, '1111', NULL, 1, 0, 1, 10000, '2023-05-29 16:21:53', 10000, '2023-05-29 19:11:20');
INSERT INTO `t_patrol_path` VALUES (54, 1, '111111', 1.000000, 1, 0, 1, 10000, '2023-05-29 16:57:01', 10000, '2023-05-29 19:11:20');
INSERT INTO `t_patrol_path` VALUES (55, 1, 'TEST', 122.000000, 1, 0, 1, 10000, '2023-05-29 19:11:39', 10000, '2023-05-29 19:36:52');
INSERT INTO `t_patrol_path` VALUES (56, 2, 'test', 1.000000, 1, 0, 1, 10000, '2023-05-29 19:22:17', 10000, '2023-05-29 19:36:52');
INSERT INTO `t_patrol_path` VALUES (57, 2, 'tetst1', 11.000000, 1, 1, 1, 10000, '2023-05-29 19:22:46', 10000, '2023-05-29 19:36:52');
INSERT INTO `t_patrol_path` VALUES (58, 2, 'test', 11.000000, 1, 0, 1, 10000, '2023-05-29 19:37:12', 10000, '2023-05-30 10:47:52');
INSERT INTO `t_patrol_path` VALUES (59, 1, '111', 1111.000000, 1, 1, 1, 10000, '2023-05-29 19:37:32', 10000, '2023-05-30 10:47:52');
INSERT INTO `t_patrol_path` VALUES (60, 1, '1', 1.000000, 1, 0, 1, 10000, '2023-05-30 09:07:51', 10000, '2023-05-30 09:09:27');
INSERT INTO `t_patrol_path` VALUES (61, 1, '巡更点', 111.000000, 1, 1, 1, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 10:47:52');
INSERT INTO `t_patrol_path` VALUES (62, 1, '1', 1.000000, 1, 1, 1, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 10:47:52');
INSERT INTO `t_patrol_path` VALUES (63, 1, '11', 111.000000, 1, 1, 1, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 10:47:52');
INSERT INTO `t_patrol_path` VALUES (64, 1, '1', 11.000000, 1, 0, 1, 10000, '2023-05-30 10:49:34', 10000, '2023-05-30 10:50:03');
INSERT INTO `t_patrol_path` VALUES (65, 1, '11', 111.000000, 1, 0, 1, 10000, '2023-05-30 10:51:48', 10000, '2023-05-30 10:52:10');
INSERT INTO `t_patrol_path` VALUES (66, 1, '27巡更路线', 10.000000, 1, 0, 0, 10000, '2023-05-30 11:17:43', 10000, '2023-05-30 11:17:43');
INSERT INTO `t_patrol_path` VALUES (67, 1, '28栋巡逻', 10.000000, 1, 0, 0, 10000, '2023-05-30 15:18:17', 10000, '2023-05-30 15:18:17');
INSERT INTO `t_patrol_path` VALUES (68, 1, '29栋巡逻', 10.000000, 1, 0, 0, 10000, '2023-05-30 15:18:37', 10000, '2023-05-30 15:18:37');
INSERT INTO `t_patrol_path` VALUES (69, 1, '设备检查', 10.000000, 1, 1, 0, 10000, '2023-05-31 11:07:04', 10000, '2023-05-31 11:07:04');

-- ----------------------------
-- Table structure for t_patrol_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_plan`;
CREATE TABLE `t_patrol_plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '小区id',
  `plan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更计划名',
  `path_id` bigint NULL DEFAULT NULL COMMENT '巡更路线id',
  `inspector_id` bigint NULL DEFAULT NULL COMMENT '巡更人id',
  `photo_requirement` tinyint NULL DEFAULT NULL COMMENT '拍照要求（0不要求拍照，1要求拍照）',
  `plan_cycle` tinyint NULL DEFAULT NULL COMMENT '巡更周期（0：每天，1：星期，2：月，3：年）',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划结束时间',
  `plan_start` datetime(0) NULL DEFAULT NULL COMMENT '计划开始日期',
  `last_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次生成时间',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（1：正常，0：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_plan
-- ----------------------------
INSERT INTO `t_patrol_plan` VALUES (33, 1, '计划一', 66, 10004, 3, 0, '06:00', '12:00', '2023-05-31 00:00:00', '2023-06-01 00:00:00', '认真工作', 1, 0, 10000, '2023-05-31 08:35:28', 10000, '2023-05-31 08:35:28');
INSERT INTO `t_patrol_plan` VALUES (34, 1, '计划二', 67, 10004, 3, 0, '08:00', '16:00', '2023-05-31 00:00:00', '2023-06-01 00:00:00', '认证工作', 1, 0, 10000, '2023-05-31 08:37:08', 10000, '2023-05-31 08:37:08');
INSERT INTO `t_patrol_plan` VALUES (35, 1, '设备检查', 69, 10004, 3, 0, '10:00', '14:00', '2023-05-31 00:00:00', '2023-06-01 00:00:00', '认真', 1, 0, 10000, '2023-05-31 11:07:33', 10000, '2023-05-31 11:07:33');

-- ----------------------------
-- Table structure for t_patrol_points
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_points`;
CREATE TABLE `t_patrol_points`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '所属小区id（t_communtiy）',
  `building_id` bigint NULL DEFAULT NULL COMMENT '所在楼宇id（t_building）',
  `point_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点名称',
  `point_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更点位置编号',
  `coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经纬度坐标用\",\"分隔',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_points
-- ----------------------------
INSERT INTO `t_patrol_points` VALUES (1, 1, 1, '', '', '', 0, 1, 0, '2023-05-25 15:21:30', 10000, '2023-05-26 19:45:41');
INSERT INTO `t_patrol_points` VALUES (2, 2, 9, '巡更点4', '', '', 1, 1, 10000, '2023-05-26 15:55:41', 10000, '2023-05-30 10:59:58');
INSERT INTO `t_patrol_points` VALUES (3, 2, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 11:48:01', 10000, '2023-05-27 11:48:27');
INSERT INTO `t_patrol_points` VALUES (4, 1, 1, '1', '1', '1', 1, 1, 10000, '2023-05-27 11:48:15', 10000, '2023-05-27 14:49:54');
INSERT INTO `t_patrol_points` VALUES (5, 1, 1, '1', '1', '1', 1, 1, 10000, '2023-05-27 14:42:47', 10000, '2023-05-27 14:49:54');
INSERT INTO `t_patrol_points` VALUES (6, 6, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:43:07', 10000, '2023-05-27 14:43:07');
INSERT INTO `t_patrol_points` VALUES (7, 5, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:44:41', 10000, '2023-05-27 14:44:41');
INSERT INTO `t_patrol_points` VALUES (8, 2, 1, '巡更点测试', '1', '1', 1, 0, 10000, '2023-05-27 14:46:56', 10000, '2023-05-27 14:46:56');
INSERT INTO `t_patrol_points` VALUES (9, 1, 1, '1', '1', '1', 1, 1, 10000, '2023-05-27 14:52:19', 10000, '2023-05-30 10:59:58');
INSERT INTO `t_patrol_points` VALUES (10, 5, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:52:40', 10000, '2023-05-27 14:52:40');
INSERT INTO `t_patrol_points` VALUES (11, 2, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:53:04', 10000, '2023-05-27 14:53:04');
INSERT INTO `t_patrol_points` VALUES (12, 2, 44, '44', '44', '44', 1, 0, 10000, '2023-05-27 14:53:46', 10000, '2023-05-27 14:53:46');
INSERT INTO `t_patrol_points` VALUES (16, 2, 1, '1', '1', '1', 0, 0, 10000, '2023-05-27 14:56:58', 10000, '2023-05-27 14:56:58');
INSERT INTO `t_patrol_points` VALUES (17, 1, 11, '1111', '111', '111', 1, 0, 10000, '2023-05-27 14:57:50', 10000, '2023-05-30 19:35:47');
INSERT INTO `t_patrol_points` VALUES (18, 2, 52, '阿斯顿撒打算', '12', '21', 1, 0, 10000, '2023-05-27 14:58:37', 10000, '2023-05-27 14:58:37');
INSERT INTO `t_patrol_points` VALUES (19, 2, 9, '1', '1', '1', 1, 0, 10000, '2023-05-27 19:19:51', 10000, '2023-05-30 19:43:34');
INSERT INTO `t_patrol_points` VALUES (20, 1, 1, '1呃呃呃', '111', '105.778506,37.580265', 1, 0, 10000, '2023-05-27 20:26:19', 10000, '2023-05-27 20:26:19');
INSERT INTO `t_patrol_points` VALUES (25, 1, 1, '1321', '132', '12312', 1, 0, 10000, '2023-05-30 11:05:01', 10000, '2023-05-30 11:05:01');
INSERT INTO `t_patrol_points` VALUES (26, 1, 1, '1', '1', '1', 1, 0, 10000, '2023-05-30 11:26:49', 10000, '2023-05-30 11:26:49');
INSERT INTO `t_patrol_points` VALUES (27, 1, 1, '1', '1', '118.934647,32.120747', 1, 0, 10000, '2023-05-30 16:49:32', 10000, '2023-05-30 16:49:32');
INSERT INTO `t_patrol_points` VALUES (28, 2, 9, '11', '11', '11', 1, 0, 10000, '2023-05-30 19:37:09', 10000, '2023-05-30 19:38:14');

-- ----------------------------
-- Table structure for t_patrol_records
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_records`;
CREATE TABLE `t_patrol_records`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `plan_id` bigint NULL DEFAULT NULL COMMENT '巡更计划id',
  `path_id` bigint NULL DEFAULT NULL COMMENT '巡更路线id',
  `point_id` bigint NULL DEFAULT NULL COMMENT '巡更点id',
  `inspector_id` bigint NULL DEFAULT NULL COMMENT '巡更人id',
  `inspector_time` datetime(0) NULL DEFAULT NULL COMMENT '巡更提交时间',
  `inspector_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡更结果',
  `photo_requirement` tinyint NULL DEFAULT NULL COMMENT '拍照要求（0不要求拍照，1要求拍照）',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径，用逗号隔开',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：未完成，1：已完成）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7086 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_records
-- ----------------------------
INSERT INTO `t_patrol_records` VALUES (7074, 33, 66, 20, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 08:35:29', 10000, '2023-05-31 08:35:29');
INSERT INTO `t_patrol_records` VALUES (7075, 33, 66, 25, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 08:35:29', 10000, '2023-05-31 08:35:29');
INSERT INTO `t_patrol_records` VALUES (7076, 34, 67, 4, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 08:37:08', 10000, '2023-05-31 08:37:08');
INSERT INTO `t_patrol_records` VALUES (7077, 34, 67, 5, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 08:37:08', 10000, '2023-05-31 08:37:08');
INSERT INTO `t_patrol_records` VALUES (7078, 35, 69, 2, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 11:07:34', 10000, '2023-05-31 11:07:34');
INSERT INTO `t_patrol_records` VALUES (7079, 35, 69, 1, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, 10000, '2023-05-31 11:07:34', 10000, '2023-05-31 11:07:34');
INSERT INTO `t_patrol_records` VALUES (7080, 33, 66, 20, 10004, '2023-06-01 13:57:38', '1.设备正常2.电力系统', 3, '	https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800-https://img0.baidu.com/it/u=4162443464,2854908495&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500', NULL, 0, 0, NULL, '2023-06-01 00:00:06', NULL, '2023-06-01 00:00:06');
INSERT INTO `t_patrol_records` VALUES (7081, 33, 66, 25, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, NULL, '2023-06-01 00:00:06', NULL, '2023-06-01 00:00:06');
INSERT INTO `t_patrol_records` VALUES (7082, 34, 67, 4, 10004, '2023-06-01 13:58:34', NULL, 3, 'w=800&h=500', NULL, 0, 0, NULL, '2023-06-01 00:00:07', NULL, '2023-06-01 00:00:07');
INSERT INTO `t_patrol_records` VALUES (7083, 34, 67, 5, 10004, '2023-06-01 13:27:26', '1.设备正常2.电力系统', 3, '	https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800-https://img0.baidu.com/it/u=4162443464,2854908495&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500', NULL, 1, 0, NULL, '2023-06-01 00:00:07', NULL, '2023-06-01 00:00:07');
INSERT INTO `t_patrol_records` VALUES (7084, 35, 69, 2, 10004, '2023-06-01 13:59:31', '1.设备正常2.电力系统', 3, '	https://img0.baidu.com/it/u=3425868493,3104015061&fm=253&fmt=auto&app=120&f=JPEG?w=1199&h=800-https://img0.baidu.com/it/u=4162443464,2854908495&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500', NULL, 1, 0, NULL, '2023-06-01 00:00:08', NULL, '2023-06-01 00:00:08');
INSERT INTO `t_patrol_records` VALUES (7085, 35, 69, 1, 10004, NULL, NULL, 3, NULL, NULL, 0, 0, NULL, '2023-06-01 00:00:08', NULL, '2023-06-01 00:00:08');

-- ----------------------------
-- Table structure for t_phone
-- ----------------------------
DROP TABLE IF EXISTS `t_phone`;
CREATE TABLE `t_phone`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint NOT NULL COMMENT '电话类型(0:物业电话，1：快递电话)',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '电话',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `updator` bigint NOT NULL COMMENT '更新者',
  `deleted` tinyint NOT NULL COMMENT '删除标识（0：未删除 1：已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_phone
-- ----------------------------

-- ----------------------------
-- Table structure for t_phone_log
-- ----------------------------
DROP TABLE IF EXISTS `t_phone_log`;
CREATE TABLE `t_phone_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `CREATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `UPDATETIME` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建者',
  `UPDATER` bigint NULL DEFAULT NULL COMMENT '更新者',
  `IP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `DELETED` tinyint NULL DEFAULT 0 COMMENT '删除',
  `PHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `USERID` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `DEVICETOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备token',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_phone_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_points_path
-- ----------------------------
DROP TABLE IF EXISTS `t_points_path`;
CREATE TABLE `t_points_path`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `path_id` bigint NULL DEFAULT NULL COMMENT '巡更路线id',
  `point_id` bigint NULL DEFAULT NULL COMMENT '巡更点id',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点线路关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_points_path
-- ----------------------------
INSERT INTO `t_points_path` VALUES (1, NULL, 5, 0, 0, 10000, '2023-05-29 15:52:26', 10000, '2023-05-29 15:52:26');
INSERT INTO `t_points_path` VALUES (2, NULL, 4, 0, 0, 10000, '2023-05-29 15:52:26', 10000, '2023-05-29 15:52:26');
INSERT INTO `t_points_path` VALUES (3, NULL, 1, 0, 0, 10000, '2023-05-29 15:52:26', 10000, '2023-05-29 15:52:26');
INSERT INTO `t_points_path` VALUES (4, NULL, 5, 0, 0, 10000, '2023-05-29 15:54:05', 10000, '2023-05-29 15:54:05');
INSERT INTO `t_points_path` VALUES (5, NULL, 1, 0, 0, 10000, '2023-05-29 15:54:05', 10000, '2023-05-29 15:54:05');
INSERT INTO `t_points_path` VALUES (6, NULL, 9, 0, 0, 10000, '2023-05-29 15:54:05', 10000, '2023-05-29 15:54:05');
INSERT INTO `t_points_path` VALUES (7, 47, 5, 0, 0, 10000, '2023-05-29 15:57:09', 10000, '2023-05-29 15:57:09');
INSERT INTO `t_points_path` VALUES (8, 47, 1, 0, 0, 10000, '2023-05-29 15:57:09', 10000, '2023-05-29 15:57:09');
INSERT INTO `t_points_path` VALUES (9, 47, 9, 0, 0, 10000, '2023-05-29 15:57:09', 10000, '2023-05-29 15:57:09');
INSERT INTO `t_points_path` VALUES (10, 53, 4, 0, 0, 10000, '2023-05-29 16:21:53', 10000, '2023-05-29 16:21:53');
INSERT INTO `t_points_path` VALUES (11, 53, 9, 0, 0, 10000, '2023-05-29 16:21:53', 10000, '2023-05-29 16:21:53');
INSERT INTO `t_points_path` VALUES (12, 53, 19, 0, 0, 10000, '2023-05-29 16:21:53', 10000, '2023-05-29 16:21:53');
INSERT INTO `t_points_path` VALUES (13, 54, 4, 0, 0, 10000, '2023-05-29 16:57:01', 10000, '2023-05-29 16:57:01');
INSERT INTO `t_points_path` VALUES (14, 54, 9, 0, 0, 10000, '2023-05-29 16:57:01', 10000, '2023-05-29 16:57:01');
INSERT INTO `t_points_path` VALUES (15, 54, 19, 0, 0, 10000, '2023-05-29 16:57:01', 10000, '2023-05-29 16:57:01');
INSERT INTO `t_points_path` VALUES (16, 54, 20, 0, 0, 10000, '2023-05-29 16:57:01', 10000, '2023-05-29 16:57:01');
INSERT INTO `t_points_path` VALUES (17, 55, 4, 0, 0, 10000, '2023-05-29 19:11:39', 10000, '2023-05-29 19:11:39');
INSERT INTO `t_points_path` VALUES (18, 55, 17, 0, 0, 10000, '2023-05-29 19:11:39', 10000, '2023-05-29 19:11:39');
INSERT INTO `t_points_path` VALUES (19, 55, 20, 0, 0, 10000, '2023-05-29 19:11:39', 10000, '2023-05-29 19:11:39');
INSERT INTO `t_points_path` VALUES (20, 56, 1, 0, 0, 10000, '2023-05-29 19:22:18', 10000, '2023-05-29 19:22:18');
INSERT INTO `t_points_path` VALUES (21, 56, 5, 0, 0, 10000, '2023-05-29 19:22:18', 10000, '2023-05-29 19:22:18');
INSERT INTO `t_points_path` VALUES (22, 56, 19, 0, 0, 10000, '2023-05-29 19:22:18', 10000, '2023-05-29 19:22:18');
INSERT INTO `t_points_path` VALUES (23, 58, 2, 0, 1, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (24, 58, 8, 0, 1, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (25, 58, 16, 0, 1, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (26, 58, 18, 0, 1, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (27, 61, 4, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (28, 61, 9, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (29, 61, 19, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (30, 61, 20, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (31, 58, 12, 0, 1, 10000, '2023-05-30 09:48:31', 10000, '2023-05-30 09:48:31');
INSERT INTO `t_points_path` VALUES (32, 58, 4, 0, 1, 10000, '2023-05-30 09:50:09', 10000, '2023-05-30 09:50:09');
INSERT INTO `t_points_path` VALUES (33, 58, 17, 0, 1, 10000, '2023-05-30 09:50:09', 10000, '2023-05-30 09:50:09');
INSERT INTO `t_points_path` VALUES (34, 58, 19, 0, 1, 10000, '2023-05-30 09:50:09', 10000, '2023-05-30 09:50:09');
INSERT INTO `t_points_path` VALUES (35, 58, 8, 0, 1, 10000, '2023-05-30 09:51:10', 10000, '2023-05-30 09:51:10');
INSERT INTO `t_points_path` VALUES (36, 58, 16, 0, 1, 10000, '2023-05-30 09:51:10', 10000, '2023-05-30 09:51:10');
INSERT INTO `t_points_path` VALUES (37, 58, 4, 0, 1, 10000, '2023-05-30 09:52:42', 10000, '2023-05-30 09:52:42');
INSERT INTO `t_points_path` VALUES (38, 58, 9, 0, 1, 10000, '2023-05-30 09:52:42', 10000, '2023-05-30 09:52:42');
INSERT INTO `t_points_path` VALUES (39, 58, 2, 0, 1, 10000, '2023-05-30 09:52:58', 10000, '2023-05-30 09:52:58');
INSERT INTO `t_points_path` VALUES (40, 58, 8, 0, 1, 10000, '2023-05-30 09:52:58', 10000, '2023-05-30 09:52:58');
INSERT INTO `t_points_path` VALUES (41, 58, 11, 0, 1, 10000, '2023-05-30 09:52:58', 10000, '2023-05-30 09:52:58');
INSERT INTO `t_points_path` VALUES (42, 58, 4, 0, 1, 10000, '2023-05-30 09:53:22', 10000, '2023-05-30 09:53:22');
INSERT INTO `t_points_path` VALUES (43, 58, 9, 0, 1, 10000, '2023-05-30 09:53:22', 10000, '2023-05-30 09:53:22');
INSERT INTO `t_points_path` VALUES (44, 58, 17, 0, 1, 10000, '2023-05-30 09:53:22', 10000, '2023-05-30 09:53:22');
INSERT INTO `t_points_path` VALUES (45, 58, 2, 0, 0, 10000, '2023-05-30 09:55:50', 10000, '2023-05-30 09:55:50');
INSERT INTO `t_points_path` VALUES (46, 58, 8, 0, 0, 10000, '2023-05-30 09:55:50', 10000, '2023-05-30 09:55:50');
INSERT INTO `t_points_path` VALUES (47, 58, 18, 0, 0, 10000, '2023-05-30 09:55:50', 10000, '2023-05-30 09:55:50');
INSERT INTO `t_points_path` VALUES (48, 64, 1, 0, 0, 10000, '2023-05-30 10:49:34', 10000, '2023-05-30 10:49:34');
INSERT INTO `t_points_path` VALUES (49, 64, 9, 0, 0, 10000, '2023-05-30 10:49:34', 10000, '2023-05-30 10:49:34');
INSERT INTO `t_points_path` VALUES (50, 64, 19, 0, 0, 10000, '2023-05-30 10:49:34', 10000, '2023-05-30 10:49:34');
INSERT INTO `t_points_path` VALUES (51, 65, 1, 0, 1, 10000, '2023-05-30 10:51:48', 10000, '2023-05-30 10:51:48');
INSERT INTO `t_points_path` VALUES (52, 65, 17, 0, 1, 10000, '2023-05-30 10:51:48', 10000, '2023-05-30 10:51:48');
INSERT INTO `t_points_path` VALUES (53, 65, 21, 0, 1, 10000, '2023-05-30 10:51:48', 10000, '2023-05-30 10:51:48');
INSERT INTO `t_points_path` VALUES (54, 66, 20, 0, 0, 10000, '2023-05-30 11:17:43', 10000, '2023-05-30 11:17:43');
INSERT INTO `t_points_path` VALUES (55, 66, 25, 0, 0, 10000, '2023-05-30 11:17:43', 10000, '2023-05-30 11:17:43');
INSERT INTO `t_points_path` VALUES (56, 67, 4, 0, 0, 10000, '2023-05-30 15:18:17', 10000, '2023-05-30 15:18:17');
INSERT INTO `t_points_path` VALUES (57, 67, 5, 0, 0, 10000, '2023-05-30 15:18:17', 10000, '2023-05-30 15:18:17');
INSERT INTO `t_points_path` VALUES (58, 68, 17, 0, 0, 10000, '2023-05-30 15:18:37', 10000, '2023-05-30 15:18:37');
INSERT INTO `t_points_path` VALUES (59, 68, 19, 0, 0, 10000, '2023-05-30 15:18:37', 10000, '2023-05-30 15:18:37');

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `POST_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `POST_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `SORT` int NULL DEFAULT NULL COMMENT '排序字段',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATOR` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_post
-- ----------------------------

-- ----------------------------
-- Table structure for t_project_path
-- ----------------------------
DROP TABLE IF EXISTS `t_project_path`;
CREATE TABLE `t_project_path`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `item_id` bigint NULL DEFAULT NULL COMMENT '巡检项目id',
  `path_id` bigint NULL DEFAULT NULL COMMENT '巡检线路id',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡检项目线路关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_path
-- ----------------------------
INSERT INTO `t_project_path` VALUES (1, 1, 0, 0, 0, 10000, '2023-05-29 10:38:37', 10000, '2023-05-29 10:38:37');
INSERT INTO `t_project_path` VALUES (2, 2, 0, 0, 0, 10000, '2023-05-29 10:38:37', 10000, '2023-05-29 10:38:37');
INSERT INTO `t_project_path` VALUES (3, 1, 5, 0, 0, 10000, '2023-05-29 10:39:08', 10000, '2023-05-29 10:39:08');
INSERT INTO `t_project_path` VALUES (4, 2, 5, 0, 0, 10000, '2023-05-29 10:39:08', 10000, '2023-05-29 10:39:08');
INSERT INTO `t_project_path` VALUES (5, 1, 6, 0, 0, 10000, '2023-05-29 10:39:14', 10000, '2023-05-29 10:39:14');
INSERT INTO `t_project_path` VALUES (6, 2, 6, 0, 0, 10000, '2023-05-29 10:39:14', 10000, '2023-05-29 10:39:14');
INSERT INTO `t_project_path` VALUES (7, 1, NULL, 0, 0, 10000, '2023-05-29 13:46:11', 10000, '2023-05-29 13:46:11');
INSERT INTO `t_project_path` VALUES (8, 2, NULL, 0, 0, 10000, '2023-05-29 13:46:11', 10000, '2023-05-29 13:46:11');
INSERT INTO `t_project_path` VALUES (9, 3, NULL, 0, 0, 10000, '2023-05-29 13:46:11', 10000, '2023-05-29 13:46:11');
INSERT INTO `t_project_path` VALUES (10, 2, NULL, 0, 0, 10000, '2023-05-29 13:47:01', 10000, '2023-05-29 13:47:01');
INSERT INTO `t_project_path` VALUES (11, 3, NULL, 0, 0, 10000, '2023-05-29 13:47:01', 10000, '2023-05-29 13:47:01');
INSERT INTO `t_project_path` VALUES (12, 3, NULL, 0, 0, 10000, '2023-05-29 13:47:17', 10000, '2023-05-29 13:47:17');
INSERT INTO `t_project_path` VALUES (13, 2, NULL, 0, 0, 10000, '2023-05-29 13:47:35', 10000, '2023-05-29 13:47:35');
INSERT INTO `t_project_path` VALUES (14, 3, NULL, 0, 0, 10000, '2023-05-29 13:47:35', 10000, '2023-05-29 13:47:35');
INSERT INTO `t_project_path` VALUES (15, 23, NULL, 0, 1, 10000, '2023-05-29 13:47:35', 10000, '2023-05-29 13:47:35');
INSERT INTO `t_project_path` VALUES (16, 2, NULL, 0, 0, 10000, '2023-05-29 14:31:40', 10000, '2023-05-29 14:31:40');
INSERT INTO `t_project_path` VALUES (17, 23, NULL, 0, 1, 10000, '2023-05-29 14:31:40', 10000, '2023-05-29 14:31:40');
INSERT INTO `t_project_path` VALUES (18, 24, NULL, 0, 0, 10000, '2023-05-29 14:31:40', 10000, '2023-05-29 14:31:40');
INSERT INTO `t_project_path` VALUES (19, 25, NULL, 0, 0, 10000, '2023-05-29 14:31:40', 10000, '2023-05-29 14:31:40');
INSERT INTO `t_project_path` VALUES (20, 2, NULL, 0, 0, 10000, '2023-05-29 14:32:02', 10000, '2023-05-29 14:32:02');
INSERT INTO `t_project_path` VALUES (21, 24, NULL, 0, 0, 10000, '2023-05-29 14:32:02', 10000, '2023-05-29 14:32:02');
INSERT INTO `t_project_path` VALUES (22, 25, NULL, 0, 0, 10000, '2023-05-29 14:32:02', 10000, '2023-05-29 14:32:02');
INSERT INTO `t_project_path` VALUES (23, 4, NULL, 0, 1, 10000, '2023-05-29 14:35:54', 10000, '2023-05-29 14:35:54');
INSERT INTO `t_project_path` VALUES (24, 24, NULL, 0, 0, 10000, '2023-05-29 14:44:07', 10000, '2023-05-29 14:44:07');
INSERT INTO `t_project_path` VALUES (25, 2, NULL, 0, 0, 10000, '2023-05-29 14:44:07', 10000, '2023-05-29 14:44:07');
INSERT INTO `t_project_path` VALUES (26, 3, NULL, 0, 0, 10000, '2023-05-29 14:44:07', 10000, '2023-05-29 14:44:07');
INSERT INTO `t_project_path` VALUES (27, 23, NULL, 0, 1, 10000, '2023-05-29 14:44:07', 10000, '2023-05-29 14:44:07');
INSERT INTO `t_project_path` VALUES (28, 23, NULL, 0, 1, 10000, '2023-05-29 14:45:28', 10000, '2023-05-29 14:45:28');
INSERT INTO `t_project_path` VALUES (29, 25, NULL, 0, 0, 10000, '2023-05-29 14:45:28', 10000, '2023-05-29 14:45:28');
INSERT INTO `t_project_path` VALUES (30, 23, NULL, 0, 1, 10000, '2023-05-29 15:04:20', 10000, '2023-05-29 15:04:20');
INSERT INTO `t_project_path` VALUES (31, 24, NULL, 0, 0, 10000, '2023-05-29 15:04:20', 10000, '2023-05-29 15:04:20');
INSERT INTO `t_project_path` VALUES (32, 25, NULL, 0, 0, 10000, '2023-05-29 15:04:20', 10000, '2023-05-29 15:04:20');
INSERT INTO `t_project_path` VALUES (33, 4, NULL, 0, 1, 10000, '2023-05-29 15:04:33', 10000, '2023-05-29 15:04:33');
INSERT INTO `t_project_path` VALUES (34, 1, 49, 0, 0, 10000, '2023-05-29 16:11:20', 10000, '2023-05-29 16:11:20');
INSERT INTO `t_project_path` VALUES (35, 3, 49, 0, 0, 10000, '2023-05-29 16:11:20', 10000, '2023-05-29 16:11:20');
INSERT INTO `t_project_path` VALUES (36, 23, 49, 0, 1, 10000, '2023-05-29 16:11:20', 10000, '2023-05-29 16:11:20');
INSERT INTO `t_project_path` VALUES (37, 2, 50, 0, 0, 10000, '2023-05-29 16:11:42', 10000, '2023-05-29 16:11:42');
INSERT INTO `t_project_path` VALUES (38, 23, 50, 0, 1, 10000, '2023-05-29 16:11:42', 10000, '2023-05-29 16:11:42');
INSERT INTO `t_project_path` VALUES (39, 24, 50, 0, 0, 10000, '2023-05-29 16:11:42', 10000, '2023-05-29 16:11:42');
INSERT INTO `t_project_path` VALUES (40, 4, 51, 0, 1, 10000, '2023-05-29 16:11:55', 10000, '2023-05-29 16:11:55');
INSERT INTO `t_project_path` VALUES (41, 2, 52, 0, 0, 10000, '2023-05-29 16:12:41', 10000, '2023-05-29 16:12:41');
INSERT INTO `t_project_path` VALUES (42, 24, 52, 0, 0, 10000, '2023-05-29 16:12:41', 10000, '2023-05-29 16:12:41');
INSERT INTO `t_project_path` VALUES (43, 23, 52, 0, 1, 10000, '2023-05-29 16:12:41', 10000, '2023-05-29 16:12:41');
INSERT INTO `t_project_path` VALUES (44, 3, 52, 0, 0, 10000, '2023-05-29 16:12:41', 10000, '2023-05-29 16:12:41');
INSERT INTO `t_project_path` VALUES (45, 1, 57, 0, 0, 10000, '2023-05-29 19:22:46', 10000, '2023-05-29 19:22:46');
INSERT INTO `t_project_path` VALUES (46, 3, 57, 0, 0, 10000, '2023-05-29 19:22:46', 10000, '2023-05-29 19:22:46');
INSERT INTO `t_project_path` VALUES (47, 23, 57, 0, 1, 10000, '2023-05-29 19:22:46', 10000, '2023-05-29 19:22:46');
INSERT INTO `t_project_path` VALUES (48, 4, 59, 0, 0, 10000, '2023-05-29 19:37:32', 10000, '2023-05-29 19:37:32');
INSERT INTO `t_project_path` VALUES (49, 23, 59, 0, 0, 10000, '2023-05-29 20:19:17', 10000, '2023-05-29 20:19:21');
INSERT INTO `t_project_path` VALUES (50, 1, 62, 0, 0, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 09:17:06');
INSERT INTO `t_project_path` VALUES (51, 3, 62, 0, 0, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 09:17:06');
INSERT INTO `t_project_path` VALUES (52, 23, 62, 0, 0, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 09:17:06');
INSERT INTO `t_project_path` VALUES (53, 24, 62, 0, 0, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 09:17:06');
INSERT INTO `t_project_path` VALUES (54, 2, 63, 0, 0, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 09:17:35');
INSERT INTO `t_project_path` VALUES (55, 25, 63, 0, 0, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 09:17:35');
INSERT INTO `t_project_path` VALUES (56, 23, 63, 0, 0, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 09:17:35');
INSERT INTO `t_project_path` VALUES (57, 24, 63, 0, 0, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 09:17:35');
INSERT INTO `t_project_path` VALUES (58, 2, 69, 0, 0, 10000, '2023-05-31 11:07:04', 10000, '2023-05-31 11:07:04');
INSERT INTO `t_project_path` VALUES (59, 1, 69, 0, 0, 10000, '2023-05-31 11:07:04', 10000, '2023-05-31 11:07:04');

-- ----------------------------
-- Table structure for t_property
-- ----------------------------
DROP TABLE IF EXISTS `t_property`;
CREATE TABLE `t_property`  (
  `pk_id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` int NOT NULL COMMENT '社区id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物业公司名称',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司简称',
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人电话',
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在地区',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经度',
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纬度',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物业logo',
  `delete_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物业公司表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_property
-- ----------------------------
INSERT INTO `t_property` VALUES (1, 1, '超能物业', '超能', '孙红', '18883747902', '浙江省西湖区', '浙江省西湖区西湖路250号', '1', '1', '1', 1, '2023-05-28 22:30:54', '2023-05-28 22:31:17');

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `user_id` bigint NOT NULL COMMENT '报修人id',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '判断这个报修人的身份（0是用户，1是物业)',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '报修类别(0:公共报修，1：个人报修)',
  `category` tinyint NOT NULL DEFAULT 0 COMMENT '报修类型(0:路灯，1：厕所)',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报修地址',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报修内容',
  `imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '处理状态（0：未处理，1：处理中，2：已处理，3：已评价）',
  `employee_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人id，逗号分隔',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `handle_time` timestamp(0) NULL DEFAULT NULL COMMENT '处理时间',
  `evaluate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报修评价',
  `evaluate_time` timestamp(0) NULL DEFAULT NULL COMMENT '报修评价时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `updater` bigint NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES (1, 1, 1, 0, 0, 0, '万达小区', '马路坏了1', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004', '', NULL, '', NULL, 0, '2023-05-26 09:52:35', '2023-05-30 09:08:34', 10000, 10000);
INSERT INTO `t_repair` VALUES (2, 1, 1, 1, 1, 1, '2', '马路坏了2', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10000', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-28 15:17:10', 10000, 10000);
INSERT INTO `t_repair` VALUES (3, 1, 10000, 1, 1, 1, '2', '马路坏了3', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004,10005', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:50:07', 10000, 10000);
INSERT INTO `t_repair` VALUES (4, 1, 10000, 1, 1, 1, '2', '马路坏了4', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004,10005', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:50:07', 10000, 10000);
INSERT INTO `t_repair` VALUES (5, 1, 10000, 1, 1, 1, '2', '马路坏了5', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004,10005', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:50:07', 10000, 10000);
INSERT INTO `t_repair` VALUES (6, 1, 10000, 1, 1, 1, '2', '马路坏了6', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004,10005', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:50:07', 10000, 10000);
INSERT INTO `t_repair` VALUES (7, 1, 10000, 1, 1, 1, '2', '马路坏了7', '幸福苑小区道路路灯不亮了，并且亮度不够，\r\n\r\n请物业公司及时更换，方式发生意外事故。', 'https://my-xl.oss-cn-beijing.aliyuncs.com/images/avatar.jpg', 0, '10004,10005', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:50:07', 10000, 10000);
INSERT INTO `t_repair` VALUES (8, 1, 1, NULL, 1, 0, '天堂小区一号', '路灯坏了....', '视频加载失败 少年志|国风少年勇敢无畏 原标题:少年志|国风少年勇敢无畏 值班主任:高原 责任编辑:高原 新闻排行 进入新闻中心 1中央气象台:台风“玛娃”将向琉球群岛南部海...', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-01 19:01:26', '2023-06-01 19:01:26', 1, 1);
INSERT INTO `t_repair` VALUES (9, 1, 1, NULL, 1, 0, '天堂小区一号', '风筝', '12313213', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-06-01 19:02:28', '2023-06-01 19:02:28', 1, 1);

-- ----------------------------
-- Table structure for t_repair_record
-- ----------------------------
DROP TABLE IF EXISTS `t_repair_record`;
CREATE TABLE `t_repair_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `repair_id` bigint NOT NULL COMMENT '报修信息id',
  `employee_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人id，逗号分隔',
  `state` tinyint NOT NULL DEFAULT 0 COMMENT '处理状态（0：未处理，1：处理中，2：已完成）',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现场照片',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `updater` bigint NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报修处理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_operation_log`;
CREATE TABLE `t_system_operation_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `TERMINAL_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端类型',
  `BROWSER_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `OS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `DEVICE_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `DEVICE_MAC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MAC地址',
  `LOGIN_IP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `CREATOR_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system_operation_log
-- ----------------------------
INSERT INTO `t_system_operation_log` VALUES (9, '2023-05-24 17:37:12', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 17:37:12', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (10, '2023-05-24 18:54:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 18:54:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (11, '2023-05-24 18:54:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 18:54:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (12, '2023-05-24 18:57:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 18:57:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (13, '2023-05-24 18:54:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 18:54:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (14, '2023-05-24 19:06:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 19:06:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (15, '2023-05-24 19:22:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 19:22:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (16, '2023-05-24 19:24:31', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 19:24:31', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (17, '2023-05-24 19:34:49', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 19:34:49', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (18, '2023-05-24 19:40:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 19:40:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (19, '2023-05-24 19:40:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 19:40:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (20, '2023-05-24 20:03:15', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 20:03:15', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (21, '2023-05-24 20:04:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 20:04:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (22, '2023-05-24 20:06:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 20:06:21', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (23, '2023-05-24 20:20:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:20:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (24, '2023-05-24 20:20:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:20:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (25, '2023-05-24 20:23:01', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:23:01', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (26, '2023-05-24 20:23:01', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:23:01', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (27, '2023-05-24 20:33:11', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 20:33:11', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (28, '2023-05-24 20:36:36', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 20:36:36', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (29, '2023-05-24 20:46:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:46:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (30, '2023-05-24 20:46:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:46:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (31, '2023-05-24 20:46:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-24 20:46:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (32, '2023-05-24 21:30:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-24 21:30:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (33, '2023-05-25 10:39:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 10:39:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (34, '2023-05-25 11:04:20', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 11:04:20', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (35, '2023-05-25 11:21:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 11:21:40', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (36, '2023-05-25 11:54:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 11:54:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (37, '2023-05-25 11:54:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 11:54:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (38, '2023-05-25 11:56:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 11:56:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (39, '2023-05-25 11:57:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 11:57:50', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (40, '2023-05-25 12:45:38', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 12:45:38', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (41, '2023-05-25 12:48:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 12:48:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (42, '2023-05-25 12:48:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 12:48:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (43, '2023-05-25 12:48:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 12:48:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (44, '2023-05-25 13:03:34', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 13:03:34', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (45, '2023-05-25 11:57:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 11:57:50', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (46, '2023-05-25 13:09:27', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 13:09:27', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (47, '2023-05-25 13:03:34', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 13:03:34', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (48, '2023-05-25 13:19:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 13:19:59', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (49, '2023-05-25 13:19:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 13:19:59', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (50, '2023-05-25 13:23:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 13:23:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (51, '2023-05-25 13:24:41', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 13:24:41', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (52, '2023-05-25 13:26:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-25 13:26:59', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (53, '2023-05-25 13:19:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 13:19:59', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (54, '2023-05-25 13:31:36', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 13:31:36', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (55, '2023-05-25 13:24:41', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 13:24:41', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (56, '2023-05-25 14:01:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:01:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (57, '2023-05-25 14:02:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:02:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (58, '2023-05-25 14:02:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:02:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (59, '2023-05-25 14:08:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 14:08:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (60, '2023-05-25 14:09:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:09:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (61, '2023-05-25 14:12:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:12:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (62, '2023-05-25 14:20:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 14:20:37', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (63, '2023-05-25 14:23:27', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:23:27', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (64, '2023-05-25 14:23:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 14:23:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (65, '2023-05-25 14:24:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 14:24:47', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (66, '2023-05-25 14:24:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 14:24:47', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (67, '2023-05-25 14:46:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 14:46:17', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (68, '2023-05-25 14:49:12', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-25 14:49:12', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (69, '2023-05-25 14:57:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 14:57:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (70, '2023-05-25 15:24:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:24:52', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (71, '2023-05-25 15:29:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:29:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (72, '2023-05-25 15:29:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 15:29:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (73, '2023-05-25 15:29:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 15:29:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (74, '2023-05-25 15:31:29', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:31:29', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (75, '2023-05-25 15:31:29', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:31:29', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (76, '2023-05-25 15:31:29', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:31:29', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (77, '2023-05-25 15:34:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 15:34:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (78, '2023-05-25 16:03:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-25 16:03:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (79, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (80, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (81, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (82, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (83, '2023-05-25 16:16:51', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 16:16:51', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (84, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (85, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (86, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (87, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (88, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (89, '2023-05-25 16:15:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:15:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (90, '2023-05-25 16:28:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:28:50', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (91, '2023-05-25 16:30:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-25 16:30:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (92, '2023-05-25 16:32:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:32:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (93, '2023-05-25 16:37:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:37:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (94, '2023-05-25 16:48:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 16:48:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (95, '2023-05-25 16:30:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-25 16:30:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (96, '2023-05-25 16:48:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 16:48:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (97, '2023-05-25 17:19:46', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-25 17:19:46', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (98, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (99, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (100, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (101, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (102, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (103, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (104, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (105, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (106, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (107, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (108, '2023-05-25 17:44:33', 'Windows终端', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 17:44:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (109, '2023-05-25 17:44:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 17:44:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (110, '2023-05-25 17:44:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 17:44:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (111, '2023-05-25 17:47:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:47:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (112, '2023-05-25 17:54:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 17:54:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (113, '2023-05-25 17:54:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 17:54:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (114, '2023-05-25 16:37:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:37:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (115, '2023-05-25 16:37:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 16:37:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (116, '2023-05-25 18:25:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 18:25:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (117, '2023-05-25 18:52:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 18:52:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (118, '2023-05-25 18:52:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 18:52:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (119, '2023-05-25 18:52:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-25 18:52:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (120, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (121, '2023-05-25 17:22:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 17:22:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (122, '2023-05-25 20:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 20:29:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (123, '2023-05-25 20:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-25 20:29:48', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (124, '2023-05-25 20:48:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 20:48:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (125, '2023-05-25 20:48:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 20:48:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (126, '2023-05-25 21:36:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 21:36:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (127, '2023-05-25 21:36:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 21:36:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (128, '2023-05-25 22:02:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 22:02:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (129, '2023-05-25 22:02:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 22:02:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (130, '2023-05-25 22:05:07', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 22:05:07', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (131, '2023-05-25 22:48:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-25 22:48:44', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (132, '2023-05-26 08:43:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 08:43:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (133, '2023-05-26 08:44:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-26 08:44:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (134, '2023-05-26 08:43:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 08:43:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (135, '2023-05-26 09:12:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-26 09:12:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (136, '2023-05-26 09:22:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-26 09:22:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (137, '2023-05-26 09:48:15', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 09:48:15', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (138, '2023-05-26 10:00:41', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-26 10:00:41', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (139, '2023-05-26 10:07:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:07:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (140, '2023-05-26 10:21:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-26 10:21:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (141, '2023-05-26 10:34:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 10:34:17', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (142, '2023-05-26 10:07:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:07:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (143, '2023-05-26 10:59:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:59:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (144, '2023-05-26 11:02:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-26 11:02:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (145, '2023-05-26 11:20:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 11:20:18', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (146, '2023-05-26 11:22:57', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-26 11:22:57', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (147, '2023-05-26 10:59:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:59:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (148, '2023-05-26 10:59:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:59:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (149, '2023-05-26 10:59:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 10:59:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (150, '2023-05-26 11:20:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 11:20:18', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (151, '2023-05-26 12:18:45', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-26 12:18:45', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (152, '2023-05-26 15:15:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 15:15:56', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (153, '2023-05-26 15:22:49', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 15:22:49', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (154, '2023-05-26 15:24:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 15:24:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (155, '2023-05-26 15:39:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-26 15:39:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (156, '2023-05-26 15:53:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 15:53:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (157, '2023-05-26 16:03:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-26 16:03:18', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (158, '2023-05-26 16:06:11', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 16:06:11', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (159, '2023-05-26 16:09:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-26 16:09:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (160, '2023-05-26 16:28:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 16:28:40', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (161, '2023-05-26 16:28:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 16:28:40', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (162, '2023-05-26 16:51:12', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 16:51:12', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (163, '2023-05-26 17:30:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-26 17:30:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (164, '2023-05-26 18:04:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:04:03', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (165, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (166, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (167, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (168, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (169, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (170, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (171, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (172, '2023-05-26 18:32:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 18:32:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (173, '2023-05-26 19:12:34', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 19:12:34', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (174, '2023-05-26 19:24:11', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-26 19:24:11', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (175, '2023-05-26 19:45:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 19:45:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (176, '2023-05-26 19:45:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-26 19:45:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (177, '2023-05-26 23:39:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-26 23:39:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (178, '2023-05-27 08:30:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 08:30:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (179, '2023-05-27 11:26:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 11:26:37', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (180, '2023-05-27 11:26:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 11:26:37', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (181, '2023-05-27 11:55:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 11:55:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (182, '2023-05-27 11:57:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-27 11:57:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (183, '2023-05-27 12:33:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-27 12:33:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (184, '2023-05-27 12:53:34', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 12:53:34', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (185, '2023-05-27 13:06:28', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-27 13:06:28', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (186, '2023-05-27 11:57:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-27 11:57:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (187, '2023-05-27 13:34:12', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-27 13:34:12', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (188, '2023-05-27 14:20:29', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-27 14:20:29', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (189, '2023-05-27 14:45:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-27 14:45:23', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (190, '2023-05-27 14:52:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-27 14:52:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (191, '2023-05-27 15:07:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 15:07:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (192, '2023-05-27 15:16:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 15:16:52', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (193, '2023-05-27 15:26:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 15:26:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (194, '2023-05-27 15:43:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 15:43:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (195, '2023-05-27 16:08:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 16:08:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (196, '2023-05-27 16:15:57', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-27 16:15:57', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (197, '2023-05-27 16:17:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-27 16:17:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (198, '2023-05-27 16:21:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-27 16:21:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (199, '2023-05-27 16:31:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 16:31:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (200, '2023-05-27 17:52:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-27 17:52:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (201, '2023-05-27 19:07:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-27 19:07:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (202, '2023-05-27 19:10:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-27 19:10:55', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (203, '2023-05-27 21:23:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-27 21:23:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (204, '2023-05-27 22:15:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-27 22:15:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (205, '2023-05-28 09:51:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-28 09:51:40', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (206, '2023-05-28 11:20:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 11:20:40', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (207, '2023-05-28 11:52:45', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 11:52:45', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (208, '2023-05-28 12:01:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-28 12:01:56', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (209, '2023-05-28 12:02:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 12:02:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (210, '2023-05-28 12:02:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 12:02:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (211, '2023-05-28 12:44:45', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-28 12:44:45', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (212, '2023-05-28 13:04:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 13:04:47', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (213, '2023-05-28 14:12:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 14:12:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (214, '2023-05-28 14:47:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 14:47:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (215, '2023-05-28 14:48:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 14:48:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (216, '2023-05-28 15:00:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-28 15:00:08', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (217, '2023-05-28 15:58:12', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 15:58:12', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (218, '2023-05-28 16:17:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-28 16:17:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (219, '2023-05-28 16:44:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 16:44:47', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (220, '2023-05-28 16:44:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 16:44:47', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (221, '2023-05-28 17:05:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-28 17:05:08', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (222, '2023-05-28 17:05:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-28 17:05:08', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (223, '2023-05-28 17:15:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 17:15:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (224, '2023-05-28 17:15:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 17:15:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (225, '2023-05-28 17:15:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 17:15:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (226, '2023-05-28 17:15:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 17:15:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (227, '2023-05-28 19:20:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 19:20:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (228, '2023-05-28 19:35:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 19:35:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (229, '2023-05-28 19:42:15', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-28 19:42:15', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (230, '2023-05-28 20:04:34', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 20:04:34', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (231, '2023-05-28 20:15:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-28 20:15:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (232, '2023-05-28 20:42:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 20:42:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (233, '2023-05-28 21:27:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 21:27:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (234, '2023-05-28 21:27:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-28 21:27:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (235, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (236, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (237, '2023-05-28 22:00:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-28 22:00:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (238, '2023-05-28 22:00:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-28 22:00:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (239, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (240, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (241, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (242, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (243, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (244, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (245, '2023-05-28 21:56:39', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-28 21:56:39', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (246, '2023-05-28 23:31:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-28 23:31:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (247, '2023-05-28 23:31:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-28 23:31:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (248, '2023-05-29 07:07:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 07:07:08', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (249, '2023-05-29 08:51:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-29 08:51:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (250, '2023-05-29 09:56:41', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 09:56:41', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (251, '2023-05-29 10:18:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-29 10:18:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (252, '2023-05-29 10:23:46', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-29 10:23:46', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (253, '2023-05-29 10:23:46', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-29 10:23:46', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (254, '2023-05-29 11:22:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-29 11:22:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (255, '2023-05-29 12:56:58', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 12:56:58', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (256, '2023-05-29 13:00:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 13:00:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (257, '2023-05-29 13:23:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 13:23:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (258, '2023-05-29 13:23:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 13:23:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (259, '2023-05-29 13:23:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 13:23:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (260, '2023-05-29 13:43:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-29 13:43:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (261, '2023-05-29 13:43:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-29 13:43:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (262, '2023-05-29 13:59:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 13:59:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (263, '2023-05-29 14:28:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 14:28:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (264, '2023-05-29 14:45:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 14:45:21', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (265, '2023-05-29 14:46:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 14:46:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (266, '2023-05-29 14:47:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-29 14:47:21', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (267, '2023-05-29 14:48:27', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 14:48:27', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (268, '2023-05-29 14:57:20', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-29 14:57:20', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (269, '2023-05-29 14:57:20', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-29 14:57:20', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (270, '2023-05-29 15:26:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 15:26:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (271, '2023-05-29 15:38:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 15:38:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (272, '2023-05-29 15:38:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 15:38:16', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (273, '2023-05-29 15:41:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 15:41:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (274, '2023-05-29 15:43:22', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 15:43:22', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (275, '2023-05-29 15:44:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-29 15:44:56', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (276, '2023-05-29 15:52:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-29 15:52:03', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (277, '2023-05-29 16:00:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 16:00:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (278, '2023-05-29 16:06:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 16:06:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (279, '2023-05-29 16:11:58', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 16:11:58', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (280, '2023-05-29 16:11:58', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 16:11:58', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (281, '2023-05-29 16:36:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 16:36:08', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (282, '2023-05-29 16:36:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 16:36:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (283, '2023-05-29 17:06:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-29 17:06:10', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (284, '2023-05-29 17:11:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 17:11:19', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (285, '2023-05-29 19:06:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 19:06:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (286, '2023-05-29 19:52:17', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 19:52:17', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (287, '2023-05-29 20:16:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-29 20:16:30', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (288, '2023-05-29 20:23:17', 'Windows终端', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 20:23:17', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (289, '2023-05-29 20:35:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-29 20:35:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (290, '2023-05-29 20:35:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-29 20:35:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (291, '2023-05-29 20:58:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 20:58:59', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (292, '2023-05-29 21:19:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-29 21:19:21', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (293, '2023-05-29 21:39:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 21:39:26', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (294, '2023-05-29 22:11:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 22:11:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (295, '2023-05-29 22:11:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-29 22:11:13', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (296, '2023-05-29 22:36:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 22:36:05', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (297, '2023-05-29 22:38:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 22:38:54', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (298, '2023-05-29 23:12:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-29 23:12:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (299, '2023-05-30 07:30:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-30 07:30:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (300, '2023-05-30 07:59:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-30 07:59:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (301, '2023-05-30 08:02:00', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 08:02:00', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (302, '2023-05-30 08:03:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 08:03:18', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (303, '2023-05-30 08:06:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 08:06:43', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (304, '2023-05-30 08:10:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 08:10:32', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (305, '2023-05-30 08:33:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 08:33:13', 10000, NULL);
INSERT INTO `t_system_operation_log` VALUES (306, '2023-05-30 08:33:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 08:33:13', 10000, NULL);
INSERT INTO `t_system_operation_log` VALUES (307, '2023-05-30 08:40:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 08:40:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (308, '2023-05-30 08:40:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 08:40:33', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (309, '2023-05-30 08:54:46', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 08:54:46', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (310, '2023-05-30 08:57:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-30 08:57:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (311, '2023-05-30 09:13:31', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:13:31', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (312, '2023-05-30 09:22:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 09:22:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (313, '2023-05-30 09:22:04', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 09:22:04', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (314, '2023-05-30 09:13:31', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:13:31', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (315, '2023-05-30 09:27:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:27:25', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (316, '2023-05-30 09:31:24', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:31:24', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (317, '2023-05-30 09:35:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 09:35:09', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (318, '2023-05-30 09:46:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:46:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (319, '2023-05-30 09:47:27', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 09:47:27', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (320, '2023-05-30 09:47:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:47:42', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (321, '2023-05-30 09:47:27', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 09:47:27', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (322, '2023-05-30 09:49:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:49:02', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (323, '2023-05-30 09:52:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 09:52:17', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (324, '2023-05-30 10:03:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:03:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (325, '2023-05-30 10:07:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 10:07:37', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (326, '2023-05-30 10:07:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 10:07:37', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (327, '2023-05-30 10:22:07', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:22:07', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (328, '2023-05-30 10:33:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:33:53', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (329, '2023-05-30 10:34:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:34:56', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (330, '2023-05-30 10:34:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:34:56', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (331, '2023-05-30 10:34:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:34:56', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (332, '2023-05-30 10:56:28', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:56:28', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (333, '2023-05-30 11:00:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 11:00:50', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (334, '2023-05-30 11:00:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-30 11:00:50', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (335, '2023-05-30 11:07:14', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-30 11:07:14', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (336, '2023-05-30 10:34:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:34:56', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (337, '2023-05-30 10:34:56', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 10:34:56', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (338, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (339, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (340, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (341, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (342, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (343, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (344, '2023-05-30 11:40:03', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 11:40:03', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (345, '2023-05-30 12:53:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 12:53:50', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (346, '2023-05-30 12:53:50', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 12:53:50', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (347, '2023-05-30 13:15:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 13:15:37', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (348, '2023-05-30 13:26:45', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 13:26:45', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (349, '2023-05-30 13:45:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 13:45:32', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (350, '2023-05-30 13:45:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 13:45:32', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (351, '2023-05-30 13:45:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 13:45:32', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (352, '2023-05-30 13:56:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VP84QTF', '18-56-80-A3-3B-21', '127.0.0.1', '内网IP', 0, '2023-05-30 13:56:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (353, '2023-05-30 14:02:57', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 14:02:57', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (354, '2023-05-30 14:24:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 14:24:02', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (355, '2023-05-30 14:24:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 14:24:02', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (356, '2023-05-30 14:34:22', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 14:34:22', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (357, '2023-05-30 14:54:43', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 14:54:43', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (358, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (359, '2023-05-30 15:09:33', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 15:09:33', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (360, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (361, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (362, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (363, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (364, '2023-05-30 15:02:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 15:02:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (365, '2023-05-30 16:14:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 16:14:44', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (366, '2023-05-30 16:14:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 16:14:44', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (367, '2023-05-30 17:20:54', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-30 17:20:54', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (368, '2023-05-30 19:07:02', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'Ash', '70-CD-0D-C6-C8-A7', '127.0.0.1', '内网IP', 0, '2023-05-30 19:07:02', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (369, '2023-05-30 20:30:38', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-ACS0TMJG', '14-5A-FC-17-85-C5', '127.0.0.1', '内网IP', 0, '2023-05-30 20:30:38', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (370, '2023-05-30 21:55:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-30 21:55:09', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (371, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (372, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (373, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (374, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (375, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (376, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (377, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (378, '2023-05-30 22:29:06', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-30 22:29:06', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (379, '2023-05-31 08:08:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:08:17', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (380, '2023-05-31 08:08:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:08:17', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (381, '2023-05-31 08:08:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:08:17', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (382, '2023-05-31 08:08:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:08:17', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (383, '2023-05-31 08:26:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:26:40', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (384, '2023-05-31 08:26:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:26:40', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (385, '2023-05-31 08:31:08', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:31:08', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (386, '2023-05-31 08:33:01', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-31 08:33:01', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (387, '2023-05-31 08:35:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:35:55', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (388, '2023-05-31 08:38:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:38:32', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (389, '2023-05-31 08:38:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:38:32', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (390, '2023-05-31 08:38:32', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 08:38:32', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (391, '2023-05-31 09:12:19', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 09:12:19', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (392, '2023-05-31 09:17:22', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:17:22', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (393, '2023-05-31 09:25:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:25:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (394, '2023-05-31 09:29:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:29:21', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (395, '2023-05-31 09:29:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:29:21', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (396, '2023-05-31 09:29:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:29:21', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (397, '2023-05-31 09:29:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:29:21', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (398, '2023-05-31 09:29:21', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 09:29:21', 10011, 'admin8');
INSERT INTO `t_system_operation_log` VALUES (399, '2023-05-31 09:36:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 09:36:09', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (400, '2023-05-31 10:09:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 10:09:55', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (401, '2023-05-31 10:09:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 10:09:55', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (402, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (403, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (404, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (405, '2023-05-31 10:33:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 10:33:55', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (406, '2023-05-31 10:52:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 10:52:44', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (407, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (408, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (409, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (410, '2023-05-31 10:12:52', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-05-31 10:12:52', 10014, 'admin7');
INSERT INTO `t_system_operation_log` VALUES (411, '2023-05-31 11:12:29', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 11:12:29', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (412, '2023-05-31 11:20:26', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-05-31 11:20:26', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (413, '2023-05-31 16:28:16', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'DESKTOP-OLMQEO2', '00-15-5D-3D-DC-01', '127.0.0.1', '内网IP', 0, '2023-05-31 16:28:16', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (414, '2023-05-31 19:15:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-31 19:15:09', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (415, '2023-05-31 19:15:09', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-9J0PL4J', '00-15-5D-E3-F2-93', '127.0.0.1', '内网IP', 0, '2023-05-31 19:15:09', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (416, '2023-05-31 23:11:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 10', 'DESKTOP-VF44F7E', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-05-31 23:11:35', NULL, NULL);
INSERT INTO `t_system_operation_log` VALUES (417, '2023-06-01 10:09:51', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 10:09:51', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (418, '2023-06-01 10:12:10', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 10:12:10', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (419, '2023-06-01 10:24:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 10:24:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (420, '2023-06-01 11:03:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 11:03:47', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (421, '2023-06-01 11:35:18', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 11:35:18', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (422, '2023-06-01 12:11:42', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:11:42', 10015, 'admin10');
INSERT INTO `t_system_operation_log` VALUES (423, '2023-06-01 12:16:13', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:16:13', 10015, 'admin10');
INSERT INTO `t_system_operation_log` VALUES (424, '2023-06-01 12:46:15', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'Windows 10', 'LAVACLONE', '58-A0-23-39-08-14', '127.0.0.1', '内网IP', 0, '2023-06-01 12:46:15', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (425, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10015, 'admin10');
INSERT INTO `t_system_operation_log` VALUES (426, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10007, 'admin4');
INSERT INTO `t_system_operation_log` VALUES (427, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (428, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10007, 'admin4');
INSERT INTO `t_system_operation_log` VALUES (429, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (430, '2023-06-01 12:59:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 12:59:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (431, '2023-06-01 13:18:59', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 13:18:59', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (432, '2023-06-01 14:17:55', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 14:17:55', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (433, '2023-06-01 14:28:40', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 14:28:40', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (434, '2023-06-01 16:03:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:03:25', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (435, '2023-06-01 16:03:25', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:03:25', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (436, '2023-06-01 16:23:23', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:23:23', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (437, '2023-06-01 16:34:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:34:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (438, '2023-06-01 16:34:30', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:34:30', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (439, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (440, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (441, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (442, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (443, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (444, '2023-06-01 16:46:47', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 16:46:47', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (445, '2023-06-01 16:55:53', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 16:55:53', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (446, '2023-06-01 17:02:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 17:02:05', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (447, '2023-06-01 17:02:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 17:02:05', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (448, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (449, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (450, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (451, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (452, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (453, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (454, '2023-06-01 18:29:48', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:29:48', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (455, '2023-06-01 18:48:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:48:44', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (456, '2023-06-01 18:48:44', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 'Windows 11', 'LAPTOP-LS9CBS64', '00-50-56-C0-00-08', '127.0.0.1', '内网IP', 0, '2023-06-01 18:48:44', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (457, '2023-06-01 19:05:35', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 19:05:35', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (458, '2023-06-01 19:41:37', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 19:41:37', 10000, 'admin');
INSERT INTO `t_system_operation_log` VALUES (459, '2023-06-01 20:23:05', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 20:23:05', 10019, 'test3');
INSERT INTO `t_system_operation_log` VALUES (460, '2023-06-01 20:30:17', 'Windows终端', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.57', 'Windows 10', 'OM1GA', 'A8-93-4A-2F-F2-E5', '127.0.0.1', '内网IP', 0, '2023-06-01 20:30:17', 10000, 'admin');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别(0:保密 1:男 2:女)',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `marriage` tinyint NULL DEFAULT NULL COMMENT '婚姻(0: 未婚 1:已婚)',
  `account_type` tinyint NULL DEFAULT NULL COMMENT '户口(0:城市户口1:农村户口)',
  `party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '党派',
  `domicile_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍所在地',
  `rental_type` tinyint NULL DEFAULT NULL COMMENT '租住类型(0:长居 1:短住)',
  `stay_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '暂住证号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住址',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识(0:未删除 1:已删除)',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'other1', 2, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/a26f66658e014e06aa70e2753742bef3.jpg', '15995376582', '张之维', '1992年10月5日', '汉', 0, 0, '无党派人士', '江苏南京', 0, NULL, '江苏南京', 0, 1, '2023-05-24 16:13:21', 1, '2023-06-01 17:05:02');
INSERT INTO `t_user` VALUES (2, 'lsc123', 1, 'https://flobby529.oss-cn-nanjing.aliyuncs.com/aixin.jpg', '18888888888', '王晓刚', '1980-08-02', '汉', 0, 0, '党员', '江苏宿迁', 0, NULL, '江苏省昆山市陆家镇', 0, 1, '2023-05-25 22:00:20', 2, '2023-05-31 16:30:18');
INSERT INTO `t_user` VALUES (3, 'zoe', 0, 'https://s1.ax1x.com/2023/03/20/ppNuvzn.png', '14356775321', '佐伊', '1550-06-11', '汉', 0, 0, '无党派人士', '江苏宜兴', 0, NULL, '江苏无锡', 0, 1, '2023-05-29 20:15:14', 1, '2023-05-29 20:15:18');
INSERT INTO `t_user` VALUES (4, 'abu', 0, 'https://public-cdn-oss.mosoteach.cn/avatar/2019/E1/98b642757c420f0907ee54db4dd21217.jpg?v=1569460487&x-oss-process=style/s300x300', '13838489572', '疾风剑豪', '1999-06-20', '汉', 0, 0, '无党派人士', '浙江宁波', 0, NULL, '浙江宁波', 0, 1, '2023-05-29 20:49:14', 1, '2023-05-29 20:49:19');
INSERT INTO `t_user` VALUES (5, '鸡你太美', 0, 'https://p6.toutiaoimg.com/origin/user-avatar/7404256ed8ffc327e30d2054294d58d4', '16666666666', '蔡徐坤', '1981-03-17', '汉', 0, 0, '无党派人士', '浙江温州', 0, NULL, '浙江温州', 0, 1, '2023-05-30 09:07:31', 1, '2023-05-30 09:07:35');
INSERT INTO `t_user` VALUES (6, 'flobby', 0, '#', '18962521753', 'flobby', '1919-01-01', '汉', 0, 0, '党派', '江苏苏州', 0, NULL, '江苏苏州', 0, 6, '2023-05-30 16:55:23', 6, '2023-05-30 16:55:26');

-- ----------------------------
-- Table structure for t_visitor
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor`;
CREATE TABLE `t_visitor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `owner_id` bigint NOT NULL DEFAULT 1 COMMENT '绑定业主id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访客姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权人手机号',
  `door_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁表主键，关联访客允许访问入口，用”,” 分割（1，2，3，4）',
  `status` tinyint NULL DEFAULT 0 COMMENT '访问状态（0：已经访问1：未访问）',
  `count` int NULL DEFAULT 0 COMMENT '访问次数',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT 10000 COMMENT '创建者',
  `updater` bigint NULL DEFAULT 10000 COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor
-- ----------------------------
INSERT INTO `t_visitor` VALUES (1, 0, '汪涵', '1231414', '1', 0, 11, 0, '2023-05-25 19:44:19', 10000, 10000, '2023-05-25 19:44:19');
INSERT INTO `t_visitor` VALUES (2, 2, '焊缝', '12345678999', '1,3,4', 0, 2, 0, '2023-05-29 18:53:03', 10000, 10000, '2023-05-29 18:53:03');
INSERT INTO `t_visitor` VALUES (3, 3, '王峰', '12345678901', '1,3', 0, 12, 0, '2023-05-29 18:54:05', 10000, 10000, '2023-05-29 18:54:05');
INSERT INTO `t_visitor` VALUES (4, 5, '冯韩', '12735507846', '3,4', 0, 0, 0, '2023-05-29 18:54:50', 10000, 10000, '2023-05-29 18:54:50');
INSERT INTO `t_visitor` VALUES (5, 1, '汪涵', '1231414', '1', 0, 2, 0, '2023-05-30 10:19:45', 10000, 10000, '2023-05-30 10:19:45');
INSERT INTO `t_visitor` VALUES (6, 0, '', '', '', 0, 0, 0, '2023-05-31 09:58:50', 0, 0, '2023-05-31 09:58:50');

-- ----------------------------
-- Table structure for t_visitor_invitation
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor_invitation`;
CREATE TABLE `t_visitor_invitation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `visitor_id` bigint NOT NULL COMMENT '访客表主键',
  `user_id` bigint NOT NULL COMMENT '绑定用户id',
  `door_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁表主键，关联访客允许访问入口，用”,” 分割（1，2，3，4）',
  `end_time` datetime(0) NOT NULL COMMENT '访问结束时间，判断是否可访问',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常 1：禁用），判断是否可访问',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `house_id` bigint NOT NULL DEFAULT 1 COMMENT '房屋id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor_invitation
-- ----------------------------
INSERT INTO `t_visitor_invitation` VALUES (1, 1, 10000, '1,3', '2023-05-25 19:44:19', 0, 0, '2023-05-23 20:05:06', 10000, 10000, '2023-05-25 20:05:06', 1);
INSERT INTO `t_visitor_invitation` VALUES (2, 2, 10001, '1,2,3', '2023-05-24 16:05:18', 0, 0, '2023-05-23 16:05:30', 10000, 10000, '2023-05-29 16:05:30', 2);
INSERT INTO `t_visitor_invitation` VALUES (3, 3, 10005, '2,3', '2023-05-25 18:56:57', 0, 0, '2023-05-24 18:57:13', 10000, 10000, '2023-05-29 18:57:13', 12);
INSERT INTO `t_visitor_invitation` VALUES (4, 4, 10004, '3', '2023-05-30 18:57:29', 0, 0, '2023-05-29 18:57:36', 10000, 10000, '2023-05-29 18:57:36', 21);
INSERT INTO `t_visitor_invitation` VALUES (5, 1, 10000, '1', '2023-05-31 10:02:49', 0, 0, '2023-05-30 10:03:07', 10000, 10000, '2023-05-30 10:03:07', 1);

SET FOREIGN_KEY_CHECKS = 1;
