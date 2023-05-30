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

 Date: 30/05/2023 09:46:23
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
) ENGINE = InnoDB AUTO_INCREMENT = 10016 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES (10000, 'admin', '{bcrypt}$2a$10$LDTNfpPt/xABqtxksFide.YkBwm4GPwhMm8yzNQCROCRbUqmsbQAW', '17384438260', '1', '1', 1, '302f8288cc81493b9a7ff0f5af1e7f67', 0, 10000, '2023-05-23 13:19:07', NULL, '2023-05-30 09:46:03');
INSERT INTO `sys_admin` VALUES (10001, 'ls', '{bcrypt}$2a$10$CgCmsYWZDcIj.SbtyJq6AuatQKRhSai2hhGI6Ni87T.qrecjGIwAa', NULL, '1', '0', 0, NULL, 1, 10000, '2023-05-24 07:42:19', 10000, '2023-05-24 07:42:19');
INSERT INTO `sys_admin` VALUES (10003, 'otter', '{bcrypt}$2a$10$KFD3jQ4UX7FSOsmYVq.agO5hVvSo/wVZt/80KyVGPGDpZkq/gZA2O', '15729611641', '1', '1', 0, NULL, 0, 10000, '2023-05-24 15:48:21', 10000, '2023-05-24 15:48:24');
INSERT INTO `sys_admin` VALUES (10004, 'lisi', '{bcrypt}$2a$10$gyCi9JcdJIm3JeT7MJ.esOWF4E50OzeVQFAv/vhBcqiphTp/qp.kW', NULL, '1', '0', 0, NULL, 0, 10000, '2023-05-27 13:03:26', 10000, '2023-05-27 13:03:26');
INSERT INTO `sys_admin` VALUES (10005, 'lisi2', '{bcrypt}$2a$10$CBN5m/bTcIZ8FHZr00fa..TgEUMfCC9nVY714ha0C4BvNz2UEEjpq', NULL, '1', '0', 0, NULL, 0, 10000, '2023-05-27 13:12:26', 10000, '2023-05-27 13:12:26');
INSERT INTO `sys_admin` VALUES (10006, 'admin3', '{bcrypt}$2a$10$DNCNN4.tWvMH9yY1A6mqHO6i8hmgk12Ad/w0h5dLHPdlkrx746Izq', NULL, '1', '0', 0, NULL, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin_department
-- ----------------------------
INSERT INTO `sys_admin_department` VALUES (1, 10003, 7, 0, 10000, '2023-05-25 16:11:21', 10000, '2023-05-25 16:11:27');
INSERT INTO `sys_admin_department` VALUES (2, 10006, 1, 0, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05');
INSERT INTO `sys_admin_department` VALUES (3, 10006, 2, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06');

-- ----------------------------
-- Table structure for sys_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_info`;
CREATE TABLE `sys_admin_info`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADMIN_ID` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  `REAL_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `AVATAR` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_admin_info
-- ----------------------------
INSERT INTO `sys_admin_info` VALUES (1, 10000, '张三', 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/avatar/me.jpg', 1, 1, 'admin@gmail.com', NULL, '10000', '江苏南京', '南京大学', '2023-05-23 14:11:17', '博士', '金融管理', '超管', 0, 0, 10000, '2023-05-23 14:12:25', 10000, '2023-05-23 14:12:32', '2023-05-30 09:46:02');
INSERT INTO `sys_admin_info` VALUES (2, 10001, '陶然然', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 10000, '2023-05-24 07:42:19', 10000, '2023-05-24 07:42:19', NULL);
INSERT INTO `sys_admin_info` VALUES (4, 10004, '李四', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-27 13:03:26', 10000, '2023-05-27 13:03:26', NULL);
INSERT INTO `sys_admin_info` VALUES (5, 10005, '李四2', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-27 13:12:26', 10000, '2023-05-27 13:12:26', NULL);
INSERT INTO `sys_admin_info` VALUES (7, 10006, '默认用户名', 'hangzhou.aliyuncs.com/avatar/me.png', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06', NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_admin_post
-- ----------------------------
INSERT INTO `sys_admin_post` VALUES (1, 1, 10006, 0, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05');
INSERT INTO `sys_admin_post` VALUES (2, 2, 10006, 0, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05');
INSERT INTO `sys_admin_post` VALUES (3, 1, 10006, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06');
INSERT INTO `sys_admin_post` VALUES (4, 2, 10006, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06');

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
INSERT INTO `sys_department` VALUES (5, 0, '测试', '测试', '1', 0, 10000, '2023-05-25 16:10:04', 10000, '2023-05-25 16:10:04');
INSERT INTO `sys_department` VALUES (6, 5, '测试子', '测试子', '0', 1, 10000, '2023-05-25 16:10:16', 10000, '2023-05-25 16:10:20');
INSERT INTO `sys_department` VALUES (7, 5, '测试子', '测试子', '0', 0, 10000, '2023-05-25 16:10:34', 10000, '2023-05-25 16:11:41');

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
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '停用', '0', 'danger', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (2, 1, '正常', '1', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (3, 2, '男', '0', 'primary', '', 0, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (4, 2, '女', '1', 'success', '', 1, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
INSERT INTO `sys_dict_data` VALUES (5, 2, '未知', '2', 'warning', '', 2, 0, 10000, '2023-05-13 19:37:15', 10000, '2023-05-13 19:37:15');
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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统权限表' ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `TERMINAL_TYPE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '终端类型',
  `BROWSER_TYPE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `OS` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `DEVICE_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `DEVICE_MAC` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'MAC地址',
  `LOGIN_IP` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `ADDRESS` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '1001', '产品经理', 0, 0, 10000, '2023-05-29 15:27:22', 10000, '2023-05-29 15:29:09');
INSERT INTO `sys_post` VALUES (2, '1002', '软件测试', 0, 0, 10000, '2023-05-29 15:43:47', 10000, '2023-05-29 15:43:47');

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
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）;数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, 10000, '2023-05-23 14:50:38', 10000, '2023-05-29 20:52:20', '超级管理员', '超级管理员', 0, NULL);
INSERT INTO `sys_role` VALUES (2, 1, 10000, '2023-05-24 08:28:06', 10000, '2023-05-24 09:08:33', '测试角色', '测试角色', NULL, 1);
INSERT INTO `sys_role` VALUES (3, 1, 10000, '2023-05-25 05:33:28', 10000, '2023-05-29 15:29:00', 'test', 'test', NULL, 3);
INSERT INTO `sys_role` VALUES (4, 1, 10000, '2023-05-26 10:41:44', 10000, '2023-05-26 10:46:53', 'test', 'test', NULL, 3);
INSERT INTO `sys_role` VALUES (5, 0, 10000, '2023-05-26 10:41:44', 10000, '2023-05-26 10:46:53', '保安', '保安', NULL, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色管理员关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_admin
-- ----------------------------
INSERT INTO `sys_role_admin` VALUES (1, 0, 10000, '2023-05-23 14:50:02', 10000, '2023-05-23 14:50:07', 1, 10000);
INSERT INTO `sys_role_admin` VALUES (2, 1, 10000, '2023-05-24 08:45:49', 10000, '2023-05-24 08:45:49', 2, 10001);
INSERT INTO `sys_role_admin` VALUES (3, 1, 10000, '2023-05-24 08:45:50', 10000, '2023-05-24 08:45:50', 2, 10003);
INSERT INTO `sys_role_admin` VALUES (4, 0, 10000, '2023-05-24 08:45:50', 10000, '2023-05-24 08:45:50', 5, 10004);
INSERT INTO `sys_role_admin` VALUES (5, 0, 10000, '2023-05-24 08:45:50', 10000, '2023-05-24 08:45:50', 5, 10005);
INSERT INTO `sys_role_admin` VALUES (6, 0, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05', 1, 10006);
INSERT INTO `sys_role_admin` VALUES (7, 0, 10000, '2023-05-30 09:26:05', 10000, '2023-05-30 09:26:05', 5, 10006);
INSERT INTO `sys_role_admin` VALUES (8, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06', 1, 10006);
INSERT INTO `sys_role_admin` VALUES (9, 0, 10000, '2023-05-30 09:35:06', 10000, '2023-05-30 09:35:06', 5, 10006);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色数据权限关系表' ROW_FORMAT = DYNAMIC;

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
  `authority_id` bigint NULL DEFAULT NULL COMMENT '权限ID',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色操作记录表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES (1, 1, '17384438260', '{bcrypt}$2a$10$FKr3uO5tPwqhrfTmqMlfLeuEdlB7sGmSVEWBGFIFpxXpHqesZq0CC', '123123', '8087832', 0, 0, 1, '2023-05-24 15:54:20', 1, '2023-05-24 15:54:23');
INSERT INTO `t_account` VALUES (2, 2, '18888888888', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', '', 0, 0, 1, '2023-05-25 21:09:50', 1, '2023-05-25 21:09:53');
INSERT INTO `t_account` VALUES (3, 4, '13838489572', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', NULL, 0, 0, 1, '2023-05-29 20:44:27', 1, '2023-05-29 20:44:30');
INSERT INTO `t_account` VALUES (4, 5, '16666666666', '{bcrypt}$2a$10$zJunDEdPkJuzVuTfO.jmxeNX/izaxMrBWeJIJKMoecxZ6EV3QQ03C', '123456', NULL, 0, 0, 1, '2023-05-30 09:02:42', 1, '2023-05-30 09:02:45');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES (1, 1, '1', 5, '心理健康讲座系列', 1, '心理健康节系列活动回顾', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">5·25，谐音“我爱我”。在2022年5月25日大学生心理健康节到来之际，北京大学学生心理健康教育与咨询中心推出了独具特色的“北京大学5·25心理健康系列活动”，系列活动由北京大学学生心理健康教育与咨询中心主办，各院系积极参与主动承办，活动包括：<strong>“檐下心声奏和弦，楼与时光共青春”和谐宿舍创意大赛、“妙笔绘心，筑梦青春”心理漫画大赛、“强心健体，未来有我”心理成长主题演讲比赛、“与经典为友”心悦读读后感征集活动、“心向暖阳，遇见幸福”生活中的微感动打卡活动</strong>以及<strong>5·25当天举办的“赏心未名·乐享青春”系列直播活动</strong>6类系列主题活动，累计参与活动近4万人次，系列活动为疫情之下为学生们带来了温暖和陪伴，在校园内营造了欢乐温馨、青春向上的健康心理体验环境和氛围</span><strong><span style=\"font-size:21px;font-family:仿宋;\">。</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">一、北京大学5·25大学生心理健康节</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">“檐下心声奏和弦，楼与时光共青春”和谐宿舍创意大赛</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">和，集宿舍之美；谐，博宿舍之爱。为不断提升大学生心理素质教育工作实效，北京大学承办了北京市教育工委的“檐下心声奏和弦，楼与时光共青春”——2022年首都大学生心理健康节和谐宿舍创意大赛。驻楼辅导员工作组积极响应并参与承办，大赛自4月14日开赛以来，共计收到来自38所高校的295份作品，包含119个图文及176个视频，经过紧张细致的评审，最终15份优秀作品脱颖而出。大赛以视频短片或和谐宿舍图文总结等相结合的形式，讲述大学生宿舍关系发展的故事，发掘和推广行之有效、富有创意的宿舍关系建设方法，促进大学生掌握营造和谐的宿舍氛围的方法，帮助学生积极提升主动的沟通能力，培养健全的人格品<span>质。</span></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652948.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652949.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652950.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">二、北京大学5·25大学生心理健康节</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">“赏心未名·乐享青春”系列直播活动</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">2022年5月24日至25日，北京大学学生心理健康教育与咨询中心连续两天一夜以线上直播的方式和学生一起赏燕园美景和朝阳升起、观精彩电影与和谐宿舍展播、聆听精彩纷呈的线上音乐会，尽管疫情形势依然严峻，但我们的陪伴一直都在。直播通过学生心理健康教育与咨询中心视频号播出，截至发稿前已逾7500人次观看本次系列直播。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652951.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">直播陪伴者</span><span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">学生心理健康教育与咨询中心</span><span style=\"font-family:宋体;\">专职教师 李婷婷</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">（一）神奇动物在哪里——云赏燕园活动</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">燕园是一个丰富多样的生态圈，园子里充满生机的花草树木、可爱灵动的小动物，为我们提供了亲近自然、放松身心的温馨氛围。初夏的燕园，草木葱郁，阳光明媚，微风怡人。5月24日下午，李婷婷老师和中心工作人员带我们跟随镜头，一起观赏燕园美景，探访园中的小动物们。猫咪、鸟儿、鸭子、苍鹭……镜头下的它们有的温顺乖巧，有的睡意未尽，不时引来同学们驻足围观。直播期间，李婷婷老师还向我们介绍了燕园猫的生活习性和饮食偏好，提醒同学们在逗猫时注意卫生、防止被抓伤。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652952.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652953.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652954.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652955.png\" alt=\"\" /></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">值得一提的是，当天下午直播时还发生了一个小插曲。一只刚出壳不久却落单的小鸳鸯在未名湖中奋力挣扎，险些没入水中，中心工作人员发现后立即用工具将它营救上岸，为它恢复体温，小鸳鸯在阳光下逐渐晒干羽毛、恢复体力，最终中心工作人员联系到绿色生命协会的同学到场，对小鸳鸯进行专业救治。我们既为此感到喜悦，也为小鸳鸯坚韧、顽强的生命力所打动。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652956.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652957.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">（二）影中有真意，欲辨已忘言——心理电影推介活动</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">人们在成长的过程中，总会经历各种冲突和矛盾，我们也正是在这一过程中获得成长。5月24日晚上7点，中心专职心理咨询师赵亮选取《大话西游》、《盗梦空间》、《头脑特工队》、《包宝宝》四部影片，带领我们从心理学的视角看电影。赵亮老师通过剖析影片中的至尊宝等人物与自己、与外界的冲突，启发我们自觉地体察自我感受，只有直面内心的感受，才能实现对自我的超越。生动形象的亲子动画短片，则引发我们对亲子关系的思考。孩子在成长的过程中，或许只有实现与父母在某种意义上的“分离”，才能实现真正的独立，进而建立起平衡的亲子关系。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652958.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652959.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652960.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652961.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">（三）旭日衔博雅，晴云洗绿湖——日出慢直播活动</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">回归心灵的宁静、心怀蓬勃的希望是爱自己的开始。5月25日凌晨4点的未名湖畔夜色尚浓，博雅塔静静伫立，远处时而传来虫鸣生。随着黎明渐至，朝阳从博雅塔一侧缓缓升起，逐渐照亮整个天空。在最美的时节里，我们跟随镜头在夜的宁静中回归内心的平静，从朝阳的升起中找寻生命的力量，感受旭日蓬勃、水波温柔，美丽的日出治愈了一切的不美丽。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652962.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652963.png\" alt=\"\" />&nbsp;<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652964.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:36px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:29px;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">（四）檐下心声奏和弦，楼与时光共青春——和谐宿舍优秀作品展播</span></strong><span style=\"font-size:21px;font-family:仿宋;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:29px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">在5·25心理健康节到来之际，中心特别推出<strong>和谐宿舍优秀作品展播活动</strong>。来自北京大学、北京联合大学等多所高校的同学们，向大家展示了他们丰富多彩的宿舍集体生活：一起去天安门看升国旗、一起学习和参加社会实践、一起在生日会上许下心愿、利用专业知识打造智能宿舍、坚持退伍不褪色的作风和生活习惯……这些充满欢笑与温情的视频，集合了同学们大学时代最美好的青春记忆，也向我们展现了新时代大学生团结友爱、青春阳光、奋发向上的精神面貌。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">（五）“乐”享青春、“乐”享未来——多校区联动线上音乐会</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">音乐，是比一切智慧、一切哲学更高的启示。我们相遇在歌声里，会迸发出如何更好地与自己、与他人相处的启示。2022年5月25日下午2点，中心联动校团委及各校区相关单位，共同举办了一场青春激扬的线上音乐会。<strong>来自燕园校区、学院路校区、万柳学区、大兴校区以及深圳研究生院</strong>的同学们，为我们倾情演唱了《最初的梦想》、《我们都是追梦人》、《和你一样》等10余首经典歌曲，在音乐的律动中带我们一起“乐”享青春、“乐”享未来，激扬青春力量！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652965.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">燕园校区</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:&quot;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652966.png\" alt=\"\" /></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">学院路校区</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:&quot;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652967.png\" alt=\"\" /></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">深圳研究生院</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652968.png\" alt=\"\" /><span style=\"font-family:&quot;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">万柳学区</span><span style=\"font-family:&quot;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:&quot;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652969.png\" alt=\"\" /></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-family:宋体;\">大兴校区</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">5月25日下午5点，北京大学学生心理健康教育与咨询中心525心理健康节“赏心未名·乐享青春”系列活动在歌声中圆满结束。两天的时间里，燕园的景、丛中的猫、片中的意、塔上的日、室中的情、心中的歌，为我们留下了温馨且富有意义的525记忆，也启发着我们去思考并建立与自我、与他人、与环境的和谐关系。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">三、北京大学5·25大学生心理健康节</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">“妙笔绘心，筑梦青春”心理漫画大赛</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">4月初，由生命科学学院承办的2022年“妙笔绘心，筑梦青春”北京大学心理漫画大赛顺利开展，截止5月4日，共收到漫画作品17件，其中获奖作品7件，在疫情下的紧张环境中，引导大学生将积极心态与艺术创作紧密结合，诠释心理健康理念、普及心理健康知识、激发内在心理韧性，提升了学生的创造力与获得感。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7652970.png\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<span style=\"font-family:仿宋;font-size:18px;\">北京大学物理学院 徐诗睿</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-family:仿宋;font-size:18px;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">不要把有限长度的生（绳）命，浪费在无谓的纠结上。人生短短百年，更要活得洒脱。解开心中结，抬头往前看，直率向前冲！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7653025.png\" alt=\"\" /><span style=\"font-family:仿宋;font-size:18px;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<span style=\"font-size:18px;\"><span style=\"font-family:仿宋;\">北京大学生命科学学院</span><span style=\"font-family:Calibri, sans-serif;\">&nbsp;</span><span style=\"font-family:仿宋;\">杨悦</span></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">作品名称为《Run Away》，画面的主体是一个凌乱的房间，房间内唯二的光源分别来自电脑屏幕和半掩着的房门外，象征着大学生的生活现状：是沉迷于虚拟世界还是走出房门？房间的主人不知去向，但半开的房门或许暗示着他已经逃离了封闭、逼仄、困住自己的小小房间。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7653026.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-size:18px;\"><span style=\"font-family:仿宋;\">北京大学法学院</span>&nbsp;<span style=\"font-family:仿宋;\">林昱睿</span></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:18px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">迁徙、存储食物、换毛、冬眠是动物过冬的四种主要方式。看到其他动物都在准备过冬，小熊也感到焦虑，可对它而言，好好冬眠就足够了。不必为他人的行动焦虑，找到并做好自己的事情已经很棒了。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">四、北京大学5·25大学生心理健康节</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;text-align:center;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">“强心健体，未来有我”心理成长主题演讲比赛</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">2022年4月下旬，由法学院承办的“强心健体，未来有我”心理成长主题演讲比赛拉开序幕，参赛选手们用声音讲述了自己的故事，传递着温暖与力量，最终3位选手进入到决赛环节。因疫情防控政策要求，本次比赛的决赛只能采用线上形式进行，但这并不能阻碍学生与选手们产生心灵共鸣。勇敢坚韧、乐于奉献的他们，为我们树立了榜样。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<span style=\"font-size:18px;font-family:仿宋;\"><img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7653027.png\" alt=\"\" /></span>\r\n</p>\r\n<p style=\"text-align:center;background:none 0% 0% repeat scroll white;font-family:仿宋;font-size:18px;\">\r\n	北京大学法学院2020级法律硕士 杨佳璇\r\n</p>\r\n<p style=\"color:#505050;background-color:#FFFFFF;font-family:仿宋;font-size:18px;text-align:center;\">\r\n	演讲题目：《凝心铸魂，功不唐捐》\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">演讲佳句：</span></strong><span style=\"font-size:21px;font-family:仿宋;\">从“百年大道，风华正茂，百年初心，历久弥坚”到“燃情冰雪，志愿相约，冰新一代，一起向未来”，过去的一年里，党和国家喜迎盛世，当代青年生逢其时，作为其中的一份子，我荣幸地亲历并见证着。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:24px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">功成不必在我，功成必定有我。青春之火点燃冬奥，冬奥之光照亮青春！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:24px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">从“鸟巢一代”到“冰新一代”，北大青年用行动书写青春担当，用奉献谱写北大人的奥运新篇。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:24px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">眼底未名水，胸中黄河月。无论是在新文化运动、五四运动和中国共产党成立的过程中，还是在新时代的征程上，青年一代的力量从未缺席。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">奋斗正青春，青春献给党，凝心铸魂、功不唐捐、强心健体、未来有我！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7653028.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;text-align:center;background:none 0% 0% repeat scroll white;font-family:仿宋;font-size:18px;\">\r\n	北京大学法学院2021级本科生熊文啸\r\n</p>\r\n<p style=\"color:#505050;text-align:center;background:none 0% 0% repeat scroll white;font-family:仿宋;font-size:18px;\">\r\n	演讲题目：《强心健体，未来有我》\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">演讲佳句：</span></strong><span style=\"font-size:21px;font-family:仿宋;\">人生如一场修行，得意时，一日看尽长安花；艰难时，又好似长松卧壑困风霜。但生命之火熊熊燃烧时，哪怕畏途巉岩不可攀，也要会当凌绝顶；哪怕无人会登临意，也要猛志固常在。从千古风流人物中，摄取九万里风鹏正举的力量，历练也无风雨也无晴的豁然，穷且益坚，我们不坠青云之志。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">如果你要问我为什么会有这个决定，或许时至今日我都无法做出明确的回答，我只知道我还能站得起来、我还能向前走。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">我们每个人都是在人间飘荡的一朵云，你无法决定自己什么时候消散，但你可以决定你要飘到哪里，沿途将有什么样的风景。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">只要不怕困难，敢于拼搏，未来谁都有可能成为自己的英雄。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	<img src=\"https://univs-news-1256833609.file.myqcloud.com/123/upload/resources/image/7653041.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;text-align:center;background:none 0% 0% repeat scroll white;font-family:仿宋;font-size:18px;\">\r\n	北京大学法学院2019级本科生王钰凯\r\n</p>\r\n<p style=\"color:#505050;text-align:center;background:none 0% 0% repeat scroll white;font-family:仿宋;font-size:18px;\">\r\n	演讲题目：《我的冬奥，我的约定》\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">演讲佳句：</span></strong><span style=\"font-size:21px;font-family:仿宋;\">身为一名志愿者，我也始终保持学习的心态，在把所学的法律知识融入到工作中的同时，也从工作实践汲取新的经验，学到很多在书本上课堂中看不到的东西，收获更大的进步和成长。这就是我与自己内心的一个约定。争取我与冬奥的双向奔赴：我用知识奉献冬奥，冬奥带给我新的知识，让冷峻的法律饱含奉献的真诚。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">同样的场景，从目送人变成被目送人，在那一刻，我感受到了传承的力量。北大从来不缺少奉献的热情，正是因为有这一次次的目送，有一代代为国家民族和世界的事业而奋斗的青年，才有了今天的北大和今天的我们。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">冬奥所留给我的，不仅是更高、更快、更强、更团结的理念，更是让微笑成为我们最美的名片：用微笑对待他人，用微笑对待挫折，用微笑对待每一段新的征程。就让这份收获也变成一份美丽的约定吧，激励我们所有人向着理想的彼岸勇敢进发！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">我们是属于奥运的一代，也是让青春绽放在奥运的一代！</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:28px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:28px;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">五、北京大学5·25大学生心理健康节</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:43px;\">\r\n	<strong><span style=\"font-size:21px;font-family:仿宋;\">“与经典为友”心悦读读后感征集活动</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:43px;\">\r\n	<span style=\"font-size:21px;font-family:仿宋;\">生活里没有书籍，就好像花草没有阳光。智慧里没有书籍，就好像鸟儿没有翅膀。品读经典，不单单是华丽辞藻的视觉盛宴，更让人体悟生命之意蕴，灵魂之震颤。阅读带来心灵滋养，也让成长变得有迹可循，由哲学系承办的“与经典为友”2022年北京大学心悦读读后感征集活动让学生打开心扉，讲述“书籍与心”的故事，分享心理历程，帮助当代大学生树立积极的生命观，正确的价值观、世界观，提高自身抗压、抗挫折能力，收获个人成长、心灵净化和乐观力量。</span>\r\n</p>', '雍和门', '312312', '312321', 0, '2023-05-24 22:37:45', '2023-05-24 22:37:45', 1, '2023-05-24 22:37:45', 12313, 213, '2023-05-24 22:37:45');
INSERT INTO `t_activity` VALUES (2, 2, '2', 2, '书本推荐', 2, '一本温暖的书——童年里一束温柔的光', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171213.png\" title=\"1.png\" alt=\"1.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;text-align:center;\">\r\n	零壹# 再 相 逢\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n假期在家收拾书桌，偶然间看到藏在书堆里的粉色书页，轻抽出这一本《窗边的小豆豆》，打开已经泛黄的书页，那些藏在内心深处的记忆似乎被唤醒，在小豆豆的童年故事中我好像又一次回到童年，看到那个曾无比羡慕小豆豆的自己，  &nbsp;<strong><span style=\"font-family:宋体;color:#BAA995;\">追回童年的那一份</span><span></span></strong>&nbsp; &nbsp;<span>久违的温暖与感动</span>&nbsp; &nbsp;<strong>。</strong>&nbsp;\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171214.png\" title=\"2.png\" alt=\"2.png\" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零贰&nbsp;</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">童 年 印 象</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">《窗边的小豆豆》讲述了作者黑柳彻子上小学时的一段真实的故事。作者因淘气被原学校退学后，来到巴学园。在小林校长的爱护和引导下，<strong><span style=\"color:#BAA995;\">让一般人眼里“怪怪”的小豆豆逐渐成了一个大家都能接受的孩子</span></strong>，并奠定了她一生的基础。这是我童年记忆中很重要的一本书，那所名为“巴学园”的学校是我童年时期无比盼望的“伊甸园”。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171215.png\" title=\"3.png\" alt=\"3.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">小豆豆是那样与众不同的一个小孩，她对世界真诚又好奇，可能不会表达，甚至不受人喜欢，所以在一年级就被原学校退学。但她幸运地走进了巴学园，电车改成的教室，可以根据个人喜好随意安排的座位和科目学习顺序，午后的散步郊游，别具特色的韵律操，<strong><span style=\"color:#BAA995;\">这所学校给了小豆豆最自由的教育和最温暖的鼓励。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">校长小林宗作先生是“小豆豆第一个真正喜欢的人”，他愿意倾听一个孩子长达4个小时的倾诉，而<strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">无论是之前，还是这以后，再也没有一个大人这么认真地听小豆豆说话了。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">生命中有这样一位慈爱关怀又深谙教育方式方法的校长，让小豆豆的成长更加顺利和欢乐，也给我的童年留下数不尽的幻想和期待：<span style=\"color:#3E3E3E;\">我也无比希望自己能进入这样一所自由的学校，拥有像父亲一样爱我的校长，在每一次相遇后都有人严肃而认真地告诉我：</span><strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">你真是一个好孩子。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零叁</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">被 唤 醒 的 记 忆</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在和朋友谈起与小豆豆的“再相逢”后，更多尘封的记忆被唤醒。小豆豆是我们童年共同的朋友，这份友谊来自于当时小学创立的图书角。为了让不甚熟悉的小朋友们尽快融入班级，老师建立图书角，每个人都可以分享自己最喜欢的一本书到“图书角”，而“小豆豆”就是由我分享的、图书角里最为“风靡”的一本书。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171216.jpg\" title=\"4.jpg\" alt=\"4.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在早早放学的午后，总会有一群孩子聚集在教室，有模有样地讨论着小豆豆的故事，话题广泛，从由两棵树构成的校门，到“山的味道，海的味道”的盒饭，从专为残疾的小伙伴举行的运动会到挚友泰明的离去和死亡；从欢乐的野炊到令人感动的士兵慰问……</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">孩子们的友谊建立得总是如此之快，对小豆豆</span><span style=\"font-family:宋体;\">共同的喜爱和好奇足以让一群陌生的孩子成为亲密的朋友。</span><strong><span style=\"color:#BAA995;\">小豆豆成为我们之间的情感媒介，情感的共鸣在不知不觉中促成了许多份友谊的生成。</span></strong>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171217.png\" title=\"5.png\" alt=\"5.png\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"></span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在我的记忆里，小豆豆不仅是一本温暖的书，更像是一位陪伴我童年的朋友，每每回忆起和朋友们一起在图书角讨论小豆豆的日子，我总会无比感慨，“小豆豆”的存在，<strong><span style=\"color:#BAA995;\">不仅温暖了我的童年，还链接了许多份来之不易的友情。</span></strong>现在想来，这或许就是这本书真正温暖的力量所在。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">零肆</span><span style=\"font-family:宋体;\">#&nbsp;</span><span style=\"font-family:宋体;\">做 一 个 摘 星 星 的 人</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">曾听过这样一段话：<strong><span style=\"color:#BAA995;\">随着时间流逝，记忆会逐渐模糊，你可能会逐渐淡忘和一个人相处的细节，忘记他说过的话，忘记他做过的事情，但却不会忘记和他相处的感觉。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">初读《小豆豆》的印象已经在我脑海中渐渐模糊，小豆豆曾经的生活环境，宠物等等生活的细节我已经很难回忆，但是那一份希冀和期望却一直留在我的内心。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171218.jpg\" title=\"6.jpg\" alt=\"6.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">小豆豆给同处幼年的我的内心种下一颗希望的种子，它告诉我<strong><span style=\"color:#BAA995;\">无论谁都有自己的优点和价值，每一种努力和热爱都值得被肯定，每一份真诚和热情都值得被接纳。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">在很多次受挫或者不被肯定的时候，我总希望我的身边也能有一位小林先生，他会轻拍着我的肩膀，严肃又郑重地告诉我：<strong><span style=\"color:#BAA995;\">“</span><span style=\"color:#BAA995;\">你真的是一个好孩子。”</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<img src=\"https://dxs.moe.gov.cn/zx/upload/resources/image/2021/02/24/7171219.jpg\" title=\"7.jpg\" alt=\"7.jpg\" />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">推荐《窗边的小豆豆》给大家，不仅因为它是我童年的记忆和美好的寄托，也<strong><span style=\"color:#BAA995;\">希望和祝愿大家能永远对自己保持信心，坚定地相信“我真的是一个好孩子啊”。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">希望我们都能像小豆豆一样，做一个独特的自己。</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><br />\r\n</span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">生活总是会有无数的悲伤，但也有独属于我们的感动。在无限的时间和空间里，我们都是无比渺小的一份子，我们可能常常失望迷茫，在或许哪一个感觉自己好像被全世界抛弃的夜晚，<strong><span style=\"color:#BAA995;\">也许童年的这一份小小的温暖能化作荧光点点，照亮我们前行的路途。</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\"><strong><span style=\"color:#BAA995;\"><br />\r\n</span></strong></span>\r\n</p>\r\n<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n	<span style=\"font-family:宋体;\">希望我们都能珍藏内心的那份感动，像小豆豆一样充满信心和勇气，<strong><span style=\"color:#BAA995;\">永远奔走在自己的热爱里，成为自己想要成为的人，在属于我们的“巴学园”恣意成长，收获美好。</span></strong></span>\r\n</p>', '秋名山', '312', '123123', 0, '2023-05-24 22:38:05', '2023-05-24 22:38:05', 1, '2023-05-24 22:38:05', 3123, 3213, '2023-05-24 22:38:05');
INSERT INTO `t_activity` VALUES (3, 3, '1', 3, '就业指导', 3, '不出校，找到“好婆家”！', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n		为深入贯彻党中央、国务院决策部署，落实《国务院办公厅关于进一步做好高校毕业生等青年就业创业工作的通知》（国办发〔2022〕13号）要求，进一步提升就业见习质量，人力资源和社会保障部、教育部、科技部、工业和信息化部、民政部、财政部、商务部、国务院国资委、共青团中央、全国工商联等10部门决定继续实施百万就业见习岗位募集计划。\r\n	</div>\r\n	<div class=\"detail-content con-font-center\" style=\"margin:35px 0px 0px;padding:0px;font-size:16px;color:#505050;font-family:&quot;background-color:#FFFFFF;\">\r\n		<p style=\"text-indent:2em;\">\r\n			各省、自治区、直辖市及新疆生产建设兵团人力资源和社会保障厅（局）、教育厅（委、局）、科技厅（委、局）、工业和信息化主管部门、民政厅（局）、财政厅（局）、商务厅（局）、国资委、团委、工商联，各中央企业：\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			就业见习是增强青年岗位实践能力的重要途径。2022年百万就业见习岗位募集计划（以下简称计划）首次实施以来，各地区、各有关部门聚焦青年求职需求，广泛开发见习岗位，多渠道搭建对接平台，帮助高校毕业生等青年提升就业能力，取得了积极成效。为深入贯彻党中央、国务院决策部署，落实《国务院办公厅关于进一步做好高校毕业生等青年就业创业工作的通知》（国办发〔2022〕13号）要求，进一步提升就业见习质量，人力资源和社会保障部、教育部、科技部、工业和信息化部、民政部、财政部、商务部、国务院国资委、共青团中央、全国工商联等10部门决定继续实施百万就业见习岗位募集计划。现将具体要求通知如下。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			一、总体要求\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			聚焦离校两年内未就业高校毕业生和16-24岁失业青年需求，着力广覆盖、提质量、优服务，做到数量有保障，全年继续募集不少于100万个就业见习岗位，力争全年岗位总量不低于上年，确保有见习意愿的高校毕业生等青年都能获得见习机会；质量有提升，发布一批示范性岗位，创建一批国家级高校毕业生就业见习示范单位，增强见习吸引力；服务有品质，完善见习供需对接平台，加大就业见习组织力度，提升见习服务保障能力，形成有利于促进高校毕业生等青年就业长效机制。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			二、工作任务\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（一）精准锁定见习对象。聚焦离校未就业毕业生、登记失业青年，通过实名信息数据库、求职登记小程序和失业登记库分类开展走访摸排，及早确定见习对象，主动联系了解需求，定向推送见习信息。重点锁定困难毕业生，定期与低保、脱贫、残疾等数据库开展比对，及时组织符合条件人员参加见习。同步开通线上就业见习报名渠道，简化报名手续，及时登记有意参加见习人员信息。在此基础上，建立见习对象信息库，做实基础台账，做到个人基本信息清、学历技能水平清、见习就业意愿清，并对困难毕业生作出专门标识，方便后续提供针对性见习服务。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（二）提升岗位募集质量。按照多元募集、量质并重的原则，重点面向承担科技项目的研究型大学、科研院所、科技型企业，开发一批科研类见习岗位；面向制造业龙头企业、单项冠军企业、专精特新“小巨人”企业和技工院校，开发一批技术技能类见习岗位；面向事业单位、国有企业、中小微企业，开发一批管理类见习岗位；面向城乡社区组织、社区服务机构、基层服务平台和各类社会组织，开发一批社会服务类见习岗位，满足高校毕业生等青年多元见习需求，更好发挥所学所长。在此基础上，按照不少于百分之一的比例，精心选取一批示范性的高质量见习岗位，集中打包推出，增强见习吸引力。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（三）增强见习对接效率。主动梳理推出本地见习单位清单、岗位目录清单和服务机构联络清单，通过部门网站、各类媒体、公共就业人才服务平台等渠道，及时向社会公布。每季度至少举办一次就业见习专项对接活动，通过进校园、专项服务活动、线上线下招聘等渠道，多维度组织岗位推荐、专场招聘、双向选择洽谈等活动，并在各类招聘会中同步推出见习岗位，将政策咨询、见习指导贯穿其中，更好助力见习供需双方对接。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（四）搭建统一服务平台。优化升级百万就业见习岗位募集计划服务专区，丰富拓展网上见习服务内容，提供见习单位申报、见习岗位查询、见习政策宣传、见习人员报名、见习数据统计等一站式服务。打造全国联网的见习统一服务平台，将计划服务专区与各地就业见习服务专区、网站互联互通，推动岗位共享、业务协同，同步链接中国公共招聘网、高校毕业生就业服务平台、国家大学生就业服务平台、就业在线及各地公共招聘网站，更加便捷见习人员和见习单位参与。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（五）强化见习规范管理。做好见习事前指导，指导见习单位与见习人员签订见习协议，确保见习活动规范有序。强化见习事中管理，督促见习单位建立带教制度，委派实践经验丰富、业务素质好、责任心强的技术或管理人员作为带教老师，帮助见习人员熟悉岗位内容、提升工作能力。抓实见习事后问效，定期跟进见习单位见习人员管理、政策落实和见习实效等情况，定期了解地方见习岗位募集、制度执行、政策落实和组织实施等情况，健全就业见习长效机制。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（六）做好后续跟踪帮扶。鼓励见习单位积极留用见习期满人员，见习期间或期满后被见习单位正式录用的，见习单位应及时与高校毕业生签订劳动合同，缴纳社会保险。对见习后未留用人员做好后续就业帮扶，对有就业意愿的，持续提供岗位信息、职业指导等服务；对有创业需求的，积极提供项目开发、融资支持、场地便利、跟踪扶持等“一条龙”服务；对需要提升技能的，针对性推荐职业培训项目，促进尽快实现就业创业。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			三、支持政策\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（一）补贴支持。对吸纳就业见习的单位，按规定给予就业见习补贴，用于支付见习人员见习期间基本生活费，为见习人员办理人身意外伤害保险，以及对见习人员的指导管理费用。有条件的地方或见习单位可为见习人员购买商业医疗保险，提高见习保障水平。对见习期满留用率达到50%以上的见习单位可适当提高见习补贴标准。将对见习期未满与见习人员签订劳动合同的，给予见习单位剩余期限见习补贴政策延续至2023年底。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（二）税费支持。见习单位支出的见习补贴相关费用，不计入社会保险缴费基数。符合税收法律及其有关规定的支出，可以在计算企业所得税应纳税所得额时扣除。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（三）保障激励。见习人员的见习时间一般为3-12个月，离校未就业高校毕业生见习期间不视为就业，见习期满后可按规定参照应届毕业生享受有关政策。在国家级高校毕业生就业见习示范单位评选中，优先激励参加本次计划并表现突出的各类单位。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			四、工作要求\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（一）强化组织领导。各地要将计划实施纳入本地就业工作整体安排，加强部门协同，合力抓好实施。人力资源和社会保障部门要加强见习工作统筹协调，做好见习信息发布、见习专区搭建、见习管理服务等工作。财政部门要加大就业补助资金支持力度，保障见习政策落实。教育部门要指导高校做好见习政策宣传，向有需求的高校毕业生推荐见习信息。科技、工业和信息化、民政、商务、国有资产监督管理、工商联等部门要立足部门职能职责，发挥行业优势，动员鼓励各类用人单位设立见习岗位，积极提供有示范性的优质岗位。共青团要发挥组织优势，提供企业资源，动员失业青年参加见习，丰富青年见习实践活动。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（二）强化工作推进。各地要结合实际制定具体实施方案，层层分解落实本地见习任务，明确时间进度，细化工作措施和工作要求，推动各项工作任务顺利推进。要优化见习补贴申领流程，实施“1+1”见习补贴申领模式，不得见习结束后集中发放，在按月发放就业见习补贴基础上，对见习留用率高的单位结束见习工作后集中一次性发放差额补贴。加强部门间信息比对和监督检查，防止补贴资金骗取、挪用、虚报、冒领等行为。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（三）强化示范引领。各地要指导见习单位高度重视见习工作，不断创新和完善本单位见习管理制度，为见习人员提供更加良好的工作、生活、学习环境。要选树一批管理运行规范、吸纳人员较多、见习成效明显的国家级高校毕业生就业见习示范单位，并结合实际按规定开展本地就业见习示范创建工作，为当地就业见习工作开展树立标杆，发挥先进典型的带动作用，推动见习工作提质增效。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			（四）强化宣传引导。各地要充分利用电视、微博微信、短视频等宣传载体，广泛宣传见习制度和参与渠道，并在青年人聚集的高校、社区开展政策宣讲，扩大见习知晓度和影响力。同时加大典型示范，大力宣传一批青年通过见习提升能力、成功就业的故事，宣传见习单位履行社会责任的良好形象，引导更多青年和用人单位主动参与见习活动。\r\n		</p>\r\n		<p style=\"text-indent:2em;\">\r\n			各地人力资源和社会保障部门每月汇总各方情况后，填报《百万就业见习岗位募集计划情况汇总表》（见附件），于下月前5个工作日内报人力资源和社会保障部就业促进司，并于年底报送年度计划实施情况报告。\r\n		</p>\r\n	</div>\r\n</p>', '小区西大门', '122', '17367678910', 0, '2023-05-28 22:32:07', '2023-05-28 22:32:07', 0, '2023-05-28 22:32:07', 1, 1, '2023-05-28 22:32:07');
INSERT INTO `t_activity` VALUES (4, 4, '4', 4, '热门活动推荐', 3, '乐享生活', '<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">02&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/39373/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">2020年地产夏日周末暖场活动+事件营销（六月七月八月）</a></span>\r\n</p>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\"></span>\r\n</p>\r\n<div>\r\n	<span style=\"font-weight:600;\"><img src=\"https://pic3.zhimg.com/v2-b5f43cd92efc253081753a08ab290a7e_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" /></span>\r\n</div>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">推荐理由：</span>本案以“遇见夏天-为城市降温”为主题，打造一场城市联动的夏日消暑活动，让城市看见某地产的公益之心。活动主要分为致敬上班族、致敬特殊工作者、致敬城市建造者和致敬个体营业者四大主题活动，活动现场让消费者感官齐聚，从视觉、听觉、嗅觉、触觉、味觉各个方面进行活展开，将现场营造成绿意盎然的活动场景，让来宾在一片绿意中感受夏日的清爽，去除内心的烦躁。这个夏日，我们想为城市降温，与城市共度夏日美好时光。\r\n</p>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">03&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/40607/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">夏日游园会</a></span>\r\n</p>\r\n<div>\r\n	<img src=\"https://pic1.zhimg.com/v2-761886301e53fbbcf412b8a21d97d740_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n</div>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">推荐理由：</span>方案以“Youth”为主题，从“What is Youth?”的思路出发，围绕佛系青年、发际线守护者、快乐肥宅、最强王者、追星汪等关键词进行活动设计，旨在打造一场2020老顽童专属新青年游园会。活动融入了时光杂货铺、返老还童照相馆、怀旧小零食等情怀元素，设置了铁皮青蛙弹跳赛、梳头脱发大赛、剔草莓籽大赛等消灭无聊Youth游戏，还有圈圈顽童、办公室顽童竞速赛等趣味比赛。这个夏日，顽童集结，一起来嗨！\r\n</p>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">04&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/40071/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">夏日青春荷尔蒙泳池派对</a></span>\r\n</p>\r\n<div>\r\n	<img src=\"https://pic3.zhimg.com/v2-6a8cc6c04daa2011212a117afb812e16_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n</div>\r\n<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:600;\">推荐理由：</span>活动将夏日、音乐和泳池相结合，打造一系列解压活动，让参与者释放激情、解放天性，玩出青春、玩出心跳、玩出新鲜，玩出不一样的火花！活动现场主要划分了泳池区、舞台区和餐饮区。泳池区分大泳池与小泳池，分别以不同主题进行包装，主要设置了激情水枪大战、粉色主题海洋世界、水上互动大闯关和水上气模体验。舞台区进行灯光的布置，以绚丽的灯光映照现场氛围，乐队献唱带给你不羁的音乐狂欢。这个夏天，就是要你嗨起来！\r\n</p>', '小区东大门', '23', '17367678910', 0, '2023-05-28 22:36:20', '2023-05-28 22:36:20', 0, '2023-05-28 22:36:20', NULL, NULL, '2023-05-28 22:36:20');
INSERT INTO `t_activity` VALUES (5, 4, '1', 6, '热门活动推荐2', 4, '体验多彩人生', '<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">05&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/32882/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">夏日创意西瓜主题嘉年华</a></span>\r\n	</p>\r\n	<div>\r\n		<img src=\"https://pic2.zhimg.com/v2-6e9d1ddfae27a9d1650fd7f7050893b1_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n	</div>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">推荐理由：</span>本案通过举办一场以“酷爽时光 瓜甜景夏”为核心的西瓜主题嘉年华，借助“酷爽”、“西瓜”、“亲子”、“互动”、“美食”等一系列爆点，吸引项目周边客户群上门到访。活动前期通过“西瓜太郎”评选活动和“一瓜百味”抖音挑战等线上活动，为项目引流，现场布置结合西瓜为视觉延展，设置了西瓜太忙主题门头、瓜田景夏主题造景、西瓜大作战挑战区、西瓜主题合影框等网红与趣味结合的美陈布景，吸引客户打卡拍照，还有一系列西瓜大作战主题活动以及花式西瓜美食。这个夏日，我们一起做欢乐的吃瓜群众吧~\r\n	</p>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">06&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/32670/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">吃货夏日么么生活节活动策划方案</a></span>\r\n	</p>\r\n	<div>\r\n		<img src=\"https://pic2.zhimg.com/v2-acbce75a5d86086e066410dd64bb3335_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n	</div>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">推荐理由：</span>活动从“想象！是第一生产力”出发，以解锁“72”种创造力玩转度假区，每周上演经典童话剧—小鬼当家，还有用旧物再“造”可持续的风物美作以及不可辜负的神奇小吃。室外区域主要打造奇品市集和鬼马精灵两个主题区域，不光有充满夏日气息的互动游戏，还有鬼马国学课堂、鬼马错觉美食以及所见皆可食等创意活动。神奇之旅即刻启程，你准备好了吗？\r\n	</p>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">07&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/29349/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">夏日嘉年华暑期系列暖场活动</a></span>\r\n	</p>\r\n	<div>\r\n		<img src=\"https://pic4.zhimg.com/v2-b65c7643e413b5a0a8c450a8044c9cc3_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n	</div>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">推荐理由：</span>活动设置了水枪主题周、冰爽主题周、水果主题周、清凉手作主题周、陶艺主题周和糖果主题周，通过系列暖场活动让吃喝玩乐购齐聚，吸引潜在客户关注，为项目引流。现场氛围布置融合海洋主题元素，在展厅入口处布置海滩地贴，在水吧台处布置海洋元素挂件，营造临海氛围，给客户带来夏日清凉的感觉。\r\n	</p>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">08&nbsp;<a href=\"https://link.zhihu.com/?target=https%3A/www.eventwang.cn/DesignResource/detail/design_resource_id/38801/Index/index/srfp/srp600006\" class=\" wrap external\" target=\"_blank\">缤纷夏日吃个瓜西瓜节文化艺术网红打卡节活动策划方案</a></span>\r\n	</p>\r\n	<div>\r\n		<img src=\"https://pic2.zhimg.com/v2-fa8e5395034fcdb82a3ad184a2ddea21_b.webp?consumer=ZHI_MENG\" class=\"origin_image zh-lightbox-thumb\" width=\"1080\" />\r\n	</div>\r\n	<p style=\"color:#121212;font-family:-apple-system, BlinkMacSystemFont, &quot;font-size:16px;background-color:#FFFFFF;\">\r\n		<span style=\"font-weight:600;\">推荐理由：</span>活动以“2020吃个瓜，冰爽一夏”为主题，打造一场INS网红美陈+趣味西瓜主题活动。现场设置了西瓜主题网红互动空间，夏日西瓜主题馆的粉色系布置，时尚中增添高端趣味，引起全网围观！除了网红拍照打卡墙，还有西瓜投篮、西瓜汉堡、趣味西瓜捞、西瓜套圈等趣味互动。活动还助力瓜农，植入直播卖瓜活动，当红主播现场卖西瓜，用户可现场自提，把西瓜抱回家！这个夏天不寂寞，来这里畅快吃瓜啦~\r\n	</p>\r\n</p>', '2单元楼下', '543', '17367678910', 0, '2023-05-28 22:39:06', '2023-05-28 22:39:06', 0, '2023-05-28 22:39:06', NULL, NULL, '2023-05-28 22:39:06');
INSERT INTO `t_activity` VALUES (6, 5, '1', 7, '人物', 5, '技能，使生活更美好|阳华：以热爱赋能，点亮青春', '<p style=\"color:#505050;font-family:&quot;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n	<br />\r\n</p>\r\n<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/O/AHM6O/KENU573S45F43ITB4FFFHWRSV4.png\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">以青春之伟歌，博乡村振兴梦。湖南大众传媒职业技术学院休闲服务与管理专业阳华同学，以《春茶计划——长沙县金井茶乡小镇乡村振兴志愿者服务》入围文旅部2022年度文化艺术职业教育和旅游职业教育提质培优行动计划，并获“湖南省优秀毕业生”等荣誉称号。</span>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/YSIU7YUJR5CNZEBWGFRGAQY5UI.jpg\" alt=\"图片1\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<span style=\"font-size:12px;\">入选2022 年度文化艺术、旅游职业教育提质培优行动计划</span><span style=\"font-size:15px;\"><br />\r\n</span>\r\n	</p>\r\n	<p style=\"text-align:justify;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">出生寒门，自强定义人生</span></strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">阳华出生于一个普通的农村家庭，自小父亲就患病去世，由母亲在外务工来维持家中日常开支，收入微薄，生活拮据。他经常告诉自己“贫穷不应该限制脚下的步伐，只要敢闯敢创，未来一定光明”。从踏入大众传媒开始，他就对大学生活做好了规划，秉持“实践是检验真理的唯一标准”，脚踏实地，砥砺前行。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">入学以来，阳华的文化成绩始终在专业前10%，综合测评成绩始终名列专业第一。他连续每年寒暑假参加学校“三下乡”活动，投身志愿服务累积近百小时，先后获得省、市、校级荣誉10余项。同学们提到阳华，总是不禁竖起大拇指。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">文化传承，创意点亮人生</span></strong>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/FSOPM7CVONDZFHRSJDUKNVFCXM.jpg\" alt=\"图片2\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<span style=\"font-size:12px;\">参与事迹及团队活动获得湖南公共频道等有关媒体报道</span>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/IQQRJ6CEWRHKZIM7Z7EH6M5SKE.jpg\" alt=\"图片3\" />\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:12px;\">参与事迹及团队活动获得湖南公共频道等有关媒体报道</span><span style=\"font-size:15px;\"><br />\r\n</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">阳华和其他大众传媒学子一样，时刻将“创意点亮人生”的校训牢记于心，利用技能优势，整合专业资源，不断攀登高峰。他在大一时创建的 “春茶计划团队” ，搭建了一条茶文化进校园、茶文化进茶企、茶文化加旅游的校企双向获益的创意赛道，为在校学生提供了更广阔的技能实操平台。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">搭建团队两年多以来，他带领团队两度拿下“互联网+”及“黄炎培”创新创业规划大奖，更在 2022年以项目《春茶计划——长沙县金井茶乡小镇乡村振兴志愿者服务》成功入选《2022年度文化艺术职业教育和旅游职业教育提质培优行动计划》，得到新湖南、红网、腾讯网等媒体报道。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">热爱赋能，兴趣引领人生</span></strong>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/IYUA6H2EQRCPJFFYY7FVAAH6JM.jpg\" alt=\"图片4\" />\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:12px;\">从汉服&nbsp;、旅游&nbsp;、茶文化 、 主持 、直播出发</span>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/7VSYRQVRABD4BAPXLWZFIV3SYQ.jpg\" alt=\"图片5\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<span style=\"font-size:12px;\">从汉服&nbsp;、旅游&nbsp;、茶文化 、 主持 、直播出发</span>\r\n	</p>\r\n	<p style=\"text-align:justify;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">以热爱赋能，点亮青春</span></strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">兴趣是最好的人生引路人。阳华在保证课程学习的同时，也积极涉猎其他领域。他从主持、茶文化、汉服、直播、&nbsp;短视频出发，与湖南省文旅厅、湖南省汉文化传播协会、国际茶模、芒果带货官均有火花的碰撞，并在2022年参赛湖南文旅厅组织的“美好生活，文明出游”首届文旅公益短视频大赛并获奖。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">专业支撑，技能铸就人生</span></strong>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/XPVAVG4HHREOBPM2X3MU44W7QA.jpg\" alt=\"图片6\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<span style=\"font-size:12px;\">网络报道</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">一步一步踏下的是道路，一锤一锤铸就的是技能。阳华所学专业主要涉及旅游、茶文化两个板块。在旅游方面，他认真学习老师传授的专业知识，考取了“旅行策划师证”；课堂之余，他积极投身各大景区兼职及实习，宁乡炭河古城、方特、世界之窗等均留下他的身影。所知所学也让他在2020和2021年湖南省职业技能竞赛导游服务赛项上均斩获大奖。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">在茶文化方面，阳华积极加入学校茶艺社团学习茶艺表演，组织社团茶会，担任茶会主持。走出社团的他，也是金井茶业、新化红茶、尚木兰亭的一名茶艺师，收获了行家里手的一致好评。</span>\r\n	</p>\r\n	<p style=\"text-align:left;text-indent:0em;\">\r\n		<strong><span style=\"font-size:15px;\">投身公益，志愿温暖人生</span></strong>\r\n	</p>\r\n	<p>\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/4/AIMK4/NNWDDQZHMNFDRNI7WX3C7RI6CM.jpg\" alt=\"图片7\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<span style=\"font-size:13px;\">志愿服务</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">志愿服务，点亮自我，温暖他人。在校期间，阳华积极参加各项志愿活动。2022 年学院组织“非遗茶文化”三下乡活动时，他带领小伙伴圆满完成任务；2022年学校与文旅厅组织“播撒艺术的种子”益阳安化“三下乡”活动时，他既是参与者，也是组织者。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">苔花如米小，也学牡丹开。经过老师悉心教导和技能竞赛锻炼，阳华不仅实操了专业所学，更收获了一颗勇敢逐梦的赤子之心。</span>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<span style=\"font-size:15px;\">作为新时代的中国青年，阳华握紧接力棒，将热爱献给所学，以青春致敬祖国，努力在技能强国的赛道上奋力奔跑。</span>\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-align:center;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/O/AHM6O/7UCMM3YTOZAV5BERSOTNUL5MVY.png\" />\r\n	</p>\r\n	<p style=\"text-indent:0em;\">\r\n		<strong><span style=\"font-size:13px;\">出品 | 校园网络通讯站</span></strong>\r\n	</p>\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:0em;\">\r\n		<strong><span style=\"font-size:13px;\">文案&nbsp;|&nbsp;孙益民</span></strong>\r\n	</p>\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:0em;\">\r\n		<strong><span style=\"font-size:13px;\">一审 |&nbsp;彭金燕 袁康</span></strong>\r\n	</p>\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:0em;\">\r\n		<strong><span style=\"font-size:13px;\">二审 |&nbsp;姜婷婷 郭雯</span></strong>\r\n	</p>\r\n	<p style=\"color:#505050;font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:0em;\">\r\n		<strong><span style=\"font-size:13px;\">三审 |&nbsp;彭涛&nbsp;任春梅</span></strong>\r\n	</p>\r\n	<p style=\"text-indent:0px;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/zmt/6ef08034f7034a79881a2ba913d30430.png?watermark/1/image/aHR0cDovL3VuaXZzLW5ld3MtMTI1NjgzMzYwOS5maWxlLm15cWNsb3VkLmNvbS9yZXNvdXJjZV9maWxlcy9zdHVfcHJpdi9RL0FOUVEvTG9nb05hbWUucG5n/gravity/northeast/scatype/3/spcent/30/dissolve/90\" alt=\"4EA666C2-0C2A-4D26-9F45-1C8EC6FED8D7.png\" />\r\n	</p>\r\n<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '棋牌中心', '645', '17367678910', 1, '2023-05-28 22:39:12', '2023-05-28 22:39:12', 0, '2023-05-28 22:39:12', NULL, NULL, '2023-05-28 22:39:12');
INSERT INTO `t_activity` VALUES (7, 6, '1', 8, '毕业季', 7, '毕业季，我们与网通同行', '<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n	淮南师范学院校园网络通讯站也将继续携手中国大学生在线写出好文章，抒发好情怀，用激扬、向上的思想传递时代之音。\r\n</div>\r\n<div class=\"detail-content con-font-center\" style=\"margin:35px 0px 0px;padding:0px;font-size:16px;color:#505050;font-family:&quot;background-color:#FFFFFF;\">\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:Calibri;font-size:14px;\">5<span style=\"font-family:宋体;\">月</span><span>20</span><span style=\"font-family:宋体;\">日，我校网通站在这一特殊的日子里举办了校园行活动。正值毕业季，我们以</span><span>“</span><span style=\"font-family:宋体;\">网通站，我们毕业了</span><span>”</span><span style=\"font-family:宋体;\">为主题在校园内开展多种形式的活动，借此契机进一步宣传推广中国大学生在线和校园网络通讯站，让同学们更加熟悉。</span></span>\r\n	</p>\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:Calibri;font-size:14px;\"><span style=\"font-family:宋体;\">一九年的金秋时节，一九届的学子们饱含期待地来到淮南师范学院，成为其中的一员。在师院的四年中，他们一步步从幼稚走向成熟、从学校走向社会。淮师的一草一木，一花一叶，都见证了他们的成长。临近毕业，再回首，原来他们在这片土地上留下了这么多回忆。我校网通站举办了一系列活动，丰富毕业生在校的美好回忆，让校园网络通讯站和中国大学生在线成为学生们心中不可磨灭的记忆</span></span><span style=\"font-family:宋体;font-size:14px;\">。</span>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/zmt/4622b2525aec45198074c343809ad496.png\" title=\"QQ图片20230522175100.png\" alt=\"QQ图片20230522175100.png\" />\r\n	</p>\r\n	<p style=\"text-align:center;text-indent:2em;\">\r\n		<span style=\"font-family:宋体;font-size:14px;\"><span>（图片来源</span><span style=\"font-family:Calibri;\">:</span><span>卢潇潇）</span></span>\r\n	</p>\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:Calibri;font-size:14px;\"><span style=\"font-family:宋体;\">为确保校园行活动顺利进行，</span>5<span style=\"font-family:宋体;\">月</span><span>19</span><span style=\"font-family:宋体;\">日网通站新老站员们在李馨悦学姐的带领下，有条不紊地整理和搬运此次校园行宣传活动的所需设施，前往宣传地点</span><span>——</span><span style=\"font-family:宋体;\">一食堂广场建立我们的站点。</span><span>5</span><span style=\"font-family:宋体;\">月</span><span>20</span><span style=\"font-family:宋体;\">日，校园行活动正式开始，本次活动以征文活动、组图活动、视频活动、线下活动为主要形式。虽是五月，但天气很像是生气的孩子，活动当天烈日高照，使人满身热汗。可参加此次校园行的站员都满怀热情，脸上洋溢着青春的笑容，积极开展各项活动。活动中充满了欢声笑语，每个站员都怀着饱满的热情，完成自己的工作。有的站员负责拿着宣传牌，有的站员负责组织开展抽奖活动，有的站员负责介绍大学生在线平台，激发同学们的参与热情与兴趣，他们鼓励当代青年树立家国情怀，有理想、敢担当、能吃苦、肯奋斗，争做时代新人。活动中充满了欢声笑语，每个站员都怀着饱满的热情，完成自己的工作。</span></span>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/zmt/9e201e04a9244aadafce9647621357b5.png\" title=\"QQ图片20230522175104.png\" alt=\"QQ图片20230522175104.png\" />\r\n	</p>\r\n	<p style=\"text-align:center;text-indent:2em;\">\r\n		<span style=\"font-family:宋体;font-size:12px;\">（图片来源</span><span style=\"font-family:Calibri;font-size:12px;\">:<span style=\"font-family:宋体;\">李馨悦</span></span><span style=\"font-family:宋体;font-size:12px;\">）</span>\r\n	</p>\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:Calibri;font-size:14px;\"><span style=\"font-family:宋体;\">在毕业季，网通站相约在美丽的校园，学生意气相投；毕业生相识在最美的季节，情谊无价。大家相聚在青春的海洋，热情奔放；相别在毕业的时光，难舍难离。我们与网通站一起，和中国大学生在线一同，举行校园行活动，宣传网通站和大学生在线，扩大中国大学生在线和网通站的在校知名度，也展现大学生的积极向上的精神风貌，积极展现我校丰富多彩的大学生活。</span></span>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"https://univs-news-1256833609.file.myqcloud.com/zmt/8edaeca1cbab45f199a3783d1bf8bc45.png\" title=\"QQ图片20230522175107.png\" alt=\"QQ图片20230522175107.png\" />\r\n	</p>\r\n	<p style=\"text-align:center;text-indent:2em;\">\r\n		<span style=\"font-family:Calibri;font-size:12px;\"><span style=\"font-family:宋体;\">（图片来源</span>:<span style=\"font-family:宋体;\">李馨悦）</span></span>\r\n	</p>\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:宋体;font-size:14px;\">青春是一场单向旅程，而沿途的风景最是珍贵。如今在分别之际，众多的毕业季活动让毕业生们共同度过在大学里最后的美好时光，共同创造不可磨灭的深刻回忆。临别在即，愿淮师学子此去鹏程万里、青鸟凌云，前程锦绣、大展宏图。</span>\r\n	</p>\r\n	<p style=\"text-indent:2em;\">\r\n		<span style=\"font-family:宋体;font-size:14px;\">本次校园行活动在全体站员的共同努力和同学们的大力配合下圆满结束。淮南师范学院校园网络通讯站也将继续携手中国大学生在线写出好文章，抒发好情怀，用激扬、向上的思想传递时代之音，为更多高校学子提供一个展现自我，优化自我的平台。祝福每一个毕业学子，愿他们未来能一直走在开满鲜花的路上。</span>\r\n	</p>\r\n</div>', '公共厕所旁', '1223', '17367678910', 0, '2023-05-28 22:39:22', '2023-05-28 22:39:22', 0, '2023-05-28 22:39:22', NULL, NULL, '2023-05-28 22:39:22');
INSERT INTO `t_activity` VALUES (8, 7, '1', 9, '关注艾滋病患者', 8, '校园行丨隔艾不隔爱', '<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n	<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n		知艾懂艾远离艾，献爱关爱显大爱，2023年隔艾不隔爱校园行，我看行！\r\n	</div>\r\n	<div class=\"detail-content con-font-center\" style=\"margin:35px 0px 0px;padding:0px;font-size:16px;color:#505050;font-family:&quot;background-color:#FFFFFF;\">\r\n		<p style=\"text-align:center;\">\r\n			<strong>艾滋不留情，</strong><strong>预防我先行&nbsp; &nbsp;</strong>\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p style=\"text-indent:2.1875em;text-align:justify;\">\r\n			为落实《“健康中国2030”规划纲要》和合川区医疗保障“十四五”规划，进一步推进艾滋病防治工作，加强校园预防艾滋病和性健康的宣传教育，增加艾滋病相关预防知识储备，深刻了解艾滋病感染者社会处境及心理变化，降低对艾滋病感染者的歧视，结合中国大学生在线对高校大学生思想政治教育校园行的相关鼓励支持，同时丰富自身知识以便更好地遏制艾滋病的传播和蔓延。\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/ZQPGV2WRCJBYPDTVLH237OLLP4.jpg\" />&nbsp;<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/OESRETIK4FF6LI7YXJRZ2EC5FA.jpg\" />&nbsp;\r\n		<p>\r\n			图为小中兄妹与志愿者的“暖心助力”合影留念\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p style=\"text-indent:2.1875em;text-align:justify;\">\r\n			2023年中国大学生在线校园行与2021级计算机科学与技术2班“求思立德 携手筑梦”团支部于2023年5月11日16:00在合川A校区足球场开展了以“艾滋不留情，预防我先行”为主题的2023年隔艾不隔爱校园行，中国大学生在线小中兄妹、青年志愿者协会红十字会服务队、数学与计算机学院组织部、宣传部受邀到场。本次活动由团支部书记谢源主持。\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/KO6TJRXQLNHJDF4KQ5C4LW3VNM.jpg\" />&nbsp;\r\n		<p>\r\n			图为小中兄妹与团小组会成员合影留念\r\n		</p>\r\n		<p>\r\n			（从左至右为：团支部副书记代春珅，宣传委员谢佳琦，组织委员张琬如，团支部书记谢源）\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p style=\"text-indent:2.1875em;text-align:justify;\">\r\n			活动初始，全体支部成员齐唱团歌《光荣啊，中国共青团》，随后主持人讲述了红丝带的含义和本次主题的背景、意义。其次，主持人通过艾滋调查数据分析报告，让支部成员明白要洁身自爱，从思想上提高对艾滋病的防范意识，在做好自我防护的同时，以正确的态度与行为关爱艾滋病患者。活动中期，小中兄妹同组织、宣传委员组织开展艾滋知识问答，希望通过问答方式进一步丰富支部成员的艾滋相关知识。\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/RXG4W3EB35C6HMI42XOYBM5SCQ.jpg\" />&nbsp;<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/EBRYU24WURANXBCB3TSFVII4CY.jpg\" />&nbsp;\r\n		<p>\r\n			图为小中兄妹与支部成员代表合影留念\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/AY5YIE57GRDAZHB2L4LA5OY7WU.jpg\" />&nbsp;<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/JHBO7H6IYFCSLHZ2GDKIYSH2MI.jpg\" />&nbsp;\r\n		<p>\r\n			图为小中兄妹与团小组会成员一起晒太阳\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p style=\"text-indent:2.1875em;text-align:justify;\">\r\n			最后，团支部书记谢源和小中兄妹带领支部成员开展“预防艾滋暖心助力”活动，各小组成员和志愿者分别写上对艾滋病人的暖心话，并赠送红丝带以示助力，极大地提高了支部凝聚力和支部成员的沟通交流能力。从这个小小的活动中我们可以明白，“我们生活在一个相互依存的世界里，没有人能脱离他人而独自生活。我们如何对待艾滋，在某种程度上就取决于我们如何理解这种相互依存的关系。这不是别人的问题，这是我们所有人的问题。”\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/GUL6SKLWHRHHVHE3GTK36O7NE4.jpg\" />&nbsp;<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/K343HEDBD5CX5ERE3BEY2QKRRA.jpg\" />&nbsp;\r\n		<p>\r\n			图为志愿者参与“预防艾滋暖心助力”活动\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n<img class=\"raw-image\" src=\"https://univs-news-1256833609.file.myqcloud.com/resource_files/cont_pub/C/AIK6C/LIQJCIH2N5AFLNDXFSOZMIXKAQ.jpg\" />&nbsp;\r\n		<p>\r\n			图为支部成员为志愿者佩戴红丝带\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p style=\"text-indent:2.1875em;text-align:justify;\">\r\n			通过本次校园行活动，让支部全体成员知道了在性行为中使用防护措施、理性选择性伴侣、进行不涉及体液交换的亲密行为、定期做艾滋病毒和其他性病检测、避免滥用药物和酒精、服用艾滋病毒预防药物、不共用针头等可有效预防艾滋病。希望各支部成员能将今日所学到的知识，与周围的同学、朋友以及家人进行交流，以引起全社会对艾滋病的重视和正确认识，同时增强自我保护意识和责任意识，消除对艾滋病病毒感染者和艾滋病病人的歧视，给予他们关爱和理解。\r\n		</p>\r\n	</div>\r\n<br />\r\n</div>', '社区办公室', '54', '17367678910', 0, '2023-05-28 22:39:25', '2023-05-28 22:39:25', 1, '2023-05-28 22:39:25', NULL, NULL, '2023-05-28 22:39:25');
INSERT INTO `t_activity` VALUES (10, 9, '1', 1, '小区跑车赛事', 9, '泰裤辣！小区超级跑车锦标赛在', '<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	5月26日，凤凰网河南从2023郑州国际赛车嘉年华组委会新闻发布会上获悉，2023年中国超级跑车锦标赛郑州站将于6月9日至11日在郑州国际赛车场劲爆举行。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	届时，200余名国内外车队成员、专业裁判等将汇聚郑州，为广大赛车爱好者奉献上一场陆上版“速度与激情”的顶级汽车赛事盛宴。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/685D34B94BB4C141ADB84662CCAD4839CE1BBF16_size262_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">中原地区唯一标准化国际赛道 首迎汽车顶级赛事</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车嘉年华·2023年中国超级跑车锦标赛郑州站比赛，由中国汽车摩托车运动联合会、河南省体育局、郑州市人民政府主办，郑州市体育局、郑州经济技术开发区管委会承办，将于6月9日至6月11日在郑州国际赛车场举行。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	本次比赛是郑州国际赛车嘉年华的主赛事，是我市继成功举办2023国际摩联F1摩托艇世界锦标赛中国郑州大奖赛后，又将主办的一项国内A类赛事，也是汽车顶级赛事首次落户河南。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/39F9E3821398B146A4125C722A7EF930FBD7DBF2_size150_w777_h516.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	除了将要举办的本次比赛和已经举办过的CDB飘移亚洲杯外，郑州国际赛车嘉年华还将举行雷诺方程式中国锦标赛、Radical统规赛(KTM)等十余项赛事和活动，整个活动将一直持续到7月1日。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	这个夏天，郑州市民将充分享受到一场陆上版“速度与激情”的盛宴。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	据了解，作为本次郑州站比赛举办地的郑州国际赛车场，位于郑州经济技术开发区国际物流园区内，总投资6.8亿元，是目前中原地区唯一一条标准化国际赛道，赛道总长4.6公里，其中场地赛道长2.6公里，赛道线型设计有五种不同组合，可以根据赛事需求灵活调整。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/EE008A861AE0A6DD348C018EDC89D3805E0E92B1_size139_w777_h516.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车场配建的还有赛事控制中心、万人看台、29间车队维修P房、多功能大楼等附属设施，功能设施齐全。该赛车场刚建成，就首次迎来了2023年中国超级跑车锦标赛郑州站比赛这项汽车顶级赛事。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/95393A3023A8D54FB3F8BBD8F9C439457D39C1C8_size208_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">打造城市“新IP” 助力郑州国内外“朋友圈”再扩大</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州国际赛车嘉年华·2023年中国超级跑车锦标赛郑州站的比赛，是郑州市整合全市汽车生产、研发、销售及汽车娱乐、汽车文化等汽车后市场资源，推动汽车产业全链条提升和汽车文旅文创融合发展的一次重大文体活动。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/DFD690367E1FE68A6EB087B08FFA33CCD556A428_size213_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	这将进一步浓厚我市体育氛围、激活体育产业，有力促进河南省、郑州市国际文化、体育、旅游及经贸交流合作，叫响郑州汽车文化品牌，为郑州打造新的城市IP。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	国标车队齐聚，顶级赛车手云集，本次赛事不但是一场激情澎湃的赛车盛会，而且是一个展示城市形象的重要平台。\r\n</p>\r\n<p class=\"detailPic\" style=\"text-align:justify;font-size:16px;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;margin-left:auto !important;\">\r\n	<img src=\"https://x0.ifengimg.com/ucms/2023_21/9FB442C0C1206A6F4BBF78AFB246702844739B11_size167_w777_h518.jpg\" alt=\"泰裤辣！中国超级跑车锦标赛6月9日郑州开跑\" style=\"height:auto;\" />\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	<span style=\"font-weight:700;\">讲好郑州汽车城故事 助推郑州汽车产业高质量发展</span>\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	中国超级跑车锦标赛这项汽车顶级赛事，缘何能落户郑州，落户郑州经开区？\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	据郑州经开区管委会相关负责人介绍：“汽车产业是郑州经开区的主导产业之一，产业规模已超千亿级。辖区拥有上汽、东风日产、宇通、海马4家整车厂、7家专用车厂、260余家汽车零部件企业，汽车整车年产能达到130万辆，占全省70%以上，在经开区，每个工作日就有超1500辆整车下线，已发展成为具有国内重要影响力的汽车之城。\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州经开区承办的本次赛事，不仅是一场赛车爱好者的盛会，而且更是展示郑州城市形象、讲好郑州汽车城故事的一个重大契机。”\r\n</p>\r\n<p style=\"font-size:16px;text-align:justify;text-indent:28px;color:#2B2B2B;font-family:&quot;background-color:#FFFFFF;\">\r\n	郑州经开区将以本次赛事为引擎，进一步完善汽车全产业链条，助推全市汽车产业高质量发展。\r\n</p>', '朝阳大街', '7523', '17367678910', 0, '2023-05-28 22:39:34', '2023-05-28 22:39:34', 0, '2023-05-28 22:39:34', NULL, NULL, '2023-05-28 22:39:34');
INSERT INTO `t_activity` VALUES (11, 8, '1', 10, '社区--美好家园', 3, '社区活动丰富多彩 满足居民多样需求', '<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n	<div class=\"detail-info\" style=\"margin:20px 0px 0px;padding:12px 32px 11px 48px;background:url(&quot;font-size:16px;color:#A7A090;font-family:&quot;\">\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			课等课程，合唱课经过一学期的学习，大家把一首《洪湖水浪打浪》唱的悠扬婉转，仿佛穿过时间，看到那个年代洪湖的壮丽景象，并且这首歌曲还继续激励着我们为美好的明天而奋斗。书法课也成果斐然，大家经过课堂上的学习，从基础的横竖撇捺，到现在字体写的愈加规范工整，离不开大家的辛勤付出，和志愿者老师的坚持不懈。对于其他课程，也是如此，大家通过课堂上的学习，增长了自己的知识，充实了日常生活，利用课余时间谈心交流，加深了邻里之间的感情交流，重拾了快乐和幸福的老年生活。今后，社区还将开展更多的文化活动以及实用课程，吸引更多老人走出家门，让老年人老有所学、老有所乐、老有所教、老有所为。\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/c03f2f317aaa88c_size898_w553_h415.png\" width=\"553\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/b8b14292c3676f6_size900_w554_h415.png\" width=\"554\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/c6b1b2e8691b4ae_size900_w554_h415.png\" width=\"554\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/2e3859833e884dc_size898_w553_h415.png\" width=\"553\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<strong>亲子同行 幸福成长</strong>\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			社区内幼儿较多，因父母工作繁忙，大多都是隔代家长在照看孩子，在照顾孩子方面与父母往往会产生分歧，基于此背景，社工走访社区的隔代家长，了解他们的需求，组织开展亲子早教课活动，通过链接早教机构，与志愿者老师联系，根据居民的需求反馈，设计课程主题内容，主要有早教认知课程，亲子音乐课程。开展的活动主要有早教绘画课，手工课，通过志愿者老师的讲解示范，让孩子自由创作，放飞自己的想象力，培养孩子的动手能力，并且开展音乐课，讲解基础的乐理知识，培养孩子对音乐的兴趣。在冬至来临之际，社工还组织孩子开展冬至手工包饺子活动，“一九二九不出手”通过一首简单的儿歌，给大家科普冬至的内容的和来历。通过这些活动，一方面丰富孩子的体验，锻炼孩子的语言表达能力，培养孩子的自主能力，另一方面减轻家长照看孩子的压力，搭建一个交流的平台，让家长能够互相交流沟通，更好的教育孩子。\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/bee8e0bb0475700_size897_w552_h415.png\" width=\"552\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/c73b271645493e6_size900_w554_h415.png\" width=\"554\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/343e6fb89028d77_size897_w552_h415.png\" width=\"552\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<strong>多彩社团 趣味人生</strong>\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			社区发挥自身优势，通过社工的支持，协助居民成立了多个兴趣社团，并且根据发展需求，孵化了太极社团，水兵舞社团，灵韵舞蹈社团，此外，社区内还有盛世好年华女子合唱社团以及中法老干部艺术社团。党群服务中心为这些社团提供场地和设备支持，社团成员每天来场馆练习，使场馆内活动精彩纷呈，充满了欢声笑语，在很大程度上活跃了社区氛围，提升了社区文化整体水平。通过练习，社团在不断的成长，太极社团的功夫扇打的极具美感，充满了太极的飘逸潇洒与武术的阳刚之威。舞蹈社团也发挥自身优势，学习新疆舞和水兵舞，充满了异域风情与优美飘逸。我们的合唱社团歌颂祖国的壮丽河山，歌曲唱的娓娓动听。\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			社工还根据社团成员特点，挖掘社团骨干成员，培养社团中坚力量，让孵化的社团可以独自组织开展活动，促进社团的长远发展，并且定期召开社团骨干会议，激发社团成员进行社区自治，参与社区治理，促进社会组织的转型。并且临近元旦，社区组织迎新春文艺汇演活动，各社团积极报名，参加活动，勤加练习，为汇演做好充分的准备，展现社团的魅力风采。\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/c1c691a695c46bd_size898_w553_h415.png\" width=\"553\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/4ced4a388d88241_size898_w553_h415.png\" width=\"553\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:center;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			<img src=\"http://x0.ifengimg.com/cmpp/2020_03/b3fb97ed2c59963_size898_w553_h415.png\" width=\"553\" height=\"415\" alt=\"\" style=\"height:auto;\" />\r\n		</p>\r\n		<p style=\"text-indent:28px;font-size:14px;text-align:justify;color:#2B2B2B;font-family:simsun, arial, helvetica, clean, sans-serif;background-color:#FFFFFF;\">\r\n			万安街社区党支部书记表示，社区通过开展各种丰富多彩的活动，在让居民群众度过欢快时光的同时，也增进了居民彼此之间的和睦情感，加深了邻里关系，汇聚民心力量，共建和谐社区，携手打造幸福家园。今后社区还将在实现幼有所育、学有所教、老有所学、老有所乐上不断努力，组织更多的活动，为居民群众提供更多的服务，为营造美好家园而努力。（供稿：高稳、李霞）<span class=\"ifengLogo\"><a href=\"http://www.ifeng.com/\" target=\"_blank\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"height:auto;\" /></a></span>\r\n		</p>\r\n<br />\r\n	</div>\r\n</div>', '华谊街道', '123', '17367678910', 0, '2023-05-28 22:39:33', '2023-05-28 22:39:33', 0, '2023-05-28 22:39:33', NULL, NULL, '2023-05-28 22:39:33');
INSERT INTO `t_activity` VALUES (1012, 6, '1', NULL, 'test', 3, 'test', '特色他', 'test', NULL, '15365047273', 0, '2023-05-29 14:55:02', '2023-05-25 19:25:55', 0, '2023-05-25 19:25:55', 10000, 10000, '2023-05-25 19:25:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户隐私' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '楼宇表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES (1, 1, '鲁·888888', '宾利', 'X6', '银色', '2030-12-28 21:50:48', '2023-02-24 21:51:00', 0, 1, '2023-05-24 21:51:08', 1, '2023-05-24 21:51:12');
INSERT INTO `t_car` VALUES (2, 2, '苏B·123456', '宝马', 'X5', '黑色', '2023-05-29 16:01:17', '2023-05-29 16:01:19', 0, 1, '2023-05-29 16:01:23', 1, '2023-05-29 16:01:25');
INSERT INTO `t_car` VALUES (3, 3, '浙A·321123', '小鹏', 'P7', '绿色', '2023-05-29 16:02:43', '2023-05-29 16:02:45', 0, 1, '2023-05-29 16:02:49', 1, '2023-05-29 16:02:51');
INSERT INTO `t_car` VALUES (4, 4, '苏A·865632', '奔驰', 'H8', '荧光粉', '2023-05-29 16:03:44', '2023-05-29 16:03:46', 0, 1, '2023-05-29 16:03:51', 1, '2023-05-29 16:03:53');
INSERT INTO `t_car` VALUES (5, 5, '鲁·666666', '丰田', 'K8', '白色', '2023-05-29 16:05:31', '2023-05-29 16:05:33', 0, 1, '2023-05-29 16:05:37', 1, '2023-05-29 16:05:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_carport
-- ----------------------------
INSERT INTO `t_carport` VALUES (1, 1, 1, 1, 'A-1', 1, '2023-01-23 00:00:00', '2024-01-24 00:00:00', 0, 1, '2023-05-24 21:52:14', 1, '2023-05-24 21:52:19');
INSERT INTO `t_carport` VALUES (2, 2, 2, 2, 'A-1', 1, '2023-05-29 15:58:29', '2023-05-29 15:58:34', 0, 1, '2023-05-29 15:58:36', 1, '2023-05-29 15:58:42');
INSERT INTO `t_carport` VALUES (3, 3, 3, 1, 'A-2', 2, '2023-05-29 15:59:44', '2023-05-29 15:59:47', 0, 1, '2023-05-29 15:59:50', 1, '2023-05-29 15:59:52');
INSERT INTO `t_carport` VALUES (4, 4, 4, 1, 'A-3', 1, '2023-05-29 16:00:23', '2023-05-29 16:00:26', 0, 1, '2023-05-29 16:00:29', 1, '2023-05-29 16:00:32');
INSERT INTO `t_carport` VALUES (5, NULL, NULL, 3, 'B-404', 0, '2023-05-29 16:58:00', '2023-05-29 16:58:03', 0, 1, '2023-05-29 16:58:05', 1, '2023-05-29 16:58:07');

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区表' ROW_FORMAT = Dynamic;

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
  `employee_ids` int NULL DEFAULT NULL COMMENT '处理人id，逗号分隔',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `evaluate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `evaluate_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_complaint
-- ----------------------------
INSERT INTO `t_complaint` VALUES (1, 1, 10000, 0, '1', '1', '', 0, '', 10000, NULL, '', NULL, 0, '2023-05-26 10:52:59', '2023-05-29 14:10:46', 0, 10000);
INSERT INTO `t_complaint` VALUES (2, 1, 10001, 1, '111', '111222', '', 0, '', 10000, NULL, '', NULL, 0, '2023-05-26 11:00:44', '2023-05-26 11:01:00', 10000, 10000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_device
-- ----------------------------
INSERT INTO `t_device` VALUES (1, '西门门禁1', 0, 1, '西门', '#', 0, '2023-05-25 07:27:01', 10000, '2023-05-25 07:27:01', 10000);
INSERT INTO `t_device` VALUES (2, '西门保安亭监控', 0, 2, '西门保安亭', '#', 0, '2023-05-25 09:24:53', 10000, '2023-05-25 09:24:53', 10000);
INSERT INTO `t_device` VALUES (3, '公摊电表', 0, 3, '', '', 0, '2023-05-26 10:27:51', 10000, '2023-05-26 10:27:51', 10000);
INSERT INTO `t_device` VALUES (4, '房间电表', 0, 3, '', '', 0, '2023-05-26 10:46:39', 10000, '2023-05-26 10:46:39', 10000);
INSERT INTO `t_device` VALUES (5, '海康威视监控', 0, 4, '', '', 0, '2023-05-26 11:20:13', 10000, '2023-05-26 11:20:13', 10000);

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
  `door_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁名称',
  `sys_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置码',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_door
-- ----------------------------
INSERT INTO `t_door` VALUES (1, 1, 2, '西门门禁', 'dsafdasd', 1, 0, 0, 0, 1, 0, 0, '2023-05-29 14:54:15', 10000, '2023-05-29 16:58:27', 10000);
INSERT INTO `t_door` VALUES (2, 1, 1, '门禁2', 'asfsjkfjalsdf', 0, 0, 1, 0, 0, 0, 0, '2023-05-29 16:58:23', 10000, '2023-05-29 16:58:28', 10000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物业账号表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_house
-- ----------------------------
INSERT INTO `t_house` VALUES (1, 1, 1, 'A-101', 123, 1, '四面通透', 0, 1, '2023-05-24 18:33:46', 1, '2023-05-24 18:33:49', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (2, 1, 1, 'A-102', 124, 1, 'ok', 0, 1, '2023-05-24 00:00:00', 1, '2023-05-28 13:29:22', '万象城', '博闻居', 1);
INSERT INTO `t_house` VALUES (3, 1, 1, 'A-103', 124, 0, NULL, 0, 1, '2023-05-24 21:13:33', 1, '2023-05-24 21:14:44', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (4, 1, 1, 'A-104', 124, 0, NULL, 0, 1, '2023-05-24 21:13:36', 1, '2023-05-24 21:14:47', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (5, 1, 1, 'A-105', 124, 0, NULL, 0, 1, '2023-05-24 21:13:38', 1, '2023-05-24 21:14:49', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (6, 1, 1, 'B-106', 124, 0, NULL, 0, 1, '2023-05-24 21:13:41', 1, '2023-05-24 21:14:52', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (7, 1, 1, 'B-107', 124, 0, NULL, 0, 1, '2023-05-24 21:13:43', 1, '2023-05-24 21:14:55', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (8, 1, 1, 'B-108', 124, 0, NULL, 0, 1, '2023-05-24 21:13:47', 1, '2023-05-24 21:14:57', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (9, 1, 1, 'B-109', 124, 0, NULL, 0, 1, '2023-05-24 21:13:49', 1, '2023-05-24 21:14:59', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (10, 1, 1, 'B-110', 124, 0, NULL, 0, 1, '2023-05-24 21:13:52', 1, '2023-05-24 21:15:02', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (11, 2, 2, 'A-101', 124, 0, NULL, 0, 1, '2023-05-24 21:13:55', 1, '2023-05-24 21:15:04', '汤臣一品', '文博楼', 1);
INSERT INTO `t_house` VALUES (12, 2, 2, 'A-102', 124, 0, NULL, 0, 1, '2023-05-24 21:13:58', 1, '2023-05-24 21:15:07', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (13, 2, 2, 'A-103', 124, 0, NULL, 0, 1, '2023-05-24 21:14:00', 1, '2023-05-24 21:15:09', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (14, 2, 2, 'A-104', 124, 0, NULL, 0, 1, '2023-05-24 21:14:17', 1, '2023-05-24 21:15:11', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (15, 2, 2, 'A-105', 124, 0, NULL, 0, 1, '2023-05-24 21:14:24', 1, '2023-05-24 21:15:14', NULL, NULL, 1);
INSERT INTO `t_house` VALUES (16, 2, 2, 'B-106', 124, 0, NULL, 0, 1, '2023-05-24 21:14:27', 1, '2023-05-24 21:15:17', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (17, 2, 2, 'B-107', 124, 0, NULL, 0, 1, '2023-05-24 21:14:29', 1, '2023-05-24 21:15:20', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (18, 2, 2, 'B-108', 124, 0, NULL, 0, 1, '2023-05-24 21:14:31', 1, '2023-05-24 21:15:22', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (19, 2, 2, 'B-109', 124, 0, NULL, 0, 1, '2023-05-24 21:14:34', 1, '2023-05-24 21:15:24', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (20, 2, 2, 'B-110', 124, 0, NULL, 0, 1, '2023-05-24 21:14:36', 1, '2023-05-24 21:15:27', NULL, NULL, 2);
INSERT INTO `t_house` VALUES (21, 3, 2, 'C-102', 124, 0, NULL, 0, 1, '2023-05-24 21:14:39', 1, '2023-05-24 21:15:30', NULL, NULL, 3);
INSERT INTO `t_house` VALUES (22, 3, 3, 'C-203', 32, 0, '', 0, 1, '2023-05-27 15:58:04', 1, '2023-05-27 15:58:31', '', '', 3);
INSERT INTO `t_house` VALUES (24, 1, 1, 'H-109', 222, 0, '1212', 0, NULL, '2023-05-28 00:00:00', NULL, '2023-05-28 14:18:40', '', '', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灯控表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mall
-- ----------------------------
INSERT INTO `t_mall` VALUES (1, 1, 1, 'A101', '江苏南京', 46, '商业街商铺', 0, 0, 1, '2023-05-24 00:00:00', 1, '2023-05-29 11:22:43');
INSERT INTO `t_mall` VALUES (2, 1, 2, 'B202', '江苏南京', 62, '住宅底层商铺', 0, 0, 1, '2023-05-24 21:48:23', 1, '2023-05-24 21:48:26');
INSERT INTO `t_mall` VALUES (3, 2, 1, 'C-303', '江苏无锡', 85, '商业街商铺', 0, 0, 1, '2023-05-28 20:11:40', 1, '2023-05-28 20:11:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仪表表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控分组' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-29 12:57:08', 10000, 10000);
INSERT INTO `t_notice` VALUES (2, 2, 10000, 0, '消杀通知2', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 19:26:57', '2023-05-24 19:26:57', 10000, 10000);
INSERT INTO `t_notice` VALUES (3, 2, 10000, 0, '消杀通知3', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:05', '2023-05-24 22:21:05', 10000, 10000);
INSERT INTO `t_notice` VALUES (4, 2, 10000, 0, '消杀通知4', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:07', '2023-05-24 22:21:07', 10000, 10000);
INSERT INTO `t_notice` VALUES (5, 2, 10000, 0, '消杀通知5', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:21:09', '2023-05-24 22:21:09', 10000, 10000);
INSERT INTO `t_notice` VALUES (6, 2, 10000, 0, '消杀通知6', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 0, '2023-05-24 22:25:37', '2023-05-24 22:25:37', 10000, 10000);
INSERT INTO `t_notice` VALUES (7, 2, 10000, 0, '消杀通知7', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 0, 0, 0, '2022-12-24 22:22:22', 0, NULL, NULL, 1, '2023-05-24 22:26:43', '2023-05-25 22:53:54', 10000, 10000);
INSERT INTO `t_notice` VALUES (8, 2, 10000, 0, '1', '1', '', 0, 0, 1, '2023-05-31 16:00:00', 0, NULL, NULL, 1, '2023-05-25 23:30:45', '2023-05-25 23:31:03', 10000, 10000);
INSERT INTO `t_notice` VALUES (9, 1, 10000, 0, '1', '1', '', 0, 0, 1, '2023-05-31 08:00:00', 0, NULL, NULL, 1, '2023-05-25 23:30:46', '2023-05-25 23:31:01', 10000, 10000);
INSERT INTO `t_notice` VALUES (10, 1, 10000, 0, 'test', 'test', '', 0, 0, 1, '2023-05-25 16:00:00', 0, NULL, NULL, 0, '2023-05-26 09:16:04', '2023-05-26 09:16:04', 10000, 10000);
INSERT INTO `t_notice` VALUES (11, 1, 10000, 2, '缴费通知测试', '缴费通知测试', '', 0, 0, 0, '2023-05-26 16:00:00', 1, NULL, NULL, 0, '2023-05-26 21:08:47', '2023-05-29 22:57:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (12, 1, 10000, 2, '万象城缴费2', '万象城缴费', '', 0, 0, 0, '2023-05-26 18:12:01', 1, NULL, NULL, 1, '2023-05-27 11:29:48', '2023-05-27 11:31:32', 10000, 10000);
INSERT INTO `t_notice` VALUES (13, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (14, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (15, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (16, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (17, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (18, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (19, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);
INSERT INTO `t_notice` VALUES (20, 2, 10000, 0, '消杀通知11', '您好！为了给大家提供一个舒适、卫生的生活环境，进一步有效控制小区“四害”孳生，减少四害对大家生活影响，管理处计划2月份安排小区公共区域集中消杀4次', '', 2, 1, 0, '2022-12-24 14:22:22', 1, NULL, NULL, 0, '2023-05-24 16:08:13', '2023-05-26 19:18:50', 10000, 10000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告阅读记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice_reader
-- ----------------------------
INSERT INTO `t_notice_reader` VALUES (1, 1, 1, 0, '2023-05-24 22:38:44', '2023-05-24 22:38:44');
INSERT INTO `t_notice_reader` VALUES (2, 2, 1, 0, '2023-05-24 22:39:02', '2023-05-24 22:39:02');
INSERT INTO `t_notice_reader` VALUES (4, 1, 2, 0, '2023-05-25 07:59:23', '2023-05-25 07:59:23');
INSERT INTO `t_notice_reader` VALUES (5, 1, 2, 0, '2023-05-25 08:08:47', '2023-05-25 08:08:47');
INSERT INTO `t_notice_reader` VALUES (6, 1, 2, 0, '2023-05-25 09:16:17', '2023-05-25 09:16:17');
INSERT INTO `t_notice_reader` VALUES (7, 0, 0, 0, '2023-05-28 21:33:27', '2023-05-28 21:33:27');

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
  `house_id` bigint NULL DEFAULT NULL COMMENT '房屋表主键',
  `end_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '订单结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 1, NULL, 1, 1, 3, '1', 132, 123, 1, NULL, 1, '2023-05-25 19:25:55', 10000, 10000, '2023-05-25 19:25:55', 11, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (2, 2, NULL, 2, 2, 4, '1232', 12, 32.2, 0, NULL, 0, '2023-05-25 19:26:25', 10000, 10000, '2023-05-25 19:26:25', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (3, 6, NULL, 0, 0, 5, '1', 0, 12.53, 1, NULL, 0, '2023-05-25 19:27:27', 0, 0, '2023-05-25 19:27:27', 12, 1, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (4, 3, NULL, 1, 1, 3, '1', 132, 572, 0, NULL, 0, '2023-05-26 20:54:24', 10000, 10000, '2023-05-26 20:54:24', 13, 15, '2023-05-27 15:55:05');
INSERT INTO `t_order` VALUES (5, 4, NULL, 2, 2, 4, '1232', 12, 903.3, 1, NULL, 0, '2023-05-26 20:54:24', 10000, 10000, '2023-05-26 20:54:24', 14, 15, '2023-05-27 15:55:05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_owner
-- ----------------------------
INSERT INTO `t_owner` VALUES (1, 2, 1, NULL, '王晓刚', 1, '18888888888', '321302198006232359', '{\"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 1, 1, 0, 1, '2023-05-25 22:06:53', 1, '2023-05-25 22:06:55');
INSERT INTO `t_owner` VALUES (2, 2, 2, NULL, '王晓刚', 1, '18888888888', '321302198006232359', '{\"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 0, 1, 0, 1, '2023-05-27 14:34:44', 1, '2023-05-27 14:34:47');
INSERT INTO `t_owner` VALUES (3, NULL, 1, 1, '张三', 1, '13838489572', '1', NULL, 1, 1, 1, 0, 1, '2023-05-27 14:44:53', 1, '2023-05-27 14:44:55');
INSERT INTO `t_owner` VALUES (4, NULL, 1, 1, '王五', 1, '18888523489', '', NULL, 1, 0, 1, 0, 2, '2023-05-27 22:30:04', 2, '2023-05-27 22:30:04');
INSERT INTO `t_owner` VALUES (5, NULL, 2, 2, 'test', 1, '15935765429', '', NULL, 2, 0, 1, 1, 2, '2023-05-28 11:05:53', 2, '2023-05-28 11:34:14');
INSERT INTO `t_owner` VALUES (7, 5, 11, NULL, '蔡徐坤', 0, '16666666666', '320301198803172347', '{\"gender\": 1, \"address\": \"江苏省南京市建邺区\", \"realName\": \"赵刚\", \"relation\": \"朋友\"}', 0, 0, 0, 0, 1, '2023-05-30 09:11:22', 1, '2023-05-30 09:11:29');

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
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_park_record
-- ----------------------------
INSERT INTO `t_park_record` VALUES (1, 1, 1, 1, '2023-05-10 21:59:41', '2023-05-11 21:59:51', 240, 0, 0, 1, '2023-05-24 22:00:14', 1, '2023-05-24 22:00:16');
INSERT INTO `t_park_record` VALUES (2, 2, 3, 2, '2023-05-16 09:24:33', '2023-05-30 09:24:37', 1800, 0, 0, 1, '2023-05-30 09:24:48', 1, '2023-05-30 09:24:50');
INSERT INTO `t_park_record` VALUES (3, 3, 1, 2, '2023-05-30 09:26:08', '2023-05-30 09:26:11', 245, 0, 0, 1, '2023-05-30 09:26:18', 1, '2023-05-30 09:26:20');
INSERT INTO `t_park_record` VALUES (4, 4, 2, 1, '2023-05-29 09:26:38', '2023-05-30 09:26:43', 120, 0, 0, 1, '2023-05-30 09:26:51', 1, '2023-05-30 09:26:53');

-- ----------------------------
-- Table structure for t_pass_record
-- ----------------------------
DROP TABLE IF EXISTS `t_pass_record`;
CREATE TABLE `t_pass_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '业主id',
  `door_id` bigint NOT NULL COMMENT '闸机id',
  `pass_way` tinyint NOT NULL COMMENT '出入方式 0-刷卡 1-人脸 2-指纹',
  `community_id` bigint NOT NULL COMMENT '小区id',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通行记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pass_record
-- ----------------------------
INSERT INTO `t_pass_record` VALUES (1, 1, 1, 1, 1, 0, '2023-05-29 21:03:21', 1, '2023-05-29 21:03:21', 1);
INSERT INTO `t_pass_record` VALUES (2, 1, 2, 0, 2, 0, '2023-05-29 21:03:37', 1, '2023-05-29 21:03:37', 1);
INSERT INTO `t_pass_record` VALUES (3, 2, 1, 2, 1, 0, '2023-05-29 21:03:55', 2, '2023-05-29 21:03:55', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pass_review
-- ----------------------------
INSERT INTO `t_pass_review` VALUES (1, 1, 1, 0, 0, 1, 0, '2023-05-29 19:11:12', 1, '2023-05-29 19:56:04', 10000);
INSERT INTO `t_pass_review` VALUES (2, 1, 1, 1, 1, 2, 0, '2023-05-29 19:59:02', 1, '2023-05-29 20:24:00', 10000);
INSERT INTO `t_pass_review` VALUES (3, 2, 2, 0, 1, 0, 0, '2023-05-29 19:59:40', 1, '2023-05-29 19:59:40', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更路线表' ROW_FORMAT = Dynamic;

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
INSERT INTO `t_patrol_path` VALUES (58, 1, 'test', 11.000000, 1, 0, 0, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_patrol_path` VALUES (59, 1, '111', 1111.000000, 1, 1, 0, 10000, '2023-05-29 19:37:32', 10000, '2023-05-29 19:37:32');
INSERT INTO `t_patrol_path` VALUES (60, 1, '1', 1.000000, 1, 0, 1, 10000, '2023-05-30 09:07:51', 10000, '2023-05-30 09:09:27');
INSERT INTO `t_patrol_path` VALUES (61, 1, '巡更点', 111.000000, 1, 1, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_patrol_path` VALUES (62, 1, '1', 1.000000, 1, 1, 0, 10000, '2023-05-30 09:17:06', 10000, '2023-05-30 09:17:06');
INSERT INTO `t_patrol_path` VALUES (63, 1, '11', 111.000000, 1, 1, 0, 10000, '2023-05-30 09:17:35', 10000, '2023-05-30 09:17:35');

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
  `plan_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划开始日期',
  `last_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上次生成时间',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（1：正常，0：禁用）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_plan
-- ----------------------------
INSERT INTO `t_patrol_plan` VALUES (1, 1, '撒旦撒旦', 1, 10000, 0, 0, NULL, NULL, NULL, NULL, '', 1, 0, 0, '2023-05-25 07:26:54', 0, '2023-05-25 07:29:11');
INSERT INTO `t_patrol_plan` VALUES (2, 1, '撒旦撒旦2', 1, 10000, 0, 0, NULL, NULL, NULL, NULL, '', 1, 0, 0, '2023-05-25 07:26:54', 0, '2023-05-25 07:29:11');
INSERT INTO `t_patrol_plan` VALUES (3, 1, '撒旦撒旦3', 0, 10001, 0, 0, NULL, NULL, NULL, NULL, '', 1, 0, 0, '2023-05-25 07:26:54', 0, '2023-05-25 07:29:11');
INSERT INTO `t_patrol_plan` VALUES (4, 2, '撒旦撒旦4', 1, 10000, 0, 0, NULL, NULL, NULL, NULL, '', 1, 0, 0, '2023-05-25 07:26:54', 0, '2023-05-25 07:29:11');
INSERT INTO `t_patrol_plan` VALUES (5, 3, '正常巡更计划', 1, 10001, 0, 0, NULL, NULL, NULL, NULL, '', 1, 0, 10000, '2023-05-25 22:45:44', 10000, '2023-05-25 22:45:44');
INSERT INTO `t_patrol_plan` VALUES (6, 2, '第一次添加计划aaa', 1, 10000, 1, 0, NULL, NULL, NULL, NULL, '', 1, 0, 10000, '2023-05-27 12:42:27', 10000, '2023-05-27 12:43:06');
INSERT INTO `t_patrol_plan` VALUES (7, 2, '添加的第二条', 1, 10000, 1, 1, NULL, NULL, NULL, NULL, '', 1, 0, 10000, '2023-05-27 12:42:48', 10000, '2023-05-27 12:43:06');
INSERT INTO `t_patrol_plan` VALUES (8, 1, '完成添加一', 1, 10005, 3, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-27 15:40:08', 10000, '2023-05-27 15:40:26');
INSERT INTO `t_patrol_plan` VALUES (9, 2, '完整添加二', 3, 10004, 6, 2, NULL, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-27 15:41:03', 10000, '2023-05-27 15:41:03');
INSERT INTO `t_patrol_plan` VALUES (10, 1, '完整添加三', 2, 10004, 3, 0, '08:00', '12:00', NULL, NULL, 'w', 1, 0, 10000, '2023-05-27 15:55:33', 10000, '2023-05-27 16:26:13');
INSERT INTO `t_patrol_plan` VALUES (11, 1, '汤臣一品', 1, 10004, 3, 0, '08:00', '10:00', NULL, NULL, '工作认证', 1, 0, 10000, '2023-05-27 18:58:10', 10000, '2023-05-27 18:58:45');
INSERT INTO `t_patrol_plan` VALUES (12, 2, '线路三巡更', 1, 10004, 3, 1, '16:00', '20:00', NULL, NULL, '认真工作', 1, 0, 10000, '2023-05-28 12:20:52', 10000, '2023-05-28 12:21:19');

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_points
-- ----------------------------
INSERT INTO `t_patrol_points` VALUES (1, 1, 1, '', '', '', 0, 1, 0, '2023-05-25 15:21:30', 10000, '2023-05-26 19:45:41');
INSERT INTO `t_patrol_points` VALUES (2, 2, 9, '巡更点4', '', '', 1, 0, 10000, '2023-05-26 15:55:41', 10000, '2023-05-29 16:50:29');
INSERT INTO `t_patrol_points` VALUES (3, 2, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 11:48:01', 10000, '2023-05-27 11:48:27');
INSERT INTO `t_patrol_points` VALUES (4, 1, 1, '1', '1', '1', 1, 1, 10000, '2023-05-27 11:48:15', 10000, '2023-05-27 14:49:54');
INSERT INTO `t_patrol_points` VALUES (5, 1, 1, '1', '1', '1', 1, 1, 10000, '2023-05-27 14:42:47', 10000, '2023-05-27 14:49:54');
INSERT INTO `t_patrol_points` VALUES (6, 6, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:43:07', 10000, '2023-05-27 14:43:07');
INSERT INTO `t_patrol_points` VALUES (7, 5, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:44:41', 10000, '2023-05-27 14:44:41');
INSERT INTO `t_patrol_points` VALUES (8, 2, 1, '巡更点测试', '1', '1', 1, 0, 10000, '2023-05-27 14:46:56', 10000, '2023-05-27 14:46:56');
INSERT INTO `t_patrol_points` VALUES (9, 1, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:52:19', 10000, '2023-05-27 14:52:19');
INSERT INTO `t_patrol_points` VALUES (10, 5, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:52:40', 10000, '2023-05-27 14:52:40');
INSERT INTO `t_patrol_points` VALUES (11, 2, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:53:04', 10000, '2023-05-27 14:53:04');
INSERT INTO `t_patrol_points` VALUES (12, 2, 44, '44', '44', '44', 1, 0, 10000, '2023-05-27 14:53:46', 10000, '2023-05-27 14:53:46');
INSERT INTO `t_patrol_points` VALUES (13, 5, NULL, '1', '1', '1', 1, 0, 10000, '2023-05-27 14:54:47', 10000, '2023-05-27 14:54:47');
INSERT INTO `t_patrol_points` VALUES (14, 7, NULL, '11111111', '111', '111', 1, 0, 10000, '2023-05-27 14:55:17', 10000, '2023-05-27 14:55:17');
INSERT INTO `t_patrol_points` VALUES (15, 7, NULL, '11111111', '111', '111', 1, 0, 10000, '2023-05-27 14:55:18', 10000, '2023-05-27 14:55:18');
INSERT INTO `t_patrol_points` VALUES (16, 2, 1, '1', '1', '1', 0, 0, 10000, '2023-05-27 14:56:58', 10000, '2023-05-27 14:56:58');
INSERT INTO `t_patrol_points` VALUES (17, 1, 1, '1111', '111', '111', 1, 0, 10000, '2023-05-27 14:57:50', 10000, '2023-05-27 14:57:50');
INSERT INTO `t_patrol_points` VALUES (18, 2, 52, '阿斯顿撒打算', '12', '21', 1, 0, 10000, '2023-05-27 14:58:37', 10000, '2023-05-27 14:58:37');
INSERT INTO `t_patrol_points` VALUES (19, 1, 1, '1', '1', '1', 1, 0, 10000, '2023-05-27 19:19:51', 10000, '2023-05-27 19:19:51');
INSERT INTO `t_patrol_points` VALUES (20, 1, 1, '1呃呃呃', '111', '105.778506,37.580265', 1, 0, 10000, '2023-05-27 20:26:19', 10000, '2023-05-27 20:26:19');
INSERT INTO `t_patrol_points` VALUES (21, 1, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-28 20:19:28', 10000, '2023-05-28 20:19:28');
INSERT INTO `t_patrol_points` VALUES (22, 1, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-28 20:20:15', 10000, '2023-05-28 20:20:15');
INSERT INTO `t_patrol_points` VALUES (23, 2, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-28 20:20:36', 10000, '2023-05-28 20:20:36');
INSERT INTO `t_patrol_points` VALUES (24, 1, NULL, NULL, NULL, NULL, 1, 0, 10000, '2023-05-28 20:21:49', 10000, '2023-05-28 20:21:49');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_patrol_records
-- ----------------------------
INSERT INTO `t_patrol_records` VALUES (1, 1, 1, 1, 1, '2023-05-25 16:23:41', '大师傅似的', 1, '四十分的都是非', '和技术发达和大数据开发和', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `t_patrol_records` VALUES (2, 1, 1, 1, 1, '2023-05-25 16:23:41', '大师傅似的', 1, '四十分的都是非', '和技术发达和大数据开发和', 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `t_patrol_records` VALUES (3, 1, 1, 1, 1, '2023-05-25 16:26:11', '对方的算法', 1, '第三方的说', '水电费的说法', 0, 0, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电话表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机日志' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点线路关联表' ROW_FORMAT = Dynamic;

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
INSERT INTO `t_points_path` VALUES (23, 58, 2, 0, 0, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (24, 58, 8, 0, 0, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (25, 58, 16, 0, 0, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (26, 58, 18, 0, 0, 10000, '2023-05-29 19:37:12', 10000, '2023-05-29 19:37:12');
INSERT INTO `t_points_path` VALUES (27, 61, 4, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (28, 61, 9, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (29, 61, 19, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');
INSERT INTO `t_points_path` VALUES (30, 61, 20, 0, 0, 10000, '2023-05-30 09:09:18', 10000, '2023-05-30 09:09:18');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统职位表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡检项目线路关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物业公司表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_repair
-- ----------------------------
INSERT INTO `t_repair` VALUES (1, 1, 10000, 0, 0, '万达小区', '马路坏了', '马路坏了', 'https://pic.dmjnb.com/pic/356ca8d1f79bc0a5a60eb4ffbe86aaf7', 0, '10004', '', NULL, '', NULL, 0, '2023-05-26 09:52:35', '2023-05-30 09:08:34', 10000, 10000);
INSERT INTO `t_repair` VALUES (2, 1, 10000, 1, 1, '2', '1', '1', '', 0, '10000', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-28 15:17:10', 10000, 10000);
INSERT INTO `t_repair` VALUES (3, 1, 10000, 1, 1, '2', '1', '1', '', 0, '10004', '', NULL, '', NULL, 0, '2023-05-26 10:11:29', '2023-05-30 09:22:35', 10000, 10000);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报修处理表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'other', 1, 'https://king-hf-bucket.oss-cn-shanghai.aliyuncs.com/avatar/me.jpg', '15995376582', '张之维', '1992年10月5日', '汉', 0, 0, '无党派人士', '江苏南京', 0, NULL, '江苏南京', 0, 1, '2023-05-24 16:13:21', 1, '2023-05-24 16:13:27');
INSERT INTO `t_user` VALUES (2, 'test', 1, 'https://public-cdn-oss.mosoteach.cn/avatar/2023/03/21a14d3038130cdc475660aec09be3f2.jpg?v=1677922967&x-oss-process=style/s300x300', '18888888888', '王晓刚', '1980-08-02', '汉', 0, 0, '党员', '江苏宿迁', 0, NULL, '江苏省昆山市陆家镇', 0, 1, '2023-05-25 22:00:20', 1, '2023-05-25 22:00:50');
INSERT INTO `t_user` VALUES (3, 'zoe', 0, 'https://s1.ax1x.com/2023/03/20/ppNuvzn.png', '14356775321', '佐伊', '1550-06-11', '汉', 0, 0, '无党派人士', '江苏宜兴', 0, NULL, '江苏无锡', 0, 1, '2023-05-29 20:15:14', 1, '2023-05-29 20:15:18');
INSERT INTO `t_user` VALUES (4, 'abu', 0, 'https://public-cdn-oss.mosoteach.cn/avatar/2019/E1/98b642757c420f0907ee54db4dd21217.jpg?v=1569460487&x-oss-process=style/s300x300', '13838489572', '疾风剑豪', '1999-06-20', '汉', 0, 0, '无党派人士', '浙江宁波', 0, NULL, '浙江宁波', 0, 1, '2023-05-29 20:49:14', 1, '2023-05-29 20:49:19');
INSERT INTO `t_user` VALUES (5, '鸡你太美', 0, 'https://p6.toutiaoimg.com/origin/user-avatar/7404256ed8ffc327e30d2054294d58d4', '16666666666', '蔡徐坤', '1981-03-17', '汉', 0, 0, '无党派人士', '浙江温州', 0, NULL, '浙江温州', 0, 1, '2023-05-30 09:07:31', 1, '2023-05-30 09:07:35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor
-- ----------------------------
INSERT INTO `t_visitor` VALUES (1, 0, '汪涵', '1231414', '1', 0, 11, 0, '2023-05-25 19:44:19', 10000, 10000, '2023-05-25 19:44:19');
INSERT INTO `t_visitor` VALUES (2, 2, '焊缝', '12345678999', '1,3,4', 0, 2, 0, '2023-05-29 18:53:03', 10000, 10000, '2023-05-29 18:53:03');
INSERT INTO `t_visitor` VALUES (3, 3, '王峰', '12345678901', '1,3', 0, 12, 0, '2023-05-29 18:54:05', 10000, 10000, '2023-05-29 18:54:05');
INSERT INTO `t_visitor` VALUES (4, 5, '冯韩', '12735507846', '3,4', 0, 0, 0, '2023-05-29 18:54:50', 10000, 10000, '2023-05-29 18:54:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_visitor_invitation
-- ----------------------------
INSERT INTO `t_visitor_invitation` VALUES (1, 1, 10000, '1,3', '2023-05-25 19:44:19', 0, 0, '2023-05-23 20:05:06', 10000, 10000, '2023-05-25 20:05:06', 1);
INSERT INTO `t_visitor_invitation` VALUES (2, 2, 10001, '1,2,3', '2023-05-24 16:05:18', 0, 0, '2023-05-23 16:05:30', 10000, 10000, '2023-05-29 16:05:30', 2);
INSERT INTO `t_visitor_invitation` VALUES (3, 3, 10005, '2,3', '2023-05-25 18:56:57', 0, 0, '2023-05-24 18:57:13', 10000, 10000, '2023-05-29 18:57:13', 12);
INSERT INTO `t_visitor_invitation` VALUES (4, 4, 10004, '3', '2023-05-30 18:57:29', 0, 0, '2023-05-29 18:57:36', 10000, 10000, '2023-05-29 18:57:36', 21);

SET FOREIGN_KEY_CHECKS = 1;
