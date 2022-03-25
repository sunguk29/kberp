package com.gdj43.kberp.web.mng.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

/*** 회계 메뉴 ***/

@Controller
public class AcntncController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	// 지출결의서 상세보기
	@RequestMapping(value = "/expnsRsltnDtlView")
	public ModelAndView expnsRsltn(ModelAndView mav) {
		
		mav.setViewName("mng/expnsRsltnDtlView");
		
		return mav;
	}
	
	// 내부비용관리
	@RequestMapping(value ="/intrnlCostMng")
	public ModelAndView intrnlCostMng(ModelAndView mav) {
		
		mav.setViewName("mng/intrnlCostMngList");
		
		return mav;
	}
	
	// 전표관리
	@RequestMapping(value = "/chitMng")
	public ModelAndView chitMng(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		if(params.get("mon") == null || params.get("mon") == "") {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String thisMon = sdf.format(today);
			params.put("mon", thisMon);			
		}
		
		mav.addObject("page", params.get("page"));
		mav.addObject("mon", params.get("mon"));
		
		mav.setViewName("mng/chitMng");
		
		return mav;
	}
	
	// 전표관리 ajax
	@RequestMapping(value = "/chitMngAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chitMngAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("chitMng.getChitMngCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("chitMng.getChitMngList", params);
		
		HashMap<String, String> data = iCommonService.getData("chitMng.getChitMngData", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		modelMap.put("data", data); 
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	// 전표관리에서 전표번호 클릭 시 체크
	@RequestMapping(value = "/chitNumCheck")
	public ModelAndView chitNumCheck(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		int expnsRsltnCheck = iCommonService.getIntData("chitMng.expnsRsltnCheck", params);
		
		if(expnsRsltnCheck == 1) {
			// 지출결의서관리 상세보기로 이동
			mav.addObject("res", "expnsRsltnGo");
			mav.addObject("top", "34");
			mav.addObject("menuNum", "84");
			mav.addObject("menuType", "M");
			
			
		} else {
			
			int intrnlCostCheck = iCommonService.getIntData("chitMng.intrnlCostCheck", params);
			
			if(intrnlCostCheck == 1) {
				// 내부비용관리 상세보기로 이동
				mav.addObject("res", "intrnlCostGo");
				
			} else {
				System.out.println("조회된 전표가 없음!");
				mav.addObject("res", "failed");
			}
		}
		
		mav.setViewName("mng/chitNumCheck");
		return mav;
	}
	
	// 지출결의서관리 목록
	@RequestMapping(value = "/expnsRsltnadmnstr")
	public ModelAndView expnsRsltnadmnstr(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/expnsRsltnadmnstrList");
		
		return mav;
	}
	
	// 지출결의서관리 목록 ajax
	@RequestMapping(value = "/expnsRsltnadmnstrAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnadmnstrAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltnadmnstr.getExpnsCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltnadmnstr.getExpnsList", params);
		
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 지출결의서관리 사원별 월별 목록
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthlyList")
	public ModelAndView expnsRsltnadmnstrEmpMnthlyList(@RequestParam HashMap<String, String> params, 
													   ModelAndView mav) throws Throwable {
		
		// HashMap<String, String> data = iCommonService.getData("expnsRsltnadmnstr.getExpnsEmpMnthlyData", params);
		
		if(params.get("page2") == null || params.get("page2") == "") {
			params.put("page2", "1");
		}
		
		// mav.addObject("data", data);
		mav.addObject("page2", params.get("page2"));
		
		mav.setViewName("mng/expnsRsltnadmnstrEmpMnthlyList");
		
		return mav;
	}
	
	// 지출결의서관리 사원별 월별 목록 ajax
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthlyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String expnsRsltnadmnstrEmpMnthlyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("expnsRsltnadmnstr.getExpnsEmpMnthlyCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("expnsRsltnadmnstr.getExpnsEmpMnthlyList", params);
		
		HashMap<String, String> data = iCommonService.getData("expnsRsltnadmnstr.getExpnsEmpMnthlyData", params);
		
		modelMap.put("data", data);
		modelMap.put("list", list); 
		modelMap.put("pb", pb); 
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 지출결의서관리 사원별 월별 상세보기
	@RequestMapping(value = "/expnsRsltnadmnstrEmpMnthly")
	public ModelAndView expnsRsltnadmnstrDtl(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
	
	HashMap<String, String> data = iCommonService.getData("expnsRsltnadmnstr.expnsRsltnadmnstrDtl", params);
		
	mav.addObject("data", data);
	
	mav.setViewName("mng/expnsRsltnadmnstrEmpMnthly");
	
	return mav;
}
}
