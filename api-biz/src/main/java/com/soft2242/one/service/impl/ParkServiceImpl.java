package com.soft2242.one.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.dao.CarDao;
import com.soft2242.one.dao.ParkDao;
import com.soft2242.one.dao.ParkRecordDao;
import com.soft2242.one.entity.Car;
import com.soft2242.one.entity.Park;
import com.soft2242.one.entity.ParkRecord;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.query.ParkQuery;
import com.soft2242.one.service.ParkService;
import com.soft2242.one.vo.CartParkVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @ClassName ParkServiceImpl
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 18:22
 */
@Service
@AllArgsConstructor
public class ParkServiceImpl extends BaseServiceImpl<ParkDao, Park> implements ParkService {
    private final ParkRecordDao parkRecordDao;

    private final CarDao carDao;

    @Override
    public List<Park> getList() {
        ParkQuery query = new ParkQuery();
        List<Park> entityList = baseMapper.selectList(getWrapper(query));

        return entityList;
    }

    @Override
    public List<CartParkVO> getMyCartParkVO(Long userId) {
        LambdaQueryWrapper<Car> wrapper1 = new LambdaQueryWrapper<>();
        wrapper1.eq(Car::getUserId, userId);
        List<Car> carList = carDao.selectList(wrapper1);
        List<Long> list = carList.stream().map(item -> item.getId()).collect(Collectors.toList());
        if (list.size() == 0) {
            throw new ServerException("该用户没有车辆");
        }
        // 根据用户id查询车辆id
        LambdaQueryWrapper<ParkRecord> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(ParkRecord::getCarId, list);
        List<ParkRecord> parkRecordList = parkRecordDao.selectList(wrapper);
        ArrayList<CartParkVO> arrayList = new ArrayList<>();
        for (ParkRecord record : parkRecordList) {
            CartParkVO parkVO = new CartParkVO();
            parkVO.setCar_id(record.getCarId());
            parkVO.setAccess_time(record.getAccessTime());
            parkVO.setLeave_time(record.getLeaveTime());
            parkVO.setTotal_time(getTotalTime(record.getAccessTime(), record.getLeaveTime()));
            parkVO.setTotal_price(record.getPrice());
            parkVO.setType(record.getType());
            arrayList.add(parkVO);
        }
        // 根据拿到的列表去查询车辆信息
        arrayList.forEach(item -> {
            Car car = carDao.selectById(item.getCar_id());
            item.setLicence(car.getLicence());
            item.setPrice(10.00);
        });
        return arrayList;
    }

    private Long getTotalTime(Date accessTime, Date leaveTime) {
        // 计算停车时间
        long time = leaveTime.getTime() - accessTime.getTime();
        return time;
    }

    private Wrapper<Park> getWrapper(ParkQuery query) {
        LambdaQueryWrapper<Park> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotBlank(query.getParkName()), Park::getParkName, query.getParkName());
        return wrapper;
    }
}
