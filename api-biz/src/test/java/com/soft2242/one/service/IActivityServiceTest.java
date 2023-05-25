package com.soft2242.one.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.entity.Activity;
import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest

class IActivityServiceTest {
    @Resource
    IActivityService iActivityService;

    @Test
    void testGetOne() {
        Activity one =  iActivityService.getOne(new LambdaQueryWrapper<Activity>().eq(Activity::getId, 1001));

        System.out.println(one);
    }

}