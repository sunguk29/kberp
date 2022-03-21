package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;

public interface IClndrDao {

	public void clndrAdd(HashMap<String, String> params) throws Throwable;

	public void clndrUpdate(HashMap<String, String> params) throws Throwable;

	public void clndrDelete(HashMap<String, String> params) throws Throwable;

}
