package com.gdj43.kberp.web.mng.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


/*** 시설물 관리 메뉴 ***/

@Controller
public class FcltyController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/fcltUseRqst")
	public ModelAndView fcltUseRqst(@RequestParam HashMap<String, String >params,ModelAndView mav) throws Throwable{
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/fcltUseRqst");
		
		return mav;
	}
	
	@RequestMapping(value="/fcltUseRqstAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String fcltUseRqstAjax(@RequestParam HashMap<String, String> params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCommonService.getIntData("Fclty.fcltyListCnt",params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,5,10);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.rsvtnFcltyList", params);
		
		modelMap.put("pb", pb);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value= "/fcltUseRqstView")
	public ModelAndView fcltUseRqstView(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("Fclty.fcltUseRqstView",params);
		
		mav.addObject("data", data);
		
		mav.setViewName("mng/fcltUseRqstView");
		
		return mav;
	}

	@RequestMapping(value ="/fcltUseRqstWrite")
	public ModelAndView fcltUseRqstWrite(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = iCommonService.getDataList("Fclty.fcltyList", params);
		
		mav.addObject("list", list);
		
		mav.setViewName("mng/fcltUseRqstWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/fcltAction/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8") 
	@ResponseBody 
	public String fcltActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		try {			
			switch(gbn) {
			case "insert" : //..캘린더 어쩔거야 서유경
				iCommonService.deleteData("Fclty.fcltUseRqstCncl", params);
				break;
			case "delete" :
				iCommonService.deleteData("Fclty.fcltUseRqstCncl", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//시설물 사용신청 안끝냄 위에 만들기
	@RequestMapping(value="/fcltList")
	public ModelAndView fcltList(@RequestParam HashMap<String, String >params,ModelAndView mav) throws Throwable{
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("mng/fcltList");
		
		return mav;
	}
	
}




















