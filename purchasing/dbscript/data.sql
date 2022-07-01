SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ( 1, 'home', 'el-icon-house', 'icon' );
INSERT INTO `sys_dict` VALUES ( 2, 'exchange', 'el-icon-star-on', 'icon' );
INSERT INTO `sys_dict` VALUES ( 3, 'plan', 'el-icon-tickets', 'icon' );
INSERT INTO `sys_dict` VALUES ( 4, 'order', 'el-icon-shopping-bag-1', 'icon' );
INSERT INTO `sys_dict` VALUES ( 5, 'document', 'el-icon-document-copy', 'icon' );
INSERT INTO `sys_dict` VALUES ( 6, 'returngoods', 'el-icon-shopping-cart-1', 'icon' );
INSERT INTO `sys_dict` VALUES ( 7, 'data', 'el-icon-s-data', 'icon' );
INSERT INTO `sys_dict` VALUES ( 8, 'department', 'el-icon-office-building', 'icon' );
INSERT INTO `sys_dict` VALUES ( 9, 'supplier', 'el-icon-user-solid', 'icon' );
INSERT INTO `sys_dict` VALUES ( 10, 'good', 'el-icon-s-goods', 'icon' );
INSERT INTO `sys_dict` VALUES ( 11, 'tools', 'el-icon-s-tools', 'icon' );
INSERT INTO `sys_dict` VALUES ( 12, 'user', 'el-icon-user', 'icon' );
INSERT INTO `sys_dict` VALUES ( 13, 'file', 'el-icon-notebook-2', 'icon' );
INSERT INTO `sys_dict` VALUES ( 14, 'role', 'el-icon-key', 'icon' );
INSERT INTO `sys_dict` VALUES ( 15, 'menu', 'el-icon-menu', 'icon' );

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ( 57, '559589d7204948f49bff30ed452ef643.jpeg', 'jpeg', 14, 'http://localhost:9090/file/bb651349c6934c1981888ed1e7e8c92b.jpeg', 'aa9f439697e17ec8b4394ddbb6bba5b0', 1, 0 );
INSERT INTO `sys_file` VALUES ( 58, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 0, 1 );
INSERT INTO `sys_file` VALUES ( 59, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 1, 1 );
INSERT INTO `sys_file` VALUES ( 60, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1 );
INSERT INTO `sys_file` VALUES ( 61, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1 );
INSERT INTO `sys_file` VALUES ( 62, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1 );
INSERT INTO `sys_file` VALUES ( 63, 't013f5efcfb02eba705.jpg', 'jpg', 13, 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', '33b712bf82bdf2f31378f7ae02d5f7a3', 0, 1 );
INSERT INTO `sys_file` VALUES ( 64, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 0, 1 );
INSERT INTO `sys_file` VALUES ( 65, 't01736c309615e3dc19.jpg', 'jpg', 8, 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'a1f3452ed4f0aaaec6ca539cb6c49883', 1, 1 );
INSERT INTO `sys_file` VALUES ( 66, '新建 Microsoft Word 文档.docx', 'docx', 51, 'http://localhost:9090/file/23f9d01da0884493a285b5d7473461d1.docx', 'c38c725432e2ed5561d30ad0618736a0', 1, 1 );
INSERT INTO `sys_file` VALUES ( 67, '习总书记“七一”重要讲话.docx', 'docx', 23, 'http://localhost:9090/file/424509c92fd54adc893b1874337f0cec.docx', 'e71815518a477fff4ab30a9374fd05d5', 0, 1 );

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (- 2004312062, '机构管理', '/department', 'Department', 'el-icon-office-building', '机构管理', - 1534550015, 8 );
INSERT INTO `sys_menu` VALUES (- 1534550015, '信息管理', NULL, NULL, 'el-icon-s-data', '信息管理', NULL, 7 );
INSERT INTO `sys_menu` VALUES (- 1471639550, '用户管理', '/user', 'User', 'el-icon-user', '用户管理', 768118785, 12 );
INSERT INTO `sys_menu` VALUES (- 1450663935, '商品管理', '/good', 'Good', 'el-icon-s-goods', '商品管理', - 1534550015, 10 );
INSERT INTO `sys_menu` VALUES (- 989294590, '主页', '/home', 'Home', 'el-icon-house', '主页', NULL, 1 );
INSERT INTO `sys_menu` VALUES (- 897015806, '采购计划', '/plan', 'Plan', 'el-icon-tickets', '采购计划', NULL, 2 );
INSERT INTO `sys_menu` VALUES (- 678911999, '采购管理', '/order', 'Order', 'el-icon-shopping-bag-1', '订单管理', 1892196354, 4 );
INSERT INTO `sys_menu` VALUES ( 394825730, '文件管理', '/file', 'File', 'el-icon-document-copy', '文件管理', 768118785, 13 );
INSERT INTO `sys_menu` VALUES ( 768118785, '系统管理', NULL, NULL, 'el-icon-s-tools', '系统管理', NULL, 11 );
INSERT INTO `sys_menu` VALUES ( 1380491265, '合同管理', '/document', 'Document', 'el-icon-document-copy', '合同管理', 1892196354, 5 );
INSERT INTO `sys_menu` VALUES ( 1426624513, '角色管理', '/role', 'Role', 'el-icon-key', '角色管理', 768118785, 14 );
INSERT INTO `sys_menu` VALUES ( 1548263426, '供应商管理', '/supplier', 'Supplier', 'el-icon-user-solid', '供应商管理', - 1534550015, 9 );
INSERT INTO `sys_menu` VALUES ( 1846059009, '履约管理', '/return', 'Return', 'el-icon-shopping-cart-1', '履约管理', 1892196354, 6 );
INSERT INTO `sys_menu` VALUES ( 1892196354, '交易管理', NULL, NULL, 'el-icon-star-on', '交易管理', NULL, 3 );
INSERT INTO `sys_menu` VALUES ( 1913163778, '菜单管理', '/menu', 'Menu', 'el-icon-menu', '菜单管理', 768118785, 15 );

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ( 0000000001, '超级管理员', 'ROLE_ADMIN', '超级管理员' );
INSERT INTO `sys_role` VALUES ( 0000000002, '普通用户', 'ROLE_USER', '普通用户' );
INSERT INTO `sys_role` VALUES ( 0000000006, '单位管理员', 'Department', '单位管理员' );
INSERT INTO `sys_role` VALUES ( 0000000007, '供应商', 'Supplier', '供应商' );

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ( 1, - 2004312062 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 1534550015 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 1471639550 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 1450663935 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 989294590 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 897015806 );
INSERT INTO `sys_role_menu` VALUES ( 1, - 678911999 );
INSERT INTO `sys_role_menu` VALUES ( 1, 394825730 );
INSERT INTO `sys_role_menu` VALUES ( 1, 768118785 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1380491265 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1426624513 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1548263426 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1846059009 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1892196354 );
INSERT INTO `sys_role_menu` VALUES ( 1, 1913163778 );
INSERT INTO `sys_role_menu` VALUES ( 6, - 1534550015 );
INSERT INTO `sys_role_menu` VALUES ( 6, - 1450663935 );
INSERT INTO `sys_role_menu` VALUES ( 6, - 989294590 );
INSERT INTO `sys_role_menu` VALUES ( 6, - 678911999 );
INSERT INTO `sys_role_menu` VALUES ( 6, 1380491265 );
INSERT INTO `sys_role_menu` VALUES ( 6, 1548263426 );
INSERT INTO `sys_role_menu` VALUES ( 6, 1846059009 );
INSERT INTO `sys_role_menu` VALUES ( 6, 1892196354 );
INSERT INTO `sys_role_menu` VALUES ( 7, - 1534550015 );
INSERT INTO `sys_role_menu` VALUES ( 7, - 1450663935 );
INSERT INTO `sys_role_menu` VALUES ( 7, - 989294590 );

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ( 1, 'admin101', '明华', 'abc123', 'minghua@163.com', '13752632255', '明远路26号', '财政局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN' );
INSERT INTO `sys_user` VALUES ( 2, 'u10101', '王艳', 'abc123', 'wangyan@123.com', '15623456698', '环宇路56号', '财政局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_USER' );
INSERT INTO `sys_user` VALUES ( 3, 's10101', '风月', 'abc123', 'fengyue@163.com', '18456237899', '环园路45号', '供应商', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'Supplier' );
INSERT INTO `sys_user` VALUES ( 4, 'd10101', '杜飞', 'abc123', 'dufei@163.com', '17455896632', '五原路45号', '城管局', '2022-04-13 00:00:00', 'http://localhost:9090/file/10f7041650284423b7d2fdde889bf0af.jpg', 'Department' );
INSERT INTO `sys_user` VALUES ( 36, 'admin102', '黄宇', '123', '234566987@qq.com', '15698742235', '五华路98号', '教体局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN' );
INSERT INTO `sys_user` VALUES ( 37, 'admin105', '刘玉婷', '123', 'yuting@123.com', '15896458692', '新源路14号', '财政局', '2022-04-13 00:00:00', 'http://localhost:9090/file/c7cf1280e29e4ff3ae81f5c53ca67bda.jpg', 'ROLE_ADMIN' );

-- ----------------------------
-- Records of info_supplier
-- ----------------------------
INSERT INTO `info_supplier` VALUES (101001, '应天有限公司', '黄公路', '鹰洋', '15897462255', 'yingtian@163.com', '456789369');
INSERT INTO `info_supplier` VALUES (101002, '黄宇有限公司', '科苑路', '黄宇', '15466998877', 'huangyu2@123.com', '457899665');
INSERT INTO `info_supplier` VALUES (101010, '杨帆有限公司', '绿化路', '杨帆', '15632457896', '5647', '123456');

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
-- Records of info_good_type
-- ----------------------------
INSERT INTO `info_good_type` VALUES (1, '货物类');
INSERT INTO `info_good_type` VALUES (2, '服务类');
INSERT INTO `info_good_type` VALUES (3, '工程类');

-- ----------------------------
-- Records of info_dept
-- ----------------------------
INSERT INTO `info_dept` VALUES (1, '财政局', '2233', '国家机关', '花园路22号', '明湖', '15477889955', '12223', '9876789');
INSERT INTO `info_dept` VALUES (8, '城管局', '4455', '国家机关', '明湖路56号', '王杰', '13566997745', 'cgj@163.com', '6061223');


-- ----------------------------
-- Records of info_dept
-- ----------------------------
INSERT INTO `info_dept_type` VALUES (1, '国家机关');
INSERT INTO `info_dept_type` VALUES (2, '事业单位');
INSERT INTO `info_dept_type` VALUES (3, '群众团体');
INSERT INTO `info_dept_type` VALUES (4, '政协机关');
INSERT INTO `info_dept_type` VALUES (5, '人大机关');
INSERT INTO `info_dept_type` VALUES (6, '其他机关');

-- ----------------------------
-- Records of ex_cancel
-- ----------------------------


-- ----------------------------
-- Records of ex_document
-- ----------------------------
INSERT INTO `ex_document` VALUES (1, '城管局关于办公办公设备的采购', 8, '本次采购两台电脑，一台打印机总计9600元');
INSERT INTO `ex_document` VALUES (2, '财政局关于办公用品的采购', 1, '本次办公用品采购总额为2560元');

-- ----------------------------
-- Records of ex_purchase
-- ----------------------------
INSERT INTO `ex_purchase` VALUES (1, 1, '装订机', 20.00, '2', '40', '2022-04-11 00:00:00');
INSERT INTO `ex_purchase` VALUES (9, 8, '文件框', 20.00, '10', '400', '2022-04-11 00:00:00');

-- ----------------------------
-- Records of bu_plan
-- ----------------------------
INSERT INTO `bu_plan` VALUES (202201047, 1, '财政局关于办公家具的采购计划', 10, '本单位需要采购10套办公桌椅，总计10万元。');
INSERT INTO `bu_plan` VALUES (202201053, 8, '城管局关于采购办公设备的计划', 5, '本单位需要采购10台电脑，总计5万元。');



SET FOREIGN_KEY_CHECKS = 1;