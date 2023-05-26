package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.convert.OrderConvert;
import com.soft2242.one.entity.Order;
import com.soft2242.one.dao.OrderMapper;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.OrderQuery;
import com.soft2242.one.service.IOrderService;
import com.soft2242.one.vo.OrderVO;

import org.springframework.stereotype.Service;

/**
 * <p>
<<<<<<< HEAD
 * 服务实现类
=======
 *  服务实现类
>>>>>>> origin/test
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Service

public class OrderServiceImpl extends BaseServiceImpl<OrderMapper, Order> implements IOrderService {

    private LambdaQueryWrapper<Order> getWrapper(OrderQuery query) {
        LambdaQueryWrapper<Order> wrapper = Wrappers.lambdaQuery();
        return wrapper;
    }

    @Override
    public PageResult<OrderVO> page(OrderQuery query) {
        IPage<Order> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        return new PageResult<>(OrderConvert.INSTANCE.convertList(page.getRecords()), page.getTotal());
    }

    @Override
    public void save(OrderVO vo) {
        baseMapper.insert(OrderConvert.INSTANCE.convert(vo));
    }

    @Override
    public void update(OrderVO vo) {
        updateById(OrderConvert.INSTANCE.convert(vo));
    }

}
