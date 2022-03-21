package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 자산 관리 메뉴 ***/

@Controller
public class AssetController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/assetList")
	public ModelAndView salesList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/assetList");
		
		return mav;
	}
	
	
}
