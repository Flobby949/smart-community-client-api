package com.soft2242.one.convert;

import com.soft2242.one.entity.Cars;
import com.soft2242.one.vo.CarsVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * @ClassName CarsConvert
 * @Description TODO
 * @Author Dr.king
 * @Date 2023/6/1 13:34
 */
@Mapper
public interface CarsConvert {
    CarsConvert INSTANCE = Mappers.getMapper(CarsConvert.class);

    Cars convert(CarsVO vo);

    CarsVO convert(Cars entity);

    List<CarsVO> convertList(List<Cars> list);
    List<Cars> convertListEntity(List<CarsVO> list);
}
