/*
Navicat MySQL Data Transfer

Source Server         : server
Source Server Version : 50550
Source Host           : 192.168.0.103:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2018-05-28 17:29:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for exam_base_user_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_base_user_answer`;
CREATE TABLE `exam_base_user_answer` (
  `id` varchar(32) NOT NULL,
  `commit_date` datetime DEFAULT NULL COMMENT '提交时间',
  `user_paper_relate_id` varchar(32) DEFAULT NULL COMMENT '试卷用户关联表id',
  `gain_total_score` double(5,2) DEFAULT NULL COMMENT '获得的总分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_base_user_answer
-- ----------------------------

-- ----------------------------
-- Table structure for exam_course
-- ----------------------------
DROP TABLE IF EXISTS `exam_course`;
CREATE TABLE `exam_course` (
  `id` varchar(32) NOT NULL COMMENT '主键,uuid',
  `name` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `category` varchar(32) DEFAULT NULL COMMENT '课程类别(uuid，关联数据字典表id)',
  `integral_rule_id` varchar(32) DEFAULT NULL COMMENT '积分规则id(uuid，关联积分规则表id)',
  `start_date` datetime DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束时间',
  `courseware_id` varchar(32) DEFAULT NULL COMMENT '课件id',
  `intro` varchar(255) DEFAULT NULL COMMENT '课程简介',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`),
  KEY `FK3tju41kend1j816k954ecs1tw` (`integral_rule_id`),
  CONSTRAINT `FK3tju41kend1j816k954ecs1tw` FOREIGN KEY (`integral_rule_id`) REFERENCES `integral_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_course
-- ----------------------------
INSERT INTO `exam_course` VALUES ('402880f463711111016371cc2f340005', '小车驾驶员科目一课程', 'e79fd691c1d941d8872d7b5720a55a4c', '402880f46367f9b301636806a3160002', '2018-05-18 00:00:00', '2018-06-18 00:00:00', null, '小车驾驶员科目一课程', null, null, null, null);
INSERT INTO `exam_course` VALUES ('402880f463711111016371e4fad50006', '小车驾驶员科目四课程', 'a886b6c43d824b6b8e710a3d4bfe73c0', '402880f46367f9b301636806a3160002', '2018-05-18 14:16:41', '2018-05-26 14:15:07', null, '小车驾驶员科目四课程', null, null, null, null);
INSERT INTO `exam_course` VALUES ('402880f463711111016371f41f000007', '1', 'a886b6c43d824b6b8e710a3d4bfe73c0', '402880f46367f9b301636806a3160002', '2018-05-18 14:33:27', '2018-05-18 14:33:29', null, '1', null, null, null, null);
INSERT INTO `exam_course` VALUES ('402880f463711111016371f583020008', '2', 'a886b6c43d824b6b8e710a3d4bfe73c0', '402880f46367f9b301636806a3160002', '2018-05-18 14:35:00', '2018-05-18 14:35:02', null, '2', null, null, null, null);
INSERT INTO `exam_course` VALUES ('402880f463711111016371f642ba0009', '3', 'a886b6c43d824b6b8e710a3d4bfe73c0', '402880f46367f9b301636806a3160002', '2018-05-18 14:35:50', '2018-05-18 14:35:52', null, '3', null, null, null, null);
INSERT INTO `exam_course` VALUES ('402880f46372198c01637234b6f30000', '4', 'e79fd691c1d941d8872d7b5720a55a4c', '402880f46367f9b301636806a3160002', '2018-05-18 15:44:00', '2018-05-18 15:44:02', null, '4', null, null, null, null);

-- ----------------------------
-- Table structure for exam_courseware
-- ----------------------------
DROP TABLE IF EXISTS `exam_courseware`;
CREATE TABLE `exam_courseware` (
  `id` varchar(32) NOT NULL COMMENT '主键,uuid',
  `name` varchar(100) DEFAULT NULL COMMENT '课件名称',
  `category` varchar(32) DEFAULT NULL COMMENT '课件类别(uuid，关联数据字典表id)',
  `intro` varchar(255) DEFAULT NULL COMMENT '课件简介',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_courseware
-- ----------------------------
INSERT INTO `exam_courseware` VALUES ('402880f4639631020163963528020000', '4.', '8fc47fa0ea804e9da67f6471a17732dc', null, '2018-05-25 15:30:47', null, 'admin', null);
INSERT INTO `exam_courseware` VALUES ('402880f4639635e80163963763340000', '1', '8fc47fa0ea804e9da67f6471a17732dc', '', null, null, null, null);
INSERT INTO `exam_courseware` VALUES ('402880f4639635e80163963781440001', 'timg (1)', '8fc47fa0ea804e9da67f6471a17732dc', null, '2018-05-25 15:33:22', null, 'admin', null);
INSERT INTO `exam_courseware` VALUES ('402880fa63965416016396556b850000', '周报_胡明辉_20180415', '8fc47fa0ea804e9da67f6471a17732dc', null, '2018-05-25 16:06:10', null, 'admin', null);

-- ----------------------------
-- Table structure for exam_courseware_attachment
-- ----------------------------
DROP TABLE IF EXISTS `exam_courseware_attachment`;
CREATE TABLE `exam_courseware_attachment` (
  `id` varchar(32) NOT NULL COMMENT '主键,uuid',
  `courseware_id` varchar(32) DEFAULT NULL COMMENT '课件id(uuid，关联课件表id)',
  `attachment_id` varchar(32) DEFAULT NULL COMMENT '附件id,uuid，关联附件表id(t_document_document)',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`),
  KEY `FKnah7fkq7ikynik8xbkbml0eer` (`courseware_id`),
  CONSTRAINT `FKnah7fkq7ikynik8xbkbml0eer` FOREIGN KEY (`courseware_id`) REFERENCES `exam_courseware` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_courseware_attachment
-- ----------------------------
INSERT INTO `exam_courseware_attachment` VALUES ('402880f4639635e80163963781cd0005', '402880f4639635e80163963763340000', '402880f4639635e80163963781ba0003', '2018-05-25 15:33:20', null, 'admin', null);

-- ----------------------------
-- Table structure for exam_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `exam_dictionary`;
CREATE TABLE `exam_dictionary` (
  `id` varchar(32) NOT NULL,
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父级id',
  `name` varchar(32) DEFAULT NULL COMMENT '节点名称',
  `dictionary_type_id` varchar(32) DEFAULT NULL COMMENT '类型id(uuid，关联数据字典类型表id)',
  `level` int(2) DEFAULT NULL COMMENT '层级',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_dictionary
-- ----------------------------
INSERT INTO `exam_dictionary` VALUES ('001c03bfcb974f9b9b39ba0571149437', null, '部室长', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('0195c08d70e04b00a9ce0b1f3633de92', null, '模拟考试', '14d5dd5d53ae4c96a71b42da7c9c4b58', '1', '2');
INSERT INTO `exam_dictionary` VALUES ('08b7d9c3ff2048bd90cfeb641e6326f0', null, '项目经理', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('08c7ac9cf2774c2aa3aaaaf127c62749', null, '技术岗', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('10a5c9494b5b42cb95912aa766878efd', null, '单选题', '63ffffa2d98d4b699b443447d833c2fd', '1', '1');
INSERT INTO `exam_dictionary` VALUES ('1515b299deed47c8aa5703980e94980f', null, '固定试卷', '1c2089ee286a4ed0a5a052885bc800a0', '1', '1');
INSERT INTO `exam_dictionary` VALUES ('19508455be0c4b6da1701dca97c6f27b', null, '填空题', '63ffffa2d98d4b699b443447d833c2fd', '1', '4');
INSERT INTO `exam_dictionary` VALUES ('1b65a34127b04371b2e5478732bc3aea', null, '专家', '8621c81119f0444885f0ec96caa874d2', '1', '');
INSERT INTO `exam_dictionary` VALUES ('1e38e8204e074d679b296e1b735addd6', null, '正式考试', '14d5dd5d53ae4c96a71b42da7c9c4b58', '1', '1');
INSERT INTO `exam_dictionary` VALUES ('229cf5b24c8e40f2b7f8099ad213e23f', null, '使用中', '4af6e137c1a64e68aa44e3c17b182740', '1', '');
INSERT INTO `exam_dictionary` VALUES ('3e0e0f9b41574bc59d381be29a9ecb71', null, '已过期', '4af6e137c1a64e68aa44e3c17b182740', '1', '');
INSERT INTO `exam_dictionary` VALUES ('43a1014ce6674e2e80bdded184adc66d', null, '简答题', '63ffffa2d98d4b699b443447d833c2fd', '1', '5');
INSERT INTO `exam_dictionary` VALUES ('54cea47774c5480a8c39f3e6fa3aa4eb', null, 'Java复习', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('558405189dcf4bd4897fa87eb2787334', null, '货车驾驶员考试科目四', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('5a6dee207df74aa8a95287f47484f9d5', null, '普通人员', '8621c81119f0444885f0ec96caa874d2', '1', '');
INSERT INTO `exam_dictionary` VALUES ('5a8e77dc3c3b484aad7d0979c81f082a', null, '判断题', '63ffffa2d98d4b699b443447d833c2fd', '1', '3');
INSERT INTO `exam_dictionary` VALUES ('6189610e76ad42c9bd4b74900e47e368', null, '操作岗', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('697757c9d6894ea8b78ee9a1a4b2b64c', null, '固定、随机试卷', '1c2089ee286a4ed0a5a052885bc800a0', '1', '3');
INSERT INTO `exam_dictionary` VALUES ('6c0412e8bec44eb69962ff387607d315', null, '困难', '1811ff7ffa2747c89752b3a0ae0a6906', '1', '3');
INSERT INTO `exam_dictionary` VALUES ('704ca70a0efb43118ad1ef1b712397f4', null, '考试通过', '516ea21ee9164926ab97b836c9afd510', '1', '');
INSERT INTO `exam_dictionary` VALUES ('711d2a0bdb28427eba7f47fa9de32a32', '', '小车驾驶员考试科目一', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('7b0090686591410abcd03890d7a8546e', null, '上传资料', '516ea21ee9164926ab97b836c9afd510', '1', '');
INSERT INTO `exam_dictionary` VALUES ('7b0dfb58316f453eb511e6be13a4535e', null, '简单', '1811ff7ffa2747c89752b3a0ae0a6906', '1', '1');
INSERT INTO `exam_dictionary` VALUES ('7e65b23d52fb41e4af99b18315eae545', null, '公司领导', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('8fc47fa0ea804e9da67f6471a17732dc', null, '医学', '1ae69e01257b468e9f262719e744092c', '1', '');
INSERT INTO `exam_dictionary` VALUES ('90f5a5d3df2441a3a6c60fadafa2df86', null, '项目总监', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('913b4e47e70d49668c853704aadcbd5f', null, '公司副总', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('97b9008be97d4ba09af8237e9ae23e2a', null, '管理岗', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('9d706f7d627045caa78ceeb2329ed225', null, '小车驾驶员考试科目四', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('9fe240c4453a47b69350cf4101be9a95', null, '随机试卷', '1c2089ee286a4ed0a5a052885bc800a0', '1', '2');
INSERT INTO `exam_dictionary` VALUES ('a2c5727a5886487c934bbb5a7192c56b', null, '货车驾驶员考试科目一', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('a886b6c43d824b6b8e710a3d4bfe73c0', null, '小车驾驶员考试科目四', '626ae22d71514df4b204d314f3b2852d', '1', '');
INSERT INTO `exam_dictionary` VALUES ('cbb996911b98463b97dc63bb3ba55b0c', null, '十九大知识', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('d02c3ecdc4d440e685994285e32cb431', null, '客车驾驶员考试科目一', '32e151b8af1f466b97ba693206ad3bd9', '1', '');
INSERT INTO `exam_dictionary` VALUES ('d275512389424b4793586a7783899929', null, '经理助理', 'ba6d638271be4627808ea9a1ebb475b3', '1', '');
INSERT INTO `exam_dictionary` VALUES ('da9ecd65553c47bb8de387923ee60188', null, '参加培训', '516ea21ee9164926ab97b836c9afd510', '1', '');
INSERT INTO `exam_dictionary` VALUES ('e79fd691c1d941d8872d7b5720a55a4c', null, '小车驾驶员考试科目一', '626ae22d71514df4b204d314f3b2852d', '1', '');
INSERT INTO `exam_dictionary` VALUES ('e9ad9d6e5fdd4eb7a640df3025d30d65', null, '驾照', '1ae69e01257b468e9f262719e744092c', '1', '');
INSERT INTO `exam_dictionary` VALUES ('e9e0ce4fba2741438015bc468e927afd', null, '多选题', '63ffffa2d98d4b699b443447d833c2fd', '1', '2');
INSERT INTO `exam_dictionary` VALUES ('f18b2d5154ed4c298e631763b8e35f3a', null, '一般', '1811ff7ffa2747c89752b3a0ae0a6906', '1', '2');
INSERT INTO `exam_dictionary` VALUES ('f42fd58ad57b4671a35ac770733d641f', null, '客车驾驶员考试科目四', '32e151b8af1f466b97ba693206ad3bd9', '1', '');

-- ----------------------------
-- Table structure for exam_dictionary_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_dictionary_type`;
CREATE TABLE `exam_dictionary_type` (
  `id` varchar(32) NOT NULL COMMENT 'uuid，主键',
  `code` varchar(20) NOT NULL COMMENT '类型编码',
  `name` varchar(100) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_dictionary_type
-- ----------------------------
INSERT INTO `exam_dictionary_type` VALUES ('14d5dd5d53ae4c96a71b42da7c9c4b58', 'KSLX', '考试类型');
INSERT INTO `exam_dictionary_type` VALUES ('1811ff7ffa2747c89752b3a0ae0a6906', 'STNYCD', '试题难易程度');
INSERT INTO `exam_dictionary_type` VALUES ('1ae69e01257b468e9f262719e744092c', 'KJLB', '课件类别');
INSERT INTO `exam_dictionary_type` VALUES ('1c2089ee286a4ed0a5a052885bc800a0', 'SJGZLX', '试卷规则类型');
INSERT INTO `exam_dictionary_type` VALUES ('32e151b8af1f466b97ba693206ad3bd9', 'KMLX', '科目类型');
INSERT INTO `exam_dictionary_type` VALUES ('4af6e137c1a64e68aa44e3c17b182740', 'ZSKWJZT', '知识库文件状态');
INSERT INTO `exam_dictionary_type` VALUES ('516ea21ee9164926ab97b836c9afd510', 'JFGZLX', '积分规则类型');
INSERT INTO `exam_dictionary_type` VALUES ('626ae22d71514df4b204d314f3b2852d', 'KCLB', '课程类别');
INSERT INTO `exam_dictionary_type` VALUES ('63ffffa2d98d4b699b443447d833c2fd', 'STLX', '试题类型');
INSERT INTO `exam_dictionary_type` VALUES ('8621c81119f0444885f0ec96caa874d2', 'YHTX', '用户头衔');
INSERT INTO `exam_dictionary_type` VALUES ('ba6d638271be4627808ea9a1ebb475b3', 'YHGW', '用户岗位');

-- ----------------------------
-- Table structure for exam_option
-- ----------------------------
DROP TABLE IF EXISTS `exam_option`;
CREATE TABLE `exam_option` (
  `id` varchar(32) NOT NULL,
  `test_questions_id` varchar(32) NOT NULL COMMENT '试题表id',
  `choice` varchar(100) NOT NULL COMMENT '选项',
  `sort` int(1) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_option
-- ----------------------------
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0b991720001', '402880f462e0b72e0162e0b970f90000', '刑事责任', '1', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0b991720002', '402880f462e0b72e0162e0b970f90000', '民事责任', '2', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0b991730003', '402880f462e0b72e0162e0b970f90000', '经济责任', '3', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0b991730004', '402880f462e0b72e0162e0b970f90000', '直接责任', '4', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0cadccc0006', '402880f462e0b72e0162e0cadc760005', '5年内', '1', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0cadccd0007', '402880f462e0b72e0162e0cadc760005', '10年内', '2', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0cadccd0008', '402880f462e0b72e0162e0cadc760005', '终生', '3', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462e0b72e0162e0cadccd0009', '402880f462e0b72e0162e0cadc760005', '20年内', '4', '2018-04-24 16:18:27', null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fa98f9ae0002', '402880f462fa66000162fa98f94c0001', '工作证', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fa98f9ae0003', '402880f462fa66000162fa98f94c0001', '驾驶证', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fa98f9ae0004', '402880f462fa66000162fa98f94c0001', '身份证', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fa98f9ae0005', '402880f462fa66000162fa98f94c0001', '职业资格证', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa0448c0007', '402880f462fa66000162faa044410006', '使用所学车型的教练车由教练员随车指导', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa0448c0008', '402880f462fa66000162faa044410006', '使用所学车型的教练车单独驾驶学习', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa0448d0009', '402880f462fa66000162faa044410006', '使用私家车由教练员随车指导', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa0448d000a', '402880f462fa66000162faa044410006', '使用所学车型的教练车由非教练员的驾驶人随车指导', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa3e77f000c', '402880f462fa66000162faa3e73f000b', '6个月', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa3e780000d', '402880f462fa66000162faa3e73f000b', '12个月', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa3e780000e', '402880f462fa66000162faa3e73f000b', '16个月', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faa3e780000f', '402880f462fa66000162faa3e73f000b', '18个月', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faaa96730011', '402880f462fa66000162faaa963a0010', '注意新手标志', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faaa96730012', '402880f462fa66000162faaa963a0010', '注意避让标志', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faaa96730013', '402880f462fa66000162faaa963a0010', '统一式样的实习标志', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162faaa96730014', '402880f462fa66000162faaa963a0010', '注意车距标志', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fb9d51bf0016', '402880f462fa66000162fb9d51510015', '3年内', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fb9d51bf0017', '402880f462fa66000162fb9d51510015', '终身', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fb9d51c00018', '402880f462fa66000162fb9d51510015', '1年内', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f462fa66000162fb9d51c00019', '402880f462fa66000162fb9d51510015', '5年内', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163011cbe9f0005', '402880f4630112760163011c65900000', '处10日以下拘留', '1', '2018-04-26 16:40:50', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163011cbe9f0006', '402880f4630112760163011c65900000', '暂扣驾驶证', '2', '2018-04-26 16:40:50', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163011cbea00007', '402880f4630112760163011c65900000', '吊销驾驶证', '3', '2018-04-26 16:40:50', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163011cbea00008', '402880f4630112760163011c65900000', '追究刑事责任', '4', '2018-04-26 16:40:50', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301285fa3000a', '402880f463011276016301285f6c0009', '撤销驾驶许可', '1', '2018-04-26 16:50:03', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301285fa3000b', '402880f463011276016301285f6c0009', '收缴驾驶证', '2', '2018-04-26 16:50:03', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301285fa3000c', '402880f463011276016301285f6c0009', '强制恢复车况', '3', '2018-04-26 16:50:03', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301285fa3000d', '402880f463011276016301285f6c0009', '吊销驾驶证', '4', '2018-04-26 16:50:03', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301300f6a000f', '402880f463011276016301300f23000e', '处15日以下拘留', '1', '2018-04-26 16:57:09', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301300f6a0010', '402880f463011276016301300f23000e', '吊销机动车驾驶证', '2', '2018-04-26 16:57:09', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301300f6a0011', '402880f463011276016301300f23000e', '处20以上200元以下罚款', '3', '2018-04-26 16:57:09', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f463011276016301300f6a0012', '402880f463011276016301300f23000e', '追究刑事责任', '4', '2018-04-26 16:57:09', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163013623b40014', '402880f46301127601630136237c0013', '处15日以下拘留', '1', '2018-04-26 17:08:21', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163013623b40015', '402880f46301127601630136237c0013', '依法追究刑事责任', '2', '2018-04-26 17:08:21', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163013623b40016', '402880f46301127601630136237c0013', '处200以上2000元以下罚款', '3', '2018-04-26 17:08:21', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f4630112760163013623b40017', '402880f46301127601630136237c0013', '吊销机动车行驶证', '4', '2018-04-26 17:08:21', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306054be6002f', 'd556ababb2334afd9b1c7a9231c6fc36', '违章行为', '1', '2018-04-27 15:33:20', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306054be70030', 'd556ababb2334afd9b1c7a9231c6fc36', '违法行为', '2', '2018-04-27 15:33:20', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306054be70031', 'd556ababb2334afd9b1c7a9231c6fc36', '过失行为', '3', '2018-04-27 15:33:20', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306054be70032', 'd556ababb2334afd9b1c7a9231c6fc36', '违规行为', '4', '2018-04-27 15:33:20', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306078133003b', '402880f46304d6e2016304dab6b90000', '参与者', '1', '2018-04-27 15:35:45', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306078133003c', '402880f46304d6e2016304dab6b90000', '贡献者', '2', '2018-04-27 15:35:45', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306078133003d', '402880f46304d6e2016304dab6b90000', '引领者', '3', '2018-04-27 15:35:45', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402880f46304d6e2016306078133003e', '402880f46304d6e2016304dab6b90000', '领导者', '4', '2018-04-27 15:35:45', null, 'admin', null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bb782d0010', '402882816304ad9a016304bb77df000f', '水电费', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bb782e0011', '402882816304ad9a016304bb77df000f', '是否', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bb782e0012', '402882816304ad9a016304bb77df000f', '是的冯绍峰', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bb782f0013', '402882816304ad9a016304bb77df000f', '是的冯绍峰的方式', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bc04f20015', '402882816304ad9a016304bc04ab0014', '舒服舒服', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bc04f20016', '402882816304ad9a016304bc04ab0014', '是的冯绍峰是', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bc04f30017', '402882816304ad9a016304bc04ab0014', '分的郭德纲', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304bc04f30018', '402882816304ad9a016304bc04ab0014', '的是否是否', '4', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304c13d7a001a', '402882816304ad9a016304c13d470019', '短发', '1', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304c13d7a001b', '402882816304ad9a016304c13d470019', '的非官方的', '2', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304c13d7a001c', '402882816304ad9a016304c13d470019', '的郭德纲', '3', null, null, null, null);
INSERT INTO `exam_option` VALUES ('402882816304ad9a016304c13d7a001d', '402882816304ad9a016304c13d470019', '舒服舒服', '4', null, null, null, null);

-- ----------------------------
-- Table structure for exam_paper_base
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_base`;
CREATE TABLE `exam_paper_base` (
  `id` varchar(32) NOT NULL,
  `course` varchar(32) DEFAULT NULL COMMENT '科目',
  `name` varchar(100) DEFAULT NULL COMMENT '考试名称',
  `test_id` varchar(255) DEFAULT NULL COMMENT '考试id',
  `rule_id` varchar(255) DEFAULT NULL COMMENT '试卷规则id',
  `total_point` double(6,3) DEFAULT NULL COMMENT '满分',
  `get_point` double(6,3) DEFAULT NULL COMMENT '总得分',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `start_date` datetime DEFAULT NULL COMMENT '考试开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '考试结束时间',
  `answer_date` datetime DEFAULT NULL COMMENT '开始答题时间',
  `submit_date` datetime DEFAULT NULL COMMENT '交卷时间',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `status` varchar(2) DEFAULT NULL COMMENT '试卷状态',
  `approver` varchar(32) DEFAULT NULL COMMENT '批卷人',
  `long_time` int(11) DEFAULT NULL COMMENT '考试时长（分钟）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper_base
-- ----------------------------
INSERT INTO `exam_paper_base` VALUES ('142f297211c84edca4ff6c6c5d9ff565', null, null, '402882816343cfe30163440c9d3a0001', '35cb4f1553004b019550724fe467ddb6', '28.000', null, 'gaochangjun', null, null, '2018-05-18 15:49:37', null, '2018-05-18 10:57:58', '2018-05-18 10:57:58', 'gaochangjun', 'gaochangjun', '2', null, '8');
INSERT INTO `exam_paper_base` VALUES ('2f8a542b283e47469f77f3559e387185', null, null, '402880f4632a3b1401632a48f6330000', '35cb4f1553004b019550724fe467ddb6', '28.000', null, 'gaochangjun', null, null, '2018-05-17 10:00:17', '2018-05-18 15:31:55', '2018-05-17 10:00:10', '2018-05-17 10:00:10', 'gaochangjun', 'gaochangjun', '3', '系统管理员', '60');
INSERT INTO `exam_paper_base` VALUES ('322466e2fbab4cc081d08ada9a4cfebf', null, null, '402880f4632a3b1401632a48f6330000', '35cb4f1553004b019550724fe467ddb6', '28.000', '0.000', 'test', null, null, '2018-05-17 14:22:37', '2018-05-17 15:34:04', '2018-05-17 10:00:10', '2018-05-28 16:38:59', 'gaochangjun', 'gaochangjun', '2', '系统管理员', '14');
INSERT INTO `exam_paper_base` VALUES ('3dc47bef7a884c5bb514ca73d3cf350b', null, null, '402880f4632905a401632a1dc7f70000', '35cb4f1553004b019550724fe467ddb6', '28.000', '0.000', 'gaochangjun', null, null, '2018-05-18 17:23:02', null, '2018-05-18 17:22:50', '2018-05-28 16:34:20', 'gaochangjun', 'gaochangjun', '2', '系统管理员', '6');
INSERT INTO `exam_paper_base` VALUES ('579bc4095b32404e83d4d544471282c7', null, null, '402880f4632a3b1401632a48f6330000', '35cb4f1553004b019550724fe467ddb6', '28.000', '9.000', 'admin', null, null, '2018-05-17 15:57:37', '2018-05-18 11:18:22', '2018-05-17 10:00:10', '2018-05-18 13:56:37', 'gaochangjun', 'gaochangjun', '3', '系统管理员', '60');
INSERT INTO `exam_paper_base` VALUES ('8280ac81197d468781b81622f16a8381', null, null, '402880fa63965416016396584a460003', '35cb4f1553004b019550724fe467ddb6', '28.000', '10.000', 'gao', null, null, '2018-05-25 16:12:43', '2018-05-25 16:14:56', '2018-05-25 16:10:59', '2018-05-25 16:16:09', 'gaochangjun', 'gaochangjun', '3', '系统管理员', '28');
INSERT INTO `exam_paper_base` VALUES ('bda9db4d30bd40769dbbc5318de19f65', null, null, '402880f4632905a401632a1dc7f70000', '35cb4f1553004b019550724fe467ddb6', '28.000', '0.000', 'admin', null, null, '2018-05-25 16:16:59', '2018-05-28 15:11:34', '2018-05-18 17:22:50', '2018-05-28 16:29:27', 'gaochangjun', 'gaochangjun', '3', '系统管理员', '18');
INSERT INTO `exam_paper_base` VALUES ('f5589f0274b344418b1a0b021f2b94f4', null, null, '402880f4632905a401632a1dc7f70000', '35cb4f1553004b019550724fe467ddb6', '28.000', '0.000', 'test', null, null, '2018-05-22 15:06:19', null, '2018-05-18 17:22:50', '2018-05-28 16:36:43', 'gaochangjun', 'gaochangjun', '2', '系统管理员', '20');

-- ----------------------------
-- Table structure for exam_paper_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_questions`;
CREATE TABLE `exam_paper_questions` (
  `id` varchar(32) NOT NULL,
  `paper_base_id` varchar(32) DEFAULT NULL,
  `question_number` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `get_point` double(6,2) DEFAULT NULL,
  `question_id` varchar(32) DEFAULT NULL,
  `point` double(6,2) DEFAULT NULL,
  `is_answered` varchar(1) DEFAULT NULL COMMENT '是否答卷',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper_questions
-- ----------------------------
INSERT INTO `exam_paper_questions` VALUES ('00c5f1b1af8249e380834aaddb3a8f1f', '2f8a542b283e47469f77f3559e387185', '1', '1', '2', null, '402880f46301127601630136237c0013', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('04d9e98c25a54ddcac5a83de2443a97b', '8280ac81197d468781b81622f16a8381', '6', '3', '1', '0.00', '402880f46304d6e201630513dcf90005', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('0814b500b0cb40569fc2b7f29540ff54', '579bc4095b32404e83d4d544471282c7', '8', '4', '哈哈哈', '2.00', '40288281633831a901633878f4fa0000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('0d8660f262e44b29b09677a0cbf4bc75', '2f8a542b283e47469f77f3559e387185', '5', '2', '1,4', null, '402882816304ad9a016304c13d470019', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('140855e8c0b4495bbdf02bb75577b8fa', '8280ac81197d468781b81622f16a8381', '10', '5', null, null, '402882816304ad9a016304c286770022', '10.00', null);
INSERT INTO `exam_paper_questions` VALUES ('1d89f29c07764d66a16b324909a5096e', 'bda9db4d30bd40769dbbc5318de19f65', '8', '4', '封装、多态、继承', '0.00', '402880f46304d6e2016305c42ba90026', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('222f4694ab7b49b7bac145044f65055d', '2f8a542b283e47469f77f3559e387185', '7', '3', '1', null, '402882816304ad9a016304c1ba88001e', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('22a97051a37c47548c5d34e40d07f587', '8280ac81197d468781b81622f16a8381', '5', '2', '', '0.00', '402882816304ad9a016304bb77df000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('22cb278e82704ee3aa4fe675743f57b2', '579bc4095b32404e83d4d544471282c7', '2', '1', '2', '0.00', '402880f462fa66000162faa3e73f000b', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('266af9eb035241d9b22d208ce400a748', '142f297211c84edca4ff6c6c5d9ff565', '1', '1', '3', null, '402880f463011276016301285f6c0009', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('2670545e3ecb42669768c14e0c0cd85f', '142f297211c84edca4ff6c6c5d9ff565', '9', '4', '', null, '40288281633831a901633878f4fa0000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('27e6d31de5f0414e9860c4fafc072f76', 'f5589f0274b344418b1a0b021f2b94f4', '3', '1', null, '0.00', '402880f462fa66000162faa3e73f000b', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('2cbe6de181354db0aeef6f606def8fce', '322466e2fbab4cc081d08ada9a4cfebf', '9', '4', '', '0.00', '40288281633831a901633878f4fa0000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('302aaf3ed3cc48e98b1a0ef590960cdd', '2f8a542b283e47469f77f3559e387185', '9', '4', 'sfdsf', null, '40288281633831a901633878f4fa0000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('30d4105207154242a541257a2ee09812', '3dc47bef7a884c5bb514ca73d3cf350b', '8', '4', '', '0.00', '40288281633831a901633878f4fa0000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('332cd994b4a84afaaa2dbb2dc6215804', '8280ac81197d468781b81622f16a8381', '1', '1', '2', '0.00', '402880f462fa66000162fa98f94c0001', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('34eaf7aaf4f0429b8556cb1e2093cc2c', '142f297211c84edca4ff6c6c5d9ff565', '2', '1', '2', null, '402880f462fa66000162faa044410006', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('3ffc8583563343eb8ba76e3cd33297e2', 'f5589f0274b344418b1a0b021f2b94f4', '6', '3', null, '0.00', '402882816304ad9a016304c1ba88001e', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('42652b10322248fb9d810be43fbbdafd', '8280ac81197d468781b81622f16a8381', '7', '3', null, '0.00', '402880f462e0b72e0162e0e5d764000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('453fd803ceb7438882e1e0ace8364679', '142f297211c84edca4ff6c6c5d9ff565', '7', '3', null, null, '402880f462e0b72e0162e0e5d764000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('473114ca3d1043b994dc0f1ab5958587', '322466e2fbab4cc081d08ada9a4cfebf', '1', '1', null, '0.00', '402880f462fa66000162faaa963a0010', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('490f146d72d24429a78379e73ab28a25', '322466e2fbab4cc081d08ada9a4cfebf', '4', '2', '', '0.00', '402882816304ad9a016304bc04ab0014', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('4989a8fadce94282a3ac26e8bb432731', '142f297211c84edca4ff6c6c5d9ff565', '3', '1', null, null, '402880f462fa66000162faaa963a0010', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('50395c64a7814301a1622e79eb558725', '322466e2fbab4cc081d08ada9a4cfebf', '5', '2', '', '0.00', '402880f46304d6e2016304dab6b90000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('550d19bd30d94a4eb121be32b8c96311', 'f5589f0274b344418b1a0b021f2b94f4', '10', '5', null, null, '402882816304ad9a016304c286770022', '10.00', null);
INSERT INTO `exam_paper_questions` VALUES ('56e1862f4bd6493c951e401dda9a5128', '579bc4095b32404e83d4d544471282c7', '6', '3', '2', '0.00', '402882816304ad9a016304c1ba88001e', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('5a23e994dbf5403c87f27532c2eeb933', 'f5589f0274b344418b1a0b021f2b94f4', '5', '2', null, '0.00', '402882816304ad9a016304bc04ab0014', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('5a5cbd95a4a644a0be2d6c6cc5e9d6f4', 'bda9db4d30bd40769dbbc5318de19f65', '5', '2', '3', '0.00', '402880f46304d6e2016304dab6b90000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('5e0419cfd7084febb06b17408345b58d', '8280ac81197d468781b81622f16a8381', '2', '1', null, '2.00', '402880f46301127601630136237c0013', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('612c43d1898e40d298f108f844442c07', '579bc4095b32404e83d4d544471282c7', '1', '1', '3', '0.00', '402880f46301127601630136237c0013', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('61832aec4b9a451497a9596e7ca4bbd4', 'f5589f0274b344418b1a0b021f2b94f4', '4', '2', null, '0.00', '402882816304ad9a016304c13d470019', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('69efbc0177914d6b980b44ded5c722d2', '8280ac81197d468781b81622f16a8381', '3', '1', null, '2.00', '402880f462fa66000162fb9d51510015', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('6bdd1c38cec14bc69964ba66bacd25ce', '142f297211c84edca4ff6c6c5d9ff565', '8', '4', '', null, '402880f46304d6e2016305c42ba90026', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('6cd1003685954669b53a6aeb1e955b6f', 'bda9db4d30bd40769dbbc5318de19f65', '2', '1', '3', '0.00', '402880f4630112760163011c65900000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('6e379624a37c4949892878442c8951bc', '579bc4095b32404e83d4d544471282c7', '9', '4', '哈哈', '2.00', '402880f46304d6e2016305c42ba90026', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('7186e746a33947d4839b28e5fed80fe1', '579bc4095b32404e83d4d544471282c7', '7', '3', '1', '0.00', '402880f462e0b72e0162e0e17f51000d', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('71bc738e15dd4a5489e5fdccd37a13f4', '142f297211c84edca4ff6c6c5d9ff565', '10', '5', '', null, '402882816304ad9a016304c286770022', '10.00', null);
INSERT INTO `exam_paper_questions` VALUES ('731e5ad901544395947ab38f7014657e', '3dc47bef7a884c5bb514ca73d3cf350b', '4', '2', '2,3', '0.00', '402882816304ad9a016304bb77df000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('759462d119344742bf7e3cf871abdc02', '322466e2fbab4cc081d08ada9a4cfebf', '10', '5', '', null, '402882816304ad9a016304c286770022', '10.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('7916fda157c749409ab7620c8a1c7b2e', 'f5589f0274b344418b1a0b021f2b94f4', '2', '1', null, '0.00', '402880f463011276016301285f6c0009', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('7dd173f2183b42bda98e1dc700672f5f', '142f297211c84edca4ff6c6c5d9ff565', '4', '2', '', null, '402882816304ad9a016304c13d470019', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('7e5f99ba758e4a1a99ad31db698abd52', '579bc4095b32404e83d4d544471282c7', '5', '2', '2,3', '0.00', '402880f46304d6e2016304dab6b90000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('80303003671843e9a3a9f5f727627e7d', '142f297211c84edca4ff6c6c5d9ff565', '5', '2', '', null, '402882816304ad9a016304bc04ab0014', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('8187cee6a1934e8cb4b8ebcc83995582', '8280ac81197d468781b81622f16a8381', '9', '4', 'sdfsfs', '2.00', '402880f46304d6e2016305c42ba90026', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('8cc80b6ec2b74f888b566f0d37d9c063', 'bda9db4d30bd40769dbbc5318de19f65', '10', '5', '的地方给对方地方法规的 豆腐干', null, '402882816304ad9a016304c286770022', '10.00', null);
INSERT INTO `exam_paper_questions` VALUES ('97e4d25ad0fe485ca53498fdffd2198c', 'bda9db4d30bd40769dbbc5318de19f65', '6', '3', '1', '0.00', '402880f4630b8cf801630b92994e000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('9fda666337024786aac3e19baf8776eb', '8280ac81197d468781b81622f16a8381', '4', '2', '', '2.00', '402882816304ad9a016304bc04ab0014', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('a3b6dfe46b1646bbb18412f3d1d8583b', 'bda9db4d30bd40769dbbc5318de19f65', '9', '4', '正确答案', '0.00', '40288281633831a901633878f4fa0000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('a9a3cf8e15f643b1bea1302d26891975', '142f297211c84edca4ff6c6c5d9ff565', '6', '3', null, null, '402882816304ad9a016304c1ba88001e', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('aeddfb85aff24327a238408b695fe421', '579bc4095b32404e83d4d544471282c7', '10', '5', 'adasda', '5.00', '402882816304ad9a016304c286770022', '10.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('b26ffbc2875c4b6f9b502f2275d1cca4', '3dc47bef7a884c5bb514ca73d3cf350b', '9', '4', '', '0.00', '402880f46304d6e2016305c42ba90026', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('b36afb2475f1413ba741be45ef23b962', 'f5589f0274b344418b1a0b021f2b94f4', '9', '4', null, '0.00', '40288281633831a901633878f4fa0000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('b8080704bb7f412ebd60896bf5e90644', '2f8a542b283e47469f77f3559e387185', '6', '3', '2', null, '402882816304ad9a016304c1e3c4001f', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('bba9fa800cf947e0993be040cbbf6281', '3dc47bef7a884c5bb514ca73d3cf350b', '3', '1', '1', '0.00', '402880f462fa66000162fa98f94c0001', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('bc85ca05aa284bd99d9c7ed0b07e3f4d', '3dc47bef7a884c5bb514ca73d3cf350b', '5', '2', '2,3', '0.00', '402880f46304d6e2016304dab6b90000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('bd39f961b44143ba9101c8931a4ced71', '3dc47bef7a884c5bb514ca73d3cf350b', '7', '3', '1', '0.00', '402880f4630b92c001630b9332720000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('c080cbdda3e842c0a8f0532d3809e91a', '322466e2fbab4cc081d08ada9a4cfebf', '3', '1', null, '0.00', '402880f4630b92c001630b93334d0003', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('c5660d5aefc743029c83edcd05f4bf3b', '3dc47bef7a884c5bb514ca73d3cf350b', '2', '1', '2', '0.00', 'd556ababb2334afd9b1c7a9231c6fc36', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('c63107255fe142d38239d49c4e826c57', 'f5589f0274b344418b1a0b021f2b94f4', '1', '1', null, '0.00', '402880f462fa66000162faa044410006', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('c63458b522cb4cccab42a785b674ded6', 'bda9db4d30bd40769dbbc5318de19f65', '3', '1', '1', '0.00', '402880f463011276016301300f23000e', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('c7e4e65c73914bb59d4c72f6ecf81622', '322466e2fbab4cc081d08ada9a4cfebf', '6', '3', null, '0.00', '402880f4630b8cf801630b8deb320000', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('ca8afa3f8bd04a49ae58ecbd7baefc58', '8280ac81197d468781b81622f16a8381', '8', '4', 'asdasd', '2.00', '40288281633831a901633878f4fa0000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('cd961629dd6c4849ac0cae27b7eeb6c8', '3dc47bef7a884c5bb514ca73d3cf350b', '10', '5', '', null, '402882816304ad9a016304c286770022', '10.00', null);
INSERT INTO `exam_paper_questions` VALUES ('d0e31b400ff547f0ace09366641cc525', '3dc47bef7a884c5bb514ca73d3cf350b', '1', '1', '3', '0.00', '402880f463011276016301285f6c0009', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('d2253913efad4f1bba609514b5c0e293', '579bc4095b32404e83d4d544471282c7', '4', '2', '2,3', '0.00', '402882816304ad9a016304c13d470019', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('d4a6e25c5995400bb97a31492c304d49', '322466e2fbab4cc081d08ada9a4cfebf', '2', '1', null, '0.00', '402880f463011276016301285f6c0009', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('d5a3cd462d0549b0953860e614a0421b', 'bda9db4d30bd40769dbbc5318de19f65', '7', '3', '1', '0.00', '402880f4630b8cf801630b8deb320000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('d7308651d95c4a36af7c1e7c700bd7dd', '322466e2fbab4cc081d08ada9a4cfebf', '8', '4', '', '0.00', '402880f46304d6e2016305c42ba90026', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('e754be36b1e84d2a813018ece39e0943', '2f8a542b283e47469f77f3559e387185', '8', '4', 'sdfsf', null, '402880f46304d6e2016305c42ba90026', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('e7740ac910694a7e84654aa314c715b9', 'f5589f0274b344418b1a0b021f2b94f4', '7', '3', null, '0.00', '402880f4630b8cf801630b92994e000f', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('e8b7e6a9be6c41c286f00492ec801753', '2f8a542b283e47469f77f3559e387185', '4', '2', '2,3', null, '402882816304ad9a016304bc04ab0014', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('ea4b81fbe1554121845b0bb9c3647572', '2f8a542b283e47469f77f3559e387185', '2', '1', '3', null, '402880f462fa66000162faa044410006', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('eac1625aab824a89a072f808d04a7583', '579bc4095b32404e83d4d544471282c7', '3', '1', '3', '0.00', '402880f463011276016301300f23000e', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('ef9bb5012370404b8aa892d9d5d7fdc4', '2f8a542b283e47469f77f3559e387185', '10', '5', 'sfsfsff', null, '402882816304ad9a016304c286770022', '10.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('efcca84e07804eef9772f33f1b38c831', '2f8a542b283e47469f77f3559e387185', '3', '1', '4', null, '402880f462fa66000162fa98f94c0001', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('faf2dcddd5a14bebad574e104495d8ab', 'f5589f0274b344418b1a0b021f2b94f4', '8', '4', null, '0.00', '402880f46304d6e2016305c42ba90026', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('fd78e953147045f898f97324843a3914', 'bda9db4d30bd40769dbbc5318de19f65', '1', '1', null, '0.00', '402880f4630b92c001630b93334d0003', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('fe61d85709be40df88130697af5394c4', '3dc47bef7a884c5bb514ca73d3cf350b', '6', '3', '2', '0.00', '402880f4630b8cf801630b8deb320000', '2.00', null);
INSERT INTO `exam_paper_questions` VALUES ('fe867e1033bb4806addbbe55a768c8c7', '322466e2fbab4cc081d08ada9a4cfebf', '7', '3', null, '0.00', '402880f462e0b72e0162e0e5d764000f', '2.00', '1');
INSERT INTO `exam_paper_questions` VALUES ('ffbbba0f0d1747629d704595bf5192fa', 'bda9db4d30bd40769dbbc5318de19f65', '4', '2', '2,3,4', '0.00', '402882816304ad9a016304c13d470019', '2.00', null);

-- ----------------------------
-- Table structure for exam_paper_relate
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_relate`;
CREATE TABLE `exam_paper_relate` (
  `id` varchar(32) NOT NULL,
  `test_paper_id` varchar(32) NOT NULL COMMENT '试卷表id',
  `test_questions_id` varchar(32) NOT NULL COMMENT '试题表id',
  `test_questions_score` double(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper_relate
-- ----------------------------

-- ----------------------------
-- Table structure for exam_paper_rule
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_rule`;
CREATE TABLE `exam_paper_rule` (
  `id` varchar(32) NOT NULL,
  `course` varchar(32) DEFAULT NULL COMMENT '科目',
  `name` varchar(100) DEFAULT NULL COMMENT '组卷规则名称',
  `type` varchar(1) NOT NULL COMMENT '类型',
  `total_points` double(5,2) DEFAULT NULL COMMENT '试卷总分',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `pass_point` double(5,2) DEFAULT NULL COMMENT '及格分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper_rule
-- ----------------------------
INSERT INTO `exam_paper_rule` VALUES ('35cb4f1553004b019550724fe467ddb6', '语文', '随机试卷规则', '2', '28.00', '2018-05-03 15:54:08', null, 'admin', null, '0.00');
INSERT INTO `exam_paper_rule` VALUES ('87ed33b567e54f779506f09f9428d4b9', null, '固定随机试卷', '3', '26.00', '2018-05-09 16:39:03', null, 'admin', null, '0.00');
INSERT INTO `exam_paper_rule` VALUES ('c7b3e351e1944a1f8902fbd3f3e673b0', '2', '固定试卷规则', '1', '26.00', '2018-05-03 15:26:21', null, 'admin', null, '0.00');

-- ----------------------------
-- Table structure for exam_paper_rule_type
-- ----------------------------
DROP TABLE IF EXISTS `exam_paper_rule_type`;
CREATE TABLE `exam_paper_rule_type` (
  `id` varchar(32) NOT NULL,
  `paper_rule_id` varchar(32) NOT NULL COMMENT '组卷规则表id',
  `type` varchar(2) DEFAULT NULL COMMENT '类型',
  `count` int(3) DEFAULT NULL COMMENT '数量',
  `score` double(5,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `order_number` int(5) DEFAULT NULL COMMENT '试题排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_paper_rule_type
-- ----------------------------
INSERT INTO `exam_paper_rule_type` VALUES ('3268800810df46f187d629ae35e600ed', 'c7b3e351e1944a1f8902fbd3f3e673b0', '1', '2', '2.00', null, null, null, null, '1');
INSERT INTO `exam_paper_rule_type` VALUES ('433582b0458c4cc1b92aae7b5c37f25b', 'c7b3e351e1944a1f8902fbd3f3e673b0', '5', '1', '10.00', null, null, null, null, '5');
INSERT INTO `exam_paper_rule_type` VALUES ('5f649379e87340a0bf7373944516fc05', '87ed33b567e54f779506f09f9428d4b9', '4', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('63efe85ade8a48cba7b78f0c42515b46', '87ed33b567e54f779506f09f9428d4b9', '3', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('677e771242924cedb07aad7860db42eb', '87ed33b567e54f779506f09f9428d4b9', '1', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('6fc2e1bf2acc4fc9b0634161a976ad77', '35cb4f1553004b019550724fe467ddb6', '1', '3', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('8bae883ef90d4c0f8a004d08f5bbc9da', '87ed33b567e54f779506f09f9428d4b9', '5', '1', '10.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('8e98ef6f2b444096973a19d7c8751b4b', 'c7b3e351e1944a1f8902fbd3f3e673b0', '4', '2', '2.00', null, null, null, null, '4');
INSERT INTO `exam_paper_rule_type` VALUES ('94b766a1d9c149ee8c85f98f969a776a', '35cb4f1553004b019550724fe467ddb6', '3', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('953f36920c224835a0b268ef37899151', 'c7b3e351e1944a1f8902fbd3f3e673b0', '2', '2', '2.00', null, null, null, null, '2');
INSERT INTO `exam_paper_rule_type` VALUES ('9a49d79ce2504e08a257cdc8fe81b7ee', '35cb4f1553004b019550724fe467ddb6', '2', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('aab2880e5305446bb7f18218b1d6f643', 'c7b3e351e1944a1f8902fbd3f3e673b0', '3', '2', '2.00', null, null, null, null, '3');
INSERT INTO `exam_paper_rule_type` VALUES ('ae24ef3e01ff4d70ae464a6aefcfd593', '35cb4f1553004b019550724fe467ddb6', '5', '1', '10.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('b2fe1e19fd464f9695dbf95d99f36346', '87ed33b567e54f779506f09f9428d4b9', '2', '2', '2.00', null, null, null, null, null);
INSERT INTO `exam_paper_rule_type` VALUES ('f316bf9fe60843209415c0aa381339db', '35cb4f1553004b019550724fe467ddb6', '4', '2', '2.00', null, null, null, null, null);

-- ----------------------------
-- Table structure for exam_rule_type_level
-- ----------------------------
DROP TABLE IF EXISTS `exam_rule_type_level`;
CREATE TABLE `exam_rule_type_level` (
  `id` varchar(32) NOT NULL,
  `level` varchar(2) DEFAULT NULL COMMENT '难易程度',
  `count` int(3) DEFAULT NULL COMMENT '数量',
  `exam_rule_type_id` varchar(32) DEFAULT NULL COMMENT '组卷规则题型表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_rule_type_level
-- ----------------------------
INSERT INTO `exam_rule_type_level` VALUES ('0072933da0bf4d798d2c7ad2ce46026f', '1', '1', '6fc2e1bf2acc4fc9b0634161a976ad77');
INSERT INTO `exam_rule_type_level` VALUES ('15f9b2618c9c4e7bb51b66c29a696788', '2', '1', '94b766a1d9c149ee8c85f98f969a776a');
INSERT INTO `exam_rule_type_level` VALUES ('322d091c0f964146b5501a4c9ac16110', '1', '1', 'f316bf9fe60843209415c0aa381339db');
INSERT INTO `exam_rule_type_level` VALUES ('38be5003b11342b0a9e97b9efbb76e8b', '2', '1', '9a49d79ce2504e08a257cdc8fe81b7ee');
INSERT INTO `exam_rule_type_level` VALUES ('39f6c3ccfd86472ab95020bc86e1ca80', '2', '1', 'f316bf9fe60843209415c0aa381339db');
INSERT INTO `exam_rule_type_level` VALUES ('3ed6292e5049440ab962bdfd6cfb2dc2', '1', '1', '9a49d79ce2504e08a257cdc8fe81b7ee');
INSERT INTO `exam_rule_type_level` VALUES ('8d5f5ffb0d2e4a66a1a0cb1caa5295dd', '1', '1', '94b766a1d9c149ee8c85f98f969a776a');
INSERT INTO `exam_rule_type_level` VALUES ('9d7a16488ade466283f35b74c3c7cbbe', '2', '1', '6fc2e1bf2acc4fc9b0634161a976ad77');
INSERT INTO `exam_rule_type_level` VALUES ('a58142263acf4096b93e93053333c50e', '3', '1', '6fc2e1bf2acc4fc9b0634161a976ad77');
INSERT INTO `exam_rule_type_level` VALUES ('b8eeb2e025514a17b0a1dd092f487438', '1', '1', 'ae24ef3e01ff4d70ae464a6aefcfd593');

-- ----------------------------
-- Table structure for exam_test
-- ----------------------------
DROP TABLE IF EXISTS `exam_test`;
CREATE TABLE `exam_test` (
  `id` varchar(32) NOT NULL,
  `course` varchar(33) DEFAULT NULL COMMENT '科目',
  `name` varchar(100) NOT NULL COMMENT '考试名称',
  `exam_notice` varchar(255) DEFAULT NULL COMMENT '考试须知',
  `start_date` datetime NOT NULL COMMENT '考试开始时间',
  `end_date` datetime NOT NULL COMMENT '考试结束时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `type` varchar(3) DEFAULT NULL COMMENT '试卷类型',
  `integration` varchar(32) DEFAULT NULL COMMENT '积分',
  `answer_time` double(15,0) DEFAULT NULL COMMENT '答题时间',
  `valid_date` datetime NOT NULL COMMENT '有效时间',
  `is_publish` varchar(1) DEFAULT NULL COMMENT '是否发布考试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_test
-- ----------------------------
INSERT INTO `exam_test` VALUES ('402880e6635d8e4901635d90e30c0000', '54cea47774c5480a8c39f3e6fa3aa4eb', '123213', '', '2018-05-09 01:00:15', '2018-05-17 13:35:15', '2018-05-14 15:32:46', '2018-05-14 15:36:41', 'admin', 'admin', '1', '100', '50', '2018-05-15 09:57:54', '1');
INSERT INTO `exam_test` VALUES ('402880e663a57c970163a5851a5b0000', '54cea47774c5480a8c39f3e6fa3aa4eb', '112233', '', '2018-05-01 01:00:13', '2018-05-02 02:05:13', '2018-05-28 14:52:33', null, 'admin', null, '1', '402880f46367f9b30163680662310001', '12', '2018-05-03 02:25:13', '1');
INSERT INTO `exam_test` VALUES ('402880f4632905a401632a1dc7f70000', '711d2a0bdb28427eba7f47fa9de32a32', '小车驾驶员科目一考试', '小车驾驶员科目一考试', '2018-05-04 15:40:32', '2018-05-04 17:40:32', '2018-05-04 15:46:24', '2018-05-04 17:20:51', 'admin', 'admin', '1', '100', '20', '2018-05-24 09:57:59', '2');
INSERT INTO `exam_test` VALUES ('402880f4632a3b1401632a48f6330000', '711d2a0bdb28427eba7f47fa9de32a32', '小车驾驶员科目一考试1', '小车驾驶员科目一考试1', '2018-05-04 16:30:00', '2018-05-04 18:30:00', '2018-05-04 16:33:34', null, 'admin', null, '1', '100', '30', '2018-05-10 09:58:02', '2');
INSERT INTO `exam_test` VALUES ('402880fa63965416016396584a460003', '711d2a0bdb28427eba7f47fa9de32a32', '中级设备台账部门', 'dsfsdfsfsfs', '2018-05-18 16:05:06', '2018-05-25 15:30:06', '2018-05-25 16:09:18', null, 'admin', null, '1', '100', '30', '2018-05-25 23:50:06', '2');
INSERT INTO `exam_test` VALUES ('402882816343cfe30163440c9d3a0001', '711d2a0bdb28427eba7f47fa9de32a32', 'ceshi', 'ceshi', '2018-05-02 01:05:26', '2018-05-02 02:50:26', '2018-05-09 16:37:47', '2018-05-14 10:27:00', 'admin', 'admin', '2', '120', '40', '2018-05-02 09:58:46', '2');

-- ----------------------------
-- Table structure for exam_test_manage
-- ----------------------------
DROP TABLE IF EXISTS `exam_test_manage`;
CREATE TABLE `exam_test_manage` (
  `id` varchar(32) NOT NULL,
  `course` varchar(32) DEFAULT NULL COMMENT '科目',
  `name` varchar(100) DEFAULT NULL COMMENT '考试名称',
  `exam_notice` varchar(255) DEFAULT NULL COMMENT '考试须知',
  `start_date` datetime DEFAULT NULL COMMENT '考试开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '考试结束时间',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `status` varchar(2) DEFAULT NULL COMMENT '试卷状态',
  `long_time` int(11) DEFAULT NULL COMMENT '考试时长（分钟）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_test_manage
-- ----------------------------

-- ----------------------------
-- Table structure for exam_test_paper
-- ----------------------------
DROP TABLE IF EXISTS `exam_test_paper`;
CREATE TABLE `exam_test_paper` (
  `id` varchar(32) NOT NULL,
  `course` varchar(3) DEFAULT NULL COMMENT '科目',
  `paper_rule_id` varchar(32) DEFAULT NULL COMMENT '组卷规则表id',
  `name` varchar(100) DEFAULT NULL COMMENT '试卷名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_test_paper
-- ----------------------------

-- ----------------------------
-- Table structure for exam_test_questions
-- ----------------------------
DROP TABLE IF EXISTS `exam_test_questions`;
CREATE TABLE `exam_test_questions` (
  `id` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL COMMENT '题目',
  `type` varchar(2) NOT NULL COMMENT '类型',
  `result` varchar(255) NOT NULL COMMENT '答案',
  `attachment_id` varchar(32) DEFAULT NULL COMMENT '附件表id',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  `course` varchar(32) DEFAULT NULL COMMENT '科目',
  `level` int(255) NOT NULL COMMENT '难易程度',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_test_questions
-- ----------------------------
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0b970f90000', '机动车驾驶人违法驾驶造成重大交通事故构成犯罪的，依法追究什么责任？', '1', '1', null, '2', '1', '1', '2018-04-20 09:44:32', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0cadc760005', '机动车驾驶人造成事故后逃逸构成犯罪的，吊销驾驶证且多长时间不得重新取得驾驶证？', '1', '3', null, '3', '1', '1', '2018-04-20 10:03:33', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0d5a9df000a', '驾驶机动车违反道路交通安全法律法规发生交通事故属于交通违章行为。', '3', '2', null, '4', '1', '1', '2018-04-20 10:15:21', '2018-04-27 14:16:21', 'admin', 'admin');
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0d9904f000b', '驾驶机动车在道路上违反道路通行规定应当接受相应的处罚。', '3', '1', null, '5', '1', '1', '2018-04-20 10:19:37', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0dd344c000c', '对未取得驾驶证驾驶机动车的，追究其法律责任。', '3', '1', null, '6', '1', '1', '2018-04-20 10:23:36', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0e17f51000d', '对违法驾驶发生重大交通事故且构成犯罪的，不追究其刑事责任。', '3', '2', null, '7', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-20 10:28:17', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0e39324000e', '造成交通事故后逃逸且构成犯罪的驾驶人,将吊销驾驶证且终生不得重新取得驾驶证。', '3', '1', null, '8', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-20 10:30:33', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462e0b72e0162e0e5d764000f', '驾驶机动车在道路上违反交通安全法规的行为属于违法行为。', '3', '1', null, '9', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-20 10:33:02', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462fa66000162fa98f94c0001', '驾驶机动车应当随身携带哪种证件？', '1', '2', null, '10', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-25 10:19:12', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462fa66000162faa044410006', '未取得驾驶证的学员在道路上学习驾驶技能，下列哪种做法是正确的？', '1', '1', null, '11', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-25 10:27:10', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462fa66000162faa3e73f000b', '机动车驾驶人初次申领驾驶证后的实习期是多长时间？', '1', '2', null, '12', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-25 10:31:08', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462fa66000162faaa963a0010', '在实习期内驾驶机动车的，应当在车身后部粘贴或者悬挂哪种标志？', '1', '3', null, '13', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-25 10:38:26', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f462fa66000162fb9d51510015', '以欺骗、贿赂等不正当手段取得驾驶证被依法撤销驾驶许可的，多长时间不得重新申请驾驶许可？', '1', '1', null, '14', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-25 15:03:33', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630112760163011c65900000', '驾驶拼装机动车上路行驶的驾驶人，除按规定接受罚款外，还要受到哪种处理？', '1', '3', null, '15', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-26 16:40:28', '2018-04-26 16:40:50', 'admin', 'admin');
INSERT INTO `exam_test_questions` VALUES ('402880f463011276016301285f6c0009', '驾驶报废机动车上路行驶的驾驶人，除按规定罚款外，还要受到哪种处理？', '1', '4', null, '16', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-26 16:50:03', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f463011276016301300f23000e', '对驾驶已达到报废标准的机动车上路行驶的驾驶人，会受到下列哪种处罚？', '1', '2', null, '17', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-26 16:57:09', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f46301127601630136237c0013', '对驾驶拼装机动车上路行驶的驾驶人，会受到下列哪种处罚？', '1', '3', null, '18', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-26 17:08:21', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f46304d6e2016304dab6b90000', '引导应对气候变化国际合作，成为全球生态文明建设的重要( )、( )、( )。', '2', '1,2,3', null, '29', '711d2a0bdb28427eba7f47fa9de32a32', '3', '2018-04-27 10:07:12', '2018-04-27 15:35:45', 'admin', 'admin');
INSERT INTO `exam_test_questions` VALUES ('402880f46304d6e201630513dcf90005', '驾驶人要按照驾驶证载明的准驾车型驾驶车辆。', '3', '1', null, '30', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 11:09:37', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f46304d6e2016305c42ba90026', '面向对象程序设计的三个特征是____________。', '4', '封装、多态、继承', null, '31', '711d2a0bdb28427eba7f47fa9de32a32', '3', '2018-04-27 14:22:12', '2018-04-27 14:34:02', 'admin', 'admin');
INSERT INTO `exam_test_questions` VALUES ('402880f46304d6e201630608b256003f', '上路行驶的机动车未随车携带身份证的，交通警察可依法扣留机动车。', '3', '2', null, '32', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 15:37:03', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b878801630b8c69ee0000', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '1', '1', '2018-04-28 17:19:01', '2018-05-11 10:41:30', 'admin', 'admin');
INSERT INTO `exam_test_questions` VALUES ('402880f4630b8cf801630b8deb320000', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:20:40', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b8cf801630b8fdf470005', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:22:48', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b8cf801630b912713000a', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:23:54', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b8cf801630b92994e000f', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:25:46', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b8cf801630b9299900010', '伪造、变造机动车驾驶证构成犯罪的将被依法追究刑事责任。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:25:47', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b92c001630b9332720000', '上路行驶的机动车未放置检验合格标志的，交通警察可依法扣留机动车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:26:26', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b92c001630b9332d80001', '伪造、变造机动车驾驶证构成犯罪的将被依法追究刑事责任。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:26:26', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b92c001630b9333130002', '机动车驾驶人在实习期内驾驶机动车不得牵引挂车。', '3', '1', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:26:26', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402880f4630b92c001630b93334d0003', '对驾驶已达到报废标准的机动车上路行驶的驾驶人，会受到下列哪种处罚？', '1', '2', null, null, '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-28 17:26:26', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304bb77df000f', '史蒂芬孙菲菲是的冯绍峰', '2', '1,2', null, '21', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-27 09:33:04', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304bc04ab0014', '的是否是否', '2', '2,3,4', null, '22', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-27 09:33:40', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304c13d470019', '鼎折覆餗', '2', '2,3', null, '23', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 09:39:23', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304c1ba88001e', '是放松放松', '3', '1', null, '24', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 09:39:55', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304c1e3c4001f', '的是梵蒂冈', '3', '2', null, '25', '711d2a0bdb28427eba7f47fa9de32a32', '2', '2018-04-27 09:40:05', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304c2140f0020', '的观点股份', '4', '的发广告', null, '26', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 09:40:18', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('402882816304ad9a016304c286770022', '地方郭德纲', '5', '的地方给对方地方法规的 豆腐干', null, '28', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-27 09:40:47', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('40288281633831a901633878f4fa0000', '测试一个填空题？', '4', '正确答案', null, '33', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-05-07 10:40:41', null, 'admin', null);
INSERT INTO `exam_test_questions` VALUES ('d556ababb2334afd9b1c7a9231c6fc36', '驾驶机动车在道路上违反道路交通安全法的行为，属于什么行为？', '1', '2', null, '1', '711d2a0bdb28427eba7f47fa9de32a32', '1', '2018-04-25 17:18:11', '2018-04-27 15:33:20', 'admin', 'admin');

-- ----------------------------
-- Table structure for exam_user_answer
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_answer`;
CREATE TABLE `exam_user_answer` (
  `id` varchar(32) NOT NULL,
  `base_user_answer_id` varchar(32) DEFAULT NULL COMMENT '用户答题基本信息表id',
  `test_questions_id` varchar(32) DEFAULT NULL COMMENT '试题表id',
  `answer` varchar(255) DEFAULT NULL COMMENT '用户答案',
  `gain_score` double(5,2) DEFAULT NULL COMMENT '获得分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_user_answer
-- ----------------------------

-- ----------------------------
-- Table structure for exam_user_own_info
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_own_info`;
CREATE TABLE `exam_user_own_info` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_user_own_info
-- ----------------------------

-- ----------------------------
-- Table structure for exam_user_paper_relate
-- ----------------------------
DROP TABLE IF EXISTS `exam_user_paper_relate`;
CREATE TABLE `exam_user_paper_relate` (
  `id` varchar(32) NOT NULL,
  `test_paper_id` varchar(32) DEFAULT NULL COMMENT '试卷表id',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户表id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_user_paper_relate
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('41');

-- ----------------------------
-- Table structure for integral_rule
-- ----------------------------
DROP TABLE IF EXISTS `integral_rule`;
CREATE TABLE `integral_rule` (
  `id` varchar(32) NOT NULL COMMENT '主键,uuid',
  `name` varchar(50) DEFAULT NULL COMMENT '积分规则名称',
  `type` varchar(32) DEFAULT NULL COMMENT '类型(uuid，关联数据字典表id)',
  `score` double(5,2) DEFAULT NULL COMMENT '可获得积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of integral_rule
-- ----------------------------
INSERT INTO `integral_rule` VALUES ('402880f46367f9b3016368062ad80000', '考试积分', '704ca70a0efb43118ad1ef1b712397f4', '100.00');
INSERT INTO `integral_rule` VALUES ('402880f46367f9b30163680662310001', '上传资料积分', '7b0090686591410abcd03890d7a8546e', '10.00');
INSERT INTO `integral_rule` VALUES ('402880f46367f9b301636806a3160002', '参加培训积分', 'da9ecd65553c47bb8de387923ee60188', '10.00');

-- ----------------------------
-- Table structure for t_common_button
-- ----------------------------
DROP TABLE IF EXISTS `t_common_button`;
CREATE TABLE `t_common_button` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `show_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_button
-- ----------------------------
INSERT INTO `t_common_button` VALUES ('402880f1635c7d3601635c861dc40015', null, null, null, 'add', '新增');
INSERT INTO `t_common_button` VALUES ('402880f1635c7d3601635c861dc40016', null, null, null, 'update', '更新');
INSERT INTO `t_common_button` VALUES ('402880f1635c7d3601635c861dc40017', null, null, null, 'delete', '删除');
INSERT INTO `t_common_button` VALUES ('402880f1635c7d3601635c861dc40018', null, null, null, 'Import', '导入');

-- ----------------------------
-- Table structure for t_common_depart
-- ----------------------------
DROP TABLE IF EXISTS `t_common_depart`;
CREATE TABLE `t_common_depart` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `show_name` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `pater_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK661jxoh5t1r03sot61t7y5xig` (`pater_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_depart
-- ----------------------------
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a05ecc0003', '2018-05-21 10:56:23', null, null, 'A01A02', '', '机关附属及社会组织', '2', '402880e663809b1e0163809f83750001');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e0163809ff6630002', '2018-05-21 10:55:57', null, null, 'A01A01', '', '机关部室', '1', '402880e663809b1e0163809f83750001');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e0163809f83750001', '2018-05-21 10:55:27', null, null, 'A01', '', '中石油通信公司', '1', null);
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a0cfc70004', '2018-05-21 10:56:52', null, null, 'A01A03', '', '基层单位', '3', '402880e663809b1e0163809f83750001');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a2ac0b0005', '2018-05-21 10:58:54', null, null, 'A01A01A01', '', '公司办公室(党委办公室)', '1', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a376cb0006', '2018-05-21 10:59:46', null, null, 'A01A01A02', '', '人事部(党委组织部)', '2', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a40dff0007', '2018-05-21 11:00:25', null, null, 'A01A01A03', '', '经营计划部', '3', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a44e090008', '2018-05-21 11:00:41', null, null, 'A01A01A04', '', '财务部', '4', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a4a9be0009', '2018-05-21 11:01:05', null, null, 'A01A01A05', '', '质量安全环保部', '5', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a4ffe9000a', '2018-05-21 11:01:27', null, null, 'A01A01A06', '', '技术与标准部(学会办公室)', '6', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a534bd000b', '2018-05-21 11:01:40', null, null, 'A01A01A07', '', '审计部', '7', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a56db1000c', '2018-05-21 11:01:55', null, null, 'A01A01A08', '', '纪检督察部', '8', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a5b56a000d', '2018-05-21 11:02:13', null, null, 'A01A01A09', '', '党群工作部(企业文化部)', '9', '402880e663809b1e0163809ff6630002');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a632ce000e', '2018-05-21 11:02:45', null, null, 'A01A02A01', '', '档案室', '1', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a69149000f', '2018-05-21 11:03:09', null, null, 'A01A02A02', '', '人事服务中心', '2', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a6df7e0010', '2018-05-21 11:03:29', null, null, 'A01A02A03', '', '财务集中报销中心', '3', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a722650011', '2018-05-21 11:03:47', null, null, 'A01A02A04', '', '质量安全监督站', '4', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a788000012', '2018-05-21 11:04:13', null, null, 'A01A02A05', '', '物料中心(招标中心)', '5', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a7bed00013', '2018-05-21 11:04:27', null, null, 'A01A02A06', '', '设备管理中心', '6', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a816cb0014', '2018-05-21 11:04:49', null, null, 'A01A02A07', '', '行政服务中心', '7', '402880e663809b1e016380a05ecc0003');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a86e2d0015', '2018-05-21 11:05:11', null, null, 'A01A03A01', '', '电气安装事业部', '1', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a8c1b50016', '2018-05-21 11:05:33', null, null, 'A01A03A02', '', '管道信息通信技术事业部', '2', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a8f2dd0017', '2018-05-21 11:05:45', null, null, 'A01A03A03', '', '国际事业部', '3', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a92a940018', '2018-05-21 11:06:00', null, null, 'A01A03A04', '', '通信工程事业部', '4', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a978010019', '2018-05-21 11:06:20', null, null, 'A01A03A05', '', '输电工程事业部', '5', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a9c5ba001a', '2018-05-21 11:06:39', null, null, 'A01A03A06', '', '卫星通信事业部', '6', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380a9f880001b', '2018-05-21 11:06:52', null, null, 'A01A03A07', '', '西北分公司', '7', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380aa65fc001c', '2018-05-21 11:07:20', null, null, 'A01A03A08', '', '技术创新中心(应急通信保障中心)', '8', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380aac08e001d', '2018-05-21 11:07:44', null, null, 'A01A03A09', '', '北京信息技术分公司(设计院)', '9', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380ab11e5001e', '2018-05-21 11:08:04', null, null, 'A01A03A10', '', '廊坊通信分公司', '10', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380ab5998001f', '2018-05-21 11:08:23', null, null, 'A01A03A11', '', '秦皇岛通信站', '11', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380abb1bc0020', '2018-05-21 11:08:45', null, null, 'A01A03A12', '', '北京通信站', '12', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380abf4b10021', '2018-05-21 11:09:03', null, null, 'A01A03A13', '', '德州通信站', '13', '402880e663809b1e016380a0cfc70004');
INSERT INTO `t_common_depart` VALUES ('402880e663809b1e016380ac4a8a0022', '2018-05-21 11:09:25', null, null, 'A01A03A14', '', '德州加油站管理中心', '14', '402880e663809b1e016380a0cfc70004');

-- ----------------------------
-- Table structure for t_common_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_common_menu`;
CREATE TABLE `t_common_menu` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `iframe_url` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `show_name` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `pater_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_menu
-- ----------------------------
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636ca14496000d', '2018-05-17 13:44:58', null, '2018-05-18 11:27:40', '/paper/rule/index', '', '试卷管理', '2', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636ca19bc5000e', '2018-05-17 13:45:20', null, '2018-05-18 11:30:10', '/test/testIndex?mode=1', '', '人工阅卷', '3', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636cb2d0d8000f', '2018-05-17 14:04:08', null, '2018-05-18 10:48:38', '/test/index', '', '考试安排', '4', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636cb321dc0010', '2018-05-17 14:04:29', null, '2018-05-18 11:28:14', '/test/paper/myTestIndex', '', '我的考试', '5', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636cb35eb80011', '2018-05-17 14:04:44', null, '2018-05-18 11:30:29', '/test/testIndex?mode=2', '', '成绩管理', '6', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636cb3b4af0012', '2018-05-17 14:05:06', null, '2018-05-25 10:23:57', '/document/topage', '', '上传管理', '3', '402880fa636bbb6d01636c9e81a30007');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c27d4290005', '2018-05-17 11:32:19', null, '2018-05-18 10:36:23', '', '', '系统管理', '6', '');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c2960120006', '2018-05-17 11:34:00', null, '2018-05-18 10:36:33', '', '', '考试管理', '2', '');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c9e81a30007', '2018-05-17 13:41:57', null, '2018-05-18 10:34:21', '', '', '知识库管理', '4', '');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c9eeea50008', '2018-05-17 13:42:25', null, '2018-05-18 10:34:12', '', '', '积分管理', '3', '');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c9fd7130009', '2018-05-17 13:43:24', null, '2018-05-18 10:52:04', '/user/index', '', '用户管理', '1', '402880fa636bbb6d01636c2437e10004');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636ca0892f000b', '2018-05-17 13:44:10', null, '2018-05-18 10:56:56', '/dictionary/type/index', '', '基础数据管理', '1', '402880fa636bbb6d01636c27d4290005');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636ca0efab000c', '2018-05-17 13:44:36', null, '2018-05-18 10:51:06', '/test/questions/index', '', '题库管理', '1', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636c2437e10004', '2018-05-17 11:28:23', null, '2018-05-18 10:34:29', '', '', '组织管理', '5', '');
INSERT INTO `t_common_menu` VALUES ('402880fa636bbb6d01636cb3ee2e0013', '2018-05-17 14:05:21', null, '2018-05-18 10:01:32', '/folder/topage', '', '知识库创建', '2', '402880fa636bbb6d01636c9e81a30007');
INSERT INTO `t_common_menu` VALUES ('402880f46371111101637114699a0000', '2018-05-18 10:29:13', null, '2018-05-18 10:31:25', '/integral/rule/index', '', '积分规则管理', '1', '402880fa636bbb6d01636c9eeea50008');
INSERT INTO `t_common_menu` VALUES ('402880fa6370d15901637108bece0001', '2018-05-18 10:16:28', null, null, '', '', '权限按钮管理', '3', '402880fa636bbb6d01636c27d4290005');
INSERT INTO `t_common_menu` VALUES ('402880fa6370d15901637107f3e70000', '2018-05-18 10:15:36', null, null, '/menu/toPage', '', '菜单管理', '2', '402880fa636bbb6d01636c27d4290005');
INSERT INTO `t_common_menu` VALUES ('402880f46371111101637116ee810001', '2018-05-18 10:31:58', null, null, '/user/integral/index', '', '积分管理', '2', '402880fa636bbb6d01636c9eeea50008');
INSERT INTO `t_common_menu` VALUES ('402880f46371111101637117b7340002', '2018-05-18 10:32:49', null, null, '', '', '培训管理', '1', '');
INSERT INTO `t_common_menu` VALUES ('402880f46371111101637119dc2b0003', '2018-05-18 10:35:10', null, null, '/exam/course/index', '', '课程管理', '1', '402880f46371111101637117b7340002');
INSERT INTO `t_common_menu` VALUES ('402880e663711dcb0163712f840b0000', '2018-05-18 10:58:49', null, null, '/depart/index', '', '部门管理', '2', '402880fa636bbb6d01636c2437e10004');
INSERT INTO `t_common_menu` VALUES ('402880e663711dcb01637130e58b0001', '2018-05-18 11:00:19', null, null, '/role/index', '', '角色管理', '3', '402880fa636bbb6d01636c2437e10004');
INSERT INTO `t_common_menu` VALUES ('40288281637224af01637256f91f0000', '2018-05-18 16:21:32', null, null, '/test/testIndex?mode=3', '', '监控管理', '7', '402880fa636bbb6d01636c2960120006');
INSERT INTO `t_common_menu` VALUES ('4028828163859d7e016386f56dfd0000', '2018-05-22 16:27:01', null, '2018-05-22 16:34:33', '', '', '个人角色管理', '7', '');
INSERT INTO `t_common_menu` VALUES ('4028828163859d7e016386fc83b80001', '2018-05-22 16:34:45', null, '2018-05-22 17:22:14', '/user/goMyCenterInfo', '', '个人中心', '1', '4028828163859d7e016386f56dfd0000');
INSERT INTO `t_common_menu` VALUES ('402880f4638fc9110163902933840000', '2018-05-24 11:20:09', null, null, '/exam/courseware/index', '', '课件管理', '2', '402880f46371111101637117b7340002');
INSERT INTO `t_common_menu` VALUES ('402880fa6394e9bc016394ebcbda0001', '2018-05-25 09:31:11', null, '2018-05-25 10:23:48', '/document/topagecommon', '', '知识库列表', '1', '402880fa636bbb6d01636c9e81a30007');

-- ----------------------------
-- Table structure for t_common_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `t_common_menu_button`;
CREATE TABLE `t_common_menu_button` (
  `id` varchar(255) NOT NULL,
  `button_id` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_menu_button
-- ----------------------------
INSERT INTO `t_common_menu_button` VALUES ('402880e66394cb6b016394f17f2b0007', '402880f1635c7d3601635c861dc40018', '402880fa6370d15901637108bece0001', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_menu_button` VALUES ('402880e66390b05b016390cf5f16002d', '402880f1635c7d3601635c861dc40016', '402880f4638fc9110163902933840000', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_menu_button` VALUES ('402880e66390b05b016390cf5f10002c', '402880f1635c7d3601635c861dc40015', '402880f4638fc9110163902933840000', '402880e6636809210163680de1da0002');

-- ----------------------------
-- Table structure for t_common_role
-- ----------------------------
DROP TABLE IF EXISTS `t_common_role`;
CREATE TABLE `t_common_role` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `show_name` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_role
-- ----------------------------
INSERT INTO `t_common_role` VALUES ('402880e6636809210163680d52550001', '2018-05-16 16:24:53', null, '2018-05-16 16:25:06', 'admin', '系统管理员', '1');
INSERT INTO `t_common_role` VALUES ('402880e6636809210163680de1da0002', '2018-05-16 16:25:30', null, '2018-05-21 15:38:27', 'rsbjl', '人事部经理', '2');
INSERT INTO `t_common_role` VALUES ('402880e6636809210163680e16d60003', '2018-05-16 16:25:43', null, '2018-05-21 15:38:43', 'dasgly', '档案室管理员', '3');
INSERT INTO `t_common_role` VALUES ('402880fa63a4b62d0163a5406349000e', '2018-05-28 13:37:30', null, null, 'zskAdmin', '知识库管理员', '4');

-- ----------------------------
-- Table structure for t_common_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_common_role_menu`;
CREATE TABLE `t_common_role_menu` (
  `id` varchar(255) NOT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_role_menu
-- ----------------------------
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dce0008', '402880fa6394e9bc016394ebcbda0001', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dc40006', '402880f46371111101637116ee810001', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77af003a', '4028828163859d7e016386fc83b80001', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77aa0039', '4028828163859d7e016386f56dfd0000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dc90007', '402880fa636bbb6d01636c9e81a30007', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77a40038', '402880fa6370d15901637108bece0001', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d779e0037', '402880fa6370d15901637107f3e70000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77980036', '402880fa636bbb6d01636ca0892f000b', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77930035', '402880fa636bbb6d01636c27d4290005', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d778e0034', '402880e663711dcb01637130e58b0001', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77870033', '402880e663711dcb0163712f840b0000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77830032', '402880fa636bbb6d01636c9fd7130009', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d777c0031', '402880fa636bbb6d01636c2437e10004', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77780030', '402880fa6394e9bc016394ebcbda0001', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d7771002f', '402880fa636bbb6d01636cb3ee2e0013', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d776d002e', '402880fa636bbb6d01636cb3b4af0012', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d7767002d', '402880fa636bbb6d01636c9e81a30007', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d7762002c', '402880f46371111101637116ee810001', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d775c002b', '402880f46371111101637114699a0000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d7757002a', '402880fa636bbb6d01636c9eeea50008', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77510029', '40288281637224af01637256f91f0000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77490028', '402880fa636bbb6d01636cb35eb80011', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77430027', '402880fa636bbb6d01636cb321dc0010', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d773c0026', '402880fa636bbb6d01636cb2d0d8000f', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77360025', '402880fa636bbb6d01636ca19bc5000e', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77300024', '402880fa636bbb6d01636ca14496000d', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d772a0023', '402880fa636bbb6d01636ca0efab000c', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77240022', '402880fa636bbb6d01636c2960120006', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d771e0021', '402880f4638fc9110163902933840000', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d77180020', '402880f46371111101637119dc2b0003', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38db00002', '402880f46371111101637117b7340002', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec4a0006', '402880fa6370d15901637108bece0001', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dbe0005', '402880f46371111101637114699a0000', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38db90004', '402880fa636bbb6d01636c9eeea50008', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38db40003', '402880f46371111101637119dc2b0003', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec440005', '402880fa636bbb6d01636c27d4290005', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec3d0004', '402880f46371111101637116ee810001', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec380003', '402880fa636bbb6d01636c9eeea50008', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec320002', '402880f4638fc9110163902933840000', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec2d0001', '402880f46371111101637119dc2b0003', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec1f0000', '402880f46371111101637117b7340002', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880fd6394f9250163950d7712001f', '402880f46371111101637117b7340002', '402880e6636809210163680d52550001');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec4f0007', '4028828163859d7e016386f56dfd0000', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880e663a456370163a462ec550008', '4028828163859d7e016386fc83b80001', '402880e6636809210163680de1da0002');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dd40009', '402880fa636bbb6d01636cb3ee2e0013', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dd9000a', '402880fa636bbb6d01636cb3b4af0012', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38dde000b', '4028828163859d7e016386f56dfd0000', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a4c38de4000c', '4028828163859d7e016386fc83b80001', '402880e6636809210163680e16d60003');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a540dd97000f', '402880fa636bbb6d01636c9e81a30007', '402880fa63a4b62d0163a5406349000e');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a540dd9d0010', '402880fa6394e9bc016394ebcbda0001', '402880fa63a4b62d0163a5406349000e');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a540dda20011', '402880fa636bbb6d01636cb3ee2e0013', '402880fa63a4b62d0163a5406349000e');
INSERT INTO `t_common_role_menu` VALUES ('402880fa63a4b62d0163a540dda80012', '402880fa636bbb6d01636cb3b4af0012', '402880fa63a4b62d0163a5406349000e');

-- ----------------------------
-- Table structure for t_common_user
-- ----------------------------
DROP TABLE IF EXISTS `t_common_user`;
CREATE TABLE `t_common_user` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userno` varchar(255) DEFAULT NULL,
  `depart_id` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3t3uhb8hsfue5n9oakniy76ty` (`username`),
  KEY `FKr6i06q3i8pkeqyf61seq5cku5` (`depart_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_user
-- ----------------------------
INSERT INTO `t_common_user` VALUES ('402880f46362f29c01636311fd190000', '2018-05-15 17:11:52', 'admin', '2018-05-23 16:13:14', 'b9d11b3be25f5a1a7dc8ca04cd310b28', '7e65b23d52fb41e4af99b18315eae545', '5a6dee207df74aa8a95287f47484f9d5', 'admin', 'U0001', '402880e663809b1e016380a2ac0b0005', '555555555', '20', '1', '40288281638fbb1f01638fd176bd0000', '系统管理员');
INSERT INTO `t_common_user` VALUES ('402880f463677ebe0163678510bc0000', '2018-05-16 13:56:03', 'admin', '2018-05-23 16:13:32', '52e2969c7c6afee005a6c2c0ea7416d5', '7e65b23d52fb41e4af99b18315eae545', '5a6dee207df74aa8a95287f47484f9d5', 'admin1', 'U0002', '402880e663809b1e016380a40dff0007', null, null, null, '402882816390ffc6016391533bae0018', '管理员');
INSERT INTO `t_common_user` VALUES ('402880f4638203f201638205ae650000', '2018-05-21 17:26:40', 'admin', '2018-05-23 16:13:48', 'c1cb843f3929978af615fe7dfbf532cb', '7e65b23d52fb41e4af99b18315eae545', '5a6dee207df74aa8a95287f47484f9d5', 'zhangsan', 'zhangsan', '402880e663809b1e016380a632ce000e', null, null, null, null, '张三');
INSERT INTO `t_common_user` VALUES ('402880f463856c6a0163858d62380000', '2018-05-22 09:53:45', 'admin', '2018-05-23 16:13:41', '597b9e94a97a9feb824cbe386c093afd', 'd275512389424b4793586a7783899929', '1b65a34127b04371b2e5478732bc3aea', 'lisi', 'lisi', '402880e663809b1e016380a632ce000e', null, null, null, '4028828163951b410163959d5c060000', '李四');
INSERT INTO `t_common_user` VALUES ('402880f4638c008e01638c023af50000', '2018-05-23 15:59:06', 'admin', '2018-05-28 14:22:54', '5a2e54ee57e5b7273b9a8fed78c1ebd8', 'd275512389424b4793586a7783899929', '5a6dee207df74aa8a95287f47484f9d5', 'test', 'test1', '402880e663809b1e016380a816cb0014', null, null, null, null, '测试');
INSERT INTO `t_common_user` VALUES ('402882816395eed00163962785500003', '2018-05-25 15:16:02', 'admin', '2018-05-25 15:32:27', '9aafadcae550ecc849af70a45ceb5d8d', '7e65b23d52fb41e4af99b18315eae545', '1b65a34127b04371b2e5478732bc3aea', 'gao', 'gao', '402880e663809b1e016380a632ce000e', '1234567', '25', '1', '402882816395eed00163962e2c7c0006', 'gao');
INSERT INTO `t_common_user` VALUES ('402880fa63965416016396707d41000b', '2018-05-25 16:35:44', 'admin', null, '91bef9f045f07a78da43ed6d84605b91', 'd275512389424b4793586a7783899929', '5a6dee207df74aa8a95287f47484f9d5', 'wangjie', '01', '402880e663809b1e016380a632ce000e', null, null, null, null, '王杰');
INSERT INTO `t_common_user` VALUES ('402882816395eed001639676c0790007', '2018-05-25 16:42:34', 'admin', null, '9299f4ca5d1ce05e3c5d166a8c04f043', 'd275512389424b4793586a7783899929', '5a6dee207df74aa8a95287f47484f9d5', 'wang', 'wang', '402880e663809b1e016380a632ce000e', null, null, null, null, '王');
INSERT INTO `t_common_user` VALUES ('402880fa63a4b62d0163a4bb4c370000', '2018-05-28 11:12:08', 'admin', '2018-05-28 17:25:36', '76e41551ca7485d94fe86bfa155d2cb5', '7e65b23d52fb41e4af99b18315eae545', '1b65a34127b04371b2e5478732bc3aea', 'zskcs', 'U003', '402880e663809b1e016380a2ac0b0005', null, null, null, null, '知识库测试');

-- ----------------------------
-- Table structure for t_common_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_common_user_role`;
CREATE TABLE `t_common_user_role` (
  `id` varchar(255) NOT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_common_user_role
-- ----------------------------
INSERT INTO `t_common_user_role` VALUES ('402882816395eed0016395fa9aef0001', '402880e6636809210163680d52550001', '402882816395eed0016395fa9a980000');
INSERT INTO `t_common_user_role` VALUES ('402880f4638ad4d501638ad7e57e0000', '402880e6636809210163680e16d60003', '402880f4638203f201638205ae650000');
INSERT INTO `t_common_user_role` VALUES ('402880f463a5544d0163a569f66d0000', '402880fa63a4b62d0163a5406349000e', '402880f4638c008e01638c023af50000');
INSERT INTO `t_common_user_role` VALUES ('402880f463868d890163868eee260003', '402880e6636809210163680e16d60003', '402880f463856c6a0163858d62380000');
INSERT INTO `t_common_user_role` VALUES ('402880f46386c6d1016386c772e50000', '402880e6636809210163680d52550001', '402880f46362f29c01636311fd190000');
INSERT INTO `t_common_user_role` VALUES ('402880f46386c6d1016386c7921e0001', '402880e6636809210163680d52550001', '402880f463677ebe0163678510bc0000');
INSERT INTO `t_common_user_role` VALUES ('402882816395eed001639627856e0004', '402880e6636809210163680d52550001', '402882816395eed00163962785500003');
INSERT INTO `t_common_user_role` VALUES ('402880fa63965416016396707d49000c', '402880e6636809210163680de1da0002', '402880fa63965416016396707d41000b');
INSERT INTO `t_common_user_role` VALUES ('402882816395eed001639676c08e0008', '402880e6636809210163680d52550001', '402882816395eed001639676c0790007');
INSERT INTO `t_common_user_role` VALUES ('402880fa63a565520163a56604b30000', '402880fa63a4b62d0163a5406349000e', '402880fa63a4b62d0163a4bb4c370000');

-- ----------------------------
-- Table structure for t_document_depart_folder
-- ----------------------------
DROP TABLE IF EXISTS `t_document_depart_folder`;
CREATE TABLE `t_document_depart_folder` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `depart_id` varchar(255) DEFAULT NULL,
  `folder_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_document_depart_folder
-- ----------------------------
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b0152d000a', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880ef634cb55601634e90dccb0019');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b015270009', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880ef634cb55601634e907df20018');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b015200008', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880ef634cb55601634db9ad98000e');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b0151a0007', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880ef634cb55601634db725be000d');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b015130006', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634cee94cc001c');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b0150c0005', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634cee5d94001b');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b015060004', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634ceda3ea001a');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b014ff0003', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634ced6ddd0019');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b014f80002', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634ced31560018');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b014f20001', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634ced07ba0017');
INSERT INTO `t_document_depart_folder` VALUES ('402880fd63a4ad7a0163a4b014d80000', '2018-05-28 10:59:53', null, null, '402880e663809b1e0163809f83750001', '402880f1634ce24901634ce9c06b000d');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f10d000c', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634ceaf6a80014');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f0fe000b', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634ceac2e30013');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f0f7000a', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634cea926c0012');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f0ef0009', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634cea6a7b0011');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f0e80008', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634ce9ea2f000e');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a610f0e20007', '2018-05-28 17:25:18', null, null, '402880e663809b1e016380a2ac0b0005', '402880f1634ce24901634ce9c06b000d');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b0780000', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634ce9c06b000d');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b0830001', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634ced07ba0017');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b0890002', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634ced31560018');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b08f0003', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634ced6ddd0019');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b0940004', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634ceda3ea001a');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b09a0005', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634cee5d94001b');
INSERT INTO `t_document_depart_folder` VALUES ('402880fa63a5eeaf0163a604b09f0006', '2018-05-28 17:11:55', null, null, '402880e663809b1e016380a376cb0006', '402880f1634ce24901634cee94cc001c');

-- ----------------------------
-- Table structure for t_document_document
-- ----------------------------
DROP TABLE IF EXISTS `t_document_document`;
CREATE TABLE `t_document_document` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `document_ioc` varchar(255) DEFAULT NULL,
  `document_size` varchar(255) DEFAULT NULL,
  `folder_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `suffix_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `obligate1` varchar(255) DEFAULT NULL,
  `obligate2` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `browse_count` varchar(255) DEFAULT NULL,
  `download_count` varchar(255) DEFAULT NULL,
  `pdf_url` varchar(255) DEFAULT NULL,
  `folder_code` varchar(255) DEFAULT NULL,
  `dictionary_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKop98dxbi879puqig94aq3jhkk` (`dictionary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_document_document
-- ----------------------------
INSERT INTO `t_document_document` VALUES ('402880f1635c7d3601635c861dc40000', '2018-05-14 10:41:23', null, null, null, 'word.png', '218KB', '402880f1634ce24901634ceac2e30013', '远程培训考试系统（管理端）.docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\shichangkaifahui1526003843793\\7c1a0b0a-9814-4f75-9bc9-1db7f5d6dc2c.docx', '远程培训考试系统（管理端）.docx', '1', null, '名：远程培训考试系统（管理端）.docx', null, '3', '1', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\shichangkaifahui1526003843793\\7c1a0b0a-9814-4f75-9bc9-1db7f5d6dc2c.pdf', 'A1B1C2D2', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634e260c01634e28e1d70000', '2018-05-11 15:44:52', null, null, null, 'word.png', '55KB', '402880f1634ce24901634cea3f3c0010', '111产品功能-4 .docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\eb954681-8124-428e-91a3-8658ea64609b.docx', '产品功能-4+(1).docx', '1', null, '产品功能-4+(1).docx', null, '6', '0', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\eb954681-8124-428e-91a3-8658ea64609b.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634e03cf01634e0c501b0000', '2018-05-11 15:13:39', null, null, null, 'word.png', '3.69MB', '402880f1634ce24901634cea3f3c0010', '产品功能-1(2).docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\45d39b56-4103-44ac-ba24-ebaa02976cf3.docx', '产品功能-1(2).docx', '1', null, '：产品功能-1(2).docx', null, '9', '0', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\45d39b56-4103-44ac-ba24-ebaa02976cf3.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634de32701634de4a9310000', '2018-05-11 14:30:21', null, null, null, 'PPT.png', '1.29MB', '402880f1634ce24901634cea3f3c0010', '昆仑杰信产品研发规划20171022(1).pptx', 'pptx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\48338c3e-e87d-422d-a85e-d69e4a505d81.pptx', '昆仑杰信产品研发规划20171022(1).pptx', '1', null, '昆仑杰信产品研发规划20171022(1).pptxv', null, '4', '0', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\48338c3e-e87d-422d-a85e-d69e4a505d81.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634d021801634db6db740005', '2018-05-11 13:40:19', null, null, null, 'other.png', '20KB', '402880f1634ce24901634cea3f3c0010', 'viewer.html', 'html', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\5f64af7c-d295-4dd3-ac83-113698ad71b4.html', '', '1', null, '', null, '4', '7', null, 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634d021801634d3f080d0004', '2018-05-11 11:29:26', null, null, null, 'audio.png', '3.66MB', '402880f1634ce24901634cea3f3c0010', '本兮 - 一个深爱的女孩.mp3', 'mp3', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\6822b760-2cb8-47c6-b212-27ae169c7325.mp3', null, '1', null, null, null, '10', '2', null, 'A1B1C1D1', '3e0e0f9b41574bc59d381be29a9ecb71');
INSERT INTO `t_document_document` VALUES ('402880f1634d021801634d36a4db0003', '2018-05-11 11:20:16', null, null, null, 'video.png', '130KB', '402880f1634ce24901634cea3f3c0010', 'kuaishipin_tail_9_16.mp4', 'mp4', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\21a7787c-f00f-4118-9e37-03c9bf2ce349.mp4', '21312', '1', null, '3213', null, '2', '0', null, 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634d021801634d3275340002', '2018-05-11 11:15:42', null, null, null, 'video.png', '69.3MB', '402880f1634ce24901634cea3f3c0010', '天才也性感 .mp4', 'mp4', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\448d0ba9-6385-4048-9376-6cdbf5eb6cac.mp4', 'the big bang theory s01e17 chi eng hdrip 624x352 yyets人人影视', '1', null, 'the big bang theory s01e17 chi eng hdrip 624x352 yyets人人影视', null, '5', '0', null, 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f1634d021801634d0a5ff80001', '2018-05-11 10:31:55', null, null, null, 'video.png', '145.29MB', '402880f1634ce24901634cea3f3c0010', '原型模式.mp4', 'mp4', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\ba21525f-63eb-4c2a-b888-99646654351f.mp4', '原型模式.mp4', '1', null, '原型模式.mp4', null, '3', '0', null, 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa638bba0501638bbc4dfe0000', '2018-05-23 14:42:43', null, null, null, 'word.png', '568KB', '402880f1634ce24901634ceb74390016', '安全监督测试222.docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\shichangkehuxinxi1526003878760\\zhongyaoshichangkehuxinxi1526003889193\\707e1400-b3fc-442f-9986-0ae7234a709e.docx', '23213', '1', null, '23123', null, '1', '0', '/gongsi11526003777635\\bangongshi1526003788321\\shichangkehuxinxi1526003878760\\zhongyaoshichangkehuxinxi1526003889193\\707e1400-b3fc-442f-9986-0ae7234a709e.pdf', 'A1B1C3D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa638bbfc701638bc08b350000', '2018-05-23 14:47:21', 'admin', null, null, 'other.png', '86KB', '402880f1634ce24901634cea926c0012', '2.jpg', 'jpg', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\zhidaihui1526003831385\\b280ab4b-a5cb-48f1-a5b3-269060525324.jpg', '23', '1', null, '321', null, '0', '0', null, 'A1B1C2D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('40288281638fbb1f01638fd176bd0000', '2018-05-25 12:44:07', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\admin.jpg', null, '2', null, null, null, '0', '0', null, 'admin', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402882816390ffc6016391533bae0018', '2018-05-24 16:45:41', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\admin1.jpg', null, '2', null, null, null, '0', '0', null, 'admin1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa63910ee6016391112be70000', '2018-05-24 15:33:31', 'admin', null, null, 'other.png', '41KB', '402880f1634ce24901634cea926c0012', '1.jpg', 'jpg', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\zhidaihui1526003831385\\cfddece9-da66-4c60-a6d5-a222f6b8497d.jpg', '111', '1', null, '萨芬萨芬', null, '0', '0', null, 'A1B1C2D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa6391159d0163911edc580000', '2018-05-24 15:48:28', 'admin', null, null, 'word.png', '123KB', '402880f1634ce24901634cea3f3c0010', '代码注释规范.docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\5f6c53e3-d018-420a-bda6-6ddd025dbab6.docx', '代码注释规范.docx', '1', null, '代码注释规范.docx', null, '1', '0', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\5f6c53e3-d018-420a-bda6-6ddd025dbab6.pdf', 'A1B1C1D1', '3e0e0f9b41574bc59d381be29a9ecb71');
INSERT INTO `t_document_document` VALUES ('402882816390ffc60163911ea5040017', '2018-05-24 15:48:14', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\test.jpg', null, '2', null, null, null, '0', '0', null, 'test', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('4028828163951b410163959d5c060000', '2018-05-25 12:48:24', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\lisi.jpg', null, '2', null, null, null, '0', '0', null, 'lisi', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402882816395eed001639615a23c0002', '2018-05-25 14:56:30', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\admin.jpg', null, '2', null, null, null, '0', '0', null, 'admin', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402882816395eed001639629681d0005', '2018-05-25 15:18:06', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\gao.jpg', null, '2', null, null, null, '0', '0', null, 'gao', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402882816395eed00163962e2c7c0006', '2018-05-25 15:23:18', null, null, null, 'other.png', '42KB', ' ', '69c730a16522e68386c84dc80c32b0c7_85bOOOPICa5.jpg', 'jpg', '\\gao.jpg', null, '2', null, null, null, '0', '0', null, 'gao', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f4639631020163963589250004', '2018-05-25 15:31:20', 'admin', null, null, 'word.png', '12KB', null, '4.docx', 'docx', '\\6c8e4780-a54d-427f-8099-60e573254b99.docx', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f4639631020163963589240003', '2018-05-25 15:31:20', 'admin', null, null, 'word.png', '13KB', null, '5.docx', 'docx', '\\9ef3b50d-c5b4-4bcd-a9ed-f19a5f213230.docx', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f46396310201639635892a0005', '2018-05-25 15:31:21', 'admin', null, null, 'other.png', '57KB', null, '4.xml', 'xml', '\\e774456d-b092-4afd-8a33-2cbfbf38c1b2.xml', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f4639635e80163963781ae0002', '2018-05-25 15:33:30', 'admin', null, null, 'other.png', '32KB', null, 'timg (1).jpg', 'jpg', '\\47403b8f-df13-42c6-af31-6e3d4a8cb6d1.jpg', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880f4639635e80163963781ba0003', '2018-05-25 15:33:30', 'admin', null, null, 'other.png', '31KB', null, 'timg.jpg', 'jpg', '\\3f614d20-9573-412a-9fd7-1d3bb9bb5d47.jpg', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa63965416016396556bea0001', '2018-05-25 16:06:10', 'admin', null, null, 'word.png', '21KB', null, '周报_胡明辉_20180415.doc', 'doc', '\\dc991a70-f60d-4fc8-a87f-f984ae95e90d.doc', null, '3', null, null, null, '0', '0', null, null, '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa6396541601639664f11f0006', '2018-05-25 16:23:07', 'admin', null, null, 'excel.png', '22KB', '402880f1634ce24901634cea926c0012', '加班时间.xls', 'xls', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\zhidaihui1526003831385\\4890b935-802b-4626-904c-514144ea1bf3.xls', '214124', '1', null, '124214', null, '0', '0', null, 'A1B1C2D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa6396541601639664f1210007', '2018-05-25 16:23:07', 'admin', null, null, 'word.png', '12KB', '402880f1634ce24901634ceac2e30013', '胡明辉调休申请(20180130).docx', 'docx', '/gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\shichangkaifahui1526003843793\\066ece4a-1c2c-4f20-8ea3-93afc4dbd27d.docx', '远程培训考试系统（管理端）.docx', '1', null, 'qrwq', null, '0', '0', null, 'A1B1C2D2', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa6396541601639664f1240008', '2018-05-25 16:23:07', 'admin', null, null, 'word.png', '21KB', '402880f1634ce24901634cea3f3c0010', '周报_胡明辉_20180415.doc', 'doc', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\f230e1ef-a7ec-47cc-8a19-deba4d4aced7.doc', '4214', '1', null, '4444', null, '1', '0', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\f230e1ef-a7ec-47cc-8a19-deba4d4aced7.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa6396541601639665aa190009', '2018-05-25 16:23:55', 'admin', null, null, 'excel.png', '12KB', '402880f1634ce24901634cea3f3c0010', '安全监督系统功能梳理进度9月11日.xlsx', 'xlsx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\a4bd0e6c-47b5-4bd4-b58f-e399a3946c2b.xlsx', '4325325', '1', null, '532535', null, '3', '1', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\a4bd0e6c-47b5-4bd4-b58f-e399a3946c2b.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa63965416016396686f43000a', '2018-05-25 16:26:56', 'admin', null, null, 'excel.png', '83KB', '402880f1634ce24901634cea3f3c0010', '知识管理明细（9.14）.xls', 'xls', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\8d1f1632-2338-4c67-8305-a22359755690.xls', 'rewtewt', '1', null, 'tewtwet', null, '2', '1', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\8d1f1632-2338-4c67-8305-a22359755690.pdf', 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');
INSERT INTO `t_document_document` VALUES ('402880fa63a4b62d0163a4d4f2cc000d', '2018-05-28 11:40:09', 'zskcs', null, null, 'excel.png', '17KB', '402880f1634ce24901634cea3f3c0010', '原知识库项目最新需求0413.xlsx', 'xlsx', '/gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072\\f039029b-241b-4086-a452-9ecf90de82fe.xlsx', '原知识库项目最新需求0413.xlsx', '1', null, '11111', null, '0', '0', null, 'A1B1C1D1', '229cf5b24c8e40f2b7f8099ad213e23f');

-- ----------------------------
-- Table structure for t_document_folder
-- ----------------------------
DROP TABLE IF EXISTS `t_document_folder`;
CREATE TABLE `t_document_folder` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `folder_ioc` varchar(255) DEFAULT NULL,
  `folder_name` varchar(255) DEFAULT NULL,
  `paterfolder_id` varchar(255) DEFAULT NULL,
  `show_name` varchar(255) DEFAULT NULL,
  `foder_url` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `paterfolder_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_document_folder
-- ----------------------------
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ce9c06b000d', '2018-05-11 09:56:17', null, '2018-05-11 09:56:17', 'A1', null, 'gongsi11526003777635', '', '公司1', 'gongsi11526003777635', '', '', null);
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ce9ea2f000e', '2018-05-11 09:56:28', null, '2018-05-11 09:56:28', 'A1B1', null, 'bangongshi1526003788321', '402880f1634ce24901634ce9c06b000d', '办公室', 'gongsi11526003777635\\bangongshi1526003788321', '', '', 'A1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cea12a5000f', '2018-05-11 09:56:38', null, '2018-05-11 09:56:38', 'A1B1C1', null, 'gongzuozongjie1526003798677', '402880f1634ce24901634ce9ea2f000e', '工作总结', 'gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677', '', '', 'A1B1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cea3f3c0010', '2018-05-11 09:56:50', null, '2018-05-11 09:56:50', 'A1B1C1D1', null, 'gongsigebumenniandugongzuozongjie1526003810072', '402880f1634ce24901634cea12a5000f', '公司各部门年度工作总结', 'gongsi11526003777635\\bangongshi1526003788321\\gongzuozongjie1526003798677\\gongsigebumenniandugongzuozongjie1526003810072', '', '', 'A1B1C1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cea6a7b0011', '2018-05-11 09:57:01', null, '2018-05-11 09:57:01', 'A1B1C2', null, 'huiyiziliao1526003821161', '402880f1634ce24901634ce9ea2f000e', '会议资料', 'gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161', '', '', 'A1B1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cea926c0012', '2018-05-11 09:57:11', null, '2018-05-11 09:57:11', 'A1B1C2D1', null, 'zhidaihui1526003831385', '402880f1634ce24901634cea6a7b0011', '职代会', 'gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\zhidaihui1526003831385', '', '', 'A1B1C2');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ceac2e30013', '2018-05-11 09:57:23', null, '2018-05-11 09:57:23', 'A1B1C2D2', null, 'shichangkaifahui1526003843793', '402880f1634ce24901634cea6a7b0011', '市场开发会', 'gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\shichangkaifahui1526003843793', '', '', 'A1B1C2');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ceaf6a80014', '2018-05-11 09:57:37', null, '2018-05-11 09:57:37', 'A1B1C2D3', null, 'jingyingfenxihui1526003857040', '402880f1634ce24901634cea6a7b0011', '经营分析会', 'gongsi11526003777635\\bangongshi1526003788321\\huiyiziliao1526003821161\\jingyingfenxihui1526003857040', '', '', 'A1B1C2');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ceb4b790015', '2018-05-11 09:57:58', null, '2018-05-11 09:57:58', 'A1B1C3', null, 'shichangkehuxinxi1526003878760', '402880f1634ce24901634ce9ea2f000e', '市场客户信息', 'gongsi11526003777635\\bangongshi1526003788321\\shichangkehuxinxi1526003878760', '', '', 'A1B1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ceb74390016', '2018-05-11 09:58:09', null, '2018-05-11 09:58:09', 'A1B1C3D1', null, 'zhongyaoshichangkehuxinxi1526003889193', '402880f1634ce24901634ceb4b790015', '重要市场客户信息', 'gongsi11526003777635\\bangongshi1526003788321\\shichangkehuxinxi1526003878760\\zhongyaoshichangkehuxinxi1526003889193', '', '', 'A1B1C3');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ced07ba0017', '2018-05-11 09:59:52', null, '2018-05-11 09:59:52', 'A1B2', null, 'renshibu1526003992487', '402880f1634ce24901634ce9c06b000d', '人事部', 'gongsi11526003777635\\renshibu1526003992487', '', '', 'A1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ced31560018', '2018-05-11 10:00:03', null, '2018-05-11 10:00:03', 'A1B2C1', null, 'peixun1526004003128', '402880f1634ce24901634ced07ba0017', '培训', 'gongsi11526003777635\\renshibu1526003992487\\peixun1526004003128', '', '', 'A1B2');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ced6ddd0019', '2018-05-11 10:00:18', null, '2018-05-11 10:00:18', 'A1B2C1D1', null, 'gongsizuzhigexiangpeixunkejian1526004018562', '402880f1634ce24901634ced31560018', '公司组织各项培训课件', 'gongsi11526003777635\\renshibu1526003992487\\peixun1526004003128\\gongsizuzhigexiangpeixunkejian1526004018562', '', '', 'A1B2C1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634ceda3ea001a', '2018-05-11 10:00:32', null, '2018-05-11 10:00:32', 'A1B2C1D2', null, 'peixunzongjie1526004032473', '402880f1634ce24901634ced31560018', '培训总结', 'gongsi11526003777635\\renshibu1526003992487\\peixun1526004003128\\peixunzongjie1526004032473', '', '', 'A1B2C1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cee5d94001b', '2018-05-11 10:01:20', null, '2018-05-11 10:01:20', 'A1B2C1D3', null, 'peixunzhidu1526004080002', '402880f1634ce24901634ced31560018', '培训制度', 'gongsi11526003777635\\renshibu1526003992487\\peixun1526004003128\\peixunzhidu1526004080002', '', '', 'A1B2C1');
INSERT INTO `t_document_folder` VALUES ('402880f1634ce24901634cee94cc001c', '2018-05-11 10:01:34', null, '2018-05-11 10:01:34', 'A1B2C1D4', null, 'peixunjihua1526004094123', '402880f1634ce24901634ced31560018', '培训计划', 'gongsi11526003777635\\renshibu1526003992487\\peixun1526004003128\\peixunjihua1526004094123', '', '', 'A1B2C1');
INSERT INTO `t_document_folder` VALUES ('402880ef634cb55601634db725be000d', '2018-05-11 13:40:38', null, '2018-05-11 13:40:38', 'A2', null, 'gongsi21526017238376', '', '公司2', 'gongsi21526017238376', '5', '刚发的苟富贵', '');
INSERT INTO `t_document_folder` VALUES ('402880ef634cb55601634db9ad98000e', '2018-05-11 13:43:24', null, '2018-05-11 13:43:24', 'A2B1', null, 'ceshi1526017404289', '402880ef634cb55601634db725be000d', '测试', 'gongsi21526017238376\\ceshi1526017404289', '1', '第三代', 'A2');
INSERT INTO `t_document_folder` VALUES ('402880ef634cb55601634e907df20018', '2018-05-11 17:38:02', null, '2018-05-11 17:38:02', 'A3', null, 'gongsi31526031482338', '', '公司3', 'gongsi31526031482338', '4', '', '');
INSERT INTO `t_document_folder` VALUES ('402880fd63a5c1ed0163a61400f90008', '2018-05-28 17:28:38', 'admin', '2018-05-28 17:28:38', 'A3B2', null, 'ceshi1527499718878', '402880ef634cb55601634e907df20018', '测试', 'gongsi31526031482338\\ceshi1527499718878', '1', '带你们发郭德纲', 'A3');
INSERT INTO `t_document_folder` VALUES ('402880fd63a5c1ed0163a60ef50e0007', '2018-05-28 17:23:08', 'admin', '2018-05-28 17:23:07', 'A3B1', null, 'ceshi1527499388097', '402880ef634cb55601634e907df20018', '测试', 'gongsi31526031482338\\ceshi1527499388097', '1', '带你们发郭德纲', 'A3');

-- ----------------------------
-- Table structure for t_document_leavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `t_document_leavingmessage`;
CREATE TABLE `t_document_leavingmessage` (
  `id` varchar(255) NOT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `creTim` varchar(255) DEFAULT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `msg_content` varchar(255) DEFAULT NULL,
  `leaving_message_id` varchar(255) DEFAULT NULL,
  `cre_tim` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3wiiekxygy4piq6duagwl4k8i` (`leaving_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_document_leavingmessage
-- ----------------------------
INSERT INTO `t_document_leavingmessage` VALUES ('402880ef62d801920162d8181f000011', '2018-04-18 17:31:22', '讽德诵', null, '2018-04-18 17:31:22', '402880f1635c7d3601635c861dc40000', '3333333333333', null, '2018-04-18 17:31:22');
INSERT INTO `t_document_leavingmessage` VALUES ('402880ef62dc71720162dc725f300000', '2018-04-19 13:48:25', '法大纲', null, '2018-04-30 13:48:25', '', '非给他如同000008w37twrghdvhsfdnbjsdgfsjdbbvszj东方既白说就收到货后是点击和大家公告时间九分裤大街上可分为但是关键是货到付款我还刚开始看回访', '402880ef62d801920162d8181f000011', '2018-04-19 13:48:25');
INSERT INTO `t_document_leavingmessage` VALUES ('402880ef62dc71720162dc725f3010', '2018-04-26 11:08:25', '丰东股份', null, '2018-04-26 11:08:25', null, 'huihui', '402880ef62d801920162d8181f000011', '2018-04-26 11:08:25');
INSERT INTO `t_document_leavingmessage` VALUES ('402880ef62d801920162d8181f00', '2018-05-16 09:08:25', '第三方', '', '', '402880f1635c7d3601635c861dc40000', '发光飞碟测试测试测试测试测试', '', '2018-05-16 09:08:25');
INSERT INTO `t_document_leavingmessage` VALUES ('402880ef62d801920162d8181f11', '2018-04-13 09:58:25', '粉底乳', '', '', '402880f1635c7d3601635c861dc40000', '丰东股份和公积金策策策策策策策策策策策策策策策策', '', '2018-04-13 09:58:25');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bf93ad90000', '2018-05-23 15:49:16', null, null, null, null, 'utru6ruytjr ', '402880ef62d801920162d8181f00', '2018-05-23 15:49:16');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bf966d40001', '2018-05-23 15:49:27', null, null, null, null, '部分规划的投入人', '402880ef62d801920162d8181f00', '2018-05-23 15:49:27');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bf98b5c0002', '2018-05-23 15:49:37', null, null, null, '402880f1635c7d3601635c861dc40000', 'thjtue艾尔我放入摄影退', null, '2018-05-23 15:49:37');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bf9b5930003', '2018-05-23 15:49:48', null, null, null, '402880f1635c7d3601635c861dc40000', 'reyu76i89ii粉底搜狗地图', null, '2018-05-23 15:49:48');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bf9e00b0004', '2018-05-23 15:49:58', null, null, null, '402880f1635c7d3601635c861dc40000', '有人太多复核人五人', null, '2018-05-23 15:49:58');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bfa1c2b0005', '2018-05-23 15:50:14', null, null, null, null, '个梵蒂冈', '402880fd638bf6a101638bf9e00b0004', '2018-05-23 15:50:14');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd638bf6a101638bfa2a520006', '2018-05-23 15:50:17', null, null, null, null, '丰东股份好久好久', '402880fd638bf6a101638bf9e00b0004', '2018-05-23 15:50:17');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd6394f92501639518cb34003b', '2018-05-25 10:20:20', null, null, null, '402880f1634e260c01634e28e1d70000', '法人违反工人房  ', null, '2018-05-25 10:20:20');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fa6395cffd016395ea9cee0000', '2018-05-25 14:09:30', null, null, null, '402880f1635c7d3601635c861dc40000', '飞洒发生', null, '2018-05-25 14:09:30');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd63960aad0163960b6fc60000', '2018-05-25 14:45:21', 'admin', null, null, null, '广济药业接口', '402880fa6395cffd016395ea9cee0000', '2018-05-25 14:45:21');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd639617b60163961d2af10000', '2018-05-25 15:04:44', 'admin', null, null, null, '大股东有', '402880fa6395cffd016395ea9cee0000', '2018-05-25 15:04:44');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fd639630330163963e06bf0000', '2018-05-25 15:40:37', 'admin', null, null, null, 'oi', '402880fa6395cffd016395ea9cee0000', '2018-05-25 15:40:37');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fa639654160163966288de0004', '2018-05-25 16:20:30', 'admin', null, null, null, '111', '402880fd6394f92501639518cb34003b', '2018-05-25 16:20:30');
INSERT INTO `t_document_leavingmessage` VALUES ('402880fa6396541601639663ea2f0005', '2018-05-25 16:22:00', 'admin', null, null, '402880f1635c7d3601635c861dc40000', '111', null, '2018-05-25 16:22:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_integral
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral` (
  `id` varchar(32) NOT NULL COMMENT '主键,uuid',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id(uuid，关联用户表id)',
  `integral_rule_id` varchar(32) DEFAULT NULL COMMENT '积分规则id(uuid,关联积分规则表id)',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id(uuid,关联用户表id)',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id(uuid,关联用户表id)',
  PRIMARY KEY (`id`),
  KEY `FK48bffacqc4f9vfgk7qev1y6fu` (`integral_rule_id`),
  CONSTRAINT `FK48bffacqc4f9vfgk7qev1y6fu` FOREIGN KEY (`integral_rule_id`) REFERENCES `integral_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES ('402880e663a57c970163a5e6fcbc0001', '402880f4638c008e01638c023af50000', '402880f46367f9b30163680662310001', null, '2018-05-28 16:39:22', null, 'admin', null);

-- ----------------------------
-- View structure for vw_level
-- ----------------------------
DROP VIEW IF EXISTS `vw_level`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `vw_level` AS SELECT
	t.count as each_level_count,
t.id as level_id,
t.`level` as level,
t1.each_score,
t1.rule_course,
t1.rule_id,
t1.rule_name,
t1.rule_type,
t1.total_points,
t1.type,
t1.type_id
FROM
	exam_rule_type_level t
LEFT JOIN vw_rule_type t1 ON t.exam_rule_type_id = t1.type_id ;

-- ----------------------------
-- View structure for vw_rule_type
-- ----------------------------
DROP VIEW IF EXISTS `vw_rule_type`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER  VIEW `vw_rule_type` AS SELECT
	t.id as type_id,
t.score as each_score,
t.type as type,
t.count as each_type_count,
t1.id as rule_id,
  t1.course AS rule_course,
	t1.`name` AS rule_name,
	t1.total_points AS total_points,
	t1.type AS rule_type
FROM
	exam_paper_rule_type t
LEFT JOIN exam_paper_rule t1 ON t1.id = t.paper_rule_id ;
