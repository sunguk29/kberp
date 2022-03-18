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
import com.gdj43.kberp.web.CS.service.ICallCntrService;

@Controller
public class CallCntrController {
	@Autowired
	public ICallCntrService iccs;
	
	@RequestMapping(value="callCenter")
	public ModelAndView callCenter(@RequestParam HashMap<String, String> params,
								   ModelAndView mav) {
		
		mav.setViewName("CS/callCenter");
		
		return mav;
	}
	
	@RequestMapping(value="callCenterAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callCenterAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iccs.getCallCenter(params);
		
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
}
