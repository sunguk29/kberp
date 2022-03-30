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
	
	// 영업관리 목록 
	@RequestMapping(value = "/salesListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int listCnt = iCommonService.getIntData("salesMng.salesListCnt", params);
		
		int RsltCnt = iCommonService.getIntData("salesMng.salesListCnt", params);
		
		int stage0 = iCommonService.getIntData("salesMng.salesStage0", params);
		int stage1 = iCommonService.getIntData("salesMng.salesStage1", params);
		int stage2 = iCommonService.getIntData("salesMng.salesStage2", params);
		int stage3 = iCommonService.getIntData("salesMng.salesStage3", params);
		
		modelMap.put("RsltCnt", RsltCnt);
		
		modelMap.put("stage0", stage0);
		modelMap.put("stage1", stage1);
		modelMap.put("stage2", stage2);
		modelMap.put("stage3", stage3);
		
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), listCnt, 10, 5);
		
		// 데이터 시작, 종료 할당
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		// 목록 조회
		List<HashMap<String, String>> list = iCommonService.getDataList("salesMng.getSalesList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	// sales1SalesChncReg : 영업기회 등록
	@RequestMapping(value= "/sales1SalesChncReg")
	public ModelAndView sales1SalesChncReg(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		params.put("leadNum", "12"); // 나중에 지우기...
		
		// 영업시작일 넣어주기
		Date tday = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		
		//조회
		HashMap<String, String> leadData = iCommonService.getData("salesMng.getSales1BringLead", params);
		
		mav.addObject("tday", sdf.format(tday));
		mav.addObject("ln", leadData);
		
		mav.setViewName("sales/sales1SalesChncReg");
		
		return mav;
	}
	
	// salesMng1ActionAjax : 영업기회 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng1ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesMng1ActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert":
				String seq = iCommonService.getStringData("salesMng.salesSeq"); // 영업번호 시퀀스 가져오기
				params.put("ss", seq); // 영업번호 시퀀스 넣어주기
				modelMap.put("seq", seq); // 영업기회 등록 후 영업기회 상세보기로 이동할 때 필요.
				iCommonService.insertData("salesMng.sales1AddSales", params); // 영업기회 등록
				iCommonService.insertData("salesMng.sales1AddLoan", params); // 영업기회 대출상세정보tab
				iCommonService.insertData("salesMng.sales1AddBsns", params); // 영업기회 예정사업 상세정보tab
				if (params.get("attFile") != null) {
					iCommonService.insertData("salesMng.sales1AddBsnsAtt", params); // 영업기회 예정사업 첨부파일tab
				}
				break;
			case "update":
				iCommonService.updateData("salesMng.sales1UpdateSales", params);
				iCommonService.updateData("salesMng.sales1UpdateLoan", params);
				iCommonService.updateData("salesMng.sales1UpdateBsns", params);
				if (params.get("attFile") != null) {
					iCommonService.updateData("salesMng.sales1UpdateBsnsAtt", params);
				}
				break;
			case "failure":
				// sales1Failure : 영업기회 실패 (PRGRS_STS 5번으로.)
				iCommonService.updateData("salesMng.sales1Failure", params);
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
	
	// sales1Update : 영업기회 수정
	@RequestMapping(value = "/sales1Update")
	public ModelAndView sales1Update(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		HashMap<String, String> data = iCommonService.getData("salesMng.getSales1", params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sales/sales1Update");
		
		return mav;
	}
	
	// sales2SgstnReg : 제안 등록
	@RequestMapping(value = "/sales2SgstnReg")
	public ModelAndView sales2SgstnReg(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		
		//조회
		HashMap<String, String> sales1DataLead = iCommonService.getData("salesMng.getSales2BringLead", params);
		HashMap<String, String> sales1DataLoan = iCommonService.getData("salesMng.getSales2BringLoan", params);
		HashMap<String, String> sales1DataBsns = iCommonService.getData("salesMng.getSales2BringBsns", params);
		
		mav.addObject("lead", sales1DataLead);
		mav.addObject("loan", sales1DataLoan);
		mav.addObject("bsns", sales1DataBsns);
		
		mav.setViewName("sales/sales2SgstnReg");
		
		return mav;
	}
	
	
	// salesMng2ActionAjax : 제안 등록, 수정, 삭제
	@RequestMapping(value = "/salesMng2ActionAjax/{gbn}", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String salesMng2ActionAjax (@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			switch (gbn) {
			case "insert" :
				iCommonService.insertData("salesMng.sales2AddLoan", params); // 제안 대출상세정보tab
				iCommonService.insertData("salesMng.sales2AddClntCmpny", params); // 제안 고객사 상세정보tab
				iCommonService.insertData("salesMng.sales2AddDtlInfo", params); // 제안 상세정보tab
				if (params.get("attFile") != null) {
					iCommonService.insertData("salesMng.sales2AddDtlInfoAtt", params); // 제안 상세정보 첨부파일tab
				}
				
				break;
			case "update" :
				break;
				
			case "failure" :
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







