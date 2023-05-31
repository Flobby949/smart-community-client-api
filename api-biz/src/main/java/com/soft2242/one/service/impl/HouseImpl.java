package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.dao.HouseDao;
import com.soft2242.one.dao.OwnerDao;
import com.soft2242.one.entity.House;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.service.HouseService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-31 08:56
 **/
@Service
@AllArgsConstructor
@Slf4j
public class HouseImpl extends BaseServiceImpl<HouseDao, House> implements HouseService {
    private final OwnerDao ownerDao;

    @Override
    public List<House> myHouse(Long userId) {
        // 1.根据用户id去业主表查询业主id
        // 2.根据业主id查询出房屋id
        // 3.根据房屋id查询出房屋信息
        LambdaQueryWrapper<OwnerEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OwnerEntity::getOwnerId, userId);
        List<OwnerEntity> ownerEntityList = ownerDao.selectList(wrapper);
        if (ownerEntityList.size() == 0) {
            return null;
        } else {
            List<Long> longList = ownerEntityList.stream().map(item -> item.getHouseId()).collect(Collectors.toList());
            LambdaQueryWrapper<House> wrapper1 = new LambdaQueryWrapper<>();
            wrapper1.in(House::getId, longList);
            List<House> houseList = baseMapper.selectList(wrapper1);
            houseList.forEach(item -> item.setIsOwner(1));
            return houseList;
        }
    }

    @Override
    public void deleteHouse(Long userId, String houseId) {
        LambdaQueryWrapper<OwnerEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OwnerEntity::getOwnerId, userId);
        wrapper.eq(OwnerEntity::getHouseId, houseId);
        ownerDao.delete(wrapper);
    }
}
