package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class RprtController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	
	
	
	
	
	
	
	/* 실적 페이지 */
	@RequestMapping(value = "/pfmcChart")
	public ModelAndView pfmcChart(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/pfmcChart");
		
		return mav;
	}
	
}
