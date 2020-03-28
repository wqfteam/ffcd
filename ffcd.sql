/*
Navicat MySQL Data Transfer

Source Server         : rm-uf6j4on9cnr6s2yta2o.mysql.rds.aliyuncs.com
Source Server Version : 80016
Source Host           : rm-uf6j4on9cnr6s2yta2o.mysql.rds.aliyuncs.com:3306
Source Database       : ffcd

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-03-25 00:48:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fanfan_extend_fieid
-- ----------------------------
DROP TABLE IF EXISTS `fanfan_extend_fieid`;
CREATE TABLE `fanfan_extend_fieid` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fieId` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `fieId_title` varchar(50) DEFAULT NULL COMMENT '字段标题',
  `fieId_type` varchar(255) DEFAULT NULL COMMENT '关联类型',
  `fieid_val` varchar(255) DEFAULT NULL COMMENT '字段值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段表';

-- ----------------------------
-- Records of fanfan_extend_fieid
-- ----------------------------

-- ----------------------------
-- Table structure for fanfan_source
-- ----------------------------
DROP TABLE IF EXISTS `fanfan_source`;
CREATE TABLE `fanfan_source` (
  `id` int(11) NOT NULL COMMENT '主键',
  `source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源名称',
  `source_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源路径',
  `source_name_upload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源上传文件名',
  `source_size` double(60,2) DEFAULT NULL COMMENT '资源大小',
  `source_file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源类型',
  `source_download_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源下载次数',
  `source_count_like` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源点赞次数',
  `source_count_visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源计数访问',
  `source_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源排序',
  `source_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源来源',
  `source_suffixt` varchar(255) DEFAULT NULL COMMENT '资源后缀',
  `source_type` varchar(255) DEFAULT NULL COMMENT '来源类类型',
  `source_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `source_modify_time` decimal(10,0) DEFAULT NULL COMMENT '修改时间',
  `extend_table_type` varchar(322) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '扩展表类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资源表';

-- ----------------------------
-- Records of fanfan_source
-- ----------------------------

-- ----------------------------
-- Table structure for h_hotel
-- ----------------------------
DROP TABLE IF EXISTS `h_hotel`;
CREATE TABLE `h_hotel` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `userid` bigint(21) NOT NULL COMMENT '店长ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名字',
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `hotelpic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺图片',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺介绍',
  `startime` datetime DEFAULT NULL COMMENT '营业开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '营业结束时间',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '县区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细地址',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经度',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纬度',
  `classification` int(11) NOT NULL COMMENT '店铺分类（1饭店 2 酒店 3快餐店 4 食堂）',
  `Mtype` int(11) NOT NULL COMMENT '经营类型（1烧烤香锅 2 休闲茶饮 3中餐地方 3.1 鲁菜）',
  `level` int(11) NOT NULL COMMENT '级别 1 总店 2 分店 3 连锁店',
  `Mstate` int(11) NOT NULL COMMENT '经营状态（1营业中 2 暂停营业 3即将开业）',
  `sta` int(11) NOT NULL COMMENT '店铺状态 （正常 ，下线，欠费,违规） ',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `createby` bigint(21) NOT NULL,
  `updateby` bigint(21) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of h_hotel
-- ----------------------------

-- ----------------------------
-- Table structure for h_management_type
-- ----------------------------
DROP TABLE IF EXISTS `h_management_type`;
CREATE TABLE `h_management_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `tyname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '经营类型名字',
  `pid` bigint(11) DEFAULT NULL COMMENT '上级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of h_management_type
-- ----------------------------
INSERT INTO `h_management_type` VALUES ('1', '烧烤香锅', '0');
INSERT INTO `h_management_type` VALUES ('2', '休闲茶饮', '0');
INSERT INTO `h_management_type` VALUES ('3', '中餐', '0');
INSERT INTO `h_management_type` VALUES ('4', '鲁菜', '3');
INSERT INTO `h_management_type` VALUES ('5', '粤菜', '3');
INSERT INTO `h_management_type` VALUES ('6', '川菜', '3');

-- ----------------------------
-- Table structure for product_base
-- ----------------------------
DROP TABLE IF EXISTS `product_base`;
CREATE TABLE `product_base` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `product_status` bigint(3) DEFAULT NULL COMMENT '产品状态',
  `product_desc` text COMMENT '产品描述',
  `product_base_code` varchar(255) DEFAULT NULL COMMENT '产品关联code',
  `create_user_id` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品基础信息表';

-- ----------------------------
-- Records of product_base
-- ----------------------------
INSERT INTO `product_base` VALUES ('a885c86bdc791a1d8d21628477126609', 'test', '1', '1', null, '1', '2019-09-23 13:06:31', '1', null, null);

-- ----------------------------
-- Table structure for product_device_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_device_agreement`;
CREATE TABLE `product_device_agreement` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `product_device_base_id` varchar(0) DEFAULT NULL COMMENT '设备Id',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `post` varchar(255) DEFAULT NULL COMMENT '端口',
  `serial_port` varchar(255) DEFAULT NULL COMMENT '串口端口名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='设备通信协议参数';

-- ----------------------------
-- Records of product_device_agreement
-- ----------------------------

-- ----------------------------
-- Table structure for product_device_base
-- ----------------------------
DROP TABLE IF EXISTS `product_device_base`;
CREATE TABLE `product_device_base` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `product_base_code` varchar(64) DEFAULT NULL COMMENT '产品关联code',
  `device_online_time` datetime DEFAULT NULL COMMENT '设备上线时间',
  `device_status` varchar(255) DEFAULT NULL COMMENT '设备状态',
  `create_user_id` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品设备信息表';

-- ----------------------------
-- Records of product_device_base
-- ----------------------------

-- ----------------------------
-- Table structure for product_device_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `product_device_extend_info`;
CREATE TABLE `product_device_extend_info` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `product_device_base_id` varchar(64) DEFAULT NULL COMMENT '设备id',
  `device_coordinate` varchar(255) DEFAULT NULL COMMENT '设备坐标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='设备信息扩展表';

-- ----------------------------
-- Records of product_device_extend_info
-- ----------------------------

-- ----------------------------
-- Table structure for product_extend_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_extend_agreement`;
CREATE TABLE `product_extend_agreement` (
  `id` varchar(64) NOT NULL COMMENT '产品扩充表主键',
  `agreement_type_id` varchar(64) DEFAULT NULL COMMENT '产品协议类型',
  `product_base_code` varchar(64) DEFAULT NULL COMMENT '产品关联code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品协议信息扩充表';

-- ----------------------------
-- Records of product_extend_agreement
-- ----------------------------
INSERT INTO `product_extend_agreement` VALUES ('118dbadb0fa543359c86e634271f111f', '1', '2a91d58d639545a7b4c6d0f32f143aee');
INSERT INTO `product_extend_agreement` VALUES ('74a2c811fa2547d5b79b7fa24cea73f7', '0', 'a885c86bdc791a1d8d21628477126609');

-- ----------------------------
-- Table structure for product_fct_base
-- ----------------------------
DROP TABLE IF EXISTS `product_fct_base`;
CREATE TABLE `product_fct_base` (
  `id` varchar(64) NOT NULL COMMENT '产品功能表id',
  `product_base_code` varchar(64) DEFAULT NULL COMMENT '产品关联code',
  `fct_name` varchar(255) DEFAULT NULL COMMENT '功能名称',
  `fct_tag` varchar(255) DEFAULT NULL COMMENT '功能标识符',
  `fct_unit` varchar(255) DEFAULT NULL COMMENT '功能显示单位',
  `fct_desc` varchar(255) DEFAULT NULL COMMENT '功能描述',
  `create_user_id` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品功能表';

-- ----------------------------
-- Records of product_fct_base
-- ----------------------------
INSERT INTO `product_fct_base` VALUES ('3cd4ca6fe8be3da9d9b0c0840bb98f8f', 'a885c86bdc791a1d8d21628477126609', '功能1', 'fct_1', '1', '11', '1', '2019-09-25 09:50:36', null, null, null);

-- ----------------------------
-- Table structure for product_fct_extend_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_fct_extend_agreement`;
CREATE TABLE `product_fct_extend_agreement` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `product_fct_base_id` varchar(64) DEFAULT NULL COMMENT '产品功能Id',
  `operate_type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `register_address` varchar(255) DEFAULT NULL COMMENT '寄存器地址',
  `original_data_type` varchar(255) DEFAULT NULL COMMENT '原始数据类型',
  `range_start` int(255) DEFAULT NULL COMMENT '数据范围开始',
  `range_end` varchar(255) DEFAULT NULL COMMENT '数据范围结束',
  `data_get_type` varchar(255) DEFAULT NULL COMMENT '数据获取类型',
  `swap_high_byte` varchar(255) DEFAULT NULL COMMENT '交换寄存器内高低字节',
  `swap_register_sort` varchar(255) DEFAULT NULL COMMENT '交换寄存器顺序',
  `zoom` varchar(255) DEFAULT NULL COMMENT '缩放因子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品功能扩充协议表';

-- ----------------------------
-- Records of product_fct_extend_agreement
-- ----------------------------
INSERT INTO `product_fct_extend_agreement` VALUES ('0', '3cd4ca6fe8be3da9d9b0c0840bb98f8f', '1', '2132', '7', '0', '1', '12321', 'false', 'false', '1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', '1T89DA6NRJX4WHT1585059892211', '1585068524618', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务日志id',
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('05271247-ecbd-4342-872d-e39e300f64d5', '75ecy', '2019-09-20 13:22:28');
INSERT INTO `sys_captcha` VALUES ('0c111684-4320-4647-8f91-d4b8b4f480ff', '5388n', '2019-09-20 10:26:37');
INSERT INTO `sys_captcha` VALUES ('0e7532fc-7a06-4cb4-80aa-4d36b9e8c4bd', '8ww6b', '2019-09-20 13:21:17');
INSERT INTO `sys_captcha` VALUES ('189a3766-e712-4e89-85d5-09cd54987a08', 'g44ad', '2019-09-20 10:53:40');
INSERT INTO `sys_captcha` VALUES ('3dddec02-e98c-4411-8768-18a547f49ead', '2b6n4', '2020-03-25 00:41:53');
INSERT INTO `sys_captcha` VALUES ('42d1cb96-b677-436a-862e-56afc89018b2', 'wcdnc', '2019-09-20 13:24:13');
INSERT INTO `sys_captcha` VALUES ('43d83397-a874-4d6d-82ea-a2e9e82e304b', 'gnny4', '2019-09-20 10:35:33');
INSERT INTO `sys_captcha` VALUES ('4523edaa-81d3-4d1b-85bf-4c93f68ce58b', 'pggnb', '2019-09-20 11:40:51');
INSERT INTO `sys_captcha` VALUES ('581963cd-d1a0-4271-8f43-0c6814f0aa45', 'n6y5n', '2019-09-20 09:48:21');
INSERT INTO `sys_captcha` VALUES ('5845273c-8849-4e85-8873-083e7b0dd399', 'amg64', '2019-09-17 22:50:29');
INSERT INTO `sys_captcha` VALUES ('6bacaf29-2700-4e18-851a-41ba4509a3ce', 'dwaww', '2020-03-24 00:18:30');
INSERT INTO `sys_captcha` VALUES ('79789d93-f81b-40a4-84ba-ae20cc67db52', '3pcyg', '2019-09-24 15:36:18');
INSERT INTO `sys_captcha` VALUES ('8a972223-139b-49d2-89f1-99e271f36663', 'n4n84', '2019-09-24 09:53:19');
INSERT INTO `sys_captcha` VALUES ('8ab7c7bd-7ab9-4be3-84b6-cc210eab1f00', '5n4pc', '2019-09-20 09:48:21');
INSERT INTO `sys_captcha` VALUES ('8d9dc627-30cf-4b08-8a14-0fe071b28d7e', 'xnga6', '2019-09-20 13:23:13');
INSERT INTO `sys_captcha` VALUES ('9463fc6e-ae4a-4b2c-80a5-3d7de44fd76e', '2ef38', '2019-09-20 13:24:55');
INSERT INTO `sys_captcha` VALUES ('957fd8b9-d052-410c-818d-262927ad28c2', '4epga', '2020-03-22 07:55:21');
INSERT INTO `sys_captcha` VALUES ('abb882e3-88f0-4c34-8d49-ce6a135380cf', 'dcwgx', '2019-09-20 13:20:24');
INSERT INTO `sys_captcha` VALUES ('abde9922-6327-4527-8d97-5a41343fa1cf', 'm4p48', '2019-09-24 09:49:12');
INSERT INTO `sys_captcha` VALUES ('b2b55b6b-cd7e-46b6-840e-41675383b34f', 'mdpyc', '2020-03-24 22:33:16');
INSERT INTO `sys_captcha` VALUES ('b6f5a863-175c-43bf-82f9-7217a8ed02f1', 'nn7fg', '2019-09-20 13:18:48');
INSERT INTO `sys_captcha` VALUES ('bd03dfc9-2eda-402d-814e-8315c5bbae36', 'n3pnn', '2019-09-20 13:40:06');
INSERT INTO `sys_captcha` VALUES ('c4f00143-f286-4f6a-8d3b-1d2b81126efb', 'cndnw', '2019-09-20 16:23:16');
INSERT INTO `sys_captcha` VALUES ('cf69ed94-c8f2-4b95-8f95-93d3144cc45b', 'xfc2m', '2019-09-20 13:12:48');
INSERT INTO `sys_captcha` VALUES ('d71b6e2b-7919-4385-871b-e44fac77c9e3', 'x373n', '2019-09-23 18:08:21');
INSERT INTO `sys_captcha` VALUES ('dfb67f98-5cc4-43a4-8278-cb6e46bd81d0', 'bnfgm', '2019-09-20 13:18:34');
INSERT INTO `sys_captcha` VALUES ('e149a282-6130-40ea-8722-3791aaf4eee2', '7pdn3', '2019-09-20 09:15:40');
INSERT INTO `sys_captcha` VALUES ('e22c4b5b-8221-4943-8fb4-064626d0cd65', 'npnea', '2020-03-24 22:49:27');
INSERT INTO `sys_captcha` VALUES ('e576c42c-ec4c-4f3f-8277-08fbaa2105e3', 'fyd6f', '2020-03-23 23:22:30');
INSERT INTO `sys_captcha` VALUES ('e5d3399d-94f4-448f-8d13-6b4b6363ca0b', '76aa6', '2019-09-25 09:23:55');
INSERT INTO `sys_captcha` VALUES ('f0716779-0484-45d9-81f5-15336542cebe', 'nfnxd', '2019-09-20 13:19:53');
INSERT INTO `sys_captcha` VALUES ('f095b281-8efd-4332-822c-bf23e6e717eb', '64582', '2019-09-20 10:34:05');
INSERT INTO `sys_captcha` VALUES ('f7870989-3064-440c-821a-f3422dfcbae5', 'ed5b7', '2020-03-23 22:27:54');
INSERT INTO `sys_captcha` VALUES ('f9f9c180-ceda-4443-8a09-766b506ee17d', '2eafn', '2019-09-20 09:35:10');
INSERT INTO `sys_captcha` VALUES ('fdbc1d1f-888f-45b2-8591-fe5da34742f7', '3m3ep', '2020-03-25 00:24:51');

-- ----------------------------
-- Table structure for sys_china
-- ----------------------------
DROP TABLE IF EXISTS `sys_china`;
CREATE TABLE `sys_china` (
  `Id` int(11) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CHINA_REFERENCE_CHINA` (`Pid`) USING BTREE,
  CONSTRAINT `FK_CHINA_REFERENCE_CHINA` FOREIGN KEY (`Pid`) REFERENCES `sys_china` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_china
-- ----------------------------
INSERT INTO `sys_china` VALUES ('0', '中国', '0');
INSERT INTO `sys_china` VALUES ('110000', '北京市', '0');
INSERT INTO `sys_china` VALUES ('110100', '东城区', '110000');
INSERT INTO `sys_china` VALUES ('110200', '西城区', '110000');
INSERT INTO `sys_china` VALUES ('110500', '朝阳区', '110000');
INSERT INTO `sys_china` VALUES ('110600', '丰台区', '110000');
INSERT INTO `sys_china` VALUES ('110700', '石景山区', '110000');
INSERT INTO `sys_china` VALUES ('110800', '海淀区', '110000');
INSERT INTO `sys_china` VALUES ('110900', '门头沟区', '110000');
INSERT INTO `sys_china` VALUES ('111100', '房山区', '110000');
INSERT INTO `sys_china` VALUES ('111200', '通州区', '110000');
INSERT INTO `sys_china` VALUES ('111300', '顺义区', '110000');
INSERT INTO `sys_china` VALUES ('111400', '昌平区', '110000');
INSERT INTO `sys_china` VALUES ('111500', '大兴区', '110000');
INSERT INTO `sys_china` VALUES ('111600', '怀柔区', '110000');
INSERT INTO `sys_china` VALUES ('111700', '平谷区', '110000');
INSERT INTO `sys_china` VALUES ('112800', '密云县', '110000');
INSERT INTO `sys_china` VALUES ('112900', '延庆县', '110000');
INSERT INTO `sys_china` VALUES ('120000', '天津市', '0');
INSERT INTO `sys_china` VALUES ('120100', '和平区', '120000');
INSERT INTO `sys_china` VALUES ('120200', '河东区', '120000');
INSERT INTO `sys_china` VALUES ('120300', '河西区', '120000');
INSERT INTO `sys_china` VALUES ('120400', '南开区', '120000');
INSERT INTO `sys_china` VALUES ('120500', '河北区', '120000');
INSERT INTO `sys_china` VALUES ('120600', '红桥区', '120000');
INSERT INTO `sys_china` VALUES ('120900', '滨海新区', '120000');
INSERT INTO `sys_china` VALUES ('121000', '东丽区', '120000');
INSERT INTO `sys_china` VALUES ('121100', '西青区', '120000');
INSERT INTO `sys_china` VALUES ('121200', '津南区', '120000');
INSERT INTO `sys_china` VALUES ('121300', '北辰区', '120000');
INSERT INTO `sys_china` VALUES ('121400', '武清区', '120000');
INSERT INTO `sys_china` VALUES ('121500', '宝坻区', '120000');
INSERT INTO `sys_china` VALUES ('122100', '宁河县', '120000');
INSERT INTO `sys_china` VALUES ('122300', '静海县', '120000');
INSERT INTO `sys_china` VALUES ('122500', '蓟县', '120000');
INSERT INTO `sys_china` VALUES ('130000', '河北省', '0');
INSERT INTO `sys_china` VALUES ('130100', '石家庄市', '130000');
INSERT INTO `sys_china` VALUES ('130101', '市辖区', '130100');
INSERT INTO `sys_china` VALUES ('130102', '长安区', '130101');
INSERT INTO `sys_china` VALUES ('130103', '桥东区', '130101');
INSERT INTO `sys_china` VALUES ('130104', '桥西区', '130101');
INSERT INTO `sys_china` VALUES ('130105', '新华区', '130101');
INSERT INTO `sys_china` VALUES ('130107', '井陉矿区', '130101');
INSERT INTO `sys_china` VALUES ('130108', '裕华区', '130101');
INSERT INTO `sys_china` VALUES ('130121', '井陉县', '130100');
INSERT INTO `sys_china` VALUES ('130123', '正定县', '130100');
INSERT INTO `sys_china` VALUES ('130124', '栾城县', '130100');
INSERT INTO `sys_china` VALUES ('130125', '行唐县', '130100');
INSERT INTO `sys_china` VALUES ('130126', '灵寿县', '130100');
INSERT INTO `sys_china` VALUES ('130127', '高邑县', '130100');
INSERT INTO `sys_china` VALUES ('130128', '深泽县', '130100');
INSERT INTO `sys_china` VALUES ('130129', '赞皇县', '130100');
INSERT INTO `sys_china` VALUES ('130130', '无极县', '130100');
INSERT INTO `sys_china` VALUES ('130131', '平山县', '130100');
INSERT INTO `sys_china` VALUES ('130132', '元氏县', '130100');
INSERT INTO `sys_china` VALUES ('130133', '赵县', '130100');
INSERT INTO `sys_china` VALUES ('130181', '辛集市', '130100');
INSERT INTO `sys_china` VALUES ('130182', '藁城市', '130100');
INSERT INTO `sys_china` VALUES ('130183', '晋州市', '130100');
INSERT INTO `sys_china` VALUES ('130184', '新乐市', '130100');
INSERT INTO `sys_china` VALUES ('130185', '鹿泉市', '130100');
INSERT INTO `sys_china` VALUES ('130200', '唐山市', '130000');
INSERT INTO `sys_china` VALUES ('130201', '市辖区', '130200');
INSERT INTO `sys_china` VALUES ('130202', '路南区', '130201');
INSERT INTO `sys_china` VALUES ('130203', '路北区', '130201');
INSERT INTO `sys_china` VALUES ('130204', '古冶区', '130201');
INSERT INTO `sys_china` VALUES ('130205', '开平区', '130201');
INSERT INTO `sys_china` VALUES ('130207', '丰南区', '130201');
INSERT INTO `sys_china` VALUES ('130208', '丰润区', '130201');
INSERT INTO `sys_china` VALUES ('130223', '滦县', '130200');
INSERT INTO `sys_china` VALUES ('130224', '滦南县', '130200');
INSERT INTO `sys_china` VALUES ('130225', '乐亭县', '130200');
INSERT INTO `sys_china` VALUES ('130227', '迁西县', '130200');
INSERT INTO `sys_china` VALUES ('130229', '玉田县', '130200');
INSERT INTO `sys_china` VALUES ('130230', '唐海县', '130200');
INSERT INTO `sys_china` VALUES ('130281', '遵化市', '130200');
INSERT INTO `sys_china` VALUES ('130283', '迁安市', '130200');
INSERT INTO `sys_china` VALUES ('130300', '秦皇岛市', '130000');
INSERT INTO `sys_china` VALUES ('130301', '海港区', '130300');
INSERT INTO `sys_china` VALUES ('130303', '山海关区', '130300');
INSERT INTO `sys_china` VALUES ('130304', '北戴河区', '130300');
INSERT INTO `sys_china` VALUES ('130321', '青龙满族自治县', '130300');
INSERT INTO `sys_china` VALUES ('130322', '昌黎县', '130300');
INSERT INTO `sys_china` VALUES ('130323', '抚宁县', '130300');
INSERT INTO `sys_china` VALUES ('130324', '卢龙县', '130300');
INSERT INTO `sys_china` VALUES ('130400', '邯郸市', '130000');
INSERT INTO `sys_china` VALUES ('130401', '市辖区', '130400');
INSERT INTO `sys_china` VALUES ('130402', '邯山区', '130401');
INSERT INTO `sys_china` VALUES ('130403', '丛台区', '130401');
INSERT INTO `sys_china` VALUES ('130404', '复兴区', '130401');
INSERT INTO `sys_china` VALUES ('130406', '峰峰矿区', '130401');
INSERT INTO `sys_china` VALUES ('130421', '邯郸县', '130400');
INSERT INTO `sys_china` VALUES ('130423', '临漳县', '130400');
INSERT INTO `sys_china` VALUES ('130424', '成安县', '130400');
INSERT INTO `sys_china` VALUES ('130425', '大名县', '130400');
INSERT INTO `sys_china` VALUES ('130426', '涉县', '130400');
INSERT INTO `sys_china` VALUES ('130427', '磁县', '130400');
INSERT INTO `sys_china` VALUES ('130428', '肥乡县', '130400');
INSERT INTO `sys_china` VALUES ('130429', '永年县', '130400');
INSERT INTO `sys_china` VALUES ('130430', '邱县', '130400');
INSERT INTO `sys_china` VALUES ('130431', '鸡泽县', '130400');
INSERT INTO `sys_china` VALUES ('130432', '广平县', '130400');
INSERT INTO `sys_china` VALUES ('130433', '馆陶县', '130400');
INSERT INTO `sys_china` VALUES ('130434', '魏县', '130400');
INSERT INTO `sys_china` VALUES ('130435', '曲周县', '130400');
INSERT INTO `sys_china` VALUES ('130481', '武安市', '130400');
INSERT INTO `sys_china` VALUES ('130500', '邢台市', '130000');
INSERT INTO `sys_china` VALUES ('130501', '市辖区', '130500');
INSERT INTO `sys_china` VALUES ('130502', '桥东区', '130501');
INSERT INTO `sys_china` VALUES ('130503', '桥西区', '130501');
INSERT INTO `sys_china` VALUES ('130521', '邢台县', '130500');
INSERT INTO `sys_china` VALUES ('130522', '临城县', '130500');
INSERT INTO `sys_china` VALUES ('130523', '内丘县', '130500');
INSERT INTO `sys_china` VALUES ('130524', '柏乡县', '130500');
INSERT INTO `sys_china` VALUES ('130525', '隆尧县', '130500');
INSERT INTO `sys_china` VALUES ('130526', '任县', '130500');
INSERT INTO `sys_china` VALUES ('130527', '南和县', '130500');
INSERT INTO `sys_china` VALUES ('130528', '宁晋县', '130500');
INSERT INTO `sys_china` VALUES ('130529', '巨鹿县', '130529');
INSERT INTO `sys_china` VALUES ('130530', '新河县', '130500');
INSERT INTO `sys_china` VALUES ('130531', '广宗县', '130500');
INSERT INTO `sys_china` VALUES ('130532', '平乡县', '130500');
INSERT INTO `sys_china` VALUES ('130533', '威县', '130500');
INSERT INTO `sys_china` VALUES ('130534', '清河县', '130500');
INSERT INTO `sys_china` VALUES ('130535', '临西县', '130500');
INSERT INTO `sys_china` VALUES ('130581', '南宫市', '130500');
INSERT INTO `sys_china` VALUES ('130582', '沙河市', '130500');
INSERT INTO `sys_china` VALUES ('130600', '保定市', '130000');
INSERT INTO `sys_china` VALUES ('130601', '新市区', '130600');
INSERT INTO `sys_china` VALUES ('130603', '北市区', '130600');
INSERT INTO `sys_china` VALUES ('130604', '南市区', '130600');
INSERT INTO `sys_china` VALUES ('130621', '满城县', '130600');
INSERT INTO `sys_china` VALUES ('130622', '清苑县', '130600');
INSERT INTO `sys_china` VALUES ('130623', '涞水县', '130600');
INSERT INTO `sys_china` VALUES ('130624', '阜平县', '130600');
INSERT INTO `sys_china` VALUES ('130625', '徐水县', '130600');
INSERT INTO `sys_china` VALUES ('130626', '定兴县', '130600');
INSERT INTO `sys_china` VALUES ('130627', '唐县', '130600');
INSERT INTO `sys_china` VALUES ('130628', '高阳县', '130600');
INSERT INTO `sys_china` VALUES ('130629', '容城县', '130600');
INSERT INTO `sys_china` VALUES ('130630', '涞源县', '130600');
INSERT INTO `sys_china` VALUES ('130631', '望都县', '130600');
INSERT INTO `sys_china` VALUES ('130632', '安新县', '130600');
INSERT INTO `sys_china` VALUES ('130633', '易县', '130600');
INSERT INTO `sys_china` VALUES ('130634', '曲阳县', '130600');
INSERT INTO `sys_china` VALUES ('130635', '蠡县', '130600');
INSERT INTO `sys_china` VALUES ('130636', '顺平县', '130600');
INSERT INTO `sys_china` VALUES ('130637', '博野县', '130600');
INSERT INTO `sys_china` VALUES ('130638', '雄县', '130600');
INSERT INTO `sys_china` VALUES ('130681', '涿州市', '130600');
INSERT INTO `sys_china` VALUES ('130682', '定州市', '130600');
INSERT INTO `sys_china` VALUES ('130683', '安国市', '130600');
INSERT INTO `sys_china` VALUES ('130684', '高碑店市', '130600');
INSERT INTO `sys_china` VALUES ('130685', '白沟新城县', '130600');
INSERT INTO `sys_china` VALUES ('130700', '张家口市', '130000');
INSERT INTO `sys_china` VALUES ('130701', '市辖区', '130700');
INSERT INTO `sys_china` VALUES ('130702', '桥东区', '130701');
INSERT INTO `sys_china` VALUES ('130703', '桥西区', '130701');
INSERT INTO `sys_china` VALUES ('130705', '宣化区', '130701');
INSERT INTO `sys_china` VALUES ('130706', '下花园区', '130701');
INSERT INTO `sys_china` VALUES ('130721', '宣化县', '130700');
INSERT INTO `sys_china` VALUES ('130722', '张北县', '130700');
INSERT INTO `sys_china` VALUES ('130723', '康保县', '130700');
INSERT INTO `sys_china` VALUES ('130724', '沽源县', '130700');
INSERT INTO `sys_china` VALUES ('130725', '尚义县', '130700');
INSERT INTO `sys_china` VALUES ('130726', '蔚县', '130700');
INSERT INTO `sys_china` VALUES ('130727', '阳原县', '130700');
INSERT INTO `sys_china` VALUES ('130728', '怀安县', '130700');
INSERT INTO `sys_china` VALUES ('130729', '万全县', '130700');
INSERT INTO `sys_china` VALUES ('130730', '怀来县', '130700');
INSERT INTO `sys_china` VALUES ('130731', '涿鹿县', '130700');
INSERT INTO `sys_china` VALUES ('130732', '赤城县', '130700');
INSERT INTO `sys_china` VALUES ('130733', '崇礼县', '130700');
INSERT INTO `sys_china` VALUES ('130800', '承德市', '130000');
INSERT INTO `sys_china` VALUES ('130801', '市辖区', '130800');
INSERT INTO `sys_china` VALUES ('130802', '双桥区', '130801');
INSERT INTO `sys_china` VALUES ('130803', '双滦区', '130801');
INSERT INTO `sys_china` VALUES ('130804', '鹰手营子矿区', '130801');
INSERT INTO `sys_china` VALUES ('130821', '承德县', '130800');
INSERT INTO `sys_china` VALUES ('130822', '兴隆县', '130800');
INSERT INTO `sys_china` VALUES ('130823', '平泉县', '130800');
INSERT INTO `sys_china` VALUES ('130824', '滦平县', '130800');
INSERT INTO `sys_china` VALUES ('130825', '隆化县', '130800');
INSERT INTO `sys_china` VALUES ('130826', '丰宁满族自治县', '130800');
INSERT INTO `sys_china` VALUES ('130827', '宽城满族自治县', '130800');
INSERT INTO `sys_china` VALUES ('130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `sys_china` VALUES ('130900', '沧州市', '130000');
INSERT INTO `sys_china` VALUES ('130901', '市辖区', '130900');
INSERT INTO `sys_china` VALUES ('130902', '新华区', '130901');
INSERT INTO `sys_china` VALUES ('130903', '运河区', '130901');
INSERT INTO `sys_china` VALUES ('130921', '沧县', '130900');
INSERT INTO `sys_china` VALUES ('130922', '青县', '130900');
INSERT INTO `sys_china` VALUES ('130923', '东光县', '130900');
INSERT INTO `sys_china` VALUES ('130924', '海兴县', '130900');
INSERT INTO `sys_china` VALUES ('130925', '盐山县', '130900');
INSERT INTO `sys_china` VALUES ('130926', '肃宁县', '130900');
INSERT INTO `sys_china` VALUES ('130927', '南皮县', '130900');
INSERT INTO `sys_china` VALUES ('130928', '吴桥县', '130900');
INSERT INTO `sys_china` VALUES ('130929', '献县', '130900');
INSERT INTO `sys_china` VALUES ('130930', '孟村回族自治县', '130900');
INSERT INTO `sys_china` VALUES ('130981', '泊头市', '130900');
INSERT INTO `sys_china` VALUES ('130982', '任丘市', '130900');
INSERT INTO `sys_china` VALUES ('130983', '黄骅市', '130900');
INSERT INTO `sys_china` VALUES ('130984', '河间市', '130900');
INSERT INTO `sys_china` VALUES ('131000', '廊坊市', '130000');
INSERT INTO `sys_china` VALUES ('131001', '市辖区', '131000');
INSERT INTO `sys_china` VALUES ('131002', '安次区', '131001');
INSERT INTO `sys_china` VALUES ('131003', '广阳区', '131001');
INSERT INTO `sys_china` VALUES ('131022', '固安县', '131000');
INSERT INTO `sys_china` VALUES ('131023', '永清县', '131000');
INSERT INTO `sys_china` VALUES ('131024', '香河县', '131000');
INSERT INTO `sys_china` VALUES ('131025', '大城县', '131000');
INSERT INTO `sys_china` VALUES ('131026', '文安县', '131000');
INSERT INTO `sys_china` VALUES ('131028', '大厂回族自治县', '131000');
INSERT INTO `sys_china` VALUES ('131081', '霸州市', '131000');
INSERT INTO `sys_china` VALUES ('131082', '三河市', '131000');
INSERT INTO `sys_china` VALUES ('131100', '衡水市', '130000');
INSERT INTO `sys_china` VALUES ('131101', '市辖区', '131100');
INSERT INTO `sys_china` VALUES ('131102', '桃城区', '131101');
INSERT INTO `sys_china` VALUES ('131121', '枣强县', '131100');
INSERT INTO `sys_china` VALUES ('131122', '武邑县', '131100');
INSERT INTO `sys_china` VALUES ('131123', '武强县', '131100');
INSERT INTO `sys_china` VALUES ('131124', '饶阳县', '131100');
INSERT INTO `sys_china` VALUES ('131125', '安平县', '131100');
INSERT INTO `sys_china` VALUES ('131126', '故城县', '131100');
INSERT INTO `sys_china` VALUES ('131127', '景县', '131100');
INSERT INTO `sys_china` VALUES ('131128', '阜城县', '131100');
INSERT INTO `sys_china` VALUES ('131181', '冀州市', '131100');
INSERT INTO `sys_china` VALUES ('131182', '深州市', '131100');
INSERT INTO `sys_china` VALUES ('140000', '山西省', '0');
INSERT INTO `sys_china` VALUES ('140100', '太原市', '140000');
INSERT INTO `sys_china` VALUES ('140101', '市辖区', '140100');
INSERT INTO `sys_china` VALUES ('140105', '小店区', '140101');
INSERT INTO `sys_china` VALUES ('140106', '迎泽区', '140101');
INSERT INTO `sys_china` VALUES ('140107', '杏花岭区', '140101');
INSERT INTO `sys_china` VALUES ('140108', '尖草坪区', '140101');
INSERT INTO `sys_china` VALUES ('140109', '万柏林区', '140101');
INSERT INTO `sys_china` VALUES ('140110', '晋源区', '140101');
INSERT INTO `sys_china` VALUES ('140121', '清徐县', '140100');
INSERT INTO `sys_china` VALUES ('140122', '阳曲县', '140100');
INSERT INTO `sys_china` VALUES ('140123', '娄烦县', '140100');
INSERT INTO `sys_china` VALUES ('140181', '古交市', '140100');
INSERT INTO `sys_china` VALUES ('140200', '大同市', '140000');
INSERT INTO `sys_china` VALUES ('140201', '市辖区', '140200');
INSERT INTO `sys_china` VALUES ('140202', '城区', '140201');
INSERT INTO `sys_china` VALUES ('140203', '矿区', '140201');
INSERT INTO `sys_china` VALUES ('140211', '南郊区', '140201');
INSERT INTO `sys_china` VALUES ('140212', '新荣区', '140201');
INSERT INTO `sys_china` VALUES ('140221', '阳高县', '140200');
INSERT INTO `sys_china` VALUES ('140222', '天镇县', '140200');
INSERT INTO `sys_china` VALUES ('140223', '广灵县', '140200');
INSERT INTO `sys_china` VALUES ('140224', '灵丘县', '140200');
INSERT INTO `sys_china` VALUES ('140225', '浑源县', '140200');
INSERT INTO `sys_china` VALUES ('140226', '左云县', '140200');
INSERT INTO `sys_china` VALUES ('140227', '大同县', '140200');
INSERT INTO `sys_china` VALUES ('140300', '阳泉市', '140000');
INSERT INTO `sys_china` VALUES ('140301', '市辖区', '140300');
INSERT INTO `sys_china` VALUES ('140302', '城区', '140301');
INSERT INTO `sys_china` VALUES ('140303', '矿区', '140301');
INSERT INTO `sys_china` VALUES ('140311', '郊区', '140301');
INSERT INTO `sys_china` VALUES ('140321', '平定县', '140300');
INSERT INTO `sys_china` VALUES ('140322', '盂县', '140300');
INSERT INTO `sys_china` VALUES ('140400', '长治市', '140000');
INSERT INTO `sys_china` VALUES ('140401', '市辖区', '140400');
INSERT INTO `sys_china` VALUES ('140402', '城区', '140401');
INSERT INTO `sys_china` VALUES ('140411', '郊区', '140401');
INSERT INTO `sys_china` VALUES ('140421', '长治县', '140400');
INSERT INTO `sys_china` VALUES ('140423', '襄垣县', '140400');
INSERT INTO `sys_china` VALUES ('140424', '屯留县', '140400');
INSERT INTO `sys_china` VALUES ('140425', '平顺县', '140400');
INSERT INTO `sys_china` VALUES ('140426', '黎城县', '140400');
INSERT INTO `sys_china` VALUES ('140427', '壶关县', '140400');
INSERT INTO `sys_china` VALUES ('140428', '长子县', '140400');
INSERT INTO `sys_china` VALUES ('140429', '武乡县', '140400');
INSERT INTO `sys_china` VALUES ('140430', '沁县', '140400');
INSERT INTO `sys_china` VALUES ('140431', '沁源县', '140400');
INSERT INTO `sys_china` VALUES ('140481', '潞城市', '140400');
INSERT INTO `sys_china` VALUES ('140500', '晋城市', '140000');
INSERT INTO `sys_china` VALUES ('140501', '市辖区', '140500');
INSERT INTO `sys_china` VALUES ('140502', '城区', '140501');
INSERT INTO `sys_china` VALUES ('140521', '沁水县', '140500');
INSERT INTO `sys_china` VALUES ('140522', '阳城县', '140500');
INSERT INTO `sys_china` VALUES ('140524', '陵川县', '140500');
INSERT INTO `sys_china` VALUES ('140525', '泽州县', '140500');
INSERT INTO `sys_china` VALUES ('140581', '高平市', '140500');
INSERT INTO `sys_china` VALUES ('140600', '朔州市', '140000');
INSERT INTO `sys_china` VALUES ('140601', '市辖区', '140600');
INSERT INTO `sys_china` VALUES ('140602', '朔城区', '140601');
INSERT INTO `sys_china` VALUES ('140603', '平鲁区', '140601');
INSERT INTO `sys_china` VALUES ('140621', '山阴县', '140600');
INSERT INTO `sys_china` VALUES ('140622', '应县', '140600');
INSERT INTO `sys_china` VALUES ('140623', '右玉县', '140600');
INSERT INTO `sys_china` VALUES ('140624', '怀仁县', '140600');
INSERT INTO `sys_china` VALUES ('140700', '晋中市', '140000');
INSERT INTO `sys_china` VALUES ('140701', '市辖区', '140700');
INSERT INTO `sys_china` VALUES ('140702', '榆次区', '140701');
INSERT INTO `sys_china` VALUES ('140721', '榆社县', '140700');
INSERT INTO `sys_china` VALUES ('140722', '左权县', '140700');
INSERT INTO `sys_china` VALUES ('140723', '和顺县', '140700');
INSERT INTO `sys_china` VALUES ('140724', '昔阳县', '140700');
INSERT INTO `sys_china` VALUES ('140725', '寿阳县', '140700');
INSERT INTO `sys_china` VALUES ('140726', '太谷县', '140700');
INSERT INTO `sys_china` VALUES ('140727', '祁县', '140700');
INSERT INTO `sys_china` VALUES ('140728', '平遥县', '140700');
INSERT INTO `sys_china` VALUES ('140729', '灵石县', '140700');
INSERT INTO `sys_china` VALUES ('140781', '介休市', '140700');
INSERT INTO `sys_china` VALUES ('140800', '运城市', '140000');
INSERT INTO `sys_china` VALUES ('140801', '市辖区', '140800');
INSERT INTO `sys_china` VALUES ('140802', '盐湖区', '140801');
INSERT INTO `sys_china` VALUES ('140821', '临猗县', '140800');
INSERT INTO `sys_china` VALUES ('140822', '万荣县', '140800');
INSERT INTO `sys_china` VALUES ('140823', '闻喜县', '140800');
INSERT INTO `sys_china` VALUES ('140824', '稷山县', '140800');
INSERT INTO `sys_china` VALUES ('140825', '新绛县', '140800');
INSERT INTO `sys_china` VALUES ('140826', '绛县', '140800');
INSERT INTO `sys_china` VALUES ('140827', '垣曲县', '140800');
INSERT INTO `sys_china` VALUES ('140828', '夏县', '140800');
INSERT INTO `sys_china` VALUES ('140829', '平陆县', '140800');
INSERT INTO `sys_china` VALUES ('140830', '芮城县', '140800');
INSERT INTO `sys_china` VALUES ('140881', '永济市', '140800');
INSERT INTO `sys_china` VALUES ('140882', '河津市', '140800');
INSERT INTO `sys_china` VALUES ('140900', '忻州市', '140000');
INSERT INTO `sys_china` VALUES ('140901', '忻府区', '140900');
INSERT INTO `sys_china` VALUES ('140921', '定襄县', '140900');
INSERT INTO `sys_china` VALUES ('140922', '五台县', '140900');
INSERT INTO `sys_china` VALUES ('140923', '代县', '140900');
INSERT INTO `sys_china` VALUES ('140924', '繁峙县', '140900');
INSERT INTO `sys_china` VALUES ('140925', '宁武县', '140900');
INSERT INTO `sys_china` VALUES ('140926', '静乐县', '140900');
INSERT INTO `sys_china` VALUES ('140927', '神池县', '140900');
INSERT INTO `sys_china` VALUES ('140928', '五寨县', '140900');
INSERT INTO `sys_china` VALUES ('140929', '岢岚县', '140900');
INSERT INTO `sys_china` VALUES ('140930', '河曲县', '140900');
INSERT INTO `sys_china` VALUES ('140931', '保德县', '140900');
INSERT INTO `sys_china` VALUES ('140932', '偏关县', '140900');
INSERT INTO `sys_china` VALUES ('140981', '原平市', '140900');
INSERT INTO `sys_china` VALUES ('141000', '临汾市', '140000');
INSERT INTO `sys_china` VALUES ('141001', '市辖区', '141000');
INSERT INTO `sys_china` VALUES ('141002', '尧都区', '141000');
INSERT INTO `sys_china` VALUES ('141021', '曲沃县', '141000');
INSERT INTO `sys_china` VALUES ('141022', '翼城县', '141000');
INSERT INTO `sys_china` VALUES ('141023', '襄汾县', '141000');
INSERT INTO `sys_china` VALUES ('141024', '洪洞县', '141000');
INSERT INTO `sys_china` VALUES ('141025', '古县', '141000');
INSERT INTO `sys_china` VALUES ('141026', '安泽县', '141000');
INSERT INTO `sys_china` VALUES ('141027', '浮山县', '141000');
INSERT INTO `sys_china` VALUES ('141028', '吉县', '141000');
INSERT INTO `sys_china` VALUES ('141029', '乡宁县', '141000');
INSERT INTO `sys_china` VALUES ('141030', '大宁县', '141000');
INSERT INTO `sys_china` VALUES ('141031', '隰县', '141000');
INSERT INTO `sys_china` VALUES ('141032', '永和县', '141000');
INSERT INTO `sys_china` VALUES ('141033', '蒲县', '141000');
INSERT INTO `sys_china` VALUES ('141034', '汾西县', '141000');
INSERT INTO `sys_china` VALUES ('141081', '侯马市', '141000');
INSERT INTO `sys_china` VALUES ('141082', '霍州市', '141000');
INSERT INTO `sys_china` VALUES ('141100', '吕梁市', '140000');
INSERT INTO `sys_china` VALUES ('141101', '市辖区', '141100');
INSERT INTO `sys_china` VALUES ('141102', '离石区', '141101');
INSERT INTO `sys_china` VALUES ('141121', '文水县', '141100');
INSERT INTO `sys_china` VALUES ('141122', '交城县', '141100');
INSERT INTO `sys_china` VALUES ('141123', '兴县', '141100');
INSERT INTO `sys_china` VALUES ('141124', '临县', '141100');
INSERT INTO `sys_china` VALUES ('141125', '柳林县', '141100');
INSERT INTO `sys_china` VALUES ('141126', '石楼县', '141100');
INSERT INTO `sys_china` VALUES ('141127', '岚县', '141100');
INSERT INTO `sys_china` VALUES ('141128', '方山县', '141100');
INSERT INTO `sys_china` VALUES ('141129', '中阳县', '141100');
INSERT INTO `sys_china` VALUES ('141130', '交口县', '141100');
INSERT INTO `sys_china` VALUES ('141181', '孝义市', '141100');
INSERT INTO `sys_china` VALUES ('141182', '汾阳市', '141100');
INSERT INTO `sys_china` VALUES ('150000', '内蒙古自治区', '0');
INSERT INTO `sys_china` VALUES ('150100', '呼和浩特市', '150000');
INSERT INTO `sys_china` VALUES ('150101', '市辖区', '150100');
INSERT INTO `sys_china` VALUES ('150102', '新城区', '150101');
INSERT INTO `sys_china` VALUES ('150103', '回民区', '150101');
INSERT INTO `sys_china` VALUES ('150104', '玉泉区', '150101');
INSERT INTO `sys_china` VALUES ('150105', '赛罕区', '150101');
INSERT INTO `sys_china` VALUES ('150121', '土默特左旗', '150100');
INSERT INTO `sys_china` VALUES ('150122', '托克托县', '150100');
INSERT INTO `sys_china` VALUES ('150123', '和林格尔县', '150100');
INSERT INTO `sys_china` VALUES ('150124', '清水河县', '150100');
INSERT INTO `sys_china` VALUES ('150125', '武川县', '150100');
INSERT INTO `sys_china` VALUES ('150200', '包头市', '150000');
INSERT INTO `sys_china` VALUES ('150201', '市辖区', '150200');
INSERT INTO `sys_china` VALUES ('150202', '东河区', '150201');
INSERT INTO `sys_china` VALUES ('150203', '昆都仑区', '150201');
INSERT INTO `sys_china` VALUES ('150204', '青山区', '150201');
INSERT INTO `sys_china` VALUES ('150205', '石拐区', '150201');
INSERT INTO `sys_china` VALUES ('150206', '白云矿区', '150201');
INSERT INTO `sys_china` VALUES ('150207', '九原区', '150201');
INSERT INTO `sys_china` VALUES ('150221', '土默特右旗', '150200');
INSERT INTO `sys_china` VALUES ('150222', '固阳县', '150200');
INSERT INTO `sys_china` VALUES ('150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `sys_china` VALUES ('150300', '乌海市', '150000');
INSERT INTO `sys_china` VALUES ('150301', '市辖区', '150300');
INSERT INTO `sys_china` VALUES ('150302', '海勃湾区', '150301');
INSERT INTO `sys_china` VALUES ('150303', '海南区', '150301');
INSERT INTO `sys_china` VALUES ('150304', '乌达区', '150301');
INSERT INTO `sys_china` VALUES ('150400', '赤峰市', '150000');
INSERT INTO `sys_china` VALUES ('150401', '市辖区', '150400');
INSERT INTO `sys_china` VALUES ('150402', '红山区', '150401');
INSERT INTO `sys_china` VALUES ('150403', '元宝山区', '150401');
INSERT INTO `sys_china` VALUES ('150404', '松山区', '150401');
INSERT INTO `sys_china` VALUES ('150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `sys_china` VALUES ('150422', '巴林左旗', '150400');
INSERT INTO `sys_china` VALUES ('150423', '巴林右旗', '150400');
INSERT INTO `sys_china` VALUES ('150424', '林西县', '150400');
INSERT INTO `sys_china` VALUES ('150425', '克什克腾旗', '150400');
INSERT INTO `sys_china` VALUES ('150426', '翁牛特旗', '150400');
INSERT INTO `sys_china` VALUES ('150428', '喀喇沁旗', '150400');
INSERT INTO `sys_china` VALUES ('150429', '宁城县', '150400');
INSERT INTO `sys_china` VALUES ('150430', '敖汉旗', '150400');
INSERT INTO `sys_china` VALUES ('150500', '通辽市', '150000');
INSERT INTO `sys_china` VALUES ('150501', '市辖区', '150500');
INSERT INTO `sys_china` VALUES ('150502', '科尔沁区', '150501');
INSERT INTO `sys_china` VALUES ('150521', '科尔沁左翼中旗', '150500');
INSERT INTO `sys_china` VALUES ('150522', '科尔沁左翼后旗', '150500');
INSERT INTO `sys_china` VALUES ('150523', '开鲁县', '150500');
INSERT INTO `sys_china` VALUES ('150524', '库伦旗', '150500');
INSERT INTO `sys_china` VALUES ('150525', '奈曼旗', '150500');
INSERT INTO `sys_china` VALUES ('150526', '扎鲁特旗', '150500');
INSERT INTO `sys_china` VALUES ('150581', '霍林郭勒市', '150500');
INSERT INTO `sys_china` VALUES ('150600', '鄂尔多斯市', '150000');
INSERT INTO `sys_china` VALUES ('150602', '东胜区', '150600');
INSERT INTO `sys_china` VALUES ('150621', '达拉特旗', '150600');
INSERT INTO `sys_china` VALUES ('150622', '准格尔旗', '150600');
INSERT INTO `sys_china` VALUES ('150623', '鄂托克前旗', '150600');
INSERT INTO `sys_china` VALUES ('150624', '鄂托克旗', '150600');
INSERT INTO `sys_china` VALUES ('150625', '杭锦旗', '150600');
INSERT INTO `sys_china` VALUES ('150626', '乌审旗', '150600');
INSERT INTO `sys_china` VALUES ('150627', '伊金霍洛旗', '150600');
INSERT INTO `sys_china` VALUES ('150700', '呼伦贝尔市', '150000');
INSERT INTO `sys_china` VALUES ('150701', '市辖区', '150700');
INSERT INTO `sys_china` VALUES ('150702', '海拉尔区', '150701');
INSERT INTO `sys_china` VALUES ('150721', '阿荣旗', '150700');
INSERT INTO `sys_china` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `sys_china` VALUES ('150723', '鄂伦春自治旗', '150700');
INSERT INTO `sys_china` VALUES ('150724', '鄂温克族自治旗', '150700');
INSERT INTO `sys_china` VALUES ('150725', '陈巴尔虎旗', '150700');
INSERT INTO `sys_china` VALUES ('150726', '新巴尔虎左旗', '150700');
INSERT INTO `sys_china` VALUES ('150727', '新巴尔虎右旗', '150700');
INSERT INTO `sys_china` VALUES ('150781', '满洲里市', '150700');
INSERT INTO `sys_china` VALUES ('150782', '牙克石市', '150700');
INSERT INTO `sys_china` VALUES ('150783', '扎兰屯市', '150700');
INSERT INTO `sys_china` VALUES ('150784', '额尔古纳市', '150700');
INSERT INTO `sys_china` VALUES ('150785', '根河市', '150700');
INSERT INTO `sys_china` VALUES ('150800', '巴彦淖尔市', '150000');
INSERT INTO `sys_china` VALUES ('150801', '市辖区', '150800');
INSERT INTO `sys_china` VALUES ('150802', '临河区', '150800');
INSERT INTO `sys_china` VALUES ('150821', '五原县', '150800');
INSERT INTO `sys_china` VALUES ('150822', '磴口县', '150800');
INSERT INTO `sys_china` VALUES ('150823', '乌拉特前旗', '150800');
INSERT INTO `sys_china` VALUES ('150824', '乌拉特中旗', '150800');
INSERT INTO `sys_china` VALUES ('150825', '乌拉特后旗', '150800');
INSERT INTO `sys_china` VALUES ('150826', '杭锦后旗', '150800');
INSERT INTO `sys_china` VALUES ('150900', '乌兰察布市', '150000');
INSERT INTO `sys_china` VALUES ('150901', '市辖区', '150900');
INSERT INTO `sys_china` VALUES ('150902', '集宁区', '150901');
INSERT INTO `sys_china` VALUES ('150921', '卓资县', '150900');
INSERT INTO `sys_china` VALUES ('150922', '化德县', '150900');
INSERT INTO `sys_china` VALUES ('150923', '商都县', '150900');
INSERT INTO `sys_china` VALUES ('150924', '兴和县', '150900');
INSERT INTO `sys_china` VALUES ('150925', '凉城县', '150900');
INSERT INTO `sys_china` VALUES ('150926', '察哈尔右翼前旗', '150900');
INSERT INTO `sys_china` VALUES ('150927', '察哈尔右翼中旗', '150900');
INSERT INTO `sys_china` VALUES ('150928', '察哈尔右翼后旗', '150900');
INSERT INTO `sys_china` VALUES ('150929', '四子王旗', '150900');
INSERT INTO `sys_china` VALUES ('150981', '丰镇市', '150900');
INSERT INTO `sys_china` VALUES ('152200', '兴安盟', '150000');
INSERT INTO `sys_china` VALUES ('152201', '乌兰浩特市', '152200');
INSERT INTO `sys_china` VALUES ('152202', '阿尔山市', '152200');
INSERT INTO `sys_china` VALUES ('152221', '科尔沁右翼前旗', '152200');
INSERT INTO `sys_china` VALUES ('152222', '科尔沁右翼中旗', '152200');
INSERT INTO `sys_china` VALUES ('152223', '扎赉特旗', '152200');
INSERT INTO `sys_china` VALUES ('152224', '突泉县', '152200');
INSERT INTO `sys_china` VALUES ('152500', '锡林郭勒盟', '150000');
INSERT INTO `sys_china` VALUES ('152501', '二连浩特市', '152500');
INSERT INTO `sys_china` VALUES ('152502', '锡林浩特市', '152500');
INSERT INTO `sys_china` VALUES ('152522', '阿巴嘎旗', '152500');
INSERT INTO `sys_china` VALUES ('152523', '苏尼特左旗', '152500');
INSERT INTO `sys_china` VALUES ('152524', '苏尼特右旗', '152500');
INSERT INTO `sys_china` VALUES ('152525', '东乌珠穆沁旗', '152500');
INSERT INTO `sys_china` VALUES ('152526', '西乌珠穆沁旗', '152500');
INSERT INTO `sys_china` VALUES ('152527', '太仆寺旗', '152500');
INSERT INTO `sys_china` VALUES ('152528', '镶黄旗', '152500');
INSERT INTO `sys_china` VALUES ('152529', '正镶白旗', '152500');
INSERT INTO `sys_china` VALUES ('152530', '正蓝旗', '152500');
INSERT INTO `sys_china` VALUES ('152531', '多伦县', '152500');
INSERT INTO `sys_china` VALUES ('152900', '阿拉善盟', '150000');
INSERT INTO `sys_china` VALUES ('152921', '阿拉善左旗', '152900');
INSERT INTO `sys_china` VALUES ('152922', '阿拉善右旗', '152900');
INSERT INTO `sys_china` VALUES ('152923', '额济纳旗', '152900');
INSERT INTO `sys_china` VALUES ('210000', '辽宁省', '0');
INSERT INTO `sys_china` VALUES ('210100', '沈阳市', '210000');
INSERT INTO `sys_china` VALUES ('210101', '市辖区', '210100');
INSERT INTO `sys_china` VALUES ('210102', '和平区', '210101');
INSERT INTO `sys_china` VALUES ('210103', '沈河区', '210101');
INSERT INTO `sys_china` VALUES ('210104', '大东区', '210101');
INSERT INTO `sys_china` VALUES ('210105', '皇姑区', '210101');
INSERT INTO `sys_china` VALUES ('210106', '铁西区', '210101');
INSERT INTO `sys_china` VALUES ('210111', '苏家屯区', '210101');
INSERT INTO `sys_china` VALUES ('210112', '东陵区', '210101');
INSERT INTO `sys_china` VALUES ('210113', '新城子区', '210101');
INSERT INTO `sys_china` VALUES ('210114', '于洪区', '210101');
INSERT INTO `sys_china` VALUES ('210122', '辽中县', '210100');
INSERT INTO `sys_china` VALUES ('210123', '康平县', '210100');
INSERT INTO `sys_china` VALUES ('210124', '法库县', '210100');
INSERT INTO `sys_china` VALUES ('210181', '新民市', '210100');
INSERT INTO `sys_china` VALUES ('210182', '沈北新区', '210100');
INSERT INTO `sys_china` VALUES ('210200', '大连市', '210000');
INSERT INTO `sys_china` VALUES ('210201', '市辖区', '210200');
INSERT INTO `sys_china` VALUES ('210202', '中山区', '210201');
INSERT INTO `sys_china` VALUES ('210203', '西岗区', '210201');
INSERT INTO `sys_china` VALUES ('210204', '沙河口区', '210201');
INSERT INTO `sys_china` VALUES ('210211', '甘井子区', '210201');
INSERT INTO `sys_china` VALUES ('210212', '旅顺口区', '210201');
INSERT INTO `sys_china` VALUES ('210213', '金州区', '210201');
INSERT INTO `sys_china` VALUES ('210224', '长海县', '210200');
INSERT INTO `sys_china` VALUES ('210281', '瓦房店市', '210200');
INSERT INTO `sys_china` VALUES ('210282', '普兰店市', '210200');
INSERT INTO `sys_china` VALUES ('210283', '庄河市', '210200');
INSERT INTO `sys_china` VALUES ('210300', '鞍山市', '210000');
INSERT INTO `sys_china` VALUES ('210301', '市辖区', '210300');
INSERT INTO `sys_china` VALUES ('210302', '铁东区', '210301');
INSERT INTO `sys_china` VALUES ('210303', '铁西区', '210301');
INSERT INTO `sys_china` VALUES ('210304', '立山区', '210301');
INSERT INTO `sys_china` VALUES ('210311', '千山区', '210301');
INSERT INTO `sys_china` VALUES ('210321', '台安县', '210300');
INSERT INTO `sys_china` VALUES ('210323', '岫岩满族自治县', '210300');
INSERT INTO `sys_china` VALUES ('210381', '海城市', '210300');
INSERT INTO `sys_china` VALUES ('210400', '抚顺市', '210000');
INSERT INTO `sys_china` VALUES ('210401', '市辖区', '210400');
INSERT INTO `sys_china` VALUES ('210402', '新抚区', '210401');
INSERT INTO `sys_china` VALUES ('210403', '东洲区', '210401');
INSERT INTO `sys_china` VALUES ('210404', '望花区', '210401');
INSERT INTO `sys_china` VALUES ('210411', '顺城区', '210401');
INSERT INTO `sys_china` VALUES ('210421', '抚顺县', '210400');
INSERT INTO `sys_china` VALUES ('210422', '新宾满族自治县', '210400');
INSERT INTO `sys_china` VALUES ('210423', '清原满族自治县', '210400');
INSERT INTO `sys_china` VALUES ('210500', '本溪市', '210000');
INSERT INTO `sys_china` VALUES ('210501', '市辖区', '210500');
INSERT INTO `sys_china` VALUES ('210502', '平山区', '210501');
INSERT INTO `sys_china` VALUES ('210503', '溪湖??', '210501');
INSERT INTO `sys_china` VALUES ('210504', '明山区', '210501');
INSERT INTO `sys_china` VALUES ('210505', '南芬区', '210501');
INSERT INTO `sys_china` VALUES ('210521', '本溪满族自治县', '210500');
INSERT INTO `sys_china` VALUES ('210522', '桓仁满族自治县', '210500');
INSERT INTO `sys_china` VALUES ('210600', '丹东市', '210000');
INSERT INTO `sys_china` VALUES ('210601', '市辖区', '210600');
INSERT INTO `sys_china` VALUES ('210602', '元宝区', '210601');
INSERT INTO `sys_china` VALUES ('210603', '振兴区', '210601');
INSERT INTO `sys_china` VALUES ('210604', '振安区', '210601');
INSERT INTO `sys_china` VALUES ('210624', '宽甸满族自治县', '210600');
INSERT INTO `sys_china` VALUES ('210681', '东港市', '210600');
INSERT INTO `sys_china` VALUES ('210682', '凤城市', '210600');
INSERT INTO `sys_china` VALUES ('210700', '锦州市', '210000');
INSERT INTO `sys_china` VALUES ('210701', '市辖区', '210700');
INSERT INTO `sys_china` VALUES ('210702', '古塔区', '210701');
INSERT INTO `sys_china` VALUES ('210703', '凌河区', '210701');
INSERT INTO `sys_china` VALUES ('210711', '太和区', '210701');
INSERT INTO `sys_china` VALUES ('210726', '黑山县', '210700');
INSERT INTO `sys_china` VALUES ('210727', '义县', '210700');
INSERT INTO `sys_china` VALUES ('210781', '凌海市', '210700');
INSERT INTO `sys_china` VALUES ('210782', '北宁市', '210700');
INSERT INTO `sys_china` VALUES ('210800', '营口市', '210000');
INSERT INTO `sys_china` VALUES ('210801', '市辖区', '210800');
INSERT INTO `sys_china` VALUES ('210802', '站前区', '210801');
INSERT INTO `sys_china` VALUES ('210803', '西市区', '210801');
INSERT INTO `sys_china` VALUES ('210804', '鲅鱼圈区', '210801');
INSERT INTO `sys_china` VALUES ('210811', '老边区', '210801');
INSERT INTO `sys_china` VALUES ('210881', '盖州市', '210800');
INSERT INTO `sys_china` VALUES ('210882', '大石桥市', '210800');
INSERT INTO `sys_china` VALUES ('210900', '阜新市', '210000');
INSERT INTO `sys_china` VALUES ('210901', '市辖区', '210900');
INSERT INTO `sys_china` VALUES ('210902', '海州区', '210901');
INSERT INTO `sys_china` VALUES ('210903', '新邱区', '210901');
INSERT INTO `sys_china` VALUES ('210904', '太平区', '210901');
INSERT INTO `sys_china` VALUES ('210905', '清河门区', '210901');
INSERT INTO `sys_china` VALUES ('210911', '细河区', '210901');
INSERT INTO `sys_china` VALUES ('210921', '阜新蒙古族自治县', '210900');
INSERT INTO `sys_china` VALUES ('210922', '彰武县', '210900');
INSERT INTO `sys_china` VALUES ('211000', '辽阳市', '210000');
INSERT INTO `sys_china` VALUES ('211001', '市辖区', '211000');
INSERT INTO `sys_china` VALUES ('211002', '白塔区', '211001');
INSERT INTO `sys_china` VALUES ('211003', '文圣区', '211001');
INSERT INTO `sys_china` VALUES ('211004', '宏伟区', '211001');
INSERT INTO `sys_china` VALUES ('211005', '弓长岭区', '211001');
INSERT INTO `sys_china` VALUES ('211011', '太子河区', '211001');
INSERT INTO `sys_china` VALUES ('211021', '辽阳县', '211000');
INSERT INTO `sys_china` VALUES ('211081', '灯塔市', '211000');
INSERT INTO `sys_china` VALUES ('211100', '盘锦市', '210000');
INSERT INTO `sys_china` VALUES ('211101', '市辖区', '211100');
INSERT INTO `sys_china` VALUES ('211102', '双台子区', '211101');
INSERT INTO `sys_china` VALUES ('211103', '兴隆台区', '211101');
INSERT INTO `sys_china` VALUES ('211121', '大洼县', '211100');
INSERT INTO `sys_china` VALUES ('211122', '盘山县', '211100');
INSERT INTO `sys_china` VALUES ('211200', '铁岭市', '210000');
INSERT INTO `sys_china` VALUES ('211201', '市辖区', '211200');
INSERT INTO `sys_china` VALUES ('211202', '银州区', '211201');
INSERT INTO `sys_china` VALUES ('211204', '清河区', '211201');
INSERT INTO `sys_china` VALUES ('211221', '铁岭县', '211200');
INSERT INTO `sys_china` VALUES ('211223', '西丰县', '211200');
INSERT INTO `sys_china` VALUES ('211224', '昌图县', '211200');
INSERT INTO `sys_china` VALUES ('211281', '调兵山市', '211200');
INSERT INTO `sys_china` VALUES ('211282', '开原市', '211200');
INSERT INTO `sys_china` VALUES ('211300', '朝阳市', '210000');
INSERT INTO `sys_china` VALUES ('211301', '市辖区', '211300');
INSERT INTO `sys_china` VALUES ('211302', '双塔区', '211301');
INSERT INTO `sys_china` VALUES ('211303', '龙城区', '211301');
INSERT INTO `sys_china` VALUES ('211321', '朝阳县', '211300');
INSERT INTO `sys_china` VALUES ('211322', '建平县', '211300');
INSERT INTO `sys_china` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `sys_china` VALUES ('211381', '北票市', '211300');
INSERT INTO `sys_china` VALUES ('211382', '凌源市', '211300');
INSERT INTO `sys_china` VALUES ('211400', '葫芦岛市', '210000');
INSERT INTO `sys_china` VALUES ('211401', '市辖区', '211400');
INSERT INTO `sys_china` VALUES ('211402', '连山区', '211401');
INSERT INTO `sys_china` VALUES ('211403', '龙港区', '211401');
INSERT INTO `sys_china` VALUES ('211404', '南票区', '211401');
INSERT INTO `sys_china` VALUES ('211421', '绥中县', '211400');
INSERT INTO `sys_china` VALUES ('211422', '建昌县', '211400');
INSERT INTO `sys_china` VALUES ('211481', '兴城市', '211400');
INSERT INTO `sys_china` VALUES ('220000', '吉林省', '0');
INSERT INTO `sys_china` VALUES ('220100', '长春市', '220000');
INSERT INTO `sys_china` VALUES ('220101', '市辖区', '220100');
INSERT INTO `sys_china` VALUES ('220102', '南关区', '220101');
INSERT INTO `sys_china` VALUES ('220103', '宽城区', '220101');
INSERT INTO `sys_china` VALUES ('220104', '朝阳区', '220101');
INSERT INTO `sys_china` VALUES ('220105', '二道区', '220101');
INSERT INTO `sys_china` VALUES ('220106', '绿园区', '220101');
INSERT INTO `sys_china` VALUES ('220112', '双阳区', '220101');
INSERT INTO `sys_china` VALUES ('220122', '农安县', '220100');
INSERT INTO `sys_china` VALUES ('220181', '九台市', '220100');
INSERT INTO `sys_china` VALUES ('220182', '榆树市', '220100');
INSERT INTO `sys_china` VALUES ('220183', '德惠市', '220100');
INSERT INTO `sys_china` VALUES ('220200', '吉林市', '220000');
INSERT INTO `sys_china` VALUES ('220201', '市辖区', '220200');
INSERT INTO `sys_china` VALUES ('220202', '昌邑区', '220201');
INSERT INTO `sys_china` VALUES ('220203', '龙潭区', '220201');
INSERT INTO `sys_china` VALUES ('220204', '船营区', '220201');
INSERT INTO `sys_china` VALUES ('220211', '丰满区', '220201');
INSERT INTO `sys_china` VALUES ('220221', '永吉县', '220200');
INSERT INTO `sys_china` VALUES ('220281', '蛟河市', '220200');
INSERT INTO `sys_china` VALUES ('220282', '桦甸市', '220200');
INSERT INTO `sys_china` VALUES ('220283', '舒兰市', '220200');
INSERT INTO `sys_china` VALUES ('220284', '磐石市', '220200');
INSERT INTO `sys_china` VALUES ('220300', '四平市', '220000');
INSERT INTO `sys_china` VALUES ('220301', '市辖区', '220300');
INSERT INTO `sys_china` VALUES ('220302', '铁西区', '220301');
INSERT INTO `sys_china` VALUES ('220303', '铁东区', '220301');
INSERT INTO `sys_china` VALUES ('220322', '梨树县', '220300');
INSERT INTO `sys_china` VALUES ('220323', '伊通满族自治县', '220300');
INSERT INTO `sys_china` VALUES ('220381', '公主岭市', '220300');
INSERT INTO `sys_china` VALUES ('220382', '双辽市', '220300');
INSERT INTO `sys_china` VALUES ('220400', '辽源市', '220000');
INSERT INTO `sys_china` VALUES ('220401', '市辖区', '220400');
INSERT INTO `sys_china` VALUES ('220402', '龙山区', '220401');
INSERT INTO `sys_china` VALUES ('220403', '西安区', '220401');
INSERT INTO `sys_china` VALUES ('220421', '东丰县', '220400');
INSERT INTO `sys_china` VALUES ('220422', '东辽县', '220400');
INSERT INTO `sys_china` VALUES ('220500', '通化市', '220000');
INSERT INTO `sys_china` VALUES ('220501', '市辖区', '220500');
INSERT INTO `sys_china` VALUES ('220502', '东昌区', '220501');
INSERT INTO `sys_china` VALUES ('220503', '二道江区', '220501');
INSERT INTO `sys_china` VALUES ('220521', '通化县', '220500');
INSERT INTO `sys_china` VALUES ('220523', '辉南县', '220500');
INSERT INTO `sys_china` VALUES ('220524', '柳河县', '220500');
INSERT INTO `sys_china` VALUES ('220581', '梅河口市', '220500');
INSERT INTO `sys_china` VALUES ('220582', '集安市', '220500');
INSERT INTO `sys_china` VALUES ('220600', '白山市', '220000');
INSERT INTO `sys_china` VALUES ('220601', '市辖区', '220600');
INSERT INTO `sys_china` VALUES ('220602', '八道江区', '220601');
INSERT INTO `sys_china` VALUES ('220621', '抚松县', '220600');
INSERT INTO `sys_china` VALUES ('220622', '靖宇县', '220600');
INSERT INTO `sys_china` VALUES ('220623', '长白朝鲜族自治县', '220600');
INSERT INTO `sys_china` VALUES ('220625', '江源区', '220600');
INSERT INTO `sys_china` VALUES ('220681', '临江市', '220600');
INSERT INTO `sys_china` VALUES ('220700', '松原市', '220000');
INSERT INTO `sys_china` VALUES ('220701', '市辖区', '220700');
INSERT INTO `sys_china` VALUES ('220702', '宁江区', '220701');
INSERT INTO `sys_china` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `sys_china` VALUES ('220722', '长岭县', '220700');
INSERT INTO `sys_china` VALUES ('220723', '乾安县', '220700');
INSERT INTO `sys_china` VALUES ('220724', '扶余市', '220700');
INSERT INTO `sys_china` VALUES ('220800', '白城市', '220000');
INSERT INTO `sys_china` VALUES ('220801', '市辖区', '220800');
INSERT INTO `sys_china` VALUES ('220802', '洮北区', '220800');
INSERT INTO `sys_china` VALUES ('220821', '镇赉县', '220800');
INSERT INTO `sys_china` VALUES ('220822', '通榆县', '220800');
INSERT INTO `sys_china` VALUES ('220881', '洮南市', '220800');
INSERT INTO `sys_china` VALUES ('220882', '大安市', '220800');
INSERT INTO `sys_china` VALUES ('222400', '延边朝鲜族自治州', '220000');
INSERT INTO `sys_china` VALUES ('222401', '延吉市', '222400');
INSERT INTO `sys_china` VALUES ('222402', '图们市', '222400');
INSERT INTO `sys_china` VALUES ('222403', '敦化市', '222400');
INSERT INTO `sys_china` VALUES ('222404', '珲春市', '222400');
INSERT INTO `sys_china` VALUES ('222405', '龙井市', '222400');
INSERT INTO `sys_china` VALUES ('222406', '和龙市', '222400');
INSERT INTO `sys_china` VALUES ('222424', '汪清县', '222400');
INSERT INTO `sys_china` VALUES ('222426', '安图县', '222400');
INSERT INTO `sys_china` VALUES ('230000', '黑龙江省', '0');
INSERT INTO `sys_china` VALUES ('230100', '哈尔滨市', '230000');
INSERT INTO `sys_china` VALUES ('230101', '市辖区', '230100');
INSERT INTO `sys_china` VALUES ('230102', '道里区', '230101');
INSERT INTO `sys_china` VALUES ('230103', '南岗区', '230101');
INSERT INTO `sys_china` VALUES ('230104', '道外区', '230101');
INSERT INTO `sys_china` VALUES ('230106', '香坊区', '230101');
INSERT INTO `sys_china` VALUES ('230107', '动力区', '230101');
INSERT INTO `sys_china` VALUES ('230108', '平房区', '230101');
INSERT INTO `sys_china` VALUES ('230109', '松北区', '230101');
INSERT INTO `sys_china` VALUES ('230111', '呼兰区', '230101');
INSERT INTO `sys_china` VALUES ('230123', '依兰县', '230100');
INSERT INTO `sys_china` VALUES ('230124', '方正县', '230100');
INSERT INTO `sys_china` VALUES ('230125', '宾县', '230100');
INSERT INTO `sys_china` VALUES ('230126', '巴彦县', '230100');
INSERT INTO `sys_china` VALUES ('230127', '木兰县', '230100');
INSERT INTO `sys_china` VALUES ('230128', '通河县', '230100');
INSERT INTO `sys_china` VALUES ('230129', '延寿县', '230100');
INSERT INTO `sys_china` VALUES ('230181', '阿城市', '230100');
INSERT INTO `sys_china` VALUES ('230182', '双城市', '230100');
INSERT INTO `sys_china` VALUES ('230183', '尚志市', '230100');
INSERT INTO `sys_china` VALUES ('230184', '五常市', '230100');
INSERT INTO `sys_china` VALUES ('230200', '齐齐哈尔市', '230000');
INSERT INTO `sys_china` VALUES ('230201', '市辖区', '230200');
INSERT INTO `sys_china` VALUES ('230202', '龙沙区', '230201');
INSERT INTO `sys_china` VALUES ('230203', '建华区', '230201');
INSERT INTO `sys_china` VALUES ('230204', '铁锋区', '230201');
INSERT INTO `sys_china` VALUES ('230205', '昂昂溪区', '230201');
INSERT INTO `sys_china` VALUES ('230206', '富拉尔基区', '230201');
INSERT INTO `sys_china` VALUES ('230207', '碾子山区', '230201');
INSERT INTO `sys_china` VALUES ('230208', '梅里斯达斡尔族区', '230201');
INSERT INTO `sys_china` VALUES ('230221', '龙江县', '230200');
INSERT INTO `sys_china` VALUES ('230223', '依安县', '230200');
INSERT INTO `sys_china` VALUES ('230224', '泰来县', '230200');
INSERT INTO `sys_china` VALUES ('230225', '甘南县', '230200');
INSERT INTO `sys_china` VALUES ('230227', '富裕县', '230200');
INSERT INTO `sys_china` VALUES ('230229', '克山县', '230200');
INSERT INTO `sys_china` VALUES ('230230', '克东县', '230200');
INSERT INTO `sys_china` VALUES ('230231', '拜泉县', '230200');
INSERT INTO `sys_china` VALUES ('230281', '讷河市', '230200');
INSERT INTO `sys_china` VALUES ('230300', '鸡西市', '230000');
INSERT INTO `sys_china` VALUES ('230301', '市辖区', '230300');
INSERT INTO `sys_china` VALUES ('230302', '鸡冠区', '230301');
INSERT INTO `sys_china` VALUES ('230303', '恒山区', '230301');
INSERT INTO `sys_china` VALUES ('230304', '滴道区', '230301');
INSERT INTO `sys_china` VALUES ('230305', '梨树区', '230301');
INSERT INTO `sys_china` VALUES ('230306', '城子河区', '230301');
INSERT INTO `sys_china` VALUES ('230307', '麻山区', '230301');
INSERT INTO `sys_china` VALUES ('230321', '鸡东县', '230300');
INSERT INTO `sys_china` VALUES ('230381', '虎林市', '230300');
INSERT INTO `sys_china` VALUES ('230382', '密山市', '230300');
INSERT INTO `sys_china` VALUES ('230400', '鹤岗市', '230000');
INSERT INTO `sys_china` VALUES ('230401', '市辖区', '230400');
INSERT INTO `sys_china` VALUES ('230402', '向阳区', '230401');
INSERT INTO `sys_china` VALUES ('230403', '工农区', '230401');
INSERT INTO `sys_china` VALUES ('230404', '南山区', '230401');
INSERT INTO `sys_china` VALUES ('230405', '兴安区', '230401');
INSERT INTO `sys_china` VALUES ('230406', '东山区', '230401');
INSERT INTO `sys_china` VALUES ('230407', '兴山区', '230401');
INSERT INTO `sys_china` VALUES ('230421', '萝北县', '230400');
INSERT INTO `sys_china` VALUES ('230422', '绥滨县', '230400');
INSERT INTO `sys_china` VALUES ('230500', '双鸭山市', '230000');
INSERT INTO `sys_china` VALUES ('230501', '市辖区', '230500');
INSERT INTO `sys_china` VALUES ('230502', '尖山区', '230501');
INSERT INTO `sys_china` VALUES ('230503', '岭东区', '230501');
INSERT INTO `sys_china` VALUES ('230505', '四方台区', '230501');
INSERT INTO `sys_china` VALUES ('230506', '宝山区', '230501');
INSERT INTO `sys_china` VALUES ('230521', '集贤县', '230500');
INSERT INTO `sys_china` VALUES ('230522', '友谊县', '230500');
INSERT INTO `sys_china` VALUES ('230523', '宝清县', '230500');
INSERT INTO `sys_china` VALUES ('230524', '饶河县', '230500');
INSERT INTO `sys_china` VALUES ('230600', '大庆市', '230000');
INSERT INTO `sys_china` VALUES ('230601', '市辖区', '230600');
INSERT INTO `sys_china` VALUES ('230602', '萨尔图区', '230601');
INSERT INTO `sys_china` VALUES ('230603', '龙凤区', '230601');
INSERT INTO `sys_china` VALUES ('230604', '让胡路区', '230601');
INSERT INTO `sys_china` VALUES ('230605', '红岗区', '230601');
INSERT INTO `sys_china` VALUES ('230606', '大同区', '230601');
INSERT INTO `sys_china` VALUES ('230621', '肇州县', '230600');
INSERT INTO `sys_china` VALUES ('230622', '肇源县', '230600');
INSERT INTO `sys_china` VALUES ('230623', '林甸县', '230600');
INSERT INTO `sys_china` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `sys_china` VALUES ('230700', '伊春市', '230000');
INSERT INTO `sys_china` VALUES ('230701', '市辖区', '230700');
INSERT INTO `sys_china` VALUES ('230702', '伊春区', '230701');
INSERT INTO `sys_china` VALUES ('230703', '南岔区', '230701');
INSERT INTO `sys_china` VALUES ('230704', '友好区', '230701');
INSERT INTO `sys_china` VALUES ('230705', '西林区', '230701');
INSERT INTO `sys_china` VALUES ('230706', '翠峦区', '230701');
INSERT INTO `sys_china` VALUES ('230707', '新青区', '230701');
INSERT INTO `sys_china` VALUES ('230708', '美溪区', '230701');
INSERT INTO `sys_china` VALUES ('230709', '金山屯区', '230701');
INSERT INTO `sys_china` VALUES ('230710', '五营区', '230701');
INSERT INTO `sys_china` VALUES ('230711', '乌马河区', '230701');
INSERT INTO `sys_china` VALUES ('230712', '汤旺河区', '230701');
INSERT INTO `sys_china` VALUES ('230713', '带岭区', '230701');
INSERT INTO `sys_china` VALUES ('230714', '乌伊岭区', '230701');
INSERT INTO `sys_china` VALUES ('230715', '红星区', '230701');
INSERT INTO `sys_china` VALUES ('230716', '上甘岭区', '230701');
INSERT INTO `sys_china` VALUES ('230722', '嘉荫县', '230700');
INSERT INTO `sys_china` VALUES ('230781', '铁力市', '230700');
INSERT INTO `sys_china` VALUES ('230800', '佳木斯市', '230000');
INSERT INTO `sys_china` VALUES ('230801', '市辖区', '230800');
INSERT INTO `sys_china` VALUES ('230803', '向阳区', '230801');
INSERT INTO `sys_china` VALUES ('230804', '前进区', '230801');
INSERT INTO `sys_china` VALUES ('230805', '东风区', '230801');
INSERT INTO `sys_china` VALUES ('230811', '郊区', '230801');
INSERT INTO `sys_china` VALUES ('230822', '桦南县', '230800');
INSERT INTO `sys_china` VALUES ('230826', '桦川县', '230800');
INSERT INTO `sys_china` VALUES ('230828', '汤原县', '230800');
INSERT INTO `sys_china` VALUES ('230833', '抚远县', '230800');
INSERT INTO `sys_china` VALUES ('230881', '同江市', '230800');
INSERT INTO `sys_china` VALUES ('230882', '富锦市', '230800');
INSERT INTO `sys_china` VALUES ('230900', '七台河市', '230000');
INSERT INTO `sys_china` VALUES ('230901', '市辖区', '230900');
INSERT INTO `sys_china` VALUES ('230902', '新兴区', '230901');
INSERT INTO `sys_china` VALUES ('230903', '桃山区', '230901');
INSERT INTO `sys_china` VALUES ('230904', '茄子河区', '230901');
INSERT INTO `sys_china` VALUES ('230921', '勃利县', '230900');
INSERT INTO `sys_china` VALUES ('231000', '牡丹江市', '230000');
INSERT INTO `sys_china` VALUES ('231001', '市辖区', '231000');
INSERT INTO `sys_china` VALUES ('231002', '东安区', '231001');
INSERT INTO `sys_china` VALUES ('231003', '阳明区', '231001');
INSERT INTO `sys_china` VALUES ('231004', '爱民区', '231001');
INSERT INTO `sys_china` VALUES ('231005', '西安区', '231001');
INSERT INTO `sys_china` VALUES ('231024', '东宁县', '231000');
INSERT INTO `sys_china` VALUES ('231025', '林口县', '231000');
INSERT INTO `sys_china` VALUES ('231081', '绥芬河市', '231000');
INSERT INTO `sys_china` VALUES ('231083', '海林市', '231000');
INSERT INTO `sys_china` VALUES ('231084', '宁安市', '231000');
INSERT INTO `sys_china` VALUES ('231085', '穆棱市', '231000');
INSERT INTO `sys_china` VALUES ('231100', '黑河市', '230000');
INSERT INTO `sys_china` VALUES ('231101', '市辖区', '231100');
INSERT INTO `sys_china` VALUES ('231102', '爱辉区', '231101');
INSERT INTO `sys_china` VALUES ('231121', '嫩江县', '231100');
INSERT INTO `sys_china` VALUES ('231123', '逊克县', '231100');
INSERT INTO `sys_china` VALUES ('231124', '孙吴县', '231100');
INSERT INTO `sys_china` VALUES ('231181', '北安市', '231100');
INSERT INTO `sys_china` VALUES ('231182', '五大连池市', '231100');
INSERT INTO `sys_china` VALUES ('231200', '绥化市', '230000');
INSERT INTO `sys_china` VALUES ('231201', '北林区', '231200');
INSERT INTO `sys_china` VALUES ('231221', '望奎县', '231200');
INSERT INTO `sys_china` VALUES ('231222', '兰西县', '231200');
INSERT INTO `sys_china` VALUES ('231223', '青冈县', '231200');
INSERT INTO `sys_china` VALUES ('231224', '庆安县', '231200');
INSERT INTO `sys_china` VALUES ('231225', '明水县', '231200');
INSERT INTO `sys_china` VALUES ('231226', '绥棱县', '231200');
INSERT INTO `sys_china` VALUES ('231281', '安达市', '231200');
INSERT INTO `sys_china` VALUES ('231282', '肇东市', '231200');
INSERT INTO `sys_china` VALUES ('231283', '海伦市', '231200');
INSERT INTO `sys_china` VALUES ('232700', '大兴安岭地区', '230000');
INSERT INTO `sys_china` VALUES ('232701', '加格达奇区', '232700');
INSERT INTO `sys_china` VALUES ('232702', '松岭区', '232700');
INSERT INTO `sys_china` VALUES ('232703', '新林区', '232700');
INSERT INTO `sys_china` VALUES ('232704', '呼中区', '232700');
INSERT INTO `sys_china` VALUES ('232721', '呼玛县', '232700');
INSERT INTO `sys_china` VALUES ('232722', '塔河县', '232700');
INSERT INTO `sys_china` VALUES ('232723', '漠河县', '232700');
INSERT INTO `sys_china` VALUES ('310000', '上海市', '0');
INSERT INTO `sys_china` VALUES ('310100', '黄浦区', '310000');
INSERT INTO `sys_china` VALUES ('310300', '卢湾区', '310000');
INSERT INTO `sys_china` VALUES ('310400', '徐汇区', '310000');
INSERT INTO `sys_china` VALUES ('310500', '长宁区', '310000');
INSERT INTO `sys_china` VALUES ('310600', '静安区', '310000');
INSERT INTO `sys_china` VALUES ('310700', '普陀区', '310000');
INSERT INTO `sys_china` VALUES ('310800', '闸北区', '310000');
INSERT INTO `sys_china` VALUES ('310900', '虹口区', '310000');
INSERT INTO `sys_china` VALUES ('311000', '杨浦区', '310000');
INSERT INTO `sys_china` VALUES ('311200', '闵行区', '310000');
INSERT INTO `sys_china` VALUES ('311300', '宝山区', '310000');
INSERT INTO `sys_china` VALUES ('311400', '嘉定区', '310000');
INSERT INTO `sys_china` VALUES ('311500', '浦东新区', '310000');
INSERT INTO `sys_china` VALUES ('311600', '金山区', '310000');
INSERT INTO `sys_china` VALUES ('311700', '松江区', '310000');
INSERT INTO `sys_china` VALUES ('311800', '青浦区', '310000');
INSERT INTO `sys_china` VALUES ('311900', '南汇区', '310000');
INSERT INTO `sys_china` VALUES ('312000', '奉贤区', '310000');
INSERT INTO `sys_china` VALUES ('313000', '崇明县', '310000');
INSERT INTO `sys_china` VALUES ('320000', '江苏省', '0');
INSERT INTO `sys_china` VALUES ('320100', '南京市', '320000');
INSERT INTO `sys_china` VALUES ('320101', '市辖区', '320100');
INSERT INTO `sys_china` VALUES ('320102', '玄武区', '320101');
INSERT INTO `sys_china` VALUES ('320103', '白下区', '320101');
INSERT INTO `sys_china` VALUES ('320104', '秦淮区', '320101');
INSERT INTO `sys_china` VALUES ('320105', '建邺区', '320101');
INSERT INTO `sys_china` VALUES ('320106', '鼓楼区', '320101');
INSERT INTO `sys_china` VALUES ('320107', '下关区', '320101');
INSERT INTO `sys_china` VALUES ('320111', '浦口区', '320101');
INSERT INTO `sys_china` VALUES ('320113', '栖霞区', '320101');
INSERT INTO `sys_china` VALUES ('320114', '雨花台区', '320101');
INSERT INTO `sys_china` VALUES ('320115', '江宁区', '320101');
INSERT INTO `sys_china` VALUES ('320116', '六合区', '320101');
INSERT INTO `sys_china` VALUES ('320124', '溧水区', '320100');
INSERT INTO `sys_china` VALUES ('320125', '高淳区', '320100');
INSERT INTO `sys_china` VALUES ('320200', '无锡市', '320000');
INSERT INTO `sys_china` VALUES ('320201', '市辖区', '320200');
INSERT INTO `sys_china` VALUES ('320202', '崇安区', '320201');
INSERT INTO `sys_china` VALUES ('320203', '南长区', '320201');
INSERT INTO `sys_china` VALUES ('320204', '北塘区', '320201');
INSERT INTO `sys_china` VALUES ('320205', '锡山区', '320201');
INSERT INTO `sys_china` VALUES ('320206', '惠山区', '320201');
INSERT INTO `sys_china` VALUES ('320211', '滨湖区', '320201');
INSERT INTO `sys_china` VALUES ('320281', '江阴市', '320200');
INSERT INTO `sys_china` VALUES ('320282', '宜兴市', '320200');
INSERT INTO `sys_china` VALUES ('320300', '徐州市', '320000');
INSERT INTO `sys_china` VALUES ('320301', '泉山区', '320300');
INSERT INTO `sys_china` VALUES ('320302', '鼓楼区', '320300');
INSERT INTO `sys_china` VALUES ('320303', '云龙区', '320300');
INSERT INTO `sys_china` VALUES ('320304', '九里区', '320301');
INSERT INTO `sys_china` VALUES ('320305', '贾汪区', '320300');
INSERT INTO `sys_china` VALUES ('320321', '丰县', '320300');
INSERT INTO `sys_china` VALUES ('320322', '沛县', '320300');
INSERT INTO `sys_china` VALUES ('320323', '铜山县', '320300');
INSERT INTO `sys_china` VALUES ('320324', '睢宁县', '320300');
INSERT INTO `sys_china` VALUES ('320381', '新沂市', '320300');
INSERT INTO `sys_china` VALUES ('320382', '邳州市', '320300');
INSERT INTO `sys_china` VALUES ('320400', '常州市', '320000');
INSERT INTO `sys_china` VALUES ('320401', '市辖区', '320400');
INSERT INTO `sys_china` VALUES ('320402', '天宁区', '320401');
INSERT INTO `sys_china` VALUES ('320404', '钟楼区', '320401');
INSERT INTO `sys_china` VALUES ('320405', '戚墅堰区', '320401');
INSERT INTO `sys_china` VALUES ('320411', '新北区', '320401');
INSERT INTO `sys_china` VALUES ('320412', '武进区', '320401');
INSERT INTO `sys_china` VALUES ('320481', '溧阳市', '320400');
INSERT INTO `sys_china` VALUES ('320482', '金坛市', '320400');
INSERT INTO `sys_china` VALUES ('320500', '苏州市', '320000');
INSERT INTO `sys_china` VALUES ('320501', '市辖区', '320500');
INSERT INTO `sys_china` VALUES ('320502', '沧浪区', '320501');
INSERT INTO `sys_china` VALUES ('320503', '平江区', '320501');
INSERT INTO `sys_china` VALUES ('320504', '金阊区', '320501');
INSERT INTO `sys_china` VALUES ('320505', '虎丘区', '320501');
INSERT INTO `sys_china` VALUES ('320506', '吴中区', '320501');
INSERT INTO `sys_china` VALUES ('320507', '相城区', '320501');
INSERT INTO `sys_china` VALUES ('320581', '常熟市', '320500');
INSERT INTO `sys_china` VALUES ('320582', '张家港市', '320500');
INSERT INTO `sys_china` VALUES ('320583', '昆山市', '320500');
INSERT INTO `sys_china` VALUES ('320584', '吴江市', '320500');
INSERT INTO `sys_china` VALUES ('320585', '太仓市', '320500');
INSERT INTO `sys_china` VALUES ('320600', '南通市', '320000');
INSERT INTO `sys_china` VALUES ('320601', '市辖区', '320600');
INSERT INTO `sys_china` VALUES ('320602', '崇川区', '320601');
INSERT INTO `sys_china` VALUES ('320611', '港闸区', '320601');
INSERT INTO `sys_china` VALUES ('320621', '海安县', '320600');
INSERT INTO `sys_china` VALUES ('320623', '如东县', '320600');
INSERT INTO `sys_china` VALUES ('320681', '启东市', '320600');
INSERT INTO `sys_china` VALUES ('320682', '如皋市', '320600');
INSERT INTO `sys_china` VALUES ('320683', '通州市', '320600');
INSERT INTO `sys_china` VALUES ('320684', '海门市', '320600');
INSERT INTO `sys_china` VALUES ('320700', '连云港市', '320000');
INSERT INTO `sys_china` VALUES ('320701', '市辖区', '320700');
INSERT INTO `sys_china` VALUES ('320703', '连云区', '320701');
INSERT INTO `sys_china` VALUES ('320705', '新浦区', '320701');
INSERT INTO `sys_china` VALUES ('320706', '海州区', '320701');
INSERT INTO `sys_china` VALUES ('320721', '赣榆县', '320700');
INSERT INTO `sys_china` VALUES ('320722', '东海县', '320700');
INSERT INTO `sys_china` VALUES ('320723', '灌云县', '320700');
INSERT INTO `sys_china` VALUES ('320724', '灌南县', '320700');
INSERT INTO `sys_china` VALUES ('320800', '淮安市', '320000');
INSERT INTO `sys_china` VALUES ('320801', '市辖区', '320800');
INSERT INTO `sys_china` VALUES ('320802', '清河区', '320801');
INSERT INTO `sys_china` VALUES ('320803', '楚州区', '320801');
INSERT INTO `sys_china` VALUES ('320804', '淮阴区', '320801');
INSERT INTO `sys_china` VALUES ('320811', '清浦区', '320801');
INSERT INTO `sys_china` VALUES ('320826', '涟水县', '320800');
INSERT INTO `sys_china` VALUES ('320829', '洪泽县', '320800');
INSERT INTO `sys_china` VALUES ('320830', '盱眙县', '320800');
INSERT INTO `sys_china` VALUES ('320831', '金湖县', '320800');
INSERT INTO `sys_china` VALUES ('320900', '盐城市', '320000');
INSERT INTO `sys_china` VALUES ('320901', '市辖区', '320900');
INSERT INTO `sys_china` VALUES ('320902', '亭湖区', '320901');
INSERT INTO `sys_china` VALUES ('320903', '盐都区', '320901');
INSERT INTO `sys_china` VALUES ('320921', '响水县', '320900');
INSERT INTO `sys_china` VALUES ('320922', '滨海县', '320900');
INSERT INTO `sys_china` VALUES ('320923', '阜宁县', '320900');
INSERT INTO `sys_china` VALUES ('320924', '射阳县', '320900');
INSERT INTO `sys_china` VALUES ('320925', '建湖县', '320900');
INSERT INTO `sys_china` VALUES ('320981', '东台市', '320900');
INSERT INTO `sys_china` VALUES ('320982', '大丰市', '320900');
INSERT INTO `sys_china` VALUES ('321000', '扬州市', '320000');
INSERT INTO `sys_china` VALUES ('321001', '市辖区', '321000');
INSERT INTO `sys_china` VALUES ('321002', '广陵区', '321001');
INSERT INTO `sys_china` VALUES ('321003', '邗江区', '321001');
INSERT INTO `sys_china` VALUES ('321011', '维扬区', '321001');
INSERT INTO `sys_china` VALUES ('321023', '宝应县', '321000');
INSERT INTO `sys_china` VALUES ('321081', '仪征市', '321000');
INSERT INTO `sys_china` VALUES ('321084', '高邮市', '321000');
INSERT INTO `sys_china` VALUES ('321088', '江都市', '321000');
INSERT INTO `sys_china` VALUES ('321100', '镇江市', '320000');
INSERT INTO `sys_china` VALUES ('321101', '市辖区', '321100');
INSERT INTO `sys_china` VALUES ('321102', '京口区', '321101');
INSERT INTO `sys_china` VALUES ('321111', '润州区', '321101');
INSERT INTO `sys_china` VALUES ('321112', '丹徒区', '321101');
INSERT INTO `sys_china` VALUES ('321181', '丹阳市', '321100');
INSERT INTO `sys_china` VALUES ('321182', '扬中市', '321100');
INSERT INTO `sys_china` VALUES ('321183', '句容市', '321100');
INSERT INTO `sys_china` VALUES ('321200', '泰州市', '320000');
INSERT INTO `sys_china` VALUES ('321201', '市辖区', '321200');
INSERT INTO `sys_china` VALUES ('321202', '海陵区', '321201');
INSERT INTO `sys_china` VALUES ('321203', '高港区', '321201');
INSERT INTO `sys_china` VALUES ('321281', '兴化市', '321200');
INSERT INTO `sys_china` VALUES ('321282', '靖江市', '321200');
INSERT INTO `sys_china` VALUES ('321283', '泰兴市', '321200');
INSERT INTO `sys_china` VALUES ('321284', '姜堰市', '321200');
INSERT INTO `sys_china` VALUES ('321300', '宿迁市', '320000');
INSERT INTO `sys_china` VALUES ('321301', '市辖区', '321300');
INSERT INTO `sys_china` VALUES ('321302', '宿城区', '321301');
INSERT INTO `sys_china` VALUES ('321311', '宿豫区', '321301');
INSERT INTO `sys_china` VALUES ('321322', '沭阳县', '321300');
INSERT INTO `sys_china` VALUES ('321323', '泗阳县', '321300');
INSERT INTO `sys_china` VALUES ('321324', '泗洪县', '321300');
INSERT INTO `sys_china` VALUES ('330000', '浙江省', '0');
INSERT INTO `sys_china` VALUES ('330100', '杭州市', '330000');
INSERT INTO `sys_china` VALUES ('330101', '市辖区', '330100');
INSERT INTO `sys_china` VALUES ('330102', '上城区', '330101');
INSERT INTO `sys_china` VALUES ('330103', '下城区', '330101');
INSERT INTO `sys_china` VALUES ('330104', '江干区', '330101');
INSERT INTO `sys_china` VALUES ('330105', '拱墅区', '330101');
INSERT INTO `sys_china` VALUES ('330106', '西湖区', '330101');
INSERT INTO `sys_china` VALUES ('330108', '滨江区', '330101');
INSERT INTO `sys_china` VALUES ('330109', '萧山区', '330101');
INSERT INTO `sys_china` VALUES ('330110', '余杭区', '330101');
INSERT INTO `sys_china` VALUES ('330122', '桐庐县', '330100');
INSERT INTO `sys_china` VALUES ('330127', '淳安县', '330100');
INSERT INTO `sys_china` VALUES ('330182', '建德市', '330100');
INSERT INTO `sys_china` VALUES ('330183', '富阳市', '330100');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `value` varchar(255) DEFAULT NULL COMMENT '字典值',
  `type` varchar(255) DEFAULT NULL COMMENT '字典类型',
  `code` varchar(255) DEFAULT NULL COMMENT '字典编码',
  `dict_desc` varchar(255) DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('2a464332777a6a62aba2bc99290b49d7', 'Modbus串口通信', '0', 'modbus_type', '0', 'Modbus通信协议类型');
INSERT INTO `sys_dict` VALUES ('62b6ff4ede9011e9be79704d7bb8b5fa', '离散量输入 (只读，0x02)', '0', 'modbus_agreement_function', 'inputStatus-r02', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62bce76ede9011e9be79704d7bb8b5fa', '线圈状态 (只读，0x01)', '1', 'modbus_agreement_function', 'coilStatus-r', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62c046bdde9011e9be79704d7bb8b5fa', '线圈状态 (读写，读取使用0x01，写入使用0x05)', '2', 'modbus_agreement_function', 'coilStatus-w05', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62c48881de9011e9be79704d7bb8b5fa', '线圈状态 (读写，读取使用0x01，写入使用0x0F)', '3', 'modbus_agreement_function', 'coilStatus-w0f', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62c7e73ede9011e9be79704d7bb8b5fa', '保持寄存器 (只读，0x03)', '4', 'modbus_agreement_function', 'holdingRegister-r03', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62cc294fde9011e9be79704d7bb8b5fa', '保持寄存器 (读写，读取使用0x03，写入使用0x06)', '5', 'modbus_agreement_function', 'holdingRegister-w06', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62cf8c13de9011e9be79704d7bb8b5fa', '保持寄存器 (读写，读取使用0x03，写入使用0x10)', '6', 'modbus_agreement_function', 'holdingRegister-w10', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('62d3c914de9011e9be79704d7bb8b5fa', '输入寄存器 (只读，0x04)', '7', 'modbus_agreement_function', 'inputRegister-r04', 'Modbus协议操作类型');
INSERT INTO `sys_dict` VALUES ('7aac9ca6de7911e9be79704d7bb8b5fa', '无 / ', '0', 'function_unit', '', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ab06db1de7911e9be79704d7bb8b5fa', '转每分钟 / turn/m', '1', 'function_unit', 'turn/m', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ab6cb6ede7911e9be79704d7bb8b5fa', '次 / count', '2', 'function_unit', 'count', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7abfaf5cde7911e9be79704d7bb8b5fa', '档 / gear', '3', 'function_unit', 'gear', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ac8977fde7911e9be79704d7bb8b5fa', '步 / stepCount', '4', 'function_unit', 'stepCount', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7accf436de7911e9be79704d7bb8b5fa', '标准立方米每小时 / Nm3/h', '5', 'function_unit', 'Nm3/h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ad17cd1de7911e9be79704d7bb8b5fa', '千伏 / kV', '6', 'function_unit', 'kV', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ad5da72de7911e9be79704d7bb8b5fa', '千伏安 / KVA', '7', 'function_unit', 'KVA', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ada658ede7911e9be79704d7bb8b5fa', '千乏 / kvar', '8', 'function_unit', 'kvar', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7adec188de7911e9be79704d7bb8b5fa', '微瓦每平方厘米 / uw/cm2', '9', 'function_unit', 'uw/cm2', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ae34bcdde7911e9be79704d7bb8b5fa', '只 / 只', '10', 'function_unit', '只', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ae7a767de7911e9be79704d7bb8b5fa', '相对湿度 / %RH', '11', 'function_unit', '%RH', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7aec3213de7911e9be79704d7bb8b5fa', '立方米每秒 / m³/s', '12', 'function_unit', 'm³/s', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7af08f8bde7911e9be79704d7bb8b5fa', '公斤每秒 / kg/s', '13', 'function_unit', 'kg/s', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7af51960de7911e9be79704d7bb8b5fa', '转每分钟 / r/min', '14', 'function_unit', 'r/min', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7af97416de7911e9be79704d7bb8b5fa', '吨每小时 / t/h', '15', 'function_unit', 't/h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7afdfe8bde7911e9be79704d7bb8b5fa', '千卡每小时 / KCL/h', '16', 'function_unit', 'KCL/h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b0259e8de7911e9be79704d7bb8b5fa', '升每秒 / L/s', '17', 'function_unit', 'L/s', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b06e571de7911e9be79704d7bb8b5fa', '兆帕 / Mpa', '18', 'function_unit', 'Mpa', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b0b40dede7911e9be79704d7bb8b5fa', '立方米每小时 / m³/h', '19', 'function_unit', 'm³/h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b0fcad9de7911e9be79704d7bb8b5fa', '千乏时 / kvarh', '20', 'function_unit', 'kvarh', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b142633de7911e9be79704d7bb8b5fa', '千乏 / KVar', '21', 'function_unit', 'KVar', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b18b474de7911e9be79704d7bb8b5fa', '微克每升 / μg/L', '22', 'function_unit', 'μg/L', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b1d0ed3de7911e9be79704d7bb8b5fa', '千卡路里 / kcal', '23', 'function_unit', 'kcal', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b219ae0de7911e9be79704d7bb8b5fa', '吉字节 / GB', '24', 'function_unit', 'GB', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b25f5f0de7911e9be79704d7bb8b5fa', '兆字节 / MB', '25', 'function_unit', 'MB', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b2a81a0de7911e9be79704d7bb8b5fa', '千字节 / KB', '26', 'function_unit', 'KB', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b2edc92de7911e9be79704d7bb8b5fa', '字节 / B', '27', 'function_unit', 'B', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b336849de7911e9be79704d7bb8b5fa', '微克每平方分米每天 / μg/(d㎡·d)', '28', 'function_unit', 'μg/(d㎡·d)', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b37c362de7911e9be79704d7bb8b5fa', '百万分率 / ppm', '29', 'function_unit', 'ppm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b3c4e3bde7911e9be79704d7bb8b5fa', '像素 / pixel', '30', 'function_unit', 'pixel', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b40ab7fde7911e9be79704d7bb8b5fa', '照度 / Lux', '31', 'function_unit', 'Lux', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b453511de7911e9be79704d7bb8b5fa', '重力加速度 / grav', '32', 'function_unit', 'grav', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b49915ede7911e9be79704d7bb8b5fa', '分贝 / dB', '33', 'function_unit', 'dB', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b4e1b50de7911e9be79704d7bb8b5fa', '百分比 / %', '34', 'function_unit', '%', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b527660de7911e9be79704d7bb8b5fa', '流明 / lm', '35', 'function_unit', 'lm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b570045de7911e9be79704d7bb8b5fa', '比特 / bit', '36', 'function_unit', 'bit', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b5b6061de7911e9be79704d7bb8b5fa', '克每毫升 / g/mL', '37', 'function_unit', 'g/mL', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b601962de7911e9be79704d7bb8b5fa', '克每升 / g/L', '38', 'function_unit', 'g/L', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b6446b3de7911e9be79704d7bb8b5fa', '毫克每升 / mg/L', '39', 'function_unit', 'mg/L', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b68d012de7911e9be79704d7bb8b5fa', '微克每立方米 / μg/m³', '40', 'function_unit', 'μg/m³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b6d2d09de7911e9be79704d7bb8b5fa', '毫克每立方米 / mg/m³', '41', 'function_unit', 'mg/m³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b71b581de7911e9be79704d7bb8b5fa', '克每立方米 / g/m³', '42', 'function_unit', 'g/m³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b7614a3de7911e9be79704d7bb8b5fa', '千克每立方米 / kg/m³', '43', 'function_unit', 'kg/m³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b7a9cadde7911e9be79704d7bb8b5fa', '纳法 / nF', '44', 'function_unit', 'nF', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b7efb65de7911e9be79704d7bb8b5fa', '皮法 / pF', '45', 'function_unit', 'pF', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b838477de7911e9be79704d7bb8b5fa', '微法 / μF', '46', 'function_unit', 'μF', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b87df6ade7911e9be79704d7bb8b5fa', '法拉 / F', '47', 'function_unit', 'F', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b8c6908de7911e9be79704d7bb8b5fa', '欧姆 / Ω', '48', 'function_unit', 'Ω', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b90c857de7911e9be79704d7bb8b5fa', '微安 / μA', '49', 'function_unit', 'μA', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b954e80de7911e9be79704d7bb8b5fa', '毫安 / mA', '50', 'function_unit', 'mA', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b99af34de7911e9be79704d7bb8b5fa', '千安 / kA', '51', 'function_unit', 'kA', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7b9e3741de7911e9be79704d7bb8b5fa', '安培 / A', '52', 'function_unit', 'A', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ba29620de7911e9be79704d7bb8b5fa', '毫伏 / mV', '53', 'function_unit', 'mV', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ba71e61de7911e9be79704d7bb8b5fa', '伏特 / V', '54', 'function_unit', 'V', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bab7d0fde7911e9be79704d7bb8b5fa', '毫秒 / ms', '55', 'function_unit', 'ms', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bb0054dde7911e9be79704d7bb8b5fa', '秒 / s', '56', 'function_unit', 's', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bb463e2de7911e9be79704d7bb8b5fa', '分钟 / min', '57', 'function_unit', 'min', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bb8eb1fde7911e9be79704d7bb8b5fa', '小时 / h', '58', 'function_unit', 'h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bbd4a05de7911e9be79704d7bb8b5fa', '日 / day', '59', 'function_unit', 'day', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bc1d252de7911e9be79704d7bb8b5fa', '周 / week', '60', 'function_unit', 'week', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bc6328bde7911e9be79704d7bb8b5fa', '月 / month', '61', 'function_unit', 'month', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bcab81bde7911e9be79704d7bb8b5fa', '年 / year', '62', 'function_unit', 'year', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bcf1817de7911e9be79704d7bb8b5fa', '节 / kn', '63', 'function_unit', 'kn', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bd39fc8de7911e9be79704d7bb8b5fa', '千米每小时 / km/h', '64', 'function_unit', 'km/h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bd7ff17de7911e9be79704d7bb8b5fa', '米每秒 / m/s', '65', 'function_unit', 'm/s', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bdc8614de7911e9be79704d7bb8b5fa', '秒 / ″', '66', 'function_unit', '″', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7be0e41bde7911e9be79704d7bb8b5fa', '分 / ′', '67', 'function_unit', '′', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7be56d4dde7911e9be79704d7bb8b5fa', '度 / °', '68', 'function_unit', '°', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7be9ce13de7911e9be79704d7bb8b5fa', '弧度 / rad', '69', 'function_unit', 'rad', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bee5389de7911e9be79704d7bb8b5fa', '赫兹 / Hz', '70', 'function_unit', 'Hz', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bf2b569de7911e9be79704d7bb8b5fa', '微瓦 / μW', '71', 'function_unit', 'μW', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bf73a6fde7911e9be79704d7bb8b5fa', '毫瓦 / mW', '72', 'function_unit', 'mW', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7bfb9aefde7911e9be79704d7bb8b5fa', '千瓦特 / kW', '73', 'function_unit', 'kW', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c0021c8de7911e9be79704d7bb8b5fa', '瓦特 / W', '74', 'function_unit', 'W', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c048181de7911e9be79704d7bb8b5fa', '卡路里 / cal', '75', 'function_unit', 'cal', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c091a82de7911e9be79704d7bb8b5fa', '千瓦时 / kW·h', '76', 'function_unit', 'kW·h', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c0d6b5fde7911e9be79704d7bb8b5fa', '瓦时 / Wh', '77', 'function_unit', 'Wh', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c11ee90de7911e9be79704d7bb8b5fa', '电子伏 / eV', '78', 'function_unit', 'eV', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c164d3fde7911e9be79704d7bb8b5fa', '千焦 / kJ', '79', 'function_unit', 'kJ', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c1ad76ede7911e9be79704d7bb8b5fa', '焦耳 / J', '80', 'function_unit', 'J', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c1f35f3de7911e9be79704d7bb8b5fa', '华氏度 / ℉', '81', 'function_unit', '℉', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c23bcf0de7911e9be79704d7bb8b5fa', '开尔文 / K', '82', 'function_unit', 'K', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c29e57dde7911e9be79704d7bb8b5fa', '吨 / t', '83', 'function_unit', 't', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c2de5ebde7911e9be79704d7bb8b5fa', '摄氏度 / °C', '84', 'function_unit', '°C', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c324922de7911e9be79704d7bb8b5fa', '毫帕 / mPa', '85', 'function_unit', 'mPa', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c36cebbde7911e9be79704d7bb8b5fa', '百帕 / hPa', '86', 'function_unit', 'hPa', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c3b30d2de7911e9be79704d7bb8b5fa', '千帕 / kPa', '87', 'function_unit', 'kPa', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c3fc249de7911e9be79704d7bb8b5fa', '帕斯卡 / Pa', '88', 'function_unit', 'Pa', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c4418b3de7911e9be79704d7bb8b5fa', '毫克 / mg', '89', 'function_unit', 'mg', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c489c41de7911e9be79704d7bb8b5fa', '克 / g', '90', 'function_unit', 'g', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c4cff78de7911e9be79704d7bb8b5fa', '千克 / kg', '91', 'function_unit', 'kg', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c5183a7de7911e9be79704d7bb8b5fa', '牛 / N', '92', 'function_unit', 'N', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c55e631de7911e9be79704d7bb8b5fa', '毫升 / mL', '93', 'function_unit', 'mL', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c5a6ad3de7911e9be79704d7bb8b5fa', '升 / L', '94', 'function_unit', 'L', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c5ed080de7911e9be79704d7bb8b5fa', '立方毫米 / mm³', '95', 'function_unit', 'mm³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c635042de7911e9be79704d7bb8b5fa', '立方厘米 / cm³', '96', 'function_unit', 'cm³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c67b259de7911e9be79704d7bb8b5fa', '立方千米 / km³', '97', 'function_unit', 'km³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c6c346ade7911e9be79704d7bb8b5fa', '立方米 / m³', '98', 'function_unit', 'm³', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c709b97de7911e9be79704d7bb8b5fa', '公顷 / h㎡', '99', 'function_unit', 'h㎡', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c751eb2de7911e9be79704d7bb8b5fa', '平方厘米 / c㎡', '100', 'function_unit', 'c㎡', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c798058de7911e9be79704d7bb8b5fa', '平方毫米 / m㎡', '101', 'function_unit', 'm㎡', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c7e0313de7911e9be79704d7bb8b5fa', '平方千米 / k㎡', '102', 'function_unit', 'k㎡', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c8270e4de7911e9be79704d7bb8b5fa', '平方米 / ㎡', '103', 'function_unit', '㎡', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c86eb3dde7911e9be79704d7bb8b5fa', '纳米 / nm', '104', 'function_unit', 'nm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c8b4c60de7911e9be79704d7bb8b5fa', '微米 / μm', '105', 'function_unit', 'μm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c8fd196de7911e9be79704d7bb8b5fa', '毫米 / mm', '106', 'function_unit', 'mm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c9428c6de7911e9be79704d7bb8b5fa', '厘米 / cm', '107', 'function_unit', 'cm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c98b8ccde7911e9be79704d7bb8b5fa', '分米 / dm', '108', 'function_unit', 'dm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7c9d1029de7911e9be79704d7bb8b5fa', '千米 / km', '109', 'function_unit', 'km', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('7ca19fe8de7911e9be79704d7bb8b5fa', '米 / m', '110', 'function_unit', 'm', '功能数据显示单位');
INSERT INTO `sys_dict` VALUES ('8a6d590e71ef6c188520e316bc24ca49', 'ModbusTCP通信', '1', 'modbus_type', '1', 'Modbus通信协议类型');
INSERT INTO `sys_dict` VALUES ('e4016738de9711e9be79704d7bb8b5fa', 'int16', '0', 'data_type', 'int16', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e405f9e9de9711e9be79704d7bb8b5fa', 'uint16', '1', 'data_type', 'uint16', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e4097058de9711e9be79704d7bb8b5fa', 'int32', '2', 'data_type', 'int32', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e40d9c32de9711e9be79704d7bb8b5fa', 'uint32', '3', 'data_type', 'uint32', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e41111bade9711e9be79704d7bb8b5fa', 'int64', '4', 'data_type', 'int64', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e4153fa6de9711e9be79704d7bb8b5fa', 'uint64', '5', 'data_type', 'uint64', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e418b031de9711e9be79704d7bb8b5fa', 'float', '6', 'data_type', 'float', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e41cdec1de9711e9be79704d7bb8b5fa', 'double', '7', 'data_type', 'double', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e4205201de9711e9be79704d7bb8b5fa', 'string', '8', 'data_type', 'string', '原始数据类型');
INSERT INTO `sys_dict` VALUES ('e4248234de9711e9be79704d7bb8b5fa', 'bool', '9', 'data_type', 'bool', '原始数据类型');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('0266740b356c474e44faf3db5f5e5fed', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":55,\"name\":\"店铺类型\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '41', '0:0:0:0:0:0:0:1', '2020-03-22 07:56:00');
INSERT INTO `sys_log` VALUES ('06c496c03464cafd6bfe81d36f8a9a77', 'admin', '修改密码', 'com.wzlue.modules.sys.controller.SysUserController.password()', '[{\"password\":\"1\",\"newPassword\":\"1\"}]', '18', '0:0:0:0:0:0:0:1', '2019-09-17 23:00:11');
INSERT INTO `sys_log` VALUES ('0c1a33f73091e68d63c2a4672ea3b675', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '78', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('0d6df01dd618f84b2796678c16820e7a', 'admin', '修改菜单', 'com.wzlue.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":67,\"parentId\":0,\"name\":\"菜品管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":4}]', '64', '0:0:0:0:0:0:0:1', '2020-03-22 07:59:55');
INSERT INTO `sys_log` VALUES ('12e9f58d2348510c10230b90b6519d85', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":64,\"name\":\"个人标签\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":2}]', '42', '0:0:0:0:0:0:0:1', '2020-03-22 07:59:01');
INSERT INTO `sys_log` VALUES ('157542d775c3855f72fa3e4dcadc0635', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":81,\"parentId\":80,\"name\":\"店铺续费\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '68', '0:0:0:0:0:0:0:1', '2020-03-22 08:04:09');
INSERT INTO `sys_log` VALUES ('1b80dc8184d2f8e6d15af41356744ca0', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":77,\"parentId\":0,\"name\":\"营销管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '64', '0:0:0:0:0:0:0:1', '2020-03-22 08:02:35');
INSERT INTO `sys_log` VALUES ('1f84eca25d9da829520827d54d5f46b3', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":83,\"parentId\":80,\"name\":\"营销续费\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '42', '0:0:0:0:0:0:0:1', '2020-03-22 08:04:27');
INSERT INTO `sys_log` VALUES ('20344e811b69030436b2f9b2483d6958', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":74,\"parentId\":0,\"name\":\"消息预警\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '61', '0:0:0:0:0:0:0:1', '2020-03-22 08:01:55');
INSERT INTO `sys_log` VALUES ('26f526a7159be459c9e06aa6158f2ca2', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":0,\"name\":\"店铺内部\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":2}]', '52', '0:0:0:0:0:0:0:1', '2020-03-22 07:56:27');
INSERT INTO `sys_log` VALUES ('33296a2d00a7fc99aa3721f69974f40a', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":80,\"parentId\":0,\"name\":\"店铺订单\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '58', '0:0:0:0:0:0:0:1', '2020-03-22 08:03:37');
INSERT INTO `sys_log` VALUES ('36e02f64f9c3915bfb301af5ecbd21ab', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5479', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('37b1dcca4d01ffe741deaf48a18f0b26', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5486', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('499fe1a3405ee69e653d97df359a7617', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"岗位管理\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '59', '0:0:0:0:0:0:0:1', '2020-03-22 07:57:08');
INSERT INTO `sys_log` VALUES ('53aa6870d44f5f46c2fd74a97c362f7c', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '123', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('5e2cce5f93dedda8fd0bed37ed388af0', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":71,\"parentId\":70,\"name\":\"预订菜单\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '49', '0:0:0:0:0:0:0:1', '2020-03-22 08:01:08');
INSERT INTO `sys_log` VALUES ('5f1f35f87f221e5c12d793be142c952b', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":82,\"parentId\":80,\"name\":\"推销续费\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '68', '0:0:0:0:0:0:0:1', '2020-03-22 08:04:18');
INSERT INTO `sys_log` VALUES ('64a25fdec19c6ec76a7af7ce1294caf9', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '99', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('67b745116b786f159f7c3ea94b75c1f9', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":67,\"name\":\"单品\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '61', '0:0:0:0:0:0:0:1', '2020-03-22 07:59:37');
INSERT INTO `sys_log` VALUES ('76544d0ca86cfff4c262d12450f7773e', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":75,\"parentId\":0,\"name\":\"投诉管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '41', '0:0:0:0:0:0:0:1', '2020-03-22 08:02:10');
INSERT INTO `sys_log` VALUES ('7796750682025de94263fe9b8e33dfb7', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":67,\"name\":\"套餐\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":2}]', '58', '0:0:0:0:0:0:0:1', '2020-03-22 08:00:16');
INSERT INTO `sys_log` VALUES ('785a10514657142022dc9037dfba1828', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":76,\"parentId\":0,\"name\":\"评价管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '62', '0:0:0:0:0:0:0:1', '2020-03-22 08:02:21');
INSERT INTO `sys_log` VALUES ('7ca6c06fd63e1073d41c0d52ccb4d930', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":64,\"name\":\"店铺标签\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '67', '0:0:0:0:0:0:0:1', '2020-03-22 07:58:50');
INSERT INTO `sys_log` VALUES ('7f1758f472952c99318d5360aee4c6c9', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"店铺详情\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '40', '0:0:0:0:0:0:0:1', '2020-03-22 07:56:50');
INSERT INTO `sys_log` VALUES ('8ee1aea22cc7b06cea0997b8fda44c10', 'admin', '修改菜单', 'com.wzlue.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1}]', '44', '0:0:0:0:0:0:0:1', '2019-09-19 17:14:24');
INSERT INTO `sys_log` VALUES ('906527791e27dd91c69744b22a476cba', 'admin', '修改菜单', 'com.wzlue.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":0,\"name\":\"店铺管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":1}]', '50', '0:0:0:0:0:0:0:1', '2020-03-22 07:55:31');
INSERT INTO `sys_log` VALUES ('93c144ad3662add4e5991ffed2189ac2', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":84,\"parentId\":55,\"name\":\"部门管理\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '56', '0:0:0:0:0:0:0:1', '2020-03-22 08:05:19');
INSERT INTO `sys_log` VALUES ('9466595214b812fb85655c80f69f7e16', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]', '54', '0:0:0:0:0:0:0:1', '2019-09-19 17:13:58');
INSERT INTO `sys_log` VALUES ('a51cbc70bc044c8b6ac828358aa7bd42', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"标签管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":3}]', '64', '0:0:0:0:0:0:0:1', '2020-03-22 07:58:29');
INSERT INTO `sys_log` VALUES ('a644fdddfa234f7fdae8746c7f1870a6', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":73,\"parentId\":0,\"name\":\"财务管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '77', '0:0:0:0:0:0:0:1', '2020-03-22 08:01:41');
INSERT INTO `sys_log` VALUES ('a8c75487cc536d16d39941340eeca19c', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":58,\"name\":\"员工管理\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '60', '0:0:0:0:0:0:0:1', '2020-03-22 07:57:17');
INSERT INTO `sys_log` VALUES ('a911c28f204e88e89fc23a201a93d82c', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5437', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('abc45ace1c0b2a34068fb20e6602174c', 'admin', '修改菜单', 'com.wqfang.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":90,\"parentId\":63,\"name\":\"餐桌管理\",\"url\":\"table/board-region\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]', '59', '0:0:0:0:0:0:0:1', '2020-03-24 22:44:12');
INSERT INTO `sys_log` VALUES ('b0b62cae807d0a1b074d79f7dbd7c9eb', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5486', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('be87b73d67fa8eabf470ea41c6453856', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":0,\"name\":\"订单管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '85', '0:0:0:0:0:0:0:1', '2020-03-22 08:00:42');
INSERT INTO `sys_log` VALUES ('bf68702c579cb8feb6b6c2ce6a64f629', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":58,\"name\":\"服务设施\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', '50', '0:0:0:0:0:0:0:1', '2020-03-22 07:57:32');
INSERT INTO `sys_log` VALUES ('c1b5eed092d41e8adad3da5d0e0eee27', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5486', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('c7c6ff3258ba1153e8f4a71713f09b13', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":78,\"parentId\":0,\"name\":\"留言管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '73', '0:0:0:0:0:0:0:1', '2020-03-22 08:02:56');
INSERT INTO `sys_log` VALUES ('ce883de4123bbc5d061b4b1c20c2bd8a', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":55,\"name\":\"店铺列表\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '41', '0:0:0:0:0:0:0:1', '2020-03-22 07:55:49');
INSERT INTO `sys_log` VALUES ('d0fd7fe1b6136155097126b804ea2536', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":79,\"parentId\":0,\"name\":\"消息管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}]', '65', '0:0:0:0:0:0:0:1', '2020-03-22 08:03:24');
INSERT INTO `sys_log` VALUES ('d745f5dfaff44b601e4e66b08a9ab33c', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":58,\"name\":\"餐桌配置\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":2}]', '78', '0:0:0:0:0:0:0:1', '2020-03-22 07:58:05');
INSERT INTO `sys_log` VALUES ('df1d2ac4055d31a7aaeae4e621a1ac19', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":64,\"name\":\"菜品管理\",\"url\":\"#\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":4}]', '54', '0:0:0:0:0:0:0:1', '2020-03-22 07:59:21');
INSERT INTO `sys_log` VALUES ('dfbaf2fc3ac5fcdbf073f252a0c9fa21', 'admin', '修改用户', 'com.wzlue.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', '5486', '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('e8a07aba563d300ce980949ed1660876', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":0,\"name\":\"店铺管理\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '55', '0:0:0:0:0:0:0:1', '2020-03-22 07:54:37');
INSERT INTO `sys_log` VALUES ('f6f051d5168b3a25ac5033335cdfb057', 'admin', '保存菜单', 'com.wzlue.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":70,\"name\":\"菜品菜单\",\"url\":\"#\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '65', '0:0:0:0:0:0:0:1', '2020-03-22 08:01:25');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '1');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'http://localhost:8080/wzlue-factory/druid/sql.html', null, '1', 'sql', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'job/schedule', null, '1', 'job', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'oss/oss', 'sys:oss:all', '1', 'oss', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '数据字典', 'sys/dict', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('36', '0', '设备管理', '', '', '0', 'system', '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '产品', 'product/base', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('38', '37', '查看', null, 'product:base:list,product:base:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '37', '新增', null, 'product:base:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '37', '修改', null, 'product:base:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '37', '删除', null, 'product:base:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('42', '36', '设备', 'product/devicebase', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('43', '42', '查看', null, 'product:devicebase:list,product:devicebase:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '42', '新增', null, 'product:devicebase:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '42', '修改', null, 'product:devicebase:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '42', '删除', null, 'product:devicebase:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('47', '37', '查看', null, 'product:fctbase:list,product:fctbase:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '37', '新增', null, 'product:fctbase:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('49', '37', '修改', null, 'product:fctbase:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '37', '删除', null, 'product:fctbase:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('51', '37', '查看', null, 'product:fctextendagreement:list,product:fctextendagreement:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '37', '新增', null, 'product:fctextendagreement:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('53', '37', '修改', null, 'product:fctextendagreement:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('54', '37', '删除', null, 'product:fctextendagreement:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('55', '0', '店铺管理', '#', '', '0', '', '1');
INSERT INTO `sys_menu` VALUES ('56', '55', '店铺列表', '#', '', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('57', '55', '店铺类型', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '0', '店铺内部', '#', '', '0', '', '2');
INSERT INTO `sys_menu` VALUES ('59', '58', '店铺详情', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '58', '岗位管理', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('61', '58', '员工管理', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('62', '58', '服务设施', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '58', '餐桌配置', '#', '', '0', '', '2');
INSERT INTO `sys_menu` VALUES ('64', '0', '标签管理', '#', '', '0', '', '3');
INSERT INTO `sys_menu` VALUES ('65', '64', '店铺标签', '#', '', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('66', '64', '个人标签', '#', '', '1', '', '2');
INSERT INTO `sys_menu` VALUES ('67', '0', '菜品管理', '#', '', '0', '', '4');
INSERT INTO `sys_menu` VALUES ('68', '67', '单品', '#', '', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('69', '67', '套餐', '#', '', '1', '', '2');
INSERT INTO `sys_menu` VALUES ('70', '0', '订单管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '70', '预订菜单', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '70', '菜品菜单', '#', '', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('73', '0', '财务管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('74', '0', '消息预警', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('75', '0', '投诉管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('76', '0', '评价管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('77', '0', '营销管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('78', '0', '留言管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('79', '0', '消息管理', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('80', '0', '店铺订单', '#', '', '0', '', '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '店铺续费', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '推销续费', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '营销续费', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('84', '55', '部门管理', '#', '', '1', '', '0');
INSERT INTO `sys_menu` VALUES ('85', '1', '文件资源', 'source/source', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('86', '85', '查看', null, 'source:source:list,source:source:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('87', '85', '新增', null, 'source:source:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('88', '85', '修改', null, 'source:source:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('89', '85', '删除', null, 'source:source:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('90', '63', '餐桌管理', 'table/board-region', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('91', '90', '查看', null, 'table:board:list,table:board:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('92', '90', '新增', null, 'table:board:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('93', '90', '修改', null, 'table:board:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('94', '90', '删除', null, 'table:board:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('95', '63', '区域管理', 'table/region', null, '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('96', '95', '查看', null, 'table:region:list,table:region:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('97', '95', '新增', null, 'table:region:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('98', '95', '修改', null, 'table:region:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('99', '95', '删除', null, 'table:region:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'eb1c924d2631f6930d2bdcad28bee62d', '2020-03-25 10:44:29', '2020-03-24 22:44:29');

-- ----------------------------
-- Table structure for table_board
-- ----------------------------
DROP TABLE IF EXISTS `table_board`;
CREATE TABLE `table_board` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '餐桌Id',
  `table_name` varchar(255) DEFAULT NULL COMMENT '餐桌名称',
  `table_num` varchar(255) DEFAULT NULL COMMENT '餐桌编码',
  `table_people_num` int(50) DEFAULT NULL COMMENT '容纳人数',
  `table_is_flag` bigint(10) DEFAULT NULL COMMENT '是否有效',
  `table_service_charge` decimal(10,2) DEFAULT NULL COMMENT '服务费',
  `table_food_count` int(255) DEFAULT NULL COMMENT '起点彩品数量',
  `table_min_charge` decimal(50,2) DEFAULT NULL COMMENT '最低消费',
  `table_status` int(50) DEFAULT NULL COMMENT '餐桌状态',
  `extends_table_type` varchar(255) DEFAULT NULL COMMENT '扩展表类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐桌表';

-- ----------------------------
-- Records of table_board
-- ----------------------------

-- ----------------------------
-- Table structure for table_region
-- ----------------------------
DROP TABLE IF EXISTS `table_region`;
CREATE TABLE `table_region` (
  `region_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `region_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `region_service_charge` decimal(10,2) DEFAULT NULL COMMENT '服务费用',
  `region_min_charge` decimal(10,2) DEFAULT NULL COMMENT '最低消费',
  `region_front_account` bigint(5) DEFAULT NULL COMMENT '开启餐前结账',
  `region_qr` bigint(5) DEFAULT NULL COMMENT '扫码点餐验证码',
  `region_seat_num` varchar(255) DEFAULT NULL COMMENT '座位数',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `modify_time` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `extend_type` varchar(255) DEFAULT NULL COMMENT '扩展表类型',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='餐桌区域表';

-- ----------------------------
-- Records of table_region
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
