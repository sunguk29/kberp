package com.gdj43.kberp.web.GW.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.GW.dao.ElctrncAprvlDao;

@Service
public class ElctrncAprvlService {

	@Autowired
	public ElctrncAprvlDao elctrncAprvlDao;
	
}

//unsatisfy dependency exception -> 서버 설정 오류, Bean(Controller, Service, Repository) 생성 오류, Bean을 잘못 썻거나
//브런치 커밋 테스트
//브런치 커밋 테스트1