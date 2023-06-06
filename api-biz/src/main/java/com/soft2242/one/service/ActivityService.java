package com.soft2242.one.service;


import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.entity.Activity;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.query.ActivityQuery;
import com.soft2242.one.vo.ActivityVO;

import java.util.List;

/**
 * 社区活动
 *
 * @author 软件2242 soft2242@gmail.com
 * @since 1.0.0 2023-05-25
 */
public interface ActivityService extends BaseService<Activity> {

    PageResult<ActivityVO> page(ActivityQuery query);

    void save(ActivityVO vo);

    void update(ActivityVO vo);

    void delete(List<Long> idList);

    Activity info(Long communityId);
}