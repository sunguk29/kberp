package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.ICmbnService;

@Controller
public class CmbnController {
	@Autowired
	public ICmbnService ics;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="guideWrtng")
	public ModelAndView guideWrtng(ModelAndView mav) {
		
		mav.setViewName("CS/guideWrtng");
		
		return mav;
	}
	
	@RequestMapping(value="strgBox")
	public ModelAndView strgBox(ModelAndView mav) {
		
		mav.setViewName("CS/strgBox");
		return mav;
	}
}
