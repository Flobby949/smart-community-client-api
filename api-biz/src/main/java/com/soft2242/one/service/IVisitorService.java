package com.soft2242.one.service;

<<<<<<< HEAD
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.entity.Visitor;
import com.soft2242.one.mybatis.service.BaseService;
import com.soft2242.one.query.VisitorQuery;
import com.soft2242.one.vo.VisitorVO;

/**
 * <p>
 * 服务类
=======
import com.soft2242.one.entity.Visitor;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
>>>>>>> origin/test
 * </p>
 *
 * @author ysh
 * @since 2023-05-25
 */
<<<<<<< HEAD
public interface IVisitorService extends BaseService<Visitor> {
    PageResult<VisitorVO> page(VisitorQuery query);

    void save(VisitorVO vo);

    void update(VisitorVO vo);
=======
public interface IVisitorService extends IService<Visitor> {

>>>>>>> origin/test
}
