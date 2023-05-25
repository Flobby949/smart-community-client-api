package com.soft2242.one.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.soft2242.one.mybatis.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;



/**
 * 手机日志
 *
 * @author 软件2242 soft2242@gmail.com
 * @since 1.0.0 2023-05-25
 */
@EqualsAndHashCode(callSuper=false)
@Data
@TableName("sms_phone_log")
public class SmsPhoneLogEntity extends BaseEntity {





	/**
	* ip地址
	*/
	private String ip;

	/**
	* 地址
	*/
	private String address;


	/**
	* 手机号
	*/
	private String phone;

	/**
	* 用户id
	*/
	private Long userid;

	/**
	* 设备token
	*/
	private String deviceToken;

	/**
	* 状态
	*/
	private Integer status;

	/**
	* 模板
	*/
	private String template;

	/**
	* 平台
	*/
	private Integer platform;

}