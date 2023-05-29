package com.soft2242.one.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @ClassName: MyFamilyVo
 * @Author: lsc
 * @Date: 2023/05/25/15:24
 */
@Data
@Schema(description = "家庭成员信息")
public class MyFamilyVo {
    /**
     * id
     */
    private Long id;
    /**
     * 姓名
     */
    private String realName;
    /**
     * 是否注册
     */
    private String isRegister;
    /**
     * 手机
     */
    private String phone;
    /**
     * 身份标识(0:业主 1:家属 2:租户)
     */
    private Integer identity;

}
