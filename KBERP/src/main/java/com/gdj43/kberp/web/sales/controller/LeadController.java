package com.gdj43.kberp.web.sales.controller;

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
		
		mav.addObject("page", params.get("page"));
		
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
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 3, 5);
				
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("lead.getLeadList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/meListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String meListAjax(@RequestParam HashMap<String, String> params, 
							   HttpSession session) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("lead.getMeCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> meList = iCommonService.getDataList("lead.getMeList", params);
		
		modelMap.put("list", meList);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/leadReg")
	public ModelAndView leadReg(ModelAndView mav) {
		
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
				iCommonService.insertData("lead.getLeadAdd", params);
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
	public ModelAndView leadCont(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/leadCont");
		
		return mav;
	}
}