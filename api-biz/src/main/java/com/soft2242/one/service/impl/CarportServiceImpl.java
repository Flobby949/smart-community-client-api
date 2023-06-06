package com.soft2242.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.common.exception.ServerException;
import com.soft2242.one.convert.CarportConvert;
import com.soft2242.one.dao.CarportDao;
import com.soft2242.one.entity.Carport;
import com.soft2242.one.mybatis.service.impl.BaseServiceImpl;
import com.soft2242.one.service.CarportService;
import com.soft2242.one.vo.CarportVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CarportServiceImpl
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 08:50
 */
@Service
@AllArgsConstructor
public class CarportServiceImpl extends BaseServiceImpl<CarportDao, Carport> implements CarportService {
    private final CarportDao carportDao;

    @Override
    public List<CarportVO> myPort(Long ownerId) {
        LambdaQueryWrapper<Carport> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Carport::getOwnerId, ownerId);
        List<CarportVO> list = carportDao.getList(ownerId);
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(Long ownerId) {
        LambdaQueryWrapper<Carport> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Carport::getOwnerId, ownerId);
        carportDao.update(ownerId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(CarportVO vo) {
        System.out.println(vo.toString());
        //先根据用户姓名和手机号查出ownerid
        Long ownerId = baseMapper.getOwnerId(vo.getRealName(),vo.getPhone());
        if(ownerId==null){
            throw new ServerException("你不是业主");
        }
        vo.setOwnerId(ownerId);

        //在更具车牌号查出车牌id
        Long carId = baseMapper.getCarId(vo.getLicence());
        if(carId==null){
            throw new ServerException("车牌号不存在");
        }
        vo.setCarId(carId);
        vo.setStatus(1);
        Carport entity = CarportConvert.INSTANCE.convert(vo);
        updateById(entity);
        return true;
    }

    @Override
    public List<CarportVO> getNoOwner() {
        Map<String,Object> params=new HashMap<String, Object>();
        params.put("status",0);
        List<Carport> carportList = baseMapper.selectByMap(params);
        return CarportConvert.INSTANCE.convertList(carportList);
    }

}
