package com.weixin.boot.sample.domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @author 王庆丰
 * @version 1.0
 * @date 2021/12/22 14:46
 */
@Data
public class Sample {
    private int id;

    private String name;

    private String nation;

    private Date birthday;

    private float height;

    private String phone;

    private String email;

    private String hobbies;

    private String sex;

    private MultipartFile photo;

    private String photoPath;

    private String selfIntro;
}
