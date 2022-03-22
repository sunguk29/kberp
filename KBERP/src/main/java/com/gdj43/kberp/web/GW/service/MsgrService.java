package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.GW.dao.IMsgrDao;

@Service
public class MsgrService implements IMsgrService {

	@Autowired
	public IMsgrDao imsDao;
	
	@Override
	public void insertCont(HashMap<String, String> params) throws Throwable {
		imsDao.insertCont(params);
	}
	
	

}
