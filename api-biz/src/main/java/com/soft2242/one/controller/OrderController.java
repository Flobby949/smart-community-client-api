package com.soft2242.one.controller;


import com.alipay.api.domain.AlipayEcoRenthouseKaServiceCreateModel;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.OrderConvert;
import com.soft2242.one.entity.Order;
import com.soft2242.one.query.OrderQuery;
import com.soft2242.one.service.CommunityService;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.service.IOrderService;
import com.soft2242.one.vo.OrderVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jdk.dynalink.linker.LinkerServices;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.io.PipedReader;
import java.time.LocalDateTime;
import java.util.List;


/**
 * <p>
 *  前端控制器
 * </p>
 *
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

    @GetMapping("page")
    @Operation(summary = "分页查询")
    public Result<PageResult<OrderVO>> page(@ParameterObject @Valid OrderQuery query) {
        PageResult<OrderVO> page = orderSevice.page(query);
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @Operation(summary = "账单查询")
    public Result<OrderVO> get(@PathVariable("id") Long id) {
        Order entity = orderSevice.getById(id);
        return Result.ok(OrderConvert.INSTANCE.convert(entity));
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

    @GetMapping("listById/{id}")
    @Operation(summary = "用户id查询订单列表")
    public Result<List<OrderVO>> listById(@PathVariable Long  id) {
        List<OrderVO> list = orderSevice.listById(Wrappers.lambdaQuery(Order.class).eq(Order::getId, id));
//        插入社区名和房屋信息
        return Result.ok(list);
    }
}
