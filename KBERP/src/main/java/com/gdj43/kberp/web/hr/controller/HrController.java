package com.gdj43.kberp.web.hr.controller;

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
import com.gdj43.kberp.web.common.service.ICommonService;
import com.gdj43.kberp.web.hr.service.IHrService;

/***** 공통코드, 조직도, 인사발령, 증명서발급 메뉴 *****/

@Controller
public class HrController {
	@Autowired
	public IHrService iHrService;
	@Autowired
	public ICommonService iCommonService;
	
	// 인사발령
    @RequestMapping(value = "/apntm")
    public ModelAndView apntmList(@RequestParam HashMap<String,String> params, 
                         ModelAndView mav) {
      mav.setViewName("hr/apntm");
      
      return mav;
    }
    
	// 인사발령ajax
	@RequestMapping(value = "/apntmListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String apnmtListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iHrService.getApntmList(params);
		HashMap<String, String> cont = iHrService.getApntmCont(params);
		
		modelMap.put("list", list);
		modelMap.put("cont", cont);
		
		return mapper.writeValueAsString(modelMap); 
    }
	
	// 증명서발급(사용자)
	@RequestMapping(value = "/crtft")
	public ModelAndView crtft(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		try {
			if(session.getAttribute("sEmpNum") != null) {
				params.put("sEmpNum", String.valueOf(session.getAttribute("sEmpNum")));
				// HashMap<String, String> emp = iCommonService.getData("hr.getEmpInfo", params);
				List<HashMap<String, String>> list = iCommonService.getDataList("hr.getEmpRqstList", params);
				
				mav.addObject("list", list);
				mav.setViewName("hr/crtfct");
			} else {
				mav.setViewName("redirect:login");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("exception", e);
			mav.setViewName("exception/EXCEPTION_INFO");
		}
		return mav;
	 }
	
	// 조직도
    @RequestMapping(value = "/orgnztChart")
    public ModelAndView orgnzt(@RequestParam HashMap<String,String> params, 
    							ModelAndView mav) throws Throwable {
    	
    	mav.setViewName("hr/orgnztChart");
      
    	return mav;
    }
    
	// 조직도 ajax
	@RequestMapping(value = "/orgnztChartAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String orgnztChartAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> dept = iCommonService.getDataList("hr.getOrgnztDeptList", params);
		List<HashMap<String, String>> emp = iCommonService.getDataList("hr.getOrgnztEmpList", params);
		
		modelMap.put("dept", dept);
		modelMap.put("emp", emp);
		
		return mapper.writeValueAsString(modelMap); 
    }
	 
	// 조직도 action ajax
	@RequestMapping(value = "/orgnztChartActionAjax/{gbn}", method = RequestMethod.POST,
             produces = "text/json;charset=UTF-8")
	 @ResponseBody
	 public String orgnztChartActionAjax(@RequestParam HashMap<String, String> params, @PathVariable String gbn) throws Throwable {
	    ObjectMapper mapper = new ObjectMapper();
	    
	    Map<String, Object> modelMap = new HashMap<String, Object>();
	    
	    try {
	       switch(gbn) {
	       case "insert" :
	    	   iCommonService.insertData("hr.addDept", params);
	          break;
	       case "update" :
	    	   iCommonService.updateData("hr.updateDept", params);
	          break;
	       case "delete" :
	    	   iCommonService.updateData("hr.deleteDept", params);
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

