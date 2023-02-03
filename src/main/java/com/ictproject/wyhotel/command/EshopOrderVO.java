package com.ictproject.wyhotel.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE eshop_order(
    ordernum number(10) primary key,
    member_code varchar2(20),
    take_user_name varchar2(20),
    take_user_phone varchar2(50),
    take_user_zipnum varchar2(50),
    take_user_addrB varchar2(50),
    take_user_addrD varchar2(50),
    total_price number(20),
    indate date default sysdate
    );
create sequence orders_seq start with 1 increment by 1;
  */
@ToString
@Getter
@Setter
public class EshopOrderVO {
	
	private int ordernum;
	private String memberCode;
	private String takeUserName;
	private String takeUserPhone;
	private String takeUserZipnum;
	private String takeUserAddrB;
	private String takeUserAddrD;
	private int totalPrice;
	private Timestamp indate;
	private List<EshopOrderCartVO> prodList;
	
}
