package com.soft2242.one.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Author: 袁晟浩
 * Date: 2023/6/8 13:12
 * Describe:
 */
@Data
@Schema(description = "访客邀请-用户所属社区")
@AllArgsConstructor
@NoArgsConstructor
public class UserCommunityVO implements Serializable {

    @Schema(description = "小区id")
    private Long id;

    @Schema(description = "小区")
    private String communityName;

}
