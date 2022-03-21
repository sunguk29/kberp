package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.ISchdlService;

@Controller
public class SchdlController {
	@Autowired
	public ICommonService  iCommonService;
	
	@Autowired
	public ISchdlService iscService;
	
	@RequestMapping(value = "/salesSchdl")
	public ModelAndView schdl(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.setViewName("sales/salesSchdl");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlReg")
	public ModelAndView salesSchdlReg(ModelAndView mav) {
		mav.setViewName("sales/salesSchdlReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charest=UTF-8")
	@ResponseBody
	public String salesSchdlAction(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn,
								   HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesSchdl.salesSchdlAdd", params);
				break;
			case "update":
				
				break;
			case "delete":
				
				break;
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
