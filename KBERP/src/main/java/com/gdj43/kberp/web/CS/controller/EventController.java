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
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
//@RequestMapping("/event")	
public class EventController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	/* 
	 현재 진행중인 event 목록글 보여주는 페이지
	 * */
	
	@RequestMapping(value = "/prgrsEvent")
	public ModelAndView eventList(@RequestParam HashMap<String, String> params,
								ModelAndView mav) {
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("CS/eventList");
		
		return mav;
	}
	
	@RequestMapping(value = "/eventListAjax", 
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String eventListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt= iCommonService.getIntData("ev.getEventCnt",params);
		//
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("ev.getEventList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	
	}
	
	//
	@RequestMapping(value = "/event")
	public ModelAndView event(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("ev.getEvent", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("CS/event");
		
		return mav;
	}
	
	// 
		@RequestMapping(value = "/eventAdd")
		public ModelAndView eventAdd(@RequestParam HashMap<String, String> params,
				  					ModelAndView mav) throws Throwable {
			
			HashMap<String, String> data = iCommonService.getData("ev.getEvent", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("CS/eventAdd");
			
			return mav;
		}
	
		
		@RequestMapping(value = "/eventAction/{gbn}", method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String eventActionAjax(@RequestParam HashMap<String, String> params,
								  @PathVariable String gbn) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				switch(gbn) {
				case "insert":
					iCommonService.insertData("ev.EventAdd", params);
					break;
				case "update":
					iCommonService.updateData("ev.EventUpdate", params);
					break;
				case "delete":
					iCommonService.updateData("ev.EventDelete", params);
					break;
			}
				modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/eventUpdate")
		public ModelAndView eventUpdate(@RequestParam HashMap<String, String> params,
										ModelAndView mav) throws Throwable {
			HashMap<String, String> data = iCommonService.getData("ev.getEvent", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("CS/eventUpdate");
			
			return mav;
		}
}
