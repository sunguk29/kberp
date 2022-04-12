package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;
import java.util.List;

public interface IMsgrService {

	public void insertCont(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getContList(int lastChatNo) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;

	public int getMaxNo() throws Throwable;


}
