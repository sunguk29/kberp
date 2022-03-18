package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;


/*** 시설물 관리 메뉴 ***/

@Controller
public class FcltyController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value="/fcltUseRqst")
	public ModelAndView fcltList(ModelAndView mav) throws Throwable{
		
		return mav;
	}

}
