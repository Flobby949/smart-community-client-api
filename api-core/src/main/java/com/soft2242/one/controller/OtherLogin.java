package com.soft2242.one.controller;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-26 11:25
 **/


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.security.cache.TokenStoreCache;
import com.soft2242.one.security.user.UserDetail;
import com.soft2242.one.security.utils.TokenUtils;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthGiteeRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import me.zhyd.oauth.utils.StringUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/oauth")
@Tag(name = "第三方登录", description = "第三方登录")
@Slf4j
public class OtherLogin {
    @Resource
    private AccountDao accountDao;
    @Resource
    private AuthenticationManager authenticationManager;

    @Resource
    private TokenStoreCache tokenStoreCache;

    @RequestMapping("/render")
    public void renderAuth(HttpServletResponse response) throws IOException {
        AuthRequest authRequest = getAuthRequest();
        response.sendRedirect(authRequest.authorize(AuthStateUtils.createState()));
    }

    @RequestMapping("/callback")
    public String login(AuthCallback callback, HttpServletResponse response) throws IOException {
        AuthRequest authRequest = getAuthRequest();
        AuthResponse<AuthUser> user = authRequest.login(callback);
        String uuid = user.getData().getUuid();
        LambdaQueryWrapper<AccountEntity> wrapper = new LambdaQueryWrapper<>();
        log.info("uuid:{}", uuid);
        if (StringUtils.isNotEmpty(uuid)) {
            System.out.println(uuid);
            AccountEntity entity = accountDao.selectOne(wrapper.eq(AccountEntity::getWechatId, uuid));
            if (entity != null) {
                Authentication authentication;
                try {
                    // 用户认证
                    authentication = authenticationManager.authenticate(
                            new UsernamePasswordAuthenticationToken(entity.getPhone(), "123456"));
                } catch (BadCredentialsException e) {
                    throw new ServerException("用户名或密码错误");
                }
                // 用户信息
                UserDetail user1 = (UserDetail) authentication.getPrincipal();

                // 生成 accessToken
                String accessToken = TokenUtils.generator();

                // 保存用户信息到缓存，accessToken默认过期时间为24小时
                tokenStoreCache.saveUser(accessToken, user1);


                // 重定向
                response.sendRedirect("http://localhost:5173/#/home?token=" + accessToken);
//                return "redirect:http://localhost:5173/#/Home?token="+token;//spring redirect方式
            }
        }
        return Result.error("登录失败").toString();
    }

    private AuthRequest getAuthRequest() {
        return new AuthGiteeRequest(AuthConfig.builder()
                .clientId("f5210b2098c736eb7b50eccf77256ec35994190e1f364b2f49198a761fc84e94")
                .clientSecret("a40a4fd2f036e979d6f22a7436919a724d85e9bb365a85d7b63373f495ba3172")
                .redirectUri("http://localhost:8081/oauth/callback")
                .build());
    }
}
