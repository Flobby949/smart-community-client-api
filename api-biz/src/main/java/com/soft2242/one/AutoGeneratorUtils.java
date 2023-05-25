package com.soft2242.one;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Collections;

/**
 * 代码生成器工具类
 *
 * @author mqxu
 */
public class AutoGeneratorUtils {

    public static void main(String[] args) {
        String encode = new BCryptPasswordEncoder().encode("kobe24");
        System.out.println(encode);
        FastAutoGenerator.create("jdbc:mysql://106.14.246.27:3306/db_community", "root", "kobe24").globalConfig(builder -> {
                    builder.author("ysh") // 设置作者
                            .outputDir("C:\\Users\\James\\Desktop\\output"); // 指定输出目录
                }).packageConfig(builder -> {
                    builder.parent("com.soft2242.one") // 设置父包名
//                            .moduleName("com") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, "C:\\Users\\James\\Desktop\\output")); // 设置mapperXml生成路径
                }).strategyConfig(builder -> {
                    builder.addInclude("t_mall") // 设置需要生成的表名
                            .addTablePrefix("t_", "sys_"); // 设置过滤表前缀
                }).templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }
}
