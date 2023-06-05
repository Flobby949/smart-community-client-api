package com.soft2242.one.vo;

import lombok.Data;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 我的房屋VO
 * @create : 2023-06-05 17:28
 **/

@Data
public class HouseVO {

    private Long id;

    /**
     * 社区id
     */
    private Long communityId;

    /**
     * 楼宇id
     */
    private Long buildingId;

    /**
     * 房间号
     */
    private String houseNumber;

    /**
     * 建筑面积
     */
    private Integer houseArea;

    /**
     * 房屋状态（0：未使用 1：使用中）
     */
    private Byte houseStatus;

    /**
     * 备注
     */
    private String content;

    /**
     * 社区名称
     */
    private String communityName;
    /**
     * 楼宇名称
     */
    private String buildingName;
    /**
     * 所在单元
     */
    private Integer units;
    /**
     * 是否是业主
     */
    private Integer isOwner;

    private Long ownerId;
}
