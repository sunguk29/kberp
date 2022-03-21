package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

public interface ICallCntrDao {

	public List<HashMap<String, String>> getCallCenter(HashMap<String, String> params) throws Throwable;

	public void callCenter(HashMap<String, String> params) throws Throwable;

}
