package com.gdj43.kberp.web.GW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@RequestMapping(value = "/board")
	public ModelAndView clndr(ModelAndView mav) {
		
		mav.setViewName("GW/board");
		
		return mav;
	}
}
