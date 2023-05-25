package com.soft2242.one.dao;

import com.soft2242.one.entity.SmsPhoneEntity;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;


/**
* 短信验证码表
*
* @author 软件2242 soft2242@gmail.com
* @since 1.0.0 2023-05-25
*/
@Mapper
public interface SmsPhoneDao extends BaseDao<SmsPhoneEntity> {
	
}