package com.soft2242.one.convert;

import com.soft2242.one.entity.House;
import com.soft2242.one.vo.HouseVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 房屋转换
 * @create : 2023-06-05 17:34
 **/

@Mapper
public interface HouseConvert {
    HouseConvert INSTANCE = Mappers.getMapper(HouseConvert.class);

    HouseVO convert(House entity);
}
