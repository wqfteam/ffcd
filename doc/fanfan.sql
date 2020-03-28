/*
Navicat MySQL Data Transfer

Source Server         : localhost1
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : fanfan

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2020-03-12 21:50:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `userid` bigint(21) NOT NULL COMMENT '店长ID',
  `name` varchar(100) NOT NULL COMMENT '店铺名字',
  `tel` varchar(100) NOT NULL COMMENT '联系电话',
  `hotelpic` varchar(100) DEFAULT NULL COMMENT '店铺图片',
  `introduce` text NOT NULL COMMENT '店铺介绍',
  `startime` datetime DEFAULT NULL COMMENT '营业开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '营业结束时间',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `county` varchar(255) DEFAULT NULL COMMENT '县区',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `longitude` varchar(255) NOT NULL COMMENT '经度',
  `latitude` varchar(255) NOT NULL COMMENT '纬度',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------

-- ----------------------------
-- Table structure for h_management_type
-- ----------------------------
DROP TABLE IF EXISTS `h_management_type`;
CREATE TABLE `h_management_type` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `tyname` varchar(100) NOT NULL COMMENT '经营类型名字',
  `pid` bigint(11) DEFAULT NULL COMMENT '上级ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'OSUBP1O3GGILYKL1578238707175', '1578239545866', '15000');

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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_areas
-- ----------------------------
DROP TABLE IF EXISTS `sys_areas`;
CREATE TABLE `sys_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(20) NOT NULL,
  `area` varchar(50) NOT NULL,
  `cityid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Records of sys_areas
-- ----------------------------
INSERT INTO `sys_areas` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `sys_areas` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `sys_areas` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `sys_areas` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `sys_areas` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `sys_areas` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `sys_areas` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `sys_areas` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `sys_areas` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `sys_areas` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `sys_areas` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `sys_areas` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `sys_areas` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `sys_areas` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `sys_areas` VALUES ('17', '110228', '密云区', '110100');
INSERT INTO `sys_areas` VALUES ('18', '110229', '延庆区', '110100');
INSERT INTO `sys_areas` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `sys_areas` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `sys_areas` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `sys_areas` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `sys_areas` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `sys_areas` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `sys_areas` VALUES ('25', '120107', '滨海新区', '120100');
INSERT INTO `sys_areas` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `sys_areas` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `sys_areas` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `sys_areas` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `sys_areas` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `sys_areas` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `sys_areas` VALUES ('34', '120221', '宁河区', '120100');
INSERT INTO `sys_areas` VALUES ('35', '120223', '静海区', '120100');
INSERT INTO `sys_areas` VALUES ('36', '120225', '蓟州区', '120100');
INSERT INTO `sys_areas` VALUES ('37', '130101', '市辖区', '130100');
INSERT INTO `sys_areas` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `sys_areas` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `sys_areas` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `sys_areas` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `sys_areas` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `sys_areas` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `sys_areas` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `sys_areas` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `sys_areas` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `sys_areas` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `sys_areas` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `sys_areas` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `sys_areas` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `sys_areas` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `sys_areas` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `sys_areas` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `sys_areas` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `sys_areas` VALUES ('55', '130133', '赵　县', '130100');
INSERT INTO `sys_areas` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `sys_areas` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `sys_areas` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `sys_areas` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `sys_areas` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `sys_areas` VALUES ('61', '130201', '市辖区', '130200');
INSERT INTO `sys_areas` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `sys_areas` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `sys_areas` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `sys_areas` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `sys_areas` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `sys_areas` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `sys_areas` VALUES ('68', '130223', '滦　县', '130200');
INSERT INTO `sys_areas` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `sys_areas` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `sys_areas` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `sys_areas` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `sys_areas` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `sys_areas` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `sys_areas` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `sys_areas` VALUES ('76', '130301', '市辖区', '130300');
INSERT INTO `sys_areas` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `sys_areas` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `sys_areas` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `sys_areas` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `sys_areas` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `sys_areas` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `sys_areas` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `sys_areas` VALUES ('84', '130401', '市辖区', '130400');
INSERT INTO `sys_areas` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `sys_areas` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `sys_areas` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `sys_areas` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `sys_areas` VALUES ('89', '130421', '邯郸县', '130400');
INSERT INTO `sys_areas` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `sys_areas` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `sys_areas` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `sys_areas` VALUES ('93', '130426', '涉　县', '130400');
INSERT INTO `sys_areas` VALUES ('94', '130427', '磁　县', '130400');
INSERT INTO `sys_areas` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `sys_areas` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `sys_areas` VALUES ('97', '130430', '邱　县', '130400');
INSERT INTO `sys_areas` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `sys_areas` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `sys_areas` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `sys_areas` VALUES ('101', '130434', '魏　县', '130400');
INSERT INTO `sys_areas` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `sys_areas` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `sys_areas` VALUES ('104', '130501', '市辖区', '130500');
INSERT INTO `sys_areas` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `sys_areas` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `sys_areas` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `sys_areas` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `sys_areas` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `sys_areas` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `sys_areas` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `sys_areas` VALUES ('112', '130526', '任　县', '130500');
INSERT INTO `sys_areas` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `sys_areas` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `sys_areas` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `sys_areas` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `sys_areas` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `sys_areas` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `sys_areas` VALUES ('119', '130533', '威　县', '130500');
INSERT INTO `sys_areas` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `sys_areas` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `sys_areas` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `sys_areas` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `sys_areas` VALUES ('124', '130601', '市辖区', '130600');
INSERT INTO `sys_areas` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `sys_areas` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `sys_areas` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `sys_areas` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `sys_areas` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `sys_areas` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `sys_areas` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `sys_areas` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `sys_areas` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `sys_areas` VALUES ('134', '130627', '唐　县', '130600');
INSERT INTO `sys_areas` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `sys_areas` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `sys_areas` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `sys_areas` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `sys_areas` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `sys_areas` VALUES ('140', '130633', '易　县', '130600');
INSERT INTO `sys_areas` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `sys_areas` VALUES ('142', '130635', '蠡　县', '130600');
INSERT INTO `sys_areas` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `sys_areas` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `sys_areas` VALUES ('145', '130638', '雄　县', '130600');
INSERT INTO `sys_areas` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `sys_areas` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `sys_areas` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `sys_areas` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `sys_areas` VALUES ('150', '130701', '市辖区', '130700');
INSERT INTO `sys_areas` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `sys_areas` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `sys_areas` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `sys_areas` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `sys_areas` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `sys_areas` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `sys_areas` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `sys_areas` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `sys_areas` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `sys_areas` VALUES ('160', '130726', '蔚　县', '130700');
INSERT INTO `sys_areas` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `sys_areas` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `sys_areas` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `sys_areas` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `sys_areas` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `sys_areas` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `sys_areas` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `sys_areas` VALUES ('168', '130801', '市辖区', '130800');
INSERT INTO `sys_areas` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `sys_areas` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `sys_areas` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `sys_areas` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `sys_areas` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `sys_areas` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `sys_areas` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `sys_areas` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `sys_areas` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `sys_areas` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `sys_areas` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `sys_areas` VALUES ('180', '130901', '市辖区', '130900');
INSERT INTO `sys_areas` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `sys_areas` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `sys_areas` VALUES ('183', '130921', '沧　县', '130900');
INSERT INTO `sys_areas` VALUES ('184', '130922', '青　县', '130900');
INSERT INTO `sys_areas` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `sys_areas` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `sys_areas` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `sys_areas` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `sys_areas` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `sys_areas` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `sys_areas` VALUES ('191', '130929', '献　县', '130900');
INSERT INTO `sys_areas` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `sys_areas` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `sys_areas` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `sys_areas` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `sys_areas` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `sys_areas` VALUES ('197', '131001', '市辖区', '131000');
INSERT INTO `sys_areas` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `sys_areas` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `sys_areas` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `sys_areas` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `sys_areas` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `sys_areas` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `sys_areas` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `sys_areas` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `sys_areas` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `sys_areas` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `sys_areas` VALUES ('208', '131101', '市辖区', '131100');
INSERT INTO `sys_areas` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `sys_areas` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `sys_areas` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `sys_areas` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `sys_areas` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `sys_areas` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `sys_areas` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `sys_areas` VALUES ('216', '131127', '景　县', '131100');
INSERT INTO `sys_areas` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `sys_areas` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `sys_areas` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `sys_areas` VALUES ('220', '140101', '市辖区', '140100');
INSERT INTO `sys_areas` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `sys_areas` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `sys_areas` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `sys_areas` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `sys_areas` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `sys_areas` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `sys_areas` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `sys_areas` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `sys_areas` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `sys_areas` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `sys_areas` VALUES ('231', '140201', '市辖区', '140200');
INSERT INTO `sys_areas` VALUES ('232', '140202', '城　区', '140200');
INSERT INTO `sys_areas` VALUES ('233', '140203', '矿　区', '140200');
INSERT INTO `sys_areas` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `sys_areas` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `sys_areas` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `sys_areas` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `sys_areas` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `sys_areas` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `sys_areas` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `sys_areas` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `sys_areas` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `sys_areas` VALUES ('243', '140301', '市辖区', '140300');
INSERT INTO `sys_areas` VALUES ('244', '140302', '城　区', '140300');
INSERT INTO `sys_areas` VALUES ('245', '140303', '矿　区', '140300');
INSERT INTO `sys_areas` VALUES ('246', '140311', '郊　区', '140300');
INSERT INTO `sys_areas` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `sys_areas` VALUES ('248', '140322', '盂　县', '140300');
INSERT INTO `sys_areas` VALUES ('249', '140401', '市辖区', '140400');
INSERT INTO `sys_areas` VALUES ('250', '140402', '城　区', '140400');
INSERT INTO `sys_areas` VALUES ('251', '140411', '郊　区', '140400');
INSERT INTO `sys_areas` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `sys_areas` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `sys_areas` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `sys_areas` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `sys_areas` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `sys_areas` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `sys_areas` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `sys_areas` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `sys_areas` VALUES ('260', '140430', '沁　县', '140400');
INSERT INTO `sys_areas` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `sys_areas` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `sys_areas` VALUES ('263', '140501', '市辖区', '140500');
INSERT INTO `sys_areas` VALUES ('264', '140502', '城　区', '140500');
INSERT INTO `sys_areas` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `sys_areas` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `sys_areas` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `sys_areas` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `sys_areas` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `sys_areas` VALUES ('270', '140601', '市辖区', '140600');
INSERT INTO `sys_areas` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `sys_areas` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `sys_areas` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `sys_areas` VALUES ('274', '140622', '应　县', '140600');
INSERT INTO `sys_areas` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `sys_areas` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `sys_areas` VALUES ('277', '140701', '市辖区', '140700');
INSERT INTO `sys_areas` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `sys_areas` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `sys_areas` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `sys_areas` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `sys_areas` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `sys_areas` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `sys_areas` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `sys_areas` VALUES ('285', '140727', '祁　县', '140700');
INSERT INTO `sys_areas` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `sys_areas` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `sys_areas` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `sys_areas` VALUES ('289', '140801', '市辖区', '140800');
INSERT INTO `sys_areas` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `sys_areas` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `sys_areas` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `sys_areas` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `sys_areas` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `sys_areas` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `sys_areas` VALUES ('296', '140826', '绛　县', '140800');
INSERT INTO `sys_areas` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `sys_areas` VALUES ('298', '140828', '夏　县', '140800');
INSERT INTO `sys_areas` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `sys_areas` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `sys_areas` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `sys_areas` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `sys_areas` VALUES ('303', '140901', '市辖区', '140900');
INSERT INTO `sys_areas` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `sys_areas` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `sys_areas` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `sys_areas` VALUES ('307', '140923', '代　县', '140900');
INSERT INTO `sys_areas` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `sys_areas` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `sys_areas` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `sys_areas` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `sys_areas` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `sys_areas` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `sys_areas` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `sys_areas` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `sys_areas` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `sys_areas` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `sys_areas` VALUES ('318', '141001', '市辖区', '141000');
INSERT INTO `sys_areas` VALUES ('319', '141002', '尧都区', '141000');
INSERT INTO `sys_areas` VALUES ('320', '141021', '曲沃县', '141000');
INSERT INTO `sys_areas` VALUES ('321', '141022', '翼城县', '141000');
INSERT INTO `sys_areas` VALUES ('322', '141023', '襄汾县', '141000');
INSERT INTO `sys_areas` VALUES ('323', '141024', '洪洞县', '141000');
INSERT INTO `sys_areas` VALUES ('324', '141025', '古　县', '141000');
INSERT INTO `sys_areas` VALUES ('325', '141026', '安泽县', '141000');
INSERT INTO `sys_areas` VALUES ('326', '141027', '浮山县', '141000');
INSERT INTO `sys_areas` VALUES ('327', '141028', '吉　县', '141000');
INSERT INTO `sys_areas` VALUES ('328', '141029', '乡宁县', '141000');
INSERT INTO `sys_areas` VALUES ('329', '141030', '大宁县', '141000');
INSERT INTO `sys_areas` VALUES ('330', '141031', '隰　县', '141000');
INSERT INTO `sys_areas` VALUES ('331', '141032', '永和县', '141000');
INSERT INTO `sys_areas` VALUES ('332', '141033', '蒲　县', '141000');
INSERT INTO `sys_areas` VALUES ('333', '141034', '汾西县', '141000');
INSERT INTO `sys_areas` VALUES ('334', '141081', '侯马市', '141000');
INSERT INTO `sys_areas` VALUES ('335', '141082', '霍州市', '141000');
INSERT INTO `sys_areas` VALUES ('336', '141101', '市辖区', '141100');
INSERT INTO `sys_areas` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `sys_areas` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `sys_areas` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `sys_areas` VALUES ('340', '141123', '兴　县', '141100');
INSERT INTO `sys_areas` VALUES ('341', '141124', '临　县', '141100');
INSERT INTO `sys_areas` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `sys_areas` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `sys_areas` VALUES ('344', '141127', '岚　县', '141100');
INSERT INTO `sys_areas` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `sys_areas` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `sys_areas` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `sys_areas` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `sys_areas` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `sys_areas` VALUES ('350', '150101', '市辖区', '150100');
INSERT INTO `sys_areas` VALUES ('351', '150102', '新城区', '150100');
INSERT INTO `sys_areas` VALUES ('352', '150103', '回民区', '150100');
INSERT INTO `sys_areas` VALUES ('353', '150104', '玉泉区', '150100');
INSERT INTO `sys_areas` VALUES ('354', '150105', '赛罕区', '150100');
INSERT INTO `sys_areas` VALUES ('355', '150121', '土默特左旗', '150100');
INSERT INTO `sys_areas` VALUES ('356', '150122', '托克托县', '150100');
INSERT INTO `sys_areas` VALUES ('357', '150123', '和林格尔县', '150100');
INSERT INTO `sys_areas` VALUES ('358', '150124', '清水河县', '150100');
INSERT INTO `sys_areas` VALUES ('359', '150125', '武川县', '150100');
INSERT INTO `sys_areas` VALUES ('360', '150201', '市辖区', '150200');
INSERT INTO `sys_areas` VALUES ('361', '150202', '东河区', '150200');
INSERT INTO `sys_areas` VALUES ('362', '150203', '昆都仑区', '150200');
INSERT INTO `sys_areas` VALUES ('363', '150204', '青山区', '150200');
INSERT INTO `sys_areas` VALUES ('364', '150205', '石拐区', '150200');
INSERT INTO `sys_areas` VALUES ('365', '150206', '白云矿区', '150200');
INSERT INTO `sys_areas` VALUES ('366', '150207', '九原区', '150200');
INSERT INTO `sys_areas` VALUES ('367', '150221', '土默特右旗', '150200');
INSERT INTO `sys_areas` VALUES ('368', '150222', '固阳县', '150200');
INSERT INTO `sys_areas` VALUES ('369', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `sys_areas` VALUES ('370', '150301', '市辖区', '150300');
INSERT INTO `sys_areas` VALUES ('371', '150302', '海勃湾区', '150300');
INSERT INTO `sys_areas` VALUES ('372', '150303', '海南区', '150300');
INSERT INTO `sys_areas` VALUES ('373', '150304', '乌达区', '150300');
INSERT INTO `sys_areas` VALUES ('374', '150401', '市辖区', '150400');
INSERT INTO `sys_areas` VALUES ('375', '150402', '红山区', '150400');
INSERT INTO `sys_areas` VALUES ('376', '150403', '元宝山区', '150400');
INSERT INTO `sys_areas` VALUES ('377', '150404', '松山区', '150400');
INSERT INTO `sys_areas` VALUES ('378', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `sys_areas` VALUES ('379', '150422', '巴林左旗', '150400');
INSERT INTO `sys_areas` VALUES ('380', '150423', '巴林右旗', '150400');
INSERT INTO `sys_areas` VALUES ('381', '150424', '林西县', '150400');
INSERT INTO `sys_areas` VALUES ('382', '150425', '克什克腾旗', '150400');
INSERT INTO `sys_areas` VALUES ('383', '150426', '翁牛特旗', '150400');
INSERT INTO `sys_areas` VALUES ('384', '150428', '喀喇沁旗', '150400');
INSERT INTO `sys_areas` VALUES ('385', '150429', '宁城县', '150400');
INSERT INTO `sys_areas` VALUES ('386', '150430', '敖汉旗', '150400');
INSERT INTO `sys_areas` VALUES ('387', '150501', '市辖区', '150500');
INSERT INTO `sys_areas` VALUES ('388', '150502', '科尔沁区', '150500');
INSERT INTO `sys_areas` VALUES ('389', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `sys_areas` VALUES ('390', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `sys_areas` VALUES ('391', '150523', '开鲁县', '150500');
INSERT INTO `sys_areas` VALUES ('392', '150524', '库伦旗', '150500');
INSERT INTO `sys_areas` VALUES ('393', '150525', '奈曼旗', '150500');
INSERT INTO `sys_areas` VALUES ('394', '150526', '扎鲁特旗', '150500');
INSERT INTO `sys_areas` VALUES ('395', '150581', '霍林郭勒市', '150500');
INSERT INTO `sys_areas` VALUES ('396', '150602', '东胜区', '150600');
INSERT INTO `sys_areas` VALUES ('397', '150621', '达拉特旗', '150600');
INSERT INTO `sys_areas` VALUES ('398', '150622', '准格尔旗', '150600');
INSERT INTO `sys_areas` VALUES ('399', '150623', '鄂托克前旗', '150600');
INSERT INTO `sys_areas` VALUES ('400', '150624', '鄂托克旗', '150600');
INSERT INTO `sys_areas` VALUES ('401', '150625', '杭锦旗', '150600');
INSERT INTO `sys_areas` VALUES ('402', '150626', '乌审旗', '150600');
INSERT INTO `sys_areas` VALUES ('403', '150627', '伊金霍洛旗', '150600');
INSERT INTO `sys_areas` VALUES ('404', '150701', '市辖区', '150700');
INSERT INTO `sys_areas` VALUES ('405', '150702', '海拉尔区', '150700');
INSERT INTO `sys_areas` VALUES ('406', '150721', '阿荣旗', '150700');
INSERT INTO `sys_areas` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `sys_areas` VALUES ('408', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `sys_areas` VALUES ('409', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `sys_areas` VALUES ('410', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `sys_areas` VALUES ('411', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `sys_areas` VALUES ('412', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `sys_areas` VALUES ('413', '150781', '满洲里市', '150700');
INSERT INTO `sys_areas` VALUES ('414', '150782', '牙克石市', '150700');
INSERT INTO `sys_areas` VALUES ('415', '150783', '扎兰屯市', '150700');
INSERT INTO `sys_areas` VALUES ('416', '150784', '额尔古纳市', '150700');
INSERT INTO `sys_areas` VALUES ('417', '150785', '根河市', '150700');
INSERT INTO `sys_areas` VALUES ('418', '150801', '市辖区', '150800');
INSERT INTO `sys_areas` VALUES ('419', '150802', '临河区', '150800');
INSERT INTO `sys_areas` VALUES ('420', '150821', '五原县', '150800');
INSERT INTO `sys_areas` VALUES ('421', '150822', '磴口县', '150800');
INSERT INTO `sys_areas` VALUES ('422', '150823', '乌拉特前旗', '150800');
INSERT INTO `sys_areas` VALUES ('423', '150824', '乌拉特中旗', '150800');
INSERT INTO `sys_areas` VALUES ('424', '150825', '乌拉特后旗', '150800');
INSERT INTO `sys_areas` VALUES ('425', '150826', '杭锦后旗', '150800');
INSERT INTO `sys_areas` VALUES ('426', '150901', '市辖区', '150900');
INSERT INTO `sys_areas` VALUES ('427', '150902', '集宁区', '150900');
INSERT INTO `sys_areas` VALUES ('428', '150921', '卓资县', '150900');
INSERT INTO `sys_areas` VALUES ('429', '150922', '化德县', '150900');
INSERT INTO `sys_areas` VALUES ('430', '150923', '商都县', '150900');
INSERT INTO `sys_areas` VALUES ('431', '150924', '兴和县', '150900');
INSERT INTO `sys_areas` VALUES ('432', '150925', '凉城县', '150900');
INSERT INTO `sys_areas` VALUES ('433', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `sys_areas` VALUES ('434', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `sys_areas` VALUES ('435', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `sys_areas` VALUES ('436', '150929', '四子王旗', '150900');
INSERT INTO `sys_areas` VALUES ('437', '150981', '丰镇市', '150900');
INSERT INTO `sys_areas` VALUES ('438', '152201', '乌兰浩特市', '152200');
INSERT INTO `sys_areas` VALUES ('439', '152202', '阿尔山市', '152200');
INSERT INTO `sys_areas` VALUES ('440', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `sys_areas` VALUES ('441', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `sys_areas` VALUES ('442', '152223', '扎赉特旗', '152200');
INSERT INTO `sys_areas` VALUES ('443', '152224', '突泉县', '152200');
INSERT INTO `sys_areas` VALUES ('444', '152501', '二连浩特市', '152500');
INSERT INTO `sys_areas` VALUES ('445', '152502', '锡林浩特市', '152500');
INSERT INTO `sys_areas` VALUES ('446', '152522', '阿巴嘎旗', '152500');
INSERT INTO `sys_areas` VALUES ('447', '152523', '苏尼特左旗', '152500');
INSERT INTO `sys_areas` VALUES ('448', '152524', '苏尼特右旗', '152500');
INSERT INTO `sys_areas` VALUES ('449', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `sys_areas` VALUES ('450', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `sys_areas` VALUES ('451', '152527', '太仆寺旗', '152500');
INSERT INTO `sys_areas` VALUES ('452', '152528', '镶黄旗', '152500');
INSERT INTO `sys_areas` VALUES ('453', '152529', '正镶白旗', '152500');
INSERT INTO `sys_areas` VALUES ('454', '152530', '正蓝旗', '152500');
INSERT INTO `sys_areas` VALUES ('455', '152531', '多伦县', '152500');
INSERT INTO `sys_areas` VALUES ('456', '152921', '阿拉善左旗', '152900');
INSERT INTO `sys_areas` VALUES ('457', '152922', '阿拉善右旗', '152900');
INSERT INTO `sys_areas` VALUES ('458', '152923', '额济纳旗', '152900');
INSERT INTO `sys_areas` VALUES ('459', '210101', '市辖区', '210100');
INSERT INTO `sys_areas` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `sys_areas` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `sys_areas` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `sys_areas` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `sys_areas` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `sys_areas` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `sys_areas` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `sys_areas` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `sys_areas` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `sys_areas` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `sys_areas` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `sys_areas` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `sys_areas` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `sys_areas` VALUES ('473', '210201', '市辖区', '210200');
INSERT INTO `sys_areas` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `sys_areas` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `sys_areas` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `sys_areas` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `sys_areas` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `sys_areas` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `sys_areas` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `sys_areas` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `sys_areas` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `sys_areas` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `sys_areas` VALUES ('484', '210301', '市辖区', '210300');
INSERT INTO `sys_areas` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `sys_areas` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `sys_areas` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `sys_areas` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `sys_areas` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `sys_areas` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `sys_areas` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `sys_areas` VALUES ('492', '210401', '市辖区', '210400');
INSERT INTO `sys_areas` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `sys_areas` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `sys_areas` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `sys_areas` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `sys_areas` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `sys_areas` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `sys_areas` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `sys_areas` VALUES ('500', '210501', '市辖区', '210500');
INSERT INTO `sys_areas` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `sys_areas` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `sys_areas` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `sys_areas` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `sys_areas` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `sys_areas` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `sys_areas` VALUES ('507', '210601', '市辖区', '210600');
INSERT INTO `sys_areas` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `sys_areas` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `sys_areas` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `sys_areas` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `sys_areas` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `sys_areas` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `sys_areas` VALUES ('514', '210701', '市辖区', '210700');
INSERT INTO `sys_areas` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `sys_areas` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `sys_areas` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `sys_areas` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `sys_areas` VALUES ('519', '210727', '义　县', '210700');
INSERT INTO `sys_areas` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `sys_areas` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `sys_areas` VALUES ('522', '210801', '市辖区', '210800');
INSERT INTO `sys_areas` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `sys_areas` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `sys_areas` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `sys_areas` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `sys_areas` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `sys_areas` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `sys_areas` VALUES ('529', '210901', '市辖区', '210900');
INSERT INTO `sys_areas` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `sys_areas` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `sys_areas` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `sys_areas` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `sys_areas` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `sys_areas` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `sys_areas` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `sys_areas` VALUES ('537', '211001', '市辖区', '211000');
INSERT INTO `sys_areas` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `sys_areas` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `sys_areas` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `sys_areas` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `sys_areas` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `sys_areas` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `sys_areas` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `sys_areas` VALUES ('545', '211101', '市辖区', '211100');
INSERT INTO `sys_areas` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `sys_areas` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `sys_areas` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `sys_areas` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `sys_areas` VALUES ('550', '211201', '市辖区', '211200');
INSERT INTO `sys_areas` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `sys_areas` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `sys_areas` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `sys_areas` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `sys_areas` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `sys_areas` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `sys_areas` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `sys_areas` VALUES ('558', '211301', '市辖区', '211300');
INSERT INTO `sys_areas` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `sys_areas` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `sys_areas` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `sys_areas` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `sys_areas` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `sys_areas` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `sys_areas` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `sys_areas` VALUES ('566', '211401', '市辖区', '211400');
INSERT INTO `sys_areas` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `sys_areas` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `sys_areas` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `sys_areas` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `sys_areas` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `sys_areas` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `sys_areas` VALUES ('573', '220101', '市辖区', '220100');
INSERT INTO `sys_areas` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `sys_areas` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `sys_areas` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `sys_areas` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `sys_areas` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `sys_areas` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `sys_areas` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `sys_areas` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `sys_areas` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `sys_areas` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `sys_areas` VALUES ('584', '220201', '市辖区', '220200');
INSERT INTO `sys_areas` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `sys_areas` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `sys_areas` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `sys_areas` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `sys_areas` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `sys_areas` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `sys_areas` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `sys_areas` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `sys_areas` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `sys_areas` VALUES ('594', '220301', '市辖区', '220300');
INSERT INTO `sys_areas` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `sys_areas` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `sys_areas` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `sys_areas` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `sys_areas` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `sys_areas` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `sys_areas` VALUES ('601', '220401', '市辖区', '220400');
INSERT INTO `sys_areas` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `sys_areas` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `sys_areas` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `sys_areas` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `sys_areas` VALUES ('606', '220501', '市辖区', '220500');
INSERT INTO `sys_areas` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `sys_areas` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `sys_areas` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `sys_areas` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `sys_areas` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `sys_areas` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `sys_areas` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `sys_areas` VALUES ('614', '220601', '市辖区', '220600');
INSERT INTO `sys_areas` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `sys_areas` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `sys_areas` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `sys_areas` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `sys_areas` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `sys_areas` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `sys_areas` VALUES ('621', '220701', '市辖区', '220700');
INSERT INTO `sys_areas` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `sys_areas` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `sys_areas` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `sys_areas` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `sys_areas` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `sys_areas` VALUES ('627', '220801', '市辖区', '220800');
INSERT INTO `sys_areas` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `sys_areas` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `sys_areas` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `sys_areas` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `sys_areas` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `sys_areas` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `sys_areas` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `sys_areas` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `sys_areas` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `sys_areas` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `sys_areas` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `sys_areas` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `sys_areas` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `sys_areas` VALUES ('641', '230101', '市辖区', '230100');
INSERT INTO `sys_areas` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `sys_areas` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `sys_areas` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `sys_areas` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `sys_areas` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `sys_areas` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `sys_areas` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `sys_areas` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `sys_areas` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `sys_areas` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `sys_areas` VALUES ('652', '230125', '宾　县', '230100');
INSERT INTO `sys_areas` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `sys_areas` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `sys_areas` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `sys_areas` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `sys_areas` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `sys_areas` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `sys_areas` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `sys_areas` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `sys_areas` VALUES ('661', '230201', '市辖区', '230200');
INSERT INTO `sys_areas` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `sys_areas` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `sys_areas` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `sys_areas` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `sys_areas` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `sys_areas` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `sys_areas` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `sys_areas` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `sys_areas` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `sys_areas` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `sys_areas` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `sys_areas` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `sys_areas` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `sys_areas` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `sys_areas` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `sys_areas` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `sys_areas` VALUES ('678', '230301', '市辖区', '230300');
INSERT INTO `sys_areas` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `sys_areas` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `sys_areas` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `sys_areas` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `sys_areas` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `sys_areas` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `sys_areas` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `sys_areas` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `sys_areas` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `sys_areas` VALUES ('688', '230401', '市辖区', '230400');
INSERT INTO `sys_areas` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `sys_areas` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `sys_areas` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `sys_areas` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `sys_areas` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `sys_areas` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `sys_areas` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `sys_areas` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `sys_areas` VALUES ('697', '230501', '市辖区', '230500');
INSERT INTO `sys_areas` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `sys_areas` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `sys_areas` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `sys_areas` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `sys_areas` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `sys_areas` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `sys_areas` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `sys_areas` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `sys_areas` VALUES ('706', '230601', '市辖区', '230600');
INSERT INTO `sys_areas` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `sys_areas` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `sys_areas` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `sys_areas` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `sys_areas` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `sys_areas` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `sys_areas` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `sys_areas` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `sys_areas` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `sys_areas` VALUES ('716', '230701', '市辖区', '230700');
INSERT INTO `sys_areas` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `sys_areas` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `sys_areas` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `sys_areas` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `sys_areas` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `sys_areas` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `sys_areas` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `sys_areas` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `sys_areas` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `sys_areas` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `sys_areas` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `sys_areas` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `sys_areas` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `sys_areas` VALUES ('730', '230715', '红星区', '230700');
INSERT INTO `sys_areas` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `sys_areas` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `sys_areas` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `sys_areas` VALUES ('734', '230801', '市辖区', '230800');
INSERT INTO `sys_areas` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `sys_areas` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `sys_areas` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `sys_areas` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `sys_areas` VALUES ('739', '230811', '郊　区', '230800');
INSERT INTO `sys_areas` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `sys_areas` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `sys_areas` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `sys_areas` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `sys_areas` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `sys_areas` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `sys_areas` VALUES ('746', '230901', '市辖区', '230900');
INSERT INTO `sys_areas` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `sys_areas` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `sys_areas` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `sys_areas` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `sys_areas` VALUES ('751', '231001', '市辖区', '231000');
INSERT INTO `sys_areas` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `sys_areas` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `sys_areas` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `sys_areas` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `sys_areas` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `sys_areas` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `sys_areas` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `sys_areas` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `sys_areas` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `sys_areas` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `sys_areas` VALUES ('762', '231101', '市辖区', '231100');
INSERT INTO `sys_areas` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `sys_areas` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `sys_areas` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `sys_areas` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `sys_areas` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `sys_areas` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `sys_areas` VALUES ('769', '231201', '市辖区', '231200');
INSERT INTO `sys_areas` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `sys_areas` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `sys_areas` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `sys_areas` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `sys_areas` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `sys_areas` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `sys_areas` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `sys_areas` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `sys_areas` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `sys_areas` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `sys_areas` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `sys_areas` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `sys_areas` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `sys_areas` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `sys_areas` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `sys_areas` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `sys_areas` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `sys_areas` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `sys_areas` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `sys_areas` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `sys_areas` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `sys_areas` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `sys_areas` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `sys_areas` VALUES ('795', '310115', '浦东新区', '310100');
INSERT INTO `sys_areas` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `sys_areas` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `sys_areas` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `sys_areas` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `sys_areas` VALUES ('801', '310230', '崇明区', '310100');
INSERT INTO `sys_areas` VALUES ('802', '320101', '市辖区', '320100');
INSERT INTO `sys_areas` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `sys_areas` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `sys_areas` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `sys_areas` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `sys_areas` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `sys_areas` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `sys_areas` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `sys_areas` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `sys_areas` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `sys_areas` VALUES ('812', '320115', '江宁区', '320100');
INSERT INTO `sys_areas` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `sys_areas` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `sys_areas` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `sys_areas` VALUES ('816', '320201', '市辖区', '320200');
INSERT INTO `sys_areas` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `sys_areas` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `sys_areas` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `sys_areas` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `sys_areas` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `sys_areas` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `sys_areas` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `sys_areas` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `sys_areas` VALUES ('825', '320301', '市辖区', '320300');
INSERT INTO `sys_areas` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `sys_areas` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `sys_areas` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `sys_areas` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `sys_areas` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `sys_areas` VALUES ('831', '320321', '丰　县', '320300');
INSERT INTO `sys_areas` VALUES ('832', '320322', '沛　县', '320300');
INSERT INTO `sys_areas` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `sys_areas` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `sys_areas` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `sys_areas` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `sys_areas` VALUES ('837', '320401', '市辖区', '320400');
INSERT INTO `sys_areas` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `sys_areas` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `sys_areas` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `sys_areas` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `sys_areas` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `sys_areas` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `sys_areas` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `sys_areas` VALUES ('845', '320501', '市辖区', '320500');
INSERT INTO `sys_areas` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `sys_areas` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `sys_areas` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `sys_areas` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `sys_areas` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `sys_areas` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `sys_areas` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `sys_areas` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `sys_areas` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `sys_areas` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `sys_areas` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `sys_areas` VALUES ('857', '320601', '市辖区', '320600');
INSERT INTO `sys_areas` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `sys_areas` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `sys_areas` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `sys_areas` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `sys_areas` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `sys_areas` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `sys_areas` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `sys_areas` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `sys_areas` VALUES ('866', '320701', '市辖区', '320700');
INSERT INTO `sys_areas` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `sys_areas` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `sys_areas` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `sys_areas` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `sys_areas` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `sys_areas` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `sys_areas` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `sys_areas` VALUES ('874', '320801', '市辖区', '320800');
INSERT INTO `sys_areas` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `sys_areas` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `sys_areas` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `sys_areas` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `sys_areas` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `sys_areas` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `sys_areas` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `sys_areas` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `sys_areas` VALUES ('883', '320901', '市辖区', '320900');
INSERT INTO `sys_areas` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `sys_areas` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `sys_areas` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `sys_areas` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `sys_areas` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `sys_areas` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `sys_areas` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `sys_areas` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `sys_areas` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `sys_areas` VALUES ('893', '321001', '市辖区', '321000');
INSERT INTO `sys_areas` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `sys_areas` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `sys_areas` VALUES ('896', '321011', '郊　区', '321000');
INSERT INTO `sys_areas` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `sys_areas` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `sys_areas` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `sys_areas` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `sys_areas` VALUES ('901', '321101', '市辖区', '321100');
INSERT INTO `sys_areas` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `sys_areas` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `sys_areas` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `sys_areas` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `sys_areas` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `sys_areas` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `sys_areas` VALUES ('908', '321201', '市辖区', '321200');
INSERT INTO `sys_areas` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `sys_areas` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `sys_areas` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `sys_areas` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `sys_areas` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `sys_areas` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `sys_areas` VALUES ('915', '321301', '市辖区', '321300');
INSERT INTO `sys_areas` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `sys_areas` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `sys_areas` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `sys_areas` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `sys_areas` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `sys_areas` VALUES ('921', '330101', '市辖区', '330100');
INSERT INTO `sys_areas` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `sys_areas` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `sys_areas` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `sys_areas` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `sys_areas` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `sys_areas` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `sys_areas` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `sys_areas` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `sys_areas` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `sys_areas` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `sys_areas` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `sys_areas` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `sys_areas` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `sys_areas` VALUES ('935', '330201', '市辖区', '330200');
INSERT INTO `sys_areas` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `sys_areas` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `sys_areas` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `sys_areas` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `sys_areas` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `sys_areas` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `sys_areas` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `sys_areas` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `sys_areas` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `sys_areas` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `sys_areas` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `sys_areas` VALUES ('947', '330301', '市辖区', '330300');
INSERT INTO `sys_areas` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `sys_areas` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `sys_areas` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `sys_areas` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `sys_areas` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `sys_areas` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `sys_areas` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `sys_areas` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `sys_areas` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `sys_areas` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `sys_areas` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `sys_areas` VALUES ('959', '330401', '市辖区', '330400');
INSERT INTO `sys_areas` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `sys_areas` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `sys_areas` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `sys_areas` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `sys_areas` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `sys_areas` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `sys_areas` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `sys_areas` VALUES ('967', '330501', '市辖区', '330500');
INSERT INTO `sys_areas` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `sys_areas` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `sys_areas` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `sys_areas` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `sys_areas` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `sys_areas` VALUES ('973', '330601', '市辖区', '330600');
INSERT INTO `sys_areas` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `sys_areas` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `sys_areas` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `sys_areas` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `sys_areas` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `sys_areas` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `sys_areas` VALUES ('980', '330701', '市辖区', '330700');
INSERT INTO `sys_areas` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `sys_areas` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `sys_areas` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `sys_areas` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `sys_areas` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `sys_areas` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `sys_areas` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `sys_areas` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `sys_areas` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `sys_areas` VALUES ('990', '330801', '市辖区', '330800');
INSERT INTO `sys_areas` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `sys_areas` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `sys_areas` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `sys_areas` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `sys_areas` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `sys_areas` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `sys_areas` VALUES ('997', '330901', '市辖区', '330900');
INSERT INTO `sys_areas` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `sys_areas` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `sys_areas` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `sys_areas` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `sys_areas` VALUES ('1002', '331001', '市辖区', '331000');
INSERT INTO `sys_areas` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `sys_areas` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `sys_areas` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `sys_areas` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `sys_areas` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `sys_areas` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `sys_areas` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `sys_areas` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `sys_areas` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `sys_areas` VALUES ('1012', '331101', '市辖区', '331100');
INSERT INTO `sys_areas` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `sys_areas` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `sys_areas` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `sys_areas` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `sys_areas` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `sys_areas` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `sys_areas` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `sys_areas` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `sys_areas` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `sys_areas` VALUES ('1022', '340101', '市辖区', '340100');
INSERT INTO `sys_areas` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `sys_areas` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `sys_areas` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `sys_areas` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `sys_areas` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `sys_areas` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `sys_areas` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `sys_areas` VALUES ('1030', '340201', '市辖区', '340200');
INSERT INTO `sys_areas` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `sys_areas` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `sys_areas` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `sys_areas` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `sys_areas` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `sys_areas` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `sys_areas` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `sys_areas` VALUES ('1038', '340301', '市辖区', '340300');
INSERT INTO `sys_areas` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `sys_areas` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `sys_areas` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `sys_areas` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `sys_areas` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `sys_areas` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `sys_areas` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `sys_areas` VALUES ('1046', '340401', '市辖区', '340400');
INSERT INTO `sys_areas` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `sys_areas` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `sys_areas` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `sys_areas` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `sys_areas` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `sys_areas` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `sys_areas` VALUES ('1053', '340501', '市辖区', '340500');
INSERT INTO `sys_areas` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `sys_areas` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `sys_areas` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `sys_areas` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `sys_areas` VALUES ('1058', '340601', '市辖区', '340600');
INSERT INTO `sys_areas` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `sys_areas` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `sys_areas` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `sys_areas` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `sys_areas` VALUES ('1063', '340701', '市辖区', '340700');
INSERT INTO `sys_areas` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `sys_areas` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `sys_areas` VALUES ('1066', '340711', '郊　区', '340700');
INSERT INTO `sys_areas` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `sys_areas` VALUES ('1068', '340801', '市辖区', '340800');
INSERT INTO `sys_areas` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `sys_areas` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `sys_areas` VALUES ('1071', '340811', '郊　区', '340800');
INSERT INTO `sys_areas` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `sys_areas` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `sys_areas` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `sys_areas` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `sys_areas` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `sys_areas` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `sys_areas` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `sys_areas` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `sys_areas` VALUES ('1080', '341001', '市辖区', '341000');
INSERT INTO `sys_areas` VALUES ('1081', '341002', '屯溪区', '341000');
INSERT INTO `sys_areas` VALUES ('1082', '341003', '黄山区', '341000');
INSERT INTO `sys_areas` VALUES ('1083', '341004', '徽州区', '341000');
INSERT INTO `sys_areas` VALUES ('1084', '341021', '歙　县', '341000');
INSERT INTO `sys_areas` VALUES ('1085', '341022', '休宁县', '341000');
INSERT INTO `sys_areas` VALUES ('1086', '341023', '黟　县', '341000');
INSERT INTO `sys_areas` VALUES ('1087', '341024', '祁门县', '341000');
INSERT INTO `sys_areas` VALUES ('1088', '341101', '市辖区', '341100');
INSERT INTO `sys_areas` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `sys_areas` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `sys_areas` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `sys_areas` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `sys_areas` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `sys_areas` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `sys_areas` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `sys_areas` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `sys_areas` VALUES ('1097', '341201', '市辖区', '341200');
INSERT INTO `sys_areas` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `sys_areas` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `sys_areas` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `sys_areas` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `sys_areas` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `sys_areas` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `sys_areas` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `sys_areas` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `sys_areas` VALUES ('1106', '341301', '市辖区', '341300');
INSERT INTO `sys_areas` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `sys_areas` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `sys_areas` VALUES ('1109', '341322', '萧　县', '341300');
INSERT INTO `sys_areas` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `sys_areas` VALUES ('1111', '341324', '泗　县', '341300');
INSERT INTO `sys_areas` VALUES ('1112', '341401', '市辖区', '341400');
INSERT INTO `sys_areas` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `sys_areas` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `sys_areas` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `sys_areas` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `sys_areas` VALUES ('1117', '341424', '和　县', '341400');
INSERT INTO `sys_areas` VALUES ('1118', '341501', '市辖区', '341500');
INSERT INTO `sys_areas` VALUES ('1119', '341502', '金安区', '341500');
INSERT INTO `sys_areas` VALUES ('1120', '341503', '裕安区', '341500');
INSERT INTO `sys_areas` VALUES ('1121', '341521', '寿　县', '341500');
INSERT INTO `sys_areas` VALUES ('1122', '341522', '霍邱县', '341500');
INSERT INTO `sys_areas` VALUES ('1123', '341523', '舒城县', '341500');
INSERT INTO `sys_areas` VALUES ('1124', '341524', '金寨县', '341500');
INSERT INTO `sys_areas` VALUES ('1125', '341525', '霍山县', '341500');
INSERT INTO `sys_areas` VALUES ('1126', '341601', '市辖区', '341600');
INSERT INTO `sys_areas` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `sys_areas` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `sys_areas` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `sys_areas` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `sys_areas` VALUES ('1131', '341701', '市辖区', '341700');
INSERT INTO `sys_areas` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `sys_areas` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `sys_areas` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `sys_areas` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `sys_areas` VALUES ('1136', '341801', '市辖区', '341800');
INSERT INTO `sys_areas` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `sys_areas` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `sys_areas` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `sys_areas` VALUES ('1140', '341823', '泾　县', '341800');
INSERT INTO `sys_areas` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `sys_areas` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `sys_areas` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `sys_areas` VALUES ('1144', '350101', '市辖区', '350100');
INSERT INTO `sys_areas` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `sys_areas` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `sys_areas` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `sys_areas` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `sys_areas` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `sys_areas` VALUES ('1150', '350121', '闽侯县', '350100');
INSERT INTO `sys_areas` VALUES ('1151', '350122', '连江县', '350100');
INSERT INTO `sys_areas` VALUES ('1152', '350123', '罗源县', '350100');
INSERT INTO `sys_areas` VALUES ('1153', '350124', '闽清县', '350100');
INSERT INTO `sys_areas` VALUES ('1154', '350125', '永泰县', '350100');
INSERT INTO `sys_areas` VALUES ('1155', '350128', '平潭县', '350100');
INSERT INTO `sys_areas` VALUES ('1156', '350181', '福清市', '350100');
INSERT INTO `sys_areas` VALUES ('1157', '350182', '长乐市', '350100');
INSERT INTO `sys_areas` VALUES ('1158', '350201', '市辖区', '350200');
INSERT INTO `sys_areas` VALUES ('1159', '350203', '思明区', '350200');
INSERT INTO `sys_areas` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `sys_areas` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `sys_areas` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `sys_areas` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `sys_areas` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `sys_areas` VALUES ('1165', '350301', '市辖区', '350300');
INSERT INTO `sys_areas` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `sys_areas` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `sys_areas` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `sys_areas` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `sys_areas` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `sys_areas` VALUES ('1171', '350401', '市辖区', '350400');
INSERT INTO `sys_areas` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `sys_areas` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `sys_areas` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `sys_areas` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `sys_areas` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `sys_areas` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `sys_areas` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `sys_areas` VALUES ('1179', '350427', '沙　县', '350400');
INSERT INTO `sys_areas` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `sys_areas` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `sys_areas` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `sys_areas` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `sys_areas` VALUES ('1184', '350501', '市辖区', '350500');
INSERT INTO `sys_areas` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `sys_areas` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `sys_areas` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `sys_areas` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `sys_areas` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `sys_areas` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `sys_areas` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `sys_areas` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `sys_areas` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `sys_areas` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `sys_areas` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `sys_areas` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `sys_areas` VALUES ('1197', '350601', '市辖区', '350600');
INSERT INTO `sys_areas` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `sys_areas` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `sys_areas` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `sys_areas` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `sys_areas` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `sys_areas` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `sys_areas` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `sys_areas` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `sys_areas` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `sys_areas` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `sys_areas` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `sys_areas` VALUES ('1209', '350701', '市辖区', '350700');
INSERT INTO `sys_areas` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `sys_areas` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `sys_areas` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `sys_areas` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `sys_areas` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `sys_areas` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `sys_areas` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `sys_areas` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `sys_areas` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `sys_areas` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `sys_areas` VALUES ('1220', '350801', '市辖区', '350800');
INSERT INTO `sys_areas` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `sys_areas` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `sys_areas` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `sys_areas` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `sys_areas` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `sys_areas` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `sys_areas` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `sys_areas` VALUES ('1228', '350901', '市辖区', '350900');
INSERT INTO `sys_areas` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `sys_areas` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `sys_areas` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `sys_areas` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `sys_areas` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `sys_areas` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `sys_areas` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `sys_areas` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `sys_areas` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `sys_areas` VALUES ('1238', '360101', '市辖区', '360100');
INSERT INTO `sys_areas` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `sys_areas` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `sys_areas` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `sys_areas` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `sys_areas` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `sys_areas` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `sys_areas` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `sys_areas` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `sys_areas` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `sys_areas` VALUES ('1248', '360201', '市辖区', '360200');
INSERT INTO `sys_areas` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `sys_areas` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `sys_areas` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `sys_areas` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `sys_areas` VALUES ('1253', '360301', '市辖区', '360300');
INSERT INTO `sys_areas` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `sys_areas` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `sys_areas` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `sys_areas` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `sys_areas` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `sys_areas` VALUES ('1259', '360401', '市辖区', '360400');
INSERT INTO `sys_areas` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `sys_areas` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `sys_areas` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `sys_areas` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `sys_areas` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `sys_areas` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `sys_areas` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `sys_areas` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `sys_areas` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `sys_areas` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `sys_areas` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `sys_areas` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `sys_areas` VALUES ('1272', '360501', '市辖区', '360500');
INSERT INTO `sys_areas` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `sys_areas` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `sys_areas` VALUES ('1275', '360601', '市辖区', '360600');
INSERT INTO `sys_areas` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `sys_areas` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `sys_areas` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `sys_areas` VALUES ('1279', '360701', '市辖区', '360700');
INSERT INTO `sys_areas` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `sys_areas` VALUES ('1281', '360721', '赣　县', '360700');
INSERT INTO `sys_areas` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `sys_areas` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `sys_areas` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `sys_areas` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `sys_areas` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `sys_areas` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `sys_areas` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `sys_areas` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `sys_areas` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `sys_areas` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `sys_areas` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `sys_areas` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `sys_areas` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `sys_areas` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `sys_areas` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `sys_areas` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `sys_areas` VALUES ('1298', '360801', '市辖区', '360800');
INSERT INTO `sys_areas` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `sys_areas` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `sys_areas` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `sys_areas` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `sys_areas` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `sys_areas` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `sys_areas` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `sys_areas` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `sys_areas` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `sys_areas` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `sys_areas` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `sys_areas` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `sys_areas` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `sys_areas` VALUES ('1312', '360901', '市辖区', '360900');
INSERT INTO `sys_areas` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `sys_areas` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `sys_areas` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `sys_areas` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `sys_areas` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `sys_areas` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `sys_areas` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `sys_areas` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `sys_areas` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `sys_areas` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `sys_areas` VALUES ('1323', '361001', '市辖区', '361000');
INSERT INTO `sys_areas` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `sys_areas` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `sys_areas` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `sys_areas` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `sys_areas` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `sys_areas` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `sys_areas` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `sys_areas` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `sys_areas` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `sys_areas` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `sys_areas` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `sys_areas` VALUES ('1335', '361101', '市辖区', '361100');
INSERT INTO `sys_areas` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `sys_areas` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `sys_areas` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `sys_areas` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `sys_areas` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `sys_areas` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `sys_areas` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `sys_areas` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `sys_areas` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `sys_areas` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `sys_areas` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `sys_areas` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `sys_areas` VALUES ('1348', '370101', '市辖区', '370100');
INSERT INTO `sys_areas` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `sys_areas` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `sys_areas` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `sys_areas` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `sys_areas` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `sys_areas` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `sys_areas` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `sys_areas` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `sys_areas` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `sys_areas` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `sys_areas` VALUES ('1359', '370201', '市辖区', '370200');
INSERT INTO `sys_areas` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `sys_areas` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `sys_areas` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `sys_areas` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `sys_areas` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `sys_areas` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `sys_areas` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `sys_areas` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `sys_areas` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `sys_areas` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `sys_areas` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `sys_areas` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `sys_areas` VALUES ('1372', '370301', '市辖区', '370300');
INSERT INTO `sys_areas` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `sys_areas` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `sys_areas` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `sys_areas` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `sys_areas` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `sys_areas` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `sys_areas` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `sys_areas` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `sys_areas` VALUES ('1381', '370401', '市辖区', '370400');
INSERT INTO `sys_areas` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `sys_areas` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `sys_areas` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `sys_areas` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `sys_areas` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `sys_areas` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `sys_areas` VALUES ('1388', '370501', '市辖区', '370500');
INSERT INTO `sys_areas` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `sys_areas` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `sys_areas` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `sys_areas` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `sys_areas` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `sys_areas` VALUES ('1394', '370601', '市辖区', '370600');
INSERT INTO `sys_areas` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `sys_areas` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `sys_areas` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `sys_areas` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `sys_areas` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `sys_areas` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `sys_areas` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `sys_areas` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `sys_areas` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `sys_areas` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `sys_areas` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `sys_areas` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `sys_areas` VALUES ('1407', '370701', '市辖区', '370700');
INSERT INTO `sys_areas` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `sys_areas` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `sys_areas` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `sys_areas` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `sys_areas` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `sys_areas` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `sys_areas` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `sys_areas` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `sys_areas` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `sys_areas` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `sys_areas` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `sys_areas` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `sys_areas` VALUES ('1420', '370801', '市辖区', '370800');
INSERT INTO `sys_areas` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `sys_areas` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `sys_areas` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `sys_areas` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `sys_areas` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `sys_areas` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `sys_areas` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `sys_areas` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `sys_areas` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `sys_areas` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `sys_areas` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `sys_areas` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `sys_areas` VALUES ('1433', '370901', '市辖区', '370900');
INSERT INTO `sys_areas` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `sys_areas` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `sys_areas` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `sys_areas` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `sys_areas` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `sys_areas` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `sys_areas` VALUES ('1440', '371001', '市辖区', '371000');
INSERT INTO `sys_areas` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `sys_areas` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `sys_areas` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `sys_areas` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `sys_areas` VALUES ('1445', '371101', '市辖区', '371100');
INSERT INTO `sys_areas` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `sys_areas` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `sys_areas` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `sys_areas` VALUES ('1449', '371122', '莒　县', '371100');
INSERT INTO `sys_areas` VALUES ('1450', '371201', '市辖区', '371200');
INSERT INTO `sys_areas` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `sys_areas` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `sys_areas` VALUES ('1453', '371301', '市辖区', '371300');
INSERT INTO `sys_areas` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `sys_areas` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `sys_areas` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `sys_areas` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `sys_areas` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `sys_areas` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `sys_areas` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `sys_areas` VALUES ('1461', '371325', '费　县', '371300');
INSERT INTO `sys_areas` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `sys_areas` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `sys_areas` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `sys_areas` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `sys_areas` VALUES ('1466', '371401', '市辖区', '371400');
INSERT INTO `sys_areas` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `sys_areas` VALUES ('1468', '371421', '陵　县', '371400');
INSERT INTO `sys_areas` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `sys_areas` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `sys_areas` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `sys_areas` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `sys_areas` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `sys_areas` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `sys_areas` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `sys_areas` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `sys_areas` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `sys_areas` VALUES ('1478', '371501', '市辖区', '371500');
INSERT INTO `sys_areas` VALUES ('1479', '371502', '东昌府区', '371500');
INSERT INTO `sys_areas` VALUES ('1480', '371521', '阳谷县', '371500');
INSERT INTO `sys_areas` VALUES ('1481', '371522', '莘　县', '371500');
INSERT INTO `sys_areas` VALUES ('1482', '371523', '茌平县', '371500');
INSERT INTO `sys_areas` VALUES ('1483', '371524', '东阿县', '371500');
INSERT INTO `sys_areas` VALUES ('1484', '371525', '冠　县', '371500');
INSERT INTO `sys_areas` VALUES ('1485', '371526', '高唐县', '371500');
INSERT INTO `sys_areas` VALUES ('1486', '371581', '临清市', '371500');
INSERT INTO `sys_areas` VALUES ('1487', '371601', '市辖区', '371600');
INSERT INTO `sys_areas` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `sys_areas` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `sys_areas` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `sys_areas` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `sys_areas` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `sys_areas` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `sys_areas` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `sys_areas` VALUES ('1495', '371701', '市辖区', '371700');
INSERT INTO `sys_areas` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `sys_areas` VALUES ('1497', '371721', '曹　县', '371700');
INSERT INTO `sys_areas` VALUES ('1498', '371722', '单　县', '371700');
INSERT INTO `sys_areas` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `sys_areas` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `sys_areas` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `sys_areas` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `sys_areas` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `sys_areas` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `sys_areas` VALUES ('1505', '410101', '市辖区', '410100');
INSERT INTO `sys_areas` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `sys_areas` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `sys_areas` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `sys_areas` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `sys_areas` VALUES ('1510', '410106', '上街区', '410100');
INSERT INTO `sys_areas` VALUES ('1511', '410108', '邙山区', '410100');
INSERT INTO `sys_areas` VALUES ('1512', '410122', '中牟县', '410100');
INSERT INTO `sys_areas` VALUES ('1513', '410181', '巩义市', '410100');
INSERT INTO `sys_areas` VALUES ('1514', '410182', '荥阳市', '410100');
INSERT INTO `sys_areas` VALUES ('1515', '410183', '新密市', '410100');
INSERT INTO `sys_areas` VALUES ('1516', '410184', '新郑市', '410100');
INSERT INTO `sys_areas` VALUES ('1517', '410185', '登封市', '410100');
INSERT INTO `sys_areas` VALUES ('1518', '410201', '市辖区', '410200');
INSERT INTO `sys_areas` VALUES ('1519', '410202', '龙亭区', '410200');
INSERT INTO `sys_areas` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `sys_areas` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `sys_areas` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `sys_areas` VALUES ('1523', '410211', '郊　区', '410200');
INSERT INTO `sys_areas` VALUES ('1524', '410221', '杞　县', '410200');
INSERT INTO `sys_areas` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `sys_areas` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `sys_areas` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `sys_areas` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `sys_areas` VALUES ('1529', '410301', '市辖区', '410300');
INSERT INTO `sys_areas` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `sys_areas` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `sys_areas` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `sys_areas` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `sys_areas` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `sys_areas` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `sys_areas` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `sys_areas` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `sys_areas` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `sys_areas` VALUES ('1539', '410325', '嵩　县', '410300');
INSERT INTO `sys_areas` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `sys_areas` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `sys_areas` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `sys_areas` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `sys_areas` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `sys_areas` VALUES ('1545', '410401', '市辖区', '410400');
INSERT INTO `sys_areas` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `sys_areas` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `sys_areas` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `sys_areas` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `sys_areas` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `sys_areas` VALUES ('1551', '410422', '叶　县', '410400');
INSERT INTO `sys_areas` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `sys_areas` VALUES ('1553', '410425', '郏　县', '410400');
INSERT INTO `sys_areas` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `sys_areas` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `sys_areas` VALUES ('1556', '410501', '市辖区', '410500');
INSERT INTO `sys_areas` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `sys_areas` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `sys_areas` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `sys_areas` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `sys_areas` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `sys_areas` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `sys_areas` VALUES ('1563', '410526', '滑　县', '410500');
INSERT INTO `sys_areas` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `sys_areas` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `sys_areas` VALUES ('1566', '410601', '市辖区', '410600');
INSERT INTO `sys_areas` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `sys_areas` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `sys_areas` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `sys_areas` VALUES ('1570', '410621', '浚　县', '410600');
INSERT INTO `sys_areas` VALUES ('1571', '410622', '淇　县', '410600');
INSERT INTO `sys_areas` VALUES ('1572', '410701', '市辖区', '410700');
INSERT INTO `sys_areas` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `sys_areas` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `sys_areas` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `sys_areas` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `sys_areas` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `sys_areas` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `sys_areas` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `sys_areas` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `sys_areas` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `sys_areas` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `sys_areas` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `sys_areas` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `sys_areas` VALUES ('1585', '410801', '市辖区', '410800');
INSERT INTO `sys_areas` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `sys_areas` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `sys_areas` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `sys_areas` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `sys_areas` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `sys_areas` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `sys_areas` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `sys_areas` VALUES ('1593', '410825', '温　县', '410800');
INSERT INTO `sys_areas` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `sys_areas` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `sys_areas` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `sys_areas` VALUES ('1597', '410901', '市辖区', '410900');
INSERT INTO `sys_areas` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `sys_areas` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `sys_areas` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `sys_areas` VALUES ('1601', '410926', '范　县', '410900');
INSERT INTO `sys_areas` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `sys_areas` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `sys_areas` VALUES ('1604', '411001', '市辖区', '411000');
INSERT INTO `sys_areas` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `sys_areas` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `sys_areas` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `sys_areas` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `sys_areas` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `sys_areas` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `sys_areas` VALUES ('1611', '411101', '市辖区', '411100');
INSERT INTO `sys_areas` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `sys_areas` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `sys_areas` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `sys_areas` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `sys_areas` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `sys_areas` VALUES ('1617', '411201', '市辖区', '411200');
INSERT INTO `sys_areas` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `sys_areas` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `sys_areas` VALUES ('1620', '411222', '陕　县', '411200');
INSERT INTO `sys_areas` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `sys_areas` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `sys_areas` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `sys_areas` VALUES ('1624', '411301', '市辖区', '411300');
INSERT INTO `sys_areas` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `sys_areas` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `sys_areas` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `sys_areas` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `sys_areas` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `sys_areas` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `sys_areas` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `sys_areas` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `sys_areas` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `sys_areas` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `sys_areas` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `sys_areas` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `sys_areas` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `sys_areas` VALUES ('1638', '411401', '市辖区', '411400');
INSERT INTO `sys_areas` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `sys_areas` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `sys_areas` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `sys_areas` VALUES ('1642', '411422', '睢　县', '411400');
INSERT INTO `sys_areas` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `sys_areas` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `sys_areas` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `sys_areas` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `sys_areas` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `sys_areas` VALUES ('1648', '411501', '市辖区', '411500');
INSERT INTO `sys_areas` VALUES ('1649', '411502', '师河区', '411500');
INSERT INTO `sys_areas` VALUES ('1650', '411503', '平桥区', '411500');
INSERT INTO `sys_areas` VALUES ('1651', '411521', '罗山县', '411500');
INSERT INTO `sys_areas` VALUES ('1652', '411522', '光山县', '411500');
INSERT INTO `sys_areas` VALUES ('1653', '411523', '新　县', '411500');
INSERT INTO `sys_areas` VALUES ('1654', '411524', '商城县', '411500');
INSERT INTO `sys_areas` VALUES ('1655', '411525', '固始县', '411500');
INSERT INTO `sys_areas` VALUES ('1656', '411526', '潢川县', '411500');
INSERT INTO `sys_areas` VALUES ('1657', '411527', '淮滨县', '411500');
INSERT INTO `sys_areas` VALUES ('1658', '411528', '息　县', '411500');
INSERT INTO `sys_areas` VALUES ('1659', '411601', '市辖区', '411600');
INSERT INTO `sys_areas` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `sys_areas` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `sys_areas` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `sys_areas` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `sys_areas` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `sys_areas` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `sys_areas` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `sys_areas` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `sys_areas` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `sys_areas` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `sys_areas` VALUES ('1670', '411701', '市辖区', '411700');
INSERT INTO `sys_areas` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `sys_areas` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `sys_areas` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `sys_areas` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `sys_areas` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `sys_areas` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `sys_areas` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `sys_areas` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `sys_areas` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `sys_areas` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `sys_areas` VALUES ('1681', '420101', '市辖区', '420100');
INSERT INTO `sys_areas` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `sys_areas` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `sys_areas` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `sys_areas` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `sys_areas` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `sys_areas` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `sys_areas` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `sys_areas` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `sys_areas` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `sys_areas` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `sys_areas` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `sys_areas` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `sys_areas` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `sys_areas` VALUES ('1695', '420201', '市辖区', '420200');
INSERT INTO `sys_areas` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `sys_areas` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `sys_areas` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `sys_areas` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `sys_areas` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `sys_areas` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `sys_areas` VALUES ('1702', '420301', '市辖区', '420300');
INSERT INTO `sys_areas` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `sys_areas` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `sys_areas` VALUES ('1705', '420321', '郧　县', '420300');
INSERT INTO `sys_areas` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `sys_areas` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `sys_areas` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `sys_areas` VALUES ('1709', '420325', '房　县', '420300');
INSERT INTO `sys_areas` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `sys_areas` VALUES ('1711', '420501', '市辖区', '420500');
INSERT INTO `sys_areas` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `sys_areas` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `sys_areas` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `sys_areas` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `sys_areas` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `sys_areas` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `sys_areas` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `sys_areas` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `sys_areas` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `sys_areas` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `sys_areas` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `sys_areas` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `sys_areas` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `sys_areas` VALUES ('1725', '420601', '市辖区', '420600');
INSERT INTO `sys_areas` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `sys_areas` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `sys_areas` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `sys_areas` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `sys_areas` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `sys_areas` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `sys_areas` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `sys_areas` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `sys_areas` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `sys_areas` VALUES ('1735', '420701', '市辖区', '420700');
INSERT INTO `sys_areas` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `sys_areas` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `sys_areas` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `sys_areas` VALUES ('1739', '420801', '市辖区', '420800');
INSERT INTO `sys_areas` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `sys_areas` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `sys_areas` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `sys_areas` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `sys_areas` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `sys_areas` VALUES ('1745', '420901', '市辖区', '420900');
INSERT INTO `sys_areas` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `sys_areas` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `sys_areas` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `sys_areas` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `sys_areas` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `sys_areas` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `sys_areas` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `sys_areas` VALUES ('1753', '421001', '市辖区', '421000');
INSERT INTO `sys_areas` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `sys_areas` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `sys_areas` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `sys_areas` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `sys_areas` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `sys_areas` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `sys_areas` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `sys_areas` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `sys_areas` VALUES ('1762', '421101', '市辖区', '421100');
INSERT INTO `sys_areas` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `sys_areas` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `sys_areas` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `sys_areas` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `sys_areas` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `sys_areas` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `sys_areas` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `sys_areas` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `sys_areas` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `sys_areas` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `sys_areas` VALUES ('1773', '421201', '市辖区', '421200');
INSERT INTO `sys_areas` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `sys_areas` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `sys_areas` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `sys_areas` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `sys_areas` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `sys_areas` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `sys_areas` VALUES ('1780', '421301', '市辖区', '421300');
INSERT INTO `sys_areas` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `sys_areas` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `sys_areas` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `sys_areas` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `sys_areas` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `sys_areas` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `sys_areas` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `sys_areas` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `sys_areas` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `sys_areas` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `sys_areas` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `sys_areas` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `sys_areas` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `sys_areas` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `sys_areas` VALUES ('1795', '430101', '市辖区', '430100');
INSERT INTO `sys_areas` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `sys_areas` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `sys_areas` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `sys_areas` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `sys_areas` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `sys_areas` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `sys_areas` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `sys_areas` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `sys_areas` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `sys_areas` VALUES ('1805', '430201', '市辖区', '430200');
INSERT INTO `sys_areas` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `sys_areas` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `sys_areas` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `sys_areas` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `sys_areas` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `sys_areas` VALUES ('1811', '430223', '攸　县', '430200');
INSERT INTO `sys_areas` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `sys_areas` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `sys_areas` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `sys_areas` VALUES ('1815', '430301', '市辖区', '430300');
INSERT INTO `sys_areas` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `sys_areas` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `sys_areas` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `sys_areas` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `sys_areas` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `sys_areas` VALUES ('1821', '430401', '市辖区', '430400');
INSERT INTO `sys_areas` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `sys_areas` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `sys_areas` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `sys_areas` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `sys_areas` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `sys_areas` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `sys_areas` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `sys_areas` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `sys_areas` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `sys_areas` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `sys_areas` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `sys_areas` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `sys_areas` VALUES ('1834', '430501', '市辖区', '430500');
INSERT INTO `sys_areas` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `sys_areas` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `sys_areas` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `sys_areas` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `sys_areas` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `sys_areas` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `sys_areas` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `sys_areas` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `sys_areas` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `sys_areas` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `sys_areas` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `sys_areas` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `sys_areas` VALUES ('1847', '430601', '市辖区', '430600');
INSERT INTO `sys_areas` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `sys_areas` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `sys_areas` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `sys_areas` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `sys_areas` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `sys_areas` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `sys_areas` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `sys_areas` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `sys_areas` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `sys_areas` VALUES ('1857', '430701', '市辖区', '430700');
INSERT INTO `sys_areas` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `sys_areas` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `sys_areas` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `sys_areas` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `sys_areas` VALUES ('1862', '430723', '澧　县', '430700');
INSERT INTO `sys_areas` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `sys_areas` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `sys_areas` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `sys_areas` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `sys_areas` VALUES ('1867', '430801', '市辖区', '430800');
INSERT INTO `sys_areas` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `sys_areas` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `sys_areas` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `sys_areas` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `sys_areas` VALUES ('1872', '430901', '市辖区', '430900');
INSERT INTO `sys_areas` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `sys_areas` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `sys_areas` VALUES ('1875', '430921', '南　县', '430900');
INSERT INTO `sys_areas` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `sys_areas` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `sys_areas` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `sys_areas` VALUES ('1879', '431001', '市辖区', '431000');
INSERT INTO `sys_areas` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `sys_areas` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `sys_areas` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `sys_areas` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `sys_areas` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `sys_areas` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `sys_areas` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `sys_areas` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `sys_areas` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `sys_areas` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `sys_areas` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `sys_areas` VALUES ('1891', '431101', '市辖区', '431100');
INSERT INTO `sys_areas` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `sys_areas` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `sys_areas` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `sys_areas` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `sys_areas` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `sys_areas` VALUES ('1897', '431124', '道　县', '431100');
INSERT INTO `sys_areas` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `sys_areas` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `sys_areas` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `sys_areas` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `sys_areas` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `sys_areas` VALUES ('1903', '431201', '市辖区', '431200');
INSERT INTO `sys_areas` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `sys_areas` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `sys_areas` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `sys_areas` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `sys_areas` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `sys_areas` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `sys_areas` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `sys_areas` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `sys_areas` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `sys_areas` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `sys_areas` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `sys_areas` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `sys_areas` VALUES ('1916', '431301', '市辖区', '431300');
INSERT INTO `sys_areas` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `sys_areas` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `sys_areas` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `sys_areas` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `sys_areas` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `sys_areas` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `sys_areas` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `sys_areas` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `sys_areas` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `sys_areas` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `sys_areas` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `sys_areas` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `sys_areas` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `sys_areas` VALUES ('1930', '440101', '市辖区', '440100');
INSERT INTO `sys_areas` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `sys_areas` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `sys_areas` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `sys_areas` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `sys_areas` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `sys_areas` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `sys_areas` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `sys_areas` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `sys_areas` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `sys_areas` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `sys_areas` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `sys_areas` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `sys_areas` VALUES ('1943', '440201', '市辖区', '440200');
INSERT INTO `sys_areas` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `sys_areas` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `sys_areas` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `sys_areas` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `sys_areas` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `sys_areas` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `sys_areas` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `sys_areas` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `sys_areas` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `sys_areas` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `sys_areas` VALUES ('1954', '440301', '市辖区', '440300');
INSERT INTO `sys_areas` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `sys_areas` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `sys_areas` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `sys_areas` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `sys_areas` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `sys_areas` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `sys_areas` VALUES ('1961', '440401', '市辖区', '440400');
INSERT INTO `sys_areas` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `sys_areas` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `sys_areas` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `sys_areas` VALUES ('1965', '440501', '市辖区', '440500');
INSERT INTO `sys_areas` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `sys_areas` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `sys_areas` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `sys_areas` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `sys_areas` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `sys_areas` VALUES ('1971', '440515', '澄海区', '440500');
INSERT INTO `sys_areas` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `sys_areas` VALUES ('1973', '440601', '市辖区', '440600');
INSERT INTO `sys_areas` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `sys_areas` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `sys_areas` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `sys_areas` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `sys_areas` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `sys_areas` VALUES ('1979', '440701', '市辖区', '440700');
INSERT INTO `sys_areas` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `sys_areas` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `sys_areas` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `sys_areas` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `sys_areas` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `sys_areas` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `sys_areas` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `sys_areas` VALUES ('1987', '440801', '市辖区', '440800');
INSERT INTO `sys_areas` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `sys_areas` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `sys_areas` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `sys_areas` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `sys_areas` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `sys_areas` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `sys_areas` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `sys_areas` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `sys_areas` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `sys_areas` VALUES ('1997', '440901', '市辖区', '440900');
INSERT INTO `sys_areas` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `sys_areas` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `sys_areas` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `sys_areas` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `sys_areas` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `sys_areas` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `sys_areas` VALUES ('2004', '441201', '市辖区', '441200');
INSERT INTO `sys_areas` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `sys_areas` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `sys_areas` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `sys_areas` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `sys_areas` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `sys_areas` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `sys_areas` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `sys_areas` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `sys_areas` VALUES ('2013', '441301', '市辖区', '441300');
INSERT INTO `sys_areas` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `sys_areas` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `sys_areas` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `sys_areas` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `sys_areas` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `sys_areas` VALUES ('2019', '441401', '市辖区', '441400');
INSERT INTO `sys_areas` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `sys_areas` VALUES ('2021', '441421', '梅　县', '441400');
INSERT INTO `sys_areas` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `sys_areas` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `sys_areas` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `sys_areas` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `sys_areas` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `sys_areas` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `sys_areas` VALUES ('2028', '441501', '市辖区', '441500');
INSERT INTO `sys_areas` VALUES ('2029', '441502', '城　区', '441500');
INSERT INTO `sys_areas` VALUES ('2030', '441521', '海丰县', '441500');
INSERT INTO `sys_areas` VALUES ('2031', '441523', '陆河县', '441500');
INSERT INTO `sys_areas` VALUES ('2032', '441581', '陆丰市', '441500');
INSERT INTO `sys_areas` VALUES ('2033', '441601', '市辖区', '441600');
INSERT INTO `sys_areas` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `sys_areas` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `sys_areas` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `sys_areas` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `sys_areas` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `sys_areas` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `sys_areas` VALUES ('2040', '441701', '市辖区', '441700');
INSERT INTO `sys_areas` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `sys_areas` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `sys_areas` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `sys_areas` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `sys_areas` VALUES ('2045', '441801', '市辖区', '441800');
INSERT INTO `sys_areas` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `sys_areas` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `sys_areas` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `sys_areas` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `sys_areas` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `sys_areas` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `sys_areas` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `sys_areas` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `sys_areas` VALUES ('2054', '445101', '市辖区', '445100');
INSERT INTO `sys_areas` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `sys_areas` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `sys_areas` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `sys_areas` VALUES ('2058', '445201', '市辖区', '445200');
INSERT INTO `sys_areas` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `sys_areas` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `sys_areas` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `sys_areas` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `sys_areas` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `sys_areas` VALUES ('2064', '445301', '市辖区', '445300');
INSERT INTO `sys_areas` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `sys_areas` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `sys_areas` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `sys_areas` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `sys_areas` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `sys_areas` VALUES ('2070', '450101', '市辖区', '450100');
INSERT INTO `sys_areas` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `sys_areas` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `sys_areas` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `sys_areas` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `sys_areas` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `sys_areas` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `sys_areas` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `sys_areas` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `sys_areas` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `sys_areas` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `sys_areas` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `sys_areas` VALUES ('2082', '450127', '横　县', '450100');
INSERT INTO `sys_areas` VALUES ('2083', '450201', '市辖区', '450200');
INSERT INTO `sys_areas` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `sys_areas` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `sys_areas` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `sys_areas` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `sys_areas` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `sys_areas` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `sys_areas` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `sys_areas` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `sys_areas` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `sys_areas` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `sys_areas` VALUES ('2094', '450301', '市辖区', '450300');
INSERT INTO `sys_areas` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `sys_areas` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `sys_areas` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `sys_areas` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `sys_areas` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `sys_areas` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `sys_areas` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `sys_areas` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `sys_areas` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `sys_areas` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `sys_areas` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `sys_areas` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `sys_areas` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `sys_areas` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `sys_areas` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `sys_areas` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `sys_areas` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `sys_areas` VALUES ('2112', '450401', '市辖区', '450400');
INSERT INTO `sys_areas` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `sys_areas` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `sys_areas` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `sys_areas` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `sys_areas` VALUES ('2117', '450422', '藤　县', '450400');
INSERT INTO `sys_areas` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `sys_areas` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `sys_areas` VALUES ('2120', '450501', '市辖区', '450500');
INSERT INTO `sys_areas` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `sys_areas` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `sys_areas` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `sys_areas` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `sys_areas` VALUES ('2125', '450601', '市辖区', '450600');
INSERT INTO `sys_areas` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `sys_areas` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `sys_areas` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `sys_areas` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `sys_areas` VALUES ('2130', '450701', '市辖区', '450700');
INSERT INTO `sys_areas` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `sys_areas` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `sys_areas` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `sys_areas` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `sys_areas` VALUES ('2135', '450801', '市辖区', '450800');
INSERT INTO `sys_areas` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `sys_areas` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `sys_areas` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `sys_areas` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `sys_areas` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `sys_areas` VALUES ('2141', '450901', '市辖区', '450900');
INSERT INTO `sys_areas` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `sys_areas` VALUES ('2143', '450921', '容　县', '450900');
INSERT INTO `sys_areas` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `sys_areas` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `sys_areas` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `sys_areas` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `sys_areas` VALUES ('2148', '451001', '市辖区', '451000');
INSERT INTO `sys_areas` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `sys_areas` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `sys_areas` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `sys_areas` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `sys_areas` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `sys_areas` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `sys_areas` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `sys_areas` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `sys_areas` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `sys_areas` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `sys_areas` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `sys_areas` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `sys_areas` VALUES ('2161', '451101', '市辖区', '451100');
INSERT INTO `sys_areas` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `sys_areas` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `sys_areas` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `sys_areas` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `sys_areas` VALUES ('2166', '451201', '市辖区', '451200');
INSERT INTO `sys_areas` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `sys_areas` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `sys_areas` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `sys_areas` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `sys_areas` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `sys_areas` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `sys_areas` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `sys_areas` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `sys_areas` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `sys_areas` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `sys_areas` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `sys_areas` VALUES ('2178', '451301', '市辖区', '451300');
INSERT INTO `sys_areas` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `sys_areas` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `sys_areas` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `sys_areas` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `sys_areas` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `sys_areas` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `sys_areas` VALUES ('2185', '451401', '市辖区', '451400');
INSERT INTO `sys_areas` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `sys_areas` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `sys_areas` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `sys_areas` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `sys_areas` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `sys_areas` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `sys_areas` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `sys_areas` VALUES ('2193', '460101', '市辖区', '460100');
INSERT INTO `sys_areas` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `sys_areas` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `sys_areas` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `sys_areas` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `sys_areas` VALUES ('2198', '460201', '市辖区', '460200');
INSERT INTO `sys_areas` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `sys_areas` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `sys_areas` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `sys_areas` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `sys_areas` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `sys_areas` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `sys_areas` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `sys_areas` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `sys_areas` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `sys_areas` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `sys_areas` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `sys_areas` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `sys_areas` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `sys_areas` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `sys_areas` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `sys_areas` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `sys_areas` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `sys_areas` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `sys_areas` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `sys_areas` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `sys_areas` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `sys_areas` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `sys_areas` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `sys_areas` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `sys_areas` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `sys_areas` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `sys_areas` VALUES ('2232', '500115', '长寿区', '500100');
INSERT INTO `sys_areas` VALUES ('2233', '500222', '綦江区', '500100');
INSERT INTO `sys_areas` VALUES ('2234', '500223', '潼南区', '500100');
INSERT INTO `sys_areas` VALUES ('2235', '500224', '铜梁区', '500100');
INSERT INTO `sys_areas` VALUES ('2236', '500225', '大足区', '500100');
INSERT INTO `sys_areas` VALUES ('2237', '500226', '荣昌区', '500100');
INSERT INTO `sys_areas` VALUES ('2238', '500227', '璧山区', '500100');
INSERT INTO `sys_areas` VALUES ('2239', '500228', '梁平区', '500100');
INSERT INTO `sys_areas` VALUES ('2240', '500229', '城口县', '500200');
INSERT INTO `sys_areas` VALUES ('2241', '500230', '丰都县', '500200');
INSERT INTO `sys_areas` VALUES ('2242', '500231', '垫江县', '500200');
INSERT INTO `sys_areas` VALUES ('2243', '500232', '武隆区', '500100');
INSERT INTO `sys_areas` VALUES ('2244', '500233', '忠　县', '500200');
INSERT INTO `sys_areas` VALUES ('2245', '500234', '开州区', '500100');
INSERT INTO `sys_areas` VALUES ('2246', '500235', '云阳县', '500200');
INSERT INTO `sys_areas` VALUES ('2247', '500236', '奉节县', '500200');
INSERT INTO `sys_areas` VALUES ('2248', '500237', '巫山县', '500200');
INSERT INTO `sys_areas` VALUES ('2249', '500238', '巫溪县', '500200');
INSERT INTO `sys_areas` VALUES ('2250', '500240', '石柱土家族自治县', '500300');
INSERT INTO `sys_areas` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500300');
INSERT INTO `sys_areas` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500300');
INSERT INTO `sys_areas` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500300');
INSERT INTO `sys_areas` VALUES ('2254', '500381', '江津区', '500100');
INSERT INTO `sys_areas` VALUES ('2255', '500382', '合川区', '500100');
INSERT INTO `sys_areas` VALUES ('2256', '500383', '永川区', '500100');
INSERT INTO `sys_areas` VALUES ('2257', '500384', '南川区', '500100');
INSERT INTO `sys_areas` VALUES ('2258', '510101', '市辖区', '510100');
INSERT INTO `sys_areas` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `sys_areas` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `sys_areas` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `sys_areas` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `sys_areas` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `sys_areas` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `sys_areas` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `sys_areas` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `sys_areas` VALUES ('2267', '510115', '温江县', '510100');
INSERT INTO `sys_areas` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `sys_areas` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `sys_areas` VALUES ('2270', '510124', '郫　县', '510100');
INSERT INTO `sys_areas` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `sys_areas` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `sys_areas` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `sys_areas` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `sys_areas` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `sys_areas` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `sys_areas` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `sys_areas` VALUES ('2278', '510301', '市辖区', '510300');
INSERT INTO `sys_areas` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `sys_areas` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `sys_areas` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `sys_areas` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `sys_areas` VALUES ('2283', '510321', '荣　县', '510300');
INSERT INTO `sys_areas` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `sys_areas` VALUES ('2285', '510401', '市辖区', '510400');
INSERT INTO `sys_areas` VALUES ('2286', '510402', '东　区', '510400');
INSERT INTO `sys_areas` VALUES ('2287', '510403', '西　区', '510400');
INSERT INTO `sys_areas` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `sys_areas` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `sys_areas` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `sys_areas` VALUES ('2291', '510501', '市辖区', '510500');
INSERT INTO `sys_areas` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `sys_areas` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `sys_areas` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `sys_areas` VALUES ('2295', '510521', '泸　县', '510500');
INSERT INTO `sys_areas` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `sys_areas` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `sys_areas` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `sys_areas` VALUES ('2299', '510601', '市辖区', '510600');
INSERT INTO `sys_areas` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `sys_areas` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `sys_areas` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `sys_areas` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `sys_areas` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `sys_areas` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `sys_areas` VALUES ('2306', '510701', '市辖区', '510700');
INSERT INTO `sys_areas` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `sys_areas` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `sys_areas` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `sys_areas` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `sys_areas` VALUES ('2311', '510724', '安　县', '510700');
INSERT INTO `sys_areas` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `sys_areas` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `sys_areas` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `sys_areas` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `sys_areas` VALUES ('2316', '510801', '市辖区', '510800');
INSERT INTO `sys_areas` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `sys_areas` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `sys_areas` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `sys_areas` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `sys_areas` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `sys_areas` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `sys_areas` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `sys_areas` VALUES ('2324', '510901', '市辖区', '510900');
INSERT INTO `sys_areas` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `sys_areas` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `sys_areas` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `sys_areas` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `sys_areas` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `sys_areas` VALUES ('2330', '511001', '市辖区', '511000');
INSERT INTO `sys_areas` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `sys_areas` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `sys_areas` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `sys_areas` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `sys_areas` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `sys_areas` VALUES ('2336', '511101', '市辖区', '511100');
INSERT INTO `sys_areas` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `sys_areas` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `sys_areas` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `sys_areas` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `sys_areas` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `sys_areas` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `sys_areas` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `sys_areas` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `sys_areas` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `sys_areas` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `sys_areas` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `sys_areas` VALUES ('2348', '511301', '市辖区', '511300');
INSERT INTO `sys_areas` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `sys_areas` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `sys_areas` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `sys_areas` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `sys_areas` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `sys_areas` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `sys_areas` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `sys_areas` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `sys_areas` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `sys_areas` VALUES ('2358', '511401', '市辖区', '511400');
INSERT INTO `sys_areas` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `sys_areas` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `sys_areas` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `sys_areas` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `sys_areas` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `sys_areas` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `sys_areas` VALUES ('2365', '511501', '市辖区', '511500');
INSERT INTO `sys_areas` VALUES ('2366', '511502', '翠屏区', '511500');
INSERT INTO `sys_areas` VALUES ('2367', '511521', '宜宾县', '511500');
INSERT INTO `sys_areas` VALUES ('2368', '511522', '南溪县', '511500');
INSERT INTO `sys_areas` VALUES ('2369', '511523', '江安县', '511500');
INSERT INTO `sys_areas` VALUES ('2370', '511524', '长宁县', '511500');
INSERT INTO `sys_areas` VALUES ('2371', '511525', '高　县', '511500');
INSERT INTO `sys_areas` VALUES ('2372', '511526', '珙　县', '511500');
INSERT INTO `sys_areas` VALUES ('2373', '511527', '筠连县', '511500');
INSERT INTO `sys_areas` VALUES ('2374', '511528', '兴文县', '511500');
INSERT INTO `sys_areas` VALUES ('2375', '511529', '屏山县', '511500');
INSERT INTO `sys_areas` VALUES ('2376', '511601', '市辖区', '511600');
INSERT INTO `sys_areas` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `sys_areas` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `sys_areas` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `sys_areas` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `sys_areas` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `sys_areas` VALUES ('2382', '511701', '市辖区', '511700');
INSERT INTO `sys_areas` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `sys_areas` VALUES ('2384', '511721', '达　县', '511700');
INSERT INTO `sys_areas` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `sys_areas` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `sys_areas` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `sys_areas` VALUES ('2388', '511725', '渠　县', '511700');
INSERT INTO `sys_areas` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `sys_areas` VALUES ('2390', '511801', '市辖区', '511800');
INSERT INTO `sys_areas` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `sys_areas` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `sys_areas` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `sys_areas` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `sys_areas` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `sys_areas` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `sys_areas` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `sys_areas` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `sys_areas` VALUES ('2399', '511901', '市辖区', '511900');
INSERT INTO `sys_areas` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `sys_areas` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `sys_areas` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `sys_areas` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `sys_areas` VALUES ('2404', '512001', '市辖区', '512000');
INSERT INTO `sys_areas` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `sys_areas` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `sys_areas` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `sys_areas` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `sys_areas` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `sys_areas` VALUES ('2410', '513222', '理　县', '513200');
INSERT INTO `sys_areas` VALUES ('2411', '513223', '茂　县', '513200');
INSERT INTO `sys_areas` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `sys_areas` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `sys_areas` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `sys_areas` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `sys_areas` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `sys_areas` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `sys_areas` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `sys_areas` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `sys_areas` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `sys_areas` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `sys_areas` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `sys_areas` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `sys_areas` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `sys_areas` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `sys_areas` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `sys_areas` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `sys_areas` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `sys_areas` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `sys_areas` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `sys_areas` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `sys_areas` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `sys_areas` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `sys_areas` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `sys_areas` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `sys_areas` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `sys_areas` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `sys_areas` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `sys_areas` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `sys_areas` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `sys_areas` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `sys_areas` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `sys_areas` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `sys_areas` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `sys_areas` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `sys_areas` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `sys_areas` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `sys_areas` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `sys_areas` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `sys_areas` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `sys_areas` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `sys_areas` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `sys_areas` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `sys_areas` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `sys_areas` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `sys_areas` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `sys_areas` VALUES ('2457', '520101', '市辖区', '520100');
INSERT INTO `sys_areas` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `sys_areas` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `sys_areas` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `sys_areas` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `sys_areas` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `sys_areas` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `sys_areas` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `sys_areas` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `sys_areas` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `sys_areas` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `sys_areas` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `sys_areas` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `sys_areas` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `sys_areas` VALUES ('2471', '520222', '盘　县', '520200');
INSERT INTO `sys_areas` VALUES ('2472', '520301', '市辖区', '520300');
INSERT INTO `sys_areas` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `sys_areas` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `sys_areas` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `sys_areas` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `sys_areas` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `sys_areas` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `sys_areas` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `sys_areas` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `sys_areas` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `sys_areas` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `sys_areas` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `sys_areas` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `sys_areas` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `sys_areas` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `sys_areas` VALUES ('2487', '520401', '市辖区', '520400');
INSERT INTO `sys_areas` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `sys_areas` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `sys_areas` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `sys_areas` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `sys_areas` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `sys_areas` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `sys_areas` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `sys_areas` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `sys_areas` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `sys_areas` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `sys_areas` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `sys_areas` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `sys_areas` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `sys_areas` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `sys_areas` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `sys_areas` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `sys_areas` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `sys_areas` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `sys_areas` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `sys_areas` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `sys_areas` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `sys_areas` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `sys_areas` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `sys_areas` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `sys_areas` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `sys_areas` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `sys_areas` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `sys_areas` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `sys_areas` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `sys_areas` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `sys_areas` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `sys_areas` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `sys_areas` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `sys_areas` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `sys_areas` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `sys_areas` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `sys_areas` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `sys_areas` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `sys_areas` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `sys_areas` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `sys_areas` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `sys_areas` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `sys_areas` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `sys_areas` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `sys_areas` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `sys_areas` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `sys_areas` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `sys_areas` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `sys_areas` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `sys_areas` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `sys_areas` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `sys_areas` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `sys_areas` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `sys_areas` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `sys_areas` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `sys_areas` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `sys_areas` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `sys_areas` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `sys_areas` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `sys_areas` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `sys_areas` VALUES ('2548', '530101', '市辖区', '530100');
INSERT INTO `sys_areas` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `sys_areas` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `sys_areas` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `sys_areas` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `sys_areas` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `sys_areas` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `sys_areas` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `sys_areas` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `sys_areas` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `sys_areas` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `sys_areas` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `sys_areas` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `sys_areas` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `sys_areas` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `sys_areas` VALUES ('2563', '530301', '市辖区', '530300');
INSERT INTO `sys_areas` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `sys_areas` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `sys_areas` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `sys_areas` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `sys_areas` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `sys_areas` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `sys_areas` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `sys_areas` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `sys_areas` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `sys_areas` VALUES ('2573', '530401', '市辖区', '530400');
INSERT INTO `sys_areas` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `sys_areas` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `sys_areas` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `sys_areas` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `sys_areas` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `sys_areas` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `sys_areas` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `sys_areas` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `sys_areas` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `sys_areas` VALUES ('2583', '530501', '市辖区', '530500');
INSERT INTO `sys_areas` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `sys_areas` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `sys_areas` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `sys_areas` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `sys_areas` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `sys_areas` VALUES ('2589', '530601', '市辖区', '530600');
INSERT INTO `sys_areas` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `sys_areas` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `sys_areas` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `sys_areas` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `sys_areas` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `sys_areas` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `sys_areas` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `sys_areas` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `sys_areas` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `sys_areas` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `sys_areas` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `sys_areas` VALUES ('2601', '530701', '市辖区', '530700');
INSERT INTO `sys_areas` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `sys_areas` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `sys_areas` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `sys_areas` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `sys_areas` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `sys_areas` VALUES ('2607', '530801', '市辖区', '530800');
INSERT INTO `sys_areas` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `sys_areas` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `sys_areas` VALUES ('2618', '530901', '市辖区', '530900');
INSERT INTO `sys_areas` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `sys_areas` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `sys_areas` VALUES ('2621', '530922', '云　县', '530900');
INSERT INTO `sys_areas` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `sys_areas` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `sys_areas` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `sys_areas` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `sys_areas` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `sys_areas` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `sys_areas` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `sys_areas` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `sys_areas` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `sys_areas` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `sys_areas` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `sys_areas` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `sys_areas` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `sys_areas` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `sys_areas` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `sys_areas` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `sys_areas` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `sys_areas` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `sys_areas` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `sys_areas` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `sys_areas` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `sys_areas` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `sys_areas` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `sys_areas` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `sys_areas` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `sys_areas` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `sys_areas` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `sys_areas` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `sys_areas` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `sys_areas` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `sys_areas` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `sys_areas` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `sys_areas` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `sys_areas` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `sys_areas` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `sys_areas` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `sys_areas` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `sys_areas` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `sys_areas` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `sys_areas` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `sys_areas` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `sys_areas` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `sys_areas` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `sys_areas` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `sys_areas` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `sys_areas` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `sys_areas` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `sys_areas` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `sys_areas` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `sys_areas` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `sys_areas` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `sys_areas` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `sys_areas` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `sys_areas` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `sys_areas` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `sys_areas` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `sys_areas` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `sys_areas` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `sys_areas` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `sys_areas` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `sys_areas` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `sys_areas` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `sys_areas` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `sys_areas` VALUES ('2685', '540101', '市辖区', '540100');
INSERT INTO `sys_areas` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `sys_areas` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `sys_areas` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `sys_areas` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `sys_areas` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `sys_areas` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `sys_areas` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `sys_areas` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `sys_areas` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `sys_areas` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `sys_areas` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `sys_areas` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `sys_areas` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `sys_areas` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `sys_areas` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `sys_areas` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `sys_areas` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `sys_areas` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `sys_areas` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `sys_areas` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `sys_areas` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `sys_areas` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `sys_areas` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `sys_areas` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `sys_areas` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `sys_areas` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `sys_areas` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `sys_areas` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `sys_areas` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `sys_areas` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `sys_areas` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `sys_areas` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `sys_areas` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `sys_areas` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `sys_areas` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `sys_areas` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `sys_areas` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `sys_areas` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `sys_areas` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `sys_areas` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `sys_areas` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `sys_areas` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `sys_areas` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `sys_areas` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `sys_areas` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `sys_areas` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `sys_areas` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `sys_areas` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `sys_areas` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `sys_areas` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `sys_areas` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `sys_areas` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `sys_areas` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `sys_areas` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `sys_areas` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `sys_areas` VALUES ('2741', '542427', '索　县', '542400');
INSERT INTO `sys_areas` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `sys_areas` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `sys_areas` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `sys_areas` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `sys_areas` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `sys_areas` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `sys_areas` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `sys_areas` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `sys_areas` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `sys_areas` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `sys_areas` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `sys_areas` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `sys_areas` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `sys_areas` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `sys_areas` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `sys_areas` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `sys_areas` VALUES ('2758', '542627', '朗　县', '542600');
INSERT INTO `sys_areas` VALUES ('2759', '610101', '市辖区', '610100');
INSERT INTO `sys_areas` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `sys_areas` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `sys_areas` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `sys_areas` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `sys_areas` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `sys_areas` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `sys_areas` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `sys_areas` VALUES ('2767', '610115', '临潼区', '610100');
INSERT INTO `sys_areas` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `sys_areas` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `sys_areas` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `sys_areas` VALUES ('2771', '610125', '户　县', '610100');
INSERT INTO `sys_areas` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `sys_areas` VALUES ('2773', '610201', '市辖区', '610200');
INSERT INTO `sys_areas` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `sys_areas` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `sys_areas` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `sys_areas` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `sys_areas` VALUES ('2778', '610301', '市辖区', '610300');
INSERT INTO `sys_areas` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `sys_areas` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `sys_areas` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `sys_areas` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `sys_areas` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `sys_areas` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `sys_areas` VALUES ('2785', '610326', '眉　县', '610300');
INSERT INTO `sys_areas` VALUES ('2786', '610327', '陇　县', '610300');
INSERT INTO `sys_areas` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `sys_areas` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `sys_areas` VALUES ('2789', '610330', '凤　县', '610300');
INSERT INTO `sys_areas` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `sys_areas` VALUES ('2791', '610401', '市辖区', '610400');
INSERT INTO `sys_areas` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `sys_areas` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `sys_areas` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `sys_areas` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `sys_areas` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `sys_areas` VALUES ('2797', '610424', '乾　县', '610400');
INSERT INTO `sys_areas` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `sys_areas` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `sys_areas` VALUES ('2800', '610427', '彬　县', '610400');
INSERT INTO `sys_areas` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `sys_areas` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `sys_areas` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `sys_areas` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `sys_areas` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `sys_areas` VALUES ('2806', '610501', '市辖区', '610500');
INSERT INTO `sys_areas` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `sys_areas` VALUES ('2808', '610521', '华　县', '610500');
INSERT INTO `sys_areas` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `sys_areas` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `sys_areas` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `sys_areas` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `sys_areas` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `sys_areas` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `sys_areas` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `sys_areas` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `sys_areas` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `sys_areas` VALUES ('2818', '610601', '市辖区', '610600');
INSERT INTO `sys_areas` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `sys_areas` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `sys_areas` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `sys_areas` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `sys_areas` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `sys_areas` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `sys_areas` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `sys_areas` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `sys_areas` VALUES ('2827', '610628', '富　县', '610600');
INSERT INTO `sys_areas` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `sys_areas` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `sys_areas` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `sys_areas` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `sys_areas` VALUES ('2832', '610701', '市辖区', '610700');
INSERT INTO `sys_areas` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `sys_areas` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `sys_areas` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `sys_areas` VALUES ('2836', '610723', '洋　县', '610700');
INSERT INTO `sys_areas` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `sys_areas` VALUES ('2838', '610725', '勉　县', '610700');
INSERT INTO `sys_areas` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `sys_areas` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `sys_areas` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `sys_areas` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `sys_areas` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `sys_areas` VALUES ('2844', '610801', '市辖区', '610800');
INSERT INTO `sys_areas` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `sys_areas` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `sys_areas` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `sys_areas` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `sys_areas` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `sys_areas` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `sys_areas` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `sys_areas` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `sys_areas` VALUES ('2853', '610828', '佳　县', '610800');
INSERT INTO `sys_areas` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `sys_areas` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `sys_areas` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `sys_areas` VALUES ('2857', '610901', '市辖区', '610900');
INSERT INTO `sys_areas` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `sys_areas` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `sys_areas` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `sys_areas` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `sys_areas` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `sys_areas` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `sys_areas` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `sys_areas` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `sys_areas` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `sys_areas` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `sys_areas` VALUES ('2868', '611001', '市辖区', '611000');
INSERT INTO `sys_areas` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `sys_areas` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `sys_areas` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `sys_areas` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `sys_areas` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `sys_areas` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `sys_areas` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `sys_areas` VALUES ('2876', '620101', '市辖区', '620100');
INSERT INTO `sys_areas` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `sys_areas` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `sys_areas` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `sys_areas` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `sys_areas` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `sys_areas` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `sys_areas` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `sys_areas` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `sys_areas` VALUES ('2885', '620201', '市辖区', '620200');
INSERT INTO `sys_areas` VALUES ('2886', '620301', '市辖区', '620300');
INSERT INTO `sys_areas` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `sys_areas` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `sys_areas` VALUES ('2889', '620401', '市辖区', '620400');
INSERT INTO `sys_areas` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `sys_areas` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `sys_areas` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `sys_areas` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `sys_areas` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `sys_areas` VALUES ('2895', '620501', '市辖区', '620500');
INSERT INTO `sys_areas` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `sys_areas` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `sys_areas` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `sys_areas` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `sys_areas` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `sys_areas` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `sys_areas` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `sys_areas` VALUES ('2903', '620601', '市辖区', '620600');
INSERT INTO `sys_areas` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `sys_areas` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `sys_areas` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `sys_areas` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `sys_areas` VALUES ('2908', '620701', '市辖区', '620700');
INSERT INTO `sys_areas` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `sys_areas` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `sys_areas` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `sys_areas` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `sys_areas` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `sys_areas` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `sys_areas` VALUES ('2915', '620801', '市辖区', '620800');
INSERT INTO `sys_areas` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `sys_areas` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `sys_areas` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `sys_areas` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `sys_areas` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `sys_areas` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `sys_areas` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `sys_areas` VALUES ('2923', '620901', '市辖区', '620900');
INSERT INTO `sys_areas` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `sys_areas` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `sys_areas` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `sys_areas` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `sys_areas` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `sys_areas` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `sys_areas` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `sys_areas` VALUES ('2931', '621001', '市辖区', '621000');
INSERT INTO `sys_areas` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `sys_areas` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `sys_areas` VALUES ('2934', '621022', '环　县', '621000');
INSERT INTO `sys_areas` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `sys_areas` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `sys_areas` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `sys_areas` VALUES ('2938', '621026', '宁　县', '621000');
INSERT INTO `sys_areas` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `sys_areas` VALUES ('2940', '621101', '市辖区', '621100');
INSERT INTO `sys_areas` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `sys_areas` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `sys_areas` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `sys_areas` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `sys_areas` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `sys_areas` VALUES ('2946', '621125', '漳　县', '621100');
INSERT INTO `sys_areas` VALUES ('2947', '621126', '岷　县', '621100');
INSERT INTO `sys_areas` VALUES ('2948', '621201', '市辖区', '621200');
INSERT INTO `sys_areas` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `sys_areas` VALUES ('2950', '621221', '成　县', '621200');
INSERT INTO `sys_areas` VALUES ('2951', '621222', '文　县', '621200');
INSERT INTO `sys_areas` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `sys_areas` VALUES ('2953', '621224', '康　县', '621200');
INSERT INTO `sys_areas` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `sys_areas` VALUES ('2955', '621226', '礼　县', '621200');
INSERT INTO `sys_areas` VALUES ('2956', '621227', '徽　县', '621200');
INSERT INTO `sys_areas` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `sys_areas` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `sys_areas` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `sys_areas` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `sys_areas` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `sys_areas` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `sys_areas` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `sys_areas` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `sys_areas` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `sys_areas` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `sys_areas` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `sys_areas` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `sys_areas` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `sys_areas` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `sys_areas` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `sys_areas` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `sys_areas` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `sys_areas` VALUES ('2974', '630101', '市辖区', '630100');
INSERT INTO `sys_areas` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `sys_areas` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `sys_areas` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `sys_areas` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `sys_areas` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `sys_areas` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `sys_areas` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `sys_areas` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `sys_areas` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `sys_areas` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `sys_areas` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `sys_areas` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `sys_areas` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `sys_areas` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `sys_areas` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `sys_areas` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `sys_areas` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `sys_areas` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `sys_areas` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `sys_areas` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `sys_areas` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `sys_areas` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `sys_areas` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `sys_areas` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `sys_areas` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `sys_areas` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `sys_areas` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `sys_areas` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `sys_areas` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `sys_areas` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `sys_areas` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `sys_areas` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `sys_areas` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `sys_areas` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `sys_areas` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `sys_areas` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `sys_areas` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `sys_areas` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `sys_areas` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `sys_areas` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `sys_areas` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `sys_areas` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `sys_areas` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `sys_areas` VALUES ('3018', '640101', '市辖区', '640100');
INSERT INTO `sys_areas` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `sys_areas` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `sys_areas` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `sys_areas` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `sys_areas` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `sys_areas` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `sys_areas` VALUES ('3025', '640201', '市辖区', '640200');
INSERT INTO `sys_areas` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `sys_areas` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `sys_areas` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `sys_areas` VALUES ('3029', '640301', '市辖区', '640300');
INSERT INTO `sys_areas` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `sys_areas` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `sys_areas` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `sys_areas` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `sys_areas` VALUES ('3034', '640401', '市辖区', '640400');
INSERT INTO `sys_areas` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `sys_areas` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `sys_areas` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `sys_areas` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `sys_areas` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `sys_areas` VALUES ('3040', '640501', '市辖区', '640500');
INSERT INTO `sys_areas` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `sys_areas` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `sys_areas` VALUES ('3043', '640522', '海原县', '640400');
INSERT INTO `sys_areas` VALUES ('3044', '650101', '市辖区', '650100');
INSERT INTO `sys_areas` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `sys_areas` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `sys_areas` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `sys_areas` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `sys_areas` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `sys_areas` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `sys_areas` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `sys_areas` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `sys_areas` VALUES ('3053', '650201', '市辖区', '650200');
INSERT INTO `sys_areas` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `sys_areas` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `sys_areas` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `sys_areas` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `sys_areas` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `sys_areas` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `sys_areas` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `sys_areas` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `sys_areas` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `sys_areas` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `sys_areas` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `sys_areas` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `sys_areas` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `sys_areas` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `sys_areas` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `sys_areas` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `sys_areas` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `sys_areas` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `sys_areas` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `sys_areas` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `sys_areas` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `sys_areas` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `sys_areas` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `sys_areas` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `sys_areas` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `sys_areas` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `sys_areas` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `sys_areas` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `sys_areas` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `sys_areas` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `sys_areas` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `sys_areas` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `sys_areas` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `sys_areas` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `sys_areas` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `sys_areas` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `sys_areas` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `sys_areas` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `sys_areas` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `sys_areas` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `sys_areas` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `sys_areas` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `sys_areas` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `sys_areas` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `sys_areas` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `sys_areas` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `sys_areas` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `sys_areas` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `sys_areas` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `sys_areas` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `sys_areas` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `sys_areas` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `sys_areas` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `sys_areas` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `sys_areas` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `sys_areas` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `sys_areas` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `sys_areas` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `sys_areas` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `sys_areas` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `sys_areas` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `sys_areas` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `sys_areas` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `sys_areas` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `sys_areas` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `sys_areas` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `sys_areas` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `sys_areas` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `sys_areas` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `sys_areas` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `sys_areas` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `sys_areas` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `sys_areas` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `sys_areas` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `sys_areas` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `sys_areas` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `sys_areas` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `sys_areas` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `sys_areas` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `sys_areas` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `sys_areas` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `sys_areas` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `sys_areas` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `sys_areas` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `sys_areas` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `sys_areas` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `sys_areas` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `sys_areas` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `sys_areas` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `sys_areas` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `sys_areas` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `dept_type` varchar(50) DEFAULT NULL COMMENT '机构类型（0，部门1，公司）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('132', '0', '0,', '微战略', '1', '1', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('133', '132', '0,132,', '技术部', '1', '0', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('134', '133', '0,132,133,', '技术1部', '1', '0', '1', '2018-07-25', null, '2018-07-25', '0');
INSERT INTO `sys_dept` VALUES ('135', '133', '0,132,133,', '技术2部', '2', '0', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('136', '133', '0,132,133,', '美工部', '3', '0', '1', '2018-07-25', null, '2018-07-25', '0');
INSERT INTO `sys_dept` VALUES ('137', '132', '0,132,', '人事部', '2', '0', '1', '2018-07-25', null, null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  `customs` varchar(20) DEFAULT NULL COMMENT '报关',
  `Inspection` varchar(20) DEFAULT NULL COMMENT '报检',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `customs` (`customs`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '图片名称',
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `pic_type` varchar(50) DEFAULT NULL COMMENT '类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `code` int(10) DEFAULT NULL COMMENT '关联id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('259', '005.jpg', 'http://localhost:8080/fileupload/20180706/fbc9117d-d1d6-43e3-bd67-e6a3074e364a.jpg', 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('260', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/056abb23-c55d-42e5-967a-d82821082d84.jpg', 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('296', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('297', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('298', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('299', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('300', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('301', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('302', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('303', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('304', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('305', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/ca618dd1-3310-4e1f-b041-1c746eca499d.jpg', 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('306', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('307', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('308', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('309', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('310', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('311', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('312', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('313', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('314', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('315', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('316', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('317', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('318', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('319', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('320', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('321', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('322', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('323', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('324', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('325', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('327', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('330', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/18508407-e42e-4798-aa94-5277f901e06f.jpg', 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('331', '001.jpg', 'http://localhost:8080/fileupload/20180706/88289d3d-66ab-4766-a20a-007bdce499cd.jpg', 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('332', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('333', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('334', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('335', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('336', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('337', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('338', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('339', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('340', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('341', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('342', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('343', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('344', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('345', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('346', null, null, 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('347', null, null, 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('348', 'timg.jpg', 'http://localhost:8080/fileupload/20180801/f869ad0d-b173-4080-b3e2-b3ae68357132.jpg', 'image_type_commodity', null, null, null, null, '127');
INSERT INTO `sys_image` VALUES ('349', null, null, 'image_type_commodity', null, null, null, null, '127');
INSERT INTO `sys_image` VALUES ('350', '146.jpg', 'http://localhost:8080/fileupload/20181008/855d47d0-0174-4ca2-bad5-47f1a4a85d9f.jpg', 'image_type_commodity', null, null, null, null, '127');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `source` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fas fa-archive\",\"orderNum\":1}', '24', '0:0:0:0:0:0:0:1', '2018-06-26 14:05:48', 'PC');
INSERT INTO `sys_log` VALUES ('2', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '32', '27', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:06', 'PC');
INSERT INTO `sys_log` VALUES ('3', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '33', '5', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:11', 'PC');
INSERT INTO `sys_log` VALUES ('4', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '34', '7', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:18', 'PC');
INSERT INTO `sys_log` VALUES ('5', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fas fa-archive\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-26 14:07:05', 'PC');
INSERT INTO `sys_log` VALUES ('6', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":35,\"parentName\":\"订单管理\",\"name\":\"订单查询\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-26 14:08:02', 'PC');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '86', '0:0:0:0:0:0:0:1', '2018-06-27 09:36:05', 'PC');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '297', '0:0:0:0:0:0:0:1', '2018-06-27 14:11:33', 'PC');
INSERT INTO `sys_log` VALUES ('9', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fa fa-archive\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-27 16:02:41', 'PC');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":5,\"username\":\"p\",\"password\":\"59fb34d9b2b17674c0382b3ce714348094bbcaf9e33e1e4554d5a0caa612408a\",\"salt\":\"jqwwgXFXbr6yr2q0aWBP\",\"email\":\"123@qq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:18:07 PM\"}', '171', '0:0:0:0:0:0:0:1', '2018-06-27 17:18:08', 'PC');
INSERT INTO `sys_log` VALUES ('11', 'hjw', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":6,\"username\":\"2\",\"password\":\"1cefad859d4b423a0a525371aaaf3166f722dde082e1350bae1265aa3721fd37\",\"salt\":\"rPHNHcwUrHiZAihUFl0k\",\"email\":\"2@qq.com\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Jun 27, 2018 5:18:48 PM\"}', '15178', '0:0:0:0:0:0:0:1', '2018-06-27 17:18:50', 'PC');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"112233\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\"}', '8', '0:0:0:0:0:0:0:1', '2018-06-27 17:23:05', 'PC');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-27 17:39:34', 'PC');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"modules/contract/info.html\",\"type\":1,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-27 17:55:05', 'PC');
INSERT INTO `sys_log` VALUES ('15', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"仓储管理\",\"type\":0,\"icon\":\"fa fa-university\",\"orderNum\":3}', '4', '0:0:0:0:0:0:0:1', '2018-06-27 17:59:01', 'PC');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45,56,57,58],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '62', '0:0:0:0:0:0:0:1', '2018-06-27 17:59:50', 'PC');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":56,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-27 18:02:47', 'PC');
INSERT INTO `sys_log` VALUES ('18', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"查看\",\"perms\":\"order:mxorder:info,order:mxorder:list\",\"type\":2,\"orderNum\":0}', '10', '0:0:0:0:0:0:0:1', '2018-06-28 09:35:14', 'PC');
INSERT INTO `sys_log` VALUES ('19', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"新增\",\"perms\":\"order:mxorder:save\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 09:35:54', 'PC');
INSERT INTO `sys_log` VALUES ('20', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"修改\",\"perms\":\"order:mxorder:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 09:36:20', 'PC');
INSERT INTO `sys_log` VALUES ('21', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"删除\",\"perms\":\"order:mxorder:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 09:36:44', 'PC');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理\",\"type\":0,\"icon\":\"address-book\",\"orderNum\":0}', '24', '0:0:0:0:0:0:0:1', '2018-06-28 11:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,56,57,69,70,71,72,73,74,58],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '582', '0:0:0:0:0:0:0:1', '2018-06-28 11:29:32', 'PC');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"仓储管理\",\"name\":\"仓库分类\",\"url\":\"modules/storage/storagerepertorycategory.html\",\"type\":1,\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:11:35', 'PC');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"仓储管理\",\"name\":\"仓库列表\",\"url\":\"modules/storage/storagerepertory.html\",\"type\":1,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:12:41', 'PC');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"查询\",\"perms\":\"storage:storagerepertorycategory:list,storage:storagerepertorycategory:info\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-06-28 14:15:19', 'PC');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"新增\",\"perms\":\"storage:storagerepertorycategory:save\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:16:46', 'PC');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"修改\",\"perms\":\"storage:storagerepertorycategory:update\",\"type\":2,\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-28 14:17:11', 'PC');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"删除\",\"perms\":\"storage:storagerepertorycategory:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:17:51', 'PC');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"查询\",\"perms\":\"storage:storagerepertory:list,storage:storagerepertory:info\",\"type\":2,\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-28 14:19:05', 'PC');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"新增\",\"perms\":\"storage:storagerepertory:save\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:19:32', 'PC');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"修改\",\"perms\":\"storage:storagerepertory:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:20:15', 'PC');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"删除\",\"perms\":\"storage:storagerepertory:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 14:20:43', 'PC');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,56,57,69,70,71,72,73,74,58,76,81,82,83,84,75,77,78,79,80],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '224', '0:0:0:0:0:0:0:1', '2018-06-28 14:21:05', 'PC');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:21:14', 'PC');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":95,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-28 15:21:33', 'PC');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同信息\",\"url\":\"contract/info.html\",\"type\":1,\"orderNum\":0}', '1', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:07', 'PC');
INSERT INTO `sys_log` VALUES ('38', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '96', '36', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:15', 'PC');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"contract/info.html\",\"type\":1,\"orderNum\":0}', '16', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:40', 'PC');
INSERT INTO `sys_log` VALUES ('40', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '97', '4', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:15', 'PC');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":85,\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"modules/contract/info.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:31', 'PC');
INSERT INTO `sys_log` VALUES ('42', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":90,\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同分类\",\"url\":\"modules/contract/category.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:42', 'PC');
INSERT INTO `sys_log` VALUES ('43', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":70,\"parentId\":69,\"parentName\":\"商户管理\",\"name\":\"商户\",\"url\":\"modules/esp/merchants.html\",\"type\":1,\"icon\":\"fa fa-users\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-28 16:49:35', 'PC');
INSERT INTO `sys_log` VALUES ('44', 'p', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[83]', '6', '0:0:0:0:0:0:0:1', '2018-06-28 16:51:47', 'PC');
INSERT INTO `sys_log` VALUES ('45', 'y', '仓库分类表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.save()', '{\"id\":86,\"name\":\"D\",\"parentId\":1,\"status\":\"1\",\"type\":\"df\"}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 17:41:22', 'PC');
INSERT INTO `sys_log` VALUES ('46', 'y', '仓库表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.save()', '{\"id\":54,\"serialNumber\":\"dfg\",\"name\":\"hgf\",\"categoryId\":1,\"warehousemanId\":1,\"remark\":\"gfhgfhdgf\",\"state\":\"1\"}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:43:49', 'PC');
INSERT INTO `sys_log` VALUES ('47', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[83]', '7', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:09', 'PC');
INSERT INTO `sys_log` VALUES ('48', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[86,83]', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:20', 'PC');
INSERT INTO `sys_log` VALUES ('49', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[86]', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:33', 'PC');
INSERT INTO `sys_log` VALUES ('50', 'y', '仓库表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.delete()', '[54]', '27', '0:0:0:0:0:0:0:1', '2018-06-28 18:02:17', 'PC');
INSERT INTO `sys_log` VALUES ('51', 'hjw', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-06-29 10:51:20', 'PC');
INSERT INTO `sys_log` VALUES ('52', 'hjw', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-apple\",\"orderNum\":0}', '17', '0:0:0:0:0:0:0:1', '2018-06-29 10:55:19', 'PC');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,98,104,105,106,107],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '165', '0:0:0:0:0:0:0:1', '2018-06-29 11:14:14', 'PC');
INSERT INTO `sys_log` VALUES ('54', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":4}', '57', '0:0:0:0:0:0:0:1', '2018-06-29 11:31:32', 'PC');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户列表\",\"url\":\"modules/company/company.html\",\"type\":1,\"orderNum\":0}', '51', '0:0:0:0:0:0:0:1', '2018-06-29 13:08:56', 'PC');
INSERT INTO `sys_log` VALUES ('56', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"查询\",\"perms\":\"company:company:list,company:company:info\",\"type\":2,\"orderNum\":0}', '9', '0:0:0:0:0:0:0:1', '2018-06-29 13:11:21', 'PC');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"新增\",\"perms\":\"company:company:save\",\"type\":2,\"orderNum\":0}', '50', '0:0:0:0:0:0:0:1', '2018-06-29 13:11:44', 'PC');
INSERT INTO `sys_log` VALUES ('58', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"修改\",\"perms\":\"company:company:update\",\"type\":2,\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-06-29 13:12:06', 'PC');
INSERT INTO `sys_log` VALUES ('59', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"删除\",\"perms\":\"company:company:delete\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-29 13:12:25', 'PC');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,98,104,105,106,107,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '149', '0:0:0:0:0:0:0:1', '2018-06-29 13:13:14', 'PC');
INSERT INTO `sys_log` VALUES ('61', 'p', '仓库表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.save()', '{\"id\":55}', '12', '0:0:0:0:0:0:0:1', '2018-06-29 13:38:54', 'PC');
INSERT INTO `sys_log` VALUES ('62', 'p', '仓库表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.delete()', '[55]', '40', '0:0:0:0:0:0:0:1', '2018-06-29 13:38:59', 'PC');
INSERT INTO `sys_log` VALUES ('63', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":12,\"username\":\"s\",\"password\":\"ec084b37d0c737894d15f790f31a4d924e87a03a29de5256259f6cf3b94eaeb4\",\"salt\":\"C45QuiTDQ7ui4cj3ndYi\",\"email\":\"888@qq.com\",\"mobile\":\"hgfh\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Jun 29, 2018 1:43:33 PM\"}', '130', '0:0:0:0:0:0:0:1', '2018-06-29 13:43:33', 'PC');
INSERT INTO `sys_log` VALUES ('64', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[12]', '6', '0:0:0:0:0:0:0:1', '2018-06-29 13:43:44', 'PC');
INSERT INTO `sys_log` VALUES ('65', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":13,\"username\":\"a\",\"password\":\"f724f56f33d862f80e7d03c06a109be2bdb5d31b46d31d9ab2d7e14cdceb3659\",\"salt\":\"A8ibrcBjUNoA7WTMdbpG\",\"email\":\"888@qq.com\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Jun 29, 2018 1:55:26 PM\"}', '64', '0:0:0:0:0:0:0:1', '2018-06-29 13:55:27', 'PC');
INSERT INTO `sys_log` VALUES ('66', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[13]', '4', '0:0:0:0:0:0:0:1', '2018-06-29 13:55:41', 'PC');
INSERT INTO `sys_log` VALUES ('67', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '37', '140', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:20', 'PC');
INSERT INTO `sys_log` VALUES ('68', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '41', '10', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:26', 'PC');
INSERT INTO `sys_log` VALUES ('69', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '42', '25', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:32', 'PC');
INSERT INTO `sys_log` VALUES ('70', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '43', '15', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:37', 'PC');
INSERT INTO `sys_log` VALUES ('71', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '44', '6', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:42', 'PC');
INSERT INTO `sys_log` VALUES ('72', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '45', '9', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:48', 'PC');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":14,\"username\":\"zeyee\",\"password\":\"174292669168ba2da14420945304db09f9a6ac6a887ea922a0b5326fdab517af\",\"salt\":\"0o30V9IvHd2ciiJVPK6B\",\"email\":\"zeyee@vps.com\",\"mobile\":\"15895825435\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 2, 2018 9:11:22 AM\"}', '1169', '0:0:0:0:0:0:0:1', '2018-07-02 09:11:23', 'PC');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,104,105,106,107,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '14', '0:0:0:0:0:0:0:1', '2018-07-02 09:11:57', 'PC');
INSERT INTO `sys_log` VALUES ('75', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":15,\"username\":\"zz\",\"password\":\"f262142f5121cec0585310597a7f322a0d0c23ac0db2f41f9b3ca2b9c6200158\",\"salt\":\"D1iY9dCuqBPeFbH9z7Br\",\"email\":\"123@123.com\",\"mobile\":\"13888888888\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 2, 2018 9:21:52 AM\"}', '179', '0:0:0:0:0:0:0:1', '2018-07-02 09:21:53', 'PC');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '265', '0:0:0:0:0:0:0:1', '2018-07-02 10:40:18', 'PC');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '95', '0:0:0:0:0:0:0:1', '2018-07-02 13:27:18', 'PC');
INSERT INTO `sys_log` VALUES ('78', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户类型\",\"url\":\"modules/company/companytype.html\",\"type\":1,\"orderNum\":1}', '5', '0:0:0:0:0:0:0:1', '2018-07-02 14:49:11', 'PC');
INSERT INTO `sys_log` VALUES ('79', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"查看\",\"perms\":\"company:companytype:list,company:companytype:info\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-02 14:51:01', 'PC');
INSERT INTO `sys_log` VALUES ('80', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"新增\",\"perms\":\"company:companytype:save\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-07-02 14:51:41', 'PC');
INSERT INTO `sys_log` VALUES ('81', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"修改\",\"perms\":\"company:companytype:update\",\"type\":2,\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2018-07-02 14:52:01', 'PC');
INSERT INTO `sys_log` VALUES ('82', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"删除\",\"perms\":\"company:companytype:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-02 14:52:23', 'PC');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '70', '0:0:0:0:0:0:0:1', '2018-07-02 14:53:00', 'PC');
INSERT INTO `sys_log` VALUES ('84', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"自主报关\",\"type\":0,\"icon\":\"fa fa-ship\",\"orderNum\":5}', '108', '0:0:0:0:0:0:0:1', '2018-07-06 09:15:14', 'PC');
INSERT INTO `sys_log` VALUES ('85', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"进口报关\",\"type\":0,\"icon\":\"fa fa-reply\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:16:52', 'PC');
INSERT INTO `sys_log` VALUES ('86', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa fa-reply\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:17:19', 'PC');
INSERT INTO `sys_log` VALUES ('87', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 09:17:41', 'PC');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '121', '0:0:0:0:0:0:0:1', '2018-07-06 09:18:46', 'PC');
INSERT INTO `sys_log` VALUES ('89', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"Summary result message\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:21:58', 'PC');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"message/summaryResult\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:22:37', 'PC');
INSERT INTO `sys_log` VALUES ('91', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 09:27:29', 'PC');
INSERT INTO `sys_log` VALUES ('92', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '14', '0:0:0:0:0:0:0:1', '2018-07-06 09:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('93', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"orderNum\":6}', '6', '0:0:0:0:0:0:0:1', '2018-07-06 14:52:58', 'PC');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":9}', '6', '0:0:0:0:0:0:0:1', '2018-07-06 14:53:11', 'PC');
INSERT INTO `sys_log` VALUES ('95', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":6}', '10', '0:0:0:0:0:0:0:1', '2018-07-06 14:53:19', 'PC');
INSERT INTO `sys_log` VALUES ('96', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:06', 'PC');
INSERT INTO `sys_log` VALUES ('97', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '26', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:33', 'PC');
INSERT INTO `sys_log` VALUES ('98', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:44', 'PC');
INSERT INTO `sys_log` VALUES ('99', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"撤销申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":4}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:55:29', 'PC');
INSERT INTO `sys_log` VALUES ('100', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:56:11', 'PC');
INSERT INTO `sys_log` VALUES ('101', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:56:26', 'PC');
INSERT INTO `sys_log` VALUES ('102', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"1离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:03', 'PC');
INSERT INTO `sys_log` VALUES ('103', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:20', 'PC');
INSERT INTO `sys_log` VALUES ('104', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":3}', '23', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:30', 'PC');
INSERT INTO `sys_log` VALUES ('105', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2018-07-06 14:59:56', 'PC');
INSERT INTO `sys_log` VALUES ('106', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":135,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:00:21', 'PC');
INSERT INTO `sys_log` VALUES ('107', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:07', 'PC');
INSERT INTO `sys_log` VALUES ('108', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":-1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:22', 'PC');
INSERT INTO `sys_log` VALUES ('109', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":8}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:35', 'PC');
INSERT INTO `sys_log` VALUES ('110', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":7}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:44', 'PC');
INSERT INTO `sys_log` VALUES ('111', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":132,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"撤销申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":6}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:52', 'PC');
INSERT INTO `sys_log` VALUES ('112', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:00', 'PC');
INSERT INTO `sys_log` VALUES ('113', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":4}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:09', 'PC');
INSERT INTO `sys_log` VALUES ('114', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":135,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":3}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:17', 'PC');
INSERT INTO `sys_log` VALUES ('115', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:26', 'PC');
INSERT INTO `sys_log` VALUES ('116', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":1}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:25', 'PC');
INSERT INTO `sys_log` VALUES ('117', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:34', 'PC');
INSERT INTO `sys_log` VALUES ('118', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":137,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:41', 'PC');
INSERT INTO `sys_log` VALUES ('119', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:04:15', 'PC');
INSERT INTO `sys_log` VALUES ('120', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '353', '0:0:0:0:0:0:0:1', '2018-07-06 15:04:30', 'PC');
INSERT INTO `sys_log` VALUES ('121', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '1596', '0:0:0:0:0:0:0:1', '2018-07-06 15:30:10', 'PC');
INSERT INTO `sys_log` VALUES ('122', 'p', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '5', '0:0:0:0:0:0:0:1', '2018-07-09 14:51:43', 'PC');
INSERT INTO `sys_log` VALUES ('123', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"查询\",\"perms\":\"message:customsinventory:list,message:customsinventory:info\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-09 14:53:05', 'PC');
INSERT INTO `sys_log` VALUES ('124', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"新增\",\"perms\":\"message:customsinventory:save\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-09 14:53:36', 'PC');
INSERT INTO `sys_log` VALUES ('125', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"修改\",\"perms\":\"message:customsinventory:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-09 14:54:00', 'PC');
INSERT INTO `sys_log` VALUES ('126', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"删除\",\"perms\":\"message:customsinventory:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-09 14:54:30', 'PC');
INSERT INTO `sys_log` VALUES ('127', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '82', '0:0:0:0:0:0:0:1', '2018-07-09 15:53:31', 'PC');
INSERT INTO `sys_log` VALUES ('128', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"新增\",\"perms\":\"message:summaryresult:add\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:15', 'PC');
INSERT INTO `sys_log` VALUES ('129', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"修改\",\"perms\":\"message:summaryresult:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:37', 'PC');
INSERT INTO `sys_log` VALUES ('130', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"删除\",\"perms\":\"message:summaryresult:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:56', 'PC');
INSERT INTO `sys_log` VALUES ('131', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":148,\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"新增\",\"perms\":\"message:summaryresult:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 09:17:42', 'PC');
INSERT INTO `sys_log` VALUES ('132', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结果单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":9}', '18', '0:0:0:0:0:0:0:1', '2018-07-10 09:17:57', 'PC');
INSERT INTO `sys_log` VALUES ('133', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":16,\"username\":\"1\",\"password\":\"1722d10fd8db67a5cb44664b55a6a253de86b839a084148c490acc4aa36f9e58\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\"}', '199', '0:0:0:0:0:0:0:1', '2018-07-10 09:27:49', 'PC');
INSERT INTO `sys_log` VALUES ('134', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '146', '0:0:0:0:0:0:0:1', '2018-07-10 09:45:45', 'PC');
INSERT INTO `sys_log` VALUES ('135', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":8}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 11:00:55', 'PC');
INSERT INTO `sys_log` VALUES ('136', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"新增\",\"perms\":\"message:summaryapply:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:19', 'PC');
INSERT INTO `sys_log` VALUES ('137', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"修稿\",\"perms\":\"message:summaryapply:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:37', 'PC');
INSERT INTO `sys_log` VALUES ('138', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"删除\",\"perms\":\"message:summaryapply:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:52', 'PC');
INSERT INTO `sys_log` VALUES ('139', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,151,152,153,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '25', '0:0:0:0:0:0:0:1', '2018-07-10 11:02:15', 'PC');
INSERT INTO `sys_log` VALUES ('140', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/activity/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '24', '0:0:0:0:0:0:0:1', '2018-07-10 13:41:10', 'PC');
INSERT INTO `sys_log` VALUES ('141', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/activity/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 13:41:30', 'PC');
INSERT INTO `sys_log` VALUES ('142', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 13:42:06', 'PC');
INSERT INTO `sys_log` VALUES ('143', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '137', '89', '0:0:0:0:0:0:0:1', '2018-07-10 13:43:08', 'PC');
INSERT INTO `sys_log` VALUES ('144', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"详情\",\"perms\":\"message:summaryapply:info\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 10:35:58', 'PC');
INSERT INTO `sys_log` VALUES ('145', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,136,135,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '168', '0:0:0:0:0:0:0:1', '2018-07-11 10:36:09', 'PC');
INSERT INTO `sys_log` VALUES ('146', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"新增\",\"perms\":\"ceb505logistics:save\",\"type\":2,\"orderNum\":0}', '17', '0:0:0:0:0:0:0:1', '2018-07-11 16:04:22', 'PC');
INSERT INTO `sys_log` VALUES ('147', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"删除\",\"perms\":\"ceb505logistics:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 16:05:05', 'PC');
INSERT INTO `sys_log` VALUES ('148', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"修改\",\"perms\":\"ceb505logistics:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 16:05:45', 'PC');
INSERT INTO `sys_log` VALUES ('149', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"查看\",\"perms\":\"ceb505logistics:info,ceb505logistics:list\",\"type\":2,\"orderNum\":0}', '1', '0:0:0:0:0:0:0:1', '2018-07-11 16:06:17', 'PC');
INSERT INTO `sys_log` VALUES ('150', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":160,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"新增\",\"perms\":\"messgse:ceb505logistics:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:11', 'PC');
INSERT INTO `sys_log` VALUES ('151', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":161,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"删除\",\"perms\":\"messgse:ceb505logistics:delete\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:28', 'PC');
INSERT INTO `sys_log` VALUES ('152', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":162,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"修改\",\"perms\":\"messgse:ceb505logistics:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:44', 'PC');
INSERT INTO `sys_log` VALUES ('153', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":163,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"查看\",\"perms\":\"messgse:ceb505logistics:info,messgse:ceb505logistics:list\",\"type\":2,\"orderNum\":0}', '11', '0:0:0:0:0:0:0:1', '2018-07-11 16:28:07', 'PC');
INSERT INTO `sys_log` VALUES ('154', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":138,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:list,message:customsorder:update,message:customsorder:delete,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-07-11 18:09:57', 'PC');
INSERT INTO `sys_log` VALUES ('155', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"新增\",\"perms\":\"message:customsorder:save\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-07-11 18:10:16', 'PC');
INSERT INTO `sys_log` VALUES ('156', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"修改\",\"perms\":\"message:customsorder:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:10:37', 'PC');
INSERT INTO `sys_log` VALUES ('157', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"详情\",\"perms\":\"message:customsorder:info\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:04', 'PC');
INSERT INTO `sys_log` VALUES ('158', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"删除\",\"perms\":\"message:customsorder:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:18', 'PC');
INSERT INTO `sys_log` VALUES ('159', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,164,165,166,167,136,160,161,162,163,135,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '182', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:56', 'PC');
INSERT INTO `sys_log` VALUES ('160', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"新增\",\"perms\":\"message:ceb507arrival:save\",\"type\":2,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:05', 'PC');
INSERT INTO `sys_log` VALUES ('161', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"删除\",\"perms\":\"message:ceb507arrival:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:24', 'PC');
INSERT INTO `sys_log` VALUES ('162', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"更新\",\"perms\":\"message:ceb507arrival:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:43', 'PC');
INSERT INTO `sys_log` VALUES ('163', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"查看\",\"perms\":\"message:ceb507arrival:info\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:56', 'PC');
INSERT INTO `sys_log` VALUES ('164', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,128,138,164,165,166,167,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '2330', '0:0:0:0:0:0:0:1', '2018-07-16 13:45:12', 'PC');
INSERT INTO `sys_log` VALUES ('165', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":177,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"商品信息\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2018-07-17 10:23:05', 'PC');
INSERT INTO `sys_log` VALUES ('166', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,177,178,179,180,181,128,138,164,165,166,167,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '180', '0:0:0:0:0:0:0:1', '2018-07-17 15:09:45', 'PC');
INSERT INTO `sys_log` VALUES ('167', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-17 15:20:30', 'PC');
INSERT INTO `sys_log` VALUES ('168', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":17,\"username\":\"q\",\"password\":\"a8fd29de3a9fa2e284c1c48352d4db03fa6ef47e2849356dc383a7eb2f310795\",\"salt\":\"VfpNCBdTf25anvdi63Zx\",\"email\":\"q@qq.com\",\"mobile\":\"q\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 17, 2018 3:21:24 PM\"}', '234', '0:0:0:0:0:0:0:1', '2018-07-17 15:21:25', 'PC');
INSERT INTO `sys_log` VALUES ('169', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '13', '0:0:0:0:0:0:0:1', '2018-07-17 15:22:33', 'PC');
INSERT INTO `sys_log` VALUES ('170', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '22', '0:0:0:0:0:0:0:1', '2018-07-17 15:23:12', 'PC');
INSERT INTO `sys_log` VALUES ('171', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-FILE-TEXT-o\",\"orderNum\":0}', '14', '0:0:0:0:0:0:0:1', '2018-07-19 17:53:07', 'PC');
INSERT INTO `sys_log` VALUES ('172', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '8', '0:0:0:0:0:0:0:1', '2018-07-19 17:53:37', 'PC');
INSERT INTO `sys_log` VALUES ('173', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,154,155,156,157,158,187,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '173', '0:0:0:0:0:0:0:1', '2018-07-19 17:54:28', 'PC');
INSERT INTO `sys_log` VALUES ('174', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"新增\",\"perms\":\"message:customsorder:sava\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-19 17:55:05', 'PC');
INSERT INTO `sys_log` VALUES ('175', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"列表查询\",\"perms\":\"message:customsorder:list\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-19 17:55:33', 'PC');
INSERT INTO `sys_log` VALUES ('176', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"详情查询\",\"perms\":\"message:customsorder:info\",\"type\":2,\"orderNum\":0}', '70', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:00', 'PC');
INSERT INTO `sys_log` VALUES ('177', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"修改\",\"perms\":\"message:customsorder:update\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:16', 'PC');
INSERT INTO `sys_log` VALUES ('178', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"删除\",\"perms\":\"message:customsorder:delete\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:33', 'PC');
INSERT INTO `sys_log` VALUES ('179', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:49', 'PC');
INSERT INTO `sys_log` VALUES ('180', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '17', '0:0:0:0:0:0:0:1', '2018-07-19 17:57:02', 'PC');
INSERT INTO `sys_log` VALUES ('181', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文（海关）\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '11', '0:0:0:0:0:0:0:1', '2018-07-20 16:39:05', 'PC');
INSERT INTO `sys_log` VALUES ('182', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '161', '0:0:0:0:0:0:0:1', '2018-07-20 16:39:31', 'PC');
INSERT INTO `sys_log` VALUES ('183', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '9', '0:0:0:0:0:0:0:1', '2018-07-20 16:40:36', 'PC');
INSERT INTO `sys_log` VALUES ('184', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '138', '2', '0:0:0:0:0:0:0:1', '2018-07-21 15:52:53', 'PC');
INSERT INTO `sys_log` VALUES ('185', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '165', '23', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:02', 'PC');
INSERT INTO `sys_log` VALUES ('186', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '167', '6', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:14', 'PC');
INSERT INTO `sys_log` VALUES ('187', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '166', '6', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:28', 'PC');
INSERT INTO `sys_log` VALUES ('188', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '164', '5', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:39', 'PC');
INSERT INTO `sys_log` VALUES ('189', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '138', '5', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:47', 'PC');
INSERT INTO `sys_log` VALUES ('190', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-07-21 15:54:02', 'PC');
INSERT INTO `sys_log` VALUES ('191', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":188,\"parentId\":187,\"parentName\":\"订单报文\",\"name\":\"新增\",\"perms\":\"message:customsorder:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-21 16:25:24', 'PC');
INSERT INTO `sys_log` VALUES ('192', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '314', '0:0:0:0:0:0:0:1', '2018-07-21 16:25:42', 'PC');
INSERT INTO `sys_log` VALUES ('193', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"组织架构\",\"url\":\"http://localhost:8081/index.html#modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '3', '0:0:0:0:0:0:0:1', '2018-07-23 15:32:20', 'PC');
INSERT INTO `sys_log` VALUES ('194', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,198,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '274', '0:0:0:0:0:0:0:1', '2018-07-23 15:33:06', 'PC');
INSERT INTO `sys_log` VALUES ('195', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '198', '23', '0:0:0:0:0:0:0:1', '2018-07-23 15:33:59', 'PC');
INSERT INTO `sys_log` VALUES ('196', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 15:35:02', 'PC');
INSERT INTO `sys_log` VALUES ('197', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '26', '0:0:0:0:0:0:0:1', '2018-07-23 15:35:51', 'PC');
INSERT INTO `sys_log` VALUES ('198', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '183', '0:0:0:0:0:0:0:1', '2018-07-23 15:41:59', 'PC');
INSERT INTO `sys_log` VALUES ('199', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"新增\",\"perms\":\"sys:sysdept:save\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:08:10', 'PC');
INSERT INTO `sys_log` VALUES ('200', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"删除\",\"perms\":\"sys:sysdept:delete\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:08:45', 'PC');
INSERT INTO `sys_log` VALUES ('201', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '85', '0:0:0:0:0:0:0:1', '2018-07-23 16:09:11', 'PC');
INSERT INTO `sys_log` VALUES ('202', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '2', '0:0:0:0:0:0:0:1', '2018-07-23 16:09:41', 'PC');
INSERT INTO `sys_log` VALUES ('203', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:10:13', 'PC');
INSERT INTO `sys_log` VALUES ('204', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '234', '0:0:0:0:0:0:0:1', '2018-07-23 16:31:57', 'PC');
INSERT INTO `sys_log` VALUES ('205', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '75', '839', '0:0:0:0:0:0:0:1', '2018-07-23 16:29:48', 'PC');
INSERT INTO `sys_log` VALUES ('206', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '16', '1135', '0:0:0:0:0:0:0:1', '2018-07-23 16:33:13', 'PC');
INSERT INTO `sys_log` VALUES ('207', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '28', '837', '0:0:0:0:0:0:0:1', '2018-07-23 16:35:04', 'PC');
INSERT INTO `sys_log` VALUES ('208', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"修改\",\"perms\":\"sys:sysdept:update\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-23 16:37:03', 'PC');
INSERT INTO `sys_log` VALUES ('209', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '15', '0:0:0:0:0:0:0:1', '2018-07-23 16:37:16', 'PC');
INSERT INTO `sys_log` VALUES ('210', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":194,\"parentId\":193,\"parentName\":\"清单总分单报文\",\"name\":\"详情\",\"perms\":\"waybill:waybill:list,waybill:waybill:info\",\"type\":2,\"orderNum\":1}', '6', '0:0:0:0:0:0:0:1', '2018-07-23 19:52:26', 'PC');
INSERT INTO `sys_log` VALUES ('211', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:06:43', 'PC');
INSERT INTO `sys_log` VALUES ('212', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:00', 'PC');
INSERT INTO `sys_log` VALUES ('213', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '2', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:17', 'PC');
INSERT INTO `sys_log` VALUES ('214', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '15', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:37', 'PC');
INSERT INTO `sys_log` VALUES ('215', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '4', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:54', 'PC');
INSERT INTO `sys_log` VALUES ('216', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '3', '0:0:0:0:0:0:0:1', '2018-07-25 10:08:19', 'PC');
INSERT INTO `sys_log` VALUES ('217', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:09:21', 'PC');
INSERT INTO `sys_log` VALUES ('218', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '19436', '0:0:0:0:0:0:0:1', '2018-07-25 10:11:53', 'PC');
INSERT INTO `sys_log` VALUES ('219', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '247', '0:0:0:0:0:0:0:1', '2018-07-25 16:58:48', 'PC');
INSERT INTO `sys_log` VALUES ('220', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '6', '0:0:0:0:0:0:0:1', '2018-07-25 16:59:03', 'PC');
INSERT INTO `sys_log` VALUES ('221', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:00:07', 'PC');
INSERT INTO `sys_log` VALUES ('222', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:01:15', 'PC');
INSERT INTO `sys_log` VALUES ('223', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":135}', '8327', '0:0:0:0:0:0:0:1', '2018-07-25 17:01:55', 'PC');
INSERT INTO `sys_log` VALUES ('224', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134}', '6386', '0:0:0:0:0:0:0:1', '2018-07-25 17:10:46', 'PC');
INSERT INTO `sys_log` VALUES ('225', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '95', '0:0:0:0:0:0:0:1', '2018-07-25 17:13:58', 'PC');
INSERT INTO `sys_log` VALUES ('226', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '17635', '0:0:0:0:0:0:0:1', '2018-07-25 17:15:12', 'PC');
INSERT INTO `sys_log` VALUES ('227', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '2154', '0:0:0:0:0:0:0:1', '2018-07-25 17:18:59', 'PC');
INSERT INTO `sys_log` VALUES ('228', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":16,\"username\":\"1\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\",\"departmentId\":137}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:18', 'PC');
INSERT INTO `sys_log` VALUES ('229', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":18,\"username\":\"ssshao\",\"password\":\"ca5cc1209ead245d10e60daae98b8d636dcd576a26df72175041bf6d733f3ffd\",\"salt\":\"V85lRhcnuEAE1lHigWee\",\"email\":\"145@qq.com\",\"mobile\":\"15555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 25, 2018 5:19:47 PM\",\"departmentId\":134}', '27', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:48', 'PC');
INSERT INTO `sys_log` VALUES ('230', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":18,\"username\":\"ssshao\",\"salt\":\"V85lRhcnuEAE1lHigWee\",\"email\":\"145@qq.com\",\"mobile\":\"15555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 25, 2018 5:19:48 PM\",\"departmentId\":136,\"departmentName\":\"技术1部\"}', '6', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:55', 'PC');
INSERT INTO `sys_log` VALUES ('231', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":4,\"username\":\"aa\",\"salt\":\"AzqDHoXpI10ou0DC9LkN\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 26, 2018 1:35:17 PM\",\"departmentId\":135,\"departmentName\":\"技术1部\"}', '37', '0:0:0:0:0:0:0:1', '2018-07-25 20:03:53', 'PC');
INSERT INTO `sys_log` VALUES ('232', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":95,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理--作废\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":100}', '6', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:18', 'PC');
INSERT INTO `sys_log` VALUES ('233', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理--作废\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:46', 'PC');
INSERT INTO `sys_log` VALUES ('234', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理--作废\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":101}', '3', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:57', 'PC');
INSERT INTO `sys_log` VALUES ('235', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":58,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"仓储管理--作废\",\"type\":0,\"icon\":\"fa fa-university\",\"orderNum\":102}', '5', '0:0:0:0:0:0:0:1', '2018-08-09 17:34:12', 'PC');
INSERT INTO `sys_log` VALUES ('236', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理-备用\",\"type\":0,\"icon\":\"fa fa-archive\",\"orderNum\":104}', '4', '0:0:0:0:0:0:0:1', '2018-08-09 17:34:37', 'PC');
INSERT INTO `sys_log` VALUES ('237', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构--重写\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '6', '0:0:0:0:0:0:0:1', '2018-08-09 17:37:54', 'PC');
INSERT INTO `sys_log` VALUES ('238', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '152', '0:0:0:0:0:0:0:1', '2018-08-27 16:46:11', 'PC');
INSERT INTO `sys_log` VALUES ('239', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,126,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '35', '0:0:0:0:0:0:0:1', '2018-08-27 16:47:10', 'PC');
INSERT INTO `sys_log` VALUES ('240', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-09-30 09:26:57', 'PC');
INSERT INTO `sys_log` VALUES ('241', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-09-30 09:27:19', 'PC');
INSERT INTO `sys_log` VALUES ('242', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-09-30 09:27:37', 'PC');
INSERT INTO `sys_log` VALUES ('243', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '99', '0:0:0:0:0:0:0:1', '2018-09-30 09:28:22', 'PC');
INSERT INTO `sys_log` VALUES ('244', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-10-09 10:30:20', 'PC');
INSERT INTO `sys_log` VALUES ('245', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '117', '0:0:0:0:0:0:0:1', '2018-10-09 11:11:02', 'PC');
INSERT INTO `sys_log` VALUES ('246', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '98', '0:0:0:0:0:0:0:1', '2018-10-10 09:44:22', 'PC');
INSERT INTO `sys_log` VALUES ('247', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '129', '0:0:0:0:0:0:0:1', '2018-10-11 11:25:11', 'PC');
INSERT INTO `sys_log` VALUES ('248', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '124', '0:0:0:0:0:0:0:1', '2018-10-11 11:25:33', 'PC');
INSERT INTO `sys_log` VALUES ('249', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"fe048887cb4568a0ca7cd850532c064f7a90b4dd79a97bac4152398260ca403a\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\"}', '340', '0:0:0:0:0:0:0:1', '2018-10-25 18:04:53', 'PC');
INSERT INTO `sys_log` VALUES ('250', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":22,\"username\":\"5\",\"password\":\"b31a251070af43c0a5d8fd97335f8645aa84e35d7d7df8c8aa2aa06b334d96aa\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832232\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '131', '0:0:0:0:0:0:0:1', '2018-11-07 09:08:42', 'PC');
INSERT INTO `sys_log` VALUES ('251', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":22,\"username\":\"544\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832235\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '152', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:01', 'PC');
INSERT INTO `sys_log` VALUES ('252', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":22,\"username\":\"544\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832235\",\"status\":0,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '387', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:07', 'PC');
INSERT INTO `sys_log` VALUES ('253', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[22]', '330', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:13', 'PC');
INSERT INTO `sys_log` VALUES ('254', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"2\",\"remark\":\"2\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:10:59 AM\"}', '376', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:00', 'PC');
INSERT INTO `sys_log` VALUES ('255', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"2\",\"remark\":\"2333\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:11:00 AM\"}', '131', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:07', 'PC');
INSERT INTO `sys_log` VALUES ('256', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[2]', '386', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:17', 'PC');
INSERT INTO `sys_log` VALUES ('257', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"222\",\"remark\":\"222\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:11:35 AM\"}', '134', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:35', 'PC');
INSERT INTO `sys_log` VALUES ('258', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[3]', '99', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:52', 'PC');
INSERT INTO `sys_log` VALUES ('259', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"11111\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"icon\":\"1\",\"orderNum\":0}', '34', '0:0:0:0:0:0:0:1', '2018-11-07 09:12:40', 'PC');
INSERT INTO `sys_log` VALUES ('260', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":203,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"11111\",\"url\":\"1\",\"perms\":\"1\",\"type\":0,\"icon\":\"1\",\"orderNum\":0}', '36', '0:0:0:0:0:0:0:1', '2018-11-07 09:13:29', 'PC');
INSERT INTO `sys_log` VALUES ('261', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '203', '116', '0:0:0:0:0:0:0:1', '2018-11-07 09:13:42', 'PC');
INSERT INTO `sys_log` VALUES ('262', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":26,\"username\":\"7415\",\"password\":\"f797fbf1614434519e0826f91dcf0e7933290d880690e14e441b8240e20e405f\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@qq.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '149', '0:0:0:0:0:0:0:1', '2018-11-07 09:17:09', 'PC');
INSERT INTO `sys_log` VALUES ('263', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":26,\"username\":\"7415\",\"password\":\"2cd4898cfee8cfb6ab52b4f515f3a3946d09a7c83976387b4caba527b032c23b\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@qq.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '198', '0:0:0:0:0:0:0:1', '2018-11-07 09:17:22', 'PC');
INSERT INTO `sys_log` VALUES ('264', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":27,\"username\":\"8585\",\"password\":\"5cee50bb13f2bed905cd70fbb7f11f0dca49c63c24e8ca9ee4ec9257f4fd7ad9\",\"salt\":\"43FtIEIBQq5RTkij3LRj\",\"email\":\"764686889@qq.com\",\"mobile\":\"45623568911\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:18:03 AM\"}', '212', '0:0:0:0:0:0:0:1', '2018-11-07 09:18:04', 'PC');
INSERT INTO `sys_log` VALUES ('265', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":26,\"username\":\"7415\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@ss.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '197', '0:0:0:0:0:0:0:1', '2018-11-07 09:19:37', 'PC');
INSERT INTO `sys_log` VALUES ('266', '1', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[27,26]', '152', '0:0:0:0:0:0:0:1', '2018-11-07 09:20:59', 'PC');
INSERT INTO `sys_log` VALUES ('267', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"1\",\"remark\":\"1\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:22:43 AM\"}', '241', '0:0:0:0:0:0:0:1', '2018-11-07 09:22:44', 'PC');
INSERT INTO `sys_log` VALUES ('268', '1', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":4,\"roleName\":\"1\",\"remark\":\"1222\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:22:44 AM\"}', '236', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:03', 'PC');
INSERT INTO `sys_log` VALUES ('269', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[4]', '162', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:29', 'PC');
INSERT INTO `sys_log` VALUES ('270', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":5,\"roleName\":\"2222\",\"remark\":\"11111\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:23:45 AM\"}', '238', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:46', 'PC');
INSERT INTO `sys_log` VALUES ('271', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[5]', '155', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:51', 'PC');
INSERT INTO `sys_log` VALUES ('272', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":6,\"roleName\":\"55557777\",\"remark\":\"5555\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:24:34 AM\"}', '223', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:35', 'PC');
INSERT INTO `sys_log` VALUES ('273', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":7,\"roleName\":\"5586868\",\"remark\":\"68688\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:24:44 AM\"}', '467', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:45', 'PC');
INSERT INTO `sys_log` VALUES ('274', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[6]', '151', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:49', 'PC');
INSERT INTO `sys_log` VALUES ('275', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[7]', '157', '0:0:0:0:0:0:0:1', '2018-11-07 09:25:40', 'PC');
INSERT INTO `sys_log` VALUES ('276', '1', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"858585\",\"url\":\"8\",\"type\":1,\"orderNum\":0}', '54', '0:0:0:0:0:0:0:1', '2018-11-07 09:26:04', 'PC');
INSERT INTO `sys_log` VALUES ('277', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":204,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"858585\",\"url\":\"8\",\"type\":0,\"orderNum\":0}', '52', '0:0:0:0:0:0:0:1', '2018-11-07 09:26:45', 'PC');
INSERT INTO `sys_log` VALUES ('278', '1', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '204', '186', '0:0:0:0:0:0:0:1', '2018-11-07 09:28:09', 'PC');
INSERT INTO `sys_log` VALUES ('279', '1', '删除定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.delete()', '[1]', '266', '0:0:0:0:0:0:0:1', '2018-11-07 09:30:50', 'PC');
INSERT INTO `sys_log` VALUES ('280', '1', '恢复定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.resume()', '[2]', '161', '0:0:0:0:0:0:0:1', '2018-11-07 09:31:13', 'PC');
INSERT INTO `sys_log` VALUES ('281', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":29,\"username\":\"3\",\"password\":\"71115bd7a12198a6f3c380b5dcb310e72a6bf4005a4007de36284aac45b271ce\",\"salt\":\"EX9BGu11kTySjgamWYoH\",\"email\":\"2@qq.com\",\"mobile\":\"11\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 4:56:56 PM\",\"departmentId\":133}', '231', '0:0:0:0:0:0:0:1', '2018-11-07 16:56:57', 'PC');
INSERT INTO `sys_log` VALUES ('282', '1', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"1\",\"newPassword\":\"123456\"}', '53', '0:0:0:0:0:0:0:1', '2018-11-08 10:16:21', 'PC');
INSERT INTO `sys_log` VALUES ('283', '1', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"123456\",\"newPassword\":\"1\"}', '52', '0:0:0:0:0:0:0:1', '2018-11-08 10:16:45', 'PC');
INSERT INTO `sys_log` VALUES ('284', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":30,\"username\":\"房东\",\"password\":\"9b9fcdf9263f42a967e01b7f85ac2f1829243bba169ef2e633c84b17540cdc71\",\"salt\":\"Kk5yZHdVj4QmF2qxl7bF\",\"email\":\"141@qq.com\",\"mobile\":\"和规范化\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Nov 8, 2018 3:50:22 PM\"}', '305', '0:0:0:0:0:0:0:1', '2018-11-08 15:50:22', 'PC');
INSERT INTO `sys_log` VALUES ('285', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[30]', '161', '0:0:0:0:0:0:0:1', '2018-11-08 16:09:58', 'PC');
INSERT INTO `sys_log` VALUES ('286', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":9,\"roleName\":\"admin123\",\"remark\":\"123\",\"createUserId\":1,\"menuIdList\":[1,31],\"createTime\":\"Nov 8, 2018 4:37:50 PM\"}', '260', '0:0:0:0:0:0:0:1', '2018-11-08 16:37:51', 'PC');
INSERT INTO `sys_log` VALUES ('287', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[9]', '138', '0:0:0:0:0:0:0:1', '2018-11-08 16:37:59', 'PC');
INSERT INTO `sys_log` VALUES ('288', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[1]', '136', '0:0:0:0:0:0:0:1', '2018-11-08 16:38:10', 'PC');
INSERT INTO `sys_log` VALUES ('289', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '353', '0:0:0:0:0:0:0:1', '2018-11-08 16:50:44', 'PC');
INSERT INTO `sys_log` VALUES ('290', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"技术1部\"}', '351', '0:0:0:0:0:0:0:1', '2018-11-08 16:51:27', 'PC');
INSERT INTO `sys_log` VALUES ('291', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":16,\"username\":\"1\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\",\"departmentId\":137,\"departmentName\":\"人事部\"}', '236', '0:0:0:0:0:0:0:1', '2018-11-08 16:51:36', 'PC');
INSERT INTO `sys_log` VALUES ('292', 'aa', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":11,\"roleName\":\"test56\",\"remark\":\"123\",\"createUserId\":4,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Nov 8, 2018 4:56:07 PM\"}', '247', '0:0:0:0:0:0:0:1', '2018-11-08 16:56:08', 'PC');
INSERT INTO `sys_log` VALUES ('293', 'aa', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[11]', '136', '0:0:0:0:0:0:0:1', '2018-11-08 16:56:13', 'PC');
INSERT INTO `sys_log` VALUES ('294', 'aa', '暂停定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.pause()', '[2]', '163', '0:0:0:0:0:0:0:1', '2018-11-08 16:59:09', 'PC');
INSERT INTO `sys_log` VALUES ('295', 'aa', '恢复定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.resume()', '[2]', '139', '0:0:0:0:0:0:0:1', '2018-11-08 16:59:13', 'PC');
INSERT INTO `sys_log` VALUES ('296', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"test\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', '45', '0:0:0:0:0:0:0:1', '2018-11-08 17:01:55', 'PC');
INSERT INTO `sys_log` VALUES ('297', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '314', '0:0:0:0:0:0:0:1', '2018-11-08 17:40:06', 'PC');
INSERT INTO `sys_log` VALUES ('298', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":5,\"username\":\"p\",\"password\":\"59fb34d9b2b17674c0382b3ce714348094bbcaf9e33e1e4554d5a0caa612408a\",\"salt\":\"jqwwgXFXbr6yr2q0aWBP\",\"email\":\"me@qq.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:18:08 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '244', '0:0:0:0:0:0:0:1', '2018-11-08 19:07:48', 'PC');
INSERT INTO `sys_log` VALUES ('299', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"18356666666\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\",\"departmentId\":124}', '132', '0:0:0:0:0:0:0:1', '2018-11-08 19:08:15', 'PC');
INSERT INTO `sys_log` VALUES ('300', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"18356666666\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\",\"departmentId\":134}', '166', '0:0:0:0:0:0:0:1', '2018-11-08 19:08:28', 'PC');
INSERT INTO `sys_log` VALUES ('301', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":31,\"username\":\"s\",\"password\":\"9a414fd7395ea1011b6d94d1aa57f979b7f98ecaf9b0da4459d9b6c36ad17de1\",\"salt\":\"owXnVGZIUUyfnBApYtsO\",\"email\":\"764686887@qq.com\",\"mobile\":\"13260536302\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 9, 2018 9:45:48 AM\"}', '196', '0:0:0:0:0:0:0:1', '2018-11-09 09:45:49', 'PC');
INSERT INTO `sys_log` VALUES ('302', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":31,\"username\":\"s\",\"salt\":\"owXnVGZIUUyfnBApYtsO\",\"email\":\"764686887@qq.com\",\"mobile\":\"13260536308\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 9, 2018 9:45:49 AM\"}', '180', '0:0:0:0:0:0:0:1', '2018-11-09 09:45:59', 'PC');
INSERT INTO `sys_log` VALUES ('303', '1', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[31]', '134', '0:0:0:0:0:0:0:1', '2018-11-09 09:46:06', 'PC');
INSERT INTO `sys_log` VALUES ('304', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '403', '0:0:0:0:0:0:0:1', '2018-11-09 10:27:08', 'PC');
INSERT INTO `sys_log` VALUES ('305', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":29,\"username\":\"3\",\"password\":\"71115bd7a12198a6f3c380b5dcb310e72a6bf4005a4007de36284aac45b271ce\",\"salt\":\"EX9BGu11kTySjgamWYoH\",\"email\":\"2@qq.com\",\"mobile\":\"15625252525\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 4:56:57 PM\",\"departmentId\":133,\"departmentName\":\"技术部\"}', '421', '0:0:0:0:0:0:0:1', '2018-11-09 10:49:35', 'PC');
INSERT INTO `sys_log` VALUES ('306', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fas fa-cart-plus\",\"orderNum\":0}', '72', '0:0:0:0:0:0:0:1', '2018-11-09 16:30:26', 'PC');
INSERT INTO `sys_log` VALUES ('307', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-cart-plus\",\"orderNum\":0}', '69', '0:0:0:0:0:0:0:1', '2018-11-09 16:30:55', 'PC');
INSERT INTO `sys_log` VALUES ('308', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-jpy\",\"orderNum\":1}', '64', '0:0:0:0:0:0:0:1', '2018-11-09 16:36:19', 'PC');
INSERT INTO `sys_log` VALUES ('309', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-align-left\",\"orderNum\":0}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:37:41', 'PC');
INSERT INTO `sys_log` VALUES ('310', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-align-right\",\"orderNum\":5}', '66', '0:0:0:0:0:0:0:1', '2018-11-09 16:38:04', 'PC');
INSERT INTO `sys_log` VALUES ('311', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-folder-open\",\"orderNum\":8}', '70', '0:0:0:0:0:0:0:1', '2018-11-09 16:41:22', 'PC');
INSERT INTO `sys_log` VALUES ('312', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/ceb505logistics.html\",\"type\":1,\"icon\":\"fa fa-truck\",\"orderNum\":2}', '67', '0:0:0:0:0:0:0:1', '2018-11-09 16:43:15', 'PC');
INSERT INTO `sys_log` VALUES ('313', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/departure/departure.html\",\"perms\":\"departure:departure:save,departure:departure:info,departure:departure:update,departure:departure:delete\",\"type\":1,\"icon\":\"fa fa-plane\",\"orderNum\":4}', '85', '0:0:0:0:0:0:0:1', '2018-11-09 16:45:58', 'PC');
INSERT INTO `sys_log` VALUES ('314', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":109,\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户列表\",\"url\":\"modules/company/company.html\",\"type\":1,\"icon\":\"fa fa-list-ol\",\"orderNum\":0}', '78', '0:0:0:0:0:0:0:1', '2018-11-09 16:46:34', 'PC');
INSERT INTO `sys_log` VALUES ('315', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":121,\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户类型\",\"url\":\"modules/company/companytype.html\",\"type\":1,\"icon\":\"fa fa-list-ul\",\"orderNum\":1}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:47:16', 'PC');
INSERT INTO `sys_log` VALUES ('316', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":0}', '51', '0:0:0:0:0:0:0:1', '2018-11-09 16:50:25', 'PC');
INSERT INTO `sys_log` VALUES ('317', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-cc\",\"orderNum\":0}', '53', '0:0:0:0:0:0:0:1', '2018-11-09 16:50:59', 'PC');
INSERT INTO `sys_log` VALUES ('318', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":116,\"parentId\":98,\"parentName\":\"商品管理\",\"name\":\"商品\",\"url\":\"modules/commodity/commodity.html\",\"type\":1,\"icon\":\"fa fa-cubes\",\"orderNum\":0}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:52:17', 'PC');
INSERT INTO `sys_log` VALUES ('319', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":139,\"parentId\":98,\"parentName\":\"商品管理\",\"name\":\"商品单位\",\"url\":\"modules/commodity/commodityunit.html\",\"type\":1,\"icon\":\"fa fa-cube\",\"orderNum\":0}', '78', '0:0:0:0:0:0:0:1', '2018-11-09 16:52:47', 'PC');
INSERT INTO `sys_log` VALUES ('320', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":0}', '39', '0:0:0:0:0:0:0:1', '2018-11-13 13:54:53', 'PC');
INSERT INTO `sys_log` VALUES ('321', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":108,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":1}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:06', 'PC');
INSERT INTO `sys_log` VALUES ('322', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-cc\",\"orderNum\":3}', '50', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:26', 'PC');
INSERT INTO `sys_log` VALUES ('323', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":4}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:37', 'PC');
INSERT INTO `sys_log` VALUES ('324', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":98,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-apple\",\"orderNum\":5}', '37', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:45', 'PC');
INSERT INTO `sys_log` VALUES ('325', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":108,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":6}', '40', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:53', 'PC');
INSERT INTO `sys_log` VALUES ('326', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":7}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:56:03', 'PC');
INSERT INTO `sys_log` VALUES ('327', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/departure/departure.html\",\"perms\":\"departure:departure:save,departure:departure:info,departure:departure:update,departure:departure:delete\",\"type\":1,\"icon\":\"fa fa-plane\",\"orderNum\":3}', '57', '0:0:0:0:0:0:0:1', '2018-11-13 13:56:50', 'PC');
INSERT INTO `sys_log` VALUES ('328', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-align-right\",\"orderNum\":4}', '57', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:10', 'PC');
INSERT INTO `sys_log` VALUES ('329', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-align-left\",\"orderNum\":5}', '54', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:18', 'PC');
INSERT INTO `sys_log` VALUES ('330', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-folder-open\",\"orderNum\":6}', '54', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:28', 'PC');
INSERT INTO `sys_log` VALUES ('331', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '466', '0:0:0:0:0:0:0:1', '2018-11-19 10:10:55', 'PC');
INSERT INTO `sys_log` VALUES ('332', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '3223', '0:0:0:0:0:0:0:1', '2018-11-19 10:10:58', 'PC');
INSERT INTO `sys_log` VALUES ('333', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '4499', '0:0:0:0:0:0:0:1', '2018-11-19 10:11:00', 'PC');
INSERT INTO `sys_log` VALUES ('334', 'hjw', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":6,\"username\":\"2\",\"password\":\"f808877518e3931fb15d1f879c130e6d60e06b31ef64d174993710030e79b2f3\",\"salt\":\"rPHNHcwUrHiZAihUFl0k\",\"email\":\"2@qq.com\",\"mobile\":\"15333331111\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Jun 27, 2018 5:18:49 PM\",\"departmentId\":136,\"departmentName\":\"美工部\"}', '430', '0:0:0:0:0:0:0:1', '2018-11-19 11:35:23', 'PC');
INSERT INTO `sys_log` VALUES ('335', 'hjw', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[6]', '389', '0:0:0:0:0:0:0:1', '2018-11-19 11:35:57', 'PC');
INSERT INTO `sys_log` VALUES ('336', 'hjw', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":34,\"username\":\"test\",\"password\":\"f3c086f1e900dae44f262ad930dff7970ef916955a500de60544203343280322\",\"salt\":\"5QODc00jTBYPUlsjWh9t\",\"email\":\"123@qq.com\",\"mobile\":\"15233331233\",\"status\":0,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Nov 19, 2018 11:37:37 AM\"}', '233', '0:0:0:0:0:0:0:1', '2018-11-19 11:37:38', 'PC');
INSERT INTO `sys_log` VALUES ('337', 'hjw', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[34]', '129', '0:0:0:0:0:0:0:1', '2018-11-19 13:25:37', 'PC');
INSERT INTO `sys_log` VALUES ('338', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '78', '0:0:0:0:0:0:0:1', '2018-11-19 13:28:27', 'PC');
INSERT INTO `sys_log` VALUES ('339', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":37,\"username\":\"4\",\"password\":\"99a92607ecf849d72fc45c2d7cf0a9b7ce485d9ee93e7f7361f920957b05e2f1\",\"salt\":\"OBEFdAJvZT8cSbphnA1I\",\"email\":\"1@qq.com\",\"mobile\":\"15911111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:29:02 PM\"}', '395', '0:0:0:0:0:0:0:1', '2018-11-19 13:29:03', 'PC');
INSERT INTO `sys_log` VALUES ('340', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[37]', '109', '0:0:0:0:0:0:0:1', '2018-11-19 13:29:08', 'PC');
INSERT INTO `sys_log` VALUES ('341', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":38,\"username\":\"韩\",\"password\":\"de83cb5724b84d090e1842e71d88df7c549b8c44a5bca856d53587a558e98396\",\"salt\":\"3VcmjtwA7X8g5NWzHgnd\",\"email\":\"1@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:33:31 PM\"}', '259', '0:0:0:0:0:0:0:1', '2018-11-19 13:33:31', 'PC');
INSERT INTO `sys_log` VALUES ('342', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[38]', '109', '0:0:0:0:0:0:0:1', '2018-11-19 13:34:32', 'PC');
INSERT INTO `sys_log` VALUES ('343', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":39,\"username\":\"test1\",\"password\":\"6c19e33a6c7f685dfed4e6456aaa0627b48982a221553c6a89d31bfd7f548db9\",\"salt\":\"o5BSPXvCvpAbIlaK2Bon\",\"email\":\"1@qq.com\",\"mobile\":\"15911111111\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:36:56 PM\"}', '208', '0:0:0:0:0:0:0:1', '2018-11-19 13:36:56', 'PC');
INSERT INTO `sys_log` VALUES ('344', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":134}', '265', '0:0:0:0:0:0:0:1', '2018-11-20 10:30:48', 'PC');
INSERT INTO `sys_log` VALUES ('345', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":134,\"departmentName\":\"技术1部\"}', '287', '0:0:0:0:0:0:0:1', '2018-11-20 10:33:31', 'PC');
INSERT INTO `sys_log` VALUES ('346', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":12,\"roleName\":\"zhu\",\"remark\":\"dd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150],\"createTime\":\"Nov 20, 2018 10:35:34 AM\"}', '291', '0:0:0:0:0:0:0:1', '2018-11-20 10:35:34', 'PC');
INSERT INTO `sys_log` VALUES ('347', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":12,\"roleName\":\"zhu\",\"remark\":\"ddd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150,98,116,117,118,119,120,139,140,141,142,143],\"createTime\":\"Nov 20, 2018 10:35:34 AM\"}', '279', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:14', 'PC');
INSERT INTO `sys_log` VALUES ('348', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[12]', '163', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:20', 'PC');
INSERT INTO `sys_log` VALUES ('349', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":133,\"departmentName\":\"技术1部\"}', '276', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:45', 'PC');
INSERT INTO `sys_log` VALUES ('350', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":13,\"roleName\":\"zhuzhu\",\"remark\":\"ddd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150,98,116,117,118,119,120,139,140,141,142,143],\"createTime\":\"Nov 20, 2018 10:39:30 AM\"}', '201', '0:0:0:0:0:0:0:1', '2018-11-20 10:39:31', 'PC');
INSERT INTO `sys_log` VALUES ('351', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":41,\"username\":\"dd\",\"password\":\"8694e88f259dd0a62f5e92a72b2ca4e5c532a7d75df4e5d5c4112c96288c6a6e\",\"salt\":\"MnhW2AffWm8xOJjD0dbb\",\"email\":\"aa@qq.com\",\"mobile\":\"18022333333\",\"status\":1,\"roleIdList\":[10,13],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:42:02 AM\",\"departmentId\":133}', '189', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:03', 'PC');
INSERT INTO `sys_log` VALUES ('352', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":41,\"username\":\"dd\",\"salt\":\"MnhW2AffWm8xOJjD0dbb\",\"email\":\"aa@qq.com\",\"mobile\":\"18022333333\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:42:03 AM\",\"departmentId\":133,\"departmentName\":\"技术部\"}', '272', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:45', 'PC');
INSERT INTO `sys_log` VALUES ('353', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[41]', '175', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:51', 'PC');
INSERT INTO `sys_log` VALUES ('354', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":133,\"departmentName\":\"hh\"}', '201', '0:0:0:0:0:0:0:1', '2018-11-20 10:44:50', 'PC');
INSERT INTO `sys_log` VALUES ('355', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[13]', '111', '0:0:0:0:0:0:0:1', '2018-11-20 10:45:18', 'PC');
INSERT INTO `sys_log` VALUES ('356', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '40', '0:0:0:0:0:0:0:1', '2018-11-20 10:49:49', 'PC');
INSERT INTO `sys_log` VALUES ('357', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '56', '0:0:0:0:0:0:0:1', '2018-11-20 10:50:04', 'PC');
INSERT INTO `sys_log` VALUES ('358', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '34', '0:0:0:0:0:0:0:1', '2018-11-20 10:50:51', 'PC');
INSERT INTO `sys_log` VALUES ('359', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '54', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:09', 'PC');
INSERT INTO `sys_log` VALUES ('360', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '139', '123', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:18', 'PC');
INSERT INTO `sys_log` VALUES ('361', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '138', '123', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:22', 'PC');
INSERT INTO `sys_log` VALUES ('362', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,95,85,86,87,88,89,90,91,92,93,94,69,70,71,72,73,74,58,76,81,82,83,84,75,77,78,79,80],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '186', '0:0:0:0:0:0:0:1', '2018-11-20 10:53:16', 'PC');
INSERT INTO `sys_log` VALUES ('363', '1', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '205', '260', '0:0:0:0:0:0:0:1', '2018-11-20 16:27:46', 'PC');
INSERT INTO `sys_log` VALUES ('364', 'hjw', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"1\",\"newPassword\":\"1\"}', '43', '0:0:0:0:0:0:0:1', '2018-11-22 09:40:56', 'PC');
INSERT INTO `sys_log` VALUES ('365', 'hjw', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"123456\",\"newPassword\":\"123456\"}', '38', '0:0:0:0:0:0:0:1', '2018-11-22 09:43:01', 'PC');
INSERT INTO `sys_log` VALUES ('366', 'hjw', '暂停定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.pause()', '[2]', '331', '0:0:0:0:0:0:0:1', '2018-11-23 09:54:42', 'PC');
INSERT INTO `sys_log` VALUES ('367', 'hjw', '删除定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.delete()', '[2]', '249', '0:0:0:0:0:0:0:1', '2018-11-23 10:03:18', 'PC');
INSERT INTO `sys_log` VALUES ('368', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '290', '0:0:0:0:0:0:0:1', '2018-11-25 13:27:31', 'PC');
INSERT INTO `sys_log` VALUES ('369', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,29],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '232', '0:0:0:0:0:0:0:1', '2018-12-14 18:58:03', 'PC');
INSERT INTO `sys_log` VALUES ('370', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-users\",\"orderNum\":3}', '45', '0:0:0:0:0:0:0:1', '2018-12-14 19:01:42', 'PC');
INSERT INTO `sys_log` VALUES ('371', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[39,40,33,29,19,18,17,15,14]', '218', '0:0:0:0:0:0:0:1', '2018-12-24 10:51:40', 'PC');
INSERT INTO `sys_log` VALUES ('372', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[5,4,11]', '63', '0:0:0:0:0:0:0:1', '2018-12-24 10:51:55', 'PC');
INSERT INTO `sys_log` VALUES ('373', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":41,\"username\":\"hanjinwu1\",\"password\":\"24e2e3c9aced9906d4afd248aead83b21fb0f1adcf3ca14f5a9705eea671b530\",\"salt\":\"CBKJvBL8CLOtUpOcDVFy\",\"email\":\"qq@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Dec 24, 2018 10:52:52 AM\"}', '314', '0:0:0:0:0:0:0:1', '2018-12-24 10:52:53', 'PC');
INSERT INTO `sys_log` VALUES ('374', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[41]', '51', '0:0:0:0:0:0:0:1', '2018-12-24 10:52:58', 'PC');
INSERT INTO `sys_log` VALUES ('375', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":17,\"username\":\"wangfang\",\"password\":\"7cbf6253433be8b85be6c2232f9b6d64ab76175dc4ca84318854382ee80b9ed4\",\"salt\":\"hpwCED1racsEgTNsNuV5\",\"email\":\"1576946790@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jan 14, 2019 6:49:37 PM\"}', '268', '11.11.11.1', '2019-01-14 18:49:38', 'PC');
INSERT INTO `sys_log` VALUES ('376', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":18,\"username\":\"wuyan\",\"password\":\"e0dd9bca490df38afaa2cef6740fde12e64319db5a6db6f5aefcb63078cd27df\",\"salt\":\"akoM34UjmDlc1uFV0RUV\",\"email\":\"wuyan@suhangguoji.com\",\"mobile\":\"13776644103\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jan 15, 2019 10:16:46 AM\"}', '147', '11.11.11.1', '2019-01-15 10:16:47', 'PC');
INSERT INTO `sys_log` VALUES ('377', 'hjw', '用户登录', 'com.wzlue.imports.web.controller.sys.SysLoginController.login()', '{\"username\":\"hjw\",\"password\":\"123456\",\"captcha\":\"\"}', '44', '0:0:0:0:0:0:0:1', '2019-01-16 14:37:48', 'PC');
INSERT INTO `sys_log` VALUES ('378', 'hjw', '用户退出', 'com.wzlue.imports.web.controller.sys.SysLoginController.logout()', null, '32', '127.0.0.1', '2019-01-16 14:40:24', 'PC');
INSERT INTO `sys_log` VALUES ('379', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[2,16,17,18]', '123', '0:0:0:0:0:0:0:1', '2019-02-13 16:47:50', 'PC');
INSERT INTO `sys_log` VALUES ('380', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '35', '1', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:08', 'PC');
INSERT INTO `sys_log` VALUES ('381', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '36', '2', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:15', 'PC');
INSERT INTO `sys_log` VALUES ('382', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '36', '2', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:45', 'PC');
INSERT INTO `sys_log` VALUES ('383', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '62', '48', '0:0:0:0:0:0:0:1', '2019-02-13 16:58:21', 'PC');
INSERT INTO `sys_log` VALUES ('384', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '134', '34', '0:0:0:0:0:0:0:1', '2019-02-13 16:58:28', 'PC');
INSERT INTO `sys_log` VALUES ('385', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"范围\",\"url\":\"#\",\"perms\":\"#\",\"type\":1,\"orderNum\":0}', '47', '0:0:0:0:0:0:0:1', '2019-02-13 17:26:43', 'PC');
INSERT INTO `sys_log` VALUES ('386', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"orderNum\":0}', '37', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:09', 'PC');
INSERT INTO `sys_log` VALUES ('387', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"商家\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '42', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:29', 'PC');
INSERT INTO `sys_log` VALUES ('388', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"C端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '34', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:50', 'PC');
INSERT INTO `sys_log` VALUES ('389', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"C端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '34', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('390', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '206', '54', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:04', 'PC');
INSERT INTO `sys_log` VALUES ('391', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"orderNum\":0}', '42', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:41', 'PC');
INSERT INTO `sys_log` VALUES ('392', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":208,\"parentName\":\"订单管理\",\"name\":\"订单类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '41', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:56', 'PC');
INSERT INTO `sys_log` VALUES ('393', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单列表\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:09', 'PC');
INSERT INTO `sys_log` VALUES ('394', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":210,\"parentId\":208,\"parentName\":\"订单管理\",\"name\":\"订单列表\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '33', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:20', 'PC');
INSERT INTO `sys_log` VALUES ('395', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"求助管理\",\"type\":0,\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:40', 'PC');
INSERT INTO `sys_log` VALUES ('396', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"求助类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '31', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:54', 'PC');
INSERT INTO `sys_log` VALUES ('397', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":212,\"parentId\":211,\"parentName\":\"求助管理\",\"name\":\"求助类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '22', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:04', 'PC');
INSERT INTO `sys_log` VALUES ('398', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":211,\"parentName\":\"求助管理\",\"name\":\"求助列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:19', 'PC');
INSERT INTO `sys_log` VALUES ('399', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙管理\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '37', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:42', 'PC');
INSERT INTO `sys_log` VALUES ('400', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":214,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙管理\",\"url\":\"1\",\"perms\":\"1\",\"type\":0,\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:36', 'PC');
INSERT INTO `sys_log` VALUES ('401', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '62', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:47', 'PC');
INSERT INTO `sys_log` VALUES ('402', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":215,\"parentId\":214,\"parentName\":\"帮忙管理\",\"name\":\"帮忙列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:55', 'PC');
INSERT INTO `sys_log` VALUES ('403', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":205,\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"B端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:15', 'PC');
INSERT INTO `sys_log` VALUES ('404', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户资料\",\"type\":0,\"orderNum\":0}', '38', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:43', 'PC');
INSERT INTO `sys_log` VALUES ('405', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"积分\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '28', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:54', 'PC');
INSERT INTO `sys_log` VALUES ('406', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":217,\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"积分\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:01', 'PC');
INSERT INTO `sys_log` VALUES ('407', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"投诉管理\",\"type\":0,\"orderNum\":0}', '36', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:44', 'PC');
INSERT INTO `sys_log` VALUES ('408', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"评价管理\",\"type\":0,\"orderNum\":0}', '39', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:54', 'PC');
INSERT INTO `sys_log` VALUES ('409', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"留言管理\",\"type\":0,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:34:11', 'PC');
INSERT INTO `sys_log` VALUES ('410', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"用户属性\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2019-02-13 17:35:19', 'PC');
INSERT INTO `sys_log` VALUES ('411', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":203,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"操作台（店）\",\"url\":\"#\",\"perms\":\"#\",\"type\":1,\"orderNum\":0}', '42', '0:0:0:0:0:0:0:1', '2019-04-16 22:44:46', 'PC');
INSERT INTO `sys_log` VALUES ('412', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":203,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"操作台（店）\",\"url\":\"#\",\"perms\":\"#\",\"type\":1,\"orderNum\":0}', '61', '0:0:0:0:0:0:0:1', '2019-04-16 22:45:59', 'PC');
INSERT INTO `sys_log` VALUES ('413', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":204,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"店铺管理\",\"type\":0,\"orderNum\":1}', '29', '0:0:0:0:0:0:0:1', '2019-04-16 22:46:15', 'PC');
INSERT INTO `sys_log` VALUES ('414', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":205,\"parentId\":204,\"parentName\":\"店铺管理\",\"name\":\"店铺信息（店）\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '35', '0:0:0:0:0:0:0:1', '2019-04-16 22:47:05', 'PC');
INSERT INTO `sys_log` VALUES ('415', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":207,\"parentId\":204,\"parentName\":\"店铺管理\",\"name\":\"店铺列表（平）\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":2}', '38', '0:0:0:0:0:0:0:1', '2019-04-16 22:47:23', 'PC');
INSERT INTO `sys_log` VALUES ('416', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":208,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"店铺内部管理\",\"type\":0,\"orderNum\":2}', '35', '0:0:0:0:0:0:0:1', '2019-04-16 22:48:01', 'PC');
INSERT INTO `sys_log` VALUES ('417', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":209,\"parentId\":208,\"parentName\":\"店铺内部管理\",\"name\":\"预定订单（平，店）\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":1}', '31', '0:0:0:0:0:0:0:1', '2019-04-16 22:48:21', 'PC');
INSERT INTO `sys_log` VALUES ('418', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":210,\"parentId\":208,\"parentName\":\"店铺内部管理\",\"name\":\"员工管理\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '31', '0:0:0:0:0:0:0:1', '2019-04-16 22:48:37', 'PC');
INSERT INTO `sys_log` VALUES ('419', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":209,\"parentId\":208,\"parentName\":\"店铺内部管理\",\"name\":\"岗位管理\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":1}', '46', '0:0:0:0:0:0:0:1', '2019-04-16 22:49:11', 'PC');
INSERT INTO `sys_log` VALUES ('420', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":208,\"parentName\":\"店铺内部管理\",\"name\":\"店铺详情（店）\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '41', '0:0:0:0:0:0:0:1', '2019-04-16 22:49:37', 'PC');
INSERT INTO `sys_log` VALUES ('421', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '211', '2', '0:0:0:0:0:0:0:1', '2019-04-16 22:50:10', 'PC');
INSERT INTO `sys_log` VALUES ('422', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '212', '67', '0:0:0:0:0:0:0:1', '2019-04-16 22:50:45', 'PC');
INSERT INTO `sys_log` VALUES ('423', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '213', '36', '0:0:0:0:0:0:0:1', '2019-04-16 22:50:50', 'PC');
INSERT INTO `sys_log` VALUES ('424', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '211', '38', '0:0:0:0:0:0:0:1', '2019-04-16 22:50:55', 'PC');
INSERT INTO `sys_log` VALUES ('425', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '215', '36', '0:0:0:0:0:0:0:1', '2019-04-16 22:51:00', 'PC');
INSERT INTO `sys_log` VALUES ('426', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '214', '40', '0:0:0:0:0:0:0:1', '2019-04-16 22:51:04', 'PC');
INSERT INTO `sys_log` VALUES ('427', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户等级\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":3}', '38', '0:0:0:0:0:0:0:1', '2019-04-16 22:51:52', 'PC');
INSERT INTO `sys_log` VALUES ('428', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":223,\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"用户等级\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":3}', '36', '0:0:0:0:0:0:0:1', '2019-04-16 22:52:05', 'PC');
INSERT INTO `sys_log` VALUES ('429', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"用户列表\",\"url\":\"3\",\"perms\":\"4\",\"type\":1,\"orderNum\":4}', '51', '0:0:0:0:0:0:0:1', '2019-04-16 22:52:28', 'PC');
INSERT INTO `sys_log` VALUES ('430', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":216,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户资料（店)\",\"type\":0,\"orderNum\":0}', '30', '0:0:0:0:0:0:0:1', '2019-04-16 22:53:03', 'PC');
INSERT INTO `sys_log` VALUES ('431', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"餐桌配置\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":2}', '153', '0:0:0:0:0:0:0:1', '2019-04-16 22:53:22', 'PC');
INSERT INTO `sys_log` VALUES ('432', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"菜品管理\",\"type\":0,\"orderNum\":4}', '47', '0:0:0:0:0:0:0:1', '2019-04-16 22:53:42', 'PC');
INSERT INTO `sys_log` VALUES ('433', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"套餐列表\",\"url\":\"2\",\"perms\":\"1\",\"type\":1,\"orderNum\":1}', '38', '0:0:0:0:0:0:0:1', '2019-04-16 22:54:03', 'PC');
INSERT INTO `sys_log` VALUES ('434', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":227,\"parentId\":226,\"parentName\":\"菜品管理\",\"name\":\"套餐列表\",\"url\":\"2\",\"perms\":\"1\",\"type\":1,\"orderNum\":1}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 22:54:38', 'PC');
INSERT INTO `sys_log` VALUES ('435', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":226,\"parentName\":\"菜品管理\",\"name\":\"点餐\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":2}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 22:54:59', 'PC');
INSERT INTO `sys_log` VALUES ('436', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":226,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"菜品管理（店）\",\"type\":0,\"orderNum\":4}', '146', '0:0:0:0:0:0:0:1', '2019-04-16 22:55:16', 'PC');
INSERT INTO `sys_log` VALUES ('437', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":225,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"餐桌配置（店）\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":2}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 22:55:25', 'PC');
INSERT INTO `sys_log` VALUES ('438', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":208,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"店铺内部（店）\",\"type\":0,\"orderNum\":2}', '34', '0:0:0:0:0:0:0:1', '2019-04-16 22:55:40', 'PC');
INSERT INTO `sys_log` VALUES ('439', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"orderNum\":5}', '25', '0:0:0:0:0:0:0:1', '2019-04-16 22:56:20', 'PC');
INSERT INTO `sys_log` VALUES ('440', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":229,\"parentName\":\"订单管理\",\"name\":\"预定订单（店）\",\"url\":\"1\",\"type\":1,\"orderNum\":0}', '38', '0:0:0:0:0:0:0:1', '2019-04-16 22:56:42', 'PC');
INSERT INTO `sys_log` VALUES ('441', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"菜单列表\",\"url\":\"2\",\"type\":1,\"orderNum\":2}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 22:56:52', 'PC');
INSERT INTO `sys_log` VALUES ('442', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":231,\"parentId\":229,\"parentName\":\"订单管理\",\"name\":\"菜单列表\",\"url\":\"2\",\"type\":1,\"orderNum\":2}', '90', '0:0:0:0:0:0:0:1', '2019-04-16 22:57:12', 'PC');
INSERT INTO `sys_log` VALUES ('443', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":229,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理（店）\",\"type\":0,\"orderNum\":5}', '27', '0:0:0:0:0:0:0:1', '2019-04-16 22:57:27', 'PC');
INSERT INTO `sys_log` VALUES ('444', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"财务管理（店）\",\"url\":\"7\",\"type\":1,\"orderNum\":7}', '40', '0:0:0:0:0:0:0:1', '2019-04-16 22:58:16', 'PC');
INSERT INTO `sys_log` VALUES ('445', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"消息预警（店）\",\"url\":\"8\",\"type\":1,\"orderNum\":8}', '34', '0:0:0:0:0:0:0:1', '2019-04-16 22:58:39', 'PC');
INSERT INTO `sys_log` VALUES ('446', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"统计分析（店）\",\"url\":\"0\",\"type\":1,\"orderNum\":0}', '26', '0:0:0:0:0:0:0:1', '2019-04-16 22:59:21', 'PC');
INSERT INTO `sys_log` VALUES ('447', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":218,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"投诉管理\",\"type\":0,\"orderNum\":9}', '39', '0:0:0:0:0:0:0:1', '2019-04-16 22:59:38', 'PC');
INSERT INTO `sys_log` VALUES ('448', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":219,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"评价管理\",\"type\":0,\"orderNum\":10}', '40', '0:0:0:0:0:0:0:1', '2019-04-16 22:59:47', 'PC');
INSERT INTO `sys_log` VALUES ('449', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":220,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"留言管理\",\"type\":0,\"orderNum\":11}', '57', '0:0:0:0:0:0:0:1', '2019-04-16 22:59:53', 'PC');
INSERT INTO `sys_log` VALUES ('450', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":25}', '26', '0:0:0:0:0:0:0:1', '2019-04-16 23:00:03', 'PC');
INSERT INTO `sys_log` VALUES ('451', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"营销管理\",\"type\":0,\"orderNum\":10}', '36', '0:0:0:0:0:0:0:1', '2019-04-16 23:01:08', 'PC');
INSERT INTO `sys_log` VALUES ('452', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"消息管理\",\"type\":0,\"orderNum\":11}', '35', '0:0:0:0:0:0:0:1', '2019-04-16 23:01:25', 'PC');
INSERT INTO `sys_log` VALUES ('453', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"店铺订单（平）\",\"url\":\"12\",\"type\":1,\"orderNum\":12}', '33', '0:0:0:0:0:0:0:1', '2019-04-16 23:01:45', 'PC');
INSERT INTO `sys_log` VALUES ('454', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":237,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"店铺订单（平）\",\"url\":\"12\",\"type\":0,\"orderNum\":12}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 23:02:54', 'PC');
INSERT INTO `sys_log` VALUES ('455', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":237,\"parentName\":\"店铺订单（平）\",\"name\":\"店铺续费\",\"url\":\"1\",\"type\":1,\"orderNum\":1}', '36', '0:0:0:0:0:0:0:1', '2019-04-16 23:03:12', 'PC');
INSERT INTO `sys_log` VALUES ('456', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":237,\"parentName\":\"店铺订单（平）\",\"name\":\"推送费用\",\"url\":\"2\",\"type\":1,\"orderNum\":2}', '37', '0:0:0:0:0:0:0:1', '2019-04-16 23:03:25', 'PC');
INSERT INTO `sys_log` VALUES ('457', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":237,\"parentName\":\"店铺订单（平）\",\"name\":\"营销费用\",\"url\":\"3\",\"type\":1,\"orderNum\":3}', '36', '0:0:0:0:0:0:0:1', '2019-04-16 23:03:37', 'PC');
INSERT INTO `sys_log` VALUES ('458', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '205', '38', '0:0:0:0:0:0:0:1', '2019-04-16 23:47:58', 'PC');
INSERT INTO `sys_log` VALUES ('459', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"标签管理\",\"type\":0,\"orderNum\":10}', '31', '0:0:0:0:0:0:0:1', '2019-04-16 23:48:23', 'PC');
INSERT INTO `sys_log` VALUES ('460', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":241,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"标签管理\",\"type\":0,\"orderNum\":3}', '30', '0:0:0:0:0:0:0:1', '2019-04-16 23:48:35', 'PC');
INSERT INTO `sys_log` VALUES ('461', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":241,\"parentName\":\"标签管理\",\"name\":\"店铺标签\",\"url\":\"1\",\"type\":1,\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2019-04-16 23:49:06', 'PC');
INSERT INTO `sys_log` VALUES ('462', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":241,\"parentName\":\"标签管理\",\"name\":\"用户标签\",\"url\":\"2\",\"type\":1,\"orderNum\":2}', '34', '0:0:0:0:0:0:0:1', '2019-04-16 23:49:20', 'PC');
INSERT INTO `sys_log` VALUES ('463', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":208,\"parentName\":\"店铺内部（店）\",\"name\":\"店铺特色属性\",\"url\":\"2\",\"type\":1,\"orderNum\":3}', '34', '0:0:0:0:0:0:0:1', '2019-04-16 23:51:44', 'PC');
INSERT INTO `sys_log` VALUES ('464', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":244,\"parentId\":208,\"parentName\":\"店铺内部（店）\",\"name\":\"服务设施\",\"url\":\"2\",\"type\":1,\"orderNum\":3}', '39', '0:0:0:0:0:0:0:1', '2019-04-16 23:57:20', 'PC');
INSERT INTO `sys_log` VALUES ('465', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":204,\"parentName\":\"店铺管理\",\"name\":\"经营类型\",\"url\":\"2\",\"type\":1,\"orderNum\":2}', '38', '0:0:0:0:0:0:0:1', '2019-04-17 00:14:42', 'PC');
INSERT INTO `sys_log` VALUES ('466', 'admin', '修改菜单', 'com.wqf.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":245,\"parentId\":204,\"parentName\":\"店铺管理\",\"name\":\"经营类型\",\"url\":\"modules/hotel/hmanagementtype.html\",\"perms\":\"hotel:hmanagementtype:info,hotel:hmanagementtype:save,hotel:hmanagementtype:update,hotel:hmanagementtype:delete\",\"type\":1,\"orderNum\":2}', '41', '0:0:0:0:0:0:0:1', '2019-04-18 21:05:25', 'PC');
INSERT INTO `sys_log` VALUES ('467', 'admin', '修改角色', 'com.wqf.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[203,216,217,221,223,224,234,204,207,245,208,222,209,210,244,225,241,242,243,226,227,228,229,230,231,232,233,218,219,235,220,236,237,238,239,240,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '276', '0:0:0:0:0:0:0:1', '2019-04-18 21:06:05', 'PC');
INSERT INTO `sys_log` VALUES ('468', 'admin', '保存用户', 'com.wqf.imports.web.controller.sys.SysUserController.save()', '{\"userId\":2,\"username\":\"1\",\"password\":\"05b22c32e433827365e32f23f26b1a0faa36b2393d0acd725724188d6905c49b\",\"salt\":\"oKZKJ5s9nIwqhJBdO2PM\",\"email\":\"1@qq.comn\",\"mobile\":\"15652365214\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Apr 18, 2019 9:07:13 PM\"}', '324', '0:0:0:0:0:0:0:1', '2019-04-18 21:07:14', 'PC');
INSERT INTO `sys_log` VALUES ('469', '1', '修改菜单', 'com.wqf.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":207,\"parentId\":204,\"parentName\":\"店铺管理\",\"name\":\"店铺列表（平）\",\"url\":\"modules/hotel/hotel.html\",\"perms\":\"hotel:hotel:info,hotel:hotel:save,hotel:hotel:update,hotel:hotel:delete\",\"type\":1,\"orderNum\":2}', '79', '0:0:0:0:0:0:0:1', '2019-04-19 00:37:39', 'PC');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '25');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
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
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '代码生成', 'modules/generator/generator.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '1', '数据字典表', 'modules/sys/dict.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '详情', null, 'sys:dict:list,sys:dict:info', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('48', '46', '新增', null, 'sys:dict:save', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('49', '46', '修改', null, 'sys:dict:update', '2', null, '3');
INSERT INTO `sys_menu` VALUES ('50', '46', '删除', null, 'sys:dict:delete', '2', null, '4');
INSERT INTO `sys_menu` VALUES ('51', '1', '编码规则', 'modules/sys/numberrule.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('52', '51', '详情', null, 'sys:numberrule:list,sys:numberrule:info', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('53', '51', '新增', null, 'sys:numberrule:save', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('54', '51', '修改', null, 'sys:numberrule:update', '2', null, '3');
INSERT INTO `sys_menu` VALUES ('55', '51', '删除', null, 'sys:numberrule:delete', '2', null, '4');
INSERT INTO `sys_menu` VALUES ('203', '0', '操作台（店）', '#', '#', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('204', '0', '店铺管理', null, null, '0', null, '1');
INSERT INTO `sys_menu` VALUES ('207', '204', '店铺列表（平）', 'modules/hotel/hotel.html', 'hotel:hotel:info,hotel:hotel:save,hotel:hotel:update,hotel:hotel:delete', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('208', '0', '店铺内部（店）', null, null, '0', null, '2');
INSERT INTO `sys_menu` VALUES ('209', '208', '岗位管理', '1', '1', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('210', '208', '员工管理', '2', '2', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('216', '0', '用户资料（店)', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('217', '216', '积分', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('218', '0', '投诉管理', null, null, '0', null, '9');
INSERT INTO `sys_menu` VALUES ('219', '0', '评价管理', null, null, '0', null, '10');
INSERT INTO `sys_menu` VALUES ('220', '0', '留言管理', null, null, '0', null, '11');
INSERT INTO `sys_menu` VALUES ('221', '216', '用户属性', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('222', '208', '店铺详情（店）', '2', '2', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('223', '216', '用户等级', '2', '2', '1', null, '3');
INSERT INTO `sys_menu` VALUES ('224', '216', '用户列表', '3', '4', '1', null, '4');
INSERT INTO `sys_menu` VALUES ('225', '0', '餐桌配置（店）', '2', '2', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('226', '0', '菜品管理（店）', null, null, '0', null, '4');
INSERT INTO `sys_menu` VALUES ('227', '226', '套餐列表', '2', '1', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('228', '226', '点餐', '2', '2', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('229', '0', '订单管理（店）', null, null, '0', null, '5');
INSERT INTO `sys_menu` VALUES ('230', '229', '预定订单（店）', '1', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('231', '229', '菜单列表', '2', null, '1', null, '2');
INSERT INTO `sys_menu` VALUES ('232', '0', '财务管理（店）', '7', null, '1', null, '7');
INSERT INTO `sys_menu` VALUES ('233', '0', '消息预警（店）', '8', null, '1', null, '8');
INSERT INTO `sys_menu` VALUES ('234', '0', '统计分析（店）', '0', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('235', '0', '营销管理', null, null, '0', null, '10');
INSERT INTO `sys_menu` VALUES ('236', '0', '消息管理', null, null, '0', null, '11');
INSERT INTO `sys_menu` VALUES ('237', '0', '店铺订单（平）', '12', null, '0', null, '12');
INSERT INTO `sys_menu` VALUES ('238', '237', '店铺续费', '1', null, '1', null, '1');
INSERT INTO `sys_menu` VALUES ('239', '237', '推送费用', '2', null, '1', null, '2');
INSERT INTO `sys_menu` VALUES ('240', '237', '营销费用', '3', null, '1', null, '3');
INSERT INTO `sys_menu` VALUES ('241', '0', '标签管理', null, null, '0', null, '3');
INSERT INTO `sys_menu` VALUES ('242', '241', '店铺标签', '1', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('243', '241', '用户标签', '2', null, '1', null, '2');
INSERT INTO `sys_menu` VALUES ('244', '208', '服务设施', '2', null, '1', null, '3');
INSERT INTO `sys_menu` VALUES ('245', '204', '经营类型', 'modules/hotel/hmanagementtype.html', 'hotel:hmanagementtype:info,hotel:hmanagementtype:save,hotel:hmanagementtype:update,hotel:hmanagementtype:delete', '1', null, '2');

-- ----------------------------
-- Table structure for sys_number_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_number_rule`;
CREATE TABLE `sys_number_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '编号类型：',
  `name` varchar(20) DEFAULT NULL COMMENT '规则名称',
  `prefix` varchar(20) DEFAULT NULL COMMENT '前缀',
  `time_type` varchar(20) DEFAULT NULL COMMENT '日期类型',
  `length` int(10) DEFAULT NULL COMMENT '流水长度',
  `sample` varchar(50) DEFAULT NULL COMMENT '示例',
  `status` varchar(255) DEFAULT NULL COMMENT '状态：0 关闭 1 开启',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `num_count` int(11) DEFAULT '0' COMMENT '此规则对应长度后缀的生成的数字时多少',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编码规则';

-- ----------------------------
-- Records of sys_number_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('10', '系统管理员', '系统管理员', '1', '2018-11-08 16:50:43');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5320 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('5244', '10', '203');
INSERT INTO `sys_role_menu` VALUES ('5245', '10', '216');
INSERT INTO `sys_role_menu` VALUES ('5246', '10', '217');
INSERT INTO `sys_role_menu` VALUES ('5247', '10', '221');
INSERT INTO `sys_role_menu` VALUES ('5248', '10', '223');
INSERT INTO `sys_role_menu` VALUES ('5249', '10', '224');
INSERT INTO `sys_role_menu` VALUES ('5250', '10', '234');
INSERT INTO `sys_role_menu` VALUES ('5251', '10', '204');
INSERT INTO `sys_role_menu` VALUES ('5252', '10', '207');
INSERT INTO `sys_role_menu` VALUES ('5253', '10', '245');
INSERT INTO `sys_role_menu` VALUES ('5254', '10', '208');
INSERT INTO `sys_role_menu` VALUES ('5255', '10', '222');
INSERT INTO `sys_role_menu` VALUES ('5256', '10', '209');
INSERT INTO `sys_role_menu` VALUES ('5257', '10', '210');
INSERT INTO `sys_role_menu` VALUES ('5258', '10', '244');
INSERT INTO `sys_role_menu` VALUES ('5259', '10', '225');
INSERT INTO `sys_role_menu` VALUES ('5260', '10', '241');
INSERT INTO `sys_role_menu` VALUES ('5261', '10', '242');
INSERT INTO `sys_role_menu` VALUES ('5262', '10', '243');
INSERT INTO `sys_role_menu` VALUES ('5263', '10', '226');
INSERT INTO `sys_role_menu` VALUES ('5264', '10', '227');
INSERT INTO `sys_role_menu` VALUES ('5265', '10', '228');
INSERT INTO `sys_role_menu` VALUES ('5266', '10', '229');
INSERT INTO `sys_role_menu` VALUES ('5267', '10', '230');
INSERT INTO `sys_role_menu` VALUES ('5268', '10', '231');
INSERT INTO `sys_role_menu` VALUES ('5269', '10', '232');
INSERT INTO `sys_role_menu` VALUES ('5270', '10', '233');
INSERT INTO `sys_role_menu` VALUES ('5271', '10', '218');
INSERT INTO `sys_role_menu` VALUES ('5272', '10', '219');
INSERT INTO `sys_role_menu` VALUES ('5273', '10', '235');
INSERT INTO `sys_role_menu` VALUES ('5274', '10', '220');
INSERT INTO `sys_role_menu` VALUES ('5275', '10', '236');
INSERT INTO `sys_role_menu` VALUES ('5276', '10', '237');
INSERT INTO `sys_role_menu` VALUES ('5277', '10', '238');
INSERT INTO `sys_role_menu` VALUES ('5278', '10', '239');
INSERT INTO `sys_role_menu` VALUES ('5279', '10', '240');
INSERT INTO `sys_role_menu` VALUES ('5280', '10', '1');
INSERT INTO `sys_role_menu` VALUES ('5281', '10', '31');
INSERT INTO `sys_role_menu` VALUES ('5282', '10', '46');
INSERT INTO `sys_role_menu` VALUES ('5283', '10', '47');
INSERT INTO `sys_role_menu` VALUES ('5284', '10', '48');
INSERT INTO `sys_role_menu` VALUES ('5285', '10', '49');
INSERT INTO `sys_role_menu` VALUES ('5286', '10', '50');
INSERT INTO `sys_role_menu` VALUES ('5287', '10', '51');
INSERT INTO `sys_role_menu` VALUES ('5288', '10', '52');
INSERT INTO `sys_role_menu` VALUES ('5289', '10', '53');
INSERT INTO `sys_role_menu` VALUES ('5290', '10', '54');
INSERT INTO `sys_role_menu` VALUES ('5291', '10', '55');
INSERT INTO `sys_role_menu` VALUES ('5292', '10', '2');
INSERT INTO `sys_role_menu` VALUES ('5293', '10', '15');
INSERT INTO `sys_role_menu` VALUES ('5294', '10', '16');
INSERT INTO `sys_role_menu` VALUES ('5295', '10', '17');
INSERT INTO `sys_role_menu` VALUES ('5296', '10', '18');
INSERT INTO `sys_role_menu` VALUES ('5297', '10', '3');
INSERT INTO `sys_role_menu` VALUES ('5298', '10', '19');
INSERT INTO `sys_role_menu` VALUES ('5299', '10', '20');
INSERT INTO `sys_role_menu` VALUES ('5300', '10', '21');
INSERT INTO `sys_role_menu` VALUES ('5301', '10', '22');
INSERT INTO `sys_role_menu` VALUES ('5302', '10', '4');
INSERT INTO `sys_role_menu` VALUES ('5303', '10', '23');
INSERT INTO `sys_role_menu` VALUES ('5304', '10', '24');
INSERT INTO `sys_role_menu` VALUES ('5305', '10', '25');
INSERT INTO `sys_role_menu` VALUES ('5306', '10', '26');
INSERT INTO `sys_role_menu` VALUES ('5307', '10', '5');
INSERT INTO `sys_role_menu` VALUES ('5308', '10', '6');
INSERT INTO `sys_role_menu` VALUES ('5309', '10', '7');
INSERT INTO `sys_role_menu` VALUES ('5310', '10', '8');
INSERT INTO `sys_role_menu` VALUES ('5311', '10', '9');
INSERT INTO `sys_role_menu` VALUES ('5312', '10', '10');
INSERT INTO `sys_role_menu` VALUES ('5313', '10', '11');
INSERT INTO `sys_role_menu` VALUES ('5314', '10', '12');
INSERT INTO `sys_role_menu` VALUES ('5315', '10', '13');
INSERT INTO `sys_role_menu` VALUES ('5316', '10', '14');
INSERT INTO `sys_role_menu` VALUES ('5317', '10', '27');
INSERT INTO `sys_role_menu` VALUES ('5318', '10', '30');
INSERT INTO `sys_role_menu` VALUES ('5319', '10', '29');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `department_id` bigint(20) DEFAULT NULL COMMENT '所属部门id',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11', '135');
INSERT INTO `sys_user` VALUES ('2', '1', '05b22c32e433827365e32f23f26b1a0faa36b2393d0acd725724188d6905c49b', 'oKZKJ5s9nIwqhJBdO2PM', '1@qq.comn', '15652365214', '1', '1', '2019-04-18 21:07:13', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '10');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'a155e4172e137e5ce27d322b72086f05', '2020-01-06 11:40:09', '2020-01-05 23:40:09');
INSERT INTO `sys_user_token` VALUES ('2', 'f23a664b35c55d5146994683cd15e174', '2019-04-22 07:39:43', '2019-04-21 19:39:43');
INSERT INTO `sys_user_token` VALUES ('4', '753679b3868b02f522a4932f0b9c084e', '2018-11-12 21:24:18', '2018-11-12 09:24:18');
INSERT INTO `sys_user_token` VALUES ('5', '4d023b9cc346852e6b5223ea1a01b764', '2018-11-14 02:56:14', '2018-11-13 14:56:14');
INSERT INTO `sys_user_token` VALUES ('6', 'dfdf8356ed55401d493317a6f0d272af', '2018-11-09 23:08:52', '2018-11-09 11:08:52');
INSERT INTO `sys_user_token` VALUES ('11', 'e2ae6db1795eae0d0ed2167399419c11', '2018-12-15 06:33:17', '2018-12-14 18:33:17');
INSERT INTO `sys_user_token` VALUES ('14', '06f5b8a60f588fece8f566c7988d5ab2', '2018-10-12 22:34:31', '2018-10-12 10:34:31');
INSERT INTO `sys_user_token` VALUES ('15', '4e1206160b690e3ec65dcfb31b30d3f8', '2018-08-10 02:47:14', '2018-08-09 14:47:14');
INSERT INTO `sys_user_token` VALUES ('16', 'c1890df38d6bb4cf83c46b9c19bc4af2', '2018-12-13 07:02:02', '2018-12-12 19:02:02');
INSERT INTO `sys_user_token` VALUES ('17', 'f00e2f538e1f054f3a6e4c023bf86cd9', '2019-02-12 21:38:39', '2019-02-12 09:38:39');
INSERT INTO `sys_user_token` VALUES ('18', '36ff55e3abfab4d4cc40e54b890a01c6', '2019-02-12 21:42:52', '2019-02-12 09:42:52');
INSERT INTO `sys_user_token` VALUES ('19', '98d822de073513501273bb936dde8ad4', '2018-11-19 22:11:02', '2018-11-19 10:11:02');
INSERT INTO `sys_user_token` VALUES ('29', 'd9ed05313cade1652c40652a92885839', '2018-11-17 05:36:18', '2018-11-16 17:36:18');
INSERT INTO `sys_user_token` VALUES ('32', '1fdd7eade55118b3c96fec688edc5e48', '2018-11-09 23:10:32', '2018-11-09 11:10:32');
INSERT INTO `sys_user_token` VALUES ('33', '1a2c5759033ed9b35881c7b0a67951a4', '2018-11-15 01:35:50', '2018-11-14 13:35:50');
INSERT INTO `sys_user_token` VALUES ('38', 'c70e7f9abd2bd08b63d94a56dad856cd', '2018-11-20 01:33:41', '2018-11-19 13:33:41');
INSERT INTO `sys_user_token` VALUES ('39', 'a3bf113ffc040a8cb8e79a2eecded318', '2018-11-20 01:37:05', '2018-11-19 13:37:05');
INSERT INTO `sys_user_token` VALUES ('40', 'e2554949f43f0a5465ac520d11cb01db', '2018-11-27 05:24:25', '2018-11-26 17:24:25');

-- ----------------------------
-- Table structure for usr_attribute
-- ----------------------------
DROP TABLE IF EXISTS `usr_attribute`;
CREATE TABLE `usr_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户属性表',
  `headurl` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `Nickname` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `tel` varchar(22) DEFAULT NULL COMMENT '联系电话',
  `isMerchant` int(11) DEFAULT NULL COMMENT '是否是商家',
  `work` int(11) DEFAULT NULL COMMENT '申请服务站1：是2：否',
  `userId` int(11) DEFAULT NULL COMMENT '关联用户Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- ----------------------------
-- Records of usr_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for u_address
-- ----------------------------
DROP TABLE IF EXISTS `u_address`;
CREATE TABLE `u_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户地址表Id',
  `userId` int(11) DEFAULT NULL COMMENT '关联用户Id',
  `province` varchar(50) DEFAULT NULL COMMENT '省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `area` varchar(50) DEFAULT NULL COMMENT '区',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `isdefault` int(11) DEFAULT NULL COMMENT '是否是默认',
  `tel` varchar(22) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of u_address
-- ----------------------------

-- ----------------------------
-- Table structure for u_worker
-- ----------------------------
DROP TABLE IF EXISTS `u_worker`;
CREATE TABLE `u_worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务者资料Id',
  `user_id` int(11) DEFAULT NULL COMMENT '服务者Id',
  `scopeservice` int(11) DEFAULT NULL COMMENT '服务范围',
  `province` varchar(50) DEFAULT NULL COMMENT '服务省',
  `city` varchar(50) DEFAULT NULL COMMENT '市',
  `area` varchar(50) DEFAULT NULL COMMENT '区',
  `address` varchar(100) DEFAULT NULL COMMENT '服务详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务者资料';

-- ----------------------------
-- Records of u_worker
-- ----------------------------
