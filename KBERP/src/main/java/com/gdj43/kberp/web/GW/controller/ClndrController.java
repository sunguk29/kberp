package com.gdj43.kberp.web.GW.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.GW.service.IElctrncAprvlService;

@Controller
public class ClndrController {
	
	@Autowired IElctrncAprvlService iElctrncAprvlService;
	
	@RequestMapping(value = "/clndr")
	public ModelAndView clndr(ModelAndView mav) {
		
		mav.setViewName("GW/clndr");
		
		return mav;
	}
}
