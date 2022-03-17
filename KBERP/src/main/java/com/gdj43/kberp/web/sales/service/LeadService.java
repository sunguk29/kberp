package com.gdj43.kberp.web.sales.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.ILeadDao;

@Service
public class LeadService implements ILeadService {
	
	@Autowired
	public ILeadDao iLeadDao;

}
