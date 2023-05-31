package com.soft2242.one.controller;

import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.ComplaintConvert;

import com.soft2242.one.entity.ComplaintEntity;
import com.soft2242.one.query.ComplaintQuery;
import com.soft2242.one.service.ComplaintService;


import com.soft2242.one.utils.MyUtils;
import com.soft2242.one.vo.ComplaintVO;
import com.soft2242.one.vo.NoticeVO;
import com.soft2242.one.vo.RepairVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import java.util.ArrayList;
import java.util.List;

/**
* 投诉
*
* @author xuelong
* @since 1.0.0 2023-05-26
*/
@RestController
@RequestMapping("property/complaint")
@Tag(name="投诉")
@AllArgsConstructor
public class ComplaintController {
    private final ComplaintService complaintService;


    @GetMapping("page")
    @Operation(summary = "分页")
//    @PreAuthorize("hasAuthority('soft2242:complaint:page')")
    public Result<PageResult<ComplaintVO>> page(@ParameterObject @Valid ComplaintQuery query){
        PageResult<ComplaintVO> page = complaintService.page(query);
        List<ComplaintVO> list = page.getList();
//        for (ComplaintVO vo: list) {
//            String employees = vo.getEmployees();
//            vo.setEmployeeIds(MyUtils.convertToArray(employees));
//            String[] employeeIds = vo.getEmployeeIds();
//            if (employeeIds != null) {
//                ArrayList<String> names = new ArrayList<String>();
//                for (String employeeId : employeeIds) {
//                    //登录用户的信息来获取
//                    SysUserInfoEntity entity = sysUserService.getUserInfoByAdminId(Long.valueOf(employeeId));
//                    names.add(entity.getRealName());
//                }
//                vo.setEmployeeNames(names.toArray(new String[names.size()]));
//            }
//
//        }
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @Operation(summary = "信息")
//    @PreAuthorize("hasAuthority('soft2242:complaint:info')")
    public Result<ComplaintVO> get(@PathVariable("id") Long id){
        ComplaintEntity entity = complaintService.getById(id);

        return Result.ok(ComplaintConvert.INSTANCE.convert(entity));
    }

    @PostMapping
    @Operation(summary = "保存")
//    @PreAuthorize("hasAuthority('soft2242:complaint:save')")
    public Result<String> save(@RequestBody ComplaintVO vo){
        complaintService.save(vo);

        return Result.ok();
    }

    @PutMapping
    @Operation(summary = "修改")
//    @PreAuthorize("hasAuthority('soft2242:complaint:update')")
    public Result<String> update(@RequestBody @Valid ComplaintVO vo){
        complaintService.update(vo);

        return Result.ok();
    }

    @DeleteMapping
    @Operation(summary = "删除")
//    @PreAuthorize("hasAuthority('soft2242:complaint:delete')")
    public Result<String> delete(@RequestBody List<Long> idList){
        complaintService.delete(idList);

        return Result.ok();
    }
}
