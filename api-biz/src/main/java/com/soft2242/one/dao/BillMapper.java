package com.soft2242.one.dao;

import com.soft2242.one.entity.Bill;
import com.soft2242.one.mybatis.dao.BaseDao;
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
public interface BillMapper extends BaseDao<Bill> {

}
