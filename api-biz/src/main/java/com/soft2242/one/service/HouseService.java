package com.soft2242.one.service;

import com.soft2242.one.entity.House;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.vo.HouseVO;

import java.util.List;

/**
 * @author : JinChenXing
 * @program : community-client-api
 * @description :
 * @create : 2023-05-31 08:56
 **/

public interface HouseService extends BaseService<House> {
    List<HouseVO> myHouse(Long userId, Integer status);

    void deleteHouse(Long userId,String houseId);

    List<House> allBuilding(String communityId);

    List<House> allUnit(String communityId,String buildingId);

    List<House> allHouseByUnit(String communityId, String buildingId, String unit);

    void saveHouse(OwnerEntity owner);

}
