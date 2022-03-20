package com.gdj43.kberp.web.GW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MsgrController {

	@RequestMapping(value = "/msgr")
	public ModelAndView msgr(ModelAndView mav) {
		
		mav.setViewName("GW/msgr");
		
		
		return mav;
	}
	
}
