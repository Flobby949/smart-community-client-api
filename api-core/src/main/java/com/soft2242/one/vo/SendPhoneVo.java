package com.soft2242.one.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-25 14:26
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SendPhoneVo {
    private String mobile;
    private Integer type;
}
