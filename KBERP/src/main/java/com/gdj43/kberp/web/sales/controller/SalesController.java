package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class SalesController {
	@Autowired
	public ICommonService iCommonService;
}
