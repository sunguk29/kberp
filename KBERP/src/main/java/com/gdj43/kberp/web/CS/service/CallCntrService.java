package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.ICallCntrDao;

@Service
public class CallCntrService implements ICallCntrService {
	@Autowired
	public ICallCntrDao iccd;

	@Override
	public void clntSave(HashMap<String, String> params) throws Throwable {
		iccd.clntSave(params);
	}

	@Override
	public void noteSave(HashMap<String, String> params) throws Throwable {
		iccd.noteSave(params);
	}
}
