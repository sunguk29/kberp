package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.sales.service.IClntRprtService;
import com.gdj43.kberp.web.sales.service.ISchdlService;


@Controller
public class RprtController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ISchdlService iSchdlService; 
	
	@Autowired
	public IClntRprtService iClntRprtService;
	
	
	//고객 보고서
	@RequestMapping(value = "/clntChart")
	public ModelAndView clntList(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		// 고객사 개수
		int AllCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListAllCnt", params);
		int ccLastMonthCnt = iCommonService.getIntData("clntRprt.ccLastMonthCnt", params);
		int ccThatMonthCnt = iCommonService.getIntData("clntRprt.ccThatMonthCnt", params);
		double ccAvgCnt = iClntRprtService.ccAvgCnt(params);
		// 고객 개수
		int clntLastMonthCnt = iCommonService.getIntData("clntRprt.clntLastMonthCnt", params);
		int clntThatMonthCnt = iCommonService.getIntData("clntRprt.clntThatMonthCnt", params);
		double clntAvgCnt = iClntRprtService.clntAvgCnt(params);
		int clntAllCnt = iCommonService.getIntData("clntRprt.clntAllCnt", params);
		//고객 등급
		int clntGradeS = iCommonService.getIntData("clntRprt.clntGradeS", params);
		int clntGradeA = iCommonService.getIntData("clntRprt.clntGradeA", params);
		int clntGradeB = iCommonService.getIntData("clntRprt.clntGradeB", params);
		int clntGradeC = iCommonService.getIntData("clntRprt.clntGradeC", params);
		int clntGradeD = iCommonService.getIntData("clntRprt.clntGradeD", params);
		
		Date dt = new Date();
		Date mon = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat month = new SimpleDateFormat("yyyy.MM");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		cal.add(Calendar.DATE, -60);
		
		String startDate = sdf.format(cal.getTime());
		String endDate = sdf.format(dt);
		String  tMonth = month.format(mon);

		
		if(params.get("startDate") == null || params.get("startDate") == "") {
			params.put("startDate", startDate); 
			params.put("endDate", endDate); // 넘어오는게 없으면 현재날짜뽑아온거를 추가.
		}
		params.put("tMonth", tMonth);

		System.out.println("tMonth");
		
		mav.addObject("AllCnt", AllCnt);
		mav.addObject("ccLastMonthCnt", ccLastMonthCnt);
		mav.addObject("ccThatMonthCnt", ccThatMonthCnt);
		mav.addObject("ccAvgCnt", ccAvgCnt);
		
		mav.addObject("clntLastMonthCnt", clntLastMonthCnt);
		mav.addObject("clntThatMonthCnt", clntThatMonthCnt);
		mav.addObject("clntAvgCnt", clntAvgCnt);
		mav.addObject("clntAllCnt", clntAllCnt);
		
		mav.addObject("clntGradeS", clntGradeS);
		mav.addObject("clntGradeA", clntGradeA);
		mav.addObject("clntGradeB", clntGradeB);
		mav.addObject("clntGradeC", clntGradeC);
		mav.addObject("clntGradeD", clntGradeD);
		
		mav.addObject("tMonth", params.get("tMonth"));
		mav.addObject("startDate", params.get("startDate"));
		mav.addObject("endDate", params.get("endDate"));
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
	
	@RequestMapping(value = "/totalChart")
	public ModelAndView totalChart(ModelAndView mav) {
		
		mav.setViewName("sales/rprt/totalChart");
		
		return mav;
	}
	
	// 신규 영업활동 순위
	@RequestMapping(value = "/totalNewSalesRankAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String totalNewSalesRankAjax(HttpServletRequest request, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		int size = Integer.parseInt(request.getParameter("size"));
//		int series = Integer.parseInt(request.getParameter("series"));
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> bsnList = iSchdlService.getData("totalRprt.getTotalNewSalesRank");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		temp.put("name", "민수");
		temp.put("y", Integer.parseInt(String.valueOf(bsnList.get("CNT"))));
		list.add(temp);
		modelMap.put("list", list);
        return mapper.writeValueAsString(modelMap);
	}
	
}
