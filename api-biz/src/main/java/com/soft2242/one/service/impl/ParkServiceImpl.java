package com.soft2242.one.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.dao.ParkDao;
import com.soft2242.one.entity.Park;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.ParkQuery;
import com.soft2242.one.service.ParkService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ParkServiceImpl
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 18:22
 */
@Service
@AllArgsConstructor
public class ParkServiceImpl extends BaseServiceImpl<ParkDao, Park> implements ParkService {
    @Override
    public List<Park> getList() {
        ParkQuery query = new ParkQuery();
        List<Park> entityList = baseMapper.selectList(getWrapper(query));

        return entityList;
    }
    private Wrapper<Park> getWrapper(ParkQuery query) {
        LambdaQueryWrapper<Park> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(query.getParkName()), Park::getParkName, query.getParkName());
        return wrapper;
    }
}
