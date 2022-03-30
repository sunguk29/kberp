package com.gdj43.kberp.web.GW.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.GW.service.IMsgrService;
import com.gdj43.kberp.web.common.service.ICommonService;


@Controller
public class MsgrController {

	@Autowired
	public ICommonService ics;
	
	@Autowired
	public IMsgrService ims;
	
	@Autowired
	public IPagingService ips;
	
	
	@RequestMapping(value = "/msgr")
	public ModelAndView msgr(ModelAndView mav) {
		
		System.out.println("#################################duasodpjslfkgok;ag");
		
		mav.setViewName("GW/msgr");
		
		
		return mav;
	}
		
	
	@RequestMapping(value = "/actionChat/{gbn}", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertChats(@RequestParam HashMap<String, String> params,
			 						HttpSession session, @PathVariable String gbn) throws Throwable {
	
		
		
		params.get("emp_num");
		System.out.println("dsdsd" + params.get("emp_num"));
		
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();	
		
	
	
	
		try {
			switch(gbn) {
			case "insert" :
				String seq = ics.getStringData("msgr.insertChat");
				params.put("chatsq", seq); // 채팅방 번호 넣어주기
				ics.insertData("msgr.insertChat", params);
				/* ics.insertData("msgr.insertCont",params); */
				break;
			case "join" :
				ics.deleteData("msgr.joinChat",params);
				break;	
	/*			case "delete" :
				ims.deleteChat(params);
				break; */
			}
			modelMap.put("res", "success");
		}catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);	
		}
	
	
	@RequestMapping(value = "/readCont")
	public ModelAndView insertChat(@RequestParam HashMap<String, String> params,
									ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = ims.readChat(params);
		
		mav.addObject("list", list);
		
		mav.setViewName("GW/msgr");
		
		return mav;
	}
		
	
	@RequestMapping(value = "/listChat")
	public ModelAndView listChat(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		
		List<HashMap<String, String>> list = ics.getDataList("msgr.getChatList", params);
		
		mav.addObject("list", list);
		
		
		mav.setViewName("GW/msgr");
		
		return mav;
	}
	
	@RequestMapping(value = "/addListChatAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String addListChatAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		
		System.out.println("@@@@@@@@@@@@@@dsad" + params);
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = ics.getDataList("msgr.addListChat", params) ;
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@RequestMapping(value = "/insertContAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertChatAjax(@RequestParam HashMap<String, String> params,
											   HttpServletRequest request,
											   ModelAndView modelAndView) throws Throwable {
		
		System.out.println("######################"+params);
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();	
		
		// #{chatNum}, #{empNum}, #{cont},
		
		try {
			String seq = ics.getStringData("msgr.insertCont");
			params.put("contsq", seq);
			ics.insertData("msgr.insertCont", params);
			
			
			modelMap.put("messege", CommonProperties.RESULT_SUCCESS);
		} catch (Exception e) {
			modelMap.put("message", CommonProperties.RESULT_ERROR);
			modelMap.put("errorMessage", e.getMessage());
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
}
