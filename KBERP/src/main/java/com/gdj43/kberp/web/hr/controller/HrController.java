package com.gdj43.kberp.web.hr.controller;

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
import com.gdj43.kberp.web.hr.service.IHrService;

/***** 공통코드, 조직도, 인사발령, 증명서발급 메뉴 *****/

@Controller
public class HrController {
	@Autowired
	public IHrService iHrService;
	
   @RequestMapping(value = "/apntm")
   public ModelAndView apntmList(@RequestParam HashMap<String,String> params, 
                         ModelAndView mav) {
      mav.setViewName("hr/apntm");
      
      return mav;
   }
	   
	@RequestMapping(value = "/apntmListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	   @ResponseBody
	   public String apnmtListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			List<HashMap<String, String>> list = iHrService.getApntmList(params);
			HashMap<String, String> cont = iHrService.getApntmCont(params);
			
			modelMap.put("list", list);
			modelMap.put("cont", cont);
			
			return mapper.writeValueAsString(modelMap); 
	   }
}
