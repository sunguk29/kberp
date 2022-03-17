package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.ICmbnService;

@Controller
public class CmbnController {
	@Autowired
	public ICmbnService ics;
	
	@Autowired
	public IPagingService ips;
}
