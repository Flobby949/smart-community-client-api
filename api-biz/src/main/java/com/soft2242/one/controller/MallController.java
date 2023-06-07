package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.MallConvert;
import com.soft2242.one.entity.Community;
import com.soft2242.one.entity.House;
import com.soft2242.one.entity.Mall;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.query.MallQuery;
import com.soft2242.one.service.CommunityService;
import com.soft2242.one.service.HouseService;
import com.soft2242.one.service.IMallService;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.vo.MallVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


/**
 * @author ysh
 * @since 2023-05-25
 */


@RestController
@Tag(name = "商铺")
@RequestMapping("soft2242/mall")
@AllArgsConstructor

public class MallController {
    private final IMallService MallService;
    private final CommunityService communityService;
    private final HouseService houseService;
    private final OwnerService ownerService;


    @GetMapping("page")
    @Operation(summary = "分页查询")
    public Result<PageResult<MallVO>> page(@ParameterObject @Valid MallQuery query) {
        PageResult<MallVO> page = MallService.page(query);
        return Result.ok(page);
    }

    @GetMapping("list")
    @Operation(summary = "商铺列表")
    public Result<List<MallVO>> list() {
        List<Mall> list = MallService.list();
        List<MallVO> mallVOS = MallConvert.INSTANCE.convertList(list);
        mallVOS.forEach(o -> {
            o.setCommunityName(communityService.getById(o.getCommunityId()).getCommunityName());
        });
        return Result.ok(mallVOS);
    }

    @GetMapping("listByCommunityId/{communityId}")
    @Operation(summary = "商铺列表By communityId")
    public Result<List<MallVO>> listByCommunityId(@PathVariable Long communityId) {
        LambdaQueryWrapper<Mall> wrapper = Wrappers.lambdaQuery();
        if (communityId != null)
            wrapper.eq(Mall::getCommunityId, communityId);
        wrapper.eq(Mall::getDeleted, 0).eq(Mall::getMallStatus, 0);
        List<Mall> list = MallService.list(wrapper);
        List<MallVO> mallVOS = MallConvert.INSTANCE.convertList(list);
        mallVOS.forEach(o -> {
            o.setCommunityName(communityService.getById(o.getCommunityId()).getCommunityName());
        });
        return Result.ok(mallVOS);
    }

    @GetMapping("listByUserId/{userId}")
    @Operation(summary = "商铺列表By userId")
    public Result<List<MallVO>> listByUserId(@PathVariable Long userId) {
        LambdaQueryWrapper<Mall> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(Mall::getDeleted, 0).eq(Mall::getMallStatus, 0);

//        获取houseid list
        List<OwnerEntity> ownerList = ownerService.list(
                Wrappers.lambdaQuery(OwnerEntity.class).eq(OwnerEntity::getUserId, userId));

        if (ownerList == null)
            return Result.error("没有找到用户对应的店铺");

        List<Long> communityIds = new ArrayList<>();
        ownerList.forEach(o -> {
            List<House> list = houseService.list(Wrappers.lambdaQuery(House.class).eq(House::getId, o.getHouseId()));
            if (list != null && list.size() > 0)
                list.forEach(h -> communityIds.add(h.getCommunityId()));
        });

//        获取communityId list
//        去除重复
        List<Long> communities = new ArrayList<>(communityIds);
        List<MallVO> mallVOS = new ArrayList<>();

        if (communities.size() == 0) {
            return Result.error("没有找到用户对应的店铺");

        }else {
            wrapper.in(Mall::getId, communities);
            List<Mall> list = MallService.list(wrapper);
             mallVOS = MallConvert.INSTANCE.convertList(list);
            mallVOS.forEach(o -> {
                o.setCommunityName(communityService.getById(o.getCommunityId()).getCommunityName());
            });
        }

        return Result.ok(mallVOS);
    }

    @GetMapping("{id}")
    @Operation(summary = "商铺查询")
    public Result<MallVO> get(@PathVariable("id") Long id) {
        Mall entity = MallService.getById(id);
        return Result.ok(MallConvert.INSTANCE.convert(entity));
    }

    @PostMapping
    @Operation(summary = "生成订单")
    public Result<String> create(@Valid @RequestBody MallVO vo) {
        MallService.save(vo);
        return Result.ok();
    }


}
