package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.Activity;
import com.soft2242.one.entity.Cars;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.ActivityService;
import com.soft2242.one.service.CarsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName CarsController
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:37
 */
@RestController
@RequestMapping("/sys/car")
@Tag(name = "车辆管理")
@AllArgsConstructor
public class CarsController {
    private final CarsService carsService;

    @GetMapping("list")
    @Operation(summary = "我的车辆")
    public Result<List<Cars>> list() {
        Long userId = SecurityUser.getUserId();
        List<Cars> list = carsService.myCar(userId);
        return Result.ok(list);
    }
    @PostMapping
    @Operation(summary = "新增车辆")
    //@PreAuthorize("hasAuthority('sys:car:save')")
    public Result<String> save(@RequestBody Cars vo) {
        carsService.save(vo);
        return Result.ok();
    }


    private final ActivityService activityService;
    @GetMapping("{communityId}")
    @Operation(summary = "根据社区id查找活动")
    public Result<List<Activity>> info(@PathVariable("communityId")Long communityId){
        List<Activity> info = activityService.info(communityId);
        return Result.ok(info);
    }
}
