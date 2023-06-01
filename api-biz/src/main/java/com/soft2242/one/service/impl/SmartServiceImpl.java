package com.soft2242.one.service.impl;

import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.convert.PassReviewConvert;
import com.soft2242.one.dao.DoorDao;
import com.soft2242.one.dao.PassRecordDao;
import com.soft2242.one.dao.PassReviewDao;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.entity.PassRecordEntity;
import com.soft2242.one.entity.PassReviewEntity;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.service.SmartService;
import com.soft2242.one.vo.AuditVO;
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
    private final OwnerService ownerService;
    private final HouseService houseService;

    @Override
    public List<DoorListItemVO> getDoorList(Long communityId) {
        return doorDao.selectDoor(communityId);
    }

    @Override
    public void openDoor(Long doorId, Long userId, Integer passWay) {
        Integer passReview = passReviewDao.getOwnerPassReviewCount(userId, doorId);
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

    @Override
    public void audit(AuditVO auditVO) {
        // 验证业主信息
        OwnerEntity ownerEntity = ownerService.getById(auditVO.getOwnerId());
        if (!ownerEntity.getHouseId().equals(auditVO.getHouseId())) {
            throw new ServerException("尚未在当前小区成为业主！");
        }
        // 重复审核
        Long communityId = houseService.getById(auditVO.getHouseId()).getCommunityId();
        List<AuditVO> availableList = auditList(SecurityUser.getUserId(), communityId)
                .stream()
                .filter(item -> !item.getStatus().equals(2))
                .toList();
        if (!availableList.isEmpty()) {
            throw new ServerException("请勿重复提交审核！");
        }
        // 提交审核
        PassReviewEntity passReviewEntity = PassReviewConvert.INSTANCE.convert(auditVO);
        passReviewEntity.setStatus(0);
        int insert = passReviewDao.insert(passReviewEntity);
        if (insert == 0) {
            throw new ServerException("提交审核失败");
        }
    }

    @Override
    public List<AuditVO> auditList(Long userId, Long communityId) {
        try {
            return passReviewDao.getOwnerPassReviewList(userId, communityId);
        } catch (Exception e) {
            throw new ServerException("查询失败");
        }
    }
}
