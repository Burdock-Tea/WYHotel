package com.ictproject.wyhotel.command;

import java.sql.Timestamp;

/*
 CREATE TABLE eshop_product(
    prodnum number(5) primary key,
    name varchar2(200) default 0,
    kind char(1), -- another : 1, food : 2
    price number(10) default 0,
    content varchar2(1000) default null,
    image varchar2(50) default 'default.jpg',
    useyn char default 'y', -- 판매 : y, 판매중단 : n
    regdate date default sysdate
);
create sequence product_seq start with 1 increment by 1;
 */

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EshopProductVO {
	
	private int prodnum;
	private String name;
	private String kind;
	private int price;
	private String content;
	private String image;
	private boolean useyn;
	private Timestamp regdate; 
}
