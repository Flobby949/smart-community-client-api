package com.soft2242.one.service;

import com.soft2242.one.entity.AccountEntity;
import com.soft2242.one.entity.UserEntity;
import com.soft2242.one.mybatis.service.BaseService;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 用户服务
 * @create : 2023-05-23 15:24
 **/

public interface UserService extends BaseService<UserEntity> {
    AccountEntity getUserByPhone(String phone);

     UserEntity getInfoByPhone(String phone);

    void updateUserInfo(UserEntity user);
}
