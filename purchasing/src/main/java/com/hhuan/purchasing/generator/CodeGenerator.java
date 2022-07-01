package com.hhuan.purchasing.generator;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;

import java.util.Collections;

public class CodeGenerator {
    public static void main(String[] args) {
        generate();
    }

    private static void generate() {
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/db_purchasing?serverTimezone=GMT%2b8", "root", "abc123")
                .globalConfig(builder -> {
                    builder.author("yingliu") // 设置作者
                            .enableSwagger() // 开启 swagger 模式
                            .fileOverride() // 覆盖已生成文件
                            .outputDir("E:\\20188714\\lzy\\purchasing\\src\\main\\java\\"); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent("com.yingliu.purchasing") // 设置父包名
                            .moduleName(null) // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "E:\\20188714\\lzy\\purchasing\\src\\main\\resources\\mapper\\")); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.entityBuilder().enableLombok();
                    // builder.mapperBuilder().enableMapperAnnotation().build();
                    builder.controllerBuilder().enableHyphenStyle() // 开启驼峰转连字符
                            .enableRestStyle(); // 开启生成@RestController 控制器
                    builder.addInclude("sys_user", "sys_file", "sys_dict", "sys_menu", "sys_role", "sys_role_menu",
                            "info_supplier", "info_good", "info_good_type", "info_dept","info_dept_type",
                            "ex_cancel", "ex_document", "ex_purchase",
                            "bu_plan") // 设置需要生成的表名
                            .addTablePrefix("sys_", "info_","ex_","bu_"); // 设置过滤表前缀
                })
                // .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();

    }

}
