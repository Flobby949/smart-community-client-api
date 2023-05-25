package com.soft2242.one.service.impl;

import com.soft2242.one.entity.Bill;
import com.soft2242.one.dao.BillMapper;
import com.soft2242.one.service.IBillService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
@Service
public class BillServiceImpl extends ServiceImpl<BillMapper, Bill> implements IBillService {

}
