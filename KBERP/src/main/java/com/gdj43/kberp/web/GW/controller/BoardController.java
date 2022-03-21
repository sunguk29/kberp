package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.GW.service.IBoardService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardController {
	@Autowired
	public IBoardService iBoardService;

	@RequestMapping(value = "/board")
	public ModelAndView board(ModelAndView mav) {
		
		mav.setViewName("GW/board");
		
		return mav;
	}
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(ModelAndView mav) {
		
		mav.setViewName("GW/boardWrite");
		
		return mav;
	}
	@ResponseBody 
	public String atbAction(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
	
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			switch(gbn) {
			case "insert":
				iBoardService.boardWrite(params);
				break;
			case "update":
				iBoardService.boardUpdate(params);
				break;
			case "delete":
				iBoardService.boardDelete(params);
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
