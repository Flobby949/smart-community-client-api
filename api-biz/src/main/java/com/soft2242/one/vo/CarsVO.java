package com.soft2242.one.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.soft2242.one.common.utils.DateUtils;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName CarsVO
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:35
 */
@Data
@Schema(description = "车辆表")
public class CarsVO {
    private static final long serialVersionUID = 1L;

    @Schema(description = "自增主键")
    private Long id;

    @Schema(description = "用户id")
    private Long userId;
    @Schema(description = "用户名")
    private String realName;
    @Schema(description = "用户电话")
    private String phone;

    @Schema(description = "车牌号")
    private String licence;

    @Schema(description = "车辆品牌")
    private String brand;

    @Schema(description = "车辆型号")
    private String specification;

    @Schema(description = "车辆颜色")
    private String color;

    @Schema(description = "保险截止日期")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date deadline;

    @Schema(description = "年审日期")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date annualTime;

    @Schema(description = "删除标识（0：未删除 1：已删除）")
    private Integer deleted;

    @Schema(description = "创建者")
    private Long creator;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    private Date createTime;

    @Schema(description = "更新者")
    private Long updater;

    @Schema(description = "更新时间")
    @JsonFormat(pattern = DateUtils.DATE_TIME_PATTERN)
    private Date updateTime;
}
