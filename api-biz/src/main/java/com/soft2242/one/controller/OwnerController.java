package com.soft2242.one.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.entity.OwnerEntity;
import com.soft2242.one.entity.UserEntity;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.OwnerService;
import com.soft2242.one.service.UserService;
import com.soft2242.one.service.service.StorageService;
import com.soft2242.one.vo.HouseOptionsVo;
import com.soft2242.one.vo.MyFamilyVo;
import com.soft2242.one.vo.MyHouseListVo;
import com.soft2242.one.vo.OwnerInfoVo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    private final UserService userService;
    private final StorageService storageService;

    @PostMapping("findMyHouseList")
    @Operation(summary ="名下房屋列表")
    public Result<List<MyHouseListVo>> findMyHouseList(Integer identity){
        System.out.println(identity);
        List<MyHouseListVo> list = ownerService.findMyHouseById(SecurityUser.getUserId(),identity);
        return Result.ok(list);
    }
    @PostMapping("findFamily")
    @Operation(summary ="获取家庭成员信息")
    private Result<List<MyFamilyVo>> findFamily(Long houseId){
        List<MyFamilyVo> list = ownerService.findFamily(houseId);
        return Result.ok(list);
    }
    @DeleteMapping("deleteFamily")
    @Operation(summary = "删除家庭成员信息")
    private Result<String> deleteFamily(Long id){
        if(ownerService.deleteFamily(id,SecurityUser.getUserId()))
            return Result.ok();
        else
            return Result.error(0,"删除失败");
    }
    @PostMapping("addFamily")
    @Operation(summary = "绑定家庭成员信息")
    private Result<String> addFamily(OwnerEntity owner){
        QueryWrapper<OwnerEntity> wrapper = new QueryWrapper<>();
        wrapper.lambda().select(OwnerEntity::getId).eq(OwnerEntity::getHouseId,owner.getHouseId()).eq(OwnerEntity::getUserId,SecurityUser.getUserId())
                .eq(OwnerEntity::getState,1).eq(OwnerEntity::getIdentity,0).eq(OwnerEntity::getDeleted,0);
        OwnerEntity one = ownerService.getOne(wrapper);
        if(one.getId()!=null){
            owner.setOwnerId(one.getId());
            owner.setState(1);
            if(ownerService.save(owner))
                return Result.ok();
            else
                return Result.error(0,"绑定失败");
        }
        return Result.error(0,"绑定失败");
    }
    @PostMapping("houseOptions")
    @Operation(summary = "获取房屋列表选项信息")
    private Result<List<HouseOptionsVo>> houseOptions(){
        List<HouseOptionsVo> list = ownerService.findHouseOptions();
        return Result.ok(list);
    }
    @PostMapping("sbCertify")
    @Operation(summary = "业主提交认证信息")
    private Result<String> sbCertify(@RequestBody OwnerInfoVo ownerInfoVo){
        OwnerEntity owner = OwnerEntity.builder().userId(SecurityUser.getUserId()).houseId(ownerInfoVo.getHouseId())
                .realName(ownerInfoVo.getRealName()).phone(ownerInfoVo.getPhone()).identityCard(ownerInfoVo.getIdentityCard()).eContacts(ownerInfoVo.getEc())
                .identity(0).gender(ownerInfoVo.getGender()).build();
        ownerService.save(owner);
        UpdateWrapper<UserEntity> wrapper = new UpdateWrapper<>();
        wrapper.lambda().set(UserEntity::getGender,ownerInfoVo.getGender()).set(UserEntity::getRealName,ownerInfoVo.getRealName())
                .set(UserEntity::getBirthday,ownerInfoVo.getBirthday()).set(UserEntity::getNation,ownerInfoVo.getNation())
                .set(UserEntity::getMarriage,ownerInfoVo.getMarriage()).set(UserEntity::getAccountType,ownerInfoVo.getAccountType())
                .set(UserEntity::getParty,ownerInfoVo.getParty()).set(UserEntity::getDomicileLocation,ownerInfoVo.getDomicileLocation())
                .set(UserEntity::getRentalType,ownerInfoVo.getRentalType()).set(StringUtils.isNotEmpty(ownerInfoVo.getStayCard()),UserEntity::getStayCard,ownerInfoVo.getStayCard())
                .set(UserEntity::getAddress,ownerInfoVo.getAddress()).eq(UserEntity::getId,SecurityUser.getUserId());
        userService.update(new UserEntity(),wrapper);
        return Result.ok();
    }
}
