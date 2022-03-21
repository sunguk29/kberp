package com.gdj43.kberp.web.GW.controller;

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
import com.gdj43.kberp.web.GW.service.IClndrService;

@Controller
public class ClndrController {
	@Autowired
	public IClndrService iClndrService;
	
	
	@RequestMapping(value = "/clndr")
	public ModelAndView clndr(ModelAndView mav) {
		
		mav.setViewName("GW/clndr");
		
		return mav;
	}
	
	@RequestMapping(value = "/clndrAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clndrActionAjax(@RequestParam HashMap<String , String> params,
							  @PathVariable String gbn, HttpSession session) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();
	try {
		switch (gbn) {
		case "insert":
			iClndrService.clndrAdd(params);
			break;
		case "update":
			iClndrService.clndrUpdate(params);
			break;
		case "delete":
			iClndrService.clndrDelete(params);
			break;
		}
		modelMap.put("res", "success");
	}catch (Throwable e) {
		e.printStackTrace();
		modelMap.put("res", "failed");
	}
	
	return mapper.writeValueAsString(modelMap);
	}
}
