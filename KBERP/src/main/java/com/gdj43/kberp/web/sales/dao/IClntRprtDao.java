package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;

public interface IClntRprtDao {

	public double clntAvgCnt(HashMap<String, String> params) throws Throwable;

	public double ccAvgCnt(HashMap<String, String> params) throws Throwable;

}
