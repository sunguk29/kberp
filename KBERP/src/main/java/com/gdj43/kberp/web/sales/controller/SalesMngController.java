package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.web.common.service.ICommonService;

// ************** 영업관리 ************** //
@Controller
public class SalesMngController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/salesList")
	public ModelAndView salesList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.setViewName("sales/salesList");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("common.getSalesList", params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
}
