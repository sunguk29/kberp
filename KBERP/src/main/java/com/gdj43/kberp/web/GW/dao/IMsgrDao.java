package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;
import java.util.List;

public interface IMsgrDao {

	public void insertCont(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> readChat(HashMap<String, String> params) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;

}
