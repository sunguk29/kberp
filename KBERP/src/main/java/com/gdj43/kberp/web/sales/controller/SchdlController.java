package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
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
import com.gdj43.kberp.web.sales.service.ISchdlService;

@Controller
public class SchdlController {
	@Autowired
	public ICommonService  iCommonService;
	
	@Autowired
	public ISchdlService iscService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/salesSchdl")
	public ModelAndView salesSchdl(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sales/salesSchdl");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesSchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		Date month = new Date();
		
		SimpleDateFormat sdm = new SimpleDateFormat("YYYY-MM");
		
		params.put("month", sdm.format(month));
		
		List<HashMap<String, String>> slist = iCommonService.getDataList("salesSchdl.getSalesDaySchdlList", params);
		
		modelMap.put("slist", slist);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/salesDaySchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String salesDaySchdlAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("salesSchdl.getSalesSchdlList", params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}

	
	@RequestMapping(value = "/mgrListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mgrListAjax(@RequestParam HashMap<String, String> params, 
						   HttpSession session) throws Throwable {
	
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();		
	
	int cnt = iCommonService.getIntData("salesSchdl.getMgrCnt", params);
	
	PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
	
	params.put("startCount", Integer.toString(pb.getStartCount()));
	params.put("endCount", Integer.toString(pb.getEndCount()));
	
	List<HashMap<String, String>> mgrList = iCommonService.getDataList("salesSchdl.getMgrList", params);
	
	modelMap.put("mgrList", mgrList);
	modelMap.put("pb", pb);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/salesSchdlReg")
	public ModelAndView salesSchdlReg(ModelAndView mav) {
		mav.setViewName("sales/salesSchdlReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesSchdlAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charest=UTF-8")
	@ResponseBody
	public String salesSchdlActionAjax(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert":
				iCommonService.insertData("salesSchdl.salesSchdlAdd", params);
				break;
			case "update":
				
				break;
			case "delete":
				
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
