package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;

public interface ICallCntrDao {

	public void clntSave(HashMap<String, String> params) throws Throwable;

	public void noteSave(HashMap<String, String> params) throws Throwable;

}
