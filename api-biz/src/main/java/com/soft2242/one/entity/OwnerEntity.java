package com.soft2242.one.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.soft2242.one.mybatis.entity.BaseEntity;
import lombok.*;

import java.io.Serializable;

/**
 * @ClassName: OwnerEntity
 * @Author: lsc
 * @Date: 2023/05/25/11:27
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@TableName("t_owner")
public class OwnerEntity extends BaseEntity implements Serializable {
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 房屋id
     */
    private Long houseId;
    /**
     * 业主id
     */
    private Long ownerId;
    /**
     * 真实姓名
     */
    private String realName;
    /**
     * 性别
     * 0-保密
     * 1-男
     * 2-女
     */
    private Integer gender;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 身份证
     */
    private String identityCard;
    /**
     * 紧急联系人信息
     */
    private String eContacts;
    /**
     * 身份标识(0:业主 1:家属 2:租户)
     */
    private Integer identity;
    /**
     * 默认地址(0：否 1：是)
     */
    private Integer defaultAddress;
    /**
     * 状态(0:未审核1:已通过2:未通过)
     */
    private Integer state;
}
