package com.soft2242.one.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.dao.CommunityDao;
import com.soft2242.one.entity.Community;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.CommunityQuery;
import com.soft2242.one.service.CommunityService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CommunityServiceImpl
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:37
 */
@Service
@AllArgsConstructor
public class CommunityServiceImpl extends BaseServiceImpl<CommunityDao, Community> implements CommunityService {
    private Wrapper<Community> getWrapper(CommunityQuery query) {
        LambdaQueryWrapper<Community> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(query.getCommunityName()), Community::getCommunityName, query.getCommunityName());
        wrapper.like(StrUtil.isNotBlank(query.getAddress()), Community::getAddress, query.getAddress());
        return wrapper;
    }

    @Override
    public List<Community> getList() {
        CommunityQuery query = new CommunityQuery();
        List<Community> entityList = baseMapper.selectList(getWrapper(query));
        return entityList;
    }
}
