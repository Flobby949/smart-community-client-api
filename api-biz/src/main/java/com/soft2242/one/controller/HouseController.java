package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.House;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.HouseService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description : 房屋
 * @create : 2023-05-31 08:53
 **/
@RestController
@Tag(name = "房屋")
@AllArgsConstructor
@RequestMapping("/owner")
public class HouseController {
    private final HouseService houseService;

    //    查询当前登录用户的房屋信息
    @PostMapping("/myHouse")
    @Operation(summary = "查询当前登录用户的房屋信息")
    public Result<List<House>> myHouse() {
        Long userId = SecurityUser.getUserId();
        List<House> list = houseService.myHouse(userId);
        return Result.ok(list);
    }

    // 删除房屋
    @PostMapping("/deleteHouse")
    @Operation(summary = "删除房屋")
    public Result deleteHouse(String houseId) {
        Long userId = SecurityUser.getUserId();
        houseService.deleteHouse(userId, houseId);
        return Result.ok();
    }
}
