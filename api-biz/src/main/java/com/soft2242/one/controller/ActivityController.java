package com.soft2242.one.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.ActivityConvert;
import com.soft2242.one.entity.Activity;
import com.soft2242.one.query.ActivityQuery;
import com.soft2242.one.service.ActivityService;
import com.soft2242.one.service.ActivityTypeService;
import com.soft2242.one.vo.ActivityVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 社区活动
 *
 * @author 软件2242 soft2242@gmail.com
 * @since 1.0.0 2023-05-25
 */
@RestController
@RequestMapping("soft2242/activity")
@Tag(name = "社区活动")
@AllArgsConstructor
public class ActivityController {
    private final ActivityService activityService;
    private final ActivityTypeService activityTypeService;

    private List<ActivityVO> insertInfo(List<ActivityVO> activityVO) {

        activityVO.forEach(o -> {
            try {
                o.setActivityType(activityTypeService.getById(o.getTypeId()).getName());
                o.setATime(changeForm(o.getCreateTime(), o.getEndTime()));
            } catch (Exception e) {
                o.setActivityType(null);
                o.setATime(null);
                throw new RuntimeException(e);
            }
        });
        return activityVO;
    }

    @GetMapping("page")
    @Operation(summary = "分页")
//    @PreAuthorize("hasAuthority('soft2242:activity:page')")
    public Result<PageResult<ActivityVO>> page(@ParameterObject @Valid ActivityQuery query) {
        PageResult<ActivityVO> page = activityService.page(query);

        return Result.ok(page);
    }

    @GetMapping("list")
    @Operation(summary = "活动列表")
//    @PreAuthorize("hasAuthority('soft2242:activity:page')")
    public Result<List<ActivityVO>> list() {
//        PageResult<ActivityVO> page = activityService.page(new ActivityQuery())
        LambdaQueryWrapper<Activity> wrapper = Wrappers.lambdaQuery();
        wrapper.eq(Activity::getDeleted,0).eq(Activity::getStatus,0);
        List<Activity> list = activityService.list(wrapper);
        List<ActivityVO> activityVOS = ActivityConvert.INSTANCE.convertList(list);
//        配置
        return Result.ok(insertInfo(activityVOS));
    }

    @GetMapping("{id}")
    @Operation(summary = "信息")
//    @PreAuthorize("hasAuthority('soft2242:activity:info')")
    public Result<ActivityVO> get(@PathVariable("id") Long id) {
        Activity entity = activityService.getById(id);
        ActivityVO activityVO = ActivityConvert.INSTANCE.convert(entity);

        try {
            activityVO.setActivityType(activityTypeService.getById(activityVO.getTypeId()).getName());
            activityVO.setATime(changeForm(activityVO.getCreateTime(), activityVO.getEndTime()));
        } catch (Exception e) {
            activityVO.setActivityType(null);
            activityVO.setATime(null);
            throw new RuntimeException(e);
        }

        return Result.ok(activityVO);
    }

    @PostMapping
    @Operation(summary = "保存")
//    @PreAuthorize("hasAuthority('soft2242:activity:save')")
    public Result<String> save(@RequestBody ActivityVO vo) {
        activityService.save(vo);

        return Result.ok();
    }

    @PutMapping
    @Operation(summary = "修改")
//    @PreAuthorize("hasAuthority('soft2242:activity:update')")
    public Result<String> update(@RequestBody @Valid ActivityVO vo) {
        activityService.update(vo);

        return Result.ok();
    }

    //    逻辑删除
    @PutMapping("delete/{id}")
    @Operation(summary = "删除")

//    @PreAuthorize("hasAuthority('soft2242:activity:update')")
    public Result<String> delete(@PathVariable("id") Long id) {
        Activity entity = activityService.getById(id);
        entity.setDeleted(1);
        ActivityVO vo = ActivityConvert.INSTANCE.convert(entity);
        activityService.update(vo);
        return Result.ok();
    }
//    @DeleteMapping
//    @Operation(summary = "删除")
////    @PreAuthorize("hasAuthority('soft2242:activity:delete')")
//    public Result<String> delete(@RequestBody List<Long> idList){
//        activityService.delete(idList);
//
//        return Result.ok();
//    }


    private String changeForm(LocalDateTime create, LocalDateTime end) {
        return create.toString().substring(0, 10) + "~" + end.toString().substring(0, 10);
    }
}