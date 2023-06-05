package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.convert.HouseConvert;
import com.soft2242.one.dao.HouseDao;
import com.soft2242.one.dao.OwnerDao;
import com.soft2242.one.entity.House;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.vo.HouseVO;
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
    public List<HouseVO> myHouse(Long userId, Integer status) {
        // 1.根据用户id去业主表查询业主id
        // 2.根据业主id查询出房屋id
        // 3.根据房屋id查询出房屋信息
        LambdaQueryWrapper<OwnerEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OwnerEntity::getUserId, userId);
        wrapper.eq(status != null, OwnerEntity::getState, status);
        List<OwnerEntity> ownerEntityList = ownerDao.selectList(wrapper);
        if (ownerEntityList.isEmpty()) {
            return null;
        } else {
            return ownerEntityList.stream().map(item -> {
                House house = baseMapper.selectById(item.getHouseId());
                HouseVO vo = HouseConvert.INSTANCE.convert(house);
                vo.setOwnerId(item.getId());
                return vo;
            }).toList();
        }
    }

    @Override
    public void deleteHouse(Long userId, String houseId) {
        LambdaQueryWrapper<OwnerEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(OwnerEntity::getOwnerId, userId);
        wrapper.eq(OwnerEntity::getHouseId, houseId);
        ownerDao.delete(wrapper);
    }

    @Override
    public List<House> allBuilding(String communityId) {
        LambdaQueryWrapper<House> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(House::getCommunityId, communityId);
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<House> allUnit(String communityId, String buildingId) {
        LambdaQueryWrapper<House> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(House::getBuildingId, buildingId);
        wrapper.eq(House::getCommunityId, communityId);
        return baseMapper.selectList(wrapper);
    }

    @Override
    public List<House> allHouseByUnit(String communityId, String buildingId, String unit) {
        LambdaQueryWrapper<House> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(House::getBuildingId, buildingId);
        wrapper.eq(House::getCommunityId, communityId);
        wrapper.eq(House::getUnits, unit);
        return baseMapper.selectList(wrapper);
    }

    @Override
    public void saveHouse(OwnerEntity owner) {
        owner.setRealName(owner.getRealName());
        owner.setUserId(SecurityUser.getUserId());
        owner.setIdentity(1);
        owner.setState(1);
        ownerDao.insert(owner);
    }

}
