package com.soft2242.one.dao;

import com.soft2242.one.entity.NoticeEntity;
import com.soft2242.one.mybatis.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * @Author : xuelong
 * @program
 * @description
 * @create 2023/5/24 9:11
 */
@Mapper
public interface NoticeDao extends BaseDao<NoticeEntity> {

    List<NoticeEntity> getList(Map<String, Object> params);
}
