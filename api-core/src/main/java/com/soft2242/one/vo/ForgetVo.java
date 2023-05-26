package com.soft2242.one.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-25 14:26
 **/
@Data
@AllArgsConstructor
@Builder
public class ForgetVo {
    private String mobile;
    private String password;
    private String code;
}
