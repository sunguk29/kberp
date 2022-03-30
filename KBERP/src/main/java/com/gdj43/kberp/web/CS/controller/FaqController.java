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
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class FaqController {
	@Autowired 
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/faq")
	public ModelAndView faq(@RequestParam HashMap<String,String> params,
								ModelAndView mav) throws Throwable {
	
		if(params.get("page") != null && params.get("page") != "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("CS/faqList");
		
		return mav;
	
	}
	
	@RequestMapping(value = "/faqListAjax", method = RequestMethod.POST, 
			  produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String faqListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String,Object> modelMap = new HashMap<String, Object> ();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("FQ.getfaqCnt",params);
		
		//페이징
		PagingBean pb 
		= iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 4, 4);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("FQ.getfaqList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
		}
	
	  @RequestMapping(value = "/faqdt") 
	  public ModelAndView faqdt(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
	  
		  
	  HashMap<String, String> data = iCommonService.getData("FQ.getfaqdt", params);
	  
	  mav.addObject("data", data);
	  
	  mav.setViewName("CS/faqdt");
	  
	  return mav; 
	  }
	 
	  @RequestMapping(value = "/faqAdd")
	  public ModelAndView faqAdd(@RequestParam HashMap<String, String> params, 
			  						ModelAndView mav) throws Throwable {
	  
	  HashMap<String, String> data = iCommonService.getData("FQ.getfaqdt", params);
	  
	  mav.addObject("data", data);
	  
	  mav.setViewName("CS/faqAdd");
	  
	  return mav; 
	  }
	 
		
	  @RequestMapping(value = "/faqUpdate") 
	  public ModelAndView faqUpdate(@RequestParam HashMap<String, String> params,
			  						 ModelAndView mav) throws Throwable {
		  
		HashMap<String, String> data = iCommonService.getData("FQ.getfaqUpdate", params);
	  
	  mav.addObject("data", data);
	  
	  mav.setViewName("CS/faqUpdate");
	  
	  return mav; 
	  }
		 
}
