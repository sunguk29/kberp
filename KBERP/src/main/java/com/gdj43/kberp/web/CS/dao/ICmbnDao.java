package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

public interface ICmbnDao {

	public List<HashMap<String, String>> getGuide(HashMap<String, String> params) throws Throwable;

}
