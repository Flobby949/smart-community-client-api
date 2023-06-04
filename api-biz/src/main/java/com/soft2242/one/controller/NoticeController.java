package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.NoticeConvert;
import com.soft2242.one.convert.NoticeQueryConvert;

import com.soft2242.one.entity.NoticeEntity;
import com.soft2242.one.entity.NoticeReaderEntity;

import com.soft2242.one.query.NoticeQuery;
import com.soft2242.one.query.NoticeReaderQuery;

import com.soft2242.one.security.user.UserDetail;
import com.soft2242.one.service.NoticeReaderService;
import com.soft2242.one.service.NoticeService;
import com.soft2242.one.vo.NoticeVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.soft2242.one.security.user.SecurityUser.getUser;

/**
 * @Author : xuelong
 * @program
 * @description
 * @create 2023/5/24 14:59
 */
@RestController
@RequestMapping("property/notice")
@AllArgsConstructor
@Tag(name = "公告管理")
public class NoticeController {

    private final NoticeService noticeService;
    private final NoticeReaderService noticeReaderService;

    @GetMapping("page")
    @Operation(summary = "分页")
//    @PreAuthorize("hasAuthority('sys:user:page')")
    public Result<PageResult<NoticeVO>> page(@ParameterObject @Valid NoticeQuery query) {
        String status = query.getStatus();
        UserDetail userDetail = getUser();
        query.setUserId(String.valueOf(userDetail.getId()));
        IPage<NoticeEntity> page;
        HashMap<String, Object> resMap = null;
        List<NoticeVO> resList = null;
        if (status == null || "0".equals(status)) {
//            //先获取未读
            query.setStatus("1");
            resMap = noticeService.page(query);
            page = (IPage<NoticeEntity>) resMap.get("page");
            resList = (List<NoticeVO>) resMap.get("list");
            query.setStatus("2");
            //获取已读数据
            resMap = noticeService.page(query);
            IPage<NoticeEntity> page2 = (IPage<NoticeEntity>) resMap.get("page");
            if (resList == null || resList.size() == 0) {
                resList = new ArrayList<NoticeVO>();
            }
            resList.addAll((List<NoticeVO>) resMap.get("list"));
            PageResult<NoticeVO> noticeVOPageResult = new PageResult<>(resList, page.getTotal() + page2.getTotal());
            return Result.ok(noticeVOPageResult);
        } else {
            resMap = noticeService.page(query);
            resList = (List<NoticeVO>) resMap.get("list");
            page = (IPage<NoticeEntity>) resMap.get("page");
            PageResult<NoticeVO> noticeVOPageResult = new PageResult<>(resList, page.getTotal());
            return Result.ok(noticeVOPageResult);
        }
    }

    @GetMapping("{id}")
    @Operation(summary = "信息")
//    @PreAuthorize("hasAuthority('soft2242:notice:info')")
    public Result<NoticeVO> get(@PathVariable("id") String id) {
        NoticeEntity entity = noticeService.getById(id);

        return Result.ok(NoticeConvert.INSTANCE.convert(entity));
    }


    @PostMapping
    @Operation(summary = "保存")
//    @PreAuthorize("hasAuthority('sys:user:save')")
    public Result<String> save(@RequestBody @Valid NoticeVO vo) {
        UserDetail userDetail = getUser();
        System.out.println(userDetail.getId());
        vo.setAdminId(userDetail.getId());
//        vo.setAdminId();
        noticeService.save(vo);
        return Result.ok();
    }

    @PutMapping
    @Operation(summary = "修改")
//    @PreAuthorize("hasAuthority('sys:user:update')")
    public Result<String> update(@RequestBody @Valid NoticeVO vo) {
        noticeService.update(vo);
        return Result.ok();
    }

    @DeleteMapping
    @Operation(summary = "删除")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<String> delete(@RequestBody List<Long> idList) {
        noticeService.delete(idList);
        return Result.ok();
    }


    @PostMapping("read")
    @Operation(summary = "用户阅读公告")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<String> readNotice(@RequestBody NoticeReaderQuery query) {
        UserDetail user = getUser();
        query.setUserId(String.valueOf(user.getId()));
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);
        if (list == null || list.size() == 0) {
            NoticeReaderEntity noticeReaderEntity = new NoticeReaderEntity();
            noticeReaderEntity.setNoticeId(Long.valueOf(query.getNoticeId()));
            noticeReaderEntity.setUserId(Long.valueOf(query.getUserId()));
            //增加阅读人数记录
            noticeReaderService.save(noticeReaderEntity);
        }

        NoticeEntity notice = noticeService.getById(query.getNoticeId());
        //增加阅读数
        notice.setReadNumber(notice.getReadNumber() + 1);
        noticeService.updateById(notice);
        return Result.ok();
    }

    /**
     * 查找指定用户,读了哪些公告
     *
     * @param query
     * @return
     */
    @GetMapping("readNotice")
    @Operation(summary = "查找指定用户的阅读的公告集合")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<PageResult<NoticeVO>> readNoticeList(@ParameterObject NoticeReaderQuery query) {
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);
        List<Long> noticeIds = list.stream().map(NoticeReaderEntity::getNoticeId).toList();
        List<NoticeEntity> noticeEntities = noticeService.listByIds(noticeIds);
        NoticeQuery noticeQuery = NoticeQueryConvert.INSTANCE.convert(query);
//        PageResult<NoticeVO> page = noticeService.page(noticeQuery);
        return Result.ok(null);
    }

    /**
     * 查找指定用户,读了哪些公告
     *
     * @return
     */
    @GetMapping("readNoticeNum")
    @Operation(summary = "查找指定用户的阅读的公告数量")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<Long> readNoticeNum() {
        //已读帖子
        UserDetail user = getUser();
        NoticeReaderQuery query = new NoticeReaderQuery();
        query.setUserId(String.valueOf(user.getId()));
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);
        long count = noticeService.count();
        long unRead = count - list.size();
        return Result.ok(unRead);
    }

    @GetMapping("readNoticeUser")
    @Operation(summary = "读了某个帖子的用户集合")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<List<NoticeReaderEntity>> readNoticeUser(@ParameterObject NoticeReaderQuery query) {
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);

        return Result.ok(list);
    }


}
