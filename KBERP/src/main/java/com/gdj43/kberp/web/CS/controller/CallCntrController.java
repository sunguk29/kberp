package com.gdj43.kberp.web.CS.controller;

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
import com.gdj43.kberp.web.CS.service.ICallCntrService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class CallCntrController {
	@Autowired
	public ICallCntrService iccs;
	
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value="callCenter")
	public ModelAndView callCenter(@RequestParam HashMap<String, String> params,
								   ModelAndView mav) {
		
		mav.setViewName("CS/callCenter");
		
		return mav;
	}
	
	@RequestMapping(value = "/callCenterPopListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callCenterPopListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			List<HashMap<String, String>> list = iCommonService.getDataList("CC.getCallCenterClnt", params);
			
			modelMap.put("list", list);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	@RequestMapping(value = "/callCenterCnslListAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String callCenterCnslListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			List<HashMap<String, String>> list = iCommonService.getDataList("CC.getCallCenterCnsl", params);
			
			modelMap.put("list", list);
			
			return mapper.writeValueAsString(modelMap); 
		}
	
	@RequestMapping(value="/callCenterAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String callCenterActionAjax(@RequestParam HashMap<String, String> params,
										   	   @PathVariable String gbn) throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
		
				Map<String, Object> modelMap = new HashMap<String, Object>();
				
				try {
					switch(gbn) {
					case "ClntSave":
						iCommonService.getData("CC.clntSave", params);
						break;
					case "NoteSave":
						iCommonService.getData("CC.noteSave", params);
						break;
					}
					modelMap.put("res", "success");
					
				} catch(Throwable e) {
					e.printStackTrace();
					modelMap.put("res", "failed");
				}
				
				return mapper.writeValueAsString(modelMap);
			}
	
}
