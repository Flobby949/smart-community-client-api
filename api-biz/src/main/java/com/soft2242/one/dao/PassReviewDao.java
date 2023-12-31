package com.soft2242.one.dao;

import com.soft2242.one.mybatis.dao.BaseDao;
import com.soft2242.one.entity.PassReviewEntity;
import com.soft2242.one.vo.AuditVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* 门禁审核
*
* @author Flobby 
* @since 1.0.0 2023-05-29
*/
@Mapper
public interface PassReviewDao extends BaseDao<PassReviewEntity> {
    Integer getOwnerPassReviewCount(@Param("userId") Long userId, @Param("doorId") Long doorId);

    List<AuditVO> getOwnerPassReviewList(@Param("userId") Long userId, @Param("communityId") Long communityId);
}