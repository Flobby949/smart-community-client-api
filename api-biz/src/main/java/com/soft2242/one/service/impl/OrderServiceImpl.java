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
    private List<OrderVO> changeVO(List<OrderVO> orderVOS) {
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
                orderVO.setOrderMoney(
                        Double.parseDouble(orderVO.getPrice())* orderVO.getAmount()
                );
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

        return changeVO(orderVOS);
    }


}
