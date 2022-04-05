package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;
import java.util.List;
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
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class ExpnsRsltnController {
	
	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/expnsRsltn")
	public ModelAndView d(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		mav.addObject("Page",params.get("Page"));

		mav.setViewName("mng/expnsRsltn");

		return mav;
	}
	
	@RequestMapping(value = "/expnsRsltnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnAjax(@RequestParam HashMap<String, String> params,
									HttpSession session) throws Throwable {
		
		params.put("sesEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
		
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCommonService.getIntData("expnsRsltn.getexpnsRsltnCnt", params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("Page")), cnt, 8, 5);

		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltn.getexpnsRsltnList", params);
		
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);

	}

}
