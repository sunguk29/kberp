package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.CS.service.IEventService;

@Controller
public class EventController {
	@Autowired
	public IEventService iEventService;
	
	@Autowired
	public IPagingService iPagingService;
	
	/* 
	 현재 진행중인 event 목록글 보여주는 페이지
	 * */
	@RequestMapping(value="/prgrsEvent")
	public ModelAndView prgrsEvent(ModelAndView mav) {
		
		// 1. Service 로부터 현재 진행중인 list 받아오기 => Model에 집어넣기
		// mav.addObject()
		
		// 1.1 EventService 구현
		// 1.2 DAO 구현
		// 1.3 Mapper (쿼리) 구현
		
		mav.setViewName("CS/prgrsEvent");
		
		return mav;
	}
	
	@RequestMapping(value="/endEvent")
	public ModelAndView endEvent(ModelAndView mav) {
		
		mav.setViewName("CS/endEvent");
		
		return mav;
	}
	
}
