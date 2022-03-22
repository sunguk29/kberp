package com.gdj43.kberp.web.CS.controller;

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
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.ICmbnService;


@Controller
public class CmbnController {
	@Autowired
	public ICmbnService ics;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="guideWrtng")
	public ModelAndView guideWrtng(ModelAndView mav) {
		
		mav.setViewName("CS/guideWrtng");
		
		return mav;
	}
	
	@RequestMapping(value="strgBox")
	public ModelAndView strgBox(ModelAndView mav) {
		
		mav.setViewName("CS/strgBox");
		return mav;
	}
	
	@RequestMapping(value="guideWrtngAdd")
	public ModelAndView guideWrtngAdd(ModelAndView mav) {
		
		mav.setViewName("CS/guideWrtngAdd");
		return mav;
	}
	
	@RequestMapping(value="/guideWrtngAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String guideWrtngAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//구현 내용
		List<HashMap<String,String>> list = ics.getGuide(params);
		
		modelMap.put("list",list);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
}
