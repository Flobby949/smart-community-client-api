package com.soft2242.one.api;


import com.soft2242.one.cache.SmsSendCache;
import com.soft2242.one.service.SmsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
/**
 * 短信API实现类
 */
@Component
@AllArgsConstructor
public class SmsApiImpl implements SmsApi {
    private final SmsService smsService;
    private final SmsSendCache smsSendCache;

    @Override
    public boolean sendCode(String mobile, String key, String value) {
        // 短信参数
        Map<String, String> params = new HashMap<>();
        params.put(key, value);
        // 发送短信
        boolean flag = smsService.send(mobile, params);
        if (flag) {
            smsSendCache.saveCode(mobile, value);
        }
        return flag;
    }

    @Override
    public boolean verifyCode(String mobile, String code) {
        String value = smsSendCache.getCode(mobile);
        if (value != null) {
            // 删除短信验证码
            smsSendCache.deleteCode(mobile);
            // 校验
            return value.equalsIgnoreCase(code);
        }
        return false;
    }
}