package com.gdj43.kberp.web.CS.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gdj43.kberp.web.CS.dao.IInqryDao;

public class InqryService implements IInqryService {
	@Autowired
	public IInqryDao iInqryDao;
}
