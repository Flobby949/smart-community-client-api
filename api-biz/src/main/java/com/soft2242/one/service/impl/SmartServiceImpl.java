package com.soft2242.one.service.impl;

import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.dao.DoorDao;
import com.soft2242.one.dao.PassRecordDao;
import com.soft2242.one.dao.PassReviewDao;
import com.soft2242.one.entity.PassRecordEntity;
import com.soft2242.one.service.SmartService;
import com.soft2242.one.vo.DoorListItemVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 智慧物联业务
 * @create : 2023-05-30 11:46
 **/

@Service
@AllArgsConstructor
public class SmartServiceImpl implements SmartService {
    private final DoorDao doorDao;
    private final PassRecordDao passRecordDao;
    private final PassReviewDao passReviewDao;

    @Override
    public List<DoorListItemVO> getDoorList(Long communityId) {
        return doorDao.selectDoor(communityId);
    }

    @Override
    public void openDoor(Long doorId, Long userId, Integer passWay) {
        Integer passReview = passReviewDao.getOwnerPassReview(userId, doorId);
        if (passReview == 0) {
            throw new ServerException("该小区门禁审核未通过！");
        }
        PassRecordEntity record = new PassRecordEntity();
        record.setUserId(userId);
        record.setDoorId(doorId);
        record.setPassWay(passWay);
        record.setCommunityId(doorDao.selectById(doorId).getCommunityId());
        int insert = passRecordDao.insert(record);
        if (insert == 0) {
            throw new ServerException("开锁失败！");
        }
    }
}
