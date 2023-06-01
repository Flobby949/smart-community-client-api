package com.soft2242.one.convert;

import com.soft2242.one.entity.PassReviewEntity;
import com.soft2242.one.vo.AuditVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author : Flobby
 * @program : community-client-api
 * @description : 门禁审核转换
 * @create : 2023-06-01 13:22
 **/

@Mapper
public interface PassReviewConvert {
    PassReviewConvert INSTANCE = Mappers.getMapper(PassReviewConvert.class);

    PassReviewEntity convert(AuditVO vo);
}
