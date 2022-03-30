package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

public interface IMsgrService {

	public void insertCont(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> readChat(HashMap<String, String> params) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;

}
