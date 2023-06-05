package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.House;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.vo.HouseVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
    public Result<List<HouseVO>> myHouse(@RequestParam(required = false) Integer status) {
        Long userId = SecurityUser.getUserId();
        return Result.ok(houseService.myHouse(userId, status));
    }

    // 删除房屋
    @PostMapping("/deleteHouse")
    @Operation(summary = "删除房屋")
    public Result deleteHouse(String houseId) {
        Long userId = SecurityUser.getUserId();
        houseService.deleteHouse(userId, houseId);
        return Result.ok();
    }

    // 查询所有房屋信息
    @PostMapping("/allHouse")
    @Operation(summary = "查询所有房屋信息")
    public Result<List<House>> allHouse() {
        List<House> list = houseService.list();
        // 过滤掉社区名字 为空的数据
        list.removeIf(item -> item.getCommunityName() == null);
        return Result.ok(list);
    }

    // 查询小区
    @PostMapping("/allCommunity")
    @Operation(summary = "查询小区")
    public Result<List<House>> allCommunity() {
        List<House> list = houseService.list();
        return Result.ok(list);
    }

    // 根据小区id查询楼栋
    @PostMapping("/allBuilding")
    @Operation(summary = "根据小区id查询楼栋")
    public Result<List<House>> allBuilding(String communityId) {
        List<House> list = houseService.allBuilding(communityId);
        return Result.ok(list);
    }

    // 根据楼栋id查询单元
    @PostMapping("/allUnit")
    @Operation(summary = "根据楼栋id查询单元")
    public Result<List<House>> allUnit(String communityId, String buildingId) {
        List<House> list = houseService.allUnit(communityId, buildingId);
        return Result.ok(list);
    }

    // 根据小区 根据楼栋 根据单元 查询房屋
    @PostMapping("/allHouseByUnit")
    @Operation(summary = "根据小区 根据楼栋 根据单元 查询房屋")
    public Result<List<House>> allHouseByUnit(String communityId, String buildingId, String unit) {
        List<House> list = houseService.allHouseByUnit(communityId, buildingId, unit);
        return Result.ok(list);
    }


    @PostMapping("/addHouse")
    @Operation(summary = "添加房屋")
    public Result addHouse(@RequestBody OwnerEntity owner) {
        houseService.saveHouse(owner);
        return Result.ok();
    }
}
