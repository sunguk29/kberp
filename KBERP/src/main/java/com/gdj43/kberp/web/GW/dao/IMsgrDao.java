package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

public interface IMsgrDao {
	
	public int getMaxNo() throws Throwable;

	public void insertCont(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getContList(int lastChatNo) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;


}
