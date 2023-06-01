package com.soft2242.one.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description :
 * @create : 2023-06-01 13:19
 **/

@Data
@Schema(description = "门禁审核")
public class AuditVO {

    /**
     * 业主id
     */
    @Schema(description = "业主id")
    private Long ownerId;

    /**
     * 业主名
     */
    @Schema(description = "业主名")
    private String realName;

    /**
     * 房屋id
     */
    @Schema(description = "房屋id")
    private Long houseId;

    /**
     * 房屋id
     */
    @Schema(description = "审核状态")
    private Integer status;

    /**
     * 小区名
     */
    @Schema(description = "小区名")
    private String communityName;

    /**
     * 是否有人脸（0-无，1-有）
     */
    @Schema(description = "是否有人脸")
    private Integer face;

    /**
     * 是否有指纹（0-无，1-有）
     */
    @Schema(description = "是否有指纹")
    private Integer finger;
}
