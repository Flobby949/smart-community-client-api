package com.soft2242.one.service.impl;

import com.soft2242.one.dao.OwnerDao;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.vo.MyHouseListVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName: OwnerServiceImpl
 * @Author: lsc
 * @Date: 2023/05/25/13:34
 */
@Service
public class OwnerServiceImpl extends BaseServiceImpl<OwnerDao, OwnerEntity> implements OwnerService {
    @Override
    public List<MyHouseListVo> findMyHouseById(Long userId) {
        return baseMapper.findMyHouseById(userId);
    }
}
