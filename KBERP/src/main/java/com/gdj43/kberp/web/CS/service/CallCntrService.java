package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.ICallCntrDao;

@Service
public class CallCntrService implements ICallCntrService {
	@Autowired
	public ICallCntrDao iccd;

	@Override
	public List<HashMap<String, String>> getCallCenter(HashMap<String, String> params) throws Throwable {
		return iccd.getCallCenter(params);
	}
}
