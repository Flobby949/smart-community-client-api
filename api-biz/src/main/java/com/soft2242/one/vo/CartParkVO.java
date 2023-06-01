package com.soft2242.one.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author : Ahang
 * @program : community-client-api
 * @description :
 * @create : 2023-06-01 12:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartParkVO {
    String licence;
    Integer type;
    Date access_time;
    Date leave_time;
    Long total_time;
    Double total_price;
    Double price;
    Long car_id;
}
