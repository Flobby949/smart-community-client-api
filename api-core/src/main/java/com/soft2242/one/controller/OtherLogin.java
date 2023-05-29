package com.soft2242.one.controller;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-26 11:25
 **/


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.security.utils.TokenUtils;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthGiteeRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import me.zhyd.oauth.utils.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


@RestController
@RequestMapping("/oauth")
@Tag(name = "第三方登录", description = "第三方登录")
public class OtherLogin {
    @Resource
    private AccountDao accountDao;

    @RequestMapping("/render")
    public void renderAuth(HttpServletResponse response) throws IOException {
        AuthRequest authRequest = getAuthRequest();
        response.sendRedirect(authRequest.authorize(AuthStateUtils.createState()));
    }

    @RequestMapping("/callback")
    public String login(AuthCallback callback,HttpServletResponse response) throws IOException {
        AuthRequest authRequest = getAuthRequest();
        AuthResponse<AuthUser> user = authRequest.login(callback);
        String uuid = user.getData().getUuid();
        LambdaQueryWrapper<AccountEntity> wrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(uuid)) {
            System.out.println(uuid);
            AccountEntity entity = accountDao.selectOne(wrapper.eq(AccountEntity::getWechatId, uuid));
            if (entity != null) {
                // 生成token
                String token = TokenUtils.generator();
                // 重定向
                response.sendRedirect("http://localhost:5173/#/Home?token="+token);
//                return "redirect:http://localhost:5173/#/Home?token="+token;//spring redirect方式
            }
        }
        return Result.error("登录失败").toString();
    }

    private AuthRequest getAuthRequest() {
        return new AuthGiteeRequest(AuthConfig.builder()
                .clientId("f5210b2098c736eb7b50eccf77256ec35994190e1f364b2f49198a761fc84e94")
                .clientSecret("a40a4fd2f036e979d6f22a7436919a724d85e9bb365a85d7b63373f495ba3172")
                .redirectUri("http://localhost:8080/oauth/callback")
                .build());
    }
}
