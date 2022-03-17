package com.gdj43.kberp.web.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.hr.service.ISlryService;

/***** 급여 관련 메뉴 *****/

@Controller
public class SlryController {
	@Autowired
	public ISlryService iSlryService;
	
	@Autowired
	public IPagingService ips;
}
