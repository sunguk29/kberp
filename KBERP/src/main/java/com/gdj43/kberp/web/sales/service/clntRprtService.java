package com.gdj43.kberp.web.sales.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.sales.dao.IClntRprtDao;

@Service
public class clntRprtService implements IClntRprtService {

	@Autowired
	public IClntRprtDao iClntRprtDao;

	@Override
	public double clntAvgCnt(HashMap<String, String> params) throws Throwable {
		return iClntRprtDao.clntAvgCnt(params);
	}

	@Override
	public double ccAvgCnt(HashMap<String, String> params) throws Throwable {
		return iClntRprtDao.ccAvgCnt(params);
	}
}
