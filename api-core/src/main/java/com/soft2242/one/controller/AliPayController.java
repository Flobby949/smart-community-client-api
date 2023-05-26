package com.soft2242.one.controller;

import com.alipay.api.AlipayApiException;
import com.soft2242.one.pay.service.AliPayService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// xjlugv6874@sandbox.com
// 9428521.24 - 30 = 9428491.24 + 30 = 9428521.24
@RestController
@RequestMapping("/alipay")
@Tag(name = "支付宝支付", description = "支付宝支付")
@Slf4j
public class AliPayController {
    @Resource
    private AliPayService alipayService;

    @GetMapping("/pay")
    @Operation(summary = "支付宝支付")
    public String pay(String traceNo, Double totalAmount, String subject, String alipayTraceNo, HttpServletResponse httpResponse) throws AlipayApiException, Exception {
        String pay = alipayService.pay(traceNo, totalAmount, subject, alipayTraceNo, httpResponse);
        return pay;
    }

}