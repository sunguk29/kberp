package com.gdj43.kberp.web.CS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.IFaqDao;

@Service
public class FaqService implements IFaqService {
	@Autowired
	public IFaqDao iFaqDao;
}
