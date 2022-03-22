package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.web.GW.service.IMsgrService;
import com.gdj43.kberp.web.common.service.ICommonService;


@Controller
public class MsgrController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IMsgrService ims;
	
	@RequestMapping(value = "/msgr")
	public ModelAndView msgr(ModelAndView mav) {
		
		mav.setViewName("GW/msgr");
		
		
		return mav;
	}
	

	@RequestMapping(value = "/insertContAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String insertChatAjax(@RequestParam HashMap<String, String> params,
											   HttpServletRequest request,
											   ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		try {
			ims.insertCont(params);
			
			modelMap.put("messege", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
}
