package com.soft2242.one.enums;

import lombok.Getter;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-25 15:08
 **/
@Getter
public enum Platform {
    ALIYUN(1,"阿里云"),
    TENCENT(2,"腾讯云"),
    HUAWEI(3,"华为云");
    private Integer code;
    private String name;

    Platform(Integer code, String name) {
        this.code = code;
        this.name = name;
    }
}
