package com.gdj43.kberp.web.sales.controller;

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

@Controller
public class ClntMngController {
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/clntCmpnyList")
	public ModelAndView clntCmpnyList(@RequestParam HashMap<String, String> params, 
									  ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/clntCmpnyList");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyListAjax", method = RequestMethod.POST, 
					produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String clntCmpnyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListCnt", params);
		
		int MaxCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListCnt", params);
		int CntrctCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyCntrctCnt", params);
		int PartnerCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyPartnerCnt", params);
		int TmnCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyTmnCnt", params);
		int SspsCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnySspsCnt", params);
		int ForeignCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyForeignCnt", params);
		int EtcCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyEtcCnt", params);
		
		modelMap.put("MaxCnt", MaxCnt);
		modelMap.put("CntrctCnt", CntrctCnt);
		modelMap.put("PartnerCnt", PartnerCnt);
		modelMap.put("TmnCnt", TmnCnt);
		modelMap.put("SspsCnt", SspsCnt);
		modelMap.put("ForeignCnt", ForeignCnt);
		modelMap.put("EtcCnt", EtcCnt);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClntCmpntList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/clntCmpnyReg")
	public ModelAndView clntCmpnyReg(@RequestParam HashMap<String, String> params, 
									  ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("sales/clntCmpnyReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyMngAction/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntCmpnyMngActionAjax(@RequestParam HashMap<String, String> params, 
									 @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("clntCmpnyMng.getClntCmpnyAdd", params);
				break;
			case "update" :
				
				break;
			case "delete" :
				
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);
	}

}
