package com.soft2242.one.service;

import com.soft2242.one.entity.Park;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.vo.CartParkVO;

import java.util.List;

/**
 * @ClassName ParkService
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 17:53
 */
public interface ParkService extends BaseService<Park> {
    /**
     * 获取所有停车场数据
     *
     * @return list
     */
    List<Park> getList();

    List<CartParkVO> getMyCartParkVO(Long userId);
}
