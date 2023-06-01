package com.soft2242.one.dao;

import com.soft2242.one.entity.Cars;
import com.soft2242.one.mybatis.dao.BaseDao;
import com.soft2242.one.vo.CarportVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName CarsDao
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:24
 */
@Mapper
public interface CarsDao extends BaseDao<Cars> {
    List<Cars> getList(Long userId);
}
