package com.soft2242.one.controller;

import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.CarportConvert;
import com.soft2242.one.entity.Carport;
import com.soft2242.one.query.CarportQuery;
import com.soft2242.one.security.user.SecurityUser;
import com.soft2242.one.service.CarportService;
import com.soft2242.one.vo.CarportVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @ClassName CarportController
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 08:53
 */
@RestController
@RequestMapping("/sys/carport")
@Tag(name = "车位管理")
@AllArgsConstructor
public class CarportController {
    private final CarportService carportService;


    @PostMapping("/myPort")
    @Operation(summary = "查询当前登录用户的车位信息")
    public Result<List<CarportVO>> myPort() {
        Long userId = SecurityUser.getUserId();
        //通过userId找到所有已经认真成功的ownerid
        List<CarportVO> list = carportService.myPort();
        return Result.ok(list);

    }
    @PutMapping()
    @Operation(summary = "修改车位绑定业主")
    //@PreAuthorize("hasAuthority('sys:carport:update')")
    public Result<String> update() {
        carportService.update();
        return Result.ok();
    }

    @PostMapping
    @Operation(summary = "新增车位")
    //@PreAuthorize("hasAuthority('sys:carport:save')")
    public Result<String> save(@RequestBody CarportVO vo) {
        carportService.save(vo);
        return Result.ok();
    }


    @GetMapping("/noOwner")
    @Operation(summary = "空闲的车位")
    public Result<List<CarportVO>> getNoOwner(){
        List<CarportVO> noOwner = carportService.getNoOwner();
        return Result.ok(noOwner);
    }
}
