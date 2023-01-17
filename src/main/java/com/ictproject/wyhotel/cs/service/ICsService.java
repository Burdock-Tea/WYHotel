package com.ictproject.wyhotel.cs.service;

import java.util.Map;

public interface ICsService {

	// 문의내역 Map 받고, 정제 이후 mapper에게 값 전달
	public void insert(Map<String, String> data);
	
}
