package com.gdj43.kberp.web.mng.controller;

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
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 카드 관리 메뉴 ***/

@Controller
public class PrjctMngController {
	
	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/prjctMng")
	public ModelAndView prjctMng(@RequestParam HashMap<String,String> params, ModelAndView mav){
		if(params.get("page")== null || params.get("page")=="") {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/prjctMng");
		return mav;
	}
	
	@RequestMapping(value="/prjctMngListAjax", method= RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prjctMngListAjax(@RequestParam HashMap<String,String>params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		//총 게시글 수
		int cnt = ics.getIntData("prjctMng.getCnt", params);
		
		//페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
		//PagingBean pb = iPagingService.getPagingBean(Integer.parseInt("1"),cnt,10,5);
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ics.getDataList("prjctMng.prjctMngList", params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
}