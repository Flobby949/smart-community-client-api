package com.soft2242.one.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.UserEntity;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName: UserController
 * @Author: lsc
 * @Date: 2023/05/31/9:56
 */
@RestController
@RequestMapping("user")
@Tag(name = "用户")
@AllArgsConstructor
public class UserController {
    private final UserService userService;
    @PostMapping("info")
    @Operation(summary = "用户详情信息")
    public Result<UserEntity> info(){
        QueryWrapper<UserEntity> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserEntity::getId, SecurityUser.getUserId());
        UserEntity user = userService.getOne(wrapper);
        return Result.ok(user);
    }
    @PostMapping("update")
    @Operation(summary = "修改用户信息")
    public Result<String> update(UserEntity user){
        user.setId(SecurityUser.getUserId());
        System.out.println(user.getUsername());
        userService.updateUserInfo(user);
        return Result.ok();
    }
}
