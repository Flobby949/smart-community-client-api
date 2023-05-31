package com.soft2242.one.service.impl;

import com.soft2242.one.dao.PassRecordDao;
import com.soft2242.one.entity.PassRecordEntity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 通行记录
 *
 * @author Flobby 
 * @since 1.0.0 2023-05-29
 */
@Service
@AllArgsConstructor
public class PassRecordServiceImpl extends BaseServiceImpl<PassRecordDao, PassRecordEntity> implements BaseService<PassRecordEntity> {

}