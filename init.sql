/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 127.0.0.1:8889
 Source Schema         : shiguangji

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 12/11/2022 17:11:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer_log
-- ----------------------------
DROP TABLE IF EXISTS `answer_log`;
CREATE TABLE `answer_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `answer1` varchar(255) DEFAULT '' COMMENT '第1题选择内容',
  `answer2` varchar(255) DEFAULT '' COMMENT '第2题选择内容',
  `answer3` varchar(255) DEFAULT '' COMMENT '第3题选择内容',
  `answer4` varchar(255) DEFAULT '' COMMENT '第4题选择内容',
  `answer5` varchar(255) DEFAULT '' COMMENT '第5题选择内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='回答记录';

-- ----------------------------
-- Records of answer_log
-- ----------------------------
BEGIN;
INSERT INTO `answer_log` VALUES (1, 14, '足够资源', '啊啊啊', '我好气', '', '', '', '2022-11-08 15:09:10');
INSERT INTO `answer_log` VALUES (2, 14, '足够资源', '啊啊啊', '10年', '2015年', '答案', '答案', '2022-11-09 09:36:05');
COMMIT;

-- ----------------------------
-- Table structure for configure
-- ----------------------------
DROP TABLE IF EXISTS `configure`;
CREATE TABLE `configure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(255) DEFAULT '' COMMENT '代码(strategy-攻略)',
  `content` text COMMENT '配置内容',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

-- ----------------------------
-- Records of configure
-- ----------------------------
BEGIN;
INSERT INTO `configure` VALUES (1, 'strategy', '<p>1234444</p><p>asdasd</p><p>asd</p><p>阿萨德2344444</p><p>asd</p><p>asd</p><p>asd</p><p>asd</p><p>a</p><p>sd</p><p>asd</p><p>a</p><p>sd</p><p>asd</p><p>a</p><p>sd</p><p>asd</p><p>a</p><p>sd</p><p>a3333</p>', '2022-10-27 13:24:10');
INSERT INTO `configure` VALUES (2, 'prize', '{\"probability\":50,\"limit\":110}', '2022-11-08 08:42:34');
COMMIT;

-- ----------------------------
-- Table structure for game_log
-- ----------------------------
DROP TABLE IF EXISTS `game_log`;
CREATE TABLE `game_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `profit_rate` decimal(10,2) DEFAULT NULL COMMENT '收益率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='游戏记录';

-- ----------------------------
-- Records of game_log
-- ----------------------------
BEGIN;
INSERT INTO `game_log` VALUES (1, 14, '2022-11-08 10:56:03', 15.23);
INSERT INTO `game_log` VALUES (2, 14, '2022-11-08 10:56:16', 15.23);
INSERT INTO `game_log` VALUES (3, 14, '2022-11-08 10:56:18', 15.23);
INSERT INTO `game_log` VALUES (4, 14, '2022-11-08 10:56:31', 16.23);
INSERT INTO `game_log` VALUES (5, 14, '2022-11-08 10:58:12', 16.23);
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nickname` varchar(255) DEFAULT '' COMMENT '昵称',
  `openid` varchar(28) DEFAULT NULL COMMENT '微信openid',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `gender` tinyint(2) unsigned DEFAULT '1' COMMENT '性别(1-男，2-女)',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '状态(1-正常，2-禁用)',
  `profit_rate` decimal(10,2) DEFAULT '0.00' COMMENT '收益率',
  `game_count` int(10) unsigned DEFAULT '0' COMMENT '游戏次数',
  `win_status` tinyint(2) unsigned DEFAULT '1' COMMENT '中奖状态(1-未中奖，2-已中奖，未填写信息，3-已完善信息)',
  `source` tinyint(2) unsigned DEFAULT '0' COMMENT '用户来源(1-微信，2-微博)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='前台用户表';

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES (12, '爱吃橘子的鱼', 'okt-awfzbtHUdPl2D6D9yqfMemKo', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ8z22CGDX5GwibCJkWmSs3uXwrB91jSjMKcZGrHBXCXCQTVYL402FVJbZGqeNgX71FtXyoxeKKOicA/132', 1, '2022-10-28 10:53:21', '2022-11-04 09:30:57', 1, 12.01, 3, 1, 1);
INSERT INTO `member` VALUES (13, '爱吃橘子的鱼', 'okt-aw2zbtHUdPl2D6D9yqfMemKo', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ8z22CGDX5GwibCJkWmSs3uXwrB91jSjMKcZGrHBXCXCQTVYL402FVJbZGqeNgX71FtXyoxeKKOicA/132', 1, '2022-10-28 10:53:21', NULL, 1, 5.00, 2, 1, 1);
INSERT INTO `member` VALUES (14, '足够资源', '6342442337', 'https://tvax1.sinaimg.cn/crop.0.0.1002.1002.180/006VeeZ3ly8ger5mf1xf3j30ru0ru0w7.jpg?KID=imgbed,tva&Expires=1667795292&ssig=mIZ4Z1i5Zu', 1, '2022-11-04 12:23:20', '2022-11-07 09:28:12', 1, 16.23, 1, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for prize
-- ----------------------------
DROP TABLE IF EXISTS `prize`;
CREATE TABLE `prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT '' COMMENT '奖品名称',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '状态(1-正常，2-禁用)',
  `num` int(10) unsigned DEFAULT '0' COMMENT '数量',
  `surplus_num` int(10) unsigned DEFAULT '0' COMMENT '剩余数量',
  `level` varchar(255) DEFAULT '' COMMENT '奖项等级',
  `image` varchar(255) DEFAULT '' COMMENT '图片',
  `description` varchar(1000) DEFAULT '' COMMENT '介绍',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建人',
  `update_by` varchar(255) DEFAULT '' COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='奖品表';

-- ----------------------------
-- Records of prize
-- ----------------------------
BEGIN;
INSERT INTO `prize` VALUES (1, '阿萨德', 1, 100, 96, '123', 'https://horsevision.oss-accelerate.aliyuncs.com/shiguangji/2022/33/3/h7uppeezjjiw.png', '123', '2022-11-03 11:24:00', '2022-11-09 10:05:36', 'admin', '6342442337');
COMMIT;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(1000) DEFAULT '' COMMENT '题目内容',
  `answers` text COMMENT '答案内容json',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(50) DEFAULT '0' COMMENT '创建人',
  `update_by` varchar(50) DEFAULT '0' COMMENT '更新人',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(1-正常，2-禁用)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='题库设置';

-- ----------------------------
-- Records of question
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES (1, '时光鸡含泪嘤嘤，捂着头上的包说道：“不要打我啦！我可以带你回到过去，给你一个重新选择投资的机会，你愿意吗？”', '[{\"label\":\"骗人的鸡，谁信！——点击后出现：贵人且慢！不试试怎么知道是骗你的呢？来都来了！\",\"value\":\"A\",\"tag\":\"不信\"},{\"label\":\"快带我飞——点击后出现：且飞且珍惜！（小字：嘿嘿，还真有人信啊！）\",\"value\":\"B\",\"tag\":\"相信\"}]', '2022-11-08 13:29:26', '2022-11-08 13:29:26', 'admin', 'admin', 1);
INSERT INTO `question` VALUES (2, '发车前，先说出你做了多少年投资了？', '[{\"label\":\"1年内\",\"value\":\"A\",\"tag\":\"1年内\"},{\"label\":\"1年\",\"value\":\"B\",\"tag\":\"1年\"},{\"label\":\"2年\",\"value\":\"C\",\"tag\":\"2年\"},{\"label\":\"3年\",\"value\":\"D\",\"tag\":\"3年\"},{\"label\":\"4年\",\"value\":\"E\",\"tag\":\"4年\"},{\"label\":\"5年\",\"value\":\"F\",\"tag\":\"5年\"},{\"label\":\"6年\",\"value\":\"G\",\"tag\":\"6年\"},{\"label\":\"7年\",\"value\":\"H\",\"tag\":\"7年\"},{\"label\":\"8年\",\"value\":\"I\",\"tag\":\"8年\"},{\"label\":\"9年\",\"value\":\"J\",\"tag\":\"9年\"},{\"label\":\"10年\",\"value\":\"K\",\"tag\":\"10年\"},{\"label\":\"10年以上\",\"value\":\"L\",\"tag\":\"10年以上\"}]', '2022-11-08 13:30:52', '2022-11-08 13:30:52', 'admin', 'admin', 1);
INSERT INTO `question` VALUES (3, '车已发动，快选择回到哪一年吧！', '[{\"label\":\"2012年\",\"value\":\"A\",\"tag\":\"2012年\"},{\"label\":\"2013年\",\"value\":\"B\",\"tag\":\"2013年\"},{\"label\":\"2014年\",\"value\":\"C\",\"tag\":\"2014年\"},{\"label\":\"2015年\",\"value\":\"D\",\"tag\":\"2015年\"},{\"label\":\"2016年\",\"value\":\"E\",\"tag\":\"2016年\"},{\"label\":\"2017年\",\"value\":\"F\",\"tag\":\"2017年\"},{\"label\":\"2018年\",\"value\":\"G\",\"tag\":\"2018年\"},{\"label\":\"2019年\",\"value\":\"H\",\"tag\":\"2019年\"},{\"label\":\"2020年\",\"value\":\"I\",\"tag\":\"2020年\"},{\"label\":\"2021年\",\"value\":\"J\",\"tag\":\"2021年\"}]', '2022-11-08 13:40:44', '2022-11-08 13:40:44', 'admin', 'admin', 1);
INSERT INTO `question` VALUES (4, '到站了哦，那你想做什么修正咧？', '[{\"label\":\"知识匮乏，听风便是雨，若能重来，我一定趁早好好学正规投资\",\"value\":\"A\",\"tag\":\"投资是个宝，学习要趁早！\"},{\"label\":\"后悔割肉放弃了“大肉基”，万般皆下品，坚持“定投基”\",\"value\":\"B\",\"tag\":\"万般皆下品，坚持“定投基”！\"},{\"label\":\"曾经，有一只牛股在我面前，但我没有好好珍惜，如果让我重新选择一次，我一定就说一个字：拿！到！死！\",\"value\":\"C\",\"tag\":\"打死也要抓住那只牛股！\"},{\"label\":\"短期交易皆浮云，投资还需放眼量，我要管住手，走长期投资之路\",\"value\":\"D\",\"tag\":\"短期交易皆浮云，投资还需放眼量！\"},{\"label\":\"拒绝我二婶儿的“保本高收益”理财骗局，呜呜呜……\",\"value\":\"E\",\"tag\":\"理财骗局，请小心！\"}]', '2022-11-08 13:42:34', '2022-11-08 13:42:34', 'admin', 'admin', 1);
INSERT INTO `question` VALUES (5, '给你个机会，向未来许个愿吧！', '[{\"label\":\"寡人不求多福，但求财富自由\",\"value\":\"A\",\"tag\":\"寡人不求多福，但求财富自由\"},{\"label\":\"哀家目光短浅，但求投资收益超过工资\",\"value\":\"B\",\"tag\":\"哀家目光短浅，但求投资收益超过工资\"},{\"label\":\"朕别无他求，只想得一“家庭幸福”\",\"value\":\"C\",\"tag\":\"朕别无他求，只想得一“家庭幸福”\"},{\"label\":\"孤早已看淡一切，望家人朋友身体健康\",\"value\":\"D\",\"tag\":\"孤早已看淡一切，望家人朋友身体健康\"},{\"label\":\"俺但求有个对象、有个蜗可居\",\"value\":\"E\",\"tag\":\"俺但求有个对象、有个蜗可居\"}]', '2022-11-08 13:43:52', '2022-11-08 13:43:52', 'admin', 'admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `code` varchar(100) DEFAULT '' COMMENT '参数键名',
  `value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `type` tinyint(2) unsigned DEFAULT '2' COMMENT '系统内置（1-是 2-否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 1, 'admin', '2022-09-18 15:06:13', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 1, 'admin', '2022-09-18 15:06:13', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 1, 'admin', '2022-09-18 15:06:13', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 1, 'admin', '2022-09-18 15:06:13', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 1, 'admin', '2022-09-18 15:06:13', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, 'asd', '23', '123', 1, 'admin', '2022-09-19 11:42:16', 'admin', '2022-09-19 11:42:16', NULL);
INSERT INTO `sys_config` VALUES (7, '123', '332', '123', 1, 'admin', '2022-09-19 11:45:12', 'admin', '2022-09-19 11:45:12', '123');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(2) unsigned DEFAULT '2' COMMENT '是否默认（1-是 2-否）',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '状态（1-正常 2-停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 1, 0, 'admin', '2022-09-18 15:06:12', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 2, 0, 'admin', '2022-09-18 15:06:12', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 2, 0, 'admin', '2022-09-18 15:06:12', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 1, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '1', 'sys_normal_disable', '', 'primary', 1, 0, 'admin', '2022-09-18 15:06:13', 'admin', '2022-09-19 13:14:57', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '2', 'sys_normal_disable', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', 'admin', '2022-09-19 13:15:01', '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', '1', 'sys_yes_no', '', 'primary', 1, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', '2', 'sys_yes_no', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 1, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 1, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_operation_type', '', 'info', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_operation_type', '', 'info', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_operation_type', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_operation_type', '', 'primary', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_operation_type', '', 'warning', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_operation_type', '', 'warning', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_operation_type', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_operation_type', '', 'warning', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_operation_type', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 99, '其他', '0', 'sys_operation_type', '', 'info', 2, 0, 'admin', '2022-09-18 15:06:13', '', NULL, '其他操作');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态（1-正常 2-停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dict_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, 'admin', '2022-09-18 15:06:12', 'admin', '2022-09-19 13:58:59', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_operation_type', 0, 'admin', '2022-09-18 15:06:12', 'admin', '2022-09-18 20:19:33', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', 0, 'admin', '2022-09-18 15:06:12', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `info_id` bigint(20) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT '' COMMENT '菜单名称',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '父菜单ID',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序值',
  `type` tinyint(2) unsigned DEFAULT '0' COMMENT '菜单类型（1-模块 2-菜单 3-按钮）',
  `mark` varchar(100) DEFAULT '' COMMENT '权限标识',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '组织架构', 0, 0, 1, 'organization', 'admin', '2022-10-28 15:14:00', 'admin', '2022-10-28 15:16:41', '');
INSERT INTO `sys_menu` VALUES (2, '成员管理', 1, 3, 2, 'userList', 'admin', '2022-10-28 15:14:42', 'admin', '2022-10-28 15:14:42', '');
INSERT INTO `sys_menu` VALUES (3, '角色管理', 1, 0, 2, 'roleList', 'admin', '2022-10-28 15:15:00', 'admin', '2022-10-28 15:15:00', '');
INSERT INTO `sys_menu` VALUES (4, '菜单管理', 1, 1, 2, 'menuList', 'admin', '2022-10-28 15:15:14', 'admin', '2022-10-28 15:15:14', '');
INSERT INTO `sys_menu` VALUES (5, '用户管理', 0, 10, 1, 'member', 'admin', '2022-10-28 15:15:38', 'admin', '2022-10-28 15:15:38', '');
INSERT INTO `sys_menu` VALUES (6, '用户列表', 5, 0, 2, 'memberList', 'admin', '2022-10-28 15:15:56', 'admin', '2022-10-28 15:15:56', '');
INSERT INTO `sys_menu` VALUES (7, '题库管理', 0, 9, 1, 'question', 'admin', '2022-10-28 15:16:00', 'admin', '2022-10-28 15:16:46', '');
INSERT INTO `sys_menu` VALUES (8, '题库列表', 7, 0, 2, 'questionList', 'admin', '2022-10-28 15:16:27', 'admin', '2022-10-28 15:16:27', '');
INSERT INTO `sys_menu` VALUES (11, '操作日志', 0, 0, 1, 'operationLog', 'admin', '2022-11-02 16:15:51', 'admin', '2022-11-02 16:15:51', '');
INSERT INTO `sys_menu` VALUES (12, '日志列表', 11, 0, 2, 'operationLogList', 'admin', '2022-11-02 16:15:00', 'admin', '2022-11-02 16:15:00', '');
INSERT INTO `sys_menu` VALUES (13, '奖品管理', 0, 0, 1, 'prize', 'admin', '2022-11-03 08:38:07', 'admin', '2022-11-03 08:38:07', '');
INSERT INTO `sys_menu` VALUES (14, '奖品列表', 13, 0, 2, 'prizeList', 'admin', '2022-11-03 08:38:22', 'admin', '2022-11-03 08:38:22', '');
INSERT INTO `sys_menu` VALUES (15, '回答记录', 0, 0, 1, 'answerLog', 'admin', '2022-11-08 16:03:00', 'admin', '2022-11-08 16:04:26', '');
INSERT INTO `sys_menu` VALUES (16, '回答记录列表', 15, 0, 2, 'answerLogList', 'admin', '2022-11-08 16:03:00', 'admin', '2022-11-08 16:04:33', '');
INSERT INTO `sys_menu` VALUES (17, '中奖记录', 0, 0, 1, 'winLog', 'admin', '2022-11-09 09:48:06', 'admin', '2022-11-09 09:48:06', '');
INSERT INTO `sys_menu` VALUES (18, '中奖记录列表', 17, 0, 2, 'winLogList', 'admin', '2022-11-09 09:48:00', 'admin', '2022-11-09 09:48:00', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `department_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `operation_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_operation_log` VALUES (1, '菜单管理', 2, 'horse.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-02 14:23\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-02 14:31\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":9,\"name\":\"ttt\",\"sort\":0,\"type\":0,\"mark\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-11-02 14:31:22');
INSERT INTO `sys_operation_log` VALUES (2, '菜单管理', 2, 'horse.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-02 14:23\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-02 14:49\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":9,\"name\":\"ttt\",\"sort\":0,\"type\":0,\"mark\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 14:49:22');
INSERT INTO `sys_operation_log` VALUES (3, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-02 14:51\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-02 14:51\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":10,\"name\":\"2222\",\"sort\":0,\"type\":0,\"mark\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 14:51:01');
INSERT INTO `sys_operation_log` VALUES (4, '菜单管理', 3, 'horse.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/9', '0:0:0:0:0:0:0:1', '内网IP', '{menuId=9}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 16:15:32');
INSERT INTO `sys_operation_log` VALUES (5, '菜单管理', 3, 'horse.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/system/menu/10', '0:0:0:0:0:0:0:1', '内网IP', '{menuId=10}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 16:15:34');
INSERT INTO `sys_operation_log` VALUES (6, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-02 16:15\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-02 16:15\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":11,\"name\":\"操作日志\",\"sort\":0,\"type\":1,\"mark\":\"operationLog\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 16:15:51');
INSERT INTO `sys_operation_log` VALUES (7, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-02 16:15\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-02 16:15\",\"params\":{},\"parentName\":null,\"parentId\":11,\"children\":[],\"id\":12,\"name\":\"日志列表\",\"sort\":0,\"type\":2,\"mark\":\"operationLogList\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-02 16:16:08');
INSERT INTO `sys_operation_log` VALUES (8, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-03 08:38\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-03 08:38\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":13,\"name\":\"奖品管理\",\"sort\":0,\"type\":1,\"mark\":\"prize\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-03 08:38:07');
INSERT INTO `sys_operation_log` VALUES (9, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-03 08:38\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-03 08:38\",\"params\":{},\"parentName\":null,\"parentId\":13,\"children\":[],\"id\":14,\"name\":\"奖品列表\",\"sort\":0,\"type\":2,\"mark\":\"prizeList\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-03 08:38:22');
INSERT INTO `sys_operation_log` VALUES (10, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-08 16:03\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-08 16:03\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":15,\"name\":\"中奖记录\",\"sort\":0,\"type\":1,\"mark\":\"answerLog\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-08 16:03:30');
INSERT INTO `sys_operation_log` VALUES (11, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-08 16:03\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-08 16:03\",\"params\":{},\"parentName\":null,\"parentId\":15,\"children\":[],\"id\":16,\"name\":\"中奖记录列表\",\"sort\":0,\"type\":2,\"mark\":\"answerLogList\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-08 16:03:43');
INSERT INTO `sys_operation_log` VALUES (12, '菜单管理', 2, 'horse.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-08 16:03\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-08 16:04\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":15,\"name\":\"回答记录\",\"sort\":0,\"type\":1,\"mark\":\"answerLog\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-08 16:04:26');
INSERT INTO `sys_operation_log` VALUES (13, '菜单管理', 2, 'horse.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-08 16:03\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-08 16:04\",\"params\":{},\"parentName\":null,\"parentId\":15,\"children\":[],\"id\":16,\"name\":\"回答记录列表\",\"sort\":0,\"type\":2,\"mark\":\"answerLogList\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-08 16:04:33');
INSERT INTO `sys_operation_log` VALUES (14, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-09 09:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-09 09:48\",\"params\":{},\"parentName\":null,\"parentId\":null,\"children\":[],\"id\":17,\"name\":\"中奖记录\",\"sort\":0,\"type\":1,\"mark\":\"winLog\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-09 09:48:06');
INSERT INTO `sys_operation_log` VALUES (15, '菜单管理', 1, 'horse.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-11-09 09:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-11-09 09:48\",\"params\":{},\"parentName\":null,\"parentId\":17,\"children\":[],\"id\":18,\"name\":\"中奖记录列表\",\"sort\":0,\"type\":2,\"mark\":\"winLogList\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 1, '', '2022-11-09 09:48:24');
INSERT INTO `sys_operation_log` VALUES (16, '中奖记录', 5, 'horse.business.controller.PrizeController.winLogExport()', 'GET', 1, 'admin', '', '/business/prize/winLogExport', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://localhost:8080/public/中奖记录导出1667958515170.xlsx\"}}', 1, '', '2022-11-09 09:48:38');
INSERT INTO `sys_operation_log` VALUES (17, '中奖记录', 5, 'horse.business.controller.PrizeController.winLogExport()', 'GET', 1, 'admin', '', '/business/prize/winLogExport', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://localhost:8080/public/中奖记录导出1667958703845.xlsx\"}}', 1, '', '2022-11-09 09:51:46');
INSERT INTO `sys_operation_log` VALUES (18, '中奖记录', 5, 'horse.business.controller.PrizeController.winLogExport()', 'GET', 1, 'admin', '', '/business/prize/winLogExport', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://localhost:8080/public/中奖记录导出1667958782047.xlsx\"}}', 1, '', '2022-11-09 09:53:04');
INSERT INTO `sys_operation_log` VALUES (19, '中奖记录', 5, 'horse.business.controller.PrizeController.winLogExport()', 'GET', 1, 'admin', '', '/business/prize/winLogExport', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://localhost:8080/public/中奖记录导出1667958886515.xlsx\"}}', 1, '', '2022-11-09 09:54:47');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '2022-09-18 15:06:06', '', NULL, '超级管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(30) DEFAULT '' COMMENT '用户账号',
  `nickname` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `email` varchar(100) DEFAULT '' COMMENT '用户邮箱',
  `mobile` char(11) DEFAULT '' COMMENT '手机号码',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` tinyint(2) unsigned DEFAULT '1' COMMENT '状态(1-正常，2-禁用)',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '管理员', '18661139072@163.com', '18661139072', '', '$2a$10$ftww/gSkGrKghrIzZFFI8exy/RGOWItzbDdfVI8WybEuyRLXZSy7K', 1, '0:0:0:0:0:0:0:1', '2022-11-09 09:48:33', 'admin', '2022-09-18 15:06:06', 'admin', '2022-11-09 09:48:33', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_data
-- ----------------------------
DROP TABLE IF EXISTS `trade_data`;
CREATE TABLE `trade_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data` text COMMENT '交易数据json',
  `used` int(10) unsigned DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_used` (`used`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模拟交易数据';

-- ----------------------------
-- Records of trade_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for win_log
-- ----------------------------
DROP TABLE IF EXISTS `win_log`;
CREATE TABLE `win_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '用户id',
  `prize_id` int(10) DEFAULT NULL COMMENT '奖品id',
  `name` varchar(255) DEFAULT '' COMMENT '奖品名称',
  `win_time` datetime DEFAULT NULL COMMENT '中奖时间',
  `status` tinyint(2) unsigned DEFAULT '0' COMMENT '状态(1-未填信息，2-已填信息，3-放弃奖品)',
  `complete_time` datetime DEFAULT NULL COMMENT '填信息时间',
  `receiver` varchar(255) DEFAULT NULL COMMENT '收货人',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='中奖记录';

-- ----------------------------
-- Records of win_log
-- ----------------------------
BEGIN;
INSERT INTO `win_log` VALUES (1, 14, 1, '阿萨德', '2022-11-04 16:47:30', 2, '2022-11-07 11:04:25', '于高衡', '18661139072', '新北区典雅花园');
INSERT INTO `win_log` VALUES (2, 14, 1, '阿萨德', '2022-11-08 09:06:31', 2, '2022-11-08 11:05:46', '于高衡', '18661139072', '新北区典雅花园');
INSERT INTO `win_log` VALUES (3, 14, 1, '阿萨德', '2022-11-09 10:05:00', 3, NULL, NULL, NULL, NULL);
INSERT INTO `win_log` VALUES (4, 14, 1, '阿萨德', '2022-11-09 10:05:24', 3, NULL, NULL, NULL, NULL);
INSERT INTO `win_log` VALUES (5, 14, 1, '阿萨德', '2022-11-09 10:05:36', 1, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
