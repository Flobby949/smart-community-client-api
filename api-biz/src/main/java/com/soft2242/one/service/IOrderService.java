package com.soft2242.one.service;

import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.query.BillQuery;
import com.soft2242.one.query.OrderQuery;
import com.soft2242.one.vo.BillVO;
import com.soft2242.one.vo.OrderVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
public interface IOrderService extends BaseService<Order> {
    PageResult<OrderVO> page( OrderQuery query);

    void save(OrderVO vo);

    void update(OrderVO vo);

}
