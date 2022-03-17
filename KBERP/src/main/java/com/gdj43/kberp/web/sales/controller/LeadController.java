package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ILeadService;

// ********** 리드관리 *********
@Controller
public class LeadController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public ILeadService iLeadService;
	
	@RequestMapping(value ="/leadList")
	public ModelAndView leadList(ModelAndView mav) {
		
		mav.setViewName("sales/leadList");
		return mav;
	}

}
