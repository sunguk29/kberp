package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MsgrController {

	@RequestMapping(value = "/msgr")
	public ModelAndView msgr(ModelAndView mav) {
		
		mav.setViewName("GW/msgr");
		
		
		return mav;
	}
	

	@RequestMapping(value = "/chatRoomAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String chatRoomAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();

	
	
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
