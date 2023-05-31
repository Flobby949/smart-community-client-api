package com.soft2242.one.dao;

import com.soft2242.one.entity.Park;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @ClassName ParkDao
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:50
 */
@Mapper
public interface ParkDao extends BaseDao<Park> {
}
