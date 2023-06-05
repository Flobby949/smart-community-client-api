package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.service.AuthService;
import com.soft2242.one.vo.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 认证管理
 * @create : 2023-05-23 16:10
 **/

@RestController
@RequestMapping("auth")
@Tag(name = "认证管理")
@AllArgsConstructor
public class AuthController {
    private final AuthService authService;



    @PostMapping("login")
    @Operation(summary = "账号密码登录")
    public Result<SysTokenVO> login(@RequestBody AccountLoginVO login) {
        SysTokenVO token = authService.loginByAccount(login);
        return Result.ok(token);
    }

    @PostMapping("send/code")
    @Operation(summary = "发送验证码")
    // 0 忘记密码 1 登录
    public Result<String> sendCode(@RequestBody SendPhoneVo sendPhoneVo) {
        boolean send = authService.sendCode(sendPhoneVo);
        System.out.println(send);
        if (!send) {
            return Result.error("发送失败");
        }
        return Result.ok();
    }

    @PostMapping("forget/password")
    @Operation(summary = "忘记密码")
    public Result<String> forgetPassword(@RequestBody ForgetVo forgetVo) {
        boolean forget = authService.forgetPassword(forgetVo);
        if (!forget) {
            return Result.error("修改密码失败，请重试");
        }
        return Result.ok();
    }

    @PostMapping("phone/login")
    @Operation(summary = "手机号登录")
    public Result<SysTokenVO> phoneLogin(@RequestBody PhoneLoginVo phoneLoginVo) {
        SysTokenVO token = authService.loginByPhone(phoneLoginVo);
        return Result.ok(token);
    }

}
