package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.soft2242.one.entity.Activity;
import com.soft2242.one.dao.ActivityMapper;
import com.soft2242.one.service.IActivityService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ysh
 * @since 2023-05-24
 */
@Service
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper, Activity> implements IActivityService {

}
