package com.soft2242.one.service.impl;

import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.security.mobile.MobileUserDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


/**
 * @author : Ahang
 * @program : manager-template
 * @description :
 * @create : 2023-05-02 23:14
 **/

@Service
@AllArgsConstructor
public class MobileUserDetailsServiceImpl implements MobileUserDetailsService {
    private final AccountDao accountDao;

    private UserDetailsService userDetailsService;

    /**
     * 通过手机号加载用户信息
     *
     * @param mobile 手机号
     * @return 用户信息
     * @throws UsernameNotFoundException 不存在异常
     */
    @Override
    public UserDetails loadUserByMobile(String mobile) throws UsernameNotFoundException {
        AccountEntity user = accountDao.getByPhone(mobile);
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        return userDetailsService.loadUserByUsername(mobile);
    }
}

