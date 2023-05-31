package com.soft2242.one.query;

import com.soft2242.one.common.query.Query;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName CommunityQuery
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:40
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Schema(description = "社区管理查询")
public class CommunityQuery extends Query {
    @Schema(description = "社区名称")
    private String communityName;
    @Schema(description = "社区地址")
    private String address;
}
