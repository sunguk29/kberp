package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.web.GW.service.IElctrncAprvlService;

@Controller
public class elctrncAprvlController {
	
	@Autowired IElctrncAprvlService iElctrncAprvlService;
	
	@RequestMapping(value="/draftTmpltBox")
	public ModelAndView draftTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		mav.addObject("list", list);
		
		mav.setViewName("GW/draftTmpltBox");	
		return mav;	
	}
	
	@RequestMapping(value="/draftTmpltBoxWrite")
	public ModelAndView draftTmpltBoxWrite(ModelAndView mav) throws Throwable {
		
		mav.setViewName("GW/draftTmpltBoxWrite");
		
		return mav;
	}
	
	
	
	
	
	@RequestMapping(value="/aprvlTmpltBox")
	public ModelAndView aprvlTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		mav.setViewName("GW/aprvlTmpltBox");	
		
		return mav;	
	}
	
	
}
