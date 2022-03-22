package com.gdj43.kberp.web.CS.controller;

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




@Controller
public class CmbnController {

	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService ips;
	
	@RequestMapping(value="strgBox")
	public ModelAndView strgBox(ModelAndView mav) {
		
		mav.setViewName("CS/strgBox");
		return mav;
	}
	
	@RequestMapping(value="guideWrtngAdd")
	public ModelAndView guideWrtngAdd(ModelAndView mav) {
		
		mav.setViewName("CS/guideWrtngAdd");
		return mav;
	}
	
	@RequestMapping(value="/guideWrtng")
	public ModelAndView guideWrtng(@RequestParam HashMap<String,String> params,
									ModelAndView mav) {
		
		if(params.get("page")==null || params.get("page")==""){
			params.put("page" , "1");
		}
		
		mav.addObject("page",params.get("page"));
		mav.setViewName("CS/guideWrtng");
		
		return mav;
	}
	
	@RequestMapping(value="/guideWrtngAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View로 인식 시킴
	public String guideWrtngAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//데이터를 담을 객체
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//구현 내용
		//총 게시글 수
		int cnt= iCommonService.getIntData("cm.getGuideCnt",params);
		//페이징 계산
		PagingBean pb = ips.getPagingBean(Integer.parseInt(params.get("page")), cnt,3,5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = iCommonService.getDataList("cm.getGuide",params);
		
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
}
