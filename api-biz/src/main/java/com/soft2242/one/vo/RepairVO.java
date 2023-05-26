package com.soft2242.one.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.soft2242.one.mybatis.entity.BaseEntity;
import lombok.Data;


import java.time.LocalDateTime;

/**
 * 报修表
 * @TableName t_repair
 */
@TableName(value ="t_repair")
@Data
public class RepairVO extends BaseEntity {
    /**
     * 自增主键
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 社区id
     */
    private Long communityId;

    /**
     * 报修人id
     */
    private Long userId;

    /**
     * 报修类别(0:公共报修，1：个人报修)
     */
    private Integer type;

    /**
     * 报修类型(0:路灯，1：厕所)
     */
    private Integer category;

    /**
     * 报修地址
     */
    private String place;

    /**
     * 报修标题
     */
    private String title;

    /**
     * 报修内容
     */
    private String content;

    /**
     * 图片
     */
    private String imgs;

    /**
     * 处理状态（0：未处理，1：处理中，2：已处理，3：已评价）
     */
    private Integer state;

    /**
     * 处理人id，逗号分隔
     */
    private String employeeIds;

    /**
     * 处理结果
     */
    private String result;

    /**
     * 处理时间
     */
    private LocalDateTime handleTime;

    /**
     * 报修评价
     */
    private String evaluate;

    /**
     * 报修评价时间
     */
    private LocalDateTime evaluateTime;
}
