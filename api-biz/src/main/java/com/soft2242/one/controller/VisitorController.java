package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.VisitorConvert;
import com.soft2242.one.convert.VisitorInvitationConvert;
import com.soft2242.one.entity.*;
import com.soft2242.one.query.VisitorQuery;
import com.soft2242.one.service.*;
import com.soft2242.one.vo.UserCommunityVO;
import com.soft2242.one.vo.VisitorInvitationVO;
import com.soft2242.one.vo.VisitorVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.ElementKind;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * <p>
 * 前端控制器
 *
 * @author ysh
 * @since 2023-05-25
 */

@RestController
@Tag(name = "访客邀请")
@RequestMapping("soft2242/visitor")
@AllArgsConstructor
public class VisitorController {
    private final IVisitorService visitorService;
    private final IVisitorInvitationService visitorInvitationService;
    private final OwnerService ownerService;
    private final CommunityService communityService;
    private final HouseService houseService;

    private String changeForm(LocalDateTime create, LocalDateTime end) {
        return create.toString().substring(0, 10) + "~" + end.toString().substring(0, 10);
    }

    @GetMapping("page")
    @Operation(summary = "分页查询访客开门记录")
    public Result<PageResult<VisitorVO>> page(@ParameterObject @Valid VisitorQuery query) {
        PageResult<VisitorVO> page = visitorService.page(query);
        return Result.ok(page);
    }

    @GetMapping("history/{userId}")
    @Operation(summary = "查询访客邀请记录")
    public Result<PageResult<VisitorInvitationVO>> page(@PathVariable("userId") Long userId) {
        PageResult<VisitorInvitationVO> page = visitorInvitationService.getAll(userId);
        return Result.ok(page);
    }

    @GetMapping("history2/{userId}")
    @Operation(summary = "查询访客邀请记录2")
    public Result<PageResult<VisitorInvitationVO>> page2(@PathVariable("userId") Long userId) {
        List<VisitorInvitationVO> invitaionVOs = VisitorInvitationConvert.INSTANCE.convertList(visitorInvitationService.getAll2(userId));
        invitaionVOs.forEach(o -> {
            House house = houseService.getById(o.getHouseId());
            if (house != null) {
//                插入房屋信息 插入社区名
                o.setHouseInfo(house.getCommunityName() + "小区" + house.getBuildingName() + house.getUnits() + "单元" + house.getHouseNumber() + "室");
//                插入闸机
                String[] doors = o.getDoorIds().split(",");
                o.setGates(doors);
                String validTime = changeForm(o.getCreateTime(), o.getEndTime());
                o.setValidTime(validTime);
            }

        });
        PageResult<VisitorInvitationVO> page = new PageResult<>(invitaionVOs, invitaionVOs.size());
        return Result.ok(page);
    }


    @GetMapping("{id}")
    @Operation(summary = "访客查询")
    public Result<Visitor> get(@PathVariable("id") Long id) {
        Visitor entity = visitorService.getById(id);
        return Result.ok(entity);
    }

    //    增加访客再增加访客邀请记录
    @PostMapping("addVisitor")
    @Operation(summary = "增加访客")
    public Result<String> create(@Valid @RequestBody VisitorVO vo) {
//        判断非空校验
        if (vo.getPhone() != null || vo.getName() != null || !vo.getPhone().equals("") || !vo.getName().equals("")) {
            Visitor visitor = VisitorConvert.INSTANCE.convert(vo);
            visitorService.save(visitor);
        }
        return Result.ok();
    }

    @PostMapping("addHistory")
    @Operation(summary = "生成访客邀请记录")
    public Result<String> createHistory(@Valid @RequestBody VisitorInvitationVO vo) {
        Long ownerId, visitorId, houseId;
//        获取ownerId
        LambdaQueryWrapper<OwnerEntity> query = Wrappers.lambdaQuery();
        List<OwnerEntity> list = null;
        try {
            query.eq(OwnerEntity::getUserId, vo.getUserId())
                    .eq(OwnerEntity::getState, 1)
                    .eq(OwnerEntity::getDeleted, 0);
            list = ownerService.list(query);
            ownerId = list.get(0).getId();
            houseId = list.get(0).getHouseId();
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("登录账户没有邀请权限，您不是业主");
        }
//        if (ownerId==null || houseId==null)
//            return Result.error("登录账户没有邀请权限，您不是业主");
//        新增用户
        try {
            VisitorVO add = VisitorVO.builder().ownerId(ownerId).name(vo.getVisitorName()).phone(vo.getPhone()).doorIds(vo.getDoorIds()).build();
            this.create(add);
//            获取visitorId
            LambdaQueryWrapper<Visitor> wrapper = Wrappers.lambdaQuery();
            wrapper.eq(Visitor::getName, vo.getVisitorName());
            List<Visitor> visitors = visitorService.list(wrapper);

            visitorId = visitors.get(visitors.size() - 1).getId();
        } catch (Exception e) {
            return Result.error("请输入完整信息");
        }
//        新增访客邀请表 需要获取 houseId 和 visitorId
        vo.setVisitorId(visitorId);
        vo.setHouseId(houseId);
        VisitorInvitation entity = VisitorInvitationConvert.INSTANCE.convert(vo);
        visitorInvitationService.save(entity);
        return Result.ok("成功新增用户访问邀请");

    }

    @PutMapping("status/{id}")
    @Operation(summary = "失效客开门状态")
    public Result<String> updateById(@Valid @PathVariable Long id) {
//        visitorService.update(vo);
        VisitorInvitation entity = visitorInvitationService.getById(id);
        entity.setStatus(1);
        visitorInvitationService.updateById(entity);
        return Result.ok("使访客失效成功");
    }

    @GetMapping("gateOpenHistoryList/{userId}")
    @Operation(summary = "访客开门列表")
    public Result<List<VisitorVO>> getGateOpenHistoryByUserId(@PathVariable Long userId) {
        Long ownerId, houseId;

        LambdaQueryWrapper<OwnerEntity> ownerWrapper = Wrappers.lambdaQuery();
        List<OwnerEntity> list = null;
        try {
            ownerWrapper.eq(OwnerEntity::getUserId, userId)
                    .eq(OwnerEntity::getState, 1)
                    .eq(OwnerEntity::getDeleted, 0);
            list = ownerService.list(ownerWrapper);
            List<Long> ownerIds = new ArrayList<>();
            if (list.size() > 0) {
                list.forEach(e -> {
                    ownerIds.add(e.getId());
                });
            }

            System.out.println(ownerIds);
//            List<Visitor> openList = visitorService.list(wrapper.in(Visitor::getOwnerId, ownerIds).eq(Visitor::getStatus, 1));
            List<Visitor> openList = new ArrayList<>();
            ownerIds.forEach(e -> {
                openList.addAll(visitorService.list(Wrappers.lambdaQuery(Visitor.class).eq(Visitor::getOwnerId, e)));
            });
            System.out.println(openList);
            List<VisitorVO> visitorVOS = VisitorConvert.INSTANCE.convertList(openList);
            return Result.ok(visitorVOS);
//            houseId = list.get(0).getHouseId();
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("登录账户没有邀请权限，您不是业主");
        }


    }

    @GetMapping("getCommunityList/{userId}")
    @Operation(summary = "根据userId获取社区列表")
    public Result<List<UserCommunityVO>> getCommunityList(@PathVariable Long userId) {
        List<OwnerEntity> list = ownerService.list(Wrappers.lambdaQuery(OwnerEntity.class).eq(OwnerEntity::getUserId,userId));

//        .eq(OwnerEntity::getState, 1).eq(OwnerEntity::getDeleted, 0)
//        List<OwnerEntity> ownerList = ownerService.list(list);

        System.out.println(list);

        List<Long> houseIds = new ArrayList<>();
        if (list.size() > 0) {
//            获取 房屋id

            list.forEach(e -> {
                LambdaQueryWrapper<House> houseWrapper = Wrappers.lambdaQuery(House.class)
                        .eq(House::getDeleted, 0)
                        .eq(House::getHouseStatus, 1);
                List<House> houseList = houseService.list(houseWrapper.eq(House::getId, e.getHouseId()));
                System.out.println(houseList);
                houseList.forEach(h -> {
                    houseIds.add(h.getId());
                });
            });
//            去除重复
            HashSet<Long> houseList = new HashSet<>();

            if (houseIds.size() > 0) {
                houseList = new HashSet<>(houseIds);

                System.out.println(houseList);
                List<House> houseIdList = houseService.list(Wrappers.lambdaQuery(House.class)
                        .eq(House::getDeleted, 0).eq(House::getHouseStatus, 1)
                        .in(House::getId, houseList));
                List<Long> CIds = new ArrayList<>();

                houseIdList.forEach(c -> {
                    CIds.add(c.getCommunityId());
                });


//            获取社区id
                HashSet<Long> communityIdList = new HashSet<>(CIds);
                List<UserCommunityVO> communityVOS = new ArrayList<>();
                communityService.listByIds(communityIdList).forEach(c -> {
                    communityVOS.add(new UserCommunityVO(c.getId(), c.getCommunityName()));
                });

                return Result.ok(communityVOS);
            }else {
                return Result.error("未找到社区,您可能不是业主");

            }
        } else {
            return Result.error("未找到社区,您可能不是业主");
        }

    }
    @GetMapping("ownerList/{userId}")
    @Operation(summary = "owner")
    public Result<List<OwnerEntity>> ownerList(@PathVariable Long userId) {

        List<OwnerEntity> list = ownerService.list(Wrappers.lambdaQuery(OwnerEntity.class).eq(OwnerEntity::getUserId,userId));
        return Result.ok(list);
    }

}
