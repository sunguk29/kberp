package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<HashMap<String, String>> readChat(HashMap<String, String> params) throws Throwable {
		return imsDao.readChat(params);
	}

	@Override
	public void insertChat(HashMap<String, String> params) throws Throwable {
		imsDao.insertChat(params);
	}
	
	

}
