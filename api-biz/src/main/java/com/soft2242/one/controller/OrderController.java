package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.OrderConvert;
import com.soft2242.one.entity.Order;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.query.OrderQuery;
import com.soft2242.one.service.CommunityService;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.service.IOrderService;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.vo.OrderVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * @author ysh
 * @since 2023-05-25
 */

@RestController
@Tag(name = "订单模块")
@RequestMapping("soft2242/order")
@AllArgsConstructor
public class OrderController {

    private final IOrderService orderSevice;
    private final CommunityService communityService;
    private final HouseService houseService;
    private final OwnerService ownerService;


    @GetMapping("page")
    @Operation(summary = "分页查询")
    public Result<PageResult<OrderVO>> page(@ParameterObject @Valid OrderQuery query) {
        PageResult<OrderVO> page = orderSevice.page(query);
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @Operation(summary = "账单查询")
    public Result<OrderVO> get(@PathVariable("id") Long id) {

        return Result.ok(orderSevice.getByOrderId(id));
    }

    @PostMapping
    @Operation(summary = "生成订单")
    public Result<String> create(@Valid @RequestBody OrderVO vo) {
        orderSevice.save(vo);
        return Result.ok();

    }

    @PutMapping
    @Operation(summary = "修改订单状态")
    public Result<String> update(@Valid @RequestBody OrderVO vo) {
        orderSevice.update(vo);
        return Result.ok();
    }


    @GetMapping("listById")
    @Operation(summary = "用户id查询订单列表")
    public Result<List<OrderVO>> listById(@Parameter Long id, @Parameter Integer status) {
        LambdaQueryWrapper<OwnerEntity> ownerWrapper = Wrappers.lambdaQuery();
        List<OrderVO> list = new ArrayList<>();
        final List<OrderVO> listByOwnerId = new ArrayList<>();

        LambdaQueryWrapper<Order> ordersMapper = Wrappers.lambdaQuery(Order.class);

        ordersMapper.eq(Order::getStatus, status).eq(Order::getUserId, id);//根据用户id查询

//        list = orderSevice.listById(ordersMapper);

        List<OwnerEntity> ownerList = ownerService.list(ownerWrapper.eq(OwnerEntity::getUserId, id));//获取业主该userid的业主列表
//        一个用户可能存在多个房屋
        if (ownerList != null) {
            ownerList.forEach(o -> {    //  遍历添加
                if (o.getHouseId() != null) {
                    listByOwnerId.addAll(
                            OrderConvert.INSTANCE.convertList(orderSevice.list(Wrappers.lambdaQuery(Order.class)
                                            .eq(Order::getStatus, status)
                                            .eq(Order::getHouseId, o.getHouseId()))));
                }
            });
        }

        list.addAll(listByOwnerId);
        System.out.println(list);
//        去除重复
        Set<OrderVO> reList = new HashSet<>(list);

        if (reList.size() == 0) {
            return Result.error("您没有账单信息!");
        } else {
            return Result.ok(orderSevice.changeVO(new ArrayList<>(reList)));
        }
    }
}
