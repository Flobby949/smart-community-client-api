package com.soft2242.one.controller;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-05-26 11:25
 **/

import com.soft2242.one.vo.OtherLoginVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.request.AuthWeChatOpenRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


@RestController
@RequestMapping("/oauth")
@Tag(name = "第三方登录", description = "第三方登录")
public class OtherLogin {
    @GetMapping("/render")
    @Operation(summary = "渲染授权页面")
    public void renderAuth(HttpServletResponse response) throws IOException {
        System.out.println("进入render");
        AuthRequest authRequest = getAuthRequest();
        String authorizeUrl = authRequest.authorize(AuthStateUtils.createState());
        System.out.println(authorizeUrl);
        response.sendRedirect(authorizeUrl);
    }

    @PostMapping("/callback")
    @Operation(summary = "授权回调地址")
    public Object login(AuthCallback callback) {
        AuthRequest authRequest = getAuthRequest();
        return authRequest.login(callback);
    }

    private AuthRequest getAuthRequest() {
        return new AuthWeChatOpenRequest(AuthConfig.builder()
                .clientId(OtherLoginVO.WX_OPEN_APP_ID)
                .clientSecret(OtherLoginVO.WX_OPEN_APP_SECRET)
                .redirectUri(OtherLoginVO.WX_OPEN_REDIRECT_URL)
                .build());
    }
}
