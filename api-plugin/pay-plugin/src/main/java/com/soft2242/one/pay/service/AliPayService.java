package com.soft2242.one.pay.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author : JinChenXing
 * @program : community-client-api
 * @description :
 * @create : 2023-05-26 10:17
 **/

public interface AliPayService {
    String pay(String traceNo, Double totalAmount, String subject, String alipayTraceNo, HttpServletResponse httpResponse) throws Exception;
    String payNotify(HttpServletRequest request) throws Exception;
}
