package com.gdj43.kberp.web.sales.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.IClntMngDao;

@Service
public class ClntMngService implements IClntMngService {
	@Autowired
	public IClntMngDao iClntMngDao;

	@Override
	public void insertClntMng(HashMap<String, String> params) throws Throwable {
		iClntMngDao.insertClntMng(params);
	}

}
