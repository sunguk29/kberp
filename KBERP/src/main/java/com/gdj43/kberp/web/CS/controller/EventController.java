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
import com.gdj43.kberp.web.CS.service.IEventService;


@Controller
//@RequestMapping("/event")	
public class EventController {
	@Autowired
	public IEventService iEventService;
	
	@Autowired
	public IPagingService iPagingService;
	
	/* 
	 현재 진행중인 event 목록글 보여주는 페이지
	 * */
	@RequestMapping(value="/prgrsEvent")
	public ModelAndView prgrsEvent(@RequestParam HashMap<String, String> params,
									ModelAndView mav) {
		
		mav.setViewName("CS/prgrsEvent");
		
		return mav;
	}
	
	@RequestMapping(value = "/eventListAjax", 
					method = RequestMethod.GET,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eventListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		List<HashMap<String, String>> list = iEventService.getEventList(params);
		
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	
	}
	
	@RequestMapping(value="/endEvent")
	public ModelAndView endEvent(ModelAndView mav) {
		
		mav.setViewName("CS/endEvent");
		
		return mav;
	}
	
}
