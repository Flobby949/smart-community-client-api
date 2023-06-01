package com.soft2242.one.query;

import com.soft2242.one.common.query.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName CarsQuery
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "车辆表查询")
public class CarsQuery extends Query {
    @Schema(description = "车牌号")
    private String licence;
}
