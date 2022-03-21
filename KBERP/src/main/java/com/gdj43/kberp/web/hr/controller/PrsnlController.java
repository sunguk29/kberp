package com.gdj43.kberp.web.hr.controller;

import java.util.ArrayList;
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
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.IPrsnlService;

/***** 인사기록카드, 사원조회 메뉴 *****/

@Controller
public class PrsnlController {
	@Autowired
	public IPrsnlService iPrsnlService;
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value = "/prsnlCard")
	public ModelAndView prsnlCard(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			// 로그인 확인, 로그인 된 사용자 정보 취득
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "5"); // 메뉴 번호 params에 추가
			// 사용자 메뉴 권한 가져오기
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) { // 읽기, 쓰기 권한이 있을 때
				mav.addObject("menuAthrty", menuAthrty);
				
				HashMap<String, String> basicInfoData = iCommonService.getData("prsnl.getBasicInfo", params);
				mav.addObject("basicInfoData", basicInfoData);
				mav.setViewName("hr/prsnlCard");
			} else { // 권한 없을 때
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		
		return mav;
	}
	
	@RequestMapping(value = "/empInqry")
	public ModelAndView empInqry(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				mav.setViewName("redirect:login");
			}
			
			params.put("menuNum", "6");
			int menuAthrty = iCommonService.getIntData("prsnl.getMenuAthrty", params);
			
			if (menuAthrty != 0) {
				mav.addObject("menuAthrty", menuAthrty);
				mav.setViewName("hr/empInqry");
			} else {
				mav.setViewName("exception/PAGE_NOT_FOUND");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}

		
		return mav;
	}
	
	@RequestMapping(value = "/prsnlCardTabAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String prsnlCardTabAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 선택된 탭이 어떤 탭인지 가져오기
		String tabName = new String();
		if (params.get("selectedTopTab") != null) { // 상단 탭 선택시
			tabName = params.get("selectedTopTab");
		} else { // 하단 탭 선택시
			tabName = params.get("selectedBottomTab");
		}
		System.out.println("tab name : " + tabName);
		
		// 탭 내부 데이터 DB에서 가져오기
		try {
			if(params.get("sEmpNum") == null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
			} else {
				new Exception();
			}
			
			HashMap<String, String> tabData = new HashMap<>();
			List<HashMap<String, String>> tabDataList = new ArrayList<>();
			switch (tabName) {
			case "human_info_btn" :
				tabData = iCommonService.getData("prsnl.getHumanInfo", params);
				break;
			case "work_info_btn" :
				tabData = iCommonService.getData("prsnl.getWorkInfo", params);
				tabDataList = iCommonService.getDataList("prsnl.getApntmList", params);
				break;
			case "slry_info_btn" :
				tabData = iCommonService.getData("prsnl.getSlryInfo", params);
				break;
				/*case "edctn_level_btn" :
				tabData = iCommonService.getData("prsnl.getEdctnLevel", params);
				break;
			case "cr_btn" :
				tabData = iCommonService.getData("prsnl.getCr", params);
				break;
			case "qlfctn_btn" :
				tabData = iCommonService.getData("prsnl.getQlfctn", params);
				break;*/
			}
			
			/*
			 * if (tabData == null) { new Exception(); }
			 */
			modelMap.put("tabName", tabName);
			modelMap.put("tabData", tabData);
			modelMap.put("tabDataList", tabDataList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
}
