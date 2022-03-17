package com.gdj43.kberp.web.hr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.hr.dao.ISlryDao;

@Service
public class SlryService implements ISlryService {
	@Autowired
	public ISlryDao iSlryDao;
}
