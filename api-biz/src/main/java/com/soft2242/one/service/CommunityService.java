package com.soft2242.one.service;

import com.soft2242.one.entity.Community;
import com.soft2242.one.mybatis.service.BaseService;

import java.util.List;

/**
 * @ClassName CommunityService
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:36
 */
public interface CommunityService extends BaseService<Community> {
    /**
     * 获取所有通知数据
     *
     * @return list
     */
    List<Community> getList();
}
