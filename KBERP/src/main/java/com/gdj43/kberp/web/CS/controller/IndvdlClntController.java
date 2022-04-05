package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class IndvdlClntController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
}
