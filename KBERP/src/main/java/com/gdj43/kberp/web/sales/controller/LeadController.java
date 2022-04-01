package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

// ********** 리드관리 *********
@Controller
public class LeadController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/leadList")
	public ModelAndView leadList(@RequestParam HashMap<String, String> params,
								 ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		Date dt = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		cal.add(Calendar.DATE, -60);
		
		String searchDate = sdf.format(cal.getTime());
		String searchDate2 = sdf.format(dt);

		
		if(params.get("searchDate") == null || params.get("searchDate") == "") {
			params.put("searchDate", searchDate); 
			params.put("searchDate2", searchDate2); // 넘어오는게 없으면 현재날짜뽑아온거를 추가.
		}

		
		mav.addObject("page", params.get("page"));
		mav.addObject("searchDate", params.get("searchDate"));
		mav.addObject("searchDate2", params.get("searchDate2"));
		
		mav.setViewName("sales/leadList");
		
		return mav;
	}
	
	@RequestMapping(value = "/leadListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("lead.getLeadCnt", params);
		
		int listCnt = iCommonService.getIntData("lead.getListCnt", params);
		int ongoingCnt = iCommonService.getIntData("lead.getOngoingCnt", params);
		int rcgntnCnt = iCommonService.getIntData("lead.getRcgntnCnt", params);
		int failCnt = iCommonService.getIntData("lead.getFailCnt", params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("listCnt", listCnt);
		modelMap.put("ongoingCnt", ongoingCnt);
		modelMap.put("rcgntnCnt", rcgntnCnt);
		modelMap.put("failCnt", failCnt);		
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
				
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("lead.getLeadList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
// 담당자 조회 팝업	
	@RequestMapping(value = "/mngrListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mngrListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
		// 총 게시글 수
		int mngrCnt = iCommonService.getIntData("lead.getMngrCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), mngrCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> mngrList = iCommonService.getDataList("lead.getMngrList", params);
		
		modelMap.put("list", mngrList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
// 고객사 조회 팝업
	@RequestMapping(value = "/ccListAjax", method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ccListAjax(@RequestParam HashMap<String, String> params, 
						   HttpSession session) throws Throwable {
	
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();		
	
	// 총 게시글 수
	int ccCnt = iCommonService.getIntData("lead.getCcCnt", params);
	
	PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), ccCnt, 5, 5);
	
	params.put("startCount", Integer.toString(pb.getStartCount()));
	params.put("endCount", Integer.toString(pb.getEndCount()));
	
	List<HashMap<String, String>> ccList = iCommonService.getDataList("lead.getCcList", params);
	
	modelMap.put("list", ccList);
	modelMap.put("pb", pb);
	
	return mapper.writeValueAsString(modelMap);
	}
	
// 고객 조회 팝업
		@RequestMapping(value = "/ecListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String ecListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
		// 총 게시글 수
		int ecCnt = iCommonService.getIntData("lead.getEcCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), ecCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> ecList = iCommonService.getDataList("lead.getEcList", params);
		
		modelMap.put("list", ecList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
		}
		
// 리드 등록
	@RequestMapping(value = "/leadReg")
	public ModelAndView leadReg(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		

		mav.setViewName("sales/leadReg");
		
		return mav;
	}
	
	@RequestMapping(value ="/leadAction/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadActionAjax(@RequestParam HashMap<String, String> params,
								 @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("lead.getLeadAdd", params); // 리드 등록
				iCommonService.insertData("lead.getLeadAttAdd", params); // 리드 등록 첨부파일
				break;
			case "ecInsert" :
				iCommonService.insertData("lead.getClntAdd", params); 		
				break;	
			case "update" :
				
				break;
			case "delete" :
				
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	
	@RequestMapping(value = "/leadCont")
	public ModelAndView leadCont(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("salesSchdl.getLeadCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/leadCont");
		
		return mav;
	}
}