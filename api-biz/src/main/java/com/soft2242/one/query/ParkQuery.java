package com.soft2242.one.query;

import com.soft2242.one.common.query.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName ParkQuery
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 18:23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "停车场表查询")
public class ParkQuery extends Query {
    @Schema(description = "停车场名称")
    private String parkName;
    @Schema(description = "小区名称")
    private String communityName;
}
