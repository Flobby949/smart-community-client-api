package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.convert.NoticeConvert;
import com.soft2242.one.dao.NoticeDao;
import com.soft2242.one.entity.NoticeEntity;
import com.soft2242.one.entity.RepairEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.NoticeQuery;
import com.soft2242.one.service.NoticeService;
import com.soft2242.one.utils.MyUtils;
import com.soft2242.one.vo.NoticeVO;
import com.soft2242.one.vo.RepairVO;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;

/**
 * @Author : xuelong
 * @program
 * @description
 * @create 2023/5/24 9:14
 */
@Service
@AllArgsConstructor
public class NoticeServiceImpl extends BaseServiceImpl<NoticeDao, NoticeEntity> implements NoticeService {

    private final NoticeDao noticeDao;

    @Override
    public HashMap<String, Object> page(NoticeQuery query) {
        Map<String, Object> map = null;
        try {
            map = MyUtils.objectToMap(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        IPage<NoticeEntity> page = getPage(query);
        map.put("page", page);


        if (ArrayUtils.isNotEmpty(query.getCreateTime())) {
            Date begin = ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[0] : null;
            Date end = ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[1] : null;
            map.put("createTime", query.getCreateTime());
            map.put("begin", begin);
            map.put("end", end);
        }
        map.put("communityId", MyUtils.convertToString(query.getCommunityId()));
//        IPage<NoticeEntity> page = getPage(query);

        List<NoticeVO> list = noticeDao.getList(map);
        HashMap<String, Object> res = new HashMap<>();

        res.put("list", list);
        res.put("page", page);
        return res;
    }

    @Override
    public List<NoticeVO> getList(NoticeQuery query) {
        Map<String, Object> map = null;
        try {
            map = MyUtils.objectToMap(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        IPage<NoticeEntity> page = getPage(query);

        if (ArrayUtils.isNotEmpty(query.getCreateTime())) {
            Date begin = ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[0] : null;
            Date end = ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[1] : null;
            map.put("createTime", query.getCreateTime());
            map.put("begin", begin);
            map.put("end", end);
        }
        List<NoticeVO> list = noticeDao.getList(map);
        return list;
    }


    private LambdaQueryWrapper<NoticeEntity> getWrapper(NoticeQuery query) {
        LambdaQueryWrapper<NoticeEntity> wrapper = Wrappers.lambdaQuery();
        wrapper.like(StringUtils.isNotEmpty(query.getTitle()), NoticeEntity::getTitle, query.getTitle());
        wrapper.in(ArrayUtils.isNotEmpty(query.getCommunityId()), NoticeEntity::getCommunityId, query.getCommunityId());
        wrapper.between(ArrayUtils.isNotEmpty(query.getCreateTime()), NoticeEntity::getCreateTime, ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[0] : null, ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[1] : null);
        return wrapper;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(NoticeVO vo) {

        NoticeEntity entity = NoticeConvert.INSTANCE.convert(vo);
        entity.setPublishTime(vo.getPublishTime());
        baseMapper.insert(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(NoticeVO vo) {
        NoticeEntity entity = NoticeConvert.INSTANCE.convert(vo);
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> ids) {
        removeBatchByIds(ids);
    }


}
