package com.ictproject.wyhotel.util.captcha;

import cn.apiclub.captcha.text.producer.TextProducer;

public class SetTextProducer implements TextProducer{
	private final String str;
	
	public SetTextProducer(String getAnswer) {
		this.str = getAnswer;
	}

	@Override
	public String getText() {
		return this.str;
	}
}