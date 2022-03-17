package com.gdj43.kberp.web.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.hr.service.IHRService;

@Controller
public class HRController {
	@Autowired
	public IHRService ihs;
	
	@Autowired
	public IPagingService ips;
}
