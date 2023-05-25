package com.soft2242.one.service.impl;

import com.soft2242.one.api.SmsApi;
import com.soft2242.one.security.mobile.MobileVerifyCodeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;


/**
 * @author : Ahang
 * @program : manager-template
 * @description :
 * @create : 2023-05-02 23:15
 **/
@Service
@AllArgsConstructor
public class MobileVerifyCodeServiceImpl implements MobileVerifyCodeService {
    private final SmsApi smsApi;

    @Override
    public boolean verifyCode(String mobile, String code) {
        return smsApi.verifyCode(mobile, code);
    }
}
