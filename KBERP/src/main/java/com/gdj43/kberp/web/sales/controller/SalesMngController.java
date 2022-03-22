package com.gdj43.kberp.web.sales.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

// ************** 영업관리 ************** //
@Controller
public class SalesMngController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/salesList")
	public ModelAndView salesList(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if (params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("sales/salesList");
		
		return mav;
	}
	
	@RequestMapping(value = "/salesListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("salesMng.salesListCnt", params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		// 데이터 시작, 종료 할당
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSalesList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	// sales1SalesChncReg : 영업기회 등록 (?리퀘스트파람 받고 리드내용 받기?)
	@RequestMapping(value="/sales1SalesChncReg")
	public ModelAndView sales1SalesChncReg(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		params.put("leadNum", "7"); // 나중에 지우기...
		
		// 영업시작일 넣어주기
		Date tday = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		
		//조회
		HashMap<String, String> leadData = iCommonService.getData("salesMng.getSales1AddLead", params);
		
		mav.addObject("tday", sdf.format(tday));
		mav.addObject("ln", leadData);
		mav.setViewName("sales/sales1SalesChncReg");
		
		return mav;
	}
	
	// salesMngAction : 등록, 수정, 삭제
	@RequestMapping(value = "/salesMngAction/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesMngActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert":
				String seq = iCommonService.getStringData("salesMng.salesSeq"); // 영업번호 시퀀스 가져오기
				params.put("ss", seq); // 영업번호 시퀀스 넣어주기
				iCommonService.insertData("salesMng.getSales1AddSales", params); // 영업기회 등록
				iCommonService.insertData("salesMng.getSales1AddLoan", params); // 영업기회 대출상세정보tab
				iCommonService.insertData("salesMng.getSales1AddBsns", params); // 예정사업 상세정보tab
				/* iCommonService.insertData("salesMng.getSales1AddBsnsAtt", params); */
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
	
	
	// sales1SalesChncCont : 영업기회 상세보기
	@RequestMapping(value="/sales1SalesChncCont")
	public ModelAndView sales1SalesChncCont(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/sales1SalesChncCont");
		
		return mav;
	}
	
	
	
	
	
	
}







