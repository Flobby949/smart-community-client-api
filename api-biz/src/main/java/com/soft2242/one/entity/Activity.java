package com.soft2242.one.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.*;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 社区活动
 *
 * @author 软件2242 soft2242@gmail.com
 * @since 1.0.0 2023-05-25
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@TableName("t_activity")
public class Activity {

	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId(value = "id", type = IdType.AUTO)
	private Long id;

	/**
	 * 社区id
	 */
	private Long communityId;

	/**
	 * 物业表的，关联物业公司
	 */
	private String property;

	/**
	 * 排序
	 */
	private Integer sort;

	/**
	 * 活动名称
	 */
	private String activityName;

	/**
	 * 活动类别
	 */
	private Long typeId;

	/**
	 * 活动标题
	 */
	private String title;

	/**
	 * 活动内容（可为空）
	 */
	private String content;

	/**
	 * 活动地点
	 */
	private String location;

	/**
	 * 查看人数
	 */
	private String viewerCount;

	/**
	 * 电话
	 */
	private String tel;

	/**
	 * 状态  0：正常 1：失效
	 */
	private Integer status;

	/**
	 * 发布时间
	 */
	private LocalDateTime publishTime;

	/**
	 * 活动截至时间
	 */
	private LocalDateTime endTime;

	/**
	 * 删除标识 0：正常 1：已删除
	 */
	private Integer deleted;

	/**
	 * 创建时间
	 */
	private LocalDateTime createTime;

	/**
	 * 创建者
	 */
	private Long creator;

	/**
	 * 更新者
	 */
	private Long updater;

	/**
	 * 更新时间
	 */
	private LocalDateTime updateTime;

	private String cover;

}