package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class elctrncAprvlController {
	@RequestMapping(value="/draftTmpltBox")
	public ModelAndView draftTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		mav.setViewName("GW/draftTmpltBox");
		
		return mav;
		
	}
	
	@RequestMapping(value="/draftTmpltBoxWrite")
	public ModelAndView draftTmpltBoxWrite(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		mav.setViewName("GW/draftTmpltBoxWrite");
		
		return mav;
		
	}
}
