package com.soft2242.one.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.soft2242.one.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;


/**
 * 短信验证码表
 *
 * @author 软件2242 soft2242@gmail.com
 * @since 1.0.0 2023-05-25
 */
@EqualsAndHashCode(callSuper = false)
@Data
@TableName("sms_phone")
public class SmsPhoneEntity extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;


    /**
     * 手机号
     */
    private String phone;

    /**
     * 验证码
     */
    private String code;


    /**
     * 状态
     */
    private Integer status;

    /**
     * 错误信息
     */
    private String error;

    /**
     * 平台类型
     */
    private Integer platform;

}