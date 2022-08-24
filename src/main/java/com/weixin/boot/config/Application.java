package com.weixin.boot.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:21
 */
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        //Tomcat、创建Spring容器
        SpringApplication.run(Application.class, args);
    }
}
