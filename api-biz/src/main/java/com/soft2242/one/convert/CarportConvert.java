package com.soft2242.one.convert;

import com.soft2242.one.entity.Carport;
import com.soft2242.one.vo.CarportVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @ClassName CarPortConvert
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/5/31 08:48
 */
@Mapper
public interface CarportConvert {
    CarportConvert INSTANCE = Mappers.getMapper(CarportConvert.class);

    Carport convert(CarportVO vo);

    CarportVO convert(Carport entity);

    List<CarportVO> convertList(List<Carport> list);
    List<Carport> convertLists(List<CarportVO> list);
}
