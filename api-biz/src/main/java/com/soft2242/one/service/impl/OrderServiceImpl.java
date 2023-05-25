package com.soft2242.one.service.impl;

import com.soft2242.one.entity.Order;
import com.soft2242.one.dao.OrderMapper;
import com.soft2242.one.service.IOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

}
