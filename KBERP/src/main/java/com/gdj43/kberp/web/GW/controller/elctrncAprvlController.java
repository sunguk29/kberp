package com.gdj43.kberp.web.GW.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.web.GW.service.IAprvlService;
import com.gdj43.kberp.web.GW.service.IElctrncAprvlService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class elctrncAprvlController {
	
	@Autowired ICommonService ics;
	
	@Autowired IAprvlService ias;
	
	@Autowired IElctrncAprvlService iElctrncAprvlService;
	
	@RequestMapping(value="/draftTmpltBox")
	public ModelAndView draftTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		
		
		mav.addObject("list", list);
		
		
		
		mav.setViewName("GW/draftTmpltBox");	
		return mav;	
		
	}
	
	
	
	@RequestMapping(value="/draftTmpltBoxWrite")
	public ModelAndView draftTmpltBoxWrite(@RequestParam HashMap<String, String>params,  HttpSession session,
											 ModelAndView mav) throws Throwable {
		
		HashMap<String, String> cont = ics.getData("elctrncAprvl.tmpltCont",params);
												
		mav.addObject("cont", cont);
		
		mav.setViewName("GW/draftTmpltBoxWrite");
							
		return mav;
	}
	
	
	@RequestMapping(value = "/draftTmpltBoxWriteAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String draftTmpltBoxWriteAjax(@RequestParam HashMap<String, String> params,
											   HttpServletRequest request,
											   @RequestParam(required = false) List<String> srch_check,
											   HttpSession session,
											   ModelAndView modelAndView) throws Throwable {
		
		System.out.println("######################"+params);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		if(srch_check != null) {
			srch_check.add(String.valueOf(session.getAttribute("sEmpNum")));
		}
		
		
		try {
			
			System.out.println("@@@@@@@@@@@@@왔나" + params);
			
			String[] temp = null;
			if(params.get("aprvl_line_emp_num") != null) {
				temp = params.get("aprvl_line_emp_num").split(",");
			}
			
			String[] temps = null;
			
			if(params.get("rfrnc_emp_num") != null) {
				temps = params.get("rfrnc_emp_num").split(",");
			}
			
			List<String> aprvlEmpNum = null;
			
			if(temp != null) {
				aprvlEmpNum = Arrays.asList(temp);
			}
			
			List<String> rfrncEmpNum = null;
			
			if(temps != null) {
				rfrncEmpNum = Arrays.asList(temps);
			}
			
			String aprvlNum = ias.aprvlAdd(params.get("sEmpNum"), params.get("dcmnt_title"), params.get("tmplt_cont"), aprvlEmpNum, rfrncEmpNum, params.get("att_file"));		
							
		}catch (Throwable e) {
			e.printStackTrace();
			
			System.out.println("@@@@@@@@@@@@@오류" + params);
		}
		return mapper.writeValueAsString(modelMap);
	}
	
		
		
	
	@RequestMapping(value = "/addListAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String addListAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
						
		List<HashMap<String, String>> list = ics.getDataList("elctrncAprvl.addList", params) ;
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
		}
		
		
	@RequestMapping(value="/aprvlTmpltBox")
	public ModelAndView aprvlTmpltBox(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iElctrncAprvlService.getAprvlTmpltBox(params);
		
		mav.setViewName("GW/aprvlTmpltBox");	
		
		return mav;	
	}
	
	
}
