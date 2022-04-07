package com.gdj43.kberp.web.CS.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class IndvdlClntController {
	@Autowired
	public ICommonService iCommonService;
	
	/*
	 * @RequestMapping(value = "/cheader") public ModelAndView cheader(ModelAndView
	 * mav) { mav.setViewName("common/header");
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value = "/cbottom") public ModelAndView cbottom(ModelAndView
	 * mav) { mav.setViewName("common/bottom");
	 * 
	 * return mav; }
	 */
	
	@RequestMapping(value = "/indvdlLogin")
	public ModelAndView indvdllogin(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sClntNum") != null) {
			mav.setViewName("redirect:guideWrtng");
		} else {
			mav.setViewName("CS/indvdlClnt");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/indvdlLoginAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String indvdlLoginAjax(@RequestParam HashMap<String, String> params,
						  HttpSession session) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	
	try {
		//패스워드 암호화
		params.put("pw", Utils.encryptAES128(params.get("pw")));
		
		HashMap<String, String> data = iCommonService.getData("cl.icloginCheck", params);
		
		if(data != null && !data.isEmpty()) { 
			session.setAttribute("sClntNum", data.get("CLNT_NUM"));
			session.setAttribute("sClntName", data.get("CLNT_NAME"));
			
			modelMap.put("res", CommonProperties.RESULT_SUCCESS);
		} else { 
			modelMap.put("res", CommonProperties.RESULT_FAILED);
		}
	} catch (Exception e) {
		e.printStackTrace();
		modelMap.put("res", CommonProperties.RESULT_ERROR);
	}
	return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/clogout")
	public ModelAndView clogout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:indvdlClnt");
		
		return mav;
	}
}
