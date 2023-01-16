package com.ictproject.wyhotel.util.paging;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class PageVO {
	
	// 사용자가 선택한 페이지 정보를 담을 변수
	private int pageNum;
	private int cpp;
	
	// 검색에 필요한 데이터를 변수로 선언
	private String keyword;
	private String category;
	
	public PageVO() {
		this.pageNum = 1;
		this.cpp = 10;
	}

}
