package com.soft2242.one.security.mobile;

/**
 * @description:  手机短信登录，验证码效验
 * */
public interface MobileVerifyCodeService {

    boolean verifyCode(String mobile, String code);
}