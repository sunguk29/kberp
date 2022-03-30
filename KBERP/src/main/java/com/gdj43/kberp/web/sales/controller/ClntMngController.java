package com.gdj43.kberp.web.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ModelAndView clntCmpnyList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		int AllCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListAllCnt", params);
		int CntrctCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyCntrctCnt", params);
		int PartnerCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyPartnerCnt", params);
		int TmnCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyTmnCnt", params);
		int SspsCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnySspsCnt", params);
		int ForeignCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyForeignCnt", params);
		int EtcCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyEtcCnt", params);
		
		mav.addObject("AllCnt", AllCnt);
		mav.addObject("CntrctCnt", CntrctCnt);
		mav.addObject("PartnerCnt", PartnerCnt);
		mav.addObject("TmnCnt", TmnCnt);
		mav.addObject("SspsCnt", SspsCnt);
		mav.addObject("ForeignCnt", ForeignCnt);
		mav.addObject("EtcCnt", EtcCnt);
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/clntCmpnyList");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntList")
	public ModelAndView clntList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		mav.setViewName("sales/clntList");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyCont")
	public ModelAndView clntCmpnyCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		int clCnt = iCommonService.getIntData("clntCmpnyMng.clListCnt", params);
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCmpnyCont", params);
		
		mav.addObject("data", data);
		mav.addObject("clCnt", clCnt);
		
		mav.setViewName("sales/clntCmpnyCont");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCont")
	public ModelAndView clntCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/clntCont");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntUpdate")
	public ModelAndView clntUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCont", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/clntUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String clntCmpnyListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.clntCmpnyListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClntCmpntList", params);
		
		modelMap.put("list", list);
		modelMap.put("listCnt", listCnt);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/clntListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.clntListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClntList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		modelMap.put("listCnt", listCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/clntCmpnyReg")
	public ModelAndView clntCmpnyReg(ModelAndView mav) {
		
		mav.setViewName("sales/clntCmpnyReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyUpdate")
	public ModelAndView clntCmpnyUpdate(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("clntCmpnyMng.clntCmpnyCont", params);
		
		mav.addObject("data", data);
		mav.setViewName("sales/clntCmpnyUpdate");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntReg")
	public ModelAndView clntReg(ModelAndView mav) {
		
		mav.setViewName("sales/clntReg");
		
		return mav;
	}
	
	@RequestMapping(value = "/clntCmpnyMngActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntCmpnyMngActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.insertData("clntCmpnyMng.ClntCmpnyAdd", params); // 글저장
				iCommonService.insertData("clntCmpnyMng.ClntCmpnyAddAttFile", params); // 첨부파일저장
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.ClntCmpnyAttFileUpdate", params); // 첨부파일저장
				iCommonService.updateData("clntCmpnyMng.ClntCmpnyUpdate", params); // 글저장
				break;
			case "delete" :
				iCommonService.updateData("clntCmpnyMng.ccDelete", params); // 글삭제
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/clntMngAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clntMngAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.getData("clntCmpnyMng.clntAdd", params);
				iCommonService.getData("clntCmpnyMng.clntAttAdd", params);
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.clntUpdate", params); // 첨부파일저장
				iCommonService.updateData("clntCmpnyMng.clntAttUpdate", params); // 글저장
				break;
			case "delete" :
				iCommonService.updateData("clntCmpnyMng.clntDelete", params); // 글삭제
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value = "/popupCcListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String popupCcListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.popupCcListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.popupCcList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/mngListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mngListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int listCnt = iCommonService.getIntData("clntCmpnyMng.popupMngListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 5, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.popupMngList", params);
		
		modelMap.put("mngList", list);
		modelMap.put("mngPb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/opBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String opBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int opListCnt = iCommonService.getIntData("clntCmpnyMng.opListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getOpList", params);
		
		modelMap.put("list", list);
		modelMap.put("opListCnt", opListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/ccBotActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ccBotActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch(gbn) {
			case "insert" :
				iCommonService.getData("clntCmpnyMng.opContAdd", params);
				break;
			case "update" :
				iCommonService.updateData("clntCmpnyMng.opContUpdate", params);
				break;
			}
			modelMap.put("res", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "faild");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value = "/clBotListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String clBotListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int clListCnt = iCommonService.getIntData("clntCmpnyMng.clListCnt", params);
		
		List<HashMap<String, String>> list = iCommonService.getDataList("clntCmpnyMng.getClList", params);
		
		modelMap.put("list", list);
		modelMap.put("clListCnt", clListCnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
}
