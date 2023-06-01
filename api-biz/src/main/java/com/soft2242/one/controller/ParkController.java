package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.Park;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.ParkService;
import com.soft2242.one.vo.CartParkVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName ParkController
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 18:24
 */
@RestController
@RequestMapping("sys/park")
@Tag(name="停车场管理")
@AllArgsConstructor
public class ParkController {
    private final ParkService parkService;

    @GetMapping("list")
    @Operation(summary = "停车场列表")
    public Result<List<Park>> list() {
        List<Park> list = parkService.getList();
        return Result.ok(list);
    }

    @PostMapping("/car/list")
    @Operation(summary = "停车缴费列表")
    public Result<List<CartParkVO>> getMyCartParkVO() {
        Long userId = SecurityUser.getUserId();
        List<CartParkVO> list = parkService.getMyCartParkVO(userId);
        return Result.ok(list);
    }
}
