package com.soft2242.one.service.impl;


import com.soft2242.one.dao.DoorDao;
import com.soft2242.one.entity.DoorEntity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 门禁管理
 *
 * @author Flobby 
 * @since 1.0.0 2023-05-29
 */
@Service
@AllArgsConstructor
public class DoorServiceImpl extends BaseServiceImpl<DoorDao, DoorEntity> implements BaseService<DoorEntity> {

}