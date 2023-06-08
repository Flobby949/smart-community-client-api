package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.convert.RepairConvert;
import com.soft2242.one.dao.RepairDao;
import com.soft2242.one.entity.NoticeEntity;
import com.soft2242.one.entity.RepairEntity;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.RepairQuery;
import com.soft2242.one.service.RepairService;
import com.soft2242.one.utils.MyUtils;
import com.soft2242.one.vo.RepairVO;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 报修表
 *
 * @author xuelong
 * @since 1.0.0 2023-05-26
 */
@Service
@AllArgsConstructor
public class RepairServiceImpl extends BaseServiceImpl<RepairDao, RepairEntity> implements RepairService {

    private final RepairDao repairDao;

    @Override
    public PageResult<RepairVO> page(RepairQuery query) {
        Map<String, Object> map = new HashMap<>();
        try {
            map = MyUtils.objectToMap(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
        IPage<RepairEntity> page = getPage(query);
        map.put("page", page);
        map.put("communityId", MyUtils.convertToString(query.getCommunityId()));
        List<RepairVO> list = repairDao.getList(map);
        return new PageResult<>(list, page.getTotal());
    }

    @Override
    public RepairVO getById2(String rid) {
        Map<String, Object> map = new HashMap<>();
        map.put("repairId", rid);
        List<RepairVO> list = repairDao.getList(map);
        for (RepairVO repairVO : list) {
            String employees = repairVO.getEmployees();
            String[] eids = MyUtils.convertToArray(employees);
//            String[] eids =employees.split(",");
            repairVO.setHandlerName(repairDao.getHandlerName(eids));
        }
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    private LambdaQueryWrapper<RepairEntity> getWrapper(RepairQuery query) {
        LambdaQueryWrapper<RepairEntity> wrapper = Wrappers.lambdaQuery();
        wrapper.in(ArrayUtils.isNotEmpty(query.getCommunityId()), RepairEntity::getCommunityId, query.getCommunityId());
        wrapper.like(StringUtils.isNotEmpty(query.getTitle()), RepairEntity::getTitle, query.getTitle());
        wrapper.eq(StringUtils.isNotEmpty(query.getState()), RepairEntity::getState, query.getState());
        wrapper.eq(StringUtils.isNotEmpty(query.getType()), RepairEntity::getType, query.getType());
//        wrapper.ge(query.getCreateTime() != null,RepairEntity::getCreateTime, query.getCreateTime());
        wrapper.between(ArrayUtils.isNotEmpty(query.getCreateTime()), RepairEntity::getCreateTime, ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[0] : null, ArrayUtils.isNotEmpty(query.getCreateTime()) ? query.getCreateTime()[1] : null);
        return wrapper;
    }

    @Override
    public void save(RepairVO vo) {
        RepairEntity entity = RepairConvert.INSTANCE.convert(vo);

        baseMapper.insert(entity);
    }

    @Override
    public void update(RepairVO vo) {
        RepairEntity entity = RepairConvert.INSTANCE.convert(vo);

        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(List<Long> idList) {
        removeByIds(idList);
    }

}
