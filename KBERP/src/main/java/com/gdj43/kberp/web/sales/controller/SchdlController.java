package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
	public ModelAndView schdl(ModelAndView mav) {
		
		Date tday = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		
		mav.addObject("tday", sdf.format(tday));
		
		mav.setViewName("sales/salesSchdl");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesSchdlAjax(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("salesSchdl.getSalesSchdlList", params);
		List<HashMap<String, String>> mgrList = iCommonService.getDataList("salesSchdl.getMgrList", params);
		
		modelMap.put("list", list);
		modelMap.put("mgrList", mgrList);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/salesSchdlReg")
	public ModelAndView salesSchdlReg(ModelAndView mav) {
		mav.setViewName("sales/salesSchdlReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charest=UTF-8")
	@ResponseBody
	public String salesSchdlActionAjax(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn) throws Throwable{
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
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
