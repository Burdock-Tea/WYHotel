package com.ictproject.wyhotel.reservation.commons;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

@Configuration
public class Property {
	
	@Bean
	public PropertiesFactoryBean tossProperties() {
		PropertiesFactoryBean bean = new PropertiesFactoryBean();
		bean.setLocation(new ClassPathResource("db-config/toss.properties"));
		return bean;
	}

}
