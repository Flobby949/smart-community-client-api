package com.soft2242.one.dao;

import com.soft2242.one.entity.House;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description : 房屋
 * @create : 2023-05-31 08:55
 **/
@Mapper
public interface HouseDao extends BaseDao<House> {
}
