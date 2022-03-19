package com.gdj43.kberp.web.sales.controller;

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

// ************** 영업관리 ************** //
@Controller
public class SalesMngController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/salesList")
	public ModelAndView salesList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}

		mav.addObject("page", params.get("page"));
		
		mav.setViewName("sales/salesList");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("salesMng.salesListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		// 데이터 시작, 종료 할당
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSalesList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
}







