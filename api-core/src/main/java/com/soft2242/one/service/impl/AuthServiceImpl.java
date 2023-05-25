package com.soft2242.one.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import com.soft2242.one.common.cache.RedisCache;
import com.soft2242.one.common.constant.Constant;
import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.security.cache.TokenStoreCache;
import com.soft2242.one.security.mobile.MobileAuthenticationToken;
import com.soft2242.one.security.user.UserDetail;
import com.soft2242.one.security.utils.TokenUtils;
import com.soft2242.one.service.AuthService;
import com.soft2242.one.service.SmsService;
import com.soft2242.one.service.UserService;
import com.soft2242.one.vo.AccountLoginVO;
import com.soft2242.one.vo.SysTokenVO;
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
    private UserService userService;
    private RedisCache redisCache;
    private PasswordEncoder passwordEncoder;
    private AccountDao accountDao;

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
    public boolean sendCode(String mobile, Integer type) {
        AccountEntity user = userService.getUserByPhone(mobile);
        if (ObjectUtil.isEmpty(user)) {
            throw new ServerException("手机号不存在");
        }
        String code = RandomUtil.randomNumbers(6);
        Map<String, String> map = new HashedMap<String, String>();
        map.put("code", code);
        if (type == 0) {
            redisCache.set(Constant.FORGET_PASSWORD + mobile, code, 60 * 5);
        } else if (type == 1) {
            redisCache.set(Constant.MOBILE_LOGIN + mobile, code, 60 * 5);
        }
        boolean send = smsService.send(mobile, map);
        if (send) {
            return true;
        }
        return false;
    }

    /**
     * 忘记密码
     *
     * @param mobile   手机号
     * @param password 密码
     * @param code     验证码
     * @return boolean
     */
    @Override
    public boolean forgetPassword(String mobile, String password, String code) {
        String redisCode = (String) redisCache.get(Constant.FORGET_PASSWORD + mobile);
        System.out.println("redisCode" + redisCode);
        if (ObjectUtil.isEmpty(redisCode)) {
            throw new ServerException("验证码已过期");
        }
        if (!redisCode.equals(code)) {
            throw new ServerException("验证码错误");
        }
        AccountEntity user = accountDao.getByPhone(mobile);
        if (ObjectUtil.isEmpty(user)) {
            throw new ServerException("手机号不存在");
        }
        user.setPassword(passwordEncoder.encode(password));
        int id = accountDao.updateById(user);
        if (id > 0) {
            return true;
        }
        return false;
    }

    /**
     * 手机号登录
     *
     * @param mobile 手机号
     * @param code   验证码
     * @return SysTokenVO
     */
    @Override
    public SysTokenVO loginByPhone(String mobile, String code) {
        Authentication authentication;
        try {
            // 用户认证
            authentication = authenticationManager.authenticate(
                    new MobileAuthenticationToken(mobile, code));
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
