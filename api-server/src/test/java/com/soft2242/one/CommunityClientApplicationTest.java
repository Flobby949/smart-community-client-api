package com.soft2242.one;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.soft2242.one.entity.Activity;
import com.soft2242.one.service.IActivityService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CommunityClientApplicationTest {

    @Autowired
    IActivityService iActivityService;

    @Test
    void testGetOne() {
        Activity one = iActivityService.getOne(new LambdaQueryWrapper<Activity>().eq(Activity::getId, 1001));

        System.out.println(one);
    }

}