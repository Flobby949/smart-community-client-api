package com.soft2242.one.controller;

import com.soft2242.one.common.utils.Result;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.security.user.UserDetail;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.vo.MyFamilyVo;
import com.soft2242.one.vo.MyHouseListVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName: OwnerController
 * @Author: lsc
 * @Date: 2023/05/25/13:37
 */
@RestController
@RequestMapping("owner")
@Tag(name = "业主管理")
@AllArgsConstructor
public class OwnerController {
    private final OwnerService ownerService;

    @PostMapping("findMyHouseList")
    @Operation(summary ="名下房屋列表")
    public Result<List<MyHouseListVo>> findMyHouseList(){
        List<MyHouseListVo> list = ownerService.findMyHouseById(SecurityUser.getUser().getId());
        return Result.ok(list);
    }
//    @PostMapping("findFamily")
//    @Operation(summary ="获取家庭成员信息")
//    private Result<List<MyFamilyVo>> findFamily(Long houseId){
//        List<MyFamilyVo> list = ownerService.findFamily(houseId);
//        return Result.ok(list);
//    }
}
