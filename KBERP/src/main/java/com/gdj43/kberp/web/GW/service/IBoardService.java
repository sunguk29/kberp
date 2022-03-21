package com.gdj43.kberp.web.GW.service;

import java.util.HashMap;

public interface IBoardService {

	public void boardWrite(HashMap<String, String> params) throws Throwable;

	public int boardUpdate(HashMap<String, String> params)throws Throwable;

	public int boardDelete(HashMap<String, String> params)throws Throwable;
}
