package com.weixin.boot.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/24 16:44
 */
@Configuration
@MapperScan("com.weixin.boot.**.dao")
public class MybatisConfig {
}
