package com.soft2242.one.service.impl;

import com.soft2242.one.entity.ActivityType;
import com.soft2242.one.dao.ActivityTypeMapper;
import com.soft2242.one.service.IActivityTypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 活动分类 服务实现类
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Service
public class ActivityTypeServiceImpl extends ServiceImpl<ActivityTypeMapper, ActivityType> implements IActivityTypeService {

}
