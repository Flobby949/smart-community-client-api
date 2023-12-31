package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.soft2242.one.dao.AccountDao;
import com.soft2242.one.dao.UserDao;
import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.entity.UserEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.service.UserService;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 实现类
 * @create : 2023-05-23 15:24
 **/

@Service
@AllArgsConstructor
public class UserServiceImpl extends BaseServiceImpl<UserDao, UserEntity> implements UserService {
    private final AccountDao accountDao;

    @Override
    public AccountEntity getUserByPhone(String phone) {
        return accountDao.getByPhone(phone);
    }

    @Override
    public UserEntity getInfoByPhone(String phone) {
        return baseMapper.getInfoByPhone(phone);
    }

    @Override
    public void updateUserInfo(UserEntity user) {
        LambdaUpdateWrapper<UserEntity> wrapper = new LambdaUpdateWrapper<>();
        wrapper.set(StringUtils.isNotEmpty(user.getUsername()), UserEntity::getUsername, user.getUsername())
                .set(user.getGender() != null, UserEntity::getGender, user.getGender())
                .set(StringUtils.isNotEmpty(user.getAddress()), UserEntity::getAddress, user.getAddress())
                .set(StringUtils.isNotEmpty(user.getAvatar()), UserEntity::getAvatar, user.getAvatar())
                .eq(UserEntity::getId, user.getId());
        baseMapper.update(new UserEntity(), wrapper);
    }
}
