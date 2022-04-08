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
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class elctrncAprvlController {
	
	@Autowired ICommonService ics;
	
	@Autowired IElctrncAprvlService iElctrncAprvlService;
	
	@RequestMapping(value="/draftTmpltBox")
	public ModelAndView draftTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		
		
		mav.addObject("list", list);
		
		
		
		mav.setViewName("GW/draftTmpltBox");	
		return mav;	
		
	}
	
	
	
	@RequestMapping(value="/draftTmpltBoxWrite")
	public ModelAndView draftTmpltBoxWrite(@RequestParam HashMap<String, String>params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> cont = ics.getData("elctrncAprvl.tmpltCont",params);
		
		mav.addObject("cont", cont);
		
		mav.setViewName("GW/draftTmpltBoxWrite");
		
		return mav;
	}
	
	@RequestMapping(value = "/draftTmpltBoxWriteAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String draftTmpltBoxWriteAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert":
				System.out.println("@@@@@@@@@@@@@" + params);
				String seq = ics.getStringData("elctrncAprvl.aprvlSeq");
				params.put("al", seq);
				
			break;
			} 
				modelMap.put("res", "success");
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("res", "failed");
			}
		
		return mapper.writeValueAsString(modelMap);
		}
		
	
	@RequestMapping(value="/aprvlTmpltBox")
	public ModelAndView aprvlTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		mav.setViewName("GW/aprvlTmpltBox");	
		
		return mav;	
	}
	
	
}
