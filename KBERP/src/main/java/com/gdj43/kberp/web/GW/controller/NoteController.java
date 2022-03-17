package com.gdj43.kberp.web.GW.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoteController {
	@RequestMapping(value = "/writeNote")
	public ModelAndView wirteNote(ModelAndView mav) {
		
		mav.setViewName("GW/writeNote");
		
		return mav;
	}
}
