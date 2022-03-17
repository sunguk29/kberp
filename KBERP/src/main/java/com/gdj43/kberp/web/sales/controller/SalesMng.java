package com.gdj43.kberp.web.sales.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ISalesMngService;

// ************** 영업관리 ************** //
@Controller
public class SalesMng {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public ISalesMngService iSalesMngService;
	
	@RequestMapping(value = "/salesList")
	
}
