package com.soft2242.one.dao;


import com.soft2242.one.entity.SmsPhoneLogEntity;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;


/**
* 手机日志
*
* @author 软件2242 soft2242@gmail.com
* @since 1.0.0 2023-05-25
*/
@Mapper
public interface SmsPhoneLogDao extends BaseDao<SmsPhoneLogEntity> {
	
}