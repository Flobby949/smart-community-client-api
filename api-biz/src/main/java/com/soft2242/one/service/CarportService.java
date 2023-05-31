package com.soft2242.one.service;

import com.soft2242.one.entity.Carport;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.vo.CarportVO;

import java.util.List;

/**
 * @ClassName CarportService
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 08:49
 */
public interface CarportService extends BaseService<Carport> {

    /**
     * 获取当前登录者车位数据
     *
     * @return list
     */
    List<CarportVO> myPort(Long ownerId);
    /**
     * 修改车位绑定
     *
     * @param
     */
    void update(Long ownerId);

    /**
     * 新增车位
     *
     * @param vo vo
     * @return
     */
    boolean save(CarportVO vo);

}
