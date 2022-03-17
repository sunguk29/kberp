package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ISchdlService;

@Controller
public class SchdlController {
	@Autowired
	public ICommonService  iCommonService;
	
	@Autowired
	public ISchdlService iscService;
}
