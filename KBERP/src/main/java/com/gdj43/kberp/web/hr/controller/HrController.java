package com.gdj43.kberp.web.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.hr.service.IHrService;

/***** 인사기록카드, 사원조회 메뉴 *****/

@Controller
public class HrController {
	@Autowired
	public IHrService iHrService;
	
	@Autowired
	public IPagingService ips;
}
