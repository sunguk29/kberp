package com.gdj43.kberp.web.GW.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.GW.dao.IElctrncAprvlDao;

@Service
public class ElctrncAprvlService {

	@Autowired 
	public IElctrncAprvlDao iElctrncAprvlDao;
	
}
