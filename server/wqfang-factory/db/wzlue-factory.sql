/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : localhost:3306
 Source Schema         : wqfang-factory

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 27/09/2019 16:59:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product_base
-- ----------------------------
DROP TABLE IF EXISTS `product_base`;
CREATE TABLE `product_base`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_status` bigint(3) NULL DEFAULT NULL COMMENT '产品状态',
  `product_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `product_base_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品关联code',
  `create_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) NULL DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品基础信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_base
-- ----------------------------
INSERT INTO `product_base` VALUES ('a885c86bdc791a1d8d21628477126609', 'test', 1, '1', NULL, '1', '2019-09-23 13:06:31', '1', NULL, NULL);

-- ----------------------------
-- Table structure for product_device_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_device_agreement`;
CREATE TABLE `product_device_agreement`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_device_base_id` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备Id',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `serial_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '串口端口名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备通信协议参数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_device_base
-- ----------------------------
DROP TABLE IF EXISTS `product_device_base`;
CREATE TABLE `product_device_base`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_base_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品关联code',
  `device_online_time` datetime(0) NULL DEFAULT NULL COMMENT '设备上线时间',
  `device_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备状态',
  `create_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) NULL DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  `device_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品设备信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_device_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `product_device_extend_info`;
CREATE TABLE `product_device_extend_info`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_device_base_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `device_coordinate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备坐标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备信息扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product_extend_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_extend_agreement`;
CREATE TABLE `product_extend_agreement`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品扩充表主键',
  `agreement_type_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品协议类型',
  `product_base_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品关联code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品协议信息扩充表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_extend_agreement
-- ----------------------------
INSERT INTO `product_extend_agreement` VALUES ('118dbadb0fa543359c86e634271f111f', '1', '2a91d58d639545a7b4c6d0f32f143aee');
INSERT INTO `product_extend_agreement` VALUES ('74a2c811fa2547d5b79b7fa24cea73f7', '0', 'a885c86bdc791a1d8d21628477126609');

-- ----------------------------
-- Table structure for product_fct_base
-- ----------------------------
DROP TABLE IF EXISTS `product_fct_base`;
CREATE TABLE `product_fct_base`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品功能表id',
  `product_base_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品关联code',
  `fct_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `fct_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能标识符',
  `fct_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能显示单位',
  `fct_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能描述',
  `create_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `flag` bigint(2) NULL DEFAULT NULL COMMENT '假删除0:不删除1:已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品功能表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_fct_base
-- ----------------------------
INSERT INTO `product_fct_base` VALUES ('3cd4ca6fe8be3da9d9b0c0840bb98f8f', 'a885c86bdc791a1d8d21628477126609', '功能1', 'fct_1', '1', '11', '1', '2019-09-25 09:50:36', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for product_fct_extend_agreement
-- ----------------------------
DROP TABLE IF EXISTS `product_fct_extend_agreement`;
CREATE TABLE `product_fct_extend_agreement`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `product_fct_base_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品功能Id',
  `operate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `register_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '寄存器地址',
  `original_data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始数据类型',
  `range_start` int(255) NULL DEFAULT NULL COMMENT '数据范围开始',
  `range_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据范围结束',
  `data_get_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据获取类型',
  `swap_high_byte` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交换寄存器内高低字节',
  `swap_register_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交换寄存器顺序',
  `zoom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩放因子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品功能扩充协议表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_fct_extend_agreement
-- ----------------------------
INSERT INTO `product_fct_extend_agreement` VALUES ('0', '3cd4ca6fe8be3da9d9b0c0840bb98f8f', '1', '2132', '7', 0, '1', '12321', 'false', 'false', '1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'PC-2018112809461569574710473', 1569574776945, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务日志id',
  `job_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('05271247-ecbd-4342-872d-e39e300f64d5', '75ecy', '2019-09-20 13:22:28');
INSERT INTO `sys_captcha` VALUES ('0c111684-4320-4647-8f91-d4b8b4f480ff', '5388n', '2019-09-20 10:26:37');
INSERT INTO `sys_captcha` VALUES ('0e7532fc-7a06-4cb4-80aa-4d36b9e8c4bd', '8ww6b', '2019-09-20 13:21:17');
INSERT INTO `sys_captcha` VALUES ('189a3766-e712-4e89-85d5-09cd54987a08', 'g44ad', '2019-09-20 10:53:40');
INSERT INTO `sys_captcha` VALUES ('42d1cb96-b677-436a-862e-56afc89018b2', 'wcdnc', '2019-09-20 13:24:13');
INSERT INTO `sys_captcha` VALUES ('43d83397-a874-4d6d-82ea-a2e9e82e304b', 'gnny4', '2019-09-20 10:35:33');
INSERT INTO `sys_captcha` VALUES ('4523edaa-81d3-4d1b-85bf-4c93f68ce58b', 'pggnb', '2019-09-20 11:40:51');
INSERT INTO `sys_captcha` VALUES ('581963cd-d1a0-4271-8f43-0c6814f0aa45', 'n6y5n', '2019-09-20 09:48:21');
INSERT INTO `sys_captcha` VALUES ('5845273c-8849-4e85-8873-083e7b0dd399', 'amg64', '2019-09-17 22:50:29');
INSERT INTO `sys_captcha` VALUES ('79789d93-f81b-40a4-84ba-ae20cc67db52', '3pcyg', '2019-09-24 15:36:18');
INSERT INTO `sys_captcha` VALUES ('8a972223-139b-49d2-89f1-99e271f36663', 'n4n84', '2019-09-24 09:53:19');
INSERT INTO `sys_captcha` VALUES ('8ab7c7bd-7ab9-4be3-84b6-cc210eab1f00', '5n4pc', '2019-09-20 09:48:21');
INSERT INTO `sys_captcha` VALUES ('8d9dc627-30cf-4b08-8a14-0fe071b28d7e', 'xnga6', '2019-09-20 13:23:13');
INSERT INTO `sys_captcha` VALUES ('9463fc6e-ae4a-4b2c-80a5-3d7de44fd76e', '2ef38', '2019-09-20 13:24:55');
INSERT INTO `sys_captcha` VALUES ('abb882e3-88f0-4c34-8d49-ce6a135380cf', 'dcwgx', '2019-09-20 13:20:24');
INSERT INTO `sys_captcha` VALUES ('abde9922-6327-4527-8d97-5a41343fa1cf', 'm4p48', '2019-09-24 09:49:12');
INSERT INTO `sys_captcha` VALUES ('b6f5a863-175c-43bf-82f9-7217a8ed02f1', 'nn7fg', '2019-09-20 13:18:48');
INSERT INTO `sys_captcha` VALUES ('bd03dfc9-2eda-402d-814e-8315c5bbae36', 'n3pnn', '2019-09-20 13:40:06');
INSERT INTO `sys_captcha` VALUES ('c4f00143-f286-4f6a-8d3b-1d2b81126efb', 'cndnw', '2019-09-20 16:23:16');
INSERT INTO `sys_captcha` VALUES ('cf69ed94-c8f2-4b95-8f95-93d3144cc45b', 'xfc2m', '2019-09-20 13:12:48');
INSERT INTO `sys_captcha` VALUES ('d71b6e2b-7919-4385-871b-e44fac77c9e3', 'x373n', '2019-09-23 18:08:21');
INSERT INTO `sys_captcha` VALUES ('dfb67f98-5cc4-43a4-8278-cb6e46bd81d0', 'bnfgm', '2019-09-20 13:18:34');
INSERT INTO `sys_captcha` VALUES ('e149a282-6130-40ea-8722-3791aaf4eee2', '7pdn3', '2019-09-20 09:15:40');
INSERT INTO `sys_captcha` VALUES ('e5d3399d-94f4-448f-8d13-6b4b6363ca0b', '76aa6', '2019-09-25 09:23:55');
INSERT INTO `sys_captcha` VALUES ('f0716779-0484-45d9-81f5-15336542cebe', 'nfnxd', '2019-09-20 13:19:53');
INSERT INTO `sys_captcha` VALUES ('f095b281-8efd-4332-822c-bf23e6e717eb', '64582', '2019-09-20 10:34:05');
INSERT INTO `sys_captcha` VALUES ('f9f9c180-ceda-4443-8a09-766b506ee17d', '2eafn', '2019-09-20 09:35:10');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `dict_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Compact;

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
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('06c496c03464cafd6bfe81d36f8a9a77', 'admin', '修改密码', 'com.wqfang.modules.sys.controller.SysUserController.password()', '[{\"password\":\"1\",\"newPassword\":\"1\"}]', 18, '0:0:0:0:0:0:0:1', '2019-09-17 23:00:11');
INSERT INTO `sys_log` VALUES ('0c1a33f73091e68d63c2a4672ea3b675', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 78, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('36e02f64f9c3915bfb301af5ecbd21ab', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5479, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('37b1dcca4d01ffe741deaf48a18f0b26', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5486, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('53aa6870d44f5f46c2fd74a97c362f7c', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 123, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('64a25fdec19c6ec76a7af7ce1294caf9', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 99, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:06');
INSERT INTO `sys_log` VALUES ('8ee1aea22cc7b06cea0997b8fda44c10', 'admin', '修改菜单', 'com.wqfang.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1}]', 44, '0:0:0:0:0:0:0:1', '2019-09-19 17:14:24');
INSERT INTO `sys_log` VALUES ('9466595214b812fb85655c80f69f7e16', 'admin', '保存菜单', 'com.wqfang.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]', 54, '0:0:0:0:0:0:0:1', '2019-09-19 17:13:58');
INSERT INTO `sys_log` VALUES ('a911c28f204e88e89fc23a201a93d82c', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5437, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('b0b62cae807d0a1b074d79f7dbd7c9eb', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5486, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('c1b5eed092d41e8adad3da5d0e0eee27', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5486, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');
INSERT INTO `sys_log` VALUES ('dfbaf2fc3ac5fcdbf073f252a0c9fa21', 'admin', '修改用户', 'com.wqfang.modules.sys.controller.SysUserController.update()', '[{\"userId\":\"1\",\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":\"1\"}]', 5486, '0:0:0:0:0:0:0:1', '2019-09-20 14:11:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '0', '系统管理', NULL, NULL, 0, 'system', 1);
INSERT INTO `sys_menu` VALUES (2, '1', '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, '1', '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, '1', '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, '1', 'SQL监控', 'http://localhost:8080/wqfang-factory/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, '1', '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, '6', '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, '6', '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, '6', '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, '6', '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, '6', '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, '6', '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, '6', '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, '6', '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '2', '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '2', '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '2', '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, '2', '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '3', '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '3', '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '3', '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '3', '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '4', '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, '4', '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, '4', '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, '4', '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, '1', '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, '1', '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, '1', '数据字典', 'sys/dict', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (32, '31', '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (33, '31', '新增', NULL, 'sys:dict:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (34, '31', '修改', NULL, 'sys:dict:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (35, '31', '删除', NULL, 'sys:dict:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (36, '0', '设备管理', '', '', 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (37, '36', '产品', 'product/base', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (38, '37', '查看', NULL, 'product:base:list,product:base:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, '37', '新增', NULL, 'product:base:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, '37', '修改', NULL, 'product:base:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, '37', '删除', NULL, 'product:base:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (42, '36', '设备', 'product/devicebase', NULL, 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (43, '42', '查看', NULL, 'product:devicebase:list,product:devicebase:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, '42', '新增', NULL, 'product:devicebase:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, '42', '修改', NULL, 'product:devicebase:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (46, '42', '删除', NULL, 'product:devicebase:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (47, '37', '查看', NULL, 'product:fctbase:list,product:fctbase:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, '37', '新增', NULL, 'product:fctbase:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, '37', '修改', NULL, 'product:fctbase:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, '37', '删除', NULL, 'product:fctbase:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, '37', '查看', NULL, 'product:fctextendagreement:list,product:fctextendagreement:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (52, '37', '新增', NULL, 'product:fctextendagreement:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, '37', '修改', NULL, 'product:fctextendagreement:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (54, '37', '删除', NULL, 'product:fctextendagreement:delete', 2, NULL, 6);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '3120b4ce2fab58ee201357d280518526', '2019-09-25 21:19:07', '2019-09-25 09:19:07');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
