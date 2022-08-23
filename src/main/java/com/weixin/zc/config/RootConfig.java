package com.weixin.zc.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/25 11:51
 */
@Configuration
@ComponentScan("com.weixin.zc.**.service")
public class RootConfig {
}
