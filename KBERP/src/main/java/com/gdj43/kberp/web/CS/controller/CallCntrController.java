package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.CS.service.ICallCntrService;

@Controller
public class CallCntrController {
	@Autowired
	public ICallCntrService iccs;
	
	@RequestMapping(value="callCenter")
	public ModelAndView callCenter(ModelAndView mav) {
		
		mav.setViewName("CS/callCenter");
		
		return mav;
	}
}
