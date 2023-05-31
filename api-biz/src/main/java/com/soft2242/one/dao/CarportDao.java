package com.soft2242.one.dao;

import com.soft2242.one.entity.Carport;
import com.soft2242.one.mybatis.dao.BaseDao;
import com.soft2242.one.vo.CarportVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

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

}
