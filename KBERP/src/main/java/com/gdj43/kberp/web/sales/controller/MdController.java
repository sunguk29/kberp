package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

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


@Controller
public class MdController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	private final Logger log = LoggerFactory.getLogger(MdController.class);

	
	//////목록 view
	@RequestMapping(value = "/mdList")
	public ModelAndView  mdList (@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) {

		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		System.err.println("mdList Controller" + params);
		mav.addObject("params", params);
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/mdList");

		return mav;
	} 
	
	//////목록 Ajax
	@RequestMapping (value ="/mdListAjax", method = RequestMethod.POST,
					 produces = "test/json;charset=UTF-8")
	@ResponseBody
	public String mdListAjax (@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>() ;
		
		log.info("in mdListAjax");
		log.info("requestParams : " + params);
		
		try {
			int totalCnt = iCommonService.getIntData("md.getTotalCnt", params);
			int rlsExpctdCnt = iCommonService.getIntData("md.getRlsExpctdCnt", params);
			int onSaleCnt = iCommonService.getIntData("md.getOnSaleCnt", params);
			int offSaleCnt = iCommonService.getIntData("md.getOffSaleCnt", params);
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), totalCnt);
			
			params.put("startCount", Integer.toString(pb.getStartCount()));
			params.put("endCount", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String,String>> list = iCommonService.getDataList("md.getDataList", params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			modelMap.put("totalCnt",totalCnt);
			modelMap.put("onSaleCnt",onSaleCnt);
			modelMap.put("rlsExpctdCnt",rlsExpctdCnt);
			modelMap.put("offSaleCnt",offSaleCnt);
		}
		catch(Exception e) {
			log.info("ErrMsg : " + e);
			System.err.println(e);
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	//////상세보기 view
	@RequestMapping(value="/mdCont")
	public ModelAndView mdCont(@RequestParam HashMap<String, String> params,
							ModelAndView mav) throws Throwable {
		
		System.err.println("======== /mdCont ==========");
		
		/*
		HashMap<String, String> data = iCommonService.getData("md.getMdContData", params);
		
		mav.addObject("data", data);
		
		*/
		System.err.println("mdCont controller" + params);
		mav.addObject("params", params);
		mav.setViewName("sales/mdCont");
		
		return mav;
	}
	
	//////작성
	@RequestMapping (value = "/mdReg")
	public ModelAndView mdReg(@RequestParam HashMap<String, String> params, 
							   ModelAndView mav) {
		
		System.err.println("mdReg controller" + params);
		mav.addObject("params", params);
		mav.setViewName("sales/mdReg");
		return mav;
	}
	
	//////작성 수정 삭제 Ajax
	@RequestMapping(value = "/mdActionAjax/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String mdActionAjax(@RequestParam HashMap<String, String> params,
							@PathVariable String gbn) throws Throwable {
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		switch(gbn) {
		case "insert" :
			iCommonService.insertData("md.insertMdData", params);
			break;
		case "update" :
			iCommonService.updateData("md.updateMdData", params);
			break;
		case "delete" :
			iCommonService.deleteData("md.deleteMdData", params);
			break;
		}
		modelMap.put("res", "success");
	}catch (Throwable e) {
		e.printStackTrace();
		modelMap.put("res", "failed");
	}
	
	return mapper.writeValueAsString(modelMap);
}
	
}