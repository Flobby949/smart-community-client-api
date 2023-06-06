package com.soft2242.one.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.convert.CarportConvert;
import com.soft2242.one.convert.CarsConvert;
import com.soft2242.one.dao.ActivityDao;
import com.soft2242.one.dao.CarportDao;
import com.soft2242.one.dao.CarsDao;
import com.soft2242.one.entity.Carport;
import com.soft2242.one.entity.Cars;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.CarsQuery;
import com.soft2242.one.service.CarsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CarsServiceImpl
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:26
 */
@Service
@AllArgsConstructor
public class CarsServiceImpl extends BaseServiceImpl<CarsDao, Cars> implements CarsService {
    private final CarsDao carsDao;
    private final ActivityDao activityDao;
    @Override
    public List<Cars> myCar(Long userId) {
        LambdaQueryWrapper<Cars> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Cars::getUserId, userId);
        List<Cars> entityList = carsDao.getList(userId);

        return entityList;
    }

    @Override
    public boolean save(Cars vo) {
        Cars entity = vo;
        baseMapper.insert(entity);
        return true;
    }

    private Wrapper<Cars> getWrapper(CarsQuery query) {
        LambdaQueryWrapper<Cars> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(query.getLicence()), Cars::getLicence, query.getLicence());
        return wrapper;
    }
}
