package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.Community;
import com.soft2242.one.service.CommunityService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName CommunityController
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:42
 */
@RestController
@RequestMapping("/sys/community")
@Tag(name = "小区管理")
@AllArgsConstructor
public class CommunityController {
    private final CommunityService communityService;

    @GetMapping("list")
    @Operation(summary = "小区列表")
    public Result<List<Community>> list() {
        List<Community> list = communityService.getList();
        return Result.ok(list);
    }
}
