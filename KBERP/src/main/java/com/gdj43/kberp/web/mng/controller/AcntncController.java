package com.gdj43.kberp.web.mng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 회계 메뉴 ***/

@Controller
public class AcntncController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	// 지출결의서 상세보기
	@RequestMapping(value = "/expnsRsltnDtlView")
	public ModelAndView expnsRsltn(ModelAndView mav) {
		
		mav.setViewName("mng/expnsRsltnDtlView");
		
		return mav;
	}
	
	// 지출결의서관리
	@RequestMapping(value = "/expnsRsltnadmnstr")
	public ModelAndView expnsRsltnadmnstr(ModelAndView mav) {
		
		mav.setViewName("mng/expnsRsltnadmnstrList");
		
		return mav;
	}

}
