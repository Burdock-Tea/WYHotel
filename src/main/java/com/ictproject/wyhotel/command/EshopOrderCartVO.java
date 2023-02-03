package com.ictproject.wyhotel.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 --매핑 테이블
CREATE TABLE order_cart(
    ordernum number(10),
    prodnum number(30),
    quantity number(10)
);
 */
@ToString
@Getter
@Setter
public class EshopOrderCartVO {
	
	 private int ordernum;
	 private int prodnum;
	 private int quantity;
	 
	 // join용
	 private String name;
	 private int price;
	 private String image;
	
}
