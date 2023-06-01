package com.soft2242.one.vo;

import lombok.Data;
import lombok.ToString;

/**
 * @ClassName: OwnerInfoVo
 * @Author: lsc
 * @Date: 2023/06/01/20:33
 */
@Data
@ToString
public class OwnerInfoVo {
    private String realName;
    private Integer gender;
    private String phone;
    private String identityCard;
    private Long houseId;
    private String birthday;
    private String nation;
    private Integer marriage;
    private Integer accountType;
    private String party;
    private String domicileLocation;
    private String rentalType;
    private String stayCard;
    private String address;
    private String ec;
}
