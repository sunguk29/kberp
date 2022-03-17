package com.gdj43.kberp.web.CS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj43.kberp.web.CS.service.IFaqService;

@Controller
public class FaqController {
	@Autowired
	public IFaqService iFaqService;
}
