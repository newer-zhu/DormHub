/*
 Navicat Premium Data Transfer

 Source Server         : mysqlmy
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : pets

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 07/01/2023 17:53:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for p_announcement
-- ----------------------------
DROP TABLE IF EXISTS `p_announcement`;
CREATE TABLE `p_announcement`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_time` datetime NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布用户名',
  `confirm` int NULL DEFAULT 0 COMMENT '确认人数',
  `del_flag` tinyint NULL DEFAULT 0,
  `del_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_announcement
-- ----------------------------
INSERT INTO `p_announcement` VALUES (3, '2222', '<p><u>222222222</u></p>', '2022-02-08 20:43:47', 1, '大老师', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (4, '3333', '<p>3333333</p>', '2022-02-08 20:47:11', 2, '大老师', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (5, '4444', '<blockquote>44444666</blockquote>', '2022-03-11 22:19:51', 3, '大老师', 0, 1, NULL);
INSERT INTO `p_announcement` VALUES (6, '5555', '<p>5555555</p>', '2022-02-24 19:19:24', 1, '大老师', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (7, '222', '<p><img src=\"https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/announcement/2022-02-24/7bc19ca6-1043-4f1d-922b-330dd920db1f.png\"></p><p><strong>22222222222</strong></p>', '2022-02-24 21:19:24', 1, '大老师', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (8, 'hahahah', '<p>aaaaaaaaaaaaaaa哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈aa</p>', '2022-02-24 21:25:41', 1, '大老师', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (9, '疫情防控', '<ol><li>注意卫生</li><li>不准出门</li><li>好好学习</li></ol>', '2022-03-25 00:50:49', 1, '王二', 0, 0, NULL);
INSERT INTO `p_announcement` VALUES (10, '封校结束', '<p>结束了哈哈哈</p><p><br></p><p><br></p><p><br></p><p><br></p><blockquote>再见了</blockquote>', '2022-05-06 13:11:57', 1, '王二', 0, 0, NULL);

-- ----------------------------
-- Table structure for p_bed
-- ----------------------------
DROP TABLE IF EXISTS `p_bed`;
CREATE TABLE `p_bed`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dorm_id` int NULL DEFAULT NULL COMMENT '宿舍号',
  `bed_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `status` int NULL DEFAULT 0 COMMENT '0空 1满',
  `user_id` int NULL DEFAULT -1 COMMENT '住宿用户',
  `version` int NULL DEFAULT 1 COMMENT '版本号 用于乐观锁',
  `is_bunk` tinyint NULL DEFAULT 0 COMMENT '是否是上下铺',
  `level` tinyint NULL DEFAULT NULL COMMENT '1上铺 2下铺',
  `position` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_bed
-- ----------------------------
INSERT INTO `p_bed` VALUES (1, 1, '1', 1, 1, 9, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2, 1, '2', 1, 2, 6, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (3, 1, '3', 1, 3, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (4, 1, '4', 1, 4, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (116, 2, '1', 0, -1, 5, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (117, 2, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (118, 2, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (119, 2, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (120, 3, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (121, 3, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (122, 3, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (123, 3, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (124, 4, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (125, 4, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (126, 4, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (127, 4, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (128, 5, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (129, 5, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (130, 5, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (131, 5, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (132, 6, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (133, 6, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (134, 6, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (135, 6, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (136, 7, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (137, 7, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (138, 7, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (139, 7, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (140, 8, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (141, 8, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (142, 8, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (143, 8, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (144, 9, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (145, 9, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (146, 9, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (147, 9, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (148, 10, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (149, 10, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (150, 10, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (151, 10, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (152, 11, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (153, 11, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (154, 11, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (155, 11, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (156, 12, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (157, 12, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (158, 12, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (159, 12, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (160, 13, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (161, 13, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (162, 13, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (163, 13, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (164, 14, '1', 0, -1, 2, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (165, 14, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (166, 14, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (167, 14, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (168, 15, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (169, 15, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (170, 15, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (171, 15, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (172, 16, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (173, 16, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (174, 16, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (175, 16, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (176, 17, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (177, 17, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (178, 17, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (179, 17, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (180, 18, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (181, 18, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (182, 18, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (183, 18, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (184, 19, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (185, 19, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (186, 19, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (187, 19, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (188, 20, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (189, 20, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (190, 20, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (191, 20, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (192, 21, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (193, 21, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (194, 21, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (195, 21, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (196, 22, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (197, 22, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (198, 22, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (199, 22, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (200, 23, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (201, 23, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (202, 23, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (203, 23, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (204, 24, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (205, 24, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (206, 24, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (207, 24, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (208, 25, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (209, 25, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (210, 25, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (211, 25, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (212, 26, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (213, 26, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (214, 26, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (215, 26, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (216, 27, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (217, 27, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (218, 27, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (219, 27, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (220, 28, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (221, 28, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (222, 28, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (223, 28, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (224, 29, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (225, 29, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (226, 29, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (227, 29, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (228, 30, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (229, 30, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (230, 30, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (231, 30, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (232, 31, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (233, 31, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (234, 31, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (235, 31, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (236, 32, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (237, 32, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (238, 32, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (239, 32, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (240, 33, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (241, 33, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (242, 33, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (243, 33, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (244, 34, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (245, 34, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (246, 34, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (247, 34, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (248, 35, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (249, 35, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (250, 35, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (251, 35, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (252, 36, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (253, 36, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (254, 36, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (255, 36, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (256, 37, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (257, 37, '2', 0, -1, 3, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (258, 37, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (259, 37, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (260, 38, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (261, 38, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (262, 38, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (263, 38, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (264, 39, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (265, 39, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (266, 39, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (267, 39, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (268, 40, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (269, 40, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (270, 40, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (271, 40, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (272, 41, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (273, 41, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (274, 41, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (275, 41, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (276, 42, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (277, 42, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (278, 42, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (279, 42, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (280, 43, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (281, 43, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (282, 43, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (283, 43, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (284, 44, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (285, 44, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (286, 44, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (287, 44, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (288, 45, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (289, 45, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (290, 45, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (291, 45, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (292, 46, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (293, 46, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (294, 46, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (295, 46, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (296, 47, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (297, 47, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (298, 47, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (299, 47, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (300, 48, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (301, 48, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (302, 48, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (303, 48, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (304, 49, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (305, 49, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (306, 49, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (307, 49, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (308, 50, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (309, 50, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (310, 50, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (311, 50, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (312, 51, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (313, 51, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (314, 51, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (315, 51, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (316, 52, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (317, 52, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (318, 52, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (319, 52, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (320, 53, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (321, 53, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (322, 53, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (323, 53, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (324, 54, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (325, 54, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (326, 54, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (327, 54, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (328, 55, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (329, 55, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (330, 55, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (331, 55, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (332, 56, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (333, 56, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (334, 56, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (335, 56, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (336, 57, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (337, 57, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (338, 57, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (339, 57, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (340, 58, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (341, 58, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (342, 58, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (343, 58, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (344, 59, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (345, 59, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (346, 59, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (347, 59, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (348, 60, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (349, 60, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (350, 60, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (351, 60, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (352, 61, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (353, 61, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (354, 61, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (355, 61, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (356, 62, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (357, 62, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (358, 62, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (359, 62, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (360, 63, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (361, 63, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (362, 63, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (363, 63, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (364, 64, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (365, 64, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (366, 64, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (367, 64, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (368, 65, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (369, 65, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (370, 65, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (371, 65, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (372, 66, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (373, 66, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (374, 66, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (375, 66, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (376, 67, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (377, 67, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (378, 67, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (379, 67, '4', 0, -1, 3, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (380, 68, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (381, 68, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (382, 68, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (383, 68, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (384, 69, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (385, 69, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (386, 69, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (387, 69, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (388, 70, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (389, 70, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (390, 70, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (391, 70, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (392, 71, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (393, 71, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (394, 71, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (395, 71, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (396, 72, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (397, 72, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (398, 72, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (399, 72, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (400, 73, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (401, 73, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (402, 73, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (403, 73, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (404, 74, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (405, 74, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (406, 74, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (407, 74, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (408, 75, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (409, 75, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (410, 75, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (411, 75, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (412, 76, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (413, 76, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (414, 76, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (415, 76, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (416, 77, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (417, 77, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (418, 77, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (419, 77, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (420, 78, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (421, 78, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (422, 78, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (423, 78, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (424, 79, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (425, 79, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (426, 79, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (427, 79, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (428, 80, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (429, 80, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (430, 80, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (431, 80, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (432, 81, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (433, 81, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (434, 81, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (435, 81, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (436, 82, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (437, 82, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (438, 82, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (439, 82, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (440, 83, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (441, 83, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (442, 83, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (443, 83, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (444, 84, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (445, 84, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (446, 84, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (447, 84, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (448, 85, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (449, 85, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (450, 85, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (451, 85, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (452, 86, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (453, 86, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (454, 86, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (455, 86, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (456, 87, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (457, 87, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (458, 87, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (459, 87, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (460, 88, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (461, 88, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (462, 88, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (463, 88, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (464, 89, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (465, 89, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (466, 89, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (467, 89, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (468, 90, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (469, 90, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (470, 90, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (471, 90, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (472, 91, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (473, 91, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (474, 91, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (475, 91, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (476, 92, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (477, 92, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (478, 92, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (479, 92, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (480, 93, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (481, 93, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (482, 93, '3', 0, -1, 3, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (483, 93, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (484, 94, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (485, 94, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (486, 94, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (487, 94, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (488, 95, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (489, 95, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (490, 95, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (491, 95, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (492, 96, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (493, 96, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (494, 96, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (495, 96, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (496, 97, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (497, 97, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (498, 97, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (499, 97, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (500, 98, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (501, 98, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (502, 98, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (503, 98, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (504, 99, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (505, 99, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (506, 99, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (507, 99, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (508, 100, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (509, 100, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (510, 100, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (511, 100, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (512, 101, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (513, 101, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (514, 101, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (515, 101, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (516, 102, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (517, 102, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (518, 102, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (519, 102, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (520, 103, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (521, 103, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (522, 103, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (523, 103, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (524, 104, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (525, 104, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (526, 104, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (527, 104, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (528, 105, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (529, 105, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (530, 105, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (531, 105, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (532, 106, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (533, 106, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (534, 106, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (535, 106, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (536, 107, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (537, 107, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (538, 107, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (539, 107, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (540, 108, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (541, 108, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (542, 108, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (543, 108, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (545, 110, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (546, 110, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (547, 110, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (548, 110, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (549, 110, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (550, 110, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (551, 111, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (552, 111, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (553, 111, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (554, 111, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (555, 111, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (556, 111, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (557, 112, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (558, 112, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (559, 112, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (560, 112, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (561, 112, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (562, 112, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (563, 113, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (564, 113, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (565, 113, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (566, 113, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (567, 113, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (568, 113, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (569, 114, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (570, 114, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (571, 114, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (572, 114, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (573, 114, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (574, 114, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (575, 115, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (576, 115, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (577, 115, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (578, 115, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (579, 115, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (580, 115, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (581, 116, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (582, 116, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (583, 116, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (584, 116, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (585, 116, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (586, 116, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (587, 117, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (588, 117, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (589, 117, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (590, 117, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (591, 117, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (592, 117, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (593, 118, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (594, 118, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (595, 118, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (596, 118, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (597, 118, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (598, 118, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (599, 119, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (600, 119, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (601, 119, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (602, 119, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (603, 119, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (604, 119, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (605, 120, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (606, 120, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (607, 120, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (608, 120, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (609, 120, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (610, 120, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (611, 121, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (612, 121, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (613, 121, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (614, 121, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (615, 121, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (616, 121, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (617, 122, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (618, 122, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (619, 122, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (620, 122, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (621, 122, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (622, 122, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (623, 123, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (624, 123, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (625, 123, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (626, 123, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (627, 123, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (628, 123, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (629, 124, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (630, 124, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (631, 124, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (632, 124, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (633, 124, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (634, 124, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (635, 125, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (636, 125, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (637, 125, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (638, 125, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (639, 125, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (640, 125, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (641, 126, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (642, 126, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (643, 126, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (644, 126, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (645, 126, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (646, 126, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (647, 127, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (648, 127, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (649, 127, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (650, 127, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (651, 127, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (652, 127, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (653, 128, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (654, 128, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (655, 128, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (656, 128, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (657, 128, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (658, 128, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (659, 129, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (660, 129, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (661, 129, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (662, 129, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (663, 129, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (664, 129, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (665, 130, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (666, 130, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (667, 130, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (668, 130, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (669, 130, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (670, 130, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (671, 131, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (672, 131, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (673, 131, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (674, 131, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (675, 131, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (676, 131, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (677, 132, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (678, 132, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (679, 132, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (680, 132, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (681, 132, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (682, 132, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (683, 133, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (684, 133, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (685, 133, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (686, 133, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (687, 133, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (688, 133, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (689, 134, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (690, 134, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (691, 134, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (692, 134, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (693, 134, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (694, 134, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (695, 135, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (696, 135, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (697, 135, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (698, 135, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (699, 135, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (700, 135, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (701, 136, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (702, 136, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (703, 136, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (704, 136, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (705, 136, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (706, 136, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (707, 137, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (708, 137, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (709, 137, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (710, 137, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (711, 137, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (712, 137, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (713, 138, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (714, 138, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (715, 138, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (716, 138, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (717, 138, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (718, 138, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (719, 139, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (720, 139, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (721, 139, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (722, 139, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (723, 139, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (724, 139, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (725, 140, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (726, 140, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (727, 140, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (728, 140, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (729, 140, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (730, 140, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (731, 141, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (732, 141, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (733, 141, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (734, 141, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (735, 141, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (736, 141, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (737, 142, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (738, 142, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (739, 142, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (740, 142, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (741, 142, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (742, 142, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (743, 143, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (744, 143, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (745, 143, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (746, 143, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (747, 143, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (748, 143, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (749, 144, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (750, 144, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (751, 144, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (752, 144, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (753, 144, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (754, 144, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (755, 145, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (756, 145, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (757, 145, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (758, 145, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (759, 145, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (760, 145, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (761, 146, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (762, 146, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (763, 146, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (764, 146, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (765, 146, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (766, 146, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (767, 147, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (768, 147, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (769, 147, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (770, 147, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (771, 147, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (772, 147, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (773, 148, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (774, 148, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (775, 148, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (776, 148, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (777, 148, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (778, 148, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (779, 149, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (780, 149, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (781, 149, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (782, 149, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (783, 149, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (784, 149, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (785, 150, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (786, 150, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (787, 150, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (788, 150, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (789, 150, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (790, 150, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (791, 151, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (792, 151, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (793, 151, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (794, 151, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (795, 151, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (796, 151, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (797, 152, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (798, 152, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (799, 152, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (800, 152, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (801, 152, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (802, 152, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (803, 153, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (804, 153, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (805, 153, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (806, 153, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (807, 153, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (808, 153, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (809, 154, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (810, 154, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (811, 154, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (812, 154, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (813, 154, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (814, 154, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (815, 155, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (816, 155, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (817, 155, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (818, 155, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (819, 155, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (820, 155, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (821, 156, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (822, 156, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (823, 156, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (824, 156, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (825, 156, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (826, 156, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (827, 157, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (828, 157, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (829, 157, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (830, 157, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (831, 157, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (832, 157, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (833, 158, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (834, 158, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (835, 158, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (836, 158, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (837, 158, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (838, 158, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (839, 159, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (840, 159, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (841, 159, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (842, 159, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (843, 159, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (844, 159, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (845, 160, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (846, 160, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (847, 160, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (848, 160, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (849, 160, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (850, 160, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (851, 161, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (852, 161, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (853, 161, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (854, 161, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (855, 161, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (856, 161, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (857, 162, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (858, 162, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (859, 162, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (860, 162, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (861, 162, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (862, 162, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (863, 163, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (864, 163, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (865, 163, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (866, 163, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (867, 163, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (868, 163, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (869, 164, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (870, 164, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (871, 164, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (872, 164, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (873, 164, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (874, 164, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (875, 165, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (876, 165, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (877, 165, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (878, 165, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (879, 165, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (880, 165, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (881, 166, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (882, 166, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (883, 166, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (884, 166, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (885, 166, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (886, 166, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (887, 167, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (888, 167, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (889, 167, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (890, 167, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (891, 167, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (892, 167, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (893, 168, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (894, 168, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (895, 168, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (896, 168, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (897, 168, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (898, 168, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (899, 169, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (900, 169, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (901, 169, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (902, 169, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (903, 169, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (904, 169, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (905, 170, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (906, 170, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (907, 170, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (908, 170, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (909, 170, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (910, 170, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (911, 171, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (912, 171, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (913, 171, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (914, 171, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (915, 171, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (916, 171, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (917, 172, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (918, 172, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (919, 172, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (920, 172, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (921, 172, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (922, 172, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (923, 173, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (924, 173, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (925, 173, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (926, 173, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (927, 173, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (928, 173, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (929, 174, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (930, 174, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (931, 174, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (932, 174, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (933, 174, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (934, 174, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (935, 175, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (936, 175, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (937, 175, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (938, 175, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (939, 175, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (940, 175, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (941, 176, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (942, 176, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (943, 176, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (944, 176, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (945, 176, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (946, 176, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (947, 177, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (948, 177, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (949, 177, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (950, 177, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (951, 177, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (952, 177, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (953, 178, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (954, 178, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (955, 178, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (956, 178, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (957, 178, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (958, 178, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (959, 179, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (960, 179, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (961, 179, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (962, 179, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (963, 179, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (964, 179, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (965, 180, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (966, 180, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (967, 180, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (968, 180, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (969, 180, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (970, 180, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (971, 181, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (972, 181, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (973, 181, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (974, 181, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (975, 181, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (976, 181, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (977, 182, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (978, 182, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (979, 182, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (980, 182, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (981, 182, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (982, 182, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (983, 183, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (984, 183, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (985, 183, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (986, 183, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (987, 183, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (988, 183, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (989, 184, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (990, 184, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (991, 184, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (992, 184, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (993, 184, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (994, 184, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (995, 185, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (996, 185, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (997, 185, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (998, 185, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (999, 185, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1000, 185, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1001, 186, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1002, 186, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1003, 186, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1004, 186, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1005, 186, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1006, 186, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1007, 187, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1008, 187, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1009, 187, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1010, 187, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1011, 187, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1012, 187, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1013, 188, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1014, 188, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1015, 188, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1016, 188, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1017, 188, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1018, 188, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1019, 189, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1020, 189, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1021, 189, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1022, 189, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1023, 189, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1024, 189, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1025, 190, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1026, 190, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1027, 190, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1028, 190, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1029, 190, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1030, 190, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1031, 191, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1032, 191, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1033, 191, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1034, 191, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1035, 191, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1036, 191, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1037, 192, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1038, 192, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1039, 192, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1040, 192, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1041, 192, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1042, 192, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1043, 193, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1044, 193, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1045, 193, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1046, 193, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1047, 193, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1048, 193, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1049, 194, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1050, 194, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1051, 194, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1052, 194, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1053, 194, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1054, 194, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1055, 195, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1056, 195, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1057, 195, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1058, 195, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1059, 195, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1060, 195, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1061, 196, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1062, 196, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1063, 196, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1064, 196, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1065, 196, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1066, 196, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1067, 197, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1068, 197, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1069, 197, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1070, 197, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1071, 197, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1072, 197, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1073, 198, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1074, 198, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1075, 198, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1076, 198, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1077, 198, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1078, 198, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1079, 199, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1080, 199, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1081, 199, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1082, 199, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1083, 199, '5', 0, -1, 1, 0, NULL, 'l');
INSERT INTO `p_bed` VALUES (1084, 199, '6', 0, -1, 1, 0, NULL, 'r');
INSERT INTO `p_bed` VALUES (1446, 200, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1447, 200, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1448, 200, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1449, 200, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1450, 201, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1451, 201, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1452, 201, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1453, 201, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1454, 202, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1455, 202, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1456, 202, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1457, 202, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1458, 203, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1459, 203, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1460, 203, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1461, 203, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1462, 204, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1463, 204, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1464, 204, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1465, 204, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1466, 205, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1467, 205, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1468, 205, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1469, 205, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1470, 206, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1471, 206, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1472, 206, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1473, 206, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1474, 207, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1475, 207, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1476, 207, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1477, 207, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1478, 208, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1479, 208, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1480, 208, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1481, 208, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1482, 209, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1483, 209, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1484, 209, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1485, 209, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1486, 210, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1487, 210, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1488, 210, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1489, 210, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1490, 211, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1491, 211, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1492, 211, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1493, 211, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1494, 212, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1495, 212, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1496, 212, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1497, 212, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1498, 213, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1499, 213, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1500, 213, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1501, 213, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1502, 214, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1503, 214, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1504, 214, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1505, 214, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1506, 215, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1507, 215, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1508, 215, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1509, 215, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1510, 216, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1511, 216, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1512, 216, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1513, 216, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1514, 217, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1515, 217, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1516, 217, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1517, 217, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1518, 218, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1519, 218, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1520, 218, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1521, 218, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1522, 219, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1523, 219, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1524, 219, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1525, 219, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1526, 220, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1527, 220, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1528, 220, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1529, 220, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1530, 221, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1531, 221, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1532, 221, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1533, 221, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1534, 222, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1535, 222, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1536, 222, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1537, 222, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1538, 223, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1539, 223, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1540, 223, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1541, 223, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1542, 224, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1543, 224, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1544, 224, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1545, 224, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1546, 225, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1547, 225, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1548, 225, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1549, 225, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1550, 226, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1551, 226, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1552, 226, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1553, 226, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1554, 227, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1555, 227, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1556, 227, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1557, 227, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1558, 228, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1559, 228, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1560, 228, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1561, 228, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1562, 229, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1563, 229, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1564, 229, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1565, 229, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1566, 230, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1567, 230, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1568, 230, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1569, 230, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1570, 231, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1571, 231, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1572, 231, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1573, 231, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1574, 232, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1575, 232, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1576, 232, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1577, 232, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1578, 233, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1579, 233, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1580, 233, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1581, 233, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1582, 234, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1583, 234, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1584, 234, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1585, 234, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1586, 235, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1587, 235, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1588, 235, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1589, 235, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1590, 236, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1591, 236, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1592, 236, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1593, 236, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1594, 237, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1595, 237, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1596, 237, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1597, 237, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1598, 238, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1599, 238, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1600, 238, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1601, 238, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1602, 239, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1603, 239, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1604, 239, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1605, 239, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1606, 240, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1607, 240, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1608, 240, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1609, 240, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1610, 241, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1611, 241, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1612, 241, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1613, 241, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1614, 242, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1615, 242, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1616, 242, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1617, 242, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1618, 243, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1619, 243, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1620, 243, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1621, 243, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1622, 244, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1623, 244, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1624, 244, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1625, 244, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1626, 245, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1627, 245, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1628, 245, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1629, 245, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1630, 246, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1631, 246, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1632, 246, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1633, 246, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1634, 247, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1635, 247, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1636, 247, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1637, 247, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1638, 248, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1639, 248, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1640, 248, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1641, 248, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1642, 249, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1643, 249, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1644, 249, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1645, 249, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1646, 250, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1647, 250, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1648, 250, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1649, 250, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1650, 251, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1651, 251, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1652, 251, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1653, 251, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1654, 252, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1655, 252, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1656, 252, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1657, 252, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1658, 253, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1659, 253, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1660, 253, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1661, 253, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1662, 254, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1663, 254, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1664, 254, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1665, 254, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1666, 255, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1667, 255, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1668, 255, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1669, 255, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1670, 256, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1671, 256, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1672, 256, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1673, 256, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1674, 257, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1675, 257, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1676, 257, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1677, 257, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1678, 258, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1679, 258, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1680, 258, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1681, 258, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1682, 259, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1683, 259, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1684, 259, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1685, 259, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1686, 260, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1687, 260, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1688, 260, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1689, 260, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1690, 261, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1691, 261, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1692, 261, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1693, 261, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1694, 262, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1695, 262, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1696, 262, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1697, 262, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1698, 263, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1699, 263, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1700, 263, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1701, 263, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1702, 264, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1703, 264, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1704, 264, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1705, 264, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1706, 265, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1707, 265, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1708, 265, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1709, 265, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1710, 266, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1711, 266, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1712, 266, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1713, 266, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1714, 267, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1715, 267, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1716, 267, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1717, 267, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1718, 268, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1719, 268, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1720, 268, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1721, 268, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1722, 269, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1723, 269, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1724, 269, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1725, 269, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1726, 270, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1727, 270, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1728, 270, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1729, 270, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1730, 271, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1731, 271, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1732, 271, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1733, 271, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1734, 272, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1735, 272, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1736, 272, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1737, 272, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1738, 273, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1739, 273, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1740, 273, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1741, 273, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1742, 274, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1743, 274, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1744, 274, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1745, 274, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1746, 275, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1747, 275, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1748, 275, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1749, 275, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1750, 276, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1751, 276, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1752, 276, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1753, 276, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1754, 277, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1755, 277, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1756, 277, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1757, 277, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1758, 278, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1759, 278, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1760, 278, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1761, 278, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1762, 279, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1763, 279, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1764, 279, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1765, 279, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1766, 280, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1767, 280, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1768, 280, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1769, 280, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1770, 281, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1771, 281, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1772, 281, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1773, 281, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1774, 282, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1775, 282, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1776, 282, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1777, 282, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1778, 283, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1779, 283, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1780, 283, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1781, 283, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1782, 284, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1783, 284, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1784, 284, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1785, 284, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1786, 285, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1787, 285, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1788, 285, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1789, 285, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1790, 286, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1791, 286, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1792, 286, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1793, 286, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1794, 287, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1795, 287, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1796, 287, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1797, 287, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1798, 288, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1799, 288, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1800, 288, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1801, 288, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (1802, 289, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (1803, 289, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (1804, 289, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (1805, 289, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2140, 290, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2141, 290, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2142, 290, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2143, 290, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2144, 291, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2145, 291, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2146, 291, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2147, 291, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2148, 292, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2149, 292, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2150, 292, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2151, 292, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2152, 293, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2153, 293, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2154, 293, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2155, 293, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2156, 294, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2157, 294, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2158, 294, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2159, 294, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2160, 295, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2161, 295, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2162, 295, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2163, 295, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2164, 296, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2165, 296, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2166, 296, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2167, 296, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2168, 297, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2169, 297, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2170, 297, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2171, 297, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2172, 298, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2173, 298, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2174, 298, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2175, 298, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2176, 299, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2177, 299, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2178, 299, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2179, 299, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2180, 300, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2181, 300, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2182, 300, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2183, 300, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2184, 301, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2185, 301, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2186, 301, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2187, 301, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2188, 302, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2189, 302, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2190, 302, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2191, 302, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2192, 303, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2193, 303, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2194, 303, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2195, 303, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2196, 304, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2197, 304, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2198, 304, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2199, 304, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2200, 305, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2201, 305, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2202, 305, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2203, 305, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2204, 306, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2205, 306, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2206, 306, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2207, 306, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2208, 307, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2209, 307, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2210, 307, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2211, 307, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2212, 308, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2213, 308, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2214, 308, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2215, 308, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2216, 309, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2217, 309, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2218, 309, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2219, 309, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2220, 310, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2221, 310, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2222, 310, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2223, 310, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2224, 311, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2225, 311, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2226, 311, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2227, 311, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2228, 312, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2229, 312, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2230, 312, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2231, 312, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2232, 313, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2233, 313, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2234, 313, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2235, 313, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2236, 314, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2237, 314, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2238, 314, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2239, 314, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2240, 315, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2241, 315, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2242, 315, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2243, 315, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2244, 316, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2245, 316, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2246, 316, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2247, 316, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2248, 317, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2249, 317, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2250, 317, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2251, 317, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2252, 318, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2253, 318, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2254, 318, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2255, 318, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2256, 319, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2257, 319, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2258, 319, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2259, 319, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2260, 320, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2261, 320, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2262, 320, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2263, 320, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2264, 321, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2265, 321, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2266, 321, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2267, 321, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2268, 322, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2269, 322, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2270, 322, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2271, 322, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2272, 323, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2273, 323, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2274, 323, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2275, 323, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2276, 324, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2277, 324, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2278, 324, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2279, 324, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2280, 325, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2281, 325, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2282, 325, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2283, 325, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2284, 326, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2285, 326, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2286, 326, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2287, 326, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2288, 327, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2289, 327, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2290, 327, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2291, 327, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2292, 328, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2293, 328, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2294, 328, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2295, 328, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2296, 329, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2297, 329, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2298, 329, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2299, 329, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2300, 330, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2301, 330, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2302, 330, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2303, 330, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2304, 331, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2305, 331, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2306, 331, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2307, 331, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2308, 332, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2309, 332, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2310, 332, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2311, 332, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2312, 333, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2313, 333, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2314, 333, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2315, 333, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2316, 334, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2317, 334, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2318, 334, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2319, 334, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2320, 335, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2321, 335, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2322, 335, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2323, 335, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2324, 336, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2325, 336, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2326, 336, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2327, 336, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2328, 337, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2329, 337, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2330, 337, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2331, 337, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2332, 338, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2333, 338, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2334, 338, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2335, 338, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2336, 339, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2337, 339, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2338, 339, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2339, 339, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2340, 340, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2341, 340, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2342, 340, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2343, 340, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2344, 341, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2345, 341, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2346, 341, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2347, 341, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2348, 342, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2349, 342, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2350, 342, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2351, 342, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2352, 343, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2353, 343, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2354, 343, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2355, 343, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2356, 344, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2357, 344, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2358, 344, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2359, 344, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2360, 345, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2361, 345, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2362, 345, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2363, 345, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2364, 346, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2365, 346, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2366, 346, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2367, 346, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2368, 347, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2369, 347, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2370, 347, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2371, 347, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2372, 348, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2373, 348, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2374, 348, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2375, 348, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2376, 349, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2377, 349, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2378, 349, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2379, 349, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2380, 350, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2381, 350, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2382, 350, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2383, 350, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2384, 351, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2385, 351, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2386, 351, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2387, 351, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2388, 352, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2389, 352, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2390, 352, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2391, 352, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2392, 353, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2393, 353, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2394, 353, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2395, 353, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2396, 354, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2397, 354, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2398, 354, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2399, 354, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2400, 355, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2401, 355, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2402, 355, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2403, 355, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2404, 356, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2405, 356, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2406, 356, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2407, 356, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2408, 357, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2409, 357, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2410, 357, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2411, 357, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2412, 358, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2413, 358, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2414, 358, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2415, 358, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2416, 359, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2417, 359, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2418, 359, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2419, 359, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2420, 360, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2421, 360, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2422, 360, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2423, 360, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2424, 361, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2425, 361, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2426, 361, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2427, 361, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2428, 362, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2429, 362, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2430, 362, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2431, 362, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2432, 363, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2433, 363, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2434, 363, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2435, 363, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2436, 364, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2437, 364, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2438, 364, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2439, 364, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2440, 365, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2441, 365, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2442, 365, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2443, 365, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2444, 366, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2445, 366, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2446, 366, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2447, 366, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2448, 367, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2449, 367, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2450, 367, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2451, 367, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2452, 368, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2453, 368, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2454, 368, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2455, 368, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2456, 369, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2457, 369, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2458, 369, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2459, 369, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2460, 370, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2461, 370, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2462, 370, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2463, 370, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2464, 371, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2465, 371, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2466, 371, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2467, 371, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2468, 372, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2469, 372, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2470, 372, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2471, 372, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2472, 373, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2473, 373, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2474, 373, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2475, 373, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2476, 374, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2477, 374, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2478, 374, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2479, 374, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2480, 375, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2481, 375, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2482, 375, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2483, 375, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2484, 376, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2485, 376, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2486, 376, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2487, 376, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2488, 377, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2489, 377, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2490, 377, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2491, 377, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2492, 378, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2493, 378, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2494, 378, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2495, 378, '4', 0, -1, 1, 0, NULL, 'rd');
INSERT INTO `p_bed` VALUES (2496, 379, '1', 0, -1, 1, 0, NULL, 'ld');
INSERT INTO `p_bed` VALUES (2497, 379, '2', 0, -1, 1, 0, NULL, 'lu');
INSERT INTO `p_bed` VALUES (2498, 379, '3', 0, -1, 1, 0, NULL, 'ru');
INSERT INTO `p_bed` VALUES (2499, 379, '4', 0, -1, 1, 0, NULL, 'rd');

-- ----------------------------
-- Table structure for p_check_log
-- ----------------------------
DROP TABLE IF EXISTS `p_check_log`;
CREATE TABLE `p_check_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_score` int NULL DEFAULT NULL COMMENT '总分',
  `check_time` date NULL DEFAULT NULL COMMENT '检查时间',
  `target_dorm` int NULL DEFAULT NULL COMMENT '打分寝室',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `check_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查人员',
  `rank` int NULL DEFAULT NULL COMMENT '排名',
  `total` int NULL DEFAULT NULL COMMENT '本期检查总数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_check_log
-- ----------------------------
INSERT INTO `p_check_log` VALUES (3, 45, '2021-09-08', 1, '', '3190112108', 1, NULL);
INSERT INTO `p_check_log` VALUES (8, 60, '2021-11-26', 2, '', '3190112108', 1, NULL);
INSERT INTO `p_check_log` VALUES (9, 60, '2021-12-05', 1, '', '3190112108', 1, NULL);
INSERT INTO `p_check_log` VALUES (10, 60, '2022-01-25', 1, '', '3190112108', 1, NULL);
INSERT INTO `p_check_log` VALUES (11, 61, '2022-03-05', 1, '一般般啦', 'admin', 3, NULL);
INSERT INTO `p_check_log` VALUES (12, 58, '2022-03-05', 2, '不及格', 'admin', 5, NULL);
INSERT INTO `p_check_log` VALUES (13, 63, '2022-03-05', 3, '', 'admin', 2, NULL);
INSERT INTO `p_check_log` VALUES (14, 81, '2022-03-05', 12, '', 'admin', 1, NULL);
INSERT INTO `p_check_log` VALUES (15, 60, '2022-03-05', 14, '', 'admin', 4, NULL);

-- ----------------------------
-- Table structure for p_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `p_checkitem`;
CREATE TABLE `p_checkitem`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检查项',
  `score` int NOT NULL COMMENT '每项分数',
  `parent_item` int NOT NULL DEFAULT -1 COMMENT '父检查项',
  `enabled` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用',
  `version` int NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_checkitem
-- ----------------------------
INSERT INTO `p_checkitem` VALUES (1, '地面', 20, -1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (2, '墙壁', 20, -1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (3, '床铺', 20, -1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (4, '氛围', 20, -1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (5, '家具', 20, -1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (6, '墙壁是否有破损和乱涂乱画', 15, 2, 1, NULL);
INSERT INTO `p_checkitem` VALUES (7, '垃圾桶是否未被清空', 5, 1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (8, '地面是否有污渍和垃圾散落', 5, 1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (9, '桌椅是否有破损', 10, 5, 1, NULL);
INSERT INTO `p_checkitem` VALUES (10, '环境是否吵闹', 5, 4, 1, NULL);
INSERT INTO `p_checkitem` VALUES (11, '学生是否在玩游戏', 10, 4, 1, NULL);
INSERT INTO `p_checkitem` VALUES (12, '铺床情况', 10, 3, 1, NULL);
INSERT INTO `p_checkitem` VALUES (13, '扫帚拖把等摆放情况', 5, 1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (14, '瓷砖或木板地面是否有破损', 5, 1, 1, NULL);
INSERT INTO `p_checkitem` VALUES (15, '床上是否有电器排查等危险设备', 10, 3, 1, NULL);
INSERT INTO `p_checkitem` VALUES (16, '墙壁是否留有海报胶水', 5, 2, 1, NULL);
INSERT INTO `p_checkitem` VALUES (17, '寝室人员是否到齐', 5, 4, 1, NULL);
INSERT INTO `p_checkitem` VALUES (18, '是否缺少了一些公共家具', 10, 5, 1, NULL);

-- ----------------------------
-- Table structure for p_checkitem_log
-- ----------------------------
DROP TABLE IF EXISTS `p_checkitem_log`;
CREATE TABLE `p_checkitem_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL COMMENT '检查项',
  `score` int NULL DEFAULT NULL COMMENT '得分',
  `parent_item` int NULL DEFAULT NULL COMMENT '父检查项',
  `check_log` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_checkitem_log
-- ----------------------------
INSERT INTO `p_checkitem_log` VALUES (1, 6, 3, 2, 3);
INSERT INTO `p_checkitem_log` VALUES (2, 7, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (3, 8, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (4, 9, 12, 5, 3);
INSERT INTO `p_checkitem_log` VALUES (5, 10, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (6, 11, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (7, 12, 12, 3, 3);
INSERT INTO `p_checkitem_log` VALUES (8, 6, 3, 2, 3);
INSERT INTO `p_checkitem_log` VALUES (9, 7, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (10, 8, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (11, 9, 12, 5, 3);
INSERT INTO `p_checkitem_log` VALUES (12, 10, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (13, 11, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (14, 12, 12, 3, 3);
INSERT INTO `p_checkitem_log` VALUES (15, 6, 3, 2, 3);
INSERT INTO `p_checkitem_log` VALUES (16, 7, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (17, 8, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (18, 9, 12, 5, 3);
INSERT INTO `p_checkitem_log` VALUES (19, 10, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (20, 11, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (21, 12, 12, 3, 3);
INSERT INTO `p_checkitem_log` VALUES (22, 6, 3, 2, 3);
INSERT INTO `p_checkitem_log` VALUES (23, 7, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (24, 8, 3, 1, 3);
INSERT INTO `p_checkitem_log` VALUES (25, 9, 12, 5, 3);
INSERT INTO `p_checkitem_log` VALUES (26, 10, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (27, 11, 6, 4, 3);
INSERT INTO `p_checkitem_log` VALUES (28, 12, 12, 3, 3);
INSERT INTO `p_checkitem_log` VALUES (81, 6, 9, 2, 8);
INSERT INTO `p_checkitem_log` VALUES (82, 16, 3, 2, 8);
INSERT INTO `p_checkitem_log` VALUES (83, 7, 3, 1, 8);
INSERT INTO `p_checkitem_log` VALUES (84, 8, 3, 1, 8);
INSERT INTO `p_checkitem_log` VALUES (85, 13, 3, 1, 8);
INSERT INTO `p_checkitem_log` VALUES (86, 14, 3, 1, 8);
INSERT INTO `p_checkitem_log` VALUES (87, 9, 6, 5, 8);
INSERT INTO `p_checkitem_log` VALUES (88, 18, 6, 5, 8);
INSERT INTO `p_checkitem_log` VALUES (89, 10, 3, 4, 8);
INSERT INTO `p_checkitem_log` VALUES (90, 11, 6, 4, 8);
INSERT INTO `p_checkitem_log` VALUES (91, 17, 3, 4, 8);
INSERT INTO `p_checkitem_log` VALUES (92, 12, 6, 3, 8);
INSERT INTO `p_checkitem_log` VALUES (93, 15, 6, 3, 8);
INSERT INTO `p_checkitem_log` VALUES (94, 6, 9, 2, 9);
INSERT INTO `p_checkitem_log` VALUES (95, 16, 3, 2, 9);
INSERT INTO `p_checkitem_log` VALUES (96, 7, 3, 1, 9);
INSERT INTO `p_checkitem_log` VALUES (97, 8, 3, 1, 9);
INSERT INTO `p_checkitem_log` VALUES (98, 13, 3, 1, 9);
INSERT INTO `p_checkitem_log` VALUES (99, 14, 3, 1, 9);
INSERT INTO `p_checkitem_log` VALUES (100, 9, 6, 5, 9);
INSERT INTO `p_checkitem_log` VALUES (101, 18, 6, 5, 9);
INSERT INTO `p_checkitem_log` VALUES (102, 10, 3, 4, 9);
INSERT INTO `p_checkitem_log` VALUES (103, 11, 6, 4, 9);
INSERT INTO `p_checkitem_log` VALUES (104, 17, 3, 4, 9);
INSERT INTO `p_checkitem_log` VALUES (105, 12, 6, 3, 9);
INSERT INTO `p_checkitem_log` VALUES (106, 15, 6, 3, 9);
INSERT INTO `p_checkitem_log` VALUES (107, 14, 3, 1, 10);
INSERT INTO `p_checkitem_log` VALUES (108, 13, 3, 1, 10);
INSERT INTO `p_checkitem_log` VALUES (109, 8, 3, 1, 10);
INSERT INTO `p_checkitem_log` VALUES (110, 7, 3, 1, 10);
INSERT INTO `p_checkitem_log` VALUES (111, 16, 3, 2, 10);
INSERT INTO `p_checkitem_log` VALUES (112, 6, 9, 2, 10);
INSERT INTO `p_checkitem_log` VALUES (113, 15, 6, 3, 10);
INSERT INTO `p_checkitem_log` VALUES (114, 12, 6, 3, 10);
INSERT INTO `p_checkitem_log` VALUES (115, 17, 3, 4, 10);
INSERT INTO `p_checkitem_log` VALUES (116, 11, 6, 4, 10);
INSERT INTO `p_checkitem_log` VALUES (117, 10, 3, 4, 10);
INSERT INTO `p_checkitem_log` VALUES (118, 18, 6, 5, 10);
INSERT INTO `p_checkitem_log` VALUES (119, 9, 6, 5, 10);
INSERT INTO `p_checkitem_log` VALUES (120, 6, 12, 2, 11);
INSERT INTO `p_checkitem_log` VALUES (121, 16, 2, 2, 11);
INSERT INTO `p_checkitem_log` VALUES (122, 7, 3, 1, 11);
INSERT INTO `p_checkitem_log` VALUES (123, 8, 3, 1, 11);
INSERT INTO `p_checkitem_log` VALUES (124, 13, 3, 1, 11);
INSERT INTO `p_checkitem_log` VALUES (125, 14, 3, 1, 11);
INSERT INTO `p_checkitem_log` VALUES (126, 9, 6, 5, 11);
INSERT INTO `p_checkitem_log` VALUES (127, 18, 6, 5, 11);
INSERT INTO `p_checkitem_log` VALUES (128, 10, 2, 4, 11);
INSERT INTO `p_checkitem_log` VALUES (129, 11, 5, 4, 11);
INSERT INTO `p_checkitem_log` VALUES (130, 17, 5, 4, 11);
INSERT INTO `p_checkitem_log` VALUES (131, 12, 8, 3, 11);
INSERT INTO `p_checkitem_log` VALUES (132, 15, 3, 3, 11);
INSERT INTO `p_checkitem_log` VALUES (133, 6, 9, 2, 12);
INSERT INTO `p_checkitem_log` VALUES (134, 16, 3, 2, 12);
INSERT INTO `p_checkitem_log` VALUES (135, 7, 4, 1, 12);
INSERT INTO `p_checkitem_log` VALUES (136, 8, 2, 1, 12);
INSERT INTO `p_checkitem_log` VALUES (137, 13, 3, 1, 12);
INSERT INTO `p_checkitem_log` VALUES (138, 14, 3, 1, 12);
INSERT INTO `p_checkitem_log` VALUES (139, 9, 6, 5, 12);
INSERT INTO `p_checkitem_log` VALUES (140, 18, 5, 5, 12);
INSERT INTO `p_checkitem_log` VALUES (141, 10, 3, 4, 12);
INSERT INTO `p_checkitem_log` VALUES (142, 11, 6, 4, 12);
INSERT INTO `p_checkitem_log` VALUES (143, 17, 3, 4, 12);
INSERT INTO `p_checkitem_log` VALUES (144, 12, 6, 3, 12);
INSERT INTO `p_checkitem_log` VALUES (145, 15, 5, 3, 12);
INSERT INTO `p_checkitem_log` VALUES (146, 6, 9, 2, 13);
INSERT INTO `p_checkitem_log` VALUES (147, 16, 3, 2, 13);
INSERT INTO `p_checkitem_log` VALUES (148, 7, 3, 1, 13);
INSERT INTO `p_checkitem_log` VALUES (149, 8, 3, 1, 13);
INSERT INTO `p_checkitem_log` VALUES (150, 13, 3, 1, 13);
INSERT INTO `p_checkitem_log` VALUES (151, 14, 3, 1, 13);
INSERT INTO `p_checkitem_log` VALUES (152, 9, 6, 5, 13);
INSERT INTO `p_checkitem_log` VALUES (153, 18, 6, 5, 13);
INSERT INTO `p_checkitem_log` VALUES (154, 10, 3, 4, 13);
INSERT INTO `p_checkitem_log` VALUES (155, 11, 6, 4, 13);
INSERT INTO `p_checkitem_log` VALUES (156, 17, 3, 4, 13);
INSERT INTO `p_checkitem_log` VALUES (157, 12, 9, 3, 13);
INSERT INTO `p_checkitem_log` VALUES (158, 15, 6, 3, 13);
INSERT INTO `p_checkitem_log` VALUES (159, 6, 9, 2, 14);
INSERT INTO `p_checkitem_log` VALUES (160, 16, 3, 2, 14);
INSERT INTO `p_checkitem_log` VALUES (161, 7, 3, 1, 14);
INSERT INTO `p_checkitem_log` VALUES (162, 8, 3, 1, 14);
INSERT INTO `p_checkitem_log` VALUES (163, 13, 5, 1, 14);
INSERT INTO `p_checkitem_log` VALUES (164, 14, 5, 1, 14);
INSERT INTO `p_checkitem_log` VALUES (165, 9, 10, 5, 14);
INSERT INTO `p_checkitem_log` VALUES (166, 18, 10, 5, 14);
INSERT INTO `p_checkitem_log` VALUES (167, 10, 5, 4, 14);
INSERT INTO `p_checkitem_log` VALUES (168, 11, 10, 4, 14);
INSERT INTO `p_checkitem_log` VALUES (169, 17, 5, 4, 14);
INSERT INTO `p_checkitem_log` VALUES (170, 12, 6, 3, 14);
INSERT INTO `p_checkitem_log` VALUES (171, 15, 7, 3, 14);
INSERT INTO `p_checkitem_log` VALUES (172, 6, 9, 2, 15);
INSERT INTO `p_checkitem_log` VALUES (173, 16, 3, 2, 15);
INSERT INTO `p_checkitem_log` VALUES (174, 7, 3, 1, 15);
INSERT INTO `p_checkitem_log` VALUES (175, 8, 3, 1, 15);
INSERT INTO `p_checkitem_log` VALUES (176, 13, 3, 1, 15);
INSERT INTO `p_checkitem_log` VALUES (177, 14, 3, 1, 15);
INSERT INTO `p_checkitem_log` VALUES (178, 9, 6, 5, 15);
INSERT INTO `p_checkitem_log` VALUES (179, 18, 6, 5, 15);
INSERT INTO `p_checkitem_log` VALUES (180, 10, 3, 4, 15);
INSERT INTO `p_checkitem_log` VALUES (181, 11, 6, 4, 15);
INSERT INTO `p_checkitem_log` VALUES (182, 17, 3, 4, 15);
INSERT INTO `p_checkitem_log` VALUES (183, 12, 6, 3, 15);
INSERT INTO `p_checkitem_log` VALUES (184, 15, 6, 3, 15);

-- ----------------------------
-- Table structure for p_dorm
-- ----------------------------
DROP TABLE IF EXISTS `p_dorm`;
CREATE TABLE `p_dorm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼号',
  `dorm_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '宿舍号码',
  `capacity` int NULL DEFAULT 6 COMMENT '宿舍容量',
  `floor` int NULL DEFAULT NULL COMMENT '层数',
  `occupation` int NULL DEFAULT 0 COMMENT '被占床位',
  `admin` int NULL DEFAULT NULL COMMENT '寝室长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 379 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_dorm
-- ----------------------------
INSERT INTO `p_dorm` VALUES (1, '1号楼', '101', 4, 1, 4, 1);
INSERT INTO `p_dorm` VALUES (2, '1号楼', '102', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (3, '1号楼', '103', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (4, '1号楼', '104', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (5, '1号楼', '105', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (6, '1号楼', '106', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (7, '1号楼', '107', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (8, '1号楼', '108', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (9, '1号楼', '109', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (10, '1号楼', '110', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (11, '1号楼', '111', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (12, '1号楼', '112', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (13, '1号楼', '113', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (14, '1号楼', '114', 4, 1, 1, NULL);
INSERT INTO `p_dorm` VALUES (15, '1号楼', '115', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (16, '1号楼', '116', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (17, '1号楼', '117', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (18, '1号楼', '118', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (19, '1号楼', '201', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (20, '1号楼', '202', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (21, '1号楼', '203', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (22, '1号楼', '204', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (23, '1号楼', '205', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (24, '1号楼', '206', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (25, '1号楼', '207', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (26, '1号楼', '208', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (27, '1号楼', '209', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (28, '1号楼', '210', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (29, '1号楼', '211', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (30, '1号楼', '212', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (31, '1号楼', '213', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (32, '1号楼', '214', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (33, '1号楼', '215', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (34, '1号楼', '216', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (35, '1号楼', '217', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (36, '1号楼', '218', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (37, '1号楼', '301', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (38, '1号楼', '302', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (39, '1号楼', '303', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (40, '1号楼', '304', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (41, '1号楼', '305', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (42, '1号楼', '306', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (43, '1号楼', '307', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (44, '1号楼', '308', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (45, '1号楼', '309', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (46, '1号楼', '310', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (47, '1号楼', '311', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (48, '1号楼', '312', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (49, '1号楼', '313', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (50, '1号楼', '314', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (51, '1号楼', '315', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (52, '1号楼', '316', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (53, '1号楼', '317', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (54, '1号楼', '318', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (55, '1号楼', '401', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (56, '1号楼', '402', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (57, '1号楼', '403', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (58, '1号楼', '404', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (59, '1号楼', '405', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (60, '1号楼', '406', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (61, '1号楼', '407', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (62, '1号楼', '408', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (63, '1号楼', '409', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (64, '1号楼', '410', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (65, '1号楼', '411', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (66, '1号楼', '412', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (67, '1号楼', '413', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (68, '1号楼', '414', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (69, '1号楼', '415', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (70, '1号楼', '416', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (71, '1号楼', '417', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (72, '1号楼', '418', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (73, '1号楼', '501', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (74, '1号楼', '502', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (75, '1号楼', '503', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (76, '1号楼', '504', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (77, '1号楼', '505', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (78, '1号楼', '506', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (79, '1号楼', '507', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (80, '1号楼', '508', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (81, '1号楼', '509', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (82, '1号楼', '510', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (83, '1号楼', '511', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (84, '1号楼', '512', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (85, '1号楼', '513', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (86, '1号楼', '514', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (87, '1号楼', '515', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (88, '1号楼', '516', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (89, '1号楼', '517', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (90, '1号楼', '518', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (91, '1号楼', '601', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (92, '1号楼', '602', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (93, '1号楼', '603', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (94, '1号楼', '604', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (95, '1号楼', '605', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (96, '1号楼', '606', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (97, '1号楼', '607', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (98, '1号楼', '608', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (99, '1号楼', '609', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (100, '1号楼', '610', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (101, '1号楼', '611', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (102, '1号楼', '612', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (103, '1号楼', '613', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (104, '1号楼', '614', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (105, '1号楼', '615', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (106, '1号楼', '616', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (107, '1号楼', '617', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (108, '1号楼', '618', 4, 6, 0, NULL);
INSERT INTO `p_dorm` VALUES (110, '2号楼', '101', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (111, '2号楼', '102', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (112, '2号楼', '103', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (113, '2号楼', '104', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (114, '2号楼', '105', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (115, '2号楼', '106', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (116, '2号楼', '107', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (117, '2号楼', '108', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (118, '2号楼', '109', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (119, '2号楼', '110', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (120, '2号楼', '111', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (121, '2号楼', '112', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (122, '2号楼', '113', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (123, '2号楼', '114', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (124, '2号楼', '115', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (125, '2号楼', '116', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (126, '2号楼', '117', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (127, '2号楼', '118', 6, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (128, '2号楼', '201', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (129, '2号楼', '202', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (130, '2号楼', '203', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (131, '2号楼', '204', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (132, '2号楼', '205', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (133, '2号楼', '206', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (134, '2号楼', '207', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (135, '2号楼', '208', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (136, '2号楼', '209', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (137, '2号楼', '210', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (138, '2号楼', '211', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (139, '2号楼', '212', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (140, '2号楼', '213', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (141, '2号楼', '214', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (142, '2号楼', '215', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (143, '2号楼', '216', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (144, '2号楼', '217', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (145, '2号楼', '218', 6, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (146, '2号楼', '301', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (147, '2号楼', '302', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (148, '2号楼', '303', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (149, '2号楼', '304', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (150, '2号楼', '305', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (151, '2号楼', '306', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (152, '2号楼', '307', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (153, '2号楼', '308', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (154, '2号楼', '309', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (155, '2号楼', '310', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (156, '2号楼', '311', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (157, '2号楼', '312', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (158, '2号楼', '313', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (159, '2号楼', '314', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (160, '2号楼', '315', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (161, '2号楼', '316', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (162, '2号楼', '317', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (163, '2号楼', '318', 6, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (164, '2号楼', '401', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (165, '2号楼', '402', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (166, '2号楼', '403', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (167, '2号楼', '404', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (168, '2号楼', '405', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (169, '2号楼', '406', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (170, '2号楼', '407', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (171, '2号楼', '408', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (172, '2号楼', '409', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (173, '2号楼', '410', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (174, '2号楼', '411', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (175, '2号楼', '412', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (176, '2号楼', '413', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (177, '2号楼', '414', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (178, '2号楼', '415', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (179, '2号楼', '416', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (180, '2号楼', '417', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (181, '2号楼', '418', 6, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (182, '2号楼', '501', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (183, '2号楼', '502', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (184, '2号楼', '503', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (185, '2号楼', '504', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (186, '2号楼', '505', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (187, '2号楼', '506', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (188, '2号楼', '507', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (189, '2号楼', '508', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (190, '2号楼', '509', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (191, '2号楼', '510', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (192, '2号楼', '511', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (193, '2号楼', '512', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (194, '2号楼', '513', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (195, '2号楼', '514', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (196, '2号楼', '515', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (197, '2号楼', '516', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (198, '2号楼', '517', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (199, '2号楼', '518', 6, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (200, '1B号楼', '101', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (201, '1B号楼', '102', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (202, '1B号楼', '103', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (203, '1B号楼', '104', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (204, '1B号楼', '105', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (205, '1B号楼', '106', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (206, '1B号楼', '107', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (207, '1B号楼', '108', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (208, '1B号楼', '109', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (209, '1B号楼', '110', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (210, '1B号楼', '111', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (211, '1B号楼', '112', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (212, '1B号楼', '113', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (213, '1B号楼', '114', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (214, '1B号楼', '115', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (215, '1B号楼', '116', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (216, '1B号楼', '117', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (217, '1B号楼', '118', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (218, '1B号楼', '201', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (219, '1B号楼', '202', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (220, '1B号楼', '203', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (221, '1B号楼', '204', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (222, '1B号楼', '205', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (223, '1B号楼', '206', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (224, '1B号楼', '207', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (225, '1B号楼', '208', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (226, '1B号楼', '209', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (227, '1B号楼', '210', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (228, '1B号楼', '211', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (229, '1B号楼', '212', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (230, '1B号楼', '213', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (231, '1B号楼', '214', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (232, '1B号楼', '215', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (233, '1B号楼', '216', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (234, '1B号楼', '217', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (235, '1B号楼', '218', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (236, '1B号楼', '301', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (237, '1B号楼', '302', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (238, '1B号楼', '303', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (239, '1B号楼', '304', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (240, '1B号楼', '305', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (241, '1B号楼', '306', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (242, '1B号楼', '307', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (243, '1B号楼', '308', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (244, '1B号楼', '309', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (245, '1B号楼', '310', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (246, '1B号楼', '311', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (247, '1B号楼', '312', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (248, '1B号楼', '313', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (249, '1B号楼', '314', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (250, '1B号楼', '315', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (251, '1B号楼', '316', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (252, '1B号楼', '317', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (253, '1B号楼', '318', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (254, '1B号楼', '401', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (255, '1B号楼', '402', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (256, '1B号楼', '403', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (257, '1B号楼', '404', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (258, '1B号楼', '405', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (259, '1B号楼', '406', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (260, '1B号楼', '407', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (261, '1B号楼', '408', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (262, '1B号楼', '409', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (263, '1B号楼', '410', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (264, '1B号楼', '411', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (265, '1B号楼', '412', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (266, '1B号楼', '413', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (267, '1B号楼', '414', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (268, '1B号楼', '415', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (269, '1B号楼', '416', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (270, '1B号楼', '417', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (271, '1B号楼', '418', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (272, '1B号楼', '501', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (273, '1B号楼', '502', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (274, '1B号楼', '503', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (275, '1B号楼', '504', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (276, '1B号楼', '505', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (277, '1B号楼', '506', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (278, '1B号楼', '507', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (279, '1B号楼', '508', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (280, '1B号楼', '509', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (281, '1B号楼', '510', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (282, '1B号楼', '511', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (283, '1B号楼', '512', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (284, '1B号楼', '513', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (285, '1B号楼', '514', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (286, '1B号楼', '515', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (287, '1B号楼', '516', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (288, '1B号楼', '517', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (289, '1B号楼', '518', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (290, '2A号楼', '101', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (291, '2A号楼', '102', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (292, '2A号楼', '103', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (293, '2A号楼', '104', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (294, '2A号楼', '105', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (295, '2A号楼', '106', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (296, '2A号楼', '107', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (297, '2A号楼', '108', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (298, '2A号楼', '109', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (299, '2A号楼', '110', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (300, '2A号楼', '111', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (301, '2A号楼', '112', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (302, '2A号楼', '113', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (303, '2A号楼', '114', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (304, '2A号楼', '115', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (305, '2A号楼', '116', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (306, '2A号楼', '117', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (307, '2A号楼', '118', 4, 1, 0, NULL);
INSERT INTO `p_dorm` VALUES (308, '2A号楼', '201', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (309, '2A号楼', '202', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (310, '2A号楼', '203', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (311, '2A号楼', '204', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (312, '2A号楼', '205', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (313, '2A号楼', '206', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (314, '2A号楼', '207', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (315, '2A号楼', '208', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (316, '2A号楼', '209', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (317, '2A号楼', '210', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (318, '2A号楼', '211', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (319, '2A号楼', '212', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (320, '2A号楼', '213', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (321, '2A号楼', '214', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (322, '2A号楼', '215', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (323, '2A号楼', '216', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (324, '2A号楼', '217', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (325, '2A号楼', '218', 4, 2, 0, NULL);
INSERT INTO `p_dorm` VALUES (326, '2A号楼', '301', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (327, '2A号楼', '302', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (328, '2A号楼', '303', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (329, '2A号楼', '304', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (330, '2A号楼', '305', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (331, '2A号楼', '306', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (332, '2A号楼', '307', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (333, '2A号楼', '308', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (334, '2A号楼', '309', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (335, '2A号楼', '310', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (336, '2A号楼', '311', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (337, '2A号楼', '312', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (338, '2A号楼', '313', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (339, '2A号楼', '314', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (340, '2A号楼', '315', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (341, '2A号楼', '316', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (342, '2A号楼', '317', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (343, '2A号楼', '318', 4, 3, 0, NULL);
INSERT INTO `p_dorm` VALUES (344, '2A号楼', '401', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (345, '2A号楼', '402', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (346, '2A号楼', '403', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (347, '2A号楼', '404', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (348, '2A号楼', '405', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (349, '2A号楼', '406', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (350, '2A号楼', '407', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (351, '2A号楼', '408', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (352, '2A号楼', '409', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (353, '2A号楼', '410', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (354, '2A号楼', '411', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (355, '2A号楼', '412', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (356, '2A号楼', '413', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (357, '2A号楼', '414', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (358, '2A号楼', '415', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (359, '2A号楼', '416', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (360, '2A号楼', '417', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (361, '2A号楼', '418', 4, 4, 0, NULL);
INSERT INTO `p_dorm` VALUES (362, '2A号楼', '501', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (363, '2A号楼', '502', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (364, '2A号楼', '503', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (365, '2A号楼', '504', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (366, '2A号楼', '505', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (367, '2A号楼', '506', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (368, '2A号楼', '507', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (369, '2A号楼', '508', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (370, '2A号楼', '509', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (371, '2A号楼', '510', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (372, '2A号楼', '511', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (373, '2A号楼', '512', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (374, '2A号楼', '513', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (375, '2A号楼', '514', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (376, '2A号楼', '515', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (377, '2A号楼', '516', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (378, '2A号楼', '517', 4, 5, 0, NULL);
INSERT INTO `p_dorm` VALUES (379, '2A号楼', '518', 4, 5, 0, NULL);

-- ----------------------------
-- Table structure for p_fix
-- ----------------------------
DROP TABLE IF EXISTS `p_fix`;
CREATE TABLE `p_fix`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `thing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '维修主体',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报修细节',
  `cat_id` int NULL DEFAULT NULL COMMENT '分类id',
  `dorm_id` int NULL DEFAULT NULL COMMENT '报修寝室id',
  `create_time` datetime NOT NULL COMMENT '报修时间',
  `expect_time` datetime NULL DEFAULT NULL COMMENT '期望维修时间',
  `user_id` int NULL DEFAULT NULL COMMENT '报修人',
  `status` int NULL DEFAULT -1 COMMENT '处理状态 0未处理 1已解决 -1被删除',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `priority` int NULL DEFAULT NULL COMMENT '0 非常急|1 急迫|2 较急|3 不急',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_fix
-- ----------------------------
INSERT INTO `p_fix` VALUES (6, '电视机', 1, '电视机坏了', 3, 92, '2022-01-16 18:58:31', '2022-01-20 01:05:15', 1, 1, '1713622254', 0);
INSERT INTO `p_fix` VALUES (7, '墙面', 1, '一个字符由于所使用的字符集的不同，会并存储在一个或多个字节中，所以一个字符占用多少个字节取决于所使用的字符集\r\n\r\n注意：char（len）与varchar（len）后面接的数据大小为存储的字符数，而不是字节 数；', 1, 92, '2022-01-16 19:14:38', '2022-01-20 01:05:19', 1, 1, '11111111111', 3);
INSERT INTO `p_fix` VALUES (12, '桌子', 2, '桌子炸了', 1, 1, '2022-02-11 19:39:27', '2022-02-11 19:39:31', 2, 1, '15055965236', 2);

-- ----------------------------
-- Table structure for p_fix_cat
-- ----------------------------
DROP TABLE IF EXISTS `p_fix_cat`;
CREATE TABLE `p_fix_cat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名字',
  `priority` int NULL DEFAULT NULL COMMENT '优先级，升序序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_fix_cat
-- ----------------------------
INSERT INTO `p_fix_cat` VALUES (1, '墙面', 3);
INSERT INTO `p_fix_cat` VALUES (2, '桌椅', 4);
INSERT INTO `p_fix_cat` VALUES (3, '电器', 5);
INSERT INTO `p_fix_cat` VALUES (4, '地板', 3);
INSERT INTO `p_fix_cat` VALUES (5, '衣柜', 2);
INSERT INTO `p_fix_cat` VALUES (6, '晾衣架', 1);

-- ----------------------------
-- Table structure for p_image
-- ----------------------------
DROP TABLE IF EXISTS `p_image`;
CREATE TABLE `p_image`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `request_id` int NULL DEFAULT NULL COMMENT '属于请假附件',
  `post_id` int NULL DEFAULT NULL COMMENT '属于帖子附件',
  `check_id` int NULL DEFAULT NULL COMMENT '属于检查附件',
  `fix_id` int NULL DEFAULT NULL COMMENT '属于报修附件',
  `announce_id` int NULL DEFAULT NULL COMMENT '属于公告附件',
  `size` double NULL DEFAULT NULL COMMENT '大小/Mb',
  `status` int NULL DEFAULT 1 COMMENT '0 删除 1保留',
  `i_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_image
-- ----------------------------
INSERT INTO `p_image` VALUES (1, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload-images.jianshu.io%2Fupload_images%2F6698601-1f7212ae142e304b.jpg%3FimageMogr2%2Fauto-orient%2Fstrip%7CimageView2%2F1%2Fw%2F300%2Fh%2F240&refer=http%3A%2F%2Fupload-images.jianshu.io&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637307268&t=3e91e559b157327dc740ea461fa2185e', '2021-10-18 22:37:35', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (2, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload-images.jianshu.io%2Fupload_images%2F6698601-1f7212ae142e304b.jpg%3FimageMogr2%2Fauto-orient%2Fstrip%7CimageView2%2F1%2Fw%2F300%2Fh%2F240&refer=http%3A%2F%2Fupload-images.jianshu.io&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637307268&t=3e91e559b157327dc740ea461fa2185e', '2021-10-20 15:43:47', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (3, 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fupload-images.jianshu.io%2Fupload_images%2F6698601-1f7212ae142e304b.jpg%3FimageMogr2%2Fauto-orient%2Fstrip%7CimageView2%2F1%2Fw%2F300%2Fh%2F240&refer=http%3A%2F%2Fupload-images.jianshu.io&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1637307268&t=3e91e559b157327dc740ea461fa2185e', '2021-10-20 15:43:51', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (9, 'https://img01.yzcdn.cn/vant/apple-1.jpg', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (10, 'https://img01.yzcdn.cn/vant/apple-2.jpg', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (12, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/request/2021-11-13/a01dbb6c-8e71-4252-8acd-06206670b9c4.jpg', '2021-11-13 21:30:55', 'jpg', 7, NULL, NULL, NULL, NULL, 0, 0, 'request/2021-11-13/a01dbb6c-8e71-4252-8acd-06206670b9c4.jpg');
INSERT INTO `p_image` VALUES (13, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/request/2021-11-22/3f68888b-f5e1-40d9-8676-380baa791b67.jpg', '2021-11-22 21:13:04', 'jpg', 4, NULL, NULL, NULL, NULL, 0, 0, 'request/2021-11-22/3f68888b-f5e1-40d9-8676-380baa791b67.jpg');
INSERT INTO `p_image` VALUES (14, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/post/2021-12-07/9e49230c-9db9-4a38-8d60-c2b3d0cc8cf7.jpg', '2021-12-07 23:21:04', 'jpg', NULL, 11, NULL, NULL, NULL, 0, 1, 'post/2021-12-07/9e49230c-9db9-4a38-8d60-c2b3d0cc8cf7.jpg');
INSERT INTO `p_image` VALUES (22, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/post/2021-12-07/9e49230c-9db9-4a38-8d60-c2b3d0cc8cf7.jpg', NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (23, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/post/2021-12-07/9e49230c-9db9-4a38-8d60-c2b3d0cc8cf7.jpg', NULL, NULL, 1, NULL, NULL, 7, NULL, NULL, 1, NULL);
INSERT INTO `p_image` VALUES (25, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/announcement/2022-02-24/d23018cc-91ad-4c7f-b9b2-4464aa7a0439.png', '2022-02-24 21:18:38', 'png', NULL, NULL, NULL, NULL, NULL, 0, 0, 'announcement/2022-02-24/d23018cc-91ad-4c7f-b9b2-4464aa7a0439.png');
INSERT INTO `p_image` VALUES (26, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/announcement/2022-02-24/7bc19ca6-1043-4f1d-922b-330dd920db1f.png', '2022-02-24 21:19:10', 'png', NULL, NULL, NULL, NULL, 7, 0, 1, 'announcement/2022-02-24/7bc19ca6-1043-4f1d-922b-330dd920db1f.png');
INSERT INTO `p_image` VALUES (28, 'https://mybase-1-1305081850.cos.ap-nanjing.myqcloud.com/request/2022-05-06/5f44738b-10ce-48e4-ab77-68fe2b4e5d62.png', '2022-05-06 18:08:31', 'png', 7, NULL, NULL, NULL, NULL, 0, 1, 'request/2022-05-06/5f44738b-10ce-48e4-ab77-68fe2b4e5d62.png');

-- ----------------------------
-- Table structure for p_leave_request
-- ----------------------------
DROP TABLE IF EXISTS `p_leave_request`;
CREATE TABLE `p_leave_request`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假说明',
  `status` int NULL DEFAULT 0 COMMENT '假条状态  -1未批准 0审批中 1已通过  2已销假 ',
  `proposer` int NULL DEFAULT NULL COMMENT '申请人',
  `auditor` int NULL DEFAULT NULL COMMENT '批准人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发起时间',
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批建议',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '批准时间',
  `destroy_time` datetime NULL DEFAULT NULL COMMENT '销假时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_leave_request
-- ----------------------------
INSERT INTO `p_leave_request` VALUES (1, '2021-10-18 22:18:37', '2021-11-18 22:18:39', 'nonnnnnnnnnnnnnnnnnnn一般说发烧比较难以服众，因为能看出来点端倪，要装也比较难，因为有温度这关。靠谱点的能够说头晕、喉咙痛，假装感冒症状，时不时趴在桌子上，这么难受，上司也不忍心了，并且这种状态也无法继续工作了。', 1, 8, 1, '2021-10-18 22:19:14', '', '2022-02-13 23:35:00', '2021-11-06 22:35:34');
INSERT INTO `p_leave_request` VALUES (2, '2021-11-02 00:00:00', '2021-11-02 16:27:48', '一般说发烧比较难以服众，因为能看出来点端倪，要装也比较难，因为有温度这关。靠谱点的能够说头晕、喉咙痛，假装感冒症状，时不时趴在桌子上，这么难受，上司也不忍心了，并且这种状态也无法继续工作了。', 1, 8, 1, '2021-11-02 16:27:49', '一般请假理由上写家里有事，有些上司是不会过问而直接签字批准的，但最好准备好个理由，因为有些上司是非要刨根问底的，一旦上司问起，能够立马回答，不然支支吾吾的，肯定穿帮了。', '2022-02-13 23:35:06', '2021-11-06 23:06:53');
INSERT INTO `p_leave_request` VALUES (3, '2021-11-07 09:33:00', '2021-11-14 00:33:00', '一般说发烧比较难以服众，因为能看出来点端倪，要装也比较难，因为有温度这关。靠谱点的能够说头晕、喉咙痛，假装感冒症状，时不时趴在桌子上，这么难受，上司也不忍心了，并且这种状态也无法继续工作了。', -1, 8, 1, '2021-11-07 00:34:22', '一般请假理由上写家里有事，有些上司是不会过问而直接签字批准的，但最好准备好个理由，因为有些上司是非要刨根问底的，一旦上司问起，能够立马回答，不然支支吾吾的，肯定穿帮了。', '2022-02-13 23:35:11', '2021-11-07 00:42:44');
INSERT INTO `p_leave_request` VALUES (6, '2022-02-10 20:23:38', '2022-02-13 20:23:34', '一般说发烧比较难以服众，因为能看出来点端倪，要装也比较难，因为有温度这关。靠谱点的能够说头晕、喉咙痛，假装感冒症状，时不时趴在桌子上，这么难受，上司也不忍心了，并且这种状态也无法继续工作了。', 0, 8, 3, '2022-02-08 23:23:59', '一般请假理由上写家里有事，有些上司是不会过问而直接签字批准的，但最好准备好个理由，因为有些上司是非要刨根问底的，一旦上司问起，能够立马回答，不然支支吾吾的，肯定穿帮了。', '2022-02-13 23:30:54', '2022-02-16 20:24:15');
INSERT INTO `p_leave_request` VALUES (7, '2022-05-06 18:08:00', '2022-05-07 18:08:00', '出去实习', 0, 2, 6, '2022-05-06 18:08:38', NULL, NULL, NULL);
INSERT INTO `p_leave_request` VALUES (9, '2022-05-11 18:48:00', '2022-05-14 18:48:00', '555', 0, 1, 6, '2022-05-11 18:50:22', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for p_menu
-- ----------------------------
DROP TABLE IF EXISTS `p_menu`;
CREATE TABLE `p_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint UNSIGNED NULL DEFAULT 1,
  `parentId` int NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `hidden` tinyint NULL DEFAULT 0 COMMENT '侧边栏是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES (27, '/', '/app', 'Home', '后台设置', 'el-icon-s-help', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (28, '/', '/dorm', 'Home', '宿舍板块', 'el-icon-office-building', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (29, '/', '/check', 'Home', '卫生检查', 'el-icon-zoom-in', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (30, '/', '/user', 'Home', '用户板块', 'el-icon-user', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (31, '/', '/announcement', 'Home', '公告板块', 'el-icon-notebook-2', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (32, '/', '/fix', 'Home', '维修板块', 'el-icon-setting', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (33, '/', '/post', 'Home', '反馈板块', 'el-icon-document', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (34, '/', '/leave', 'Home', '请假板块', 'el-icon-s-order', NULL, 1, -1, 1, 0);
INSERT INTO `p_menu` VALUES (35, '/announcement/save', '/announcement/create', 'AnnoEdit', '发布公告', NULL, NULL, 1, 31, 1, 0);
INSERT INTO `p_menu` VALUES (36, '/announcement/admin/**', '/announcement/table', 'AnnoTable', '公告管理', NULL, NULL, 1, 31, 1, 0);
INSERT INTO `p_menu` VALUES (37, '/announcement/admin/update', '/announcement/edit/:id', 'AnnoEdit', '编辑公告', NULL, NULL, 1, 31, 1, 1);
INSERT INTO `p_menu` VALUES (38, '/fix/admin/**', '/fix/table', 'FixTable', '维修管理', NULL, NULL, 1, 32, 1, 0);
INSERT INTO `p_menu` VALUES (39, '/fix-cat/admin/**', '/fix/cat', 'FixCat', '分类管理', NULL, NULL, 1, 32, 1, 0);
INSERT INTO `p_menu` VALUES (40, '/leave-request/list', '/leave/all', 'LeaveAllRequests', '所有请假', NULL, NULL, 1, 34, 1, 0);
INSERT INTO `p_menu` VALUES (41, '/leave-request/admin/**', '/leave/my', 'LeaveRequest', '请假管理', NULL, NULL, 1, 34, 1, 0);
INSERT INTO `p_menu` VALUES (42, '/post/audit/**', '/post/check', 'PostCheck', '帖子审核', NULL, NULL, 1, 33, 1, 0);
INSERT INTO `p_menu` VALUES (43, '/post/', '/post/table', 'PostTable', '帖子管理', NULL, NULL, 1, 33, 1, 0);
INSERT INTO `p_menu` VALUES (44, '/checkLog/', '/check/grade', 'CheckGrade', '检查结果', NULL, NULL, 1, 29, 1, 0);
INSERT INTO `p_menu` VALUES (45, '/checkItem/**', '/check/item', 'CheckItem', '检查条目', NULL, NULL, 1, 29, 1, 0);
INSERT INTO `p_menu` VALUES (46, '/user/admin/**', '/user/table', 'UserTable', '用户管理', NULL, NULL, 1, 30, 1, 0);
INSERT INTO `p_menu` VALUES (47, '/chat/**', '/chat', 'ChatPanel', '用户交流', 'el-icon-bell', NULL, 1, -1, 0, 0);
INSERT INTO `p_menu` VALUES (48, '/user/role**', '/user/role', 'UserRole', '角色分配', NULL, NULL, 1, 30, 1, 0);
INSERT INTO `p_menu` VALUES (49, '/eCharts/**', '/check/analysis', 'CheckDataPanel', '结果分析', NULL, NULL, 1, 29, 1, 0);
INSERT INTO `p_menu` VALUES (50, '/checkLog/checker**', '/checkLog/checker', NULL, '卫生检查表提交', NULL, NULL, 1, 29, 1, 1);
INSERT INTO `p_menu` VALUES (51, '/bed/freshman**', '/bed/freshman', NULL, '预定床位', NULL, NULL, 1, 28, 1, 1);
INSERT INTO `p_menu` VALUES (53, '/dorm/manage/bed**', '/dorm/manage/bed', 'DormBedManage', '床位管理', NULL, NULL, 1, 28, 1, 0);
INSERT INTO `p_menu` VALUES (54, '/dorm/detail/**', '/dorm/table', 'DormTable', '宿舍详情', NULL, NULL, 1, 28, 1, 0);
INSERT INTO `p_menu` VALUES (55, '/menu/allocate/**', '/app/menus', 'AppMenus', '菜单分配', NULL, NULL, 1, 27, 1, 0);

-- ----------------------------
-- Table structure for p_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `p_menu_role`;
CREATE TABLE `p_menu_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `rid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_menu_role
-- ----------------------------
INSERT INTO `p_menu_role` VALUES (23, 51, 7);
INSERT INTO `p_menu_role` VALUES (24, 50, 8);
INSERT INTO `p_menu_role` VALUES (30, 47, 7);
INSERT INTO `p_menu_role` VALUES (71, 28, 2);
INSERT INTO `p_menu_role` VALUES (72, 54, 2);
INSERT INTO `p_menu_role` VALUES (73, 29, 2);
INSERT INTO `p_menu_role` VALUES (74, 44, 2);
INSERT INTO `p_menu_role` VALUES (75, 45, 2);
INSERT INTO `p_menu_role` VALUES (76, 49, 2);
INSERT INTO `p_menu_role` VALUES (77, 50, 2);
INSERT INTO `p_menu_role` VALUES (78, 32, 2);
INSERT INTO `p_menu_role` VALUES (79, 38, 2);
INSERT INTO `p_menu_role` VALUES (80, 39, 2);
INSERT INTO `p_menu_role` VALUES (81, 27, 3);
INSERT INTO `p_menu_role` VALUES (82, 55, 3);
INSERT INTO `p_menu_role` VALUES (83, 28, 3);
INSERT INTO `p_menu_role` VALUES (84, 53, 3);
INSERT INTO `p_menu_role` VALUES (85, 54, 3);
INSERT INTO `p_menu_role` VALUES (86, 29, 3);
INSERT INTO `p_menu_role` VALUES (87, 44, 3);
INSERT INTO `p_menu_role` VALUES (88, 45, 3);
INSERT INTO `p_menu_role` VALUES (89, 49, 3);
INSERT INTO `p_menu_role` VALUES (90, 50, 3);
INSERT INTO `p_menu_role` VALUES (91, 30, 3);
INSERT INTO `p_menu_role` VALUES (92, 46, 3);
INSERT INTO `p_menu_role` VALUES (93, 48, 3);
INSERT INTO `p_menu_role` VALUES (94, 31, 3);
INSERT INTO `p_menu_role` VALUES (95, 35, 3);
INSERT INTO `p_menu_role` VALUES (96, 36, 3);
INSERT INTO `p_menu_role` VALUES (97, 37, 3);
INSERT INTO `p_menu_role` VALUES (98, 32, 3);
INSERT INTO `p_menu_role` VALUES (99, 38, 3);
INSERT INTO `p_menu_role` VALUES (100, 39, 3);
INSERT INTO `p_menu_role` VALUES (101, 33, 3);
INSERT INTO `p_menu_role` VALUES (102, 42, 3);
INSERT INTO `p_menu_role` VALUES (103, 43, 3);
INSERT INTO `p_menu_role` VALUES (104, 34, 3);
INSERT INTO `p_menu_role` VALUES (105, 40, 3);
INSERT INTO `p_menu_role` VALUES (106, 41, 3);
INSERT INTO `p_menu_role` VALUES (107, 28, 4);
INSERT INTO `p_menu_role` VALUES (108, 29, 4);
INSERT INTO `p_menu_role` VALUES (109, 54, 4);
INSERT INTO `p_menu_role` VALUES (110, 44, 4);
INSERT INTO `p_menu_role` VALUES (111, 49, 4);
INSERT INTO `p_menu_role` VALUES (112, 31, 6);
INSERT INTO `p_menu_role` VALUES (113, 29, 6);
INSERT INTO `p_menu_role` VALUES (114, 44, 6);
INSERT INTO `p_menu_role` VALUES (115, 45, 6);
INSERT INTO `p_menu_role` VALUES (116, 49, 6);
INSERT INTO `p_menu_role` VALUES (117, 50, 6);
INSERT INTO `p_menu_role` VALUES (118, 35, 6);
INSERT INTO `p_menu_role` VALUES (119, 37, 6);
INSERT INTO `p_menu_role` VALUES (120, 33, 6);
INSERT INTO `p_menu_role` VALUES (121, 42, 6);
INSERT INTO `p_menu_role` VALUES (122, 43, 6);
INSERT INTO `p_menu_role` VALUES (123, 34, 6);
INSERT INTO `p_menu_role` VALUES (124, 40, 6);
INSERT INTO `p_menu_role` VALUES (125, 41, 6);

-- ----------------------------
-- Table structure for p_post
-- ----------------------------
DROP TABLE IF EXISTS `p_post`;
CREATE TABLE `p_post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `user_id` int NULL DEFAULT NULL COMMENT '发布者',
  `status` int NULL DEFAULT 0 COMMENT '状态 0未审核 1已审核 -1不通过',
  `like_num` int NULL DEFAULT 0 COMMENT '点赞数',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核不通过原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_post
-- ----------------------------
INSERT INTO `p_post` VALUES (1, '6666', '6666555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555............hhh绘画会话', '2021-10-12 23:04:21', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (2, '1111', '44', '2021-11-22 23:04:29', 1, 0, 0, '');
INSERT INTO `p_post` VALUES (5, '2222222222', '33', '2021-11-22 23:04:36', 1, 0, 0, '');
INSERT INTO `p_post` VALUES (6, '2222222', '11', '2021-11-22 23:04:49', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (7, '2222', '55', '2021-11-22 23:04:53', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (8, '222222', '22', '2021-11-22 23:04:58', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (9, '222222222', '99', '2021-11-26 22:26:14', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (11, '卫生问题哈哈哈哈哈哈哈哈', '某些人请注意楼道卫生！中午，爸爸妈妈下班回家就进了门，我看见爸爸拿着一个大西瓜，我赶紧把西瓜，放在桌子上，用刀将西瓜切成几块，妈妈和爸爸，然后拿起一个大一口吃的。一会儿，我的嘴巴、脸、鼻子都变红了，妈妈看见了，笑了。爸爸说：“西瓜好吃，但不凉！”我看着那半个西瓜，突然，想到了一个好办法。\r\n\r\n下午，爸爸妈妈去上班了，我抱着一半的西瓜走到冰箱前，我想：“我把西瓜放进保鲜室，还是放进冷冻室？”最后，我决定把它放在冰箱里。', '2021-12-07 23:21:05', 1, 1, 0, '');
INSERT INTO `p_post` VALUES (14, 'rabbitmq test', 'rabbitmq测试', '2022-03-26 12:35:42', 1, 1, 0, NULL);
INSERT INTO `p_post` VALUES (19, '什么时候放假', '如题', '2022-05-06 18:26:45', 2, 0, 0, NULL);

-- ----------------------------
-- Table structure for p_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `p_post_comment`;
CREATE TABLE `p_post_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `post_id` int NULL DEFAULT NULL COMMENT '评论帖子',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_post_comment
-- ----------------------------
INSERT INTO `p_post_comment` VALUES (1, 2, 'comment', '2021-12-21 12:30:45', 1);
INSERT INTO `p_post_comment` VALUES (2, 2, '11111', '2021-12-21 13:19:31', 1);
INSERT INTO `p_post_comment` VALUES (3, 1, '11111', '2021-12-31 13:07:24', 1);
INSERT INTO `p_post_comment` VALUES (4, 1, '4444', '2021-12-31 13:08:03', 1);
INSERT INTO `p_post_comment` VALUES (5, 1, '4444', '2021-12-31 13:08:05', 1);
INSERT INTO `p_post_comment` VALUES (6, 1, '4444', '2021-12-31 13:08:08', 1);
INSERT INTO `p_post_comment` VALUES (7, 1, '5555', '2021-12-31 13:08:42', 1);
INSERT INTO `p_post_comment` VALUES (8, 1, '-----', '2021-12-31 13:08:45', 1);
INSERT INTO `p_post_comment` VALUES (9, 1, '555', '2022-01-01 17:39:51', 1);
INSERT INTO `p_post_comment` VALUES (10, 1, '666', '2022-01-22 23:49:33', 11);
INSERT INTO `p_post_comment` VALUES (11, 1, '7', '2022-02-06 16:53:14', 9);
INSERT INTO `p_post_comment` VALUES (12, 2, 'test', '2022-05-06 18:25:52', 11);
INSERT INTO `p_post_comment` VALUES (13, 2, '1111', '2022-05-06 18:26:02', 11);

-- ----------------------------
-- Table structure for p_role
-- ----------------------------
DROP TABLE IF EXISTS `p_role`;
CREATE TABLE `p_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_role
-- ----------------------------
INSERT INTO `p_role` VALUES (1, 'ROLE_USER', '普通用户');
INSERT INTO `p_role` VALUES (2, 'ROLE_MANAGER', '宿管');
INSERT INTO `p_role` VALUES (3, 'ROLE_ADMIN', '超级管理员');
INSERT INTO `p_role` VALUES (4, 'ROLE_LEADER', '寝室长');
INSERT INTO `p_role` VALUES (6, 'ROLE_INSTRUCTOR', '辅导员');
INSERT INTO `p_role` VALUES (7, 'ROLE_FRESHMAN', '大一新生');
INSERT INTO `p_role` VALUES (8, 'ROLE_CHECKER', '卫生检察员');

-- ----------------------------
-- Table structure for p_user
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `create_date` date NULL DEFAULT NULL COMMENT '注册时间',
  `dorm_id` int NULL DEFAULT -1 COMMENT '所属宿舍',
  `sex` tinyint NULL DEFAULT 0 COMMENT '性别 0女1男',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES (1, '王二二', 'admin', '15569223182', '', '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF', 1, '2021-07-27', 1, 1);
INSERT INTO `p_user` VALUES (2, '周一一', 'zhu1', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F113020142315%2F201130142315-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=6db44e6fdd22d8e27581ba76f3acab3f', 1, '2021-07-28', 1, 1);
INSERT INTO `p_user` VALUES (3, '周日', 'zhu2', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F051220112022%2F200512112022-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=75830881ce0ba392f0cb06bf2ec6626b', 1, '2021-07-28', 1, 1);
INSERT INTO `p_user` VALUES (4, '六四', 'zhu3', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F052420110515%2F200524110515-11-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=34f949b69a739b474e9b6f1d917c9ecd', 1, '2021-07-28', 1, 1);
INSERT INTO `p_user` VALUES (5, '伍佰', 'zhu4', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdingyue.ws.126.net%2F2020%2F0515%2F465567a6j00qadpfz001cc000hs00b4c.jpg&refer=http%3A%2F%2Fdingyue.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=6142b1b69b0f8364ded8870283c386e5', 1, '2021-07-28', -1, 0);
INSERT INTO `p_user` VALUES (6, '卡卡', 'zhu5', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi-1.lanrentuku.com%2F2020%2F7%2F11%2Fe23bfa96-6f7c-4c05-b4e7-0ee93d656d9f.jpg&refer=http%3A%2F%2Fi-1.lanrentuku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=2fcfb135bbbc60c72f9c5e6593d0000b', 1, '2021-07-28', -1, 0);
INSERT INTO `p_user` VALUES (7, '刘润发', 'zhu45', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.2008php.com%2F09_Website_appreciate%2F10-07-11%2F1278861720_g.jpg&refer=http%3A%2F%2Fwww.2008php.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401836&t=2e0db43ec12568afc61b7f97fb77e821', 1, '2021-07-28', -1, 0);
INSERT INTO `p_user` VALUES (8, '刘青云', 'liu', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F052420110515%2F200524110515-2-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654401759&t=74ca0b965f619ddc70cc16b3ae17f57b', 1, '2021-08-06', -1, 0);
INSERT INTO `p_user` VALUES (9, '周一', 'zhu11', '17681295923', NULL, '$2a$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp05%2F1Z9291TIBZ6-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654402165&t=84449cb9f1f2cafa2209431e8d8edbfb', 1, '2021-07-28', -1, 1);
INSERT INTO `p_user` VALUES (10, '周二', 'zhu12', '17681295923', NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://pics6.baidu.com/feed/4034970a304e251f671f629fc07762117d3e53e1.jpeg?token=c8a6181ba59fac7d4bf4fcdc44ff1fcb', 1, '2021-07-28', -1, 1);
INSERT INTO `p_user` VALUES (11, '周三', 'zhu13', NULL, NULL, '$2a$10$Yk1wbPQ0bT8vFmTXhDfX9eTSkNLyAEC9F2j1ooNvV1hiGPkicaEL6', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1113%2F062120104501%2F200621104501-9-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1654402165&t=092f8bc20e2bd3d96ad47c35296b9158', 1, '2022-05-15', -1, 0);
INSERT INTO `p_user` VALUES (12, '周四', '3190112105', '17681295923', '', '$2a$10$1u2XG0KtecUyusTXB1aOKO/H08jUFldEef2uYd20zO8tbZD26217y', NULL, 1, '2022-05-13', -1, 0);
INSERT INTO `p_user` VALUES (13, '周五', '3190112106', '17681295923', '', '$2a$10$0wL0hpEDRemEgj8Ksyn7newbVB73dIF.eG56pp3EE5V8dua2zCrg6', NULL, 1, '2022-05-13', -1, 0);

-- ----------------------------
-- Table structure for p_user_role
-- ----------------------------
DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NULL DEFAULT NULL,
  `r_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_user_role
-- ----------------------------
INSERT INTO `p_user_role` VALUES (6, 1, 3);
INSERT INTO `p_user_role` VALUES (8, 3, 2);
INSERT INTO `p_user_role` VALUES (9, 3, 1);
INSERT INTO `p_user_role` VALUES (10, 2, 7);
INSERT INTO `p_user_role` VALUES (11, 4, 4);
INSERT INTO `p_user_role` VALUES (12, 5, 8);
INSERT INTO `p_user_role` VALUES (13, 6, 6);
INSERT INTO `p_user_role` VALUES (14, 7, 1);
INSERT INTO `p_user_role` VALUES (15, 11, 4);
INSERT INTO `p_user_role` VALUES (16, 11, 7);
INSERT INTO `p_user_role` VALUES (17, 11, 8);

-- ----------------------------
-- Procedure structure for beds_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `beds_insert`;
delimiter ;;
CREATE PROCEDURE `beds_insert`(IN in_building VARCHAR(128))
BEGIN
	DECLARE cap INT;
	DECLARE max_id INT;
	DECLARE in_bed INT DEFAULT 1;
	DECLARE in_dorm INT;
	DECLARE in_position VARCHAR(4);
	
-- 	插入的床号
	SET in_bed = 1;
-- 	开始插入的寝室ID
	SELECT min(id) FROM p_dorm WHERE building_id = in_building INTO in_dorm;
-- 	容量
	SELECT DISTINCT capacity FROM p_dorm WHERE building_id = in_building INTO cap;
-- 	插入寝室的最大ID
	SELECT max(id) FROM p_dorm WHERE building_id = in_building INTO max_id;
	
	SET autocommit = 0;
	START TRANSACTION;
	
	WHILE in_dorm <= max_id DO
		IF in_bed = cap+1 THEN 
			SET in_bed = 1;
			SET in_dorm = in_dorm + 1;
		END IF;
		
		CASE 
			WHEN in_bed=1 THEN SET in_position = 'ld';
			WHEN in_bed=2 THEN SET in_position = 'lu';
			WHEN in_bed=3 THEN SET in_position = 'ru';
			WHEN in_bed=4 THEN SET in_position = 'rd';
			
			WHEN in_bed=5 THEN SET in_position = 'l';
			WHEN in_bed=6 THEN SET in_position = 'r';
			ELSE SET in_position = '';
		END CASE;

		INSERT INTO p_bed(dorm_id, bed_num, position) VALUES(in_dorm, in_bed + '', in_position);
		SET in_bed = in_bed + 1;
	END WHILE;
	
	COMMIT;
	SET autocommit = 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for dorm_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `dorm_insert`;
delimiter ;;
CREATE PROCEDURE `dorm_insert`(IN building VARCHAR(20), IN floor INT, IN cap INT)
BEGIN
DECLARE inser_dorm_id INT;
DECLARE insert_floor INT;
SET inser_dorm_id = 101;
SET insert_floor = 1; 

WHILE insert_floor < floor DO
	INSERT INTO p_dorm(building_id, dorm_id, floor,capacity) VALUES(building, inser_dorm_id+'',insert_floor, cap);
	
	SET inser_dorm_id = inser_dorm_id + 1;
	IF MOD(inser_dorm_id,100) = 19 THEN
		SET inser_dorm_id = inser_dorm_id + 82;
		SET insert_floor = insert_floor + 1;
	END if;
END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
