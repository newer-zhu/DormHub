package com.zhuhodor.app.generator;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

/**
 * 代码生成器
 */
public class MybatisPlusGenerator {
    /**
     * 执行 run
     */
    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("输入表名，空格隔开");
        String[] input = scanner.nextLine().split(" ");
        ArrayList<String> target = new ArrayList<>();
        for (String s : input)
            target.add(s);
        generate(target);
    }

    private static void generate(List<String> targets){
        FastAutoGenerator.create("jdbc:mysql://localhost:3306/pets?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai",
                "root", "20001030")
                .globalConfig(builder -> {
                    builder.author("zhuhodor")
                            .enableSwagger()
                            .fileOverride()
                            .commentDate("yyy-MM-dd")
                            .outputDir(System.getProperty("user.dir")+"\\pets-server\\src\\main\\java");
                })
                .packageConfig(builder -> {
                    builder.parent("com.zhuhodor")
                            .moduleName("server")
                            .entity("model.pojo")
                            .service("service")
                            .serviceImpl("service.impl")
                            .controller("controller")
                            .mapper("mapper")
                            .xml("mapper")
                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, System.getProperty("user.dir")+"\\pets-server\\src\\main\\resources\\mapper"));
                })
                .strategyConfig(builder -> {
                    builder.addInclude(targets)
                            .addTablePrefix("p_")
                            .serviceBuilder()
                            .formatServiceFileName("I%sService")
                            .formatServiceImplFileName("%sServiceImpl")
                            .entityBuilder()
                            .enableLombok()
                            .logicDeleteColumnName("deleted")
                            .enableTableFieldAnnotation()
                            .controllerBuilder()
                            .formatFileName("%sController")
                            .enableRestStyle()
                            .mapperBuilder()
                            .formatMapperFileName("%sMapper")
                            .enableMapperAnnotation()
                            .formatXmlFileName("%sMapper");
                })
                .templateEngine(new FreemarkerTemplateEngine())
                .execute();
    }
}
