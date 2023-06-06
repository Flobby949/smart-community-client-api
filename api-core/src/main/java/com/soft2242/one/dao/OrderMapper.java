package com.soft2242.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.soft2242.one.entity.Order;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

}
