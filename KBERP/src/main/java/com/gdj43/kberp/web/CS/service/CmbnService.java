package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.ICmbnDao;

@Service
public class CmbnService implements ICmbnService{
	@Autowired
	public ICmbnDao icd;

	@Override
	public List<HashMap<String, String>> getGuide(HashMap<String, String> params) throws Throwable {
		
		return icd.getGuide(params);
	}
}
