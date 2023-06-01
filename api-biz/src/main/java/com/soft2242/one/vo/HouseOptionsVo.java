package com.soft2242.one.vo;

import lombok.Data;

import java.util.List;

/**
 * @ClassName: HouseOptionsVo
 * @Author: lsc
 * @Date: 2023/06/01/13:24
 */
@Data
public class HouseOptionsVo {
    private String name;
    private Long id;
    private List<HouseOptionsVo> items;
}
