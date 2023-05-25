package com.soft2242.one.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.soft2242.one.common.utils.PageResult;
import com.soft2242.one.common.utils.Result;
import com.soft2242.one.convert.NoticeQueryConvert;
import com.soft2242.one.entity.NoticeEntity;
import com.soft2242.one.entity.NoticeReaderEntity;
import com.soft2242.one.query.NoticeQuery;
import com.soft2242.one.query.NoticeReaderQuery;
import com.soft2242.one.service.NoticeReaderService;
import com.soft2242.one.service.NoticeService;
import com.soft2242.one.vo.NoticeVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


import javax.swing.text.html.parser.Entity;
import java.sql.Wrapper;
import java.util.List;

/**
 * @Author : xuelong
 * @program
 * @description
 * @create 2023/5/24 14:59
 */
@RestController
@RequestMapping("notice")
@AllArgsConstructor
@Tag(name = "公告管理")
public class NoticeController {

    private final NoticeService noticeService;
    private final NoticeReaderService noticeReaderService;


    @GetMapping("page")
    @Operation(summary = "分页")
//    @PreAuthorize("hasAuthority('sys:user:page')")
    public Result<PageResult<NoticeVO>> page(@ParameterObject @Valid NoticeQuery query) {
        PageResult<NoticeVO> page = noticeService.page(query);
        return Result.ok(page);
    }

    @PostMapping
    @Operation(summary = "保存")
//    @PreAuthorize("hasAuthority('sys:user:save')")
    public Result<String> save(@RequestBody @Valid NoticeVO vo) {
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
    public Result<String> readNotice(@RequestBody NoticeReaderEntity entity) {
        noticeReaderService.save(entity);
        //增加阅读人数记录
        NoticeEntity notice = noticeService.getById(entity.getNoticeId());
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
    public Result<PageResult<NoticeVO>> pageReadNotice(@ParameterObject NoticeReaderQuery query) {
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);

        NoticeQuery noticeQuery = NoticeQueryConvert.INSTANCE.convert(query);
        PageResult<NoticeVO> page = noticeService.page(noticeQuery);
        return Result.ok(page);
    }

    @GetMapping("readNoticeUser")
    @Operation(summary = "读了某个帖子的用户集合")
//    @PreAuthorize("hasAuthority('sys:user:delete')")
    public Result<List<NoticeReaderEntity>> pageReadNoticeUser(@ParameterObject NoticeReaderQuery query) {
        List<NoticeReaderEntity> list = noticeReaderService.getList(query);

        return Result.ok(list);
    }


}
