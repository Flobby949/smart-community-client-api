package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.service.AuthService;
import com.soft2242.one.vo.AccountLoginVO;
import com.soft2242.one.vo.SysTokenVO;
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
    public Result<String> sendCode(String mobile, Integer type) {
        boolean send = authService.sendCode(mobile, type);
        System.out.println(send);
        if (!send) {
            return Result.error("发送失败");
        }
        return Result.ok();
    }

    @PostMapping("forget/password")
    @Operation(summary = "忘记密码")
    public Result<String> forgetPassword(String mobile, String password, String code) {
        boolean forget = authService.forgetPassword(mobile, password, code);
        if (!forget) {
            return Result.error("修改失败");
        }
        return Result.ok();
    }
}
