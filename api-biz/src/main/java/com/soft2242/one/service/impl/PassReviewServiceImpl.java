package com.soft2242.one.service.impl;

import com.soft2242.one.dao.PassReviewDao;
import com.soft2242.one.entity.PassReviewEntity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 门禁审核
 *
 * @author Flobby 
 * @since 1.0.0 2023-05-29
 */
@Service
@AllArgsConstructor
public class PassReviewServiceImpl extends BaseServiceImpl<PassReviewDao, PassReviewEntity> implements BaseService<PassReviewEntity> {

}