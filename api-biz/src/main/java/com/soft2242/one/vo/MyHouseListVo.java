package com.soft2242.one.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @ClassName: MyHouseListVo
 * @Author: lsc
 * @Date: 2023/05/25/15:01
 */
@Data
@Schema(description = "房屋信息")
public class MyHouseListVo {
    private Integer houseId;
    private String name;
}
