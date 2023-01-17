package com.ictproject.wyhotel;

import java.util.UUID;

public class TestJava {
	
	public static void main(String[] args) {
		
		String uuid = UUID.randomUUID().toString();
		
		
		
		System.out.println(uuid.split("-")[0]);
		
	}
	
}
