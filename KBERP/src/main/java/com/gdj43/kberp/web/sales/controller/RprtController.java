package com.gdj43.kberp.web.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj43.kberp.web.sales.service.ISchdlService;


@Controller
public class RprtController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ISchdlService iSchdlService; 
	
	
	
	//고객 보고서
	@RequestMapping(value = "/clntChart")
	public ModelAndView clntList(ModelAndView mav) {
		mav.setViewName("sales/rprt/clntChart");
		return mav;
	}
	
	
	/* 영업 차트 */
	@RequestMapping(value = "/salesChart")
	public ModelAndView salesChart(ModelAndView mav) throws Throwable{
		mav.setViewName("sales/salesChart");
		
		return mav;
	}
	
	
	/* 실적 차트 */
	@RequestMapping(value = "/pfmcChart")
	public ModelAndView pfmcChart(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/pfmcChart");
		
		return mav;
	}
	
	
	/* 담당자 팝업 띄우기 */
	@RequestMapping(value = "/rprtmngListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String mngListAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCommonService.getIntData("salesRprt.getMngCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> mngList = iCommonService.getDataList("salesRprt.getMngList", params);
		
		modelMap.put("mngList", mngList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	/* 영업 차트 데이터 가져오기 */
	@RequestMapping(value = "/salesgetChartDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesgetChartDataAjax(HttpServletRequest request) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		int size = Integer.parseInt(request.getParameter("size"));
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		HashMap<String, Object> bsnList = iSchdlService.getData("salesRprt.getSalesBsnChart");
			
		
		
		for(int i = 0 ; i < size ; i++) {
			HashMap<String, Object> temp = new HashMap<String, Object>();
			
			if(i == 0) {
				temp.put("name", "민수");
			} else if(i == 1) {
				temp.put("name", "관공");
			} else {
				temp.put("name", "기타");
			}
			temp.put("y", Integer.parseInt(String.valueOf(bsnList.get("BSNTYPE"+i))));
			
			list.add(temp);
		}
		
		
		
	
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 실적 차트 데이터 가져오기 */
	@RequestMapping(value = "/pfmcgetChartData", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String pfmcgetChartData(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		/*
		 * List<HashMap<String, Object>> list =
		 * iCommonService.getDataList("salesRprt.get")
		 */
		
		return mapper.writeValueAsString(modelMap);
	}
	
}
