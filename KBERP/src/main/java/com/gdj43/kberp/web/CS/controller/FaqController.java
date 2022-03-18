package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.IFaqService;

@Controller
public class FaqController {
	@Autowired
	public IFaqService iFaqService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/faq")
	public ModelAndView faq(ModelAndView mav) {
		
	mav.setViewName("CS/faq");
	
	
	return mav;
	}
}
