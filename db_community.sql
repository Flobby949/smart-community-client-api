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

 Date: 23/05/2023 15:35:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键;主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录账号;登录账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码;登录密码',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号;手机号',
  `account_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态(1:正常,2:停用,3:冻结,4:删除);账号状态',
  `online_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否在线(0:离线 1:在线);是否在线',
  `community_id` bigint NULL DEFAULT NULL COMMENT '小区id;小区id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除;删除标识',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人;创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人;更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_department`;
CREATE TABLE `sys_admin_department`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` bigint NULL DEFAULT NULL COMMENT '管理员id',
  `department_id` bigint NULL DEFAULT NULL COMMENT '管理员所属部门id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_info`;
CREATE TABLE `sys_admin_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` bigint NULL DEFAULT NULL COMMENT '管理员id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `post_id` bigint NULL DEFAULT NULL COMMENT '职务id',
  `gender` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `vx_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `job_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `graduate_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `graduate_time` datetime(0) NULL DEFAULT NULL COMMENT '毕业时间',
  `education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int NULL DEFAULT NULL COMMENT '排序字段',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限url',
  `authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权标识',
  `type` tinyint NULL DEFAULT NULL COMMENT '权限类型（0:菜单   1:按钮   2:接口）;类型   0：菜单   1：按钮   2：接口',
  `open_style` tinyint NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门状态',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `terminal_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端类型',
  `browser_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `device_mac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'mac地址',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `post_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `sort` int NULL DEFAULT NULL COMMENT '排序字段',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位' ROW_FORMAT = Dynamic;

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
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态（0:启用 1:禁用）',
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）;数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `admin_id` bigint NULL DEFAULT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色管理员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_authority`;
CREATE TABLE `sys_role_authority`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `authority_id` bigint NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `department_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色数据权限关系表' ROW_FORMAT = Dynamic;

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
  `operate` tinyint NULL DEFAULT NULL COMMENT '操作',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色操作记录表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `property` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物业表的，关联物业公司',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `activity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动名称',
  `activity_type` int NOT NULL DEFAULT 0 COMMENT '活动类别',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动标题',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键;主键',
  `USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录账号;登录账号',
  `PASSWORD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码;登录密码',
  `PHONE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号;手机号',
  `ACCOUNT_STATUS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态(1:正常,2:停用,3:冻结,4:删除);账号状态',
  `ONLINE_STATUS` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否在线(0:离线 1:在线);是否在线',
  `COMMUNITY_ID` bigint NULL DEFAULT NULL COMMENT '小区ID;小区ID',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除;删除标识',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人;创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间;创建时间',
  `UPDATOR` bigint NULL DEFAULT NULL COMMENT '更新人;更新人',
  `UPDATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间;更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_admin_department
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_department`;
CREATE TABLE `t_admin_department`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADMIN_ID` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  `DEPARTMENT_ID` bigint NULL DEFAULT NULL COMMENT '管理员所属部门ID',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATOR` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_admin_info
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_info`;
CREATE TABLE `t_admin_info`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ADMIN_ID` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  `REAL_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `AVATAR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `POST_ID` bigint NULL DEFAULT NULL COMMENT '职务ID',
  `GENDER` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `VX_ACCOUNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信账号',
  `JOB_NUMBER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `NATIVE_PLACE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `GRADUATE_SCHOOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `GRADUATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '毕业时间',
  `EDUCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  `MAJOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `REMARK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `SORT` int NULL DEFAULT NULL COMMENT '排序字段',
  `DELETED` tinyint NULL DEFAULT NULL COMMENT '删除标识 0：正常 1:删除',
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATOR` bigint NULL DEFAULT NULL COMMENT '更新人',
  `UPDATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_agreement
-- ----------------------------
DROP TABLE IF EXISTS `t_agreement`;
CREATE TABLE `t_agreement`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `type` tinyint NOT NULL COMMENT '类型（0用户协议 1隐私政策）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0未删除 1已删除）',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户隐私' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限URL',
  `authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权标识',
  `type` tinyint NULL DEFAULT NULL COMMENT '权限类型（0:菜单   1:按钮   2:接口）;类型   0：菜单   1：按钮   2：接口',
  `open_style` tinyint NULL DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bill
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '业主表主键',
  `money` double(11, 2) NULL DEFAULT 0.00 COMMENT '收费金额',
  `status` tinyint NULL DEFAULT 0 COMMENT '缴费状态（0：缴费 1：未缴费）',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_bill_type
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_type`;
CREATE TABLE `t_bill_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缴费项目名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缴费项目描述（可为空）',
  `price` double(11, 2) NULL DEFAULT 0.00 COMMENT '价格（收费项目单位价格）',
  `discount` double(11, 2) NULL DEFAULT 1.00 COMMENT '折扣率',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：启用1：禁用',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id',
  `building_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '楼宇名称',
  `units` int NOT NULL COMMENT '所在单元',
  `used_area` int NULL DEFAULT NULL COMMENT '使用面积',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '楼宇表' ROW_FORMAT = Dynamic;

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
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

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
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '车位状态(0：闲置 1：未售 2：已售)',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '租赁开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '租赁结束时间',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车位表' ROW_FORMAT = Dynamic;

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
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_complaint
-- ----------------------------
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE `t_complaint`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `user_id` bigint NOT NULL COMMENT '投诉人id',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '投诉类型(0:物业服务，1:社区服务)',
  `titile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投诉标题',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉表' ROW_FORMAT = Dynamic;

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
-- Table structure for t_device
-- ----------------------------
DROP TABLE IF EXISTS `t_device`;
CREATE TABLE `t_device`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常 1：故障）',
  `device_type` bigint NOT NULL COMMENT '设备类别id',
  `community_id` bigint NOT NULL COMMENT '设备所属小区id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备位置',
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '设备二维码url',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备表' ROW_FORMAT = Dynamic;

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
  `deleted` tinyint NOT NULL COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_door
-- ----------------------------
DROP TABLE IF EXISTS `t_door`;
CREATE TABLE `t_door`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁表' ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋表' ROW_FORMAT = Dynamic;

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
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_meter
-- ----------------------------
DROP TABLE IF EXISTS `t_meter`;
CREATE TABLE `t_meter`  (
  `pk_id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `meter_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '仪表名称',
  `community_id` bigint NOT NULL COMMENT '所属小区id',
  `meter_type` tinyint NOT NULL COMMENT '仪表位置 0-房间表 1-公摊表',
  `price` double NOT NULL COMMENT '价格',
  `start_num` double NOT NULL DEFAULT 0 COMMENT '开始数值',
  `now_num` double NOT NULL DEFAULT 0 COMMENT '当前数值',
  `max` double NOT NULL COMMENT '最大数值',
  `total_use` double NOT NULL DEFAULT 0 COMMENT '总用量',
  `online_status` tinyint NOT NULL DEFAULT 0 COMMENT '在线状态 0-在线 1-离线',
  `gate_status` tinyint NOT NULL DEFAULT 0 COMMENT '通电状态 0-合闸 1-关闸',
  `delete_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仪表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_monitor
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor`;
CREATE TABLE `t_monitor`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_id` bigint NOT NULL COMMENT '设备主键',
  `monitor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '监控名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常 1：故障）',
  `enabled` tinyint NOT NULL DEFAULT 0 COMMENT '0-启用 1-禁用',
  `monitor_type` bigint NOT NULL COMMENT '监控分组id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '监控直播url',
  `orderd` int NULL DEFAULT NULL COMMENT '排序',
  `daleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改责',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_monitor_type
-- ----------------------------
DROP TABLE IF EXISTS `t_monitor_type`;
CREATE TABLE `t_monitor_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '所属社区id',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型名称',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型描述',
  `orderd` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '监控分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `admin_id` bigint NOT NULL COMMENT '发布人id',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '通知类型(0:消杀通知 1：物业通知 2：缴费通知)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告内容',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `read_number` int NOT NULL DEFAULT 0 COMMENT '阅读数',
  `notice_way` tinyint NOT NULL COMMENT '提醒方式（0：系统消息 1：短信通知）',
  `notice_range` tinyint NOT NULL COMMENT '接受范围(0:全部楼宇，1：指定楼宇)',
  `publish_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发布时间',
  `review` tinyint NOT NULL COMMENT '审核(0:未审核，1：已审核，2:审核不通过)',
  `review_user_id` bigint NOT NULL COMMENT '审核人id',
  `review_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `deleted` tinyint NOT NULL COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `creator` bigint NOT NULL COMMENT '创建者',
  `updater` bigint NOT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_notice_reader
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_reader`;
CREATE TABLE `t_notice_reader`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notice_id` bigint NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '阅读人id',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告阅读记录表' ROW_FORMAT = Dynamic;

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
  `identity_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证',
  `e_contacts` json NULL COMMENT '紧急联系人信息(json)',
  `identity` tinyint NOT NULL COMMENT '身份标识(0:业主 1:家属 2:租户)',
  `default_adress` tinyint NOT NULL COMMENT '默认地址(0：否 1：是)',
  `state` tinyint NOT NULL COMMENT '状态(0:未审核1:已通过2:未通过)',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识(0:未删除 1:已删除)',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_park
-- ----------------------------
DROP TABLE IF EXISTS `t_park`;
CREATE TABLE `t_park`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '社区id',
  `park_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停车场名称',
  `contact_phone` int NULL DEFAULT NULL COMMENT '联系电话',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车场表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_park_card
-- ----------------------------
DROP TABLE IF EXISTS `t_park_card`;
CREATE TABLE `t_park_card`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NULL DEFAULT NULL COMMENT '社区id',
  `car_id` bigint NULL DEFAULT NULL COMMENT '车辆id',
  `carport_id` bigint NULL DEFAULT NULL COMMENT '车位id',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '业主id',
  `park_id` bigint NULL DEFAULT NULL COMMENT '停车场id',
  `effect_time` datetime(0) NULL DEFAULT NULL COMMENT '生效时间',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '月卡状态（0：启用中 1：未启用）',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '月卡表' ROW_FORMAT = Dynamic;

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
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '停车记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_pass_record
-- ----------------------------
DROP TABLE IF EXISTS `t_pass_record`;
CREATE TABLE `t_pass_record`  (
  `pk_id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '业主id',
  `door_id` bigint NOT NULL COMMENT '闸机id',
  `pass_way` tinyint NOT NULL COMMENT '出入方式 0-刷卡 1-人脸 2-指纹',
  `community_id` bigint NOT NULL COMMENT '小区id',
  `delete_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通行记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_pass_review
-- ----------------------------
DROP TABLE IF EXISTS `t_pass_review`;
CREATE TABLE `t_pass_review`  (
  `pk_id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `owner_id` bigint NOT NULL COMMENT '业主id',
  `house_id` bigint NOT NULL COMMENT '房屋id',
  `face` tinyint NOT NULL DEFAULT 0 COMMENT '是否有人脸（0-无，1-有）',
  `finger` tinyint NOT NULL DEFAULT 0 COMMENT '是否有指纹（0-无，1-有）',
  `delete_flag` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除 1：已删除）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NOT NULL COMMENT '创建人',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `updater` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门禁审核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_patrol_path
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_path`;
CREATE TABLE `t_patrol_path`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '所属小区',
  `way_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更路线名',
  `location_length` int NULL DEFAULT NULL COMMENT '定位距离(不能离开指定位置多少米)',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更路线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_patrol_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_plan`;
CREATE TABLE `t_patrol_plan`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '巡更路线id',
  `plan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更计划名',
  `path_id` bigint NOT NULL COMMENT '巡更路线id',
  `inspector_id` bigint NOT NULL COMMENT '巡更人id',
  `plan_cycle` tinyint NOT NULL COMMENT '巡更周期（0：每天，1：星期，2：月，3：年）',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '计划结束时间',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_patrol_points
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_points`;
CREATE TABLE `t_patrol_points`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `community_id` bigint NOT NULL COMMENT '所属小区',
  `point_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更点名称',
  `photo_requirement` tinyint NOT NULL DEFAULT 0 COMMENT '拍照要求(0:要求拍照，1不要求拍照)',
  `coordinate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '经纬度座标，逗号隔开',
  `location_length` double NULL DEFAULT NULL COMMENT '定位距离(不能离开指定位置多少米)',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_patrol_records
-- ----------------------------
DROP TABLE IF EXISTS `t_patrol_records`;
CREATE TABLE `t_patrol_records`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `plan_id` bigint NOT NULL COMMENT '巡更计划id',
  `path_id` bigint NOT NULL COMMENT '巡更路线id',
  `point_id` bigint NOT NULL COMMENT '巡更点id',
  `inspector_id` bigint NOT NULL COMMENT '巡更人id',
  `inspector_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '巡更提交时间',
  `inspector_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '巡更结果',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径，用逗号隔开',
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更记录表' ROW_FORMAT = Dynamic;

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
-- Table structure for t_points_path
-- ----------------------------
DROP TABLE IF EXISTS `t_points_path`;
CREATE TABLE `t_points_path`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `path_id` bigint NOT NULL COMMENT '巡更路线id',
  `point_id` bigint NOT NULL COMMENT '巡更点id',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：禁用）',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标识（0：未删除，1：已删除）',
  `creator` bigint NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updater` bigint NOT NULL COMMENT '修改者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '巡更点线路关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '报修表' ROW_FORMAT = Dynamic;

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
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `department_id` bigint NULL DEFAULT NULL COMMENT '所属部门',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态（0:启用 1:禁用）',
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）;数据范围（0:全部数据 1:本部门及子部门数据 2:本部门数据 3:本人数据 4:自定义数据）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_role_admin`;
CREATE TABLE `t_role_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `admin_id` bigint NULL DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色管理员关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_role_authority`;
CREATE TABLE `t_role_authority`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `authority_id` bigint NULL DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `t_role_data_scope`;
CREATE TABLE `t_role_data_scope`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `department_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色数据权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_role_operate_log`;
CREATE TABLE `t_role_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deleted` tinyint NULL DEFAULT NULL COMMENT '删除标识（0:未删除 1:已删除）',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `operate` tinyint NULL DEFAULT NULL COMMENT '操作',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色操作记录表' ROW_FORMAT = Dynamic;

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
  `CREATOR` bigint NULL DEFAULT NULL COMMENT '创建人',
  `CREATED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Dynamic;

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
  `brithday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_visitor
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor`;
CREATE TABLE `t_visitor`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `owner_id` int NOT NULL COMMENT '绑定业主id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访客姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权人手机号',
  `door_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁表主键，关联访客允许访问入口，用”,” 分割（1，2，3，4）',
  `status` tinyint NULL DEFAULT 0 COMMENT '访问状态（0：已经访问1：未访问）',
  `count` int NULL DEFAULT 0 COMMENT '访问次数',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time_1` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time_1` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_visitor_invitation
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor_invitation`;
CREATE TABLE `t_visitor_invitation`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `visitor_id` int NOT NULL COMMENT '访客表主键',
  `owner_id` int NOT NULL COMMENT '绑定业主id',
  `door_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门禁表主键，关联访客允许访问入口，用”,” 分割（1，2，3，4）',
  `end_time` datetime(0) NOT NULL COMMENT '访问结束时间，判断是否可访问',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（0：正常 1：禁用），判断是否可访问',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除标识 0：正常 1：已删除',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `creator` bigint NULL DEFAULT NULL COMMENT '创建者',
  `updater` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
