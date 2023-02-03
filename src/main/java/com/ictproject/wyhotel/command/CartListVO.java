package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 create table eshop_cart(
    cartnum number(8) primary key,
  	member_code varchar2(20),
    prodnum number(5),
    quantity number(5) default 1,
    total_price number(20),
    --result char(1) default 1, -- 배송 전 : 1, 배송 완료 : 2
    indate date default sysdate -- 카트 담은 날짜,
    --constraint fk_id foreign key(id) references users(id),
    --constraint fk_prodnum foreign key(prodnum) references product(prodnum)
    );
    
create sequence cart_seq start with 1 increment by 1
 */

@Getter
@Setter
@ToString
public class CartListVO {
	
	private int cartnum;
	private String memberCode;
	private int prodnum;
	private int quantity;
	private int totalPrice;
	private Timestamp indate;
	private String name;
	private int price;
	private String image;
	
}
