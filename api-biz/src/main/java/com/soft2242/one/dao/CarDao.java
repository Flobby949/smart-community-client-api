package com.soft2242.one.dao;

import com.soft2242.one.entity.Car;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-06-01 12:55
 **/
@Mapper
public interface CarDao extends BaseDao<Car> {
}
