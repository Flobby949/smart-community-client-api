package com.soft2242.one.convert;

import com.soft2242.one.entity.Visitor;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * Author: James
 * Date: 2023/5/25 14:51
 * Describe:
 */
public interface VisitorConvert {
    VisitorConvert INSTANCE = Mappers.getMapper(VisitorConvert.class);

    Visitor convert(VisitorConvert vo);
    VisitorConvert convert(Visitor entity);

    List<VisitorConvert> convertList(List<Visitor> list);



}
