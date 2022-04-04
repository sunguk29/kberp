package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 투입관리 가용인력현황 ***/

@Controller
public class AvlblMnpwrController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/avlblManPwrCrntState")
	public ModelAndView fcltUseRqst(@RequestParam HashMap<String, String> params, 
									ModelAndView mav) throws Throwable {
		
		mav.setViewName("mng/avlblManPwrCrntState");
		
		return mav;
	}
}
