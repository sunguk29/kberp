package com.gdj43.kberp.web.sales.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.ISchdlDao;

@Service
public class SchdlService implements ISchdlService {
	@Autowired
	public ISchdlDao iscDao;
}
