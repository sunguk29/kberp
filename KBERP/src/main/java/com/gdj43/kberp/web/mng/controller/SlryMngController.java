package com.gdj43.kberp.web.mng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 급여 관리 메뉴 ***/

@Controller
public class SlryMngController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	// 급여명세서조회(관리자)
	@RequestMapping(value = "/slrSpcfctnList")
	public ModelAndView slrSpcfctnList(ModelAndView mav) {
		
		mav.setViewName("mng/slrSpcfctnList");
		
		return mav;
	}
}
