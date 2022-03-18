package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.IEventService;

@Controller
public class EventController {
	@Autowired
	public IEventService iEventService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/prgrsEvent")
	public ModelAndView prgrsEvent(ModelAndView mav) {
		
		mav.setViewName("CS/prgrsEvent");
		
		return mav;
	}
	
	@RequestMapping(value="/endEvent")
	public ModelAndView endEvent(ModelAndView mav) {
		
		mav.setViewName("CS/endEvent");
		
		return mav;
	}
	
}
