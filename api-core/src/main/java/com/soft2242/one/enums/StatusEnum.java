package com.soft2242.one.enums;

import lombok.Getter;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-25 15:17
 **/
@Getter
public enum StatusEnum {
    SUCCESS(0, "成功"),
    FAIL(1, "失败");

    private Integer code;
    private String name;

    StatusEnum(Integer code, String name) {
        this.code = code;
        this.name = name;
    }
    }
