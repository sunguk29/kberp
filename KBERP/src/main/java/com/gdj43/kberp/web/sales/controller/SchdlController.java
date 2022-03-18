package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ISchdlService;

@Controller
public class SchdlController {
	@Autowired
	public ICommonService  iCommonService;
	
	@Autowired
	public ISchdlService iscService;
	
	@RequestMapping(value = "/salesSchdl")
	public ModelAndView schdl(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.setViewName("sales/salesSchdl");
		
		return mav;
	}
}
