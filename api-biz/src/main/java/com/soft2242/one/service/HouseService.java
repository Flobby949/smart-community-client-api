package com.soft2242.one.service;

import com.soft2242.one.entity.House;
import com.soft2242.one.mybatis.service.BaseService;

import java.util.List;

/**
 * @author : JinChenXing
 * @program : community-client-api
 * @description :
 * @create : 2023-05-31 08:56
 **/

public interface HouseService extends BaseService<House> {
    List<House> myHouse(Long userId);

    void deleteHouse(Long userId,String houseId);
}
