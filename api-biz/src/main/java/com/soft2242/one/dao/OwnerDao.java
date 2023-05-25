package com.soft2242.one.dao;

import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.dao.BaseDao;
import com.soft2242.one.vo.MyFamilyVo;
import com.soft2242.one.vo.MyHouseListVo;

import java.util.List;

/**
 * @ClassName: OwnerDao
 * @Author: lsc
 * @Date: 2023/05/25/13:28
 */
public interface OwnerDao extends BaseDao<OwnerEntity> {
    List<MyHouseListVo> findMyHouseById(Long userId);
}
