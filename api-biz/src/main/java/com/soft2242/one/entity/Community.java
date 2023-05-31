package com.soft2242.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serial;
import java.util.Date;

/**
 * @ClassName Community
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:35
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("t_community")
public class Community {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 自增主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 社区名称
     */
    private String communityName;

    /**
     * 所在地区
     */
    private String address;

    /**
     * 占地面积
     */
    private Integer coverArea;

    /**
     * 社区图片（英文逗号分割）
     */
    private String communityImgs;

    /**
     * 备注
     */
    private String content;

    /**
     * 删除标识（0：未删除 1：已删除）
     */
    private Byte deleted;

    /**
     * 创建者
     */
    private Long creator;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新者
     */
    private Long updater;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;
}
