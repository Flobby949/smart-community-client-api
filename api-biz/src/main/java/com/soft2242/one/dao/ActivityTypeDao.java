package com.soft2242.one.dao;


import com.soft2242.one.entity.ActivityType;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
* 活动分类
*
* @author 软件2242 soft2242@gmail.com
* @since 1.0.0 2023-05-25
*/
@Mapper
public interface ActivityTypeDao extends BaseDao<ActivityType> {
	
}