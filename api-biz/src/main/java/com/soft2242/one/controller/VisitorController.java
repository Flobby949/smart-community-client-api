package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.VisitorConvert;
import com.soft2242.one.convert.VisitorInvitationConvert;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.entity.Visitor;
import com.soft2242.one.entity.VisitorInvitation;
import com.soft2242.one.query.VisitorQuery;
import com.soft2242.one.service.IVisitorInvitationService;
import com.soft2242.one.service.IVisitorService;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.vo.VisitorInvitationVO;
import com.soft2242.one.vo.VisitorVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

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
        List<VisitorInvitationVO> list = VisitorInvitationConvert.INSTANCE.convertList(visitorInvitationService.getAll2(userId));
        PageResult<VisitorInvitationVO> page = new PageResult<>(list, list.size());
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
        Long ownerId ,visitorId ,houseId;

//        获取ownerId
        LambdaQueryWrapper<OwnerEntity> query = Wrappers.lambdaQuery();
        List<OwnerEntity> list = null;
        try {
            query.eq(OwnerEntity::getUserId, vo.getUserId())
                    .eq(OwnerEntity::getState, 1)
                    .eq(OwnerEntity::getDeleted, 0);
            list = ownerService.list(query);
            ownerId = list.get(0).getOwnerId();
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
            wrapper.eq(Visitor::getName,vo.getVisitorName());
            List<Visitor> visitors = visitorService.list(wrapper);

            visitorId = visitors.get(visitors.size()-1).getId();
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

    @PutMapping
    @Operation(summary = "修改访客开门状态")
    public Result<String> update(@Valid @RequestBody VisitorVO vo) {
        visitorService.update(vo);
        return Result.ok();
    }

}
