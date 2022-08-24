package com.weixin.boot.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:49
 */
@Configuration
@ComponentScan("com.weixin.boot.**.service")
public class RootConfig {
}
