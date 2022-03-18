package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.IInqryService;

@Controller
public class InqryController {
	@Autowired
	public IInqryService iis;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value = "/inqry")
	public ModelAndView inqry(ModelAndView mav) {
		
		mav.setViewName("CS/inqry");
		
		return mav;
	}
}
