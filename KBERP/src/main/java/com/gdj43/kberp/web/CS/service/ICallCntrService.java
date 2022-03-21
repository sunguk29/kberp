package com.gdj43.kberp.web.CS.service;

import java.util.HashMap;
import java.util.List;

public interface ICallCntrService {

	public List<HashMap<String, String>> getCallCenter(HashMap<String, String> params) throws Throwable;

	public void callCenter(HashMap<String, String> params) throws Throwable;


}
