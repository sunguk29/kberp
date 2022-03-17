package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class SalesController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/salestest22")
	public ModelAndView salestest(ModelAndView mav) {
		return mav;
	}
	
}