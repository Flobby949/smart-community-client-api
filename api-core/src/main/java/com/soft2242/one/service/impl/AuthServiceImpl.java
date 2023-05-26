package com.soft2242.one.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import com.soft2242.one.common.cache.RedisCache;
import com.soft2242.one.common.constant.Constant;
import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.common.utils.AddressUtils;
import com.soft2242.one.common.utils.HttpContextUtils;
import com.soft2242.one.common.utils.IpUtils;
import com.soft2242.one.config.SmsConfig;
import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.dao.SmsPhoneDao;
import com.soft2242.one.dao.SmsPhoneLogDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.entity.SmsPhoneEntity;
import com.soft2242.one.entity.SmsPhoneLogEntity;
import com.soft2242.one.enums.PlatformEnum;
import com.soft2242.one.enums.StatusEnum;
import com.soft2242.one.security.cache.TokenStoreCache;
import com.soft2242.one.security.mobile.MobileAuthenticationToken;
import com.soft2242.one.security.user.UserDetail;
import com.soft2242.one.security.utils.TokenUtils;
import com.soft2242.one.service.AuthService;
import com.soft2242.one.service.SmsService;
import com.soft2242.one.service.UserService;
import com.soft2242.one.vo.*;
import lombok.AllArgsConstructor;
import org.apache.commons.collections4.map.HashedMap;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 实现类
 * @create : 2023-05-23 15:27
 **/

@Service
@AllArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final AuthenticationManager authenticationManager;
    private final TokenStoreCache tokenStoreCache;
    private final SmsService smsService;
    private final UserService userService;
    private final RedisCache redisCache;
    private final PasswordEncoder passwordEncoder;
    private final AccountDao accountDao;
    private final SmsPhoneDao smsPhoneDao;
    private final SmsConfig smsConfig;
    private final SmsPhoneLogDao smsPhoneLogDao;

    @Override
    public SysTokenVO loginByAccount(AccountLoginVO login) {
        Authentication authentication;
        try {
            // 用户认证
            authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(login.getPhone(), login.getPassword()));
        } catch (BadCredentialsException e) {
            throw new ServerException("用户名或密码错误");
        }

        // 用户信息
        UserDetail user = (UserDetail) authentication.getPrincipal();

        // 生成 accessToken
        String accessToken = TokenUtils.generator();

        // 保存用户信息到缓存，accessToken默认过期时间为24小时
        tokenStoreCache.saveUser(accessToken, user);

        return new SysTokenVO(accessToken);
    }

    @Override
    public void logout(String accessToken) {
        // TODO 记录日志
        // 从缓存中删除用户
        tokenStoreCache.deleteUser(accessToken);
    }

    // 发送短信
    @Override
    public boolean sendCode(SendPhoneVo sendPhoneVo) {
        SmsPhoneEntity smsPhone = new SmsPhoneEntity();
        SmsPhoneLogEntity smsPhoneLogEntity = new SmsPhoneLogEntity();
        SmsConfig config = new SmsConfig();
        config.setPlatform(smsConfig.getPlatform());
        config.setTemplateId(smsConfig.getTemplateId());
        config.setSignName(smsConfig.getSignName());
        config.setAccessKey(smsConfig.getAccessKey());
        config.setSecretKey(smsConfig.getSecretKey());
        AccountEntity user = userService.getUserByPhone(sendPhoneVo.getMobile());
        smsPhone.setPhone(sendPhoneVo.getMobile());
        smsPhone.setPlatform(PlatformEnum.ALIYUN.getCode());
        if (ObjectUtil.isNull(user)) {
            smsPhone.setStatus(StatusEnum.FAIL.getCode());

            smsPhone.setError("用户不存在");

            smsPhoneDao.insert(smsPhone);
            throw new ServerException("用户不存在");
        }
        String code = RandomUtil.randomNumbers(6);
        Map<String, String> map = new HashedMap<String, String>();
        map.put("code", code);
        if (sendPhoneVo.getType() == 0) {
            redisCache.set(Constant.FORGET_PASSWORD + sendPhoneVo.getMobile(), code, 60 * 5);
        } else if (sendPhoneVo.getType() == 1) {
            redisCache.set(Constant.MOBILE_LOGIN + sendPhoneVo.getMobile(), code, 60 * 5);
        }
        smsPhoneLogEntity.setPhone(sendPhoneVo.getMobile());
        smsPhoneLogEntity.setTemplate(smsConfig.getTemplateId());
        smsPhoneLogEntity.setPlatform(smsConfig.getPlatform());
        smsPhoneLogEntity.setStatus(0);
        smsPhoneLogEntity.setIp(IpUtils.getIpAddr(HttpContextUtils.getHttpServletRequest()));
        smsPhoneLogEntity.setAddress(AddressUtils.getAddressByIP(smsPhoneLogEntity.getIp()));
        smsPhoneLogEntity.setUserid(user.getId());
        smsPhoneLogEntity.setCreator(user.getId());
        smsPhoneLogEntity.setDeviceToken(HttpContextUtils.getDeviceToken());

        smsPhoneLogDao.insert(smsPhoneLogEntity);
        boolean send = smsService.send(sendPhoneVo.getMobile(), map);
        smsPhone.setStatus(StatusEnum.SUCCESS.getCode());
        smsPhone.setCode(code);
        smsPhone.setCreator(user.getId());

        smsPhoneDao.insert(smsPhone);
        if (send) {
            return true;
        }
        smsPhoneDao.insert(smsPhone);
        return false;
    }

    /**
     * 忘记密码
     */
    @Override
    public boolean forgetPassword(ForgetVo forgetVo) {
        String redisCode = (String) redisCache.get(Constant.FORGET_PASSWORD + forgetVo.getMobile());
        System.out.println("redisCode" + redisCode);
        if (!redisCode.equals(forgetVo.getCode())) {
            throw new ServerException("验证码错误");
        }
        AccountEntity user = accountDao.getByPhone(forgetVo.getMobile());
        if (ObjectUtil.isEmpty(user)) {
            throw new ServerException("手机号不存在");
        }
        user.setPassword(passwordEncoder.encode(forgetVo.getPassword()));
        int id = accountDao.updateById(user);
        if (id > 0) {
            return true;
        }
        return false;
    }

    /**
     * 手机号登录
     *
     * @return SysTokenVO
     */
    @Override
    public SysTokenVO loginByPhone(PhoneLoginVo phoneLoginVo) {
        Authentication authentication;
        try {
            // 用户认证
            authentication = authenticationManager.authenticate(
                    new MobileAuthenticationToken(phoneLoginVo.getMobile(), phoneLoginVo.getCode()));
        } catch (BadCredentialsException e) {
            throw new ServerException("手机号或验证码错误");
        }
        // 用户信息
        UserDetail user = (UserDetail) authentication.getPrincipal();
        // 生成 accessToken
        String accessToken = TokenUtils.generator();
        // 保存用户信息到缓存，accessToken默认过期时间为24小时
        tokenStoreCache.saveUser(accessToken, user);
        return new SysTokenVO(accessToken);
    }
}
