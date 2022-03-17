package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class ClntMngController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/clntCmpnyList")
	public ModelAndView clntCmpnyList(@RequestParam HashMap<String, String> params, 
									  ModelAndView mav) {
		
		mav.setViewName("sales/clntCmpnyList");
		
		return mav;
	}
	

}
