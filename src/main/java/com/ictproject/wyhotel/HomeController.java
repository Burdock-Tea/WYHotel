package com.ictproject.wyhotel;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ictproject.wyhotel.promotion.service.IPromotionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Autowired
	private IPromotionService promotionService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("promotionList", promotionService.getList("", "", ""));
		model.addAttribute("locale", locale);
		
		return "home";
	}	
}
