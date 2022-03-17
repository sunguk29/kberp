package com.gdj43.kberp.web.hr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.IHRDao;

@Service
public class HRService implements IHRService {
	@Autowired
	public IHRDao ihd;
}
