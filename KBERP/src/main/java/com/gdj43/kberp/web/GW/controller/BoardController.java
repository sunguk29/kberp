package com.gdj43.kberp.web.GW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@RequestMapping(value = "/board")
	public ModelAndView board(ModelAndView mav) {
		
		mav.setViewName("GW/board");
		
		return mav;
	}
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(ModelAndView mav) {
		
		mav.setViewName("GW/boardWrite");
		
		return mav;
	}
	@RequestMapping(value = "/boardAdmnstr")
	public ModelAndView boardAdmnstr(ModelAndView mav) {
		
		mav.setViewName("GW/boardAdmnstr");
		
		return mav;
	}
	
}
