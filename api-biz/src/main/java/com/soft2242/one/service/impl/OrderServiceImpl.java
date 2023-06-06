package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.convert.OrderConvert;
import com.soft2242.one.entity.House;
import com.soft2242.one.entity.Order;
import com.soft2242.one.dao.OrderMapper;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.OrderQuery;
import com.soft2242.one.service.CommunityService;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.service.IOrderService;
import com.soft2242.one.vo.OrderVO;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Service
@AllArgsConstructor

public class OrderServiceImpl extends BaseServiceImpl<OrderMapper, Order> implements IOrderService {
    private final CommunityService communityService;
    private final HouseService houseService;

    private String changeForm(LocalDateTime create, LocalDateTime end) {
        return create.toString().substring(0, 10) + "~" + end.toString().substring(0, 10);
    }

    private String orderTypeSelector(Integer id) {
//        订单类型 0：购买车位订单1：租赁车位订单2：停车订单3：水费4：电费5：物业费
        String name = "";
        if (id == 0)
            name = "购车位订单";
        if (id == 1)
            name = "租车车位订单";
        if (id == 2)
            name = "停车订单";
        if (id == 3)
            name = "水费";
        if (id == 4)
            name = "电费";
        if (id == 5)
            name = "物业费";
        return name;
    }

    @Override
     public List<OrderVO> changeVO(List<OrderVO> orderVOS) {
        DecimalFormat df = new DecimalFormat("#.00");
        orderVOS.forEach(orderVO -> {
            House house = houseService.getById(orderVO.getHouseId());
            if (house != null) {
//                插入房屋信息单元门牌号
                orderVO.setHouseNumber(house.getHouseNumber());
//                插入社区名
                orderVO.setCommunityName(communityService.getById(house.getCommunityId()).getCommunityName());
//                插入时间差
                orderVO.setOTime(changeForm(orderVO.getCreateTime(), orderVO.getEndTime()));
//                计算价格
                double price = Double.parseDouble(orderVO.getPrice());
                Double amount = orderVO.getAmount();

                double a = amount.doubleValue();
                double v = new BigDecimal(price * a).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

                orderVO.setOrderMoney(v);
                orderVO.setOrderTypeName(
                        orderTypeSelector(orderVO.getOrderType())
                );
                orderVO.setUnits(house.getUnits());

            }
        });
        return orderVOS;
    }


    private LambdaQueryWrapper<Order> getWrapper(OrderQuery query) {
        LambdaQueryWrapper<Order> wrapper = Wrappers.lambdaQuery();
        return wrapper;
    }

    @Override
    public PageResult<OrderVO> page(OrderQuery query) {
        IPage<Order> page = baseMapper.selectPage(getPage(query), getWrapper(query));
        List<OrderVO> orderVOS = OrderConvert.INSTANCE.convertList(page.getRecords());

        return new PageResult<>(changeVO(orderVOS), page.getTotal());
    }

    @Override
    public void save(OrderVO vo) {
        baseMapper.insert(OrderConvert.INSTANCE.convert(vo));
    }

    @Override
    public void update(OrderVO vo) {
        updateById(OrderConvert.INSTANCE.convert(vo));
    }

    @Override
    public List<OrderVO> listById(LambdaQueryWrapper<Order> queryWrapper) {
        List<Order> list = list(queryWrapper);
        List<OrderVO> orderVOS = OrderConvert.INSTANCE.convertList(list);
//        插入

        return changeVO(orderVOS);
    }

    @Override
    public OrderVO getByOrderId(Long id) {
        Order byId = getById(id);
        OrderVO orderVO = OrderConvert.INSTANCE.convert(byId);

        House house = houseService.getById(orderVO.getHouseId());
        if (house != null) {
//                插入房屋信息单元门牌号
            orderVO.setHouseNumber(house.getHouseNumber());
//                插入社区名
            orderVO.setCommunityName(communityService.getById(house.getCommunityId()).getCommunityName());
//                插入时间差
            orderVO.setOTime(changeForm(orderVO.getCreateTime(), orderVO.getEndTime()));
//                计算价格
            double price = Double.parseDouble(orderVO.getPrice());
            Double amount = orderVO.getAmount();

            double a = amount.doubleValue();
            double v = new BigDecimal(price * a).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

            orderVO.setOrderMoney(v);
            orderVO.setOrderTypeName(
                    orderTypeSelector(orderVO.getOrderType())
            );
            orderVO.setArea(
                    house.getHouseArea()
            );
            orderVO.setPayTime(byId.getPayTime());
        }
        return orderVO;
    }


}
