package com.soft2242.one.dao;

import com.soft2242.one.entity.Carport;
import com.soft2242.one.mybatis.dao.BaseDao;
import com.soft2242.one.vo.CarportVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @ClassName CarportDao
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 08:48
 */
@Mapper
public interface CarportDao extends BaseDao<Carport> {

    List<CarportVO> getList(Long ownerId);
    int update(Long ownerId);

    Long  getOwnerId(@Param("realName") String name,@Param("phone") String phone);

    Long getCarId(@Param("licence") String licence);
}
