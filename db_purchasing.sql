/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : db_purchasing

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 26/05/2022 09:29:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bu_plan
-- ----------------------------
DROP TABLE IF EXISTS `bu_plan`;
CREATE TABLE `bu_plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '采购计划id',
  `department_id` int(0) NULL DEFAULT NULL COMMENT '单位id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购计划名称',
  `total` double NULL DEFAULT NULL COMMENT '采购计划总额',
  `information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购计划信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202201053 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bu_plan
-- ----------------------------
INSERT INTO `bu_plan` VALUES (202201047, 1, '财政局关于办公家具的采购计划', 10, '本单位需要采购10套办公桌椅，总计10万元。');
INSERT INTO `bu_plan` VALUES (202201053, 8, '城管局关于采购办公设备的计划', 5, '本单位需要采购10台电脑，总计5万元。');

-- ----------------------------
-- Table structure for ex_cancel
-- ----------------------------
DROP TABLE IF EXISTS `ex_cancel`;
CREATE TABLE `ex_cancel`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '退货编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退货名称',
  `department_id` int(0) NULL DEFAULT NULL COMMENT '单位名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '退货金额',
  `date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '退货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_cancel
-- ----------------------------

-- ----------------------------
-- Table structure for ex_document
-- ----------------------------
DROP TABLE IF EXISTS `ex_document`;
CREATE TABLE `ex_document`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '合同编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '合同名称',
  `department_id` int(0) NULL DEFAULT NULL COMMENT '单位名称',
  `information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '合同信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_document
-- ----------------------------
INSERT INTO `ex_document` VALUES (1, '城管局关于办公办公设备的采购', 8, '本次采购两台电脑，一台打印机总计9600元');
INSERT INTO `ex_document` VALUES (2, '财政局关于办公用品的采购', 1, '本次办公用品采购总额为2560元');

-- ----------------------------
-- Table structure for ex_purchase
-- ----------------------------
DROP TABLE IF EXISTS `ex_purchase`;
CREATE TABLE `ex_purchase`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '采购编号',
  `department_id` int(0) NULL DEFAULT NULL COMMENT '采购单位',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品数量',
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '总金额',
  `date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_purchase
-- ----------------------------
INSERT INTO `ex_purchase` VALUES (1, 1, '装订机', 20.00, '2', '40', '2022-04-11 00:00:00');
INSERT INTO `ex_purchase` VALUES (9, 8, '文件框', 20.00, '10', '400', '2022-04-11 00:00:00');

-- ----------------------------
-- Table structure for info_dept
-- ----------------------------
DROP TABLE IF EXISTS `info_dept`;
CREATE TABLE `info_dept`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '机构代码',
  `actor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位性质',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位地址',
  `charger` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购负责人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位邮箱',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '办公电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_dept
-- ----------------------------
INSERT INTO `info_dept` VALUES (1, '财政局', '2233', '国家机关', '花园路22号', '明湖', '15477889955', '12223', '9876789');
INSERT INTO `info_dept` VALUES (8, '城管局', '4455', '国家机关', '明湖路56号', '王杰', '13566997745', 'cgj@163.com', '6021145');

-- ----------------------------
-- Table structure for info_dept_type
-- ----------------------------
DROP TABLE IF EXISTS `info_dept_type`;
CREATE TABLE `info_dept_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性质名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_dept_type
-- ----------------------------
INSERT INTO `info_dept_type` VALUES (1, '国家机关');
INSERT INTO `info_dept_type` VALUES (2, '事业单位');
INSERT INTO `info_dept_type` VALUES (3, '群众团体');
INSERT INTO `info_dept_type` VALUES (4, '政协机关');
INSERT INTO `info_dept_type` VALUES (5, '人大机关');
INSERT INTO `info_dept_type` VALUES (6, '其他机关');

-- ----------------------------
-- Table structure for info_good
-- ----------------------------
DROP TABLE IF EXISTS `info_good`;
CREATE TABLE `info_good`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品类型',
  `supplier_id` int(0) NULL DEFAULT NULL COMMENT '供应商id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_good
-- ----------------------------
INSERT INTO `info_good` VALUES (1, '粉盒', 260.00, '货物类', 101001);
INSERT INTO `info_good` VALUES (3, '联想笔记本电脑', 5660.00, '货物类', 101010);
INSERT INTO `info_good` VALUES (5, '打印机', 5600.00, '货物类', 101002);
INSERT INTO `info_good` VALUES (6, '扫描仪', 4500.00, '货物类', 101002);
INSERT INTO `info_good` VALUES (7, 'A4复印纸', 45.00, '货物类', 101001);
INSERT INTO `info_good` VALUES (10, '复印机', 4560.00, '货物类', 101002);
INSERT INTO `info_good` VALUES (16, '黑色签字笔', 2.00, '货物类', 101010);
INSERT INTO `info_good` VALUES (17, '文件夹', 15.00, '货物类', 101010);
INSERT INTO `info_good` VALUES (18, '墨盒', 560.00, '货物类', 101001);

-- ----------------------------
-- Table structure for info_good_type
-- ----------------------------
DROP TABLE IF EXISTS `info_good_type`;
CREATE TABLE `info_good_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_good_type
-- ----------------------------
INSERT INTO `info_good_type` VALUES (1, '货物类');
INSERT INTO `info_good_type` VALUES (2, '服务类');
INSERT INTO `info_good_type` VALUES (3, '工程类');

-- ----------------------------
-- Table structure for info_supplier
-- ----------------------------
DROP TABLE IF EXISTS `info_supplier`;
CREATE TABLE `info_supplier`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `supplier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '对接负责人',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商邮箱',
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_supplier
-- ----------------------------
INSERT INTO `info_supplier` VALUES (101001, '应天有限公司', '黄公路', '鹰洋', '15897462255', 'yingtian@163.com', '456789369');
INSERT INTO `info_supplier` VALUES (101002, '黄宇有限公司', '科苑路', '黄宇', '15466998877', 'huangyu2@123.com', '457899665');
INSERT INTO `info_supplier` VALUES (101010, '杨帆有限公司', '绿化路', '杨帆', '15632457896', '5647', '123456');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'home', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES (2, 'exchange', 'el-icon-star-on', 'icon');
INSERT INTO `sys_dict` VALUES (3, 'plan', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` VALUES (4, 'order', 'el-icon-shopping-bag-1', 'icon');
INSERT INTO `sys_dict` VALUES (5, 'document', 'el-icon-document-copy', 'icon');
INSERT INTO `sys_dict` VALUES (6, 'returngoods', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` VALUES (7, 'data', 'el-icon-s-data', 'icon');
INSERT INTO `sys_dict` VALUES (8, 'department', 'el-icon-office-building', 'icon');
INSERT INTO `sys_dict` VALUES (9, 'supplier', 'el-icon-user-solid', 'icon');
INSERT INTO `sys_dict` VALUES (10, 'good', 'el-icon-s-goods', 'icon');
INSERT INTO `sys_dict` VALUES (11, 'tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` VALUES (12, 'user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES (13, 'file', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES (14, 'role', 'el-icon-key', 'icon');
INSERT INTO `sys_dict` VALUES (15, 'menu', 'el-icon-menu', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小(KB)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (57, '559589d7204948f49bff30ed452ef643.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 1, 0);
INSERT INTO `sys_file` VALUES (58, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 0, 1);
INSERT INTO `sys_file` VALUES (59, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 1, 1);
INSERT INTO `sys_file` VALUES (60, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (61, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (62, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (63, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 0, 1);
INSERT INTO `sys_file` VALUES (64, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 0, 1);
INSERT INTO `sys_file` VALUES (65, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (66, '新建 Microsoft Word 文档.docx', 'docx', 51, 'http://localhost:9090/file/23f9d01da0884493a285b5d7473461d1.docx', 'c38c725432e2ed5561d30ad0618736a0', 1, 1);
INSERT INTO `sys_file` VALUES (67, '习总书记“七一”重要讲话.docx', 'docx', 23, 'http://localhost:9090/file/424509c92fd54adc893b1874337f0cec.docx', 'e71815518a477fff4ab30a9374fd05d5', 0, 1);
INSERT INTO `sys_file` VALUES (68, '新建文本文档.txt', 'txt', 2, 'http://localhost:9090/file/541a746fbc104230bceae348fda5597a.txt', 'edddf536b95a37196f5e199a27925753', 0, 1);
INSERT INTO `sys_file` VALUES (69, '2fb03a6584f24901acc5e02d19ece787_th.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 0, 1);
INSERT INTO `sys_file` VALUES (70, '2fb03a6584f24901acc5e02d19ece787_th.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 0, 1);
INSERT INTO `sys_file` VALUES (71, '2fb03a6584f24901acc5e02d19ece787_th.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 0, 0);
INSERT INTO `sys_file` VALUES (72, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (73, '2fb03a6584f24901acc5e02d19ece787_th.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 0, 1);
INSERT INTO `sys_file` VALUES (74, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (75, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 1, 1);
INSERT INTO `sys_file` VALUES (76, '2fb03a6584f24901acc5e02d19ece787_th.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 1, 1);
INSERT INTO `sys_file` VALUES (77, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 1, 1);
INSERT INTO `sys_file` VALUES (78, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1);
INSERT INTO `sys_file` VALUES (79, '541a746fbc104230bceae348fda5597a.txt', 'txt', 2, 'http://localhost:9090/file/541a746fbc104230bceae348fda5597a.txt', 'edddf536b95a37196f5e199a27925753', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `p_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1913163778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (-2004312062, '机构管理', '/department', 'Department', 'el-icon-office-building', '机构管理', -1534550015, 8);
INSERT INTO `sys_menu` VALUES (-1534550015, '信息管理', NULL, NULL, 'el-icon-s-data', '信息管理', NULL, 7);
INSERT INTO `sys_menu` VALUES (-1471639550, '用户管理', '/user', 'User', 'el-icon-user', '用户管理', 768118785, 12);
INSERT INTO `sys_menu` VALUES (-1450663935, '商品管理', '/good', 'Good', 'el-icon-s-goods', '商品管理', -1534550015, 10);
INSERT INTO `sys_menu` VALUES (-989294590, '主页', '/home', 'Home', 'el-icon-house', '主页', NULL, 1);
INSERT INTO `sys_menu` VALUES (-897015806, '采购计划', '/plan', 'Plan', 'el-icon-tickets', '采购计划', NULL, 2);
INSERT INTO `sys_menu` VALUES (-678911999, '采购管理', '/order', 'Order', 'el-icon-shopping-bag-1', '订单管理', 1892196354, 4);
INSERT INTO `sys_menu` VALUES (394825730, '文件管理', '/file', 'File', 'el-icon-document-copy', '文件管理', 768118785, 13);
INSERT INTO `sys_menu` VALUES (768118785, '系统管理', NULL, NULL, 'el-icon-s-tools', '系统管理', NULL, 11);
INSERT INTO `sys_menu` VALUES (1380491265, '合同管理', '/document', 'Document', 'el-icon-document-copy', '合同管理', 1892196354, 5);
INSERT INTO `sys_menu` VALUES (1426624513, '角色管理', '/role', 'Role', 'el-icon-key', '角色管理', 768118785, 14);
INSERT INTO `sys_menu` VALUES (1548263426, '供应商管理', '/supplier', 'Supplier', 'el-icon-user-solid', '供应商管理', -1534550015, 9);
INSERT INTO `sys_menu` VALUES (1846059009, '履约管理', '/return', 'Return', 'el-icon-shopping-cart-1', '履约管理', 1892196354, 6);
INSERT INTO `sys_menu` VALUES (1892196354, '交易管理', NULL, NULL, 'el-icon-star-on', '交易管理', NULL, 3);
INSERT INTO `sys_menu` VALUES (1913163778, '菜单管理', '/menu', 'Menu', 'el-icon-menu', '菜单管理', 768118785, 15);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (0000000001, '超级管理员', 'ROLE_ADMIN', '超级管理员');
INSERT INTO `sys_role` VALUES (0000000006, '单位管理员', 'Department', '单位管理员');
INSERT INTO `sys_role` VALUES (0000000007, '供应商', 'Supplier', '供应商');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `menu_id` int(0) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, -2004312062);
INSERT INTO `sys_role_menu` VALUES (1, -1534550015);
INSERT INTO `sys_role_menu` VALUES (1, -1471639550);
INSERT INTO `sys_role_menu` VALUES (1, -1450663935);
INSERT INTO `sys_role_menu` VALUES (1, -989294590);
INSERT INTO `sys_role_menu` VALUES (1, -897015806);
INSERT INTO `sys_role_menu` VALUES (1, -678911999);
INSERT INTO `sys_role_menu` VALUES (1, 394825730);
INSERT INTO `sys_role_menu` VALUES (1, 768118785);
INSERT INTO `sys_role_menu` VALUES (1, 1380491265);
INSERT INTO `sys_role_menu` VALUES (1, 1426624513);
INSERT INTO `sys_role_menu` VALUES (1, 1548263426);
INSERT INTO `sys_role_menu` VALUES (1, 1846059009);
INSERT INTO `sys_role_menu` VALUES (1, 1892196354);
INSERT INTO `sys_role_menu` VALUES (1, 1913163778);
INSERT INTO `sys_role_menu` VALUES (6, -989294590);
INSERT INTO `sys_role_menu` VALUES (6, -678911999);
INSERT INTO `sys_role_menu` VALUES (6, 1380491265);
INSERT INTO `sys_role_menu` VALUES (6, 1846059009);
INSERT INTO `sys_role_menu` VALUES (6, 1892196354);
INSERT INTO `sys_role_menu` VALUES (7, -1534550015);
INSERT INTO `sys_role_menu` VALUES (7, -1450663935);
INSERT INTO `sys_role_menu` VALUES (7, -989294590);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'user_id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名字',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '部门',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `ava` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin101', '明远', 'abc456', 'minghua@163.com', '13752632255', '明远路26号', '财政局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (3, 's10101', '风月', 'abc123', 'fengyue@163.com', '18456237899', '环园路45号', '供应商', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'Supplier');
INSERT INTO `sys_user` VALUES (4, 'd10101', '杜飞', 'abc123', 'dufei@163.com', '17455896632', '五原路45号', '城管局', '2022-04-13 00:00:00', 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', 'Department');
INSERT INTO `sys_user` VALUES (36, 'admin102', '黄宇', '123', '234566987@qq.com', '15698742235', '五华路98号', '教体局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (37, 'admin105', '刘玉婷', '123', 'yuting@123.com', '15896458692', '新源路14号', '财政局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (41, 'admin202', '阿林', 'abc123', '202@123.com', '17255664456', '环园路88号', '财政局', '2022-05-18 00:00:00', NULL, 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (42, 'd10102', '王雨', 'abc123', '506@123.com', '13255446699', '明辉路', '城管局', '2022-05-18 00:00:00', NULL, 'Department');
INSERT INTO `sys_user` VALUES (43, 's10103', '岳明', 'abc123', '702@123.com', '16788995566', '华林路26号', '信访局', '2022-05-18 00:00:00', NULL, 'Supplier');
INSERT INTO `sys_user` VALUES (45, 'admin303', '悦婷', 'abc123', '156223@123.com', '13575658945', '月华路45号', '财政局', '2022-05-20 22:04:31', NULL, NULL);
INSERT INTO `sys_user` VALUES (46, 'admin302', '悦华', 'abc123', '153@123.com', '13575655695', '月华路55号', '财政局', '2022-05-20 22:04:31', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
