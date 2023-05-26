package com.soft2242.one.controller;


import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.MallConvert;
import com.soft2242.one.entity.Mall;
import com.soft2242.one.query.MallQuery;
import com.soft2242.one.service.IMallService;
import com.soft2242.one.vo.MallVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;



/**
 * <p>
 * 商铺表 前端控制器
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */

@RestController
@Tag(name = "商铺")
@RequestMapping("soft2242/mall")
@AllArgsConstructor
public class MallController {
    private final IMallService MallService;

    @GetMapping("page")
    @Operation(summary = "分页查询")
    public Result<PageResult<MallVO>> page(@ParameterObject @Valid MallQuery query) {
        PageResult<MallVO> page = MallService.page(query);
        return Result.ok(page);
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
