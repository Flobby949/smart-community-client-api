package com.soft2242.one.service;

import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.vo.MyFamilyVo;
import com.soft2242.one.vo.MyHouseListVo;

import java.util.List;

/**
 * @ClassName: OwnerService
 * @Author: lsc
 * @Date: 2023/05/25/13:31
 */
public interface OwnerService extends BaseService<OwnerEntity> {
    List<MyHouseListVo> findMyHouseById(Long userId);
    List<MyFamilyVo> findFamily(Long houseId);
    boolean deleteFamily (Long id,Long userId);
}
