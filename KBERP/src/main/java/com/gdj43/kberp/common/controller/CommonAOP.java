package com.gdj43.kberp.common.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.gdj43.kberp.web.common.service.ICommonService;

@Aspect
public class CommonAOP {
	@Autowired
	public ICommonService iCommonService;
	
	@Pointcut("execution(* com.gdj43.kberp..*Controller.*(..))"
			+ "&&!execution(* com.gdj43.kberp..*Controller.*Ajax(..))"
			+ "&&!execution(* com.gdj43.kberp..*Controller.*login*(..))"
			+ "&&!execution(* com.gdj43.kberp..*Controller.*logout*(..))")
	public void testAOP() {}
	
	@Around("testAOP()")
	public ModelAndView testAOP(ProceedingJoinPoint joinPoint)
														throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sEmpNum") != null) {
			try {
				HashMap<String, String> params = new HashMap<String, String>();
				
				params.put("athrtyNum", String.valueOf(session.getAttribute("sAthrtyNum")));
				params.put("menuNum", String.valueOf(request.getParameter("menuNum")));
				
				String athrtyTypeNum = iCommonService.getStringData("common.menuAthrtyCheck", params);
				
				if(athrtyTypeNum == null || athrtyTypeNum.equals("0")) {
					mav.setViewName("redirect:logout");
				} else {
					mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
				}
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("redirect:logout");
			}
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
}













