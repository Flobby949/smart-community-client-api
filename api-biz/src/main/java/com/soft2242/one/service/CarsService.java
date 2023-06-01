package com.soft2242.one.service;

import com.soft2242.one.entity.Cars;
import com.soft2242.one.mybatis.service.BaseService;

import java.util.List;

/**
 * @ClassName CarsService
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:25
 */
public interface CarsService extends BaseService<Cars> {
    /**
     * 获取所有车辆数据
     *
     * @return list
     */
    List<Cars> myCar(Long userId);

    /**
     *  添加车辆
     */
    boolean save(Cars vo);
}
